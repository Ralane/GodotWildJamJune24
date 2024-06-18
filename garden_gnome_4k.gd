extends RigidBody3D

@onready var impactSound = $ImpactSound;

func _on_body_entered(body):
	if(!OS.has_feature("mobile") and !OS.has_feature("web_android") and !OS.has_feature("web_ios")): # Avoid playing on mobile due to audio crackling
		if(!impactSound.playing):
			if(body != null and "linear_velocity" in body):
				impactSound.volume_db = -20 + absf(linear_velocity.length() - body.linear_velocity.length());
			else:
				impactSound.volume_db = -30 + absf(linear_velocity.length());
			impactSound.play();


func _on_body_exited(body):
	if(!OS.has_feature("mobile") and !OS.has_feature("web_android") and !OS.has_feature("web_ios")): # Avoid playing on mobile due to audio crackling
		if(!impactSound.playing):
			if(body != null and "linear_velocity" in body):
				impactSound.volume_db = -20 + absf(linear_velocity.length() - body.linear_velocity.length());
			else:
				impactSound.volume_db = -30 + absf(linear_velocity.length());
			impactSound.play();

