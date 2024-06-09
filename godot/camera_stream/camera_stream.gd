extends TextureRect

var server: UDPServer

var is_running: bool = true
var accept_connection_thread: Thread

var frame_data: PackedByteArray
var frame_mutex: Mutex = Mutex.new()

func _ready() -> void:
	server = UDPServer.new()
	server.listen(4242)
	
	accept_connection_thread = Thread.new()
	accept_connection_thread.start(_accept_connection_loop)

func _process(delta: float) -> void:
	frame_mutex.lock()
	if len(frame_data) > 0:
		var image = Image.new()
		image.load_jpg_from_buffer(frame_data)
		texture = ImageTexture.create_from_image(image)
	frame_mutex.unlock()

func _accept_connection_loop():
	while is_running:
		server.poll()
		if server.is_connection_available():
			var peer: PacketPeerUDP = server.take_connection()
			frame_mutex.lock()
			frame_data = peer.get_packet()
			frame_mutex.unlock()

func _exit_tree():
	is_running = false
	accept_connection_thread.wait_to_finish()
