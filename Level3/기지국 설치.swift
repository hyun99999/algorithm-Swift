import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    // ✅ 아이디어 : stations(기존 기지국)의 범위를 잘라서 기지국이 필요한 영역을 분리시키기
    
    // 끊어진 시작점
    var start: Int = 1
    var answer: Int = 0

    for station in stations {
        if station - w > 1 {
            var range = station - w - start
            
            answer += Int(ceil((Double(range) / Double(2 * w + 1))))
        }
        
        start = station + w + 1
    }
    
    if start <= n {
        // 아직 기지국이 더 필요하다.
        var range = n - start + 1
        
        answer += Int(ceil((Double(range) / Double(2 * w + 1))))
    }
    
    return answer
}

print(solution(11, [4,11], 1))
// 3

print(solution(16, [9], 2))
// 3
