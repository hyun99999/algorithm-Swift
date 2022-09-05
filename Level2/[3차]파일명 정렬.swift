import Foundation

func solution(_ files:[String]) -> [String] {
    // HEAD: 문자로만 이루어진 한 문자 이상. 대소문자 구분x.
    // NUMBER: 앞쪽에 0도 가능. 한 문자 이상 다섯 문자 이하. 012 와 12는 같은 값을 처리.
    // TAIL: 나머지. 아무 글자도 없을 수 있음.
    let numberSet: CharacterSet = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    // head 와 number 의 순서를 저장.
    var headNumberOreder: [(head: String, number: Int, index: Int)] = []
    var answer: [String] = []
    
    for index in 0..<files.count {
        // 1️⃣ HEAD 분리
        
        // split 이 아닌 components 는 CharacterSet 을 파라미터로 전달받기 때문에 이런 경우에 좋음.
        let fileComponents: [String] = files[index].components(separatedBy: numberSet).filter { $0 != "" }
        let head: String = fileComponents[0]
        
        // 2️⃣ NUMBER
        
        // head 를 "" 로 변환 -> head 를 삭제.
        let removedHead: String = files[index].replacingOccurrences(of: head, with: "")
        
        var numbers: String = ""
        
        for number in removedHead {
            if number.isNumber {
                numbers.append(number)
            } else {
                break
            }
        }
        
        // number 는 012 와 12 가 동일하므로 Int 형변환.
        headNumberOreder.append((head.lowercased(), Int(numbers)!, index))
    }
    
    headNumberOreder.sort {
        if $0.head == $1.head {
            if $0.number == $1.number {
                return $0.index < $0.index
            } else {
                return $0.number < $1.number
            }
        } else {
            return $0.head < $1.head
        }
    }
    
    for tuple in headNumberOreder {
        answer.append(files[tuple.index])
    }
    
    return answer
}

print(solution(["img12.png", "img10.png", "img02.png", "img1.png", "IMG01.GIF", "img2.JPG"]))
// ["img1.png", "IMG01.GIF", "img02.png", "img2.JPG", "img10.png", "img12.png"]
