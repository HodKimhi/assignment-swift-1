/*
 -=-=- isPalindrome? -=-=-
 CRITERIA:
 Create a function that checks if a string is a palindrome and returns true or false. A palindrome is a word that reads the same way even if you read it backwards.
 
 PALINDROME DEFINITION:
 A palindrome is a word or phrase that is the read backwards or forwards.
 The user has the ability to choose whether a palindrome is case sensitive or can include special characters
*/

let specialCharacters: Set<Character> = ["!", "?", ".", "'", ",", "\\", "\"", " "] //edit this list to change which special characters can be ignored when checking for a palindrome

let testStrings = [
    "madam",
    "How are you today?",
    "Racecar",
    "A man, a plan, a canal, Panama!",
    "I went to france and ate a crepe",
    "Was it a car or a cat I saw?",
    " ",
    "a"
]

func isPalindrome(_ word: String, isCaseSensitive: Bool, canIncludeSpecialCharacters: Bool) -> Bool { //the parameters are the phrase being checked, and any requirements on the phrase to be considered a palindrome
    var myPhrase = word //now we can mutate the passed-in string
    
    if(!isCaseSensitive)
    {
        myPhrase = myPhrase.lowercased()
    }
    
    if(canIncludeSpecialCharacters)
    {
        myPhrase.removeAll(where: { specialCharacters.contains($0) }) //remove all characters that are not counted when identifying a palindrome
    }
    
    let testPalindrome = String(myPhrase.reversed())
    
    return testPalindrome == myPhrase ? true : false //if the passed-in word (after modifications) is equal to itself reversed, it is a palindrome (return true), otherwise return false
}

let string = testStrings[3] //change which phrase to check
let result = "\"\(string)\" is \(isPalindrome(string, isCaseSensitive: false, canIncludeSpecialCharacters: true) ? "a" : "not a") palindrome."
print(result)
