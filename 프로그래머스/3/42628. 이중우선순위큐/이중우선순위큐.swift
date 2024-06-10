import Foundation

// func solution(_ operations:[String]) -> [Int] {
//     return []
// }

func solution(_ operations:[String]) -> [Int] {
    var result: [Int] = []
    
    for operation in operations {
        if operation.hasPrefix("I") {
            let splitedStrings = operation.split(separator: " ")
            
            guard let lastString = splitedStrings.last,
                  let int = Int(lastString)
            else { return [] }
            
            result.append(int)
            if result.count > 1 {
                result.sort { $0 > $1 }
            }
            
        } else if operation.hasPrefix("D 1") {
            if !result.isEmpty {
                result.removeFirst()
            }
            
        } else if operation.hasPrefix("D -1") {
            if !result.isEmpty{
                result.removeLast()
            }
        }
    }
    
    if result.isEmpty {
        return [0, 0]
    } else {
        guard let first = result.first,
        let last = result.last
        else { return [] }
        return [first, last]
    }
}