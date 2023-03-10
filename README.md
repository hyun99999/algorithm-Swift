🫠 ***Swift 알고리즘 대작전***

> DFS : `stack, 재귀`

> BFS : `queue, while 문`

- 시간 다루기
```swift
/// 초 단위로 시간을 변환.
func changeToSecond(_ time: String) -> Int {
    let times: [Int] = time.components(separatedBy: ":").map { Int($0)! }
    
    return times[0] * 3600 + times[1] * 60 + times[2]
}

/// 초 단위를 시간으로 변환.
func changeToTime(_ seconds: Int) -> String {
    return "\(addZero(to: seconds / 3600)):\(addZero(to: seconds % 3600 / 60)):\(addZero(to: seconds % 60))"
}

/// 한 자릿수 시간에 0 추가
func addZero(to number: Int) -> String {
    return number < 10 ? "0\(number)" : "\(number)"
}
```

- permutation(순열)
```swift
    /// index 로 조합 생성
    func permutation(_ array: [Int]) {
        if array.count == dungeons.count {
            permutationArray.append(array)
            return
        } else {
            for i in 0..<dungeons.count {
                if !array.contains(i) {
                    permutation(array + [i])
                }
            }
        }
    }
    
    permutation([])
    
    // permutationArray
    // [[0,1,2], [0,2,1], [1,0,2], [1,2,0], [2,0,1], [2,1,0]]
```

- 효율성을 위한 이진탐색

```swift
var low = 0
var mid = 0
var high = scores.count - 1
            
while low <= high {
  mid = (low + high) / 2
  // scores[mid] 를 포함하는 경우 low 가 아닌 high 를 빼서 result 에 추가해야 한다.
  if scores[mid] < score {
    low = mid + 1
  } else {
    high = mid - 1
  }
  // low 가 정답.
}
```

- split, components

```swift
let s: [String.SubSequence] = s.split(separator: " ")
// components 를 사용하게 되면 Foundation 을 import 해주어야 합니다.
// split 좀 더 많은 인자를 사용할 수 있다.
let s: [String] = s.components(separatedBy: " ")

let numbers: CharacterSet = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
for index in 0..<files.count {
    // split 이 아닌 components 는 CharacterSet 을 파라미터로 전달받기 때문에 이런 경우에 좋음.
    let fileComponents: [String] = files[index].components(separatedBy: numbers).filter { $0 != "" }
}
```

- dictionary sort

```swift
// ✅ dictionary 를 정렬하기 위해서 Array 로 변환 후 오름차순 정렬.
let sortedGenres: [String] = Array(dictionary.keys).sorted(by: <)
// 위의 코드는 keys 를 기준으로 정렬하게 된다.
// 아래의 코드는 value 르 기준으로 정렬하게 된다.
let sortedGenres: [String] = Array(dictionary.keys).sorted { dictionary[$0] < dictionary[$1] }
```

- array slicing

```swift
// 아래와 같이 Array 를 사용하여 배열을 자를 수 있다.
Array(stack[0..<(stack.count - 4)])
```

> 백준

