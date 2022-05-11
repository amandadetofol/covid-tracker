//
//  DayData.swift
//  covid-tracker
//
//  Created by Amanda Detofol on 11/05/22.
//

import Foundation

struct DayData: Codable {
    let date: Int?
    let state: String?
    let positive: Double?
    let totalTestResultsSource: String?
    let hospitalizedCurrently: Int?
    let inIcuCurrently: Int?
    let death: Int?
}

