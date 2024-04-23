from datetime import datetime

class ATM:
    def __init__(self, name, balance, update_datetime = datetime.now()):
        self.name = name
        self.balance = balance
        self.update_datetime = update_datetime
    def __str__(self):
        return f"This is {self.name}'s account. The balance: {self.balance} at {self.update_datetime}"
    
    def withdraw(self, money):
        self.update_datetime = datetime.now()
        self.balance -= money
        print(f"New balance: {self.balance}. At {self.update_datetime}")
    def deposit(self, money):
        self.update_datetime = datetime.now()
        self.balance += money
        print(f"New balance: {self.balance}. At {self.update_datetime}")
    
my_atm = ATM("Mark", 10000)
print(my_atm)
while True:
    cmd = input("Enter your command (W/D/S) : ") # 'W' for withdraw, 'D' for deposit, 'S' for summary
    if cmd == "S":
        print(my_atm)
    else:
        amount = int(input("Enter the amount: "))
        if cmd == "W":
            my_atm.withdraw(amount)
        elif cmd == "D":
            my_atm.deposit(amount)
        else:
            print("Error input, no transaction...")
    another = input("Do you want to do another transaction? (Y/N) ")
    if another == "Y": 
        pass
    else: 
        break

  
