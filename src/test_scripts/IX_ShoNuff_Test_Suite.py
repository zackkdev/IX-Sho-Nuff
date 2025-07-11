"""
IX-Sho-Nuff Test Suite
Author: Bryce Wooster
Date: 2025-07-11

Simulates coil driver responses and piezo feedback loops.
Validates control signal behavior under varying piezo inputs.
"""

import unittest
import random

# Mock function simulating piezo sensor reading fluctuations
def simulate_piezo_input():
    base = 2048  # Midpoint value for 12-bit sensor
    noise = random.randint(-100, 100)
    return max(0, min(4095, base + noise))

# Mock controller class to simulate feedback control logic
class MockFeedbackController:
    def __init__(self):
        self.control_value = 128  # Midpoint 8-bit control

    def update(self, piezo_input):
        if piezo_input > 2048:
            self.control_value = min(255, self.control_value + 1)
        elif piezo_input < 2048:
            self.control_value = max(0, self.control_value - 1)
        return self.control_value

class TestIXShoNuffController(unittest.TestCase):
    def test_control_stability(self):
        controller = MockFeedbackController()
        for _ in range(1000):
            piezo_val = simulate_piezo_input()
            control = controller.update(piezo_val)
            self.assertTrue(0 <= control <= 255, "Control output out of bounds")

    def test_response_to_high_input(self):
        controller = MockFeedbackController()
        control_before = controller.control_value
        control_after = controller.update(3000)  # High piezo input
        self.assertGreater(control_after, control_before, "Control did not increase on high input")

    def test_response_to_low_input(self):
        controller = MockFeedbackController()
        control_before = controller.control_value
        control_after = controller.update(1000)  # Low piezo input
        self.assertLess(control_after, control_before, "Control did not decrease on low input")

if __name__ == "__main__":
    unittest.main()
