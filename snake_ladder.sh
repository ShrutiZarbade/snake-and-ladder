#!/bin/bash -x
echo "Welcome to Snake and ladder game "
read -p "Enter a username: " username
echo "Hello!! $username"

# constants
winning_pos=100
starting_pos=0
#current_pos=0

#variables
player1_pos=$starting_pos
player2_pos=$starting_pos
checkplayer=1

# function to roll the dice randomly
function Diceroll(){
		on_dice=$(( RANDOM % 6 + 1 ))
		echo $on_dice
		(( dierollcount++ ))
		}

# function to choice the option between no play,ladder and snake.
function Tocheck_option()
	{
		option=$(( RANDOM % 3 ))
		echo $option
		case $option in
				0)
					if [[ $checkplayer -eq 1 ]]
					then
				  		player1_pos=$player1_pos
						echo player1_position is $player1_pos
					else
				      player2_pos=$player2_pos
						echo player2_position is $player2_pos
					fi
					;;

				1) Diceroll
					if [[ $checkplayer -eq 1 ]]
					then
						player1_pos=$(( $player1_pos + $on_dice ))
						if [[ $player1_pos -gt $winning_pos ]]
						then
							player1_pos=$(( $player1_pos - $on_dice ))
						fi
						echo player1_position is $player1_pos
					else
						player2_pos=$(( $player2_pos + $on_dice ))
						if [[ $player2_pos -gt $winning_pos ]]
                  then
                     player2_pos=$(( $player2_pos - $on_dice ))
                  fi
                  echo player2_position is $player2_pos
            	fi
					;;

				2)Diceroll
					if [[ $checkplayer -eq 1 ]]
					then
						player1_pos=$(( $player1_pos - $on_dice ))
						if [[ $player1_pos -lt $starting_pos ]]
						then
							player1_pos=$starting_pos
						fi
						echo player1_position is $player1_pos
					else
						 player2_pos=$(( $player2_pos - $on_dice ))
                  if [[ $player2_pos -lt $starting_pos ]]
                  then
                     player2_pos=$starting_pos
                  fi
						echo player2_position is $player2_pos
					fi
					;;
			esac
	}

function player1()
{
	echo "player1 turn"
	Diceroll
	Tocheck_option
}

function player2()
{
	echo "player2 turn"
	Diceroll
	Tocheck_option
}

function game(){
	while [[ $player1_pos -ne $winning_pos && $player2_pos -ne $winning_pos ]]
	do
		if [[ $checkplayer -eq 1 ]]
		then
			player1
			checkplayer=2
		elif [[ $checkplayer -eq 2 ]]
		then
			player2
			checkplayer=1
		fi
	done
}
game

echo $dierollcount 
if [[ $checkplayer -eq 1 ]]
then
	echo Player 2 won
else
	echo Player 1 won
fi
