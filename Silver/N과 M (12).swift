// n개의 자연수와 자연수 m이 주어질 때, 아래 조건을 만족하는 길이가 m인 수열을 모두 구하시오.

// n개의 자연수 중에서 m개를 고른 수열
// 같은 수를 여러번 골라도 됨.
// 고른 수열은 오름차순이어야 한다.

// nm 모두 8이하.
let nm: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
let nList: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }.sorted(by: <)

// MARK: - 입력 끝

// 최대 8^8
// 길이가 m인 중복 조합 만들기.

var answer: [[Int]] = []

func combination(_ arr: [Int], _ count: Int, _ start: Int) {
    if nm[1] == count {
        if !answer.contains(arr) {
            answer.append(arr)
        }
        return
    }
    
    for i in start..<nm[0] {
        // 중복 가능.
        combination(arr + [nList[i]], count + 1, i)
    }
}

combination([], 0, 0)

// MARK: - 출력

answer.forEach {
    print($0.map { String($0) }.joined(separator: " "))
}

/*
4 2
9 7 9 1
*/

/*
1 1
1 7
1 9
7 7
7 9
9 9
*/
