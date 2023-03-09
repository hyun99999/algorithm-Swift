import Foundation

// 상근이는 나무 m미터가 필요하다.
// 상근이는 새로 구입한 목재절단기를 이용해서 나무를 구할 것.
// 상근이는 절단기에 높이 h를 지정. 한줄에 있는 연속한 나무를 자름.
// 높이가 h 보다 크면 자리고 낮으면 안잘림. // h 는 0 이상
// 나무를 필요한 만큼만 가져가려 한다. 적어도 m미터의 나무를 가져가기 위해 설정할 수 있는 높이의 최댓값은?

let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
/// 나무의 수.
let n: Int = input[0]
/// 가져가려는 나무의 총 길이.
let m: Int = input[1]
let trees: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

// 파라메트릭 서치

var row: Int = 0
var high: Int = trees.max() ?? 0
var answer: Int = 0

while row <= high {
    let mid: Int = (row + high) / 2
    var sum: Int = 0
    
    for tree in trees {
        if tree - mid > 0 {
            sum += tree - mid
        }
    }
    
    if m <= sum {
        row = mid + 1
    } else {
        high = mid - 1
    }
}

print(row - 1)

/*
4 7
20 15 10 17
결과
15

5 20
4 42 40 26 46
결과
36
*/
