//
//  CovidData.swift
//  covid-tracker
//
//  Created by Amanda Detofol on 09/05/22.

import Foundation


struct CovidDataWelcome: Codable {
    let data: [CovidData]
}


struct CovidData: Codable {
    let cases: CovidCases
    let date: String 
}

struct CovidCases: Codable {
    let total: TotalCases
}

struct TotalCases: Codable {
    let value: Int
}
