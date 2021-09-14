import Foundation

func solution(_ s:String) -> Int {
    let numberList: [String : [Int]] = ["ze" : [4,0], "on" : [3,1], "tw" : [3,2], "th" : [5,3], "fo" : [4,4], "fi" : [4,5], "si" : [3,6], "se" : [5,7], "ei" : [5,8], "ni" : [4,9]]
    var answer = ""

    let string = s.map { $0 }

    var index = 0
    while index < s.count {
        if string[index].isNumber {
            answer += String(string[index])
            index += 1
        } else {
            let stringNumber = String(string[index...index+1])
            answer += String(numberList[stringNumber]![1])
            index += numberList[stringNumber]![0]
        }
    }
    
    /*
    // replacingOccurences 메서드 사용하기
    // hash 라는 배열을 순환해야하기 때문에 시간이 조금 더 걸릴 것으로 예상.
    // 실제로 위의 코드는 0.1 초대였는데 아래의 코드는 0.2 초대의 시간이 걸리는 문제 케이스가 있었다.
    let hash = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    var answer = s
    for i in 0...9 {
        answer = answer.replacingOccurrences(of: hash[i], with: String(i))
    }
    */
    return Int(answer)!
}

solution("one4seveneight")
