from flask import Flask, request, jsonify,send_file, abort
from werkzeug.utils import secure_filename
import os

def create_app():
    app = Flask(__name__)

    @app.route('/', methods=['GET'])
    def api_directory():
        abort(404, description='API directory not found')
        return jsonify({'message': 'API directory not found'}), 404


    @app.route('/shoulder_press', methods=['POST'])
    def shoulder_press():
        # Get the uploaded file
        file = request.files['file']

        allowed_file = {'mp4', 'png', 'jpg', 'jpeg', 'gif'}

        if 'file' not in request.files:
            abort(400, 'No file part')
        file = request.files['file']
        if file.filename == '':
            abort(400, 'No selected file')
        if file and allowed_file(file.filename):
            filename = secure_filename(file.filename)
            os.makedirs("uploads/", exist_ok=True)  # create directory if it doesn't exist
            file.save("uploads/" + filename)
            
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
        else:
            abort(400, 'File type not allowed')

        

    @app.route('/video/processed/<filename>')
    def processed_video(filename):
        # Return the processed video file
        return send_file('result/', filename)
    
    return app

if __name__ == '__main__':
    app = create_app()
    app.run(debug=True)
