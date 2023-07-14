import Foundation

// 바로 앞의 선수를 추월할 때 이름을 부릅니다.
// callings 를 순회하고, 1등부터 순서대로 배열에 담아 반환.

func solution(_ players:[String], _ callings:[String]) -> [String] {
    /*
    var lanking: [String] = players

    // O(n)
    for i in 0..<callings.count {
        // O(n)
        let index: Int = lanking.firstIndex(of: callings[i]) ?? 0
        let temp: String = lanking[index]
        
        lanking[index] = lanking[index - 1]
        lanking[index - 1] = temp
    }
    */
    // O(n2) 시간초과 예상.
    // 딕셔너리 사용하자.
    var players: [String] = players
    var playersLank: [String : Int] = [:]
    
    for i in 0..<players.count {
        playersLank[players[i]] = i
    }
    
    for i in 0..<callings.count {
        let index: Int = playersLank[callings[i], default: 0]
        let temp: String = players[index - 1]
        
        players[index - 1] = players[index]
        players[index] = temp
        
        playersLank[callings[i], default: 0] -= 1
        playersLank[temp, default: 0] += 1
    }
    
    
    // 딕셔너리에서 등수를 기준으로 오름차순 정렬하여 값 배열 반환.
//    return playersLank.sorted { $0.value < $1.value }.map { $0.key }
    
     return players
}
