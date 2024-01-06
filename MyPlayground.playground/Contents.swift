import UIKit

let levelScore = 10
let score = "THE GAME'S SCORE IS "
var gameScore = 30
gameScore += levelScore
print(score.lowercased().count + gameScore)

let value1 = (19 % 6) * 3
let value2 = 77 % 10
let result = (value1 < 5) && (value2 > 10)

var myFloat = 4.1
let myString = String(myFloat)
let myString = "\(myFloat)"
let myString = myFloat.description
