// queue 구조에 따라서 프린터가 인쇄된다.
// 그런데 다음과 같이 조건이 있다.
// queue 가장 앞의 문서의 중요도를 확인.
// 더 높은 중요도를 가진 문서가 있는 경우, queue 의 가장 뒤에 재배치. 아리라면 인쇄.

let t: Int = Int(readLine()!) ?? 0

for _ in 0..<t {
    let nm: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    
    var priority: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    /// 알고자하는 인덱스.
    var printIndex: Int = nm[1]
    var count: Int = 0
    /// 최대 우선순위.
    var max: Int = priority.max() ?? 0
    
    while true {
        if priority.first ?? 0 == max {
            // 출력.
            let _ = priority.removeFirst()
            max = priority.max() ?? 0
            count += 1
            
            if printIndex == 0 {
                break
            }
            
            printIndex -= 1
        } else {
            priority.append(priority.removeFirst())
            
            if printIndex == 0 {
                printIndex = priority.count - 1
            } else {
                printIndex -= 1
            }
        }
    }
    
    print(count)
}

/*
3
1 0
5
4 2
1 2 3 4
6 0
1 1 9 1 1 1
*/

// 답
// 1
// 2
// 5
