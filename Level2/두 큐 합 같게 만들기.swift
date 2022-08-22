/*
// pop 과 insert 를 합쳐서 작업 1회 수행으로 간주.
func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var answer: Int = 0
    var queue1 = queue1
    var queue2 = queue2
    
    let queue1Sum: Int = queue1.reduce(0, +)
    let queue2Sum: Int = queue2.reduce(0, +)
    let goal: Int = (queue1Sum + queue2Sum) / 2
    
    if (queue1Sum + queue2Sum) % 2 != 0 {
        return -1
    } else if goal < queue1.max()! || goal < queue2.max()! {
        // 목표값보다 큐의 최대값이 크면 달성할 수 없음.
        return -1
    }
    
    while goal != queue1.reduce(0, +) {
        if queue1.reduce(0, +) > queue2.reduce(0, +) {
            let first = queue1.removeFirst()
            queue2.append(first)
        } else {
            let first = queue2.removeFirst()
            queue1.append(first)
        }
        answer += 1
    }
    
    return answer
}
 */
// 정확성(56.7/100)

// ---
// 전체적인 아이디어는 다음과 같았다.
// L > R이라면, queue1의 원소를 queue2로 넘겨줍니다.
// L < R이라면, queue2의 원소를 queue1로 넘겨줍니다.
// 어렴풋이 reduce 를 통한 합을 구하는 방법에 대한 개선이 필요하다고 느꼈고, 최소한으로 횟수를 가져갔다.
// 하지만, 시간 초과에 부딪혔다.정확성(83.3 / 100)

/*
func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var answer: Int = 0
    var queue1 = queue1
    var queue2 = queue2
    
    var queue1Sum: Int = queue1.reduce(0, +)
    var queue2Sum: Int = queue2.reduce(0, +)
    let goal: Int = (queue1Sum + queue2Sum) / 2
    
    if (queue1Sum + queue2Sum) % 2 != 0 {
        return -1
    } else if goal < queue1.max()! || goal < queue2.max()! {
        // 목표값보다 큐의 최대값이 크면 달성할 수 없음.
        return -1
    }
    
    while goal != queue1Sum {
        if queue1Sum > queue2Sum {
            let first = queue1.removeFirst()
            queue2.append(first)
            
            // 아이디어: reduce 과정을 통한 시간을 줄이기 위한 과정.
            queue1Sum -= first
            queue2Sum += first
        } else {
            let first = queue2.removeFirst()
            queue1.append(first)
            
            queue2Sum -= first
            queue1Sum += first
        }
        answer += 1
    }
    
    return answer
}
 */

// ----
// 아이디어 : 투포인터
import Foundation

// 큐에서 다른 큐로 insert 할 때 뒤에 붙는 것을 고려.
func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    let array: [Int] = queue1 + queue2
    // queue1 의 좌우 포인터.
    var left: Int = 0
    var right: Int = queue1.count
    var answer: Int = 0
     
    var queue1Sum: Int = queue1.reduce(0, +)
    let queue2Sum: Int = queue2.reduce(0, +)
    let goal: Int = (queue1Sum + queue2Sum) / 2
    
    if (queue1Sum + queue2Sum) % 2 != 0 {
        return -1
    }
    
    // max() 메소드때문에 시간이 더 오래 걸렸다.
//    if goal < queue1.max()! || goal < queue2.max()! {
//        return -1
//    }

    while right < array.count && left <= right {
        if queue1Sum < goal {
            // queue1 이 목표값보다 작으면 queue2 에서 이동.
            queue1Sum += array[right]
            right += 1
        } else if queue1Sum > goal {
            // queue1 이 목표값보다 크면 queueu2 로 이동.
            queue1Sum -= array[left]
            left += 1
        } else {
            // goal 과 같은 경우.
            break
        }
        answer += 1
    }
    
    // 이동이 마친 후에도 goal 에 도달하지 않는 경우.
    if queue1Sum != goal {
        return -1
    }
    
    return answer
}


print(solution([3, 2, 7, 2], [4, 6, 5, 1]))
// 2

print(solution([1, 2, 1, 2], [1, 10, 1, 2]))
// 7

print(solution([1, 2, 1, 2], [1, 1, 2, 10]))
// 3
