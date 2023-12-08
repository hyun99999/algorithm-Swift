// 1부터 n까지 순열을 이용
// k가 주어진다. 어떤 수를 뒤집으면 오른쪽으로 k개의 수를 뒤집는다.포함
// 오름차순으로 만들려한다. 최소 몇 개를 선택해야 하는가?
// 만들 수 없다면 -1 출력.
// nk <= 8

let nk: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
let nums: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

let target: [Int] = nums.sorted(by: <)
var count: Int = -1

// dfs 완전탐색을 더 빨리 끝내기 위해서
// 오름차순을 찾게되면 바로 해당 depth에서 끝낼 수 있기 때문에
// bfs 완전탐색

var queue: [([Int], Int)] = []
queue.append((nums, 0))

var visited: Set<[Int]> = []

while !queue.isEmpty {
    let first = queue.removeFirst()
    
    if first.0 == target {
        count = first.1
        break
    }
    
    for i in 0...nk[0] - nk[1] {
        let reversed: [Int] = Array(first.0[i..<i + nk[1]]).reversed()
        let array: [Int] = Array(first.0[0..<i]) + reversed + Array(first.0[i + nk[1]..<nums.count])
        
        if !visited.contains(array) {
            queue.append((array, first.1 + 1))
            visited.insert(array)
        }
    }
}

print(count)

/*
3 3
3 2 1
*/

// 1

/*
3 3
1 2 3
*/

// 0
