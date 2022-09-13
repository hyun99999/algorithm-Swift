import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    // 무작위 자연수를 a와 b팀에서 비교
    // 숫자가 큰 쪽이 승리. 1점 획득
    // 숫자가 같다면 승점 없음.
    // a 를 보고 B팀에서 최종 승점을 높이는 조합을 짜서 얻는 승점은?
    
    // b팀이 승점을 하나도 못 얻는 경우
    var sortedA = a.sorted()
    let sortedB = b.sorted()
    
    sortedB.forEach {
        if $0 > sortedA.first! {
            sortedA.removeFirst()
        }
    }
    
    return a.count - sortedA.count
}

print(solution([5,1,3,7], [2,2,6,8]))
