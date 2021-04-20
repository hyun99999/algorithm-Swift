프로그래머스 체육관 알고리즘 풀이

코딩테스트 연습 > 그리디 > Level1 > 체육복

https://programmers.co.kr/learn/courses/30/lessons/42862

## 체육복

<img src ="https://user-images.githubusercontent.com/69136340/114821109-061f5180-9dfb-11eb-873a-2dd250ff37d6.png" width ="400">
<img src ="https://user-images.githubusercontent.com/69136340/114821123-0ae40580-9dfb-11eb-9934-e372221f1de6.png" width ="400">

배열로 학생들의 체육복 유무 표현.

```swift
import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    //빌리지 못한 학생
    var count = 0
    
    //기본 한벌을 가진 학생들 초기화
    var students = [Int](repeating: 1, count: n)
    //도난
    for i in lost {
        students[i-1] = 0
    }
    //여벌
    for i in reserve {
        students[i-1] += 1
    }
    
    for i in 0..<n {
        if students[i] == 0 {
        //앞번호
            if i > 0 && students[i-1] > 1 {
                students[i] = 1
                students[i-1] -= 1
            }
            //뒷번호
            else if i < n-1 && students[i+1] > 1 {
                students[i] = 1
                students[i+1] -= 1
            } else {
                //빌리지 못한 학생
                count += 1
            }
        }
    }

    
    return n - count
}
```

## filter, contains 함수를 사용한 다른 풀이

```swift
func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    //도난 학생과 여벌이 있는 학생이 같다면 빈 배열 출력.
    var losted = lost.filter { !reserve.contains($0) }
    var reserved = reserve.filter { !lost.contains($0) }
    
    //losted : 도난당했지만 여벌이 있다면 삭제
    //reserved : 여벌이 있었는데 도난당했다면 삭제
    
    //도난 후 빌려주기 전 수업 가능한 학생의 수
    var ans = n-losted.count
    
    for i in 0..<losted.count {
        var has : Int?
        for j in 0..<reserved.count {
            //reserved 의 앞뒤 번호에 losted 가 있다.
            if losted[i] == reserved[j]-1 || losted[i] == reserved[j]+1 {
                has = j
                break
            }
        }
        //빌려줄 수 있다. 그래서 reserved 에서 삭제. 수업가능한 학생 증가
        if let index = has {
            reserved.remove(at: index)
            ans += 1
        }
        
    }
    return ans
}
```
이게 근사하게나마 조금 느렸다.
