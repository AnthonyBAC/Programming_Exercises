word = input("Please type in the 1st word: ").lower()
word2 = input("Please type in the 2nd word: ").lower()

sorted_word = sorted(word, key=len)
sorted_word2 = sorted(word2, key=len)

if sorted_word > sorted_word2:
    print(f"{word} is alphabetically last.")
elif sorted_word < sorted_word2:
    print(f"{word2} is alphabetically last.")
elif sorted_word == sorted_word2:
    print("You gave the same word twice")