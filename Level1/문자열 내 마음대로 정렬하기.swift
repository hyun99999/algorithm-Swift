func solution(_ strings:[String], _ n:Int) -> [String] {
    /*
    let index: String.Index = strings[0].index(strings[0].startIndex, offsetBy: n)
    
    return strings.sorted {
        if $0[index] == $1[index] {
            return $0 < $1
        } else {
            return $0[index] < $1[index]
        }
    }
    */
    
    // [String.Element] 타입으로 변경 후, 서브스크립트로 배열처럼 접근 가능.
    let _: [String.Element] = Array("dd")
    
    // 다른 풀이
    return strings.sorted{ Array($0)[n] == Array($1)[n] ? $0 < $1 :  Array($0)[n] < Array($1)[n] }
}


print(solution(["sun", "bed", "car"], 1))
// ["car", "bed", "sun"]

print(solution(["abce", "abcd", "cdx"], 2))
// ["abcd", "abce", "cdx"]
