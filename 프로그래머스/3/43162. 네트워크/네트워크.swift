import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var isvisitedArray = Array(repeating: false, count: n)
    var count = 0
    
    func dfs(com: Int) {
        isvisitedArray[com] = true
        for i in 0 ..< n {
            if computers[com][i] == 1 && !isvisitedArray[i] {
                dfs(com: i)
            }
        }
    }
    
    for i in 0 ..< n {
        if !isvisitedArray[i] {
            count += 1
            dfs(com: i)
        }
    }
    
    return count
}