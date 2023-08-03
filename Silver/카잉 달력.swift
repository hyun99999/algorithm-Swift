// 카잉제국은 M과 N보다 작은 자연수 x,y 를 가지고 년도를 표현합니다.
// <x:y>의 다음 해를 표현한 것을 <x':y'>
// x < M 이면 x' = x+1 아니면, x'=1 y도. 마찬가지.

let t: Int = Int(readLine()!) ?? 0

for _ in 0..<t {
    let mnxy: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    let (m, n, x, y) = (mnxy[0], mnxy[1], mnxy[2], mnxy[3])
    
    var k: Int = 1
    
    // <3:9> 라면 <1:7> 로 맞춰서(한 쪽을 1로 맞추기) <3:9> 가 되도록 연산 할 예정.
    var tx: Int = 0
    var ty: Int = 0
    
    if x > y {
        tx = x - y + 1
        ty = 1
    } else {
        tx = 1
        ty = y - x + 1
    }
    
    var nx: Int = 1
    var ny: Int = 1
    var stop: Bool = false
    
    while !stop {
        if nx == tx && ny == ty {
            // 정답
            k += x - tx
            nx = x
            ny = y
            stop = true
        } else if m - nx > n - ny {
            // y 가 먼저 1됨.
            nx += n - ny + 1
            k += n - ny + 1
            ny = 1
        } else if m - nx < n - ny {
            // x 가 먼저 1됨.
            ny += m - nx + 1
            k += m - nx + 1
            nx = 1
        } else {
            // 멸망해.
            k += n - ny
            nx = m
            ny = n
            stop = true
        }
    }
    
    if nx == x && ny == y {
        print(k)
    } else {
        // 멸망해까지 해당 달력이 없음.
        print(-1)
    }
}

/*
3
10 12 3 9
10 12 7 2
13 11 5 6
*/

/*
 답
33
-1
83
*/
