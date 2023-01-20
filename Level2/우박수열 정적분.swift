import Foundation

// 콜라츠 추측.
// 모든 자연수 n 에 대해서 다음의 작업을 반복하면 항상 1로 만들 수 있다.
// 1-1. 입력된 수가 짝수 -> 2로 나눈다.
// 1-2. 입력된 수가 홀수 -> 3을 곱하고 1을 더한다.
// 2. 결과로 나온 수가 1보다 크면 1번 작업을 반복.

// x=0 일때, y=k
// 횟수 만큼 x 증가. y 는 우박수.
// 우박 수열 정적분 : x=a, x=b, y=0 으로 둘러쌓인 공간의 면적.
// 0부터 5까지가 x 좌표라면.
// [0,0] 는 전체 구간에 대한 정적분. [1,-2]는 1<=x<=3 구간에 대한 정적분.
// 즉, 구간의 시작은 음이 아닌 정수. 구간의 끝은 양이 아닌 정수로 표현.

// 아이디어: 우선 초항 K 에 대해서 x좌표 0부터 y가 1이 도는 좌표 구하기.
// 단, 주어진구간에 따라 시작점이 끝점보다 큰 경우는 -1 반환.
func solution(_ k:Int, _ ranges:[[Int]]) -> [Double] {
    var answer: [Double] = []
    var locations: [(x: Int, y: Int)] = [(0, k)]
    var k = k
    var x = 0
    
    while k > 1 {
        if k % 2 == 0 {
            k /= 2
        } else {
            k = k * 3 + 1
        }
        x += 1
        locations.append((x, k))
    }
    
    for range in ranges {
        if locations.count - 1 + range[1] >= range[0] {
            let array: [(x:Int, y:Int)] = Array(locations[range[0]...locations.count - 1 + range[1]])
            answer.append(calculate(with: array))
        } else {
            answer.append(-1.0)
        }
    }
    
    return answer
}

/// 정적분.
func calculate(with array: [(x:Int, y:Int)]) -> Double {
    var area: Double = 0.0
    
    if array.count == 1 {
         return area
    }
    
    for index in 0..<array.count - 1 {
        // x 좌표 간의 간격은 1.
        
        // 직사각형 계산.
        area += Double(min(array[index].y, array[index + 1].y))
        // 직삼각형 계산.
        area += Double(abs(array[index].y - array[index + 1].y)) / 2
    }
    
    return area
}

print(solution(5, [[0,0],[0,-1],[2,-3],[3,-3]]))
// [33.0,31.5,0.0,-1.0]
