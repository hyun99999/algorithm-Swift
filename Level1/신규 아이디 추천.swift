//
//  main.swift
//  recommendID-CodingTest
//
//  Created by kimhyungyu on 2021/04/22.
//

import Foundation

let new_id = "...!@BaT#*..y.abcdefghijklm"

func isValid(char: Character) -> Bool {
    if char.isLetter || char.isNumber || char == "-" || char == "_" || char == "." {
        return true
    } else { return false }
}

func solution(_ new_id:String) -> String {
    //1
    //모든 대문자를 대응되는 소문자로 치환
    var id = new_id.lowercased()
    
    //2
    //알파벳 소문자, 숫자, -, _, . 제외한 모든 문자 제거.
    id = id.filter { isValid(char: $0) }
    
    //3
    //. 가 2번 이상 연속된 부분을 하나의 . 로 치환
    while id.contains("..") {
        //문자열 치환
        id = id.replacingOccurrences(of: "..", with: ".")
    }
    
    //4
    //. 가 처음이나 끝에 위치한다면 제거
    while id.hasPrefix(".") {
        id.removeFirst()
    }
    
    while id.hasSuffix(".") {
        id .removeLast()
    }
    
    //5
    //빈문자열이라면 a 를 대입
    if id.count == 0 {
        id = "a"
    }
    
    //6
    //16자 이상이면 15자를 제외한 나머지 문자 삭제. 제거 후 . 가 끝에 위치하면 제거
    if id.count >= 16 {
        //index(_:offsetBy:) 는 주어진 index 부터 오프셋 거리만큼 떨어진 index 값.
        id.inde
        let index = id.index(id.startIndex, offsetBy: 15)
        //15인 Int 타입이 아닌 String.index 필요하다.
        id = String(id[id.startIndex..<index])
        if id.hasSuffix(".") {
            id.removeLast()
        }
    }
    
    //7
    //2자 이하라면 마지막 문자를 길이가 3이 될 때까지 반복
    if id.count <= 2 {
        while id.count != 3 {
            id = id + String(id.last!)
        }
    }
    
    return id
}

print(solution(new_id))
