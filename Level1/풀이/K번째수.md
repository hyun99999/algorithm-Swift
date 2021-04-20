프로그래머스 K번째수 알고리즘 풀이

코딩테스트 연습 > 정렬 > Level1 > K번째수

https://programmers.co.kr/learn/courses/30/lessons/42748

## K번째수
<img src ="https://user-images.githubusercontent.com/69136340/113729043-9a215700-9731-11eb-8bcd-7d11ebe4fd72.png" width ="400">

```swift
import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    return commands.map{ array[$0[0]-1...$0[1]-1].sorted()[$0[2]-1] }
}
```

## Map
컨테이너가 담고 있던 각각의 값을 매개변수를 통해서 받은 함수에 적용한 후 새로운 컨테이너를 생성하여 반환.

for-in 구문과 사용하는 것이 비슷하나 코드가 더 짧고 성능의 차이가 있다.

## sorted
- sort() 와는 다르게 원본 배열을 건드리지 않는다. 새로운 배열을 반환.
- `.sorted(by: <)` : 오름차순.  default 다.
-  `.sorted(by: >)` : 내림차순

정수에만 국한된 것이 아닌 String 도 가능하다.

**sorted() 를 통해서 반환한 배열의 index 를 설정하여서 문제를 해결 할 수 있다.**

### 출처
출처ㅣhttps://velog.io/@hansangjin96/Swift-sort

출처ㅣhttps://zetal.tistory.com/entry/swift-기초문법-15-맵Map-필터Filter-리듀스Reduce
