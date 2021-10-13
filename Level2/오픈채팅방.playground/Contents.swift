import Foundation
/*
- userDictionary : 유저아이디를 키, 닉네임을 값으로 가지는 딕셔너리
- record : 입력값을 받아서 [커맨드, 유저아이디, 닉네임] 혹은 [커맨드, 유저아이디] 로 분리한 이중배열
- chatLog : [커맨드, 유저아이디] 를 가지는 이중배열. 채팅결과를 만들기 위한 목적.
- result : 결과 변수
*/
func solution(_ record:[String]) -> [String] {
    var userDictionary = [String: String]()
    let record = record.map { $0.components(separatedBy: " ") }
    // 위와 동일한 코드. let record = record.map{$0.split(separator: " ").map{String($0)}}
    var chatLog = [[String]]()
    var result = [String]()

    record.forEach {
        if $0[0] == "Enter" {
            // 유저아이디를 키, 닉네임을 값으로 가지는 딕셔너리 추가
            userDictionary[$0[1]] = $0[2]
            // "000님이 들어왔습니다." 를 만들기 위해 유저아이디와 닉네임을 추가
            chatLog.append(contentsOf: [[$0[0], $0[1]]])
        } else if $0[0] == "Change" {
            // 유저아이디(키)를 가지고 닉네임(값) 변경
            userDictionary.updateValue($0[2], forKey: $0[1])
        } else {
            // "000님이 나갔습니다." 를 만들기 위해 유저아이디와 닉네임을 추가
            chatLog.append(contentsOf: [[$0[0], $0[1]]])
        }
    }
    
    chatLog.forEach {
        if $0[0] == "Enter" { result.append("\(userDictionary[$0[1]]!)님이 들어왔습니다.") }
        else { result.append("\(userDictionary[$0[1]]!)님이 나갔습니다.") }
    }
    return result
}

solution(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"])
