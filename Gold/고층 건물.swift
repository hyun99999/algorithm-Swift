// 가장 많은 고층 빌딩이 보이는 고층 빌딩을 찾으려고 한다.
// 빌딩에서 보이려면 두 지붕을 잇는 선분이 서로를 제외한 다른 빌딩을 지나거나 접하지 않아야 한다.
// 가장 많이 보이는 빌딩 수 출력

/// n<=50
let n: Int = Int(readLine()!) ?? 0
let buildings: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

var maxCount: Int = 0

// 스택

// 구하고자하는 빌딩에서 좌우로 기울기를 비교.

if n == 1 {
    print(0)
} else {
    for i in 0..<n {
        var count: Int = 0
        var leftGradient: Double = 1000000000 / 1
        var rightGradient: Double = -(1000000000 / 1)
        
        for j in (0..<i).reversed() {
            /// i - 1번째 기울기
            let gradient: Double = Double(buildings[i] - buildings[j]) / Double(i - j)
            
            if leftGradient > gradient {
                leftGradient = gradient
                count += 1
            }
        }
        
        for j in i + 1..<n {
            // i + 1 번째 기울기
            
            let gradient: Double = Double(buildings[j] - buildings[i]) / Double(j - i)
            
            if rightGradient < gradient {
                rightGradient = gradient
                count += 1
            }
        }
        maxCount = max(maxCount, count)
    }
    print(maxCount)
}

/*
 15
 1 5 3 2 6 3 2 6 4 2 5 7 3 1 5
 */

// 답 7
