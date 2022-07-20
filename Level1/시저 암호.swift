func solution(_ s:String, _ n:Int) -> String {
    var result = ""
    let strLower = Array("abcdefghijklmnopqrstuvwxyz")
    let strUpper = Array("abcdefghijklmnopqrstuvwxyz".uppercased())
    
    for str in s {
        if str == " " {
            result += " "
        } else {
            if strLower.contains(str) {
                result += String(strLower[(strLower.firstIndex(of: str)! + n) % 26])
            } else {
                result += String(strUpper[(strUpper.firstIndex(of: str)! + n) % 26])
            }
        }
    }
    return result
}

print(solution("a B z", 4))

// 문자를 아스키 코드 값으로 변환.
// let asciiVale = Character(s[i]).asciiValue!
// 아스키 코드 값을 연산 후, String 으로 변환.
// let unicode = UnicodeScalar(asciiValue + n)!
