import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var lostSet = Set(lost).subtracting(reserve)
    var reserveSet = Set(reserve).subtracting(lost)
    
    for num in reserveSet {
        if lostSet.contains(num - 1) {
            lostSet.remove(num - 1)
            continue
        }
        if lostSet.contains(num + 1) {
            lostSet.remove(num + 1)
        }
    }
    
    return n - lostSet.count
}

