/*
 -=-=- First Duplicate -=-=-
 CRITERIA:
 Create a function that accepts an array of integers and returns the first duplicate value.
 
 EXPLANATION:
 The following code creates a dictionary and creates a key for each element in testArray. Once a repeated value is reached, the key already has a value and can be set aside as a known duplicate. Then, we remove all non-duplicates from the base array, leaving the first item to be the first duplicated element.
 
 This is more efficient than a nested for loop. Tested with an array with 5001 numbers.
*/

let testArray = [2, 4, 5, 1, 3, 5, 4]

//This is more efficient than a nested for loop
func firstDuplicatedElement(in array: [Int]) -> Int? {
    var baseArray = array               //the base array, but modifiable so that we can remove all non-duplicates.
    var myDictionary: [Int: Int] = [:]  //A dictionary specifically to check for a repeated key
    var duplicates: [Int] = []          //an array to store known duplicates
    
    for item in array
    {
        if(myDictionary[item] == nil)
        {
            myDictionary[item] = 1
        }
        else
        {
            duplicates.append(item)
        }
    }
    
    baseArray.removeAll(where: {!duplicates.contains($0)}) //remove all non-duplicates
    
    if baseArray.count > 0
    {
        return baseArray[0]
    }
    return nil
}

if let duplicate = firstDuplicatedElement(in: testArray) {
    print("First duplicate: \(duplicate)") // prints "First duplicate: 4"
}
else
{
    print("Array contains no duplicates")
}
