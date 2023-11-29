// 집 n개가 수직선 위에 있다.
// 도현이는 와이파이를 즐기기 위해 집에 공유기를 c개 설치한다. 한 집에 하나의 공유기만 설치 가능
// c개의 공유기를 n개의 집에 적당히 설치해서 가장 인접한 두 공유기 사이의 거리가 최대이고자 한다.

let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
let (n, c) = (input[0], input[1])

// 그리디

var houses: [Int] = []

for _ in 0..<n {
    houses.append(Int(readLine()!) ?? 0)
}

houses.sort(by: <)

// 첫 집과 마지막 집의 간격은 최대 1,000,000,000이다.
// 그리디한 해를 구하기 위한 방법 -> 시간초과를 해결하기 위해
// ✅ 이진탐색

var right: Int = houses.last! - houses.first!
var left: Int = 1
var distance: Int = 0

// 다음 집과의 간격이 mid 이상이면 공유기 설치 가능
// 최종적으로 설치할 수 있는 공유기의 수가 c 이상이면 mid 간격 가능

while left <= right {
    /// 두 집 사이의 거리
    var mid: Int = (right + left) / 2
    // 첫 번째 집에는 공유기를 무조건 설치해야 최대 간격 구하기 가능. 설치했다 가정.
    var count: Int = 1
    var installedIndex: Int = 0
    
    for i in 1..<houses.count {
        if houses[i] - houses[installedIndex] >= mid {
            installedIndex = i
            count += 1
        }
    }
    
    if count >= c {
        // 해당 간격(mid)으로 공유기를 설치할 수 있다.
        distance = mid
        left = mid + 1
    } else {
        right = mid - 1
    }
}

print(distance)

/*
5 3
1
2
8
4
9
*/

// 답: 3
