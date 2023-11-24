import Foundation


func solution(_ numbers:[Int], _ hand:String) -> String {
    enum userHand: String {
        case left
        case right
    }
    
    var result = ""
    var lefthandIndex = 10
    var righthandIndex = 12
    
    for i in numbers {
        var number = i == 0 ? 11 : i
        switch number {
        case 1, 4, 7:
            lefthandIndex = number
            result.append("L")
        case 3, 6, 9:
            righthandIndex = number
            result.append("R")
        case 2, 5, 8, 11:
            var leftTemp = abs(number - lefthandIndex)
            var rightTemp = abs(number - righthandIndex)
            
            var leftDistance = (leftTemp / 3) + (leftTemp % 3)
            var rightDistance = (rightTemp / 3) + (rightTemp % 3)
            
            if leftDistance == rightDistance {
                if hand == userHand.left.rawValue {
                    lefthandIndex = number
                    result.append("L")
                } else {
                    righthandIndex = number
                    result.append("R")
                }
            } else if leftDistance > rightDistance {
                righthandIndex = number
                result.append("R")
            } else {
                lefthandIndex = number
                result.append("L")
            }
        default:
            break
        }
    }
    
    return result
}
