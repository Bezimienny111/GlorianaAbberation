# For the Glory Decisions Scripting Tutorial
# By MichaelM

# Decisions are similar to events in many respects.
# The primary difference, of course, is that a country can choose when to enact a decision rather than waiting for RNG to pop a specific event.
# And because there is already an option to not enact a particular decision, only one action is allowed. A pair of mutually exclusive
# decisions could, of course, be created using a flag system.

## Sample decision ##
decision = {
	id = 100		# The ID of a decision must be unique only among decisions. Events and decisions do NOT share ID-space.

	major = no		# If major = yes and if the potential trigger is satisfied for the player's country, a player notifier will appear.
				# Major decisions will also appear in a different color in the decision list UI.

	persistent = yes	# If persistent = yes, the decision will not be saved into the country's decision history when enacted. Thus,
				# it may be necessary to use a flag mechanism to prevent it from being immediately enacted again, especially for AI.

	unique = yes		# If unique = yes, the decision may only be taken one time globally and will then be unavailable for all countries.

	name = "Test decision"	# As with events, names and descs may be localized
	desc = "Test decision"
	
	potential = {		# if satisfied, the decision will appear in the player's potential decision list
		# all triggers are valid here
	}
	trigger = {		# if both potential and trigger are satisfied (and the decision hasn't already been enacted or is persistent), the decision may be immediately enacted.
	}
	ai_trigger = {		# The ai_trigger is an additional trigger that must be satisfied before the AI will enact the decision.
				# However, the AI is not guaranteed to enact a decision the moment it becomes available.
	}

	action = {		# only one action is permitted
		command = { type = treasury value = 100 }	# All event commands are valid, even though some may not make sense.
		command = { type = revolt which = -1 }		# Randomized commands will not be resolved until execution. They will be displayed in the player window as e.g. "a random province" or "a random elector".
	}
}


## Scenario files ##
# It is possible to specify in scenario files that certain decisions have already been made. The syntax is:
decisionhistory = {
	unique = { 1000 }
	ENG = { 100 101 102 }
	FRA = { 100 104 }
}

# That is, a country tag followed by a list of decisions. The country will be unable to take any such decision again in the game, unless it is persistent.

# To check whether a decision has been made by this country, use the "decision = <id>" trigger. If the decision is unique, this trigger will also check whether any country has made the decision.
# To check whether a decision has been made by a specific country (even if unique), use the "decision = { country = <tag> data = <id> }" trigger. <tag> supports the use of -1/this, -2/overlord, and -6/emperor.
