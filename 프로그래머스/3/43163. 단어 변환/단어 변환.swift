import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    if !words.contains(target) {
        return 0
    }
    
    var isvisited = Array(repeating: false, count: words.count)
    var queue = [(begin: begin, count: 0)]
    
    while !queue.isEmpty {
        var current = queue.removeLast()
        
        for (index, word) in words.enumerated() {
            if current.begin == target {
                return current.count
            }
            
            if !isvisited[index] && isDiffOnlyOne(begin: current.begin, word: word) {
                queue.append((word, current.count + 1))
                isvisited[index] = true
            }
        }
    }
    
    return 0
}

func isDiffOnlyOne(begin: String, word: String) -> Bool {
    let beginCs: [Character] = Array(begin)
    let wordCs: [Character] = Array(word)
    var count = 0
    
    for i in 0 ..< beginCs.count {
        if beginCs[i] != wordCs[i] {
            count += 1
        }
    }
    
    if count == 1 {
        return true
    } else {
        return false
    }
}
