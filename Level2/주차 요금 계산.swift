//
//  main.swift
//  주차 요금 계산
//
//  Created by kimhyungyu on 2022/05/06.
//

import Foundation

@frozen
enum InOut: String {
    case `in` = "IN"
    case out = "OUT"
}


// MARK: - Main

/// 해당 차가 머무른 시간 계산.
func parkingLotUse(inTime: String, outTime: String) -> Int {
    let inTimeH: Int = inTime.split(separator: ":").compactMap { Int($0) }[0]
    let inTimeM: Int = inTime.split(separator: ":").compactMap { Int($0) }[1]
    
    let outTimeH: Int = outTime.split(separator: ":").compactMap { Int($0) }[0]
    let outTimeM: Int = outTime.split(separator: ":").compactMap { Int($0) }[1]
    
    // 시간 계산.
    let outTime = outTimeH * 60 + outTimeM
    let inTime = inTimeH * 60 + inTimeM
    
    return outTime - inTime
}

/// 머무른 시간을 가지고 주차 요금 계산.
func fee(with fees: [Int], parkingTime: Int) -> Int {
    let baseTime = fees[0]
    let baseFee = fees[1]
    let perTime = fees[2]
    let perFee = fees[3]
    
    return parkingTime > baseTime ? baseFee + (Int(ceil(Double(parkingTime - baseTime) / Double(perTime))) * perFee) : baseFee
}

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    /// [차 번호 : 주차 시간]
    var cars: [String : Int] = [:]
    /// [차 번호 : 시간]
    var times: [String : String] = [:]
    
    
    records.forEach { record in
        let record = record.split(separator: " ").map { String($0) }
        
        if InOut(rawValue: record[2])! == .in {
            // in
            let inTime = record[0]
            let number = record[1]
            
            times[number] = inTime
        } else {
            // out
            let outTime = record[0]
            let number = record[1]
            
            // OUT 차량이기때문에 무조건 있다.
            let parkingTime = parkingLotUse(inTime: times[number]!, outTime: outTime)

            if cars[number] == nil {
                cars[number] = parkingTime
            } else {
                cars[number]! += parkingTime
            }
            // 비워주기
            times[number] = ""
        }
    }
    
    // OUT 차량은 "", In 차량은 "시간".
    times.forEach { time in
        if !(time.value == "") {
            //  OUT 기록이 없어 23:59 출차.
            let parkingTime = parkingLotUse(inTime: time.value, outTime: "23:59")
            if cars[time.key] == nil {
                cars[time.key] = parkingTime
            } else {
                cars[time.key]! += parkingTime
            }
        }
    }
    
    // 작은 번호의 차량순으로 정렬.
    let result = cars.sorted { $0.0 < $1.0 }
    
    return result.map { fee(with: fees, parkingTime: $0.value) }
}

let result = solution([180, 5000, 10, 600], ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"])

// MARK: -  문제 해석

// fees
// 기본시간 / 기본 요금 / 단위 시간 / 단위 요금

// records
// 시각(HH:MM) / 차량번호(0000) / 내역(IN, OUT)


// 주어진 수식.
// 차량 번호. |  누적 주차 시간.    |  주차 요금.
// 0000     |  34 + 300 = 334 |  5000 + ⌈(334 - 180) / 10⌉ x 600 = 14600

// 초과 시간의 나머지가 있을 때 올림. -> ceil()
// 입차 후 출차된 내역이 없으므로, 23:59 에 출차되었다고 가정.
