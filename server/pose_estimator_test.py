import pytest
import pickle
import os.path


def test_load_model():
    with open('./server/shoulder_press.pkl', 'rb') as f:
        model = pickle.load(f)
    assert model is not None

# If uploads folder is not empty, fail the test
def test_read_video_file():
    assert len(os.listdir('./server/uploads')) == 0

# If the result folder is not empty, fail the test
def test_write_video_file():
    assert len(os.listdir('./server/result')) == 0






