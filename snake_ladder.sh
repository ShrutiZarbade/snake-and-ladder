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
		}
Diceroll
# function to choice the option between no play,ladder and snake.
function Tocheck_option(){
			option=$(( RANDOM % 3 ))
			echo $option
			case $option in
						0)
							current_pos=$current_pos ;;  # 0 is for no play

						1)
							current_pos=$(( $current_pos + $on_dice ));;
							# player position will move ahead by no comes in Diceroll

						2)
							current_pos=$(( $current_pos - $on_dice ));;
							# Player pos will move behind by the num comes on diceroll
			esac
			echo $current_pos
			}
Tocheck_option

