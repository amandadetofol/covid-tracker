//
//  CovidData.swift
//  covid-tracker
//
//  Created by Amanda Detofol on 09/05/22.
//

import Foundation

struct CovidData: Codable {
    let date, states: Int
    let positive, negative, pending, hospitalizedCurrently: Int?
    let hospitalizedCumulative, inIcuCurrently, inIcuCumulative, onVentilatorCurrently: Int?
    let onVentilatorCumulative: Int?
    let dateChecked: Date
    let death, hospitalized: Int?
    let totalTestResults: Int
    let lastModified: Date
    let recovered: JSONNull?
    let total, posNeg, deathIncrease, hospitalizedIncrease: Int
    let negativeIncrease, positiveIncrease, totalTestResultsIncrease: Int
    let hash: String
}

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
