import cv2
import mediapipe as mp


#Initializing Media pipe model and drawing tools
mp_holistic = mp.solutions.holistic
mp_drawing = mp.solutions.drawing_utils
mp_drawing_styles = mp.solutions.drawing_styles

# Function to detect key points using mediapipe
def mediapipe_detection(image, model):
    image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
    image.flags.writeable = False
    results = model.process(image)
    image.flags.writeable = True
    image = cv2.cvtColor(image, cv2.COLOR_RGB2BGR)
    return image, results


# Function to draw landmarks of detected keypoints for visualization
def landmark_styling(image, results):
    # Pose keypoints
    mp_drawing.draw_landmarks(image, results.pose_landmarks, mp_holistic.POSE_CONNECTIONS,
                             landmark_drawing_spec=mp_drawing_styles.get_default_pose_landmarks_style()
                             )


def process_video(video):

    # Capturing Video
    cap = cv2.VideoCapture(video)

    # Getting video properties for output video
    frame_width = int(cap.get(3))
    frame_height = int(cap.get(4))
    fps = int(cap.get(5))

    frame_size = (frame_width,frame_height)#creating a tuple with video dimensions
    output = cv2.VideoWriter('assets/landmarkedVid.mp4', cv2.VideoWriter_fourcc(*'XVID'), fps, frame_size)#creating a video writer object with the same dimensions as the input video

    # Setting mediapipe model
    with mp_holistic.Holistic(min_detection_confidence=0.5, min_tracking_confidence=0.5) as holistic:
        while cap.isOpened():

            ret, frame = cap.read()
            #Break the loop if there are no frames.
            if not ret:
                break

            image, results = mediapipe_detection(frame, holistic)#detecting keypoints
            landmark_styling(image, results)#drawing keypoints

            #Writing annotated image to output video
            output.write(image)

        #closing video capture and video writer objects
        cap.release()
        output.release()
        cv2.destroyAllWindows()



# Save file for processing
path = "assets/userSubmission.mp4"
sequence = process_video(path)