import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    // 작업 종료되기까지 걸리는 최적의 평균 시간 구하기
    // 작업을 수행하고 있지 않을때는 먼저 온 요청 부터
    
    var averageTime: Int = 0
    var endTask: Int = 0
    var start: Int = 0
    var end: Int = 0
    
    // ✅ 아이디어 : 요청 시간이 같을 때는 작업시간이 작은 작업부터 실행하는 것이 최적
    var jobsQueue: [[Int]] = jobs.sorted {
        if $0[0] == $1[0] {
            return $0[1] < $1[1]
        } else {
            return $0[0] < $1[0]
        }
    }
    
    while endTask != jobs.count {
        let time = jobsQueue.first![0]
        
        if time > start {
            start = time
        }
        
        // 작업할 queue.
        var queue: [[Int]] = []
        
        // 작업 가능한 것들 중 가장 앞구하기
        for i in 0..<jobsQueue.count {
            if jobsQueue[i][0] <= start {
                let first = jobsQueue[i]
                queue.append(first)
            } else {
                break
            }
        }
        
        queue.sort {
            if $0[1] == $1[1] {
                return $0[0] < $1[0]
            } else {
                return $0[1] < $1[1]
            }
        }

        let first = queue.removeFirst()
        //
        
        end = first[1] + start
        averageTime += end - first[0]
        
        jobsQueue.remove(at: jobsQueue.firstIndex(of: first)!)
        endTask += 1

        start = end
    }
    
    return averageTime / jobs.count
}

print(solution([[0, 3], [1, 9], [2, 6]]))
// 9
