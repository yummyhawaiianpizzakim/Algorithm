import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    
    let results = skill_trees.filter {
        let skills = $0.filter { 
            skill.contains($0) 
        }.map { String($0) }.joined()
        
        return skill.hasPrefix(skills)
    }
    let count = results.count
    
    return count
}

