//
//  main.swift
//  sportswear-CodingTest
//
//  Created by kimhyungyu on 2021/04/15.
//

import Foundation

//func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
//    //빌리지 못한 학생
//    var count = 0
//
//    //기본 한벌을 가진 학생들 초기화
//    var students = [Int](repeating: 1, count: n)
//    //도난
//    for i in lost {
//        students[i-1] = 0
//    }
//    //여벌
//    for i in reserve {
//        students[i-1] += 1
//    }
//
//    for i in 0..<n {
//        if students[i] == 0 {
//        //앞번호
//            if i > 0 && students[i-1] > 1 {
//                students[i] = 1
//                students[i-1] -= 1
//            }
//            //뒷번호
//            else if i < n-1 && students[i+1] > 1 {
//                students[i] = 1
//                students[i+1] -= 1
//            } else {
//                //빌리지 못한 학생
//                count += 1
//            }
//        }
//    }
//
//
//    return n - count
//}

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    //도난 학생과 여벌이 있는 학생이 같다면 빈 배열 출력.
    var losted = lost.filter { !reserve.contains($0) }
    var reserved = reserve.filter { !lost.contains($0) }
    
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
        if let index = has {
            reserved.remove(at: index)
            ans += 1
        }
        
    }
    return ans
}

print(solution(5, [2,4], [3]))


