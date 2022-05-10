//
//  Service.swift
//  covid-tracker
//
//  Created by Amanda Detofol on 09/05/22.
//

import Foundation

protocol ServiceProtocol {
    func getCovidData(for scope: DataScope, completion: @escaping(Result<CovidData, Error>)-> Void)
    func getStateList(completion: @escaping(Result<[State], Error>)-> Void)
}

enum DataScope {
    case nationalData
    case perStateData(State)
}

struct Constants {
    static let allStates: String = "https://api.covidtracking.com/v2/states.json"
}

class Service: ServiceProtocol {

    static let shared: Service = Service()
    
    private init() {
        
    }
    
    public func getCovidData(for scope: DataScope, completion: @escaping(Result<CovidData, Error>)-> Void){
        
    }
    
    public func getStateList(completion: @escaping(Result<[State], Error>)-> Void){
        guard let url = URL(string: Constants.allStates) else { return }
    }
    
}
