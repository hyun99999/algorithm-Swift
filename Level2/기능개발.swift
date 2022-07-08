import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var result: [Int] = []
    var speeds = speeds
    var progresses = progresses
    var count = 0
    
    while !progresses.isEmpty {
        for i in 0..<progresses.count {
            progresses[i] += speeds[i]
        }
        if progresses.first! >= 100 {
            while progresses.first! >= 100 {
                count += 1
                progresses.removeFirst()
                speeds.removeFirst()
                
                if progresses.isEmpty { break }
            }
            result.append(count)
            count = 0   
        }
    }
    
    return result
}

let result = solution([93, 30, 55], [1, 30, 5])
print(result)
