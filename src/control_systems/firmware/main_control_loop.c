/*
 * IX-Sho-Nuff Main Control Loop Firmware
 * Version: 1.0
 * Author: Bryce Wooster
 * Description: Core firmware loop for Tesla coil, Triostrut, and Gankyil phase control using Teensy 4.1 MCU.
 * License: IX-Sho-Nuff License Agreement (Version 1.0)
 */

#include <Arduino.h>

// PWM output pins
#define TRI_COIL_A 2
#define TRI_COIL_B 3
#define TRI_COIL_C 4
#define GANKYIL_A 5
#define GANKYIL_B 6
#define GANKYIL_C 7

// Sensor input pins
#define EM_SENSOR A0
#define VIB_SENSOR A1
#define TEMP_SENSOR A2

// Cryo pump control pin
#define CRYO_PUMP A21  // DAC pin

// System Parameters
#define PWM_FREQ 25000  // 25 kHz starting value
#define PHASE_STEP 0.5  // Degrees per loop step

// PID parameters
float Kp = 0.1;
float Ki = 0.05;
float Kd = 0.01;

// System state
float phase_target = 120.0;
float em_field_value = 0.0;
float vib_value = 0.0;
float temp_value = 0.0;

// Basic PID controller variables
float error_sum = 0;
float last_error = 0;

void setup() {
  Serial.begin(115200);

  // Setup PWM outputs
  pinMode(TRI_COIL_A, OUTPUT);
  pinMode(TRI_COIL_B, OUTPUT);
  pinMode(TRI_COIL_C, OUTPUT);
  pinMode(GANKYIL_A, OUTPUT);
  pinMode(GANKYIL_B, OUTPUT);
  pinMode(GANKYIL_C, OUTPUT);

  analogWriteFrequency(TRI_COIL_A, PWM_FREQ);
  analogWriteFrequency(TRI_COIL_B, PWM_FREQ);
  analogWriteFrequency(TRI_COIL_C, PWM_FREQ);
  analogWriteFrequency(GANKYIL_A, PWM_FREQ);
  analogWriteFrequency(GANKYIL_B, PWM_FREQ);
  analogWriteFrequency(GANKYIL_C, PWM_FREQ);

  // Setup sensors
  analogReadResolution(12);

  // Cryo pump control
  analogWrite(CRYO_PUMP, 0);
}

void loop() {
  // Read sensors
  em_field_value = analogRead(EM_SENSOR);
  vib_value = analogRead(VIB_SENSOR);
  temp_value = analogRead(TEMP_SENSOR);

  // Basic PID loop on vibration
  float error = phase_target - vib_value;
  error_sum += error;
  float d_error = error - last_error;
  last_error = error;

  float correction = (Kp * error) + (Ki * error_sum) + (Kd * d_error);

  // Apply correction via PWM phase adjustments
  adjustCoilPhases(correction);

  // Cryo pump regulation
  controlCryoPump(temp_value);

  // Debug output
  Serial.printf("EM: %f, VIB: %f, TEMP: %f\n", em_field_value, vib_value, temp_value);

  delay(10); // Loop delay for stability
}

void adjustCoilPhases(float correction) {
  // Simplified: Adjust PWM duty cycle directly proportional to correction
  int duty = constrain(128 + (int)(correction * 10), 0, 255);

  analogWrite(TRI_COIL_A, duty);
  analogWrite(TRI_COIL_B, duty);
  analogWrite(TRI_COIL_C, duty);
  analogWrite(GANKYIL_A, duty);
  analogWrite(GANKYIL_B, duty);
  analogWrite(GANKYIL_C, duty);
}

void controlCryoPump(float temp_reading) {
  // Simple proportional control for demonstration
  float set_point = 100.0;  // Placeholder value for sub-K range mapping
  float pump_output = constrain((set_point - temp_reading) * 2, 0, 255);

  analogWrite(CRYO_PUMP, pump_output);
}
