// 메모장에서 비밀번호를 찾는 프로그램을 만드리고 했다.
// 사이트 주소는 알파벳 소문자, 대문자, -, . 로 이루어짐.
// 중복되지 않고 비밀번호는 알파벳 대문자.
// 주소와 비밀번호 모두 최대 20자.

// <= 100,000
let nm: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

var sites: [String : String] = [:]

for _ in 0..<nm[0] {
    let input: [String] = readLine()!.split(separator: " ").map { String($0) }
        
    sites[input[0], default: ""] = input[1]
}

var answer: [String] = []

for _ in 0..<nm[1] {
    let input: String = readLine()!
    
    answer.append(sites[input, default: ""])
}

answer.forEach { print($0) }


/*
 16 4
 noj.am IU
 acmicpc.net UAENA
 startlink.io THEKINGOD
 google.com ZEZE
 nate.com VOICEMAIL
 naver.com REDQUEEN
 daum.net MODERNTIMES
 utube.com BLACKOUT
 zum.com LASTFANTASY
 dreamwiz.com RAINDROP
 hanyang.ac.kr SOMEDAY
 dhlottery.co.kr BOO
 duksoo.hs.kr HAVANA
 hanyang-u.ms.kr OBLIVIATE
 yd.es.kr LOVEATTACK
 mcc.hanyang.ac.kr ADREAMER
 startlink.io
 acmicpc.net
 noj.am
 mcc.hanyang.ac.kr
 */


/*
THEKINGOD
UAENA
IU
ADREAMER
*/
