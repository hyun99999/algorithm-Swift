import Foundation

func solution(_ s:String) -> Bool {
    /*
    let s = s.lowercased()
    var pCount: Int = 0
    var yCount: Int = 0
    
    for string in s {
        switch string {
        case "p":
            pCount += 1
        case "y":
            yCount += 1
        default:
            break
        }
    }
    
    if pCount == yCount {
        return true
    } else {
        return false
    }
     */
    
    // filter 사용.
    return s.lowercased().filter { $0 == "p" }.count == s.lowercased().filter { $0 == "y" }.count
    
    //
}

print(solution("pPoooyY"))
// true
