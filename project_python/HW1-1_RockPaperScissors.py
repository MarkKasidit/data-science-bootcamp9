## Homework 
## Game: Rock paper scissors
import random
move = ["rock", "paper", "scissors"]
# print(random.choice(move))

def game():
  try:
    my_score = 0
    your_score = 0
    print("Welcome to the game!!")
    while True:
      if my_score == 3:
        print("You win the game!!!")
        break
      elif your_score == 3:
        print("You lose the game...")
        break
      else:
        my_move = input("Choose your move:")
        my_move_index = move.index(my_move)
        your_move = random.choice(move)
        print("Opponent's move:", your_move)
        your_move_index = move.index(your_move)
        if my_move_index == your_move_index:
          print("Draw")
          continue
        elif my_move_index > your_move_index and my_move_index - your_move_index == 1:
          print("You win!")
          my_score += 1
        else:
          print("You lose...")
          your_score += 1
  except:
    print("Error detected!")
    print("Please try again.")
game()
