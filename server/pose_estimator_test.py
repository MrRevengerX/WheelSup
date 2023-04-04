import pytest
import pickle
import os.path


def test_load_model():
    with open('./server/shoulder_press.pkl', 'rb') as f:
        model = pickle.load(f)
    assert model is not None

# If result folder has files other than pattern.txt file, fail the test
def test_upload_file():
    assert len(os.listdir('./server/result')) == 1
    assert os.path.isfile('./server/result/pattern.txt')

# If the uploads folder has files other than upload_folder.txt file, fail the test
def test_result_file():
    assert len(os.listdir('./server/uploads')) == 1
    assert os.path.isfile('./server/uploads/upload_folder.txt')







