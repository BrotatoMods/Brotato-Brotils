extends Node

const BROTILS_LOG = "Darkly77-Brotils"

func _init(modLoader = ModLoader):
	ModLoaderUtils.log_info("Init", BROTILS_LOG)
	modLoader.install_script_extension("res://mods-unpacked/Darkly77-Brotils/extensions/singletons/utils.gd")

func _ready():
	ModLoaderUtils.log_info("Ready", BROTILS_LOG)
