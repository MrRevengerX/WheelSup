import pytest
from flask import Flask

from server import create_app


@pytest.fixture
def app():
    app = create_app()
    yield app

@pytest.fixture
def client(app):
    with app.test_client() as client:
        yield client

def test_index(app, client):
    response = client.get('/')
    assert response.status_code == 404

def test_should_press_endpoint(app, client):
    # create a test video file and add it to a request
    with open("server/assets/user_upload.mp4", 'rb') as f:
        file = {'file': (f, 'user_upload.mp4')}
        response = client.post('/shoulder_press', data=file, content_type='multipart/form-data')
    
    # check that the response has the expected status code and format
    assert response.status_code == 200
    assert response.is_json
    assert 'workout_details' in response.json
    
    # check that the response contains expected details
    workout_details = response.json['workout_details']
    assert 'video' in workout_details
    assert 'total_reps' in workout_details
    assert 'correct_reps' in workout_details
    assert 'incorrect_reps' in workout_details
    assert 'rep_details' in workout_details