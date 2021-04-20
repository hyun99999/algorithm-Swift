프로그래머스 두 개 뽑아서 더하기 알고리즘 풀이

코딩테스트 연습 > 정렬 > Level1 > 두 개 뽑아서 더하기

https://programmers.co.kr/learn/courses/30/lessons/68644

## 두 개 뽑아서 더하기
<img src ="https://user-images.githubusercontent.com/69136340/114298296-a1a97d00-9af0-11eb-8daa-43e31c8611f5.png" width ="400">

```swift
import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var set: Set<Int> = []
    for i in 0..<numbers.count-1 {
        for j in i+1..<numbers.count{
            set.insert(numbers[i]+numbers[j])
        }
    }
    return set.sorted()
}
```

## 중요 포인트

- 가장 중요한 포인트는 중복된 수를 인정해주지 않는 입출력 예제이다. 더한 수가 중복됨을 피하기 위해서 `Set` 를 사용해야 한다.

- 완전탐색을 위해서 중복반복문을 활용.
