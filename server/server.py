from flask import Flask, request, jsonify,send_file
import os

app = Flask(__name__)

@app.route('/shoulder_press', methods=['POST'])
def shoulder_press():
    # Get the uploaded file
    file = request.files['file']

    # Save the file to disk
    filename = 'user_upload.mp4'
    file.save("uploads/",filename)

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

if __name__ == '__main__':
    app.run(debug=True)
