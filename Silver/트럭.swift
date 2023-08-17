// n개의 트럭이 다리를 건넌다.
// w대의 트럭만이 다리에 동시에 올라갈 수 있다.
// 무게의 합은 다리의 최대하중인 L만큼보다 작거나 같아야 함.
// 트럭이 다리를 건너는 최단 시간을 구하시오.

// L 만큼의 가중치를 수용할 수 있는 queue 와 같은 구조.

let nwl: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
let (n, w, l) = (nwl[0], nwl[1], nwl[2])
var a: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

var time: Int = 0
var index: Int = 0
/// 다리에 올라온 트럭들의 총 무게.
var weight: Int = 0
/// 다리에 올라온 트럭이 올라온 시간과 트럭의 무게.
var queue: [[Int]] = []

while index < n || !queue.isEmpty {
    // 트럭의 무게가 L보다 큰 경우, 다리 위에 올라가지 못함. 해당 트럭은 무시.
    if index < n && l < a[index] {
        index += 1
        
        continue
    }
    
    time += 1
    
    // ✅아이디어: 순서. 다리에서 트럭이 빠져가남 -> 트럭이 다리에 올라올 수 있음.
    // 트럭이 다리에 올라온 시간 + 다리의 길이 == 트럭이 다리에서 빠져나가는 시간.
    if !queue.isEmpty && queue[0][0] + w <= time {
        // 다리에서 트럭이 빠져나감.
        weight -= queue.removeFirst()[1]
    }
    
    if index < n && weight + a[index] <= l && queue.count < w {
        // 트럭이 다리에 올라갈 수 있음.
        queue.append([time, a[index]])
        weight += a[index]
        index += 1
    }
}

print(time)


/*
4 2 10
7 4 5 6
*/

// 답: 8
