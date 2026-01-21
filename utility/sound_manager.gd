# autoload no class. This Sound Mananger is for sounds that need to persist beyond lifetime of "emitter"
extends Node2D

@onready var coin_pickup_sfx: SoundEffectComponent = $CoinPickupSfx



func play_coin_pickup():
	coin_pickup_sfx.play()
