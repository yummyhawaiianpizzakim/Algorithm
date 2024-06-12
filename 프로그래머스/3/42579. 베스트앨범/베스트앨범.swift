import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var playedCount = [String: Int]()
    var musics = [String: [(i: Int, musicPlayedCount: Int)]]()
    var result: [Int] = []
    
    for i in 0 ..< genres.count {
        let genre = genres[i]
        let play = plays[i]
        
        playedCount[genre, default: 0] += play
        musics[genre, default: []].append((i: i, musicPlayedCount: play))
    }
    
    for (genre, _) in playedCount.sorted(by: { $0.value > $1.value }) {
        if let genreMusics = musics[genre] {
            let sortedMusics = genreMusics.sorted {
                if $0.musicPlayedCount == $1.musicPlayedCount {
                    return $0.i < $1.i
                }
                return $0.musicPlayedCount > $1.musicPlayedCount
            }.prefix(2)

            for music in sortedMusics {
                result.append(music.i)
            }
        }
    }
    
    return result
}
