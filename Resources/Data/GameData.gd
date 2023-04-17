extends Node

var tower_data = {
	"Turret_1": {
		"name": "Green Turret",
		"description": "Test turret 1 ID 0",
		"frequency": 5,
		"assetPath": "res://Assets/Images/TurretParts/turret_top_5.png",
		"id": 0,
		"range": 3,
		"rate_of_fire": 1.5,
		"damage": 8
	},
	"Turret_2": {
		"name": "Red Turret",
		"description": "Test turret 2 ID 1",
		"frequency": 3,
		"assetPath": "res://Assets/Images/TurretParts/turret_top_6.png",
		"id": 1,
		"range": 4,
		"rate_of_fire": 4.0,
		"damage": 3
	},
	"Turret_3": {
		"name": "Missile Turret",
		"description": "Test turret 3 ID 2",
		"frequency": 2,
		"assetPath": "res://Assets/Images/TurretParts/turret_top_3.png",
		"id": 2,
		"range": 6,
		"rate_of_fire": 0.33,
		"damage": 20
	}
}

var enemy_data = {
	"Enemy_1": {
		"health": 0.24,
		"speed": 1.0,
		"damage": 1
	},
	"Enemy_2": {
		"health": 0.3,
		"speed": 0.5,
		"damage": 1
	},
	"Enemy_3": {
		"health": 0.7,
		"speed": 0.4,
		"damage": 1
	},
	"Enemy_4": {
		"health": 0.7,
		"speed": 0.5,
		"damage": 1
	}
}

var wave_data = {
	"num_waves": 4,
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
					"time": 1.0
				},
				{
					"name": "Enemy_2",
					"time": 2.0
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
					"name": "Enemy_1",
					"time": 0.75
				},
				{
					"name": "Enemy_1",
					"time": 0.75
				},
				{
					"name": "Enemy_1",
					"time": 0.75
				},
				{
					"name": "Enemy_1",
					"time": 0.75
				},
				{
					"name": "Enemy_1",
					"time": 0.25
				},
				{
					"name": "Enemy_2",
					"time": 0.5
				},
				{
					"name": "Enemy_2",
					"time": 0.5
				}
			],
			"wave_size": 8
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
		},
		{
			"enemies": [
				{
					"name": "Enemy_2",
					"time": 0.66
				},
				{
					"name": "Enemy_2",
					"time": 0.66
				},
				{
					"name": "Enemy_2",
					"time": 0.66
				},
				{
					"name": "Enemy_2",
					"time": 0.66
				},
				{
					"name": "Enemy_2",
					"time": 0.66
				},
				{
					"name": "Enemy_2",
					"time": 0.66
				},
				{
					"name": "Enemy_3",
					"time": 2.0
				},
				{
					"name": "Enemy_3",
					"time": 0.75
				},
				{
					"name": "Enemy_3",
					"time": 0.75
				}
			],
			"wave_size": 9
		}
	]
}
