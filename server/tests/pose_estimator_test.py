import numpy as np
import pytest
import pickle
import cv2
import os.path
from pose_estimator import calculate_pose_angle


def test_load_model():
    with open('shoulder_press.pkl', 'rb') as f:
        model = pickle.load(f)
    assert model is not None

def test_read_video_file():
    video_path = '../assets/user_upload.mp4'

    # Check if the video file exists
    assert os.path.exists(video_path)

    video_capture = cv2.VideoCapture(video_path)
    assert video_capture is not None
    video_capture.release()

def test_calculate_pose_angle_90_degree():
    start_point = [320, 240]  # Hand coordinates
    mid_point = [280, 180]  # Elbow coordinates
    end_point = [240, 120]  # Shoulder coordinates
    expected_angle = 90.0  # Expected angle of the bend of the arm
    
    angle = calculate_pose_angle(start_point, mid_point, end_point)
    
    assert np.isclose(angle, expected_angle, rtol=1e-6)

def test_calculate_pose_angle_0_degree():
    start_point = [320, 240]  # Hand coordinates
    mid_point = [320, 200]  # Elbow coordinates
    end_point = [320, 160]  # Shoulder coordinates
    expected_angle = 0.0  # Expected angle of the bend of the arm
    
    angle = calculate_pose_angle(start_point, mid_point, end_point)
    
    assert np.isclose(angle, expected_angle, rtol=1e-6)

def test_calculate_pose_angle_45_degree():
    start_point = [320, 240]  # Hand coordinates
    mid_point = [280, 220]  # Elbow coordinates
    end_point = [240, 200]  # Shoulder coordinates
    expected_angle = 45.0  # Expected angle of the bend of the arm
    
    angle = calculate_pose_angle(start_point, mid_point, end_point)
    
    assert np.isclose(angle, expected_angle, rtol=1e-6)

def test_calculate_pose_angle_135_degree():
    start_point = [320, 240]  # Hand coordinates
    mid_point = [280, 260]  # Elbow coordinates
    end_point = [240, 280]  # Shoulder coordinates
    expected_angle = 135.0  # Expected angle of the bend of the arm
    
    angle = calculate_pose_angle(start_point, mid_point, end_point)
    
    assert np.isclose(angle, expected_angle, rtol=1e-6)

def test_calculate_pose_angle_180_degree():
    start_point = [320, 240]  # Hand coordinates
    mid_point = [360, 240]  # Elbow coordinates
    end_point = [400, 240]  # Shoulder coordinates
    expected_angle = 180.0  # Expected angle of the bend of the arm
    
    angle = calculate_pose_angle(start_point, mid_point, end_point)
    
    assert np.isclose(angle, expected_angle, rtol=1e-6)





