π«  ***Swift μκ³ λ¦¬μ¦ λμμ ***

> DFS : `stack, μ¬κ·`

> BFS : `queue, while λ¬Έ`

- combination
```swift
    /// index λ‘ μ‘°ν© μμ±
    func combination(_ array: [Int]) {
        if array.count == dungeons.count {
            combinationArray.append(array)
            return
        } else {
            for i in 0..<dungeons.count {
                if !array.contains(i) {
                    combination(array + [i])
                }
            }
        }
    }
    
    combination([])
    
    // combinationArray
    // [[0,1,2], [0,2,1], [1,0,2], [1,2,0], [2,0,1], [2,1,0]]
```

- ν¨μ¨μ±μ μν μ΄μ§νμ

```swift
var low = 0
var mid = 0
var high = scores.count - 1
            
while low <= high {
  mid = (low + high) / 2
  // scores[mid] λ₯Ό ν¬ν¨νλ κ²½μ° low κ° μλ high λ₯Ό λΉΌμ result μ μΆκ°ν΄μΌ νλ€.
  if scores[mid] < score {
    low = mid + 1
  } else {
    high = mid - 1
  }
  // low κ° μ λ΅.
}
```

> νλ‘κ·Έλλ¨Έμ€

|    λ¬Έμ                    |   λμ΄λ   |   νμ΄   |  λ μ§   |
| :----------------------: | :------: | :-------: |:-------:|
|   [νμ€λ μ](https://school.programmers.co.kr/learn/courses/30/lessons/12947)             |  Level 1|   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/νμ€λ%20μ.swift)    | `22.07.30`  |
|   [μ μ μ κ³±κ·Ό νλ³](https://school.programmers.co.kr/learn/courses/30/lessons/12934)             |  Level 1|   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/μ μ%20μ κ³±κ·Ό%20νλ³.swift)    | `22.07.29`  |
|   [νλ ¬μ λ§μ](https://school.programmers.co.kr/learn/courses/30/lessons/12950)             |  Level 1|   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/νλ ¬μ%20λ§μ.swift)    | `22.07.28`  |
|   [xλ§νΌ κ°κ²©μ΄ μλ nκ°μ μ«μ](https://school.programmers.co.kr/learn/courses/30/lessons/12954)             |  Level 1|   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/xλ§νΌ%20κ°κ²©μ΄%20μλ%20nκ°μ%20μ«μ.swift)    | `22.07.27`  |
|   [μ½μμ ν©](https://school.programmers.co.kr/learn/courses/30/lessons/12928)             |  Level 1|   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/μ½μμ%20ν©.swift)    | `22.07.27`  |
|   [μμ μ°ΎκΈ°](https://school.programmers.co.kr/learn/courses/30/lessons/12921)             |  Level 1|   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/μμ%20μ°ΎκΈ°.swift)    | `22.07.27`  |
|   [λ¬Έμμ΄ λ€λ£¨κΈ° κΈ°λ³Έ](https://school.programmers.co.kr/learn/courses/30/lessons/12918)             |  Level 1|   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/λ¬Έμμ΄%20λ€λ£¨κΈ°%20κΈ°λ³Έ.swift)    | `22.07.27`  |
|   [νλ³΄ν€](https://school.programmers.co.kr/learn/courses/30/lessons/42890)               |  Level 2|   [ποΈββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/νλ³΄ν€.swift)    | `22.07.27`  |
|   [μμ κ²μ](https://school.programmers.co.kr/learn/courses/30/lessons/72412)               |  Level 2|   [ποΈββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/μμ%20κ²μ.swift)    | `22.07.26`  |
|   [λ¬Έμμ΄ μμΆ](https://school.programmers.co.kr/learn/courses/30/lessons/60057)               |  Level 2|   [ποΈββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/λ¬Έμμ΄%20μμΆ.swift)    | `22.07.26`  |
|   [μ νμ μκ° μ΄λ](https://school.programmers.co.kr/learn/courses/30/lessons/12978)               |  Level 2|   [ποΈββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/μ νμ%20μκ°%20μ΄λ.swift)    | `22.07.26`  |
|   [νΈλν° λ²νΈ κ°λ¦¬κΈ°](https://school.programmers.co.kr/learn/courses/30/lessons/12948)             |  Level 1|   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/νΈλν°%20λ²νΈ%20κ°λ¦¬κΈ°.swift)    | `22.07.26`  |
|   [λ°°λ¬](https://school.programmers.co.kr/learn/courses/30/lessons/12978)               |  Level 2|   [ποΈββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/λ°°λ¬.swift)    | `22.07.26`  |
|   [μ½λΌμΈ  μΆμΈ‘](https://school.programmers.co.kr/learn/courses/30/lessons/12943)             |  Level 1|   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/μ½λΌμΈ %20μΆμΈ‘.swift)    | `22.07.25`  |
|   [νκ·  κ΅¬νκΈ°](https://school.programmers.co.kr/learn/courses/30/lessons/12944)             |  Level 1|   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/νκ· %20κ΅¬νκΈ°.swift)    | `22.07.24`  |
|   [μ§μμ νμ](https://school.programmers.co.kr/learn/courses/30/lessons/12937)             |  Level 1|   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/μ§μμ%20νμ.swift)    | `22.07.24`  |
|   [μ μΌ μμ μ μ κ±°νκΈ°](https://school.programmers.co.kr/learn/courses/30/lessons/12935)               |  Level 1|   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/μ μΌ%20μμ%20μ%20μ κ±°νκΈ°.swift)    | `22.07.23`  |
|   [μμ°μ λ€μ§μ΄ λ°°μ΄λ‘ λ§λ€κΈ°](https://school.programmers.co.kr/learn/courses/30/lessons/12932)               |  Level 1|   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/μμ°μ%20λ€μ§μ΄%20λ°°μ΄λ‘%20λ§λ€κΈ°.swift)    | `22.07.23`  |
|   [μμ΄ λλ§μκΈ°](https://school.programmers.co.kr/learn/courses/30/lessons/12981)               |  Level 2|   [ποΈββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/μμ΄%20λλ§μκΈ°.swift)    | `22.07.22`  |
|   [μ μ λ΄λ¦Όμ°¨μμΌλ‘ λ°°μΉνκΈ°](https://school.programmers.co.kr/learn/courses/30/lessons/12933)               |  Level 1|   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/μ μ%20λ΄λ¦Όμ°¨μμΌλ‘%20λ°°μΉνκΈ°.swift)    | `22.07.22`  |
|   [μλ¦Ώμ λνκΈ°](https://school.programmers.co.kr/learn/courses/30/lessons/12931)               |  Level 1|   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/μλ¦Ώμ%20λνκΈ°.swift)    | `22.07.22`  |
|   [μμ  μνΈ](https://school.programmers.co.kr/learn/courses/30/lessons/12926)               |  Level 1|   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/μμ %20μνΈ.swift)    | `22.07.21`  |
|   [μ΄μν λ¬Έμ λ§λ€κΈ°](https://school.programmers.co.kr/learn/courses/30/lessons/12930)               |  Level 1|   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/μ΄μν%20λ¬Έμ%20λ§λ€κΈ°.swift)    | `22.07.21`  |
|   [λ¬Έμμ΄μ μ μλ‘ λ°κΎΈκΈ°](https://school.programmers.co.kr/learn/courses/30/lessons/12925)               |  Level 1|   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/λ¬Έμμ΄μ%20μ μλ‘%20λ°κΎΈκΈ°.swift)    | `22.07.20`  |
|   [λ€λ¦¬λ₯Ό μ§λλ νΈλ­](https://school.programmers.co.kr/learn/courses/30/lessons/42583) |  Level 2|   [ποΈββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/λ€λ¦¬λ₯Ό%20μ§λλ%20νΈλ­.swift)    | `22.07.20`  |
|   [μλ°μλ°μλ°μλ°μλ°μ?](https://school.programmers.co.kr/learn/courses/30/lessons/12922)               |  Level 1|   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/μλ°μλ°μλ°μλ°μλ°μ%3F.swift.swift)    | `22.07.20`  |
|   [μμΈμμ κΉμλ°© μ°ΎκΈ°](https://school.programmers.co.kr/learn/courses/30/lessons/12919)               |  Level 1|   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/μμΈμμ%20κΉμλ°©%20μ°ΎκΈ°.swift)    | `22.07.20`  |
|   [μ‘°μ΄μ€ν±](https://school.programmers.co.kr/learn/courses/30/lessons/42860) |  Level 2|   [ποΈββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/μ‘°μ΄μ€ν±.swift)    | `22.07.17`  |
|   [λ¬Έμμ΄ λ΄ pμ y μ κ°μ](https://school.programmers.co.kr/learn/courses/30/lessons/12916)               |  Level 1|   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/λ¬Έμμ΄%20λ΄%20pμ%20yμ%20κ°μ.swift)    | `22.07.17`  |
|   [λ¬Έμμ΄ λ΄ λ§μλλ‘ μ λ ¬νκΈ°](https://school.programmers.co.kr/learn/courses/30/lessons/12915)               |  Level 1|   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/λ¬Έμμ΄%20λ΄%20λ§μλλ‘%20μ λ ¬νκΈ°.swift)    | `22.07.17`  |
|   [[1μ°¨] λ΄μ€ ν΄λ¬μ€ν°λ§](https://school.programmers.co.kr/learn/courses/30/lessons/17677)               |  Level 2|   [ποΈββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/%5B1μ°¨%5D%20λ΄μ€%20ν΄λ¬μ€ν°λ§.swift)    | `22.07.17`  |
|   [λ μ μ μ¬μ΄μ ν©](https://school.programmers.co.kr/learn/courses/30/lessons/12910)               |  Level 1|   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/λ%20μ μ%20μ¬μ΄μ%20ν©.swift)    | `22.07.16`  |
|   [λλμ΄ λ¨μ΄μ§λ μ«μ λ°°μ΄](https://school.programmers.co.kr/learn/courses/30/lessons/12910)               |  Level 1|   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/λλμ΄%20λ¨μ΄μ§λ%20μ«μ%20λ°°μ΄.swift)    | `22.07.16`  |
|   [μμ μ΅λν](https://school.programmers.co.kr/learn/courses/30/lessons/67257)               |  Level 2|   [ποΈββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/μμ%20μ΅λν.swift)    | `22.07.16`  |
|   [[1μ°¨] λ€νΈ κ²μ](https://school.programmers.co.kr/learn/courses/30/lessons/17682)               |  Level 1|   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/%5B1μ°¨%5D%20λ€νΈ%20κ²μ.swift)    | `22.07.16`  |
|   [μ΅μμ§μ¬κ°ν](https://school.programmers.co.kr/learn/courses/30/lessons/86491)               |  Level 1 |   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/μ΅μμ§μ¬κ°ν.swift)    | `22.07.15`  |
|   [νΌλ‘λ](https://school.programmers.co.kr/learn/courses/30/lessons/87946)               |  Level 2|   [ποΈββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/νΌλ‘λ.swift)    | `22.07.14`  |
|   [2016λ](https://school.programmers.co.kr/learn/courses/30/lessons/12901)               |  Level 1 |   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/2016λ.swift)    | `22.07.14`  |
|   [λ°©λ¬Έ κΈΈμ΄](https://school.programmers.co.kr/learn/courses/30/lessons/49994)               |  Level 2 |   [ποΈββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/λ°©λ¬Έ%20κΈΈμ΄.swift)    | `22.07.13`  |
|   [νκ² λλ²](https://school.programmers.co.kr/learn/courses/30/lessons/43165)               |  Level 2 |   [ποΈββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/νκ²%20λλ².swift)    | `22.07.13`  |
|   [λΆμ‘±ν κΈμ‘ κ³μ°νκΈ°](https://school.programmers.co.kr/learn/courses/30/lessons/82612)               |  Level 1 |   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/λΆμ‘±ν%20κΈμ‘%20κ³μ°νκΈ°.swift)    | `22.07.13`  |
|   [[1μ°¨] λΉλ°μ§λ](https://school.programmers.co.kr/learn/courses/30/lessons/17681)               |  Level 1 |   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/%5B1μ°¨%5D%20λΉλ°μ§λ.swift)    | `22.07.13`  |
|   [μ΄μ§ λ³ν λ°λ³΅νκΈ°](https://school.programmers.co.kr/learn/courses/30/lessons/70129)               |  Level 2 |   [ποΈββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/μ΄μ§%20λ³ν%20λ°λ³΅νκΈ°.swift)    | `22.07.11`  |
|   [μΌκ° λ¬ν½μ΄](https://school.programmers.co.kr/learn/courses/30/lessons/68645)               |  Level 2 |   [ποΈββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/μΌκ°%20λ¬ν½μ΄.swift)    | `22.07.10`  |
|   [3μ§λ² λ€μ§κΈ°](https://school.programmers.co.kr/learn/courses/30/lessons/68935)               |  Level 1 |   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/3μ§λ²%20λ€μ§κΈ°.swift)    | `22.07.10`  |
|   [νλ¦°ν°](https://school.programmers.co.kr/learn/courses/30/lessons/42587)               |  Level 2 |   [ποΈββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/νλ¦°ν°.swift)    | `22.07.10`  |
|   [κΈ°λ₯κ°λ°](https://school.programmers.co.kr/learn/courses/30/lessons/42586)               |  Level 2 |   [ποΈββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/κΈ°λ₯κ°λ°.swift)    | `22.07.09`  |
|   [νν](https://school.programmers.co.kr/learn/courses/30/lessons/64065)               |  Level 1 |   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/νν.swift)    | `22.07.08`  |
|   [λͺ¨μκ³ μ¬](https://school.programmers.co.kr/learn/courses/30/lessons/42840)               |  Level 1 |   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/λͺ¨μκ³ μ¬.swift)    | `22.07.08`  |
|   [λ©μ©‘ν μ¬κ°](https://programmers.co.kr/learn/courses/30/lessons/62048)               |  Level 2 |   [ποΈββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/λ©μ©‘ν%20μ¬κ°ν.swift)    | `22.07.03`  |
|   [λ΄μ ](https://programmers.co.kr/learn/courses/30/lessons/70128)               |  Level 1 |   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/λ΄μ .swift)    | `22.07.03`  |
|   [κ΄νΈ νμ νκΈ°](https://programmers.co.kr/learn/courses/30/lessons/76502)               |  Level 2 |   [ποΈββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/κ΄νΈ%20νμ νκΈ°.swift)    | `22.07.02`  |
|   [2κ° μ΄νλ‘ λ€λ₯Έ λΉνΈ](https://programmers.co.kr/learn/courses/30/lessons/77885)               |  Level 2 |   [ποΈββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/2κ°%20μ΄νλ‘%20λ€λ₯Έ%20λΉνΈ.swift)    | `22.07.02`  |
|   [μ½μμ κ°μμ λ§μ](https://programmers.co.kr/learn/courses/30/lessons/77884)               |  Level 1 |   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/μ½μμ%20κ°μμ%20λ§μ.swift)    | `22.07.02`  |
|   [μμ λνκΈ°](https://programmers.co.kr/learn/courses/30/lessons/76501)               |  Level 1 |   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/μμ%20λνκΈ°.swift)    | `22.07.01`  |
[n^2 λ°°μ΄ μλ₯΄κΈ°](https://programmers.co.kr/learn/courses/30/lessons/87390)               |  Level 2 |   [ποΈβ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/n%5E2%20λ°°μ΄%20μλ₯΄κΈ°.swift)    | `22.07.01`  |
[λΉμ κ²½λ‘ μ¬μ΄ν΄](https://programmers.co.kr/learn/courses/30/lessons/86052)               |  Level 2 |   [ποΈβ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/λΉμ%20κ²½λ‘%20μ¬μ΄ν΄.swift)    | `22.06.29`  |
[λλ¨Έμ§κ° 1μ΄ λλ μ μ°ΎκΈ°](https://programmers.co.kr/learn/courses/30/lessons/87389)               |  Level 1 |   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/λλ¨Έμ§κ°%201μ΄%20λλ%20μ%20μ°ΎκΈ°.swift)    | `22.06.29`  |
|   [μλ μ«μ λνκΈ°](https://programmers.co.kr/learn/courses/30/lessons/86051?language=swift)               |  Level 1 |   [πββοΈ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/μλ%20μ«μ%20λνκΈ°.swift)    | `22.06.21`  |
|    Kλ²μ§Έμ                 |  Level 1 |    [π«](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/νμ΄/Kλ²μ§Έμ.md)     |   |
|    λ κ° λ½μμ λνκΈ°        |  Level 1 |    [π«](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/νμ΄/λ%20κ°%20λ½μμ%20λνκΈ°.md)   |   |
|     μ²΄μ‘λ³΅                 |  Level1 |     [π«](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/νμ΄/μ²΄μ‘λ³΅.md)   |   |
|    κ°μ΄λ° κΈμ κ°μ Έμ€κΈ°       |  Level 1 |   [π«](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/νμ΄/κ°μ΄λ°%20κΈμ%20κ°μ Έμ€κΈ°.md)    |   |
|  λ¬Έμμ΄ λ΄λ¦Όμ°¨μμΌλ‘ λ°°μΉνκΈ°   |  Level 1 |   [π«](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/νμ΄/λ¬Έμμ΄%20λ΄λ¦Όμ°¨μμΌλ‘%20λ°°μΉνκΈ°.md)     |   |
|   ν¬λ μΈ μΈνλ½κΈ° κ²μ        |  Level 1 |   [π«](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/νμ΄/ν¬λ μΈ%20μΈνλ½κΈ°%20κ²μ.md)     |   |
|    μ κ· μμ΄λ μΆμ²          |  Level 1 |   [π«](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/νμ΄/μ κ·%20μμ΄λ%20μΆμ².md)     |   |
|    μ«μ λ¬Έμμ΄κ³Ό μλ¨μ΄       |  Level 1 |   [π«](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/μ«μ%20λ¬Έμμ΄κ³Ό%20μλ¨μ΄.playground/Contents.swift) | `21.09.14` |
|    μ€ν¨μ¨                 |  Level 1 |   [π«](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/μ€ν¨μ¨.playground/Contents.swift)| `21.09.20` |
|    μ κ³  κ²°κ³Ό λ°κΈ°           |  Level 1 |   [π¦](https://github.com/hyun99999/algorithm-Swift/blob/master/Level1/μ κ³ %20κ²°κ³Ό%20λ°κΈ°.swift)| `22.05.06` |
|   κ°μ₯ ν° μ               |  Level 2 |   [π ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/νμ΄/κ°μ₯%20ν°%20μ.md)    |   |
|   H-Index                |  Level 2 |    [π ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/νμ΄/H-Index.md)    |   |
|   κ±°λ¦¬λκΈ° νμΈνκΈ°(BFS)     |  Level 2 |   [π ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/κ±°λ¦¬λκΈ°νμΈνκΈ°(BFS).playground/Contents.swift)    | `21.09.09`  |
|   λ©λ΄ λ¦¬λ΄μΌ              |  Level 2 |   [π ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/λ©λ΄λ¦¬λ΄μΌ.playground/Contents.swift)    | `21.09.10`  |
|   μ€νμ±νλ°©               |  Level 2 |   [π ](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/μ€νμ±νλ°©.playground/Contents.swift)    | `21.10.13`  |
|   μ£Όμ°¨ μκΈ κ³μ°               |  Level 2 |   [π₯΄](https://github.com/hyun99999/algorithm-Swift/blob/master/Level2/μ£Όμ°¨%20μκΈ%20κ³μ°.swift)    | `22.05.06`  |




