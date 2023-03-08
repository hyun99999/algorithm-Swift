import Foundation

// 수직선상에 N개의 마을이 위치.
// i번째 마을은 x[i]에 위치하고 a[i] 명의 사람이 살고 있다.
// 우체국을 세우는데 각 사람들까지의 거리의 합이 최소가 되는 위치에 우체국을 세우기로 한다.
// 각 마을이 아닌 각 사람들까지의 거리의 합이다.

let n: Int = Int(readLine()!) ?? 0
/// 마을의 위치, 마을에 사는 사람 수.
var array: [[Int]] = []

for _ in 0..<n {
    let inputs: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? -1 }
    array.append(inputs)
}

// 아이디어: 사람들에게서 가까운 우체국 설치. -> 우체국을 기준으로 왼쪽과 오른쪽의 사람 수 차이가 적은 곳.

array.sort { $0[0] < $1[0] }

let half: Int = Int(round(Double(array.reduce(0) { $0 + $1[1] }) / 2))
var count: Int = 0

for index in 0..<array.count {
    count += array[index][1]
    
    if count >= half {
        print(array[index][0])
        
        break
    }
}

/*
3
1 3
2 5
3 3

결과
2
*/
