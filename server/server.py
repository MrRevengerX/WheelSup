import subprocess
import cv2
from flask import Flask, request, jsonify,send_file
import os
from flask_cors import CORS
import numpy as np

app = Flask(__name__)
CORS(app)

#cors = CORS(app, origins=["http://localhost:*"])

@app.route('/shoulder_press', methods=['POST'])
def upload_video():
    video_file = request.files['video']
    video_bytes = video_file.read()
    video_np = np.frombuffer(video_bytes, dtype=np.uint8)
    video = cv2.imdecode(video_np, cv2.IMREAD_UNCHANGED)

    # os.chdir(os.path.join(os.getcwd(), ".."))

    # file_path = os.path.join(os.getcwd(), 'client', 'WheelSup App', 'assets', 'uploads', 'shoulder_press.mp4')
    file_path = 'uploads/shoulder_press.mp4'

    # Save the decoded video stream to a file
    with open(file_path, 'wb') as f:
        f.write(video_bytes)

    # os.chdir(os.path.join(os.getcwd(), "server"))

    # Pass the video file name to the second Python script as a command-line argument
    subprocess.run(['python', 'shoulder_press.py'])

    return 'Success'

@app.route('/video')
def serve_video():
    video_file = 'processed/output_shoulder_press.mp4'
    return send_file(video_file, mimetype='video/mp4')
 

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
