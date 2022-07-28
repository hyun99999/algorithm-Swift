func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var answer: [[Int]] = Array(repeating: Array(repeating: 0, count: arr1[0].count), count: arr1.count)
    
     for row in arr1.indices {
         for col in arr1[0].indices {
             answer[row][col] = arr1[row][col] + arr2[row][col]
         }
     }
    
    return answer
}

print(solution([[1,2],[2,3]], [[3,4],[5,6]]))
// [[4,6],[7,9]]
