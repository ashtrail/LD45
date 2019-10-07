extends Node

var respawn_position: Vector2
var number_of_memory_found: int = 0

var ghost_sounds =  [
	preload("res://musics&sounds/Bruitages/Fantômes/Br-Fantome-001.ogg"),
	preload("res://musics&sounds/Bruitages/Fantômes/Br-Fantome-002.ogg"),
	preload("res://musics&sounds/Bruitages/Fantômes/Br-Fantome-003.ogg"),
	preload("res://musics&sounds/Bruitages/Fantômes/Br-Fantome-004.ogg"),
	preload("res://musics&sounds/Bruitages/Fantômes/Br-Fantome-005.ogg"),
	preload("res://musics&sounds/Bruitages/Fantômes/Br-Fantome-006.ogg"),
	preload("res://musics&sounds/Bruitages/Fantômes/Br-Fantome-007.ogg"),
	preload("res://musics&sounds/Bruitages/Fantômes/Br-Fantome-008.ogg"),
	preload("res://musics&sounds/Bruitages/Fantômes/Br-Fantome-009.ogg"),
	preload("res://musics&sounds/Bruitages/Fantômes/Br-Fantome-010.ogg"),
]

var karma : int = 0
var memories_found := [] # array of memory indexes

var memories = {
	1: {
		"text": [ "Billy has a rough childhood.\n His father is abusive and often beats him.", "One day he can't take it anymore, \nhe steals his parents money and runs away leaving his mother behind."],
		"karma": 0
	},
	2: {
		"text": ["Homeless, alone, Billy ends up joining a gang.", "They're a bit like a second family to him.\n However his day to day life is getting increasingly violent.", "One day in a shootout, one of his stray bullets kills a passerby."],
		"karma": -1
	},
	3: {
		"text": ["As his life seems spiralling into more and more violence, Billy meets a girl.", "They fall in love.\nHe decides to stop his criminal activities,\nthey move and he gets a stable office job."],
		"karma": 1
	},
	4: {
		"text": ["Billy's office job is slow and dull torture.\nHis peaceful and monotonous life is making him jittery.", "When his girlfriend shows him a positive pregnancy test he snaps.", "Terrified at the idea of ending up like his father,\nhe flees to another state without her."],
		"karma": -1
	},
	5: {
		"text": ["Several months have passed since Billy's escapade.\nAs days go by he can't stop thinking about his girlfriend and their child.", "When he comes back, ready to face his responsibilities,\nhe learns his girlfriend has committed suicide after sinking into a deep depression and their daughter is gone, adopted."],
		"karma": 0
	},
	6: {
		"text": ["Haunted by his girlfriend's suicide,\nBilly looked for his daughter everywhere but she's nowhere to be found.", "He decides to settle for the next best thing and gets a job in an orphanage, taking care of other abandoned kids."],
		"karma": 1
	},
	7: {
		"text": ["It's been decades since Billy's worked for the orphanage,\nhe's become its director now", "He's helped many kids avoid taking the same tormented path in life he did.", "One day, as he's thinking of what his daughter might me doing in life now, like he often does, he's struck by a fatal heart attack."],
		"karma": 0
	}
}

func add_memory(memory_index):
	var memory = memories[memory_index]
	karma += memory.karma
	memories_found.append(memory_index)

func number_of_memory_found():
	return memories_found.size()

func get_memory_text(memory_index):
	return memories[memory_index].text
