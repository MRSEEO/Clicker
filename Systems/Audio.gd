extends Control

onready var music = $music
onready var sound = $sound

var path = "res://media/music/"
var list_music = []
var row = 0

var playing_now : String

func define_music(path):
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				#print("Директория: " + file_name)
				pass
			else:
				pass
				#print("Файл: " + file_name)
				
			if ".mp3" in file_name and file_name.ends_with(".import") == false:
				list_music.push_back(path+file_name)
				
			file_name = dir.get_next()
			#print(list_music)
	else:
		print("Ошибка доступа к файлам.")


func play_music(files : Array):
	var list_size = files.size()
	
	if !music.playing and row < list_size:
		music.set_stream(load(files[row]))
			
		music.play()
		playing_now = files[row].trim_suffix(".mp3")
		playing_now = playing_now.trim_prefix(path)
		print("track: "+str(files[row])+" number in a row: "+str(row))
		
		row += 1
	if row >= list_size:
		row = 0

func stop_music():
	music.playing = false

func _on_music_finished():
	play_music(list_music)





func play_sound(file : String):
	sound.set_stream(load(file))
	
	sound.play()


func _ready():
	define_music(path)
	play_music(list_music)


