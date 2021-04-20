프로그래머스 H-Index 알고리즘 풀이

코딩테스트 연습 > 정렬 > Level2 > H-Index

https://programmers.co.kr/learn/courses/30/lessons/42747

## 가장 큰 수
<img src ="https://user-images.githubusercontent.com/69136340/114207432-562f8b80-9997-11eb-9199-9a1bd294f392.png" width ="400">

```swift
import Foundation

func solution(_ citations:[Int]) -> Int {
    let sorted = citations.sorted(by: >)
    for h in (1...sorted.count).reversed() {
        if sorted[h-1] >= h {
            return h
        }
    }
    return 0
}
```

## enumerated() 를 통한 풀이
enumerated() : (n, x) 로 이루어진 쌍을 리턴한다. Array 안에서 값을 가져오면서 Index 값도 가져오고 싶을 때 사용.
```swift
for (index, element) in list.enumerated() {
    print("Item \(index) : \(element)")
}
```
### 알고리즘 풀이
내림차순으로 정렬했을 때 element 이상 인용한 논문이 index 개 만큼 있다. 그래서 index 가 element 이상일 때 index 만큼이 최대값에 해당.

```swift
func solution(_ citations:[Int]) -> Int {
    for (index, element) in citations.sorted(by: >).enumerated() {
        if index >= element {
            return index
        }
    }
    //모든 논문의 인용횟수가 전체 논문의 갯수보다 클 경우 논문의 갯수만큼 최대값에 해당.
    return citations.count
}
```
