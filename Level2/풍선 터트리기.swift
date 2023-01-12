import Foundation

// 임의의 인접한 두 풍선 중 하나를 터트립니다.(작은 수는 한번만 터트릴 수 있다.)
// 풍선들을 1개만 남을 때까지 터트렸을 때 최후의 풍선이 가능한 개수 반환.
/*
func solution(_ a:[Int]) -> Int {
    // 아이디어: 인접한 두 풍선이 터진다면 결국 제일 작은 풍선을 남길 수 있다.
    // 남기려는 풍선의 양쪽을 검사해서 두쪽 다 작은 풍선이면 남길 수 없는 풍선이 된다.
    
    var answer: Int = 2
    
    // 양쪽의 풍선은 무조건 남길 수 있다.
    for index in 1..<a.count - 1 {
        // 🚨 min() 메서드가 시간초과의 원인이라고 판단.
        let leftMin: Int = Array(a[0..<index]).min() ?? 0
        let rightMin: Int = Array(a[index + 1..<a.count]).min() ?? 0
        
        // 양쪽 끝의 풍선은 min 이 자신이다. 그래서 = 포함
        if a[index] <= leftMin || a[index] <= rightMin {
            
            answer += 1
        }
    }
    
    // 남길 수 없는 경우를 제외함.
    return answer
}
*/
// 시간 초과.(테스트 4-15)
// -> ✅ min 을 매번 사용한다?
// 좌->index, index<-우 에 대한 최솟값을 배열에 저장하면 매번 함수를 호출하지 않아도 된다.(다이나믹 프로그래밍)

func solution(_ a:[Int]) -> Int {
    var leftMin: [Int] = Array(repeating: 0, count: a.count)
    var rightMin: [Int] = Array(repeating: 0, count: a.count)
    var min: Int = Int.max
    var answer: Int = 0
    
    // 좌->
    for index in 0..<a.count {
        if a[index] < min {
            min = a[index]
        }
        
        leftMin[index] = min
    }
    
    min = Int.max
    
    // <-우
    for index in (0..<a.count).reversed() {
        if a[index] < min {
            min = a[index]
        }
        
        rightMin[index] = min
    }
    
    for index in 0..<a.count {
        if a[index] <= leftMin[index] || a[index] <= rightMin[index] {
            answer += 1
        }
    }
    
    return answer
}

print(solution([9,-1,-5]))
// 3
