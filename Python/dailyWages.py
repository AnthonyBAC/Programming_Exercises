hourly_wage = float(input("Hourly wage: "))
hours_worked = float(input("Hours worked: "))
day_of_week = input("Day of the week: ")
day_of_week = day_of_week.lower()

daily_wage = hourly_wage * hours_worked

if day_of_week == "sunday":
    daily_wage *= 2

print(f"Daily wages: {daily_wage} euros")