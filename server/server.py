import subprocess
from flask import Flask, request, jsonify,send_file
import os
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.route('/shoulder_press', methods=['POST'])
def upload_video():
    video_file = request.files['video']
    video_bytes = video_file.read()

    file_path = 'uploads/shoulder_press.mp4'

    #Save the decoded video stream to a file
    with open(file_path, 'wb') as f:
        f.write(video_bytes)

    #Run the shoulder_press.py as a sub process
    subprocess.run(['python', 'shoulder_press.py'])

    return 'Success', 200

@app.route('/processed')
def send_video():
    input_file = 'result/output_shoulder_press.mp4'
    return send_file(input_file, mimetype='video/mp4', as_attachment=False, conditional=False)

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

@app.route('/results', methods=['GET'])
def get_request_test():
    #Read the contents of result details file
    with open('result/workout_details.txt', 'r') as f:
        details = f.readlines()

    workout_details = {
        'video': f'http://localhost:5000/processed',
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


#api end point for deleting all files in uploads folder & result folder
@app.route('/cleanup', methods=['DELETE'])
def delete_files():
    #Delete all files in uploads folder
    for file in os.listdir('uploads'):
        os.remove(os.path.join('uploads', file))

    #Delete all files in result folder
    for file in os.listdir('result'):
        os.remove(os.path.join('result', file))

    return 'Files deleted successfully', 200

if __name__ == '__main__':
    app.run()
