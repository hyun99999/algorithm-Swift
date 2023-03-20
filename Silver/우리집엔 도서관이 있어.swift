import Foundation

// 책을 탑처럼 쌓는다.
// 사전 순으로 앞서는 책은 가장 위에. 뒤에 있는 책은 가장 밑에 놓아야 한다.
// 책을 정렬할 때는 책 하나를 뺀 다음, 가장 위에 놓는 것이다.
// 몇 번만에 사전 순으로 쌓을 수 있는 구하시오.
// n <= 300,000

let n: Int = Int(readLine()!) ?? -1
var array: [Int] = []

for _ in 0..<n {
    let input: Int = Int(readLine()!) ?? -1
    array.append(input)
}

// 아이디어: 맨 아래 위치해야하는 책(n)보다 위에 있는 책 중

/// 정렬해야하는 책의 권수.
var count: Int = n - 1
var willSortBook: Int = n - 1
var index: Int = array.firstIndex(of: n) ?? -1

for i in (0..<index).reversed() {
    if array[i] == willSortBook {
        willSortBook = array[i] - 1
        count -= 1
    }
}

print(count)

/*
3
3
2
1
 
결과
2
*/
