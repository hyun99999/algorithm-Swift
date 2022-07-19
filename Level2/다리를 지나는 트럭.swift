import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    // 무게가 0인 트럭이 다리 길이만큼 존재. 시간이 갈때마다 트럭이 내리고 들어옴.
    var bridgeQueue: [Int] = Array(repeating: 0, count: bridge_length)
    var truckQueue: [Int] = truck_weights
    var bridgeWeight = 0
    var time: Int = 0
    
    while !truckQueue.isEmpty || bridgeWeight != 0 {
        // truckQueue 에서 트럭이 없다면. 즉, 다리에 트럭이 모두 올라감.
        // bridgeWeight 가 0이 될 때까지 bridgeQueue 를 비워줌.
        time += 1
        bridgeWeight -= bridgeQueue.removeFirst()
        // 트럭은 일단 내림.
        if !truckQueue.isEmpty {
            if bridgeWeight + truckQueue[0] <= weight {
                // 다리에서 트럭이 건너고 새로운 트럭이 들어오는 경우.
                let enterTruck = truckQueue.removeFirst()
                bridgeWeight += enterTruck
                bridgeQueue.append(enterTruck)
            } else {
                // 다리에서 트럭은 내리고 무게 초과로 0 트럭이 들어오는 경우.
                bridgeQueue.append(0)
            }
        }
    }
    
    return time
}

print(solution(2, 10, [7,4,5,6]))
// 8

print(solution(100, 100, [10]))
// 101

print(solution(100, 100, [10,10,10,10,10,10,10,10,10,10]))
// 110
