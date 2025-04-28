weather = float(input("What is the weather forecast for tomorrow? "))
rain = input("Will it rain? (yes/no): ")

print("Wear jeans and a T-shirt")

if weather <= 20:
    print("I recommend a jumper as well")

if weather <= 10:
    print("Take a jacket with you")

if weather <= 5:
    print("Make it a warm coat, actually")
    print("I think gloves are in order")

if rain == "yes":
    print("Don't forget your umbrella!")
