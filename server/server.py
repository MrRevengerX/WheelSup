from flask import Flask, request, jsonify,send_file

app = Flask(__name__)

@app.route('/shoulder_press', methods=['POST'])
def shoulder_press():
    # Get the uploaded file
    file = request.files['file']

    # Save the file to disk
    filename = 'shoulder_press.mp4'
    file.save("uploads/",shoulder_press.mp4)


if __name__ == '__main__':
    app.run(debug=True)
