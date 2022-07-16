func solution(_ str1:String, _ str2:String) -> Int {
    let str1: [String] = str1.lowercased().map { String($0) }
    let str2: [String] = str2.lowercased().map { String($0) }
    
    // 자카드 유사도 J(A, B)
    // A n B.count / A u B.count
    // 모두 공집합일 경우 1.
    // 다중 집합에 대해서도 확장 가능.
    // 문자열에 적용할떄는 두 글자씩 끊어서.
    var answer: Double = 0.0
    var str1J: [String] = []
    var str2J: [String] = []
    
    // 자카드 유사도 구현.
    for n in 0..<str1.count - 1 {
        if Character(str1[n]).isLetter && Character(str1[n + 1]).isLetter {
            let str = str1[n] + str1[n + 1]
            str1J.append(str)
        }
    }
    
    for n in 0..<str2.count - 1 {
        if Character(str2[n]).isLetter && Character(str2[n + 1]).isLetter {
            let str = str2[n] + str2[n + 1]
            str2J.append(str)
        }
    }

    if str1J.count == 0 && str2J.count == 0 {
        // 나눗셈이 성립되지 않는 경우 1 반환.
        answer = 1
    } else {
        answer = intersection(str1: str1J, str2: str2J) / union(str1: str1J, str2: str2J)
    }
    
    return Int(answer * 65536)
}

/// 교집합
func intersection(str1: [String], str2: [String]) -> Double {
    var str: [String] = []
    var str2 = str2
    
    for string in str1 {
        if let index = str2.firstIndex(of: string) {
            str.append(string)
            str2.remove(at: index)
        }
    }
    
    return Double(str.count)
}

/// 합집합
func union(str1: [String], str2: [String]) -> Double {
    var str: [String] = []
    var str2 = str2
    str = str1
    for string in str1 {
        if let index = str2.firstIndex(of: string) {
            str2.remove(at: index)
        }
    }
    str += str2
    
    return Double(str.count)
}


print(solution("FRANCE", "french"))
// 16384

print(solution("E=M*C^2", "e=m*c^2"))
// 65536

print(solution("aa1+aa2", "AAAA12"))
// 43690

print(solution("handshake", "shake hands"))
// 65536
