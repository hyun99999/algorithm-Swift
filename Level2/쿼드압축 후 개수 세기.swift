import Foundation

// s라는 영역의 모든 수가 같은 값이라면 s를 해당 수로 압축.
// 그렇지 않다면 s를 4개로 균일하게 쪼개서 각 정사각형에 대해서 같은 방식의 압축을 시도.

// 배열에 최종적으로 남는 0과 1의 개수를 배열에 담아반환.
func solution(_ arr:[[Int]]) -> [Int] {
    var zeroCount: Int = 0
    var oneCount: Int = 0
    var n: Int = arr[0].count
    
    func division(_ row: Int, _ col: Int, _ n: Int) {
        let number: Int = arr[row][col]
        
        for i in row..<row + n {
            for j in col..<col + n {
                if number != arr[i][j] {
                    // s 영역에서 숫자가 일치하지 않기 때문에 분할.
                    // 1사분면
                    division(row, col, n / 2)
                    // 2사분면
                    division(row, col + n / 2, n / 2)
                    // 3사분면
                    division(row + n / 2, col, n / 2)
                    // 4사분면
                    division(row + n / 2, col + n / 2, n / 2)
                    
                    return
                }
            }
        }
        
        // s 영역에서 숫자가 일치하기 때문에 해당 영역의 숫자를 통합하여 카운트.
        if number == 0 {
            zeroCount += 1
        } else if number == 1 {
            oneCount += 1
        }
    }
    
    division(0, 0, n)
    
    return [zeroCount, oneCount]
}

print(solution([[1,1,0,0],[1,0,0,0],[1,0,0,1],[1,1,1,1]]))
// [4, 9]
