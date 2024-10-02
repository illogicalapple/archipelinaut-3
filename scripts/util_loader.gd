class_name UtilLoader extends Node

static var cached_utils: Dictionary[StringName, Script] = {}

## A dictionary of all utilities added using this loader. Saved in the format: [codeblock]{"mod:util": some_utility}[/codeblock]
var utils: Dictionary[StringName, Utility] = {}

## Loads utilities. Input: Array of Strings with the format: "[mod]:[util]". Example: epic_mod:cool_utility
func _init(util_list: Array[StringName], target: Node) -> void:
	for util in util_list:
		var mod_node = Utility.new(target)
		mod_node.name = util
		mod_node.set_script(_load_util(util, target))
		target.add_child(mod_node)
		utils[util] = mod_node

func _load_util(util_name: StringName, target: Node) -> Script:
	var util_script: Script
	if cached_utils.has(util_name):
		util_script = cached_utils[util_name]
	else:
		assert(len(util_name.split(":")) == 2, "Improper util name. Example of a good one: 'epic_mod:cool_utility'")
		util_script = load("res://mods/%s/utils/%s.gd" % Array(util_name.split(":")))
		cached_utils[util_name] = util_script
	
	return util_script
