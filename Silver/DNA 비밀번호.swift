// dna 문자열은 "A C G T" 문자만으로 이루어짐
// dna 문자열을 만들고, 부분문자열을 비밀번호로 사용

// AAAA 취약한 비밀번호를 방지하기 위해서 문자의 개수가 특정 개수 이상이어야 한다는 규칙.
// 민호가 만들 수 있는 비밀번호의 종류의 수를 구하시오.

let sp: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
/// dna 문자열 길이
let s: Int = sp[0]
/// 비밀번호로 사용할 부분문자열의 길이
let p: Int = sp[1]
let dna: [String] = readLine()!.map { String($0) }
/// a c g t 가 가질 최소 개수
let min: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

var a: Int = 0
var c: Int = 0
var g: Int = 0
var t: Int = 0

// 슬라이딩 윈도우
var answer: Int = 0

func plus(_ str: String) {
    if str == "A" {
        a += 1
    }
    if str == "C" {
        c += 1
    }
    if str == "G" {
        g += 1
    }
    if str == "T" {
        t += 1
    }
}

func minus(_ str: String) {
    if str == "A" {
        a -= 1
    }
    if str == "C" {
        c -= 1
    }
    if str == "G" {
        g -= 1
    }
    if str == "T" {
        t -= 1
    }
}

func check() {
    if a >= min[0] &&
        c >= min[1] &&
        g >= min[2] &&
        t >= min[3] {
        answer += 1
    }
}

for i in 0..<p {
    plus(dna[i])
}

check()

for i in 0..<s - p {
    minus(dna[i])
    plus(dna[i + p])
    check()
}

print(answer)

/*
 4 2
 GATA
 1 0 0 1
 */

// 2
