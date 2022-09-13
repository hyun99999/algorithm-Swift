import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    // 아이디 당 하나의 * 문자 사용
    // 제재 아이디 목록을 가지고 응모자 아이디에서 제외하기
    // * 문자때문에 경우의 수가 발생하는데 이때 경우의 수를 반환.
    var combinationArray: [[Int]] = []
    
    // ✅ 아이디어 : 각 제재 아이디 목록이 가진 경우들의 조합 구하기
    
    /// bannedID 에 해당하는 응모 아이디 인덱스 목록.
    var bannedIDCount: [[Int]] = Array(repeating: [], count: banned_id.count)
    
    /// userID 와 bannedID 가 일치하는지 확인.
    func isEqual(userID: String, to bannedID: String) -> Bool {
        let userID: [String] = userID.map { String($0) }
        let bannedID: [String] = bannedID.map { String($0) }
        
        if userID.count != bannedID.count {
            return false
        }
        
        for j in 0..<bannedID.count {
            if bannedID[j] != "*" && userID[j] != bannedID[j] {
                return false
            }
        }
        
        return true
    }
    
    for i in 0..<banned_id.count {
        for j in 0..<user_id.count {
            if isEqual(userID: user_id[j], to: banned_id[i]) {
                bannedIDCount[i].append(j)
            }
        }
    }
    
    // 조합을 통해 경우의 수 구하기
    func combination(_ bannedIndex: Int, _ array: [Int]) {
        if bannedIndex == bannedIDCount.count {
            // 중복된 조합을 가져가지 않기 위해서
            let sortedArray = array.sorted()
            if !combinationArray.contains(sortedArray) {
                combinationArray.append(sortedArray)
            }
            return
        }
        
        for j in 0..<bannedIDCount[bannedIndex].count {
            if !array.contains(bannedIDCount[bannedIndex][j]) {
                combination(bannedIndex + 1, array + [bannedIDCount[bannedIndex][j]])
            }
        }
        
    }
    
    combination(0, [])
    
    return combinationArray.count
}

print(solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["fr*d*", "abc1**"]))
// 2

print(solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["*rodo", "*rodo", "******"]))
// 2

print(solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["fr*d*", "*rodo", "******", "******"]))
// 3
