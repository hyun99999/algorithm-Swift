import Foundation

func solution(_ m:String, _ musicinfos:[String]) -> String {
    // 악보에 사용되는 음은 C, C#, D, D#, E, F, F#, G, G#, A, A#, B 12개
    // 각 음은 1분에 1개씩 재생.
    // 음악길이 < 재생된 시간. -> 반복 재생.
    // 23:59 까지 재생.
    // 조건이 일치. -> 라디오에서 재생된 시간이 제일 긴 음악 제목 반환. 같을 경우 먼저 입력된 음악 제목 반환.
    
    // 일치하는 음악이 없는 경우 (None) 반환.
    
    // m : 멜로디
    // [음악이 시작한 시각, 끝난 시각, 음악 제목, 악보 정보]
    
    var music: [(title: String, time: Int)] = []
    
    // 아이디어: # 이 붙은 경우 소문자로 치환해준다.
    let m = m.replacingOccurrences(of: "C#", with: "c")
        .replacingOccurrences(of: "D#", with: "d")
        .replacingOccurrences(of: "F#", with: "f")
        .replacingOccurrences(of: "G#", with: "g")
        .replacingOccurrences(of: "A#", with: "a")
    
    for musicinfo in musicinfos {
        let info: [String] = musicinfo.components(separatedBy: ",")
        
        let start: [Int] = info[0].components(separatedBy: ":").map { Int($0)! }
        let end: [Int] = info[1].components(separatedBy: ":").map { Int($0)! }
        var time: Int = 0
        time = (end[0] - start[0]) * 60 + end[1] - start[1]
        
        let title = info[2]
        
        let melody: [String] = info[3].replacingOccurrences(of: "C#", with: "c")
            .replacingOccurrences(of: "D#", with: "d")
            .replacingOccurrences(of: "F#", with: "f")
            .replacingOccurrences(of: "G#", with: "g")
            .replacingOccurrences(of: "A#", with: "a")
            .map { String($0) }
        var playedMelody: String = ""
        for i in 0..<time {
            let index = i % melody.count
            playedMelody.append(melody[index])
        }
        
        // 조건과 일치하는 음악인가?
        if playedMelody.contains(m) {
            music.append((title, time))
        }
    }
    
    return music.max { $0.time < $1.time }?.title ?? "(None)"
}

print(solution("ABCDEFG", ["12:00,12:14,HELLO,CDEFGAB", "13:00,13:05,WORLD,ABCDEF"]))
// HELLO
