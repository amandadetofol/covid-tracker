//
//  Extension+Date.swift
//  covid-tracker
//
//  Created by Amanda Detofol on 10/05/22.
//

import Foundation

extension Date {
    func getFormattedDate(using format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
}
