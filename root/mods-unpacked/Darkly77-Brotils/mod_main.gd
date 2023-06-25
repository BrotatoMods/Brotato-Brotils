extends Node

const BROTILS_LOG = "Darkly77-Brotils"

func _init(modLoader = ModLoader):
	ModLoaderLog.info("Init", BROTILS_LOG)
	ModLoaderMod.install_script_extension("res://mods-unpacked/Darkly77-Brotils/extensions/singletons/utils.gd")

func _ready():
	ModLoaderLog.info("Ready", BROTILS_LOG)
