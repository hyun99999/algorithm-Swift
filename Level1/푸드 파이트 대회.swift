import Foundation

func solution(_ food:[Int]) -> String {
    // 한 선수는 왼쪽 -> 오른쪽
    // 다른 선수는 오른쪽 -> 왼쪽
    // 중앙에는 물 배치. 물을 먼저 마시면 승리.
    
    // 칼로리가 낮은 음식을 먼저 배치.
    // 음식의 종류, 양, 순서도 동일.
    
    var leftFoods: String = ""
    
    for i in 1..<food.count {
        if food[i] / 2 > 0 {
            for _ in 0..<(food[i] / 2) {
                leftFoods.append(String(i))
            }
        }
    }
    
    let rightFoods: String = String(leftFoods.reversed())
    
    // 반환. 낮은 음식 순서 + 물 + 낮은 음식 순서.reversed()
    return "\(leftFoods)0\(rightFoods)"
}

print(solution([1, 3, 2, 3]))
