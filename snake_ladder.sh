#!/bin/bash -x
echo "Welcome to Snake and ladder game "
read -p "Enter a username: " username
echo "Hello!! $username"
# constants
winning_pos=100
starting_pos=0

# function to roll the dice randomly
function Diceroll(){
		on_dice=$(( RANDOM % 6 + 1 ))
		echo $on_dice
		}