[![Solved.ac프로필](http://mazassumnida.wtf/api/v2/generate_badge?boj=ypsophila97)](https://solved.ac/ypsophila97)

|    문제                   |   난이도   |   풀이   |  날짜   |  알고리즘  |
| :----------------------: | :------: | :-------: |:-------:|:-------:|
|   [행렬](https://www.acmicpc.net/problem/1080)       |   <img src="https://static.solved.ac/tier_small/10.svg" width ="15"> |   [🥈](https://github.com/hyun99999/algorithm-Swift/blob/master/Silver/행렬.swift)    | `23.03.10`  | 그리디 |
|   [아기상어](https://www.acmicpc.net/problem/16236)       |   <img src="https://static.solved.ac/tier_small/14.svg" width ="15"> |   [🥇](https://github.com/hyun99999/algorithm-Swift/blob/master/Gold/아기상어.swift)    | `23.03.10`  | bfs |
|   [나무 자르기](https://www.acmicpc.net/problem/2805)       |   <img src="https://static.solved.ac/tier_small/9.svg" width ="15"> |   [🥈](https://github.com/hyun99999/algorithm-Swift/blob/master/Silver/나무%20자르기.swift)    | `23.03.09`  | 파라메트릭 서치 |
|   [지름길](https://www.acmicpc.net/problem/1446)       |   <img src="https://static.solved.ac/tier_small/10.svg" width ="15"> |   [🥈](https://github.com/hyun99999/algorithm-Swift/blob/master/Silver/지름길.swift)    | `23.03.09`  | 다익스트라, 최단거리 |
|   [친구](https://www.acmicpc.net/problem/1058)       |   <img src="https://static.solved.ac/tier_small/9.svg" width ="15"> |   [🥈](https://github.com/hyun99999/algorithm-Swift/blob/master/Silver/친구.swift)    | `23.03.08`  | 플로이드-워셜, 최단거리 |
|   [볼 모으기](https://www.acmicpc.net/problem/17615)       |   <img src="https://static.solved.ac/tier_small/10.svg" width ="15"> |   [🥈](https://github.com/hyun99999/algorithm-Swift/blob/master/Silver/볼%20모으기.swift)    | `23.03.08`  | 그리디 |
|   [우체국](https://www.acmicpc.net/problem/2141)       |   <img src="https://static.solved.ac/tier_small/12.svg" width ="15"> |   [🥇](https://github.com/hyun99999/algorithm-Swift/blob/master/Gold/우체국.swift)    | `23.03.08`  | 그리디 |
|   [발전소 설치](https://www.acmicpc.net/problem/1277)       |   <img src="https://static.solved.ac/tier_small/12.svg" width ="15"> |   [🥇](https://github.com/hyun99999/algorithm-Swift/blob/master/Gold/발전소%20설치.swift)    | `23.03.07`  | 그리디 |
|   [꿀 따기](https://www.acmicpc.net/problem/21758)       |   <img src="https://static.solved.ac/tier_small/11.svg" width ="15"> |   [🥇](https://github.com/hyun99999/algorithm-Swift/blob/master/Gold/꿀%20따기.swift)    | `23.03.06`  | 그리디 |
|   [회전 초밥](https://www.acmicpc.net/problem/2531)       |   <img src="https://static.solved.ac/tier_small/10.svg" width ="15"> |   [🥈](https://github.com/hyun99999/algorithm-Swift/blob/master/Silver/회전%20초밥.swift)    | `23.03.06`  | 투포인터 |
|   [가장 긴 짝수 연속한 부분 수열(large)](https://www.acmicpc.net/problem/22862)       |   <img src="https://static.solved.ac/tier_small/11.svg" width ="15"> |   [🥇](https://github.com/hyun99999/algorithm-Swift/blob/master/Gold/가장%20긴%20짝수%20연속한%20부분%20수열(large).swift)    | `23.03.05`  | 투 포인터 |
|   [두 용액](https://www.acmicpc.net/problem/2470)       |   <img src="https://static.solved.ac/tier_small/11.svg" width ="15"> |   [🥇](https://github.com/hyun99999/algorithm-Swift/blob/master/Gold/두%20용액.swift)    | `23.03.01`  | 투 포인터 |
|   [배](https://www.acmicpc.net/problem/1092)       |   <img src="https://static.solved.ac/tier_small/11.svg" width ="15"> |   [🥇](https://github.com/hyun99999/algorithm-Swift/blob/master/Gold/배.swift)    | `23.03.01`  | 그리디 |
|   [숨바꼭질2](https://www.acmicpc.net/problem/12851)       |   <img src="https://static.solved.ac/tier_small/12.svg" width ="15"> |   [🥇](https://github.com/hyun99999/algorithm-Swift/blob/master/Gold/숨바꼭질2.swift)    | `23.02.24`  | BFS, 최단 거리 |
|   [가장 긴 짝수 연속한 부분 수열(small)](https://www.acmicpc.net/problem/22857)       |   <img src="https://static.solved.ac/tier_small/9.svg" width ="15"> |   [🥈](https://github.com/hyun99999/algorithm-Swift/blob/master/Silver/가장%20긴%20짝수%20연속한%20부분%20수열(small).swift)    | `23.02.24`  | 투포인터 |
|   [센서](https://www.acmicpc.net/problem/2212)       |   <img src="https://static.solved.ac/tier_small/11.svg" width ="15"> |   [🥇](https://github.com/hyun99999/algorithm-Swift/blob/master/Gold/센서.swift)    | `23.02.24`  | 그리디 |
|   [강의실 배정](https://www.acmicpc.net/problem/11000)       |   <img src="https://static.solved.ac/tier_small/11.svg" width ="15"> |   [🥇](https://github.com/hyun99999/algorithm-Swift/blob/master/Gold/강의실%20배정.swift)    | `23.02.24`  | 그리디 |
|   [최소 회의실 개수](https://www.acmicpc.net/problem/19598)       |   <img src="https://static.solved.ac/tier_small/11.svg" width ="15"> |   [🥇](https://github.com/hyun99999/algorithm-Swift/blob/master/Gold/최소%20회의실%20개수.swift)    | `23.02.24`  | 그리디 |
|   [행복 유치원](https://www.acmicpc.net/problem/13164)       |   <img src="https://static.solved.ac/tier_small/11.svg" width ="15"> |   [🥇](https://github.com/hyun99999/algorithm-Swift/blob/master/Gold/행복%20유치원.swift)    | `23.02.24`  | 그리디 |
|   [서강그라운드](https://www.acmicpc.net/problem/14938)       |   <img src="https://static.solved.ac/tier_small/12.svg" width ="15"> |   [🥇](https://github.com/hyun99999/algorithm-Swift/blob/master/Gold/서강그라운드.swift)    | `23.02.23`  | 플로이드 워셜, 최단 거리 |
|   [최단경로](https://www.acmicpc.net/problem/1753)       |   <img src="https://static.solved.ac/tier_small/12.svg" width ="15"> |   [🥇](https://github.com/hyun99999/algorithm-Swift/blob/master/Gold/최단경로.swift)    | `23.02.23`  | 다익스트라, 최단 거리 |
|   [끝나지 않는 파티](https://www.acmicpc.net/problem/11265)       |   <img src="https://static.solved.ac/tier_small/11.svg" width ="15"> |   [🥇](https://github.com/hyun99999/algorithm-Swift/blob/master/Gold/끝나지%20않는%20파티.swift)    | `23.02.22`  | 플로이드 워셜, 최단 거리 |
|   [숨바꼭질3](https://www.acmicpc.net/problem/13549)       |   <img src="https://static.solved.ac/tier_small/11.svg" width ="15"> |   [🥇](https://github.com/hyun99999/algorithm-Swift/blob/master/Gold/숨바꼭질3.swift)    | `23.02.22`  | BFS, 최단 거리 |
|   [숨바꼭질](https://www.acmicpc.net/problem/1697)       |   <img src="https://static.solved.ac/tier_small/10.svg" width ="15"> |   [🥈](https://github.com/hyun99999/algorithm-Swift/blob/master/Silver/숨바꼭질.swift)    | `23.02.22`  | BFS, 최단 거리 |
|   [경로 찾기](https://www.acmicpc.net/problem/11055)       |   <img src="https://camo.githubusercontent.com/f9fbfc34970ea19a732149ee3f1afc3fcb96309a8d182ef157d724d6eefd1973/68747470733a2f2f7374617469632e736f6c7665642e61632f746965725f736d616c6c2f31302e737667" width ="15"> |   [🥈](https://github.com/hyun99999/algorithm-Swift/blob/master/Silver/경로%20찾기.swift)    | `23.02.20`  | DFS |
|   [특정 거리의 도시 찾기](https://www.acmicpc.net/problem/11055)       |   <img src="https://camo.githubusercontent.com/e89e2c34907a70e2de81836b1d798391d56768998c197adccdb9ee1a71f75b9e/68747470733a2f2f7374617469632e736f6c7665642e61632f746965725f736d616c6c2f392e737667" width ="15"> |   [🥈](https://github.com/hyun99999/algorithm-Swift/blob/master/Silver/특정%20거리의%20도시%20찾기.swift)    | `23.02.20`  | BFS, 최단거리 |
|   [가장 큰 증가 부분 수열](https://www.acmicpc.net/problem/11055)       |   <img src="https://camo.githubusercontent.com/e89e2c34907a70e2de81836b1d798391d56768998c197adccdb9ee1a71f75b9e/68747470733a2f2f7374617469632e736f6c7665642e61632f746965725f736d616c6c2f392e737667" width ="15"> |   [🥈](https://github.com/hyun99999/algorithm-Swift/blob/master/Silver/가장%20큰%20증가%20부분%20수열.swift)    | `23.02.17`  | DP |
|   [연속합](https://www.acmicpc.net/problem/1912)       |   <img src="https://camo.githubusercontent.com/e89e2c34907a70e2de81836b1d798391d56768998c197adccdb9ee1a71f75b9e/68747470733a2f2f7374617469632e736f6c7665642e61632f746965725f736d616c6c2f392e737667" width ="15"> |   [🥈](https://github.com/hyun99999/algorithm-Swift/blob/master/Silver/연속합.swift)    | `23.02.17`  | DP |
|   [가장 긴 증가하는 부분 수열](https://www.acmicpc.net/problem/11053)       |   <img src="https://camo.githubusercontent.com/e89e2c34907a70e2de81836b1d798391d56768998c197adccdb9ee1a71f75b9e/68747470733a2f2f7374617469632e736f6c7665642e61632f746965725f736d616c6c2f392e737667" width ="15"> |   [🥈](https://github.com/hyun99999/algorithm-Swift/blob/master/Silver/가장%20긴%20증가하는%20부분%20수열.swift)    | `23.02.17`  | DP |
|   [민겸 수](https://www.acmicpc.net/problem/1541)             |  <img src="https://camo.githubusercontent.com/e89e2c34907a70e2de81836b1d798391d56768998c197adccdb9ee1a71f75b9e/68747470733a2f2f7374617469632e736f6c7665642e61632f746965725f736d616c6c2f392e737667" width ="15"> |   [🥈](https://github.com/hyun99999/algorithm-Swift/blob/master/Silver/민겸%20수.swift)    | `23.02.13`  | 그리디 |
|   [A->B](https://www.acmicpc.net/problem/1541)             |  <img src="https://camo.githubusercontent.com/e89e2c34907a70e2de81836b1d798391d56768998c197adccdb9ee1a71f75b9e/68747470733a2f2f7374617469632e736f6c7665642e61632f746965725f736d616c6c2f392e737667" width ="15"> |   [🥈](https://github.com/hyun99999/algorithm-Swift/blob/master/Silver/A->B.swift)    | `23.02.13`  | 그리디 |
|   [잃어버린 괄호](https://www.acmicpc.net/problem/1541)             |  <img src="https://camo.githubusercontent.com/e89e2c34907a70e2de81836b1d798391d56768998c197adccdb9ee1a71f75b9e/68747470733a2f2f7374617469632e736f6c7665642e61632f746965725f736d616c6c2f392e737667" width ="15"> |   [🥈](https://github.com/hyun99999/algorithm-Swift/blob/master/Silver/잃어버린%20괄호.swift)    | `23.02.13`  | 그리디 |
|   [블로그2](https://www.acmicpc.net/problem/20365)             |  <img src="https://camo.githubusercontent.com/627abdadaa6151e4ef8e6ef62f47e735acfcd7c04d75fa1d771cf166a06a7f42/68747470733a2f2f7374617469632e736f6c7665642e61632f746965725f736d616c6c2f382e737667" width ="15"> |   [🥈](https://github.com/hyun99999/algorithm-Swift/blob/master/Silver/블로그2.swift)    | `23.02.06`  | 그리디 |
|   [서강근육맨](https://www.acmicpc.net/problem/20300)             |  <img src="https://camo.githubusercontent.com/627abdadaa6151e4ef8e6ef62f47e735acfcd7c04d75fa1d771cf166a06a7f42/68747470733a2f2f7374617469632e736f6c7665642e61632f746965725f736d616c6c2f382e737667" width ="15"> |   [🥈](https://github.com/hyun99999/algorithm-Swift/blob/master/Silver/서강근육맨.swift)    | `23.02.03`  | 그리디 |
|   [에너지 드링크](https://www.acmicpc.net/problem/20115)             |  <img src="https://camo.githubusercontent.com/627abdadaa6151e4ef8e6ef62f47e735acfcd7c04d75fa1d771cf166a06a7f42/68747470733a2f2f7374617469632e736f6c7665642e61632f746965725f736d616c6c2f382e737667" width ="15"> |   [🥈](https://github.com/hyun99999/algorithm-Swift/blob/master/Silver/에너지%20드링크.swift)    | `23.02.03`  | 그리디 |
|   [주유소](https://www.acmicpc.net/problem/13305)             |  <img src="https://camo.githubusercontent.com/627abdadaa6151e4ef8e6ef62f47e735acfcd7c04d75fa1d771cf166a06a7f42/68747470733a2f2f7374617469632e736f6c7665642e61632f746965725f736d616c6c2f382e737667" width ="15"> |   [🥈](https://github.com/hyun99999/algorithm-Swift/blob/master/Silver/주유소.swift)    | `23.02.03`  | 그리디 |
|   [회의실 배정](https://www.acmicpc.net/problem/1931)             |  <img src="https://camo.githubusercontent.com/f9fbfc34970ea19a732149ee3f1afc3fcb96309a8d182ef157d724d6eefd1973/68747470733a2f2f7374617469632e736f6c7665642e61632f746965725f736d616c6c2f31302e737667" width ="15"> |   [🥈](https://github.com/hyun99999/algorithm-Swift/blob/master/Silver/회의실%20배정.swift)    | `23.02.03`  | 그리디 |

> 프로그래머스

|    문제                   |   난이도   |   풀이   |  날짜   |  알고리즘  |
| :----------------------: | :------: | :-------: |:-------:|:-------:|
|   [택배 배달과 수거하기](https://school.programmers.co.kr/learn/courses/30/lessons/150369?language=swift)             |  Level 2|   [🏋️‍](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/택배%20배달과%20수거하기.swift)    | `23.01.20`  |  |
|   [우박수열 정적분](https://school.programmers.co.kr/learn/courses/30/lessons/134239)             |  Level 2|   [🏋️‍](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/우박수열%20정적분.swift)    | `23.01.20`  | 문제해석 |
|   [교점에 별 만들기](https://school.programmers.co.kr/learn/courses/30/lessons/87377)             |  Level 2|   [🏋️‍](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/교점에%20별%20만들기.swift)    | `23.01.18`  | 식 세우고 풀기 |
|   [디펜스 게임](https://school.programmers.co.kr/learn/courses/30/lessons/142085)             |  Level 2|   [🏋️‍](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/디펜스%20게임.swift)    | `23.01.18`  | 파라메트릭 서치(이진탐색) - 시간초과 |
|   [마법의 엘리베이터](https://school.programmers.co.kr/learn/courses/30/lessons/148653)             |  Level 2|   [🏋️‍](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/마법의%20엘리베이터.swift)    | `23.01.17`  |  |
|   [숫자 카드 나누기](https://school.programmers.co.kr/learn/courses/30/lessons/135807)             |  Level 2|   [🏋️‍](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/숫자%20카드%20나누기.swift)    | `23.01.13`  |  |
|   [풍선 터트리기](https://school.programmers.co.kr/learn/courses/30/lessons/68646)               |  Level 3|   [🚴](https://github.com/hyun99999/algorithm-Swift/blob/master/Level3/풍선%20터트리기.swift)    | `23.01.13`  | 다이나믹 프로그래밍 |
|   [혼자 놀기의 달인](https://school.programmers.co.kr/learn/courses/30/lessons/131130)             |  Level 2|   [🏋️‍](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/혼자%20놀기의%20달인.swift)    | `23.01.13`  |  |
|   [점 찍기](https://school.programmers.co.kr/learn/courses/30/lessons/140107)             |  Level 2|   [🏋️‍](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/점%20찍기.swift)    | `23.01.12`  |  |
|   [개인정보 수집 유효기간](https://school.programmers.co.kr/learn/courses/30/lessons/150370)             |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/개인정보%20수집%20유효기간.swift)    | `23.01.11`  |  |
|   [크기가 작은 부분문자열](https://school.programmers.co.kr/learn/courses/30/lessons/147355)             |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/크기가%20작은%20부분문자열.swift)    | `23.01.10`  |  |
|   [쿼드압축 후 개수 세기](https://school.programmers.co.kr/learn/courses/30/lessons/68936)             |  Level 2|   [🏋️‍](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/쿼드압축%20후%20개수%20세기.swift)    | `22.12.14`  |  |
|   [섬 연결하기](https://school.programmers.co.kr/learn/courses/30/lessons/42861)               |  Level 3|   [🚴](https://github.com/hyun99999/algorithm-Swift/blob/master/Level3/섬%20연결하기.swift)    | `22.12.13`  | MST(크루스칼, 프림) |
|   [가장 가까운 같은 글자](https://school.programmers.co.kr/learn/courses/30/lessons/142086)             |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/가장%20가까운%20같은%20글자.swift)    | `22.12.10`  | dictionary 초기화 |
|   [할인행사](https://school.programmers.co.kr/learn/courses/30/lessons/131127)             |  Level 2|   [🏋️‍](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/할인행사.swift)    | `22.12.10`  |  |
|   [택배상자](https://school.programmers.co.kr/learn/courses/30/lessons/131704)             |  Level 2|   [🏋️‍](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/택배상자.swift)    | `22.12.10`  |  |
|   [롤케이크 자르기](https://school.programmers.co.kr/learn/courses/30/lessons/132265)             |  Level 2|   [🏋️‍](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/롤케이크%20자르기.swift)    | `22.12.09`  |  |
|   [문자열 자르기](https://school.programmers.co.kr/learn/courses/30/lessons/140108)             |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/문자열%20자르기.swift)    | `22.12.06`  |  |
|   [귤 고르기](https://school.programmers.co.kr/learn/courses/30/lessons/138476)             |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/귤%20고르기.swift)    | `22.11.25`  | dictionary 초기화 |
|   [명예의 전당(1)](https://school.programmers.co.kr/learn/courses/30/lessons/131701)             |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/명예의%20전당(1).swift)    | `22.11.25`  |  |
|   [연속 부분 수열 합의 개수](https://school.programmers.co.kr/learn/courses/30/lessons/131701)             |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/연속%20부분%20수열%20합의%20개수.swift)    | `22.11.25`  |  |
|   [옹알이(2)](https://school.programmers.co.kr/learn/courses/30/lessons/133499)             |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/옹알이(2).swift)    | `22.11.23`  | Array slice |
|   [햄버거 만들기](https://school.programmers.co.kr/learn/courses/30/lessons/133502)             |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/햄버거%20만들기.swift)    | `22.11.23`  | Array slice |
|   [과일 장수](https://school.programmers.co.kr/learn/courses/30/lessons/135808)             |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/과일%20장수.swift)    | `22.11.17`  | stride 사용 |
|   [기사단원의 무기](https://school.programmers.co.kr/learn/courses/30/lessons/136798)             |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/기사단원의%20무기.swift)    | `22.11.17`  | 약수 구하기(제곱근) |
|   [숫자 짝꿍](https://school.programmers.co.kr/learn/courses/30/lessons/131128)             |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/숫자%20짝꿍.swift)    | `22.11.17`  |  |
|   [콜라 문제](https://school.programmers.co.kr/learn/courses/30/lessons/132267)             |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/콜라%20문제.swift)    | `22.11.16`  |  |
|   [삼총사](https://school.programmers.co.kr/learn/courses/30/lessons/131705)             |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/삼총사.swift)    | `22.10.19`  |  |
|   [가장 긴 팸린드롬](https://school.programmers.co.kr/learn/courses/30/lessons/12904)               |  Level 3|   [🚴](https://github.com/hyun99999/algorithm-Swift/blob/master/Level3/가장%20긴%20팸린드롬.swift)    | `22.09.23`  |  |
|   [순위](https://school.programmers.co.kr/learn/courses/30/lessons/49191)               |  Level 3|   [🚴](https://github.com/hyun99999/algorithm-Swift/blob/master/Level3/순위.swift)    | `22.09.23`  |  |
|   [[1차]셔틀버스](https://school.programmers.co.kr/learn/courses/30/lessons/17678)               |  Level 3|   [🚴](https://github.com/hyun99999/algorithm-Swift/blob/master/Level3/[1차]셔틀버스.swift)    | `22.09.23`  | 시간다루기 |
|   [스티커 모으기(2)](https://school.programmers.co.kr/learn/courses/30/lessons/12971)               |  Level 3|   [🚴](https://github.com/hyun99999/algorithm-Swift/blob/master/Level3/스티커%20모으기(2).swift)    | `22.09.23`  | DP |
|   [입국심사](https://school.programmers.co.kr/learn/courses/30/lessons/43238)               |  Level 3|   [🚴](https://github.com/hyun99999/algorithm-Swift/blob/master/Level3/입국심사.swift)    | `22.09.22`  | 이진탐색 |
|   [경주로 건설](https://school.programmers.co.kr/learn/courses/30/lessons/67259)               |  Level 3|   [🚴](https://github.com/hyun99999/algorithm-Swift/blob/master/Level3/경주로%20건설.swift)    | `22.09.21`  | DFS |
|   [표 편집](https://school.programmers.co.kr/learn/courses/30/lessons/81303)               |  Level 3|   [🚴](https://github.com/hyun99999/algorithm-Swift/blob/master/Level3/표%20편집.swift)    | `22.09.21`  | linked list |
|   [디스크 컨트롤러](https://school.programmers.co.kr/learn/courses/30/lessons/42627)               |  Level 3|   [🚴](https://github.com/hyun99999/algorithm-Swift/blob/master/Level3/디스크%20컨트롤러.swift)    | `22.09.21`  |  |
|   [여행경로](https://school.programmers.co.kr/learn/courses/30/lessons/43164)               |  Level 3|   [🚴](https://github.com/hyun99999/algorithm-Swift/blob/master/Level3/여행경로.swift)    | `22.09.20`  | DFS |
|   [가장 먼 노드](https://school.programmers.co.kr/learn/courses/30/lessons/49189)               |  Level 3|   [🚴](https://github.com/hyun99999/algorithm-Swift/blob/master/Level3/가장%20먼%20노드.swift)    | `22.09.17`  |  |
|   [징검다리 건너기](https://school.programmers.co.kr/learn/courses/30/lessons/64062)               |  Level 3|   [🚴](https://github.com/hyun99999/algorithm-Swift/blob/master/Level3/징검다리%20건너기.swift)    | `22.09.14`  | 이진탐색 |
|   [기지국 설치](https://school.programmers.co.kr/learn/courses/30/lessons/12979)               |  Level 3|   [🚴](https://github.com/hyun99999/algorithm-Swift/blob/master/Level3/기지국%20설치.swift)    | `22.09.14`  |  |
|   [불량 사용자](https://school.programmers.co.kr/learn/courses/30/lessons/64064)               |  Level 3|   [🚴](https://github.com/hyun99999/algorithm-Swift/blob/master/Level3/불량%20사용자.swift)    | `22.09.13`  | 조합 |
|   [숫자 게임](https://school.programmers.co.kr/learn/courses/30/lessons/12987)               |  Level 3|   [🚴](https://github.com/hyun99999/algorithm-Swift/blob/master/Level3/숫자%20게임.swift)    | `22.09.13`  |  |
|   [베스트앨범](https://school.programmers.co.kr/learn/courses/30/lessons/42579)               |  Level 3|   [🚴](https://github.com/hyun99999/algorithm-Swift/blob/master/Level3/베스트앨범.swift)    | `22.09.13`  | 해시 |
|   [단어 변환](https://school.programmers.co.kr/learn/courses/30/lessons/43163)               |  Level 3|   [🚴](https://github.com/hyun99999/algorithm-Swift/blob/master/Level3/단어%20변환.swift)    | `22.09.13`  | BFS |
|   [네트워크](https://school.programmers.co.kr/learn/courses/30/lessons/43162)               |  Level 3|   [🚴](https://github.com/hyun99999/algorithm-Swift/blob/master/Level3/네트워크.swift)    | `22.09.12`  | DFS |
|   [이중우선순위큐](https://school.programmers.co.kr/learn/courses/30/lessons/42628)               |  Level 3|   [🚴](https://github.com/hyun99999/algorithm-Swift/blob/master/Level3/이중우선순위큐.swift)    | `22.09.09`  | 이중우선순위큐 |
|   [예상 대진표](https://school.programmers.co.kr/learn/courses/30/lessons/12985)               |  Level 2|   [🏋️‍](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/예상%20대진표swift)    | `22.09.08`  |  |
|   [[3차]압축](https://school.programmers.co.kr/learn/courses/30/lessons/17684)               |  Level 2|   [🏋️‍](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/[3차]압축.swift)    | `22.09.07`  |  |
|   [[3차]파일명 정렬](https://school.programmers.co.kr/learn/courses/30/lessons/17686)               |  Level 2|   [🏋️‍](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/[3차]파일명%20정렬.swift)    | `22.09.05`  | 문자열 다루기 |
|   [[3차]n진수 게임](https://school.programmers.co.kr/learn/courses/30/lessons/17687)               |  Level 2|   [🏋️‍](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/[3차]n진수%20게임.swift)    | `22.09.02`  |  |
|   [[1차] 프렌즈4블록](https://school.programmers.co.kr/learn/courses/30/lessons/17679)               |  Level 2|   [🏋️‍](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/[1차]%20프렌즈4블록.swift)    | `22.09.01`  | 구현, 게임 |
|   [피보나치 수](https://school.programmers.co.kr/learn/courses/30/lessons/12945)               |  Level 2|   [🏋️‍](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/피보나치%20수.swift)    | `22.09.01`  | DP |
|   [카드 짝 맞추기](https://school.programmers.co.kr/learn/courses/30/lessons/72415)               |  Level 3|   [🚴](https://github.com/hyun99999/algorithm-Swift/blob/master/Level3/카드%20짝%20맞추기.swift)    | `22.09.01`  | BFS |
|   [광고 삽입](https://school.programmers.co.kr/learn/courses/30/lessons/72414)               |  Level 3|   [🚴](https://github.com/hyun99999/algorithm-Swift/blob/master/Level3/광고%20삽입.swift)    | `22.08.31`  |  |
|   [합승 택시 요금](https://school.programmers.co.kr/learn/courses/30/lessons/72413)               |  Level 3|   [🚴](https://github.com/hyun99999/algorithm-Swift/blob/master/Level3/합승%20택시%20요금.swift)    | `22.08.29`  | 플로이드-워셜 |
|   [사라지는 발판](https://school.programmers.co.kr/learn/courses/30/lessons/92345)               |  Level 3|   [🚴](https://github.com/hyun99999/algorithm-Swift/blob/master/Level3/사라지는%20발판.swift)    | `22.08.27`  | 완전 탐색 |
|   [N으로 표현](https://school.programmers.co.kr/learn/courses/30/lessons/42895)               |  Level 3|   [🚴](https://github.com/hyun99999/algorithm-Swift/blob/master/Level3/N으로%20표현.swift)    | `22.08.23`  | DFS, DP |
|   [두 큐 합 같게 만들기](https://school.programmers.co.kr/learn/courses/30/lessons/118667)               |  Level 2|   [🏋️‍](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/두%20큐%20합%20같게%20만들기.swift)    | `22.08.22`  | 투 포인터 |
|   [보석 쇼핑](https://school.programmers.co.kr/learn/courses/30/lessons/67258)               |  Level 3|   [🚴](https://github.com/hyun99999/algorithm-Swift/blob/master/Level3/보석%20쇼핑.swift)    | `22.08.22`  | 투 포인터 |
|   [성격 유형 검사하기](https://school.programmers.co.kr/learn/courses/30/lessons/118666)             |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/성격%20유형%20검사하기.swift)    | `22.08.22`  | 조건 분기처리 |
|   [N-Queen](https://school.programmers.co.kr/learn/courses/30/lessons/12952)               |  Level 2|   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/N-Queen.swift)    | `22.08.22`  | DFS, 백트래킹 |
|   [땅따먹기](https://school.programmers.co.kr/learn/courses/30/lessons/12913)               |  Level 2|   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/땅따먹기.swift)    | `22.08.19`  |
|   [JadenCase 문자열 만들기](https://school.programmers.co.kr/learn/courses/30/lessons/12951)               |  Level 2|   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/JadenCase%20문자열%20만들기.swift)    | `22.08.18`  |
|   [K진수에서 소수 개수 구하기](https://school.programmers.co.kr/learn/courses/30/lessons/92335)               |  Level 2|   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/k진수에서%20소수%20개수%20구하기.swift)    | `22.08.18`  |
|   [[3차]방금그곡](https://school.programmers.co.kr/learn/courses/30/lessons/17683)               |  Level 2|   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/[3차]방금그곡.swift)    | `22.08.14`  |
|   [스킬트리](https://school.programmers.co.kr/learn/courses/30/lessons/49993)               |  Level 2|   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/스킬트리.swift)    | `22.08.14`  |
|   [전력망을 둘로 나누기](https://school.programmers.co.kr/learn/courses/30/lessons/86971)               |  Level 2|   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/전력망을%20둘로%20나누기.swift)    | `22.08.14`  |
|   [[1차]캐시](https://school.programmers.co.kr/learn/courses/30/lessons/17680)               |  Level 2|   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/[1차]캐시.swift)    | `22.08.06`  |
|   [다음 큰 숫자](https://school.programmers.co.kr/learn/courses/30/lessons/12911)               |  Level 2|   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/다음%20큰%20숫자.swift)    | `22.08.05`  |
|   [모음사전](https://school.programmers.co.kr/learn/courses/30/lessons/84512)               |  Level 2|   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/모음사전.swift)    | `22.08.05`  |
|   [가장 큰 정사각형 찾기](https://school.programmers.co.kr/learn/courses/30/lessons/12905)               |  Level 2|   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/가장%20큰%20정사각형%20찾기.swift)    | `22.08.05`  |
|   [멀리뛰기](https://school.programmers.co.kr/learn/courses/30/lessons/12914)               |  Level 2|   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/멀리뛰기.swift)    | `22.08.04`  |
|   [최댓값과 최솟값](https://school.programmers.co.kr/learn/courses/30/lessons/12939)               |  Level 2|   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/최댓값과%20최솟값.swift)    | `22.08.04`  |
|   [행렬의 곱셈](https://school.programmers.co.kr/learn/courses/30/lessons/12949)               |  Level 2|   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/행렬의%20곱셈.swift)    | `22.08.03`  |
|   [최솟값 만들기](https://school.programmers.co.kr/learn/courses/30/lessons/12941)               |  Level 2|   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/최솟값%20만들기.swift)    | `22.08.03`  |
|   [카펫](https://school.programmers.co.kr/learn/courses/30/lessons/42842)               |  Level 2|   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/카펫.swift)    | `22.08.03`  |
|   [짝지어 제거하기](https://school.programmers.co.kr/learn/courses/30/lessons/12973)               |  Level 2|   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/짝지어%20제거하기.swift)    | `22.08.03`  |
|   [소수 찾기](https://school.programmers.co.kr/learn/courses/30/lessons/42839)               |  Level 2|   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/소수%20찾기.swift)    | `22.08.03`  |
|   [블록 이동하기](https://school.programmers.co.kr/learn/courses/30/lessons/60063)               |  Level 3|   [🚴](https://github.com/hyun99999/algorithm-Swift/blob/master/Level3/블록%20이동하기.swift)    | `22.08.02`  |
|   [파괴되지 않은 건물](https://school.programmers.co.kr/learn/courses/30/lessons/92344)               |  Level 3|   [🚴](https://github.com/hyun99999/algorithm-Swift/blob/master/Level3/파괴되지%20않은%20건물.swift)    | `22.08.01`  |
|   [위장](https://school.programmers.co.kr/learn/courses/30/lessons/42578)               |  Level 2|   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/위장.swift)    | `22.08.01`  |
|   [올바른 괄호](https://school.programmers.co.kr/learn/courses/30/lessons/12909)               |  Level 2|   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/올바른%20괄호.swift)    | `22.08.01`  |
|   [N개의 최소공배수](https://school.programmers.co.kr/learn/courses/30/lessons/12953)               |  Level 2|   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/N개의%20최소공배수.swift)    | `22.08.01`  |
|   [큰 수 만들기](https://school.programmers.co.kr/learn/courses/30/lessons/42883)               |  Level 2|   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/큰%20수%20만들기.swift)    | `22.08.01`  |
|   [최대공약수와 최소공배수](https://school.programmers.co.kr/learn/courses/30/lessons/12969)             |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/최대공약수와%20최소공배수.swift)    | `22.08.01`  |
|   [직사각형 별찍기](https://school.programmers.co.kr/learn/courses/30/lessons/12969)             |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/직사각형%20별찍기.swift)    | `22.07.31`  |
|   [하샤드 수](https://school.programmers.co.kr/learn/courses/30/lessons/12947)             |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/하샤드%20수.swift)    | `22.07.30`  |
|   [정수 제곱근 판별](https://school.programmers.co.kr/learn/courses/30/lessons/12934)             |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/정수%20제곱근%20판별.swift)    | `22.07.29`  |
|   [행렬의 덧셈](https://school.programmers.co.kr/learn/courses/30/lessons/12950)             |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/행렬의%20덧셈.swift)    | `22.07.28`  |
|   [x만큼 간격이 있는 n개의 숫자](https://school.programmers.co.kr/learn/courses/30/lessons/12954)             |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/x만큼%20간격이%20있는%20n개의%20숫자.swift)    | `22.07.27`  |
|   [약수의 합](https://school.programmers.co.kr/learn/courses/30/lessons/12928)             |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/약수의%20합.swift)    | `22.07.27`  |
|   [소수 찾기](https://school.programmers.co.kr/learn/courses/30/lessons/12921)             |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/소수%20찾기.swift)    | `22.07.27`  |
|   [문자열 다루기 기본](https://school.programmers.co.kr/learn/courses/30/lessons/12918)             |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/문자열%20다루기%20기본.swift)    | `22.07.27`  |
|   [후보키](https://school.programmers.co.kr/learn/courses/30/lessons/42890)               |  Level 2|   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/후보키.swift)    | `22.07.27`  |
|   [순위 검색](https://school.programmers.co.kr/learn/courses/30/lessons/72412)               |  Level 2|   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/순위%20검색.swift)    | `22.07.26`  |
|   [문자열 압축](https://school.programmers.co.kr/learn/courses/30/lessons/60057)               |  Level 2|   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/문자열%20압축.swift)    | `22.07.26`  |
|   [점프와 순간 이동](https://school.programmers.co.kr/learn/courses/30/lessons/12978)               |  Level 2|   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/점프와%20순간%20이동.swift)    | `22.07.26`  |
|   [핸드폰 번호 가리기](https://school.programmers.co.kr/learn/courses/30/lessons/12948)             |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/핸드폰%20번호%20가리기.swift)    | `22.07.26`  |
|   [배달](https://school.programmers.co.kr/learn/courses/30/lessons/12978)               |  Level 2|   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/배달.swift)    | `22.07.26`  |
|   [콜라츠 추측](https://school.programmers.co.kr/learn/courses/30/lessons/12943)             |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/콜라츠%20추측.swift)    | `22.07.25`  |
|   [평균 구하기](https://school.programmers.co.kr/learn/courses/30/lessons/12944)             |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/평균%20구하기.swift)    | `22.07.24`  |
|   [짝수와 홀수](https://school.programmers.co.kr/learn/courses/30/lessons/12937)             |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/짝수와%20홀수.swift)    | `22.07.24`  |
|   [제일 작은 수 제거하기](https://school.programmers.co.kr/learn/courses/30/lessons/12935)               |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/제일%20작은%20수%20제거하기.swift)    | `22.07.23`  |
|   [자연수 뒤집어 배열로 만들기](https://school.programmers.co.kr/learn/courses/30/lessons/12932)               |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/자연수%20뒤집어%20배열로%20만들기.swift)    | `22.07.23`  |
|   [영어 끝말잇기](https://school.programmers.co.kr/learn/courses/30/lessons/12981)               |  Level 2|   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/영어%20끝말잇기.swift)    | `22.07.22`  |
|   [정수 내림차순으로 배치하기](https://school.programmers.co.kr/learn/courses/30/lessons/12933)               |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/정수%20내림차순으로%20배치하기.swift)    | `22.07.22`  |
|   [자릿수 더하기](https://school.programmers.co.kr/learn/courses/30/lessons/12931)               |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/자릿수%20더하기.swift)    | `22.07.22`  |
|   [시저 암호](https://school.programmers.co.kr/learn/courses/30/lessons/12926)               |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/시저%20암호.swift)    | `22.07.21`  |
|   [이상한 문자 만들기](https://school.programmers.co.kr/learn/courses/30/lessons/12930)               |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/이상한%20문자%20만들기.swift)    | `22.07.21`  |
|   [문자열을 정수로 바꾸기](https://school.programmers.co.kr/learn/courses/30/lessons/12925)               |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/문자열을%20정수로%20바꾸기.swift)    | `22.07.20`  |
|   [다리를 지나는 트럭](https://school.programmers.co.kr/learn/courses/30/lessons/42583) |  Level 2|   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/다리를%20지나는%20트럭.swift)    | `22.07.20`  |
|   [수박수박수박수박수박수?](https://school.programmers.co.kr/learn/courses/30/lessons/12922)               |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/수박수박수박수박수박수%3F.swift.swift)    | `22.07.20`  |
|   [서울에서 김서방 찾기](https://school.programmers.co.kr/learn/courses/30/lessons/12919)               |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/서울에서%20김서방%20찾기.swift)    | `22.07.20`  |
|   [조이스틱](https://school.programmers.co.kr/learn/courses/30/lessons/42860) |  Level 2|   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/조이스틱.swift)    | `22.07.17`  |
|   [문자열 내 p와 y 의 개수](https://school.programmers.co.kr/learn/courses/30/lessons/12916)               |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/문자열%20내%20p와%20y의%20개수.swift)    | `22.07.17`  |
|   [문자열 내 마음대로 정렬하기](https://school.programmers.co.kr/learn/courses/30/lessons/12915)               |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/문자열%20내%20마음대로%20정렬하기.swift)    | `22.07.17`  |
|   [[1차] 뉴스 클러스터링](https://school.programmers.co.kr/learn/courses/30/lessons/17677)               |  Level 2|   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/%5B1차%5D%20뉴스%20클러스터링.swift)    | `22.07.17`  |
|   [두 정수 사이의 합](https://school.programmers.co.kr/learn/courses/30/lessons/12910)               |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/두%20정수%20사이의%20합.swift)    | `22.07.16`  |
|   [나누어 떨어지는 숫자 배열](https://school.programmers.co.kr/learn/courses/30/lessons/12910)               |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/나누어%20떨어지는%20숫자%20배열.swift)    | `22.07.16`  |
|   [수식 최대화](https://school.programmers.co.kr/learn/courses/30/lessons/67257)               |  Level 2|   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/수식%20최대화.swift)    | `22.07.16`  |
|   [[1차] 다트 게임](https://school.programmers.co.kr/learn/courses/30/lessons/17682)               |  Level 1|   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/%5B1차%5D%20다트%20게임.swift)    | `22.07.16`  |
|   [최소직사각형](https://school.programmers.co.kr/learn/courses/30/lessons/86491)               |  Level 1 |   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/최소직사각형.swift)    | `22.07.15`  |
|   [피로도](https://school.programmers.co.kr/learn/courses/30/lessons/87946)               |  Level 2|   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/피로도.swift)    | `22.07.14`  |
|   [2016년](https://school.programmers.co.kr/learn/courses/30/lessons/12901)               |  Level 1 |   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/2016년.swift)    | `22.07.14`  |
|   [방문 길이](https://school.programmers.co.kr/learn/courses/30/lessons/49994)               |  Level 2 |   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/방문%20길이.swift)    | `22.07.13`  |
|   [타겟 넘버](https://school.programmers.co.kr/learn/courses/30/lessons/43165)               |  Level 2 |   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/타겟%20넘버.swift)    | `22.07.13`  |
|   [부족한 금액 계산하기](https://school.programmers.co.kr/learn/courses/30/lessons/82612)               |  Level 1 |   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/부족한%20금액%20계산하기.swift)    | `22.07.13`  |
|   [[1차] 비밀지도](https://school.programmers.co.kr/learn/courses/30/lessons/17681)               |  Level 1 |   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/%5B1차%5D%20비밀지도.swift)    | `22.07.13`  |
|   [이진 변환 반복하기](https://school.programmers.co.kr/learn/courses/30/lessons/70129)               |  Level 2 |   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/이진%20변환%20반복하기.swift)    | `22.07.11`  |
|   [삼각 달팽이](https://school.programmers.co.kr/learn/courses/30/lessons/68645)               |  Level 2 |   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/삼각%20달팽이.swift)    | `22.07.10`  |
|   [3진법 뒤집기](https://school.programmers.co.kr/learn/courses/30/lessons/68935)               |  Level 1 |   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/3진법%20뒤집기.swift)    | `22.07.10`  |
|   [프린터](https://school.programmers.co.kr/learn/courses/30/lessons/42587)               |  Level 2 |   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/프린터.swift)    | `22.07.10`  |
|   [기능개발](https://school.programmers.co.kr/learn/courses/30/lessons/42586)               |  Level 2 |   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/기능개발.swift)    | `22.07.09`  |
|   [튜플](https://school.programmers.co.kr/learn/courses/30/lessons/64065)               |  Level 1 |   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/튜플.swift)    | `22.07.08`  |
|   [모의고사](https://school.programmers.co.kr/learn/courses/30/lessons/42840)               |  Level 1 |   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/모의고사.swift)    | `22.07.08`  |
|   [멀쩡한 사각](https://programmers.co.kr/learn/courses/30/lessons/62048)               |  Level 2 |   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/멀쩡한%20사각형.swift)    | `22.07.03`  |
|   [내적](https://programmers.co.kr/learn/courses/30/lessons/70128)               |  Level 1 |   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/내적.swift)    | `22.07.03`  |
|   [괄호 회전하기](https://programmers.co.kr/learn/courses/30/lessons/76502)               |  Level 2 |   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/괄호%20회전하기.swift)    | `22.07.02`  |
|   [2개 이하로 다른 비트](https://programmers.co.kr/learn/courses/30/lessons/77885)               |  Level 2 |   [🏋️‍♀️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/2개%20이하로%20다른%20비트.swift)    | `22.07.02`  |
|   [약수의 개수와 덧셈](https://programmers.co.kr/learn/courses/30/lessons/77884)               |  Level 1 |   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/약수의%20개수와%20덧셈.swift)    | `22.07.02`  |
|   [음양 더하기](https://programmers.co.kr/learn/courses/30/lessons/76501)               |  Level 1 |   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/음양%20더하기.swift)    | `22.07.01`  |
[n^2 배열 자르기](https://programmers.co.kr/learn/courses/30/lessons/87390)               |  Level 2 |   [🏋️‍](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/n%5E2%20배열%20자르기.swift)    | `22.07.01`  |
[빛의 경로 사이클](https://programmers.co.kr/learn/courses/30/lessons/86052)               |  Level 2 |   [🏋️‍](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/빛의%20경로%20사이클.swift)    | `22.06.29`  |
[나머지가 1이 되는 수 찾기](https://programmers.co.kr/learn/courses/30/lessons/87389)               |  Level 1 |   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/나머지가%201이%20되는%20수%20찾기.swift)    | `22.06.29`  |
|   [없는 숫자 더하기](https://programmers.co.kr/learn/courses/30/lessons/86051?language=swift)               |  Level 1 |   [🏊‍♂️](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/없는%20숫자%20더하기.swift)    | `22.06.21`  |
|    K번째수                 |  Level 1 |    [🔫](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/풀이/K번째수.md)     |   |
|    두 개 뽑아서 더하기        |  Level 1 |    [🔫](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/풀이/두%20개%20뽑아서%20더하기.md)   |   |
|     체육복                 |  Level1 |     [🔫](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/풀이/체육복.md)   |   |
|    가운데 글자 가져오기       |  Level 1 |   [🔫](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/풀이/가운데%20글자%20가져오기.md)    |   |
|  문자열 내림차순으로 배치하기   |  Level 1 |   [🔫](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/풀이/문자열%20내림차순으로%20배치하기.md)     |   |
|   크레인 인형뽑기 게임        |  Level 1 |   [🔫](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/풀이/크레인%20인형뽑기%20게임.md)     |   |
|    신규 아이디 추천          |  Level 1 |   [🔫](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/풀이/신규%20아이디%20추천.md)     |   |
|    숫자 문자열과 영단어       |  Level 1 |   [🔫](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/숫자%20문자열과%20영단어.playground/Contents.swift) | `21.09.14` |
|    실패율                 |  Level 1 |   [🔫](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/실패율.playground/Contents.swift)| `21.09.20` |
|    신고 결과 받기           |  Level 1 |   [🏦](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/신고%20결과%20받기.swift)| `22.05.06` |
|   가장 큰 수               |  Level 2 |   [🛠](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/풀이/가장%20큰%20수.md)    |   |
|   H-Index                |  Level 2 |    [🛠](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/풀이/H-Index.md)    |   |
|   거리두기 확인하기(BFS)     |  Level 2 |   [🛠](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/거리두기확인하기(BFS).playground/Contents.swift)    | `21.09.09`  |
|   메뉴 리뉴얼              |  Level 2 |   [🛠](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/메뉴리뉴얼.playground/Contents.swift)    | `21.09.10`  |
|   오픈채팅방               |  Level 2 |   [🛠](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/오픈채팅방.playground/Contents.swift)    | `21.10.13`  |
|   주차 요금 계산               |  Level 2 |   [🥴](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/주차%20요금%20계산.swift)    | `22.05.06`  |
