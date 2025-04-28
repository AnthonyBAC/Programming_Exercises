temperature = float(input("Please type in a temperature (F): "))
fToC = (temperature - 32) * 5/9

print(f"{temperature} degrees Fahrenheit equals {fToC} degrees Celsius")
if fToC < 0:
    print("Brr! It's cold in here!")