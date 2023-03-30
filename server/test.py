import cv2
import sys

if __name__ == '__main__':
    # Get the video file name from the command-line arguments
    video_file = sys.argv[1]

    # Read the video file using OpenCV
    # sample_video = cv2.VideoCapture('assets/user_upload.mp4')
    sample_video = cv2.VideoCapture(video_file)

    # Process the video here...
    while True:
        ret, frame = sample_video.read()
        if not ret:
            break

        # Do something with each frame of the video
        # For example, you can display the frames using OpenCV
        cv2.imshow('frame', frame)
        if cv2.waitKey(1) == ord('q'):
            break

    # Release the video file and close the OpenCV window
    sample_video.release()
    cv2.destroyAllWindows()