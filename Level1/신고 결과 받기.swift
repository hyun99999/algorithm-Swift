//
//  main.swift
//  신고 결과 받기
//
//  Created by kimhyungyu on 2022/05/05.
//

import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var reportedUsers: [String : Set<String>] = [:] // 동일한 사람의 중복 신고는 무시하기 위해서 Set 사용.
    var suspendedUsers: [String] = []
    var result: [Int] = Array(repeating: 0, count: id_list.count)
    
    // id 를 키로 가지고 있는 딕셔너리 만들기
    id_list.forEach {
        reportedUsers[$0] = []
    }
    
    for report in report {
        let array = report.split(separator: " ").map { String($0) }
        let reporter = array[0]
        let reported = array[1]
        
        reportedUsers[reported]?.insert(reporter)
    }
    
    reportedUsers.forEach { reportedUser in
        if reportedUser.value.count >= k  {
            suspendedUsers.append(reportedUser.key)
        }
    }

    suspendedUsers.forEach { suspendedUser in
        reportedUsers[suspendedUser]?.forEach { reporter in
            let index = id_list.firstIndex(of: reporter)
            result[index!] += 1
        }
    }
    
    return result
}

print(solution(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2))

// Set insert, update
// https://zeddios.tistory.com/206


// Set 다루기
// https://babbab2.tistory.com/114
