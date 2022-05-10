//
//  State.swift
//  covid-tracker
//
//  Created by Amanda Detofol on 09/05/22.
//

import Foundation


struct State: Codable {
    let links: Links
    let meta: Meta
    let data: [Datum]
}

struct Datum: Codable {
    let name, stateCode, fips: String
    let sites: [Site]
    let census: Census
    let fieldSources: FieldSources
    let covidTrackingProject: CovidTrackingProject

    enum CodingKeys: String, CodingKey {
        case name
        case stateCode = "state_code"
        case fips, sites, census
        case fieldSources = "field_sources"
        case covidTrackingProject = "covid_tracking_project"
    }
}

struct Census: Codable {
    let population: Int
}

struct CovidTrackingProject: Codable {
    let preferredTotalTest: PreferredTotalTest

    enum CodingKeys: String, CodingKey {
        case preferredTotalTest = "preferred_total_test"
    }
}

struct PreferredTotalTest: Codable {
    let field: Field
    let units: Units
}

enum Field: String, Codable {
    case posNeg = "posNeg"
    case totalTestEncountersViral = "totalTestEncountersViral"
    case totalTestsPeopleViral = "totalTestsPeopleViral"
    case totalTestsViral = "totalTestsViral"
}

enum Units: String, Codable {
    case encounters = "Encounters"
    case people = "People"
    case specimens = "Specimens"
}

struct FieldSources: Codable {
    let tests: Tests
}

struct Tests: Codable {
    let pcr: Pcr
}

struct Pcr: Codable {
    let total: Total
}

enum Total: String, Codable {
    case posNeg = "posNeg"
    case totalPCRTestsPeople = "Total PCR Tests (People)"
    case totalTestEncountersPCR = "Total Test Encounters (PCR)"
    case totalTestsPCR = "Total Tests (PCR)"
}

struct Site: Codable {
    let url: String
    let label: Label
}

enum Label: String, Codable {
    case primary = "primary"
    case quaternary = "quaternary"
    case quinary = "quinary"
    case secondary = "secondary"
    case tertiary = "tertiary"
}

struct Links: Codable {
    let linksSelf: String

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }
}

struct Meta: Codable {
    let buildTime, license, version: String
    let fieldDefinitions: [FieldDefinition]

    enum CodingKeys: String, CodingKey {
        case buildTime = "build_time"
        case license, version
        case fieldDefinitions = "field_definitions"
    }
}

struct FieldDefinition: Codable {
    let name, field: String
    let deprecated: Bool
    let priorNames: [String]

    enum CodingKeys: String, CodingKey {
        case name, field, deprecated
        case priorNames = "prior_names"
    }
}
