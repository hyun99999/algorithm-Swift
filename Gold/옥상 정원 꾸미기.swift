// n개의 빌딩이 있는데 다른 빌딩의 옥상 정원을 벤치마킹하려 한다.
// 모든 빌딩은 일렬로 서 있고 오른쪽만 볼 수 있다.
// i번째 빌딩 관리인은 i+1, i+2, N 빌딩을 볼 수 있다.
// 자신의 빌딩보다 높거나 같은 빌딩은 볼 수 없다.
// 관리인들이 옥상정원을 확인할 수 있는 총 횟수는?

let n: Int = Int(readLine()!) ?? 0
var buildings: [Int] = []

for _ in 0..<n {
    let building: Int = Int(readLine()!) ?? 0
    
    buildings.append(building)
}

// 모노톤 스택(감소).
var stack: [Int] = []
var count: Int = 0

for i in (0..<buildings.count).reversed() {
    let building: Int = buildings[i]
    
    if stack.isEmpty {
        stack.append(i)
    } else {
        while !stack.isEmpty {
            let last: Int = stack.removeLast()
            
            if buildings[last] >= building {
                // 오른쪽에 큰 빌딩을 만남.
                stack.append(last)
                stack.append(i)
                
                // 🚨 index 의 차이를 활용해서 빌딩 사이의 갯수를 구할 수 있음.
                count += last - i - 1
                break
            }
            
            if stack.isEmpty {
                // 오른쪽에는 큰 빌딩이 없음.
                stack.append(i)
                // 🚨
                count += buildings.count - i
            }
        }
    }
}

print(count)

/*
6
10
3
7
4
12
2
*/

// 답 5

/*
7
13
10
3
7
4
12
2
*/

// 답 11
