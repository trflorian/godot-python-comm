# Godot + Python Communication with UDP

This project is a simple demonstration of how a python application can communicate with a Godot game using UDP. This communication channel can for example be used to send encoded image frames from a webcam.

![camera_stream_demo_processing](https://github.com/trflorian/godot-python-comm/assets/27728267/62de3c6c-f9a2-4986-9114-9abb37b6a4c8)

## ⚡ Quickstart

### Greeting
1. Open the Godot project in the `godot/` directory and run the game scene `greeting/greeting.tscn`.
2. Run the `greeting.py` script in `python/`.

### Camera Stream
1. Open the Godot project in the `godot/` directory and run the game scene `camera_stream/camera_stream.tscn`.
2. Install the python requirements for in the `python/` directory by running `pip install -r requirements.txt` from that directory or using `uv sync`.
3. From the same folder you can then run the `camera_stream.py` script.

## Greeting Demo

![image](https://github.com/trflorian/godot-python-comm/assets/27728267/ee1576fe-00e3-4d16-b8e4-39df8ae911ad)
![image](https://github.com/trflorian/godot-python-comm/assets/27728267/6557e6e0-6f8a-4df4-9a1e-36d55d4efa4a)


## 🗞️ Guide

### Greeting
https://medium.com/@flip.flo.games/godot-python-3e3f98860e2f

### Camera Stream
https://medium.com/@flip.flo.games/godot-python-camera-stream-1866cfb9941f

## 🖥️ Versions
- Godot 4.4.1
- Python 3.13
