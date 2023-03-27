import Foundation

// 일렬로 놓여진 n개의 버튼이 모두 불이 꺼져있다.
// 0과1로 구성된 n자리의 수가 적힌 쪽지가 있다.
// 0은 꺼진 불, 1은 켜진 불
// 버튼을 누르면 해당 버튼뿐만 아니라 오른쪽 두 개의 버튼도 같이 눌린다.

// 버튼을 최소로 눌러 쪽지와 똑같은 상태로 만들어야 한다.

let n: Int = Int(readLine()!) ?? 0
let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? -1 }

// 아이디어:
// 0이면 건드리지 않는다.
// 1의 왼쪽으로
// 해당 불을 켜기 위해서는

var bulbes: [Int] = Array(repeating: 0, count: n)
var count: Int = 0

func turn(_ i: Int) {
    bulbes[i] = bulbes[i] == 0 ? 1 : 0
    
    if i < n - 2 {
        bulbes[i + 1] = bulbes[i + 1] == 0 ? 1 : 0
        bulbes[i + 2] = bulbes[i + 2] == 0 ? 1 : 0
    } else if i == n - 2 {
        bulbes[i + 1] = bulbes[i + 1] == 0 ? 1 : 0
    }
}

for i in 0..<n {
    if bulbes[i] != input[i] {
        turn(i)
        count += 1
    }
}

print(count)

/*
7
0 0 1 0 0 1 0
 
결과
2
*/
