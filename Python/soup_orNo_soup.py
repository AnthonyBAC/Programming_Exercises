name = input("Please tell me your name:")
name = name.title()

if name == "Jerry":
    print("Next please!")
else:
    portions_price = 5.90
    portions_soup = int(input("How many portions of soup? "))
    total_cost = portions_price * portions_soup
    print(f"The total cost is {total_cost}")
    print("Next please!")