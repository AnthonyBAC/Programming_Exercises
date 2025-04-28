number_1 = int(input("Number 1: "))
number_2 = int(input("Number 2: "))
operation = input("Enter an operation: ")
operation = operation.lower()

add = number_1 + number_2
subtract = number_1 - number_2
multiply = number_1 * number_2

if operation == 'add':
    print(f"{number_1} + {number_2} = {add}")
elif operation == 'subtract':
    print(f"{number_1} - {number_2} = {subtract}")
elif operation == 'multiply':
    print(f"{number_1} * {number_2} = {multiply}")