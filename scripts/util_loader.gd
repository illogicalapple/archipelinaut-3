class_name UtilLoader extends Node

static var cached_utils: Dictionary[StringName, Script] = {}

## A dictionary of all utilities added using this loader. Saved in the format: [codeblock]{"mod:util": some_utility}[/codeblock]
var utils: Dictionary[StringName, Utility] = {}

## Loads traits. Input: Array of Strings with the format: "[mod]:[trait]". Example: archipelinaut:plant
func _init(util_list: Array[StringName], target: Node) -> void:
	for util in util_list:
		utils[util] = _load_util(util)

func _load_util(util_name: StringName) -> Utility:
	var util_script: Script
	if cached_utils.has(util_name):
		util_script = cached_utils[util_name]
	else:
		assert(len(util_name.split(":")) == 2, "Improper util name. Example of a good one: 'archipelinaut:plant'")
		util_script = load("res://mods/%s/utils/%s.gd" % util_name.split(":"))
		cached_utils[util_name] = util_script
	
	return util_script.new()
