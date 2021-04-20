프로그래머스 가운데 글자 가져오기
코딩테스트 연습 > Level1 > 연습문제 > 가운데 글자 가져오기

https://programmers.co.kr/learn/courses/30/lessons/12903

<img src ="https://user-images.githubusercontent.com/69136340/115337573-32144b80-a1dc-11eb-951a-d5d5c1a6f5f1.png" width = "400">

### Array 로 변환해서 사용
문자열 s 를 배열로 바꾸어서 쉽게 인덱스에 접근

```swift
func solution(_ s:String) -> String {
    if Array(s).count % 2 == 0 {
        //짝수
        return String(Array(s)[s.count/2 - 1...s.count/2 ])
    } else {
        //홀수
        return String(Array(s)[s.count/2])
    }
}
```
