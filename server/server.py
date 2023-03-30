import subprocess
import cv2
from flask import Flask, request, jsonify,send_file
import os
from flask_cors import CORS
import numpy as np

app = Flask(__name__)
CORS(app)

#cors = CORS(app, origins=["http://localhost:*"])

@app.route('/api', methods=['POST'])
def upload_video():
    video_file = request.files['video']
    video_bytes = video_file.read()
    video_np = np.frombuffer(video_bytes, dtype=np.uint8)
    video = cv2.imdecode(video_np, cv2.IMREAD_UNCHANGED)

    os.chdir(os.path.join(os.getcwd(), ".."))

    file_path = os.path.join(os.getcwd(), 'client', 'WheelSup App', 'assets', 'uploads', 'user_upload.mp4')

    # Save the decoded video stream to a file
    with open(file_path, 'wb') as f:
        f.write(video_bytes)
    

    os.chdir(os.path.join(os.getcwd(), "server"))

    # Pass the video file name to the second Python script as a command-line argument
    subprocess.run(['python', 'pose_estimator.py', 'user_upload.mp4'])

    return 'Success'
    
    # Process the video as needed
    

@app.route('/upload', methods=['POST'])
def upload_test():
    if 'file' not in request.files:
        return 'No file uploaded', 400

    file = request.files['file']
    if file.filename == '':
        return 'No file selected', 400

    if file:
        filename = file.filename
        file.save(filename)
        # do any further processing with the file here
        return 'File uploaded successfully', 200


@app.route('/shoulder_press', methods=['POST'])
def shoulder_press():
    # Get the uploaded file
    file = request.files['file']

    # Save the file to disk
    filename = 'user_upload.mp4'
    file.save(filename)

    # Run the pose estimator script
    os.system('python pose_estimator.py')


    # Read the contents of result details file
    with open('./result/workout_details.txt', 'r') as f:
        details = f.readlines()

    #Extract details from the file and store them in a dictionary (to use in the JSON response)
    workout_details = {
        'video': f'http://localhost:5000/video/processed/shoulder_press.mp4',
        'total_reps': int(details[0]),
        'correct_reps': int(details[1]),
        'incorrect_reps': int(details[2]),
        'rep_details': {}
    }

    for i in range(3, len(details), 2):
        rep_num = int(details[i])
        correct_percentage = float(details[i+1])
        workout_details['rep_details'][str(rep_num)] = correct_percentage

    # Return a JSON response
    response = jsonify({'workout_details': workout_details})
    return response


@app.route('/video/processed/<filename>')
def processed_video(filename):
    # Return the processed video file
    return send_file('result/', filename)


@app.route('/', methods=['GET'])
def get_request_test():
    #Read the contents of result details file
    with open('result/workout_details.txt', 'r') as f:
        details = f.readlines()

    workout_details = {
        'video': f'http://localhost:5000/video/processed/shoulder_press.mp4',
        'total_reps': int(details[0]),
        'correct_reps': int(details[1]),
        'incorrect_reps': int(details[2]),
        'rep_details': {}
    }

    for i in range(3, len(details), 2):
        rep_num = int(details[i])
        correct_percentage = float(details[i+1])
        workout_details['rep_details'][str(rep_num)] = correct_percentage

    # # Return a JSON response
    response = jsonify(workout_details)

    return response

if __name__ == '__main__':
    app.run(debug=True)
