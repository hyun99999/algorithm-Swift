// 리모컨에는 0부터 9까지 숫자. + - 가 있다.
// 채널 0에서 - 를 눌러도 채널은 변하지 않음.
// 채널은 무한대. 현재 채널은 100번.
// n 채널로 이동하기 위해서 최소 몇번 눌러야 하는지 구하시오.
let n: Int = Int(readLine()!) ?? 0
let m: Int = Int(readLine()!) ?? 0

/// +,- 만 사용하여 채널 변경 시 최소 값.
var minCount: Int = abs(n - 100)

if m == 0 {
    // 고장난 버튼 없음.
    print(min(minCount, String(n).count))
} else {
    let breakdown: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }


    if n == 100 {
        print(0)
    } else {
        // 주어지는 채널은 500,000이지만, 채널은 무한대라고 한다.
        // -> 500,001 부터 1,000,000 채널에서 - 로 접근하는 것이 더 가까움.
        // 그래서 고려해줘야 함.
        
        for i in 0..<1000000 {
            // 숫자버튼이 고장나서 가까운 곳으로 이동 후 +,- 이동.

            let iList: [String] = String(i).map { String($0) }
            
            for j in 0..<iList.count {
                if breakdown.contains(Int(iList[j]) ?? 0) {
                    // 고장난 버튼이 포함되어 있다면 break.
                    break
                } else if j == iList.count - 1 {
                    // 포함되지 않았다면.
                    minCount = min(minCount, iList.count + abs(n - i))
                }
            }
        }

        print(minCount)
    }
}

/*
 5457
 3
 6 7 8
 */

// 6

/*
 // 🚨 조심.
 14124
 0
 */

// 5
