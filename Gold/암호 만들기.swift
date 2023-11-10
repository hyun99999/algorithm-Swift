// 암호는 서로 다른 L개의 소문자로 구성
// 최소 한 개의 모음(a, e, i, o, u) 최소 두 개의 자음 구성
// 암호는 오름차순
// 암호가 될 수 있는 C개의 암호가 주어졌을 때 가능성 있는 암호를 모두 구하시오.

let lc: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
let cString: [String] = readLine()!.split(separator: " ").map { String($0) }.sorted()

/// 모음
let vowels: [String] = ["a", "e", "i", "o", "u"]

// dfs.

var answer: [String] = []

func dfs(consonantsCount: Int, voewlsCount: Int, index: Int, password: String) {
    if password.count == lc[0] {
        if consonantsCount >= 2 && voewlsCount >= 1 {
            answer.append(password)
        }
        
        return
    }
    
    for i in index + 1..<cString.count {
        if vowels.contains(cString[i]) {
            dfs(consonantsCount: consonantsCount, voewlsCount: voewlsCount + 1, index: i, password: password + cString[i])
        } else {
            dfs(consonantsCount: consonantsCount + 1, voewlsCount: voewlsCount, index: i, password: password + cString[i])
        }
    }
}

for i in 0..<cString.count {
    if vowels.contains(cString[i]) {
        dfs(consonantsCount: 0, voewlsCount: 1, index: i, password: cString[i])
    } else {
        dfs(consonantsCount: 1, voewlsCount: 0, index: i, password: cString[i])
    }
}

answer.forEach { print($0) }

/*
4 6
a t c i s w
*/

/*
acis
acit
aciw
acst
acsw
actw
aist
aisw
aitw
astw
cist
cisw
citw
istw
*/
