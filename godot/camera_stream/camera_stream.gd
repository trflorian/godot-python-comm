extends TextureRect

var server: UDPServer

func _ready() -> void:
	server = UDPServer.new()
	server.listen(4242)

func _decode_image(frame_data: PackedByteArray) -> Image:
	var image = Image.new()
	image.load_jpg_from_buffer(frame_data)
	return image

func _process(delta: float) -> void:
	server.poll()
	if server.is_connection_available():
		var peer = server.take_connection()
		var frame_data = peer.get_packet()
		var image = _decode_image(frame_data)
		texture = ImageTexture.create_from_image(image)
