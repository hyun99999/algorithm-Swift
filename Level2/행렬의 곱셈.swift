import Foundation

// 2차원 행렬 곱셈.

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var answer: [[Int]] = Array(repeating: Array(repeating: 0, count: arr2[0].count), count: arr1.count)
    
    // 결과 2차원 행렬.
    // 곱을 위해서는 arr1 의 열과 arr2 의 행이 같아야 한다.
    for arr1Row in arr1.indices {
        for arr2Col in arr2[0].indices {
            for arr1Col in arr1[0].indices {
                answer[arr1Row][arr2Col] += arr1[arr1Row][arr1Col] * arr2[arr1Col][arr2Col]
            }
        }
    }

    return answer
}

print(solution([[2, 3, 2], [4, 2, 4], [3, 1, 4]], [[5, 4, 3], [2, 4, 1], [3, 1, 1]]))
// [[22, 22, 11], [36, 28, 18], [29, 20, 14]]
