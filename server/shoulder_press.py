#!/usr/bin/env python
# coding: utf-8

#Import all the nessacary libraries to run the pose estimator

#Import mediapipe to be used for the model
import mediapipe as mp
#Import opencv for rendaring and drawing capabilities
import cv2

import numpy as np #Handle numpy arrays
import pandas as pd #Handle tabular data
import pickle #Save and oad ML model


#Import the model from the binary file
with open('shoulder_press.pkl', 'rb') as f:
    model = pickle.load(f)
    print("Model Loaded")

#Display the results of the prediction done by the model
draw_helpers = mp.solutions.drawing_utils 
holistic_model = mp.solutions.holistic

#Calculate angle between 3 landmark points
def calculate_pose_angle(start_point, mid_point, end_point):    
    max_angle = 180.0
    
    #[0] = x, [1] = y, [2] = z
    radians = np.arctan2(end_point[1] - mid_point[1], end_point[0] - mid_point[0]) - np.arctan2(start_point[1] - mid_point[1], start_point[0] - mid_point[0])
    #Convert to an angle
    angle = np.abs(radians * max_angle / np.pi)
    
    if angle > max_angle:
        angle = 360 - angle
        
    return angle 

#Display the results of the prediction done by the model
draw_helpers = mp.solutions.drawing_utils 
holistic_model = mp.solutions.holistic

#Get path of uploaded video
file_path = 'uploads/shoulder_press.mp4'
uploaded_video = cv2.VideoCapture(file_path)

#Get the video's frames per second 
fps = uploaded_video.get(cv2.CAP_PROP_FPS)

#Define the output video file name
output_file = 'result/output_shoulder_press.mp4'

# Define the frame size
frame_size = (int(uploaded_video.get(3)), int(uploaded_video.get(4)))

# Define the codec and create a VideoWriter object
fourcc = cv2.VideoWriter_fourcc(*'avc1')
out = cv2.VideoWriter(output_file, fourcc, fps, frame_size)   

down = None
counter = 0
rep_list = []
frame_list = []
status = None

#Load the holistic model
with holistic_model.Holistic(min_detection_confidence=0.5, min_tracking_confidence=0.5) as holistic:
    
    #Loop through each frame of the video 
    while uploaded_video.isOpened():
        #Returns the status of the read and the frame as an image
        ret, frame = uploaded_video.read()
        
        #If frame is read correctly, status is true
        if ret == False:
            print("Done")
            break
          
        #Recolor the captured frame from BGR to RGB (Medipipe requies frames to be in RGB format)
        rgb_frame = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        
        #Prevent writing and copying frame data to improve performance while making the detection
        rgb_frame.flags.writeable = False        
        
        #Use holistic model to make detections
        result_frame = holistic.process(rgb_frame)
        
        #Set frame back to writable format after detection
        rgb_frame.flags.writeable = True   
        
        #Recolor the captured frame from BGR for rendering with opencv
        bgr_frame = cv2.cvtColor(rgb_frame, cv2.COLOR_RGB2BGR)

        #Predict the coordinates of the landmarks (resulrs screen)
        try:
            pose_landmarks_array = result_frame.pose_landmarks.landmark
            
            # Filter out only the upper body landmarks
            upper_body_landmarks = [pose_landmarks_array[i] for i in [11, 12, 13, 14, 15, 16, 23, 24, 25, 26, 27, 28]]
            
            # Format the upper body landmarks into a numpy array for better structuring and collapse the array to 1 dimension
            pose_landmarks_nparray = list(np.array([[landmark.x, landmark.y, landmark.z, landmark.visibility] for landmark in upper_body_landmarks]).flatten() 
                              if result_frame.pose_landmarks else np.zeros(12*4))
            
            #Pass the numpy array into a data frame
            features = pd.DataFrame([pose_landmarks_nparray])
            
            #Store the top class of the prediction
            pose_class_status = model.predict(features.values)[0]
            #Store the probability of the prediction
            pose_class_status_prob = model.predict_proba(features.values)[0]              
            
            #Dictionary to store the coords in pixels of the landmarks
            points = {}
            for id, landmark in enumerate(result_frame.pose_landmarks.landmark):
                height, width, center = bgr_frame.shape
                cx, cy = int(landmark.x * width), int(landmark.y * height)
                points[id] = (cx, cy)

            cv2.circle(bgr_frame, points[12], 15, (255,0,0), cv2.FILLED)
            cv2.circle(bgr_frame, points[14], 15, (255,0,0), cv2.FILLED)
            cv2.circle(bgr_frame, points[16], 15, (255,0,0), cv2.FILLED)
            
            cv2.circle(bgr_frame, points[11], 15, (255,0,0), cv2.FILLED)
            cv2.circle(bgr_frame, points[13], 15, (255,0,0), cv2.FILLED)
            cv2.circle(bgr_frame, points[15], 15, (255,0,0), cv2.FILLED)            
        
            frame_list.append(str(pose_class_status))
            #For Right Arm
            if calculate_pose_angle(points[16], points[14], points[12]) >= 158: 
                down = True
            
            #For Left Arm
            elif calculate_pose_angle(points[15], points[13], points[11]) >= 158:
                down = True
       
            #For Right Arm
            if down and (calculate_pose_angle(points[16], points[14], points[12]) <= 90 or calculate_pose_angle(points[15], points[13], points[11]) <= 90): 
                down = False
                counter += 1
                rep_list.append(frame_list)
                frame_list = []
            
            #Set a rectangle box to display the results of the prediction in the video frame
            #rectangle(container, top_coord, bottom_coord, color, line_thickness)
            cv2.rectangle(bgr_frame, (0,0), (600, 60), (245, 117, 16), -1)
            
            #Display the class label inside the rectangle box
            cv2.putText(bgr_frame, 'Class'
                        , (10,12), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 0, 0), 1, cv2.LINE_AA)
            
            #Extract =and display the top class of the prediction
            cv2.putText(bgr_frame, pose_class_status.split(' ')[0]
                        , (10,40), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2, cv2.LINE_AA)
            
            #Display the class probability inside the rectangle box
            cv2.putText(bgr_frame, 'Probability'
                        , (250,12), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 0, 0), 1, cv2.LINE_AA)
            
            #Extract and dispthe maximum probability
            cv2.putText(bgr_frame, str(round(pose_class_status_prob[np.argmax(pose_class_status_prob)],2))
                        , (250,40), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2, cv2.LINE_AA)
            
            #Display the class probability inside the rectangle box
            cv2.putText(bgr_frame, 'Counter'
                        , (450,12), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 0, 0), 1, cv2.LINE_AA)
            
            #Extract and dispthe maximum probability
            cv2.putText(bgr_frame, str(counter)
                        , (450,40), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2, cv2.LINE_AA)
 
        except:
            pass

        # Write the processed frame to the output video
        out.write(bgr_frame)
        

        if cv2.waitKey(10) & 0xFF == ord('q'):
            break

reps = []
correct_num = 0
incorrect_num = 0

#Display the overall result of the exercise            
for i in range(counter):
    x_total = 0
    y_total = 0
    total = 0
    
    #Count the number of correct and incorrect frames in each rep
    for list in rep_list[i]:
        if str(list) == "Correct":
            x_total += 1
        elif str(list) == "Incorrect":
            y_total += 1

        total += 1
    
    avg = (x_total / total) * 100

    reps.append(i)
    reps.append(round(avg, 2))

    if (avg >= 70):
        feedback = "Correct"
        correct_num+=1
    else:
        feedback = "Incorrect"
        incorrect_num+=1

with open('./result/workout_details.txt', 'w') as f:
    # Write total number of reps, correct reps, and incorrect reps
    f.write(f"{counter}\n{correct_num}\n{correct_num}\n")

    # Write the percentage of correct reps for each rep
    for rep in reps:
        f.write(f"{rep}\n")

uploaded_video.release()
out.release()
cv2.destroyAllWindows()



