#!/bin/bash -x
echo "Welcome to Snake and ladder game "
read -p "Enter a username: " username
echo "Hello!! $username"

# constants
winning_pos=100
#starting_pos=0
current_pos=0

# function to roll the dice randomly
function Diceroll(){
		on_dice=$(( RANDOM % 6 + 1 ))
		echo $on_dice
		(( dierollcount++ ))
		}

# function to choice the option between no play,ladder and snake.
function Tocheck_option(){
		while [[ $current_pos -ne  $winning_pos ]]
		do
			option=$(( RANDOM % 3 ))
			case $option in
				0)
					current_pos=$current_pos ;;  # 0 is for no play

				1) Diceroll
					current_pos=$(( $current_pos + $on_dice ))
					if [[ $current_pos -gt $winning_pos ]]
					then
						current_pos=$(( $current_pos - $on_dice ))
					fi
					;;

				2)Diceroll
					current_pos=$(( $current_pos - $on_dice ))
					if [[ $current_pos -lt 0 ]]
					then
						current_pos=0
					fi
					# Player pos will move behind by the num comes on diceroll
					;;
			esac
		done
		echo $current_pos
	}
echo $dierollcount


