students = int(input("How many students on the course? "))
groups = int(input("Desired group size? "))

if students % groups == 0:
    group_forms = students // groups
    print(f"Number of groups formed: {group_forms}")
else:
    group_forms = (students // groups ) + 1
    print(f"Number of groups formed: {group_forms}")
    
''' 
students = int(input("How many students on the course? "))
group_size = int(input("Desired group size? "))
 
groups = (students + group_size - 1) // group_size
 
print("Number of groups formed:", groups)
'''