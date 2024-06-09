import socket
import cv2
from constants import SERVER_IP, SERVER_PORT

client_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

cap = cv2.VideoCapture(0)

while True:
    ret, frame = cap.read()

    if not ret:
        print("Error: failed to capture image")
        break

    frame = cv2.resize(frame, (400, 300))
    frame = cv2.flip(frame, 1)

    cv2.putText(
        frame,
        f"OpenCV version: {cv2.__version__}",
        (5, 15),
        cv2.FONT_HERSHEY_SIMPLEX,
        0.5,
        (255, 255, 255),
        1,
    )

    _, encoded_frame = cv2.imencode(".jpg", frame)

    if len(encoded_frame) <= 65507:
        client_socket.sendto(encoded_frame, (SERVER_IP, SERVER_PORT))
    else:
        print("Frame too large, skipping")

    cv2.imshow("frame", frame)

    if cv2.waitKey(1) & 0xFF == ord("q"):
        break

cv2.destroyAllWindows()

cap.release()
