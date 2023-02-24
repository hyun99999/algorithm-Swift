import Foundation

/// 센서의 개수
let n: Int = Int(readLine()!) ?? 0
/// 집중국의 개수
var k: Int = Int(readLine()!) ?? 0
/// 센서의 좌표.
/// 주의 : 음수가 있을 수 있음.
var location: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? -1 }
location.sort(by: <)

k = min(k, n)

var distance: [Int] = []

for index in 0..<location.count - 1 {
    distance.append(location[index + 1] - location[index])
}

distance.sort(by: >)

print(distance[k - 1..<distance.count].reduce(0, +))

/*
6
2
1 6 9 3 6 7
*/
// 5

/*
6
2
1 1 1 1 2 1
*/
// 0
