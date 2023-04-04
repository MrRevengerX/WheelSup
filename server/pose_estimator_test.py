import pytest
import pickle
import os.path
import numpy as np
from shoulder_press import calculate_pose_angle


def test_load_model():
    with open('shoulder_press.pkl', 'rb') as f:
        model = pickle.load(f)
    assert model is not None

# If result folder has files other than pattern.txt file, fail the test
def test_upload_file():
    assert len(os.listdir('result')) == 1
    assert os.path.isfile('result/pattern.txt')

# If the uploads folder has files other than upload_folder.txt file, fail the test
def test_result_file():
    assert len(os.listdir('uploads')) == 1
    assert os.path.isfile('uploads/upload_folder.txt')


# Unit test for calculate_pose_angle function

def test_calculate_pose_angle():
    # Test 1: Case where angle is less than 180 degrees
    start_point = [0.3, 0.5]
    mid_point = [0.3, 0.4]
    end_point = [0.4, 0.4]
    expected_output = 90.0
    assert np.isclose(calculate_pose_angle(start_point, mid_point, end_point), expected_output)
    
    # Test 2: Case where angle is exactly 180 degrees
    start_point = [0.2, 0.2]
    mid_point = [0.2, 0.3]
    end_point = [0.2, 0.4]
    expected_output = 180.0
    assert np.isclose(calculate_pose_angle(start_point, mid_point, end_point), expected_output)
    
    # Test 3: Case where angle is greater than 180 degrees
    start_point = [0.1, 0.5]
    mid_point = [0.2, 0.5]
    end_point = [0.3, 0.4]
    expected_output = 135.0
    assert np.isclose(calculate_pose_angle(start_point, mid_point, end_point), expected_output)








