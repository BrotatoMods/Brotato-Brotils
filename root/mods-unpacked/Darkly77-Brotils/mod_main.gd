extends Node

const LOG_NAME = "Darkly77-Brotils"

func _init(modLoader = ModLoader):
	ModLoaderUtils.log_info("Init", LOG_NAME)
	modLoader.install_script_extension("res://mods-unpacked/Darkly77-Brotils/extensions/singletons/utils.gd")

func _ready():
	ModLoaderUtils.log_info("Ready", LOG_NAME)
