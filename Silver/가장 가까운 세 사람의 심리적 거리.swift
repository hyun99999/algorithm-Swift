// ISTJ, ISFJ, INFJ, INTJ, ISTP, ISFP, INFP, INTP, ESTP, ESFP, ENFP, ENTP, ESTJ, ESFJ, ENFJ, ENTJ
// MBTI 를 이용하여 두 사람의 심리적인 거리를 정의할 수 있다.
// 서로 다른 분류에 속하는 수로 정의.

// N명의 학생들이 주어질 때 가장 가까운 세 학생 사이의 심리적인 거리를 구해보자.

/// 테스트 케이스의 수.
let t: Int = Int(readLine()!) ?? 0

for _ in 0..<t {
    // 3 <= N <= 100,000
    // 🚨 100,000C3 -> 조합. dfs 완전탐색은 10,000 초과라서 시간초과 예상.
    let _: Int = Int(readLine()!) ?? 0
    
    let input: [String] = readLine()!.split(separator: " ").map { String($0) }
    // ✅ 아이디어: 비둘기집 원리
    // 서로 다른 mbti 를 가진 16명이 2명씩일 때 32명일때는 심리적 거리가 0이 될 수 없음.
    // 33명부터는 동일한 mbti 를 가진 인원이 3명이 되기 때문에 심리적 거리 0 보장.
    // 3 명 이상인 mbti 종류가 있다면 0 출력. 없다면, 조합으로 구성.
    // 참고: https://cheon2308.tistory.com/entry/백준-20529번-파이썬-가장-가까운-세-사람의-심리적-거리
    
    var mbtiDictionary: [String : Int] = [:]
    
    for i in 0..<input.count {
        mbtiDictionary[input[i], default: 0] += 1
    }

    // 1. 비둘기집 원리로 심리적 거리 0 보장.
    if !mbtiDictionary.filter ({ $0.value >= 3 }).isEmpty {
        print(0)
        continue
    }
    // 혹은
    // 33개 이상인 경우, 0 출력.
    
    // 2. 조합을 만들어서 진행.
    // 🚨 32명까지만 보면 됨.
    // 32C3 -> 10,000 이하여서 완전탐색 가능.
    // ✅ dfs 를 사용하지 않고, 3중 for문을 사용해서 조합 생성해도 가능.
    
    var visited: [Bool] = Array(repeating: false, count: input.count)
    var answer: Int = Int.max
    
    /// 조합을 가지고 심리적 거리 계산.
    func check() -> Int {
        var checkList: [[String]] = []
        var sum: Int = 0
        
        for i in 0..<visited.count {
            if visited[i] {
                checkList.append(input[i].map { String($0) })
            }
        }
        
        for i in 0..<4 {
            if checkList[0][i] != checkList[1][i]{
                sum += 1
            }
            
            if checkList[0][i] != checkList[2][i] {
                sum += 1
            }
            
            if checkList[1][i] != checkList[2][i] {
                sum += 1
            }
        }
        
        return sum
    }
    
    func dfs(_ start: Int, _ count: Int) {
        if count == 3 {
            // 판단.
            answer = min(answer, check())
            return
        }
        
        for i in start..<input.count {
            visited[i] = true
            dfs(i + 1, count + 1)
            visited[i] = false
        }
    }
    
    dfs(0, 0)
    print(answer)
}

*/
3
3
ENTJ INTP ESFJ
4
ESFP ESFP ESFP ESFP
5
INFP INFP ESTP ESTJ ISTJ
/*

// 8
// 0
// 4
