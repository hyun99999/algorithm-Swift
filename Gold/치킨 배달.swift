// n*n 도시는 빈 칸 / 치킨집 / 집 중 하나.
// 치킨 거리 = 집과 가장 가까운 치킨집 사이의 거리
// 도시의 치킨 거리 = 모든 집의 치킨 거리 의 합.
// 거리는 |r1-r2| + |c1-c2|
// 치킨집을 최대 M개 남기고 폐업시켜야 한다면 도시의 치킨 거리가 가장 작게 될지 구하시오.

let nm: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

typealias Point = (row: Int, col: Int)
/// 치킨집의 위치.
var shopList: [Point] = []
/// 집의 위치.
var house: [Point] = []

var board: [[Int]] = Array(repeating: [], count: nm[0])

for i in 0..<nm[0] {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    
    board[i] = input
    
    for j in 0..<input.count {
        if input[j] == 1 {
            house.append((i, j))
        }
    }
    
    for j in 0..<input.count {
        if input[j] == 2 {
            shopList.append((i, j))
        }
    }
}
// 0 빈칸
// 1 집
// 2 치킨집

// 치킨집을 최대 m개 골랐을 때 도시의 치킨 거리 최솟값 출력.
// dfs 조합.

/// 치킨집에 대해서 도시의 치킨 거리 반환.
func search(in shop: [Point]) -> Int {
    var sum: Int = 0
    
    for i in 0..<house.count {
        var distance: Int = Int.max
        
        for j in 0..<shop.count {
            distance = min(abs(house[i].row - shop[j].row) + abs(house[i].col - shop[j].col), distance)
        }
        sum += distance
    }
    
    return sum
}

var answer: Int = Int.max

// 조합으로 치킨집 목록 작성.
func dfs(_ start: Int, _ count: Int, _ shop: [Point]) {
    if count == nm[1] {
        answer = min(answer, search(in: shop))
        
        return
    }
    
    for i in start..<shopList.count {
        dfs(i + 1, count + 1, shop + [shopList[i]])
    }
}

dfs(0, 0, [])

print(answer)

/*
5 3
0 0 1 0 0
0 0 2 0 1
0 1 2 0 0
0 0 1 0 0
0 0 0 0 2
*/

// 5
