import Foundation

// 1번 목표가 우선이고, 2번 목표는 그 다음입니ㅏㄷ.
// 1. 이모티콘 플러스 가입자를 최대한 늘리는 것
// 2. 판매액을 최대한 늘리는 것

// n명의 사용자들에게 이모티콘m개를 할인해서 판매. 10, 20, 30, 40% 할인 중 하나로 설정.

// 사용자들은 자신의 기준에 따라 일정 비율 이상 할인하는 이모티콘을 모두 구매
// 구매 비용의 합이 일정 가격 이상이라면 모두 취소하고 이모티콘 플러스에 가입
func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    // emoticons <= 7
    // 10~40 할인율을 모두 적용해가면서 가입자가 가장 많고 판매액이 높은 경우를 반환
    // 완전 탐색
    
    var maxJoinUser: Int = 0
    var maxSales: Int = 0
    
    let rates: [Int] = [10, 20, 30, 40]
    
    func dfs(array: [Int]) {
        if array.count == emoticons.count {
            // 해당 비율을 가진 이모티콘에 대해서 가입자와 판매액을 측정
            
            var joinUser: Int = 0
            var totalSales: Int = 0
            
            for i in 0..<users.count {
                var sales: Int = 0
                
                for j in 0..<emoticons.count {
                    if users[i][0] <= array[j] {
                        sales += emoticons[j] - emoticons[j] * array[j] / 100
                    }
                }
                
                if sales >= users[i][1] {
                    joinUser += 1
                } else {
                    totalSales += sales
                }
            }
            
            if maxJoinUser < joinUser {
                maxJoinUser = joinUser
                maxSales = totalSales
            } else if maxJoinUser == joinUser {
                if maxSales <= totalSales {
                    maxSales = totalSales
                }
            }
            
            return
        }
        
        for i in 0..<4 {
            dfs(array: array + [rates[i]])
        }
    }
    
    dfs(array: [])
    
    return [maxJoinUser, maxSales]
}

print(solution([[40, 10000], [25, 10000]], [7000, 9000]))
// [1, 5400]
print(solution([[40, 2900], [23, 10000], [11, 5200], [5, 5900], [40, 3100], [27, 9200], [32, 6900]], [1300, 1500, 1600, 4900]))
// [4, 13860]
