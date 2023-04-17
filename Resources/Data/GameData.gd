extends Node

var tower_data = {
	"Turret_1": {
		"name": "Green Turret",
		"description": "Test turret 1 ID 0",
		"assetPath": "res://Assets/Images/TurretParts/turret_top_5.png",
		"id": 0,
		"range": 3,
		"rate_of_fire": 3.0,
		"damage": 25
	},
	"Turret_2": {
		"name": "Red Turret",
		"description": "Test turret 2 ID 1",
		"assetPath": "res://Assets/Images/TurretParts/turret_top_6.png",
		"id": 1,
		"range": 6,
		"rate_of_fire": 4.0,
		"damage": 40
	},
	"Turret_3": {
		"name": "Missile Turret",
		"description": "Test turret 3 ID 2",
		"assetPath": "res://Assets/Images/TurretParts/turret_top_3.png",
		"id": 2,
		"range": 9,
		"rate_of_fire": 1.5,
		"damage": 60
	}
}

var wave_data = {
	"num_waves": 2,
	"waves": [
		{
			"enemies": [
				{
					"name": "Enemy_1",
					"time": 0.1
				},
				{
					"name": "Enemy_1",
					"time": 1.5
				},
				{
					"name": "Enemy_1",
					"time": 2.0
				},
				{
					"name": "Enemy_2",
					"time": 3.0
				}
			],
			"wave_size": 4
		},
		{
			"enemies": [
				{
					"name": "Enemy_1",
					"time": 0.1
				},
				{
					"name": "Enemy_2",
					"time": 0.7
				},
				{
					"name": "Enemy_1",
					"time": 2.0
				},
				{
					"name": "Enemy_2",
					"time": 0.7
				}
			],
			"wave_size": 4
		}
	]
}
