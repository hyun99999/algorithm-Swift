import Foundation

func solution(_ operations:[String]) -> [Int] {
    var queue: [Int] = []
    
    operations.forEach { operation in
        let operations: [String] = operation.components(separatedBy: " ")
        if operations[0] == "D" {
            if !queue.isEmpty {
                if operations[1] == "1" {
                    let max: Int = queue.max()!
                    let index = queue.firstIndex(of: max)
                    queue.remove(at: index!)
                } else {
                    // D -1
                    let min: Int = queue.min()!
                    let index = queue.firstIndex(of: min)
                    queue.remove(at: index!)
                }
            }
        } else if operations[0] == "I" {
            queue.append(Int(operations[1])!)
        }
    }
    
    return queue.isEmpty ? [0, 0] : [queue.max()!, queue.min()!]
}

// 우선순위 큐지만 전혀 큐를 사용하지 않은 풀이였고, 이중우선순위 큐를 사용하여 풀어보자.

print(solution(["I 16", "I -5643", "D -1", "D 1", "D 1", "I 123", "D -1"]))
// [0, 0]

print(solution(["I -45", "I 653", "D 1", "I -642", "I 45", "I 97", "D 1", "D -1", "I 333"]))
// [333, -45]
