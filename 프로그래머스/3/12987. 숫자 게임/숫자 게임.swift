import Foundation


func solution(_ a:[Int], _ b:[Int]) -> Int {
    let a = a.sorted()
    var b = b.sorted()
    var result = 0
    
    for i in stride(from: a.count - 1 , through: 0, by: -1) {
        let aNum = a[i]
        if let bLast = b.last {
            
            if aNum < bLast {
                b.removeLast()
                result += 1
            }
        }
    }
    
    return result
}
