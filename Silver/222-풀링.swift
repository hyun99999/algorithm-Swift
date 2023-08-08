// 정사각형의 네 원소를 크기순으로 배열하고 두번째 수로 압축.
// 이를 통해 크기를 1*1으로 만들때 남는 수를 구하시오.

let n: Int = Int(readLine()!) ?? 0

var board: [[Int]] = Array(repeating: [], count: n)

for i in 0..<n {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    
    board[i] = input
}
// MARK: - 입력끝.

func recursion(_ row: Int, _ col: Int, _ size: Int) -> Int {
    if size == 2 {
        // 2*2
        // 두 번째 큰 수를 리턴.
        var arr: [Int] = []
        
        for i in row..<2 + row {
            for j in col..<2 + col {
                arr.append(board[i][j])
            }
        }
        arr.sort(by: >)
        
        return arr[1]
    } else {
        let size: Int = size / 2
        var arr: [Int] = [0, 0, 0, 0]
        
        arr[0] = recursion(row, col, size)
        arr[1] = recursion(row, col + size, size)
        arr[2] = recursion(row + size, col, size)
        arr[3] = recursion(row + size, col + size, size)
        
        arr.sort(by: >)
        
        return arr[1]
    }
}

print(recursion(0, 0, n))

/*
4
-6 -8 7 -4
-5 -5 14 11
11 11 -1 -1
4 9 -2 -4
*/

// 답: 11
