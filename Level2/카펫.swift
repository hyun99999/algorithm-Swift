import Foundation

// 카펫의 가로길이 >= 세로길이.
func solution(_ brown: Int, _ yellow: Int) -> [Int] {
    // 가로길이 >= 3. 세로길이 >= 3.
    // 아이디어 : brown 개수는 2 * (가로 + (세로 - 2)) 를 충족 해야함.
    var row: Int = 3
    var col: Int = 3
    
    let sum = brown + yellow
    
    for i in 3...sum {
        if sum % i == 0 {
            row = i
            col = sum / i
        }
        
        if brown == 2 * (row + col - 2) {
            break
        }
    }
    return [col, row]
}

print(solution(24, 24))
// [8, 6]
