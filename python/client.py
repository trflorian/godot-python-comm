import socket

ip = "127.0.0.1"
port = 4242

client_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
client_socket.settimeout(1)

client_socket.sendto("Hello from Python!".encode(), (ip, port))

data, (recv_ip, recv_port) = client_socket.recvfrom(1024)
print(f"Received: '{data.decode()}' {recv_ip}:{recv_port}")
