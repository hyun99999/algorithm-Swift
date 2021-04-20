프로그래머스 문자열 내림차순으로 배치하기 알고리즘 풀이

코딩테스트 연습 > 연습문제 > Level1 > 문자열 내림차순으로 배치하기

https://programmers.co.kr/learn/courses/30/lessons/12917

## 풀이

<img src ="https://user-images.githubusercontent.com/69136340/115349945-6cd3af00-a1ef-11eb-81b9-da8b2713edc8.png" width ="400">

```swift
import Foundation

func solution(_ s:String) -> String {
    return String(s.sorted(by: >))
}
```
sorted(by:) 함수를 활용해서 정렬하였다. 문자열도 가능하고 대문자는 소문자보다 **작은 값** 으로 취급된다.
