# Game of Apps Intern Interview

## Challenge 1: Algorithms

Your first challenge is to solve two algorithm questions. You'll be judged based on correctness, performance, and code readability.

### Question 1: Return first duplicate

Create a function that accepts an array of integers and returns the first duplicate value. Here's an example:

```swift
let testArray = [2, 4, 5, 1, 3, 5, 4]

if let duplicate = firstDuplicatedElement(in: testArray) {
  print(duplicate) // prints 4
}
```

Here's a function signature to start you off:

```swift
func firstDuplicatedElement(in array: [Int]) -> Int? {
  // your code here
}
```

### Question 2: Is Palindrome?

Create a function that checks if a string is a palindrome and returns `true` or `false`. A palindrome is a word that reads the same way even if you read it backwards.

Example palindromes:

- radar
- bob
- asdfdsa

Here's a function signature to start you off:

```swift
func isPalindrome(_ word: String) -> Bool {
  // your code here
}
```

## Challenge 2: iOS

Your second challenge is to develop a small app from scratch. Here are the requirements:

- It should show a list of images.
- Tapping on an image should navigate to a new screen that shows the selected picture

### Notes:

The iOS application was built and tested on iOS 12 on either an iPhone XR or an iPhone 8
