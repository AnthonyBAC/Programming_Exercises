from math import sqrt

value_a = float(input("Value of a: "))
value_b = float(input("Value of b: "))
value_c = float(input("Value of c: "))


x = (-value_b + sqrt(value_b**2-4*value_a*value_c)) / (2*value_a)
x_2 = (-value_b - sqrt(value_b**2-4*value_a*value_c)) / (2*value_a)

# z = value_a*x**2+value_b*x+value_c

print(f"The roots are {x} and {x_2}")