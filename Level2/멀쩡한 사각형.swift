
import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{
    let rectangle: Int = w * h
    
    // 최대 공약수 구하기
    var x = w
    var y = h
    while x % y != 0 {
        let temp = x % y
        x = y
        y = temp
    }
    // x 축은 x 만큼 선이 지나가고, y 축은 y 만큼 선이 지나감. 초기 사각형이 겹치니 1은 빼준다.
    // 최대 공약수 만큼 사각형이 반복된다.
    // 쓸 수 없는 사각형만 골라내서 전체 사각형의 갯수에서 빼준다.
    return Int64(rectangle - (w + h - y))
}

let result = solution(8, 12)
print(result)
