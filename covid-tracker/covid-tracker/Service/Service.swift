//
//  Service.swift
//  covid-tracker
//
//  Created by Amanda Detofol on 09/05/22.
//

import Foundation

protocol ServiceProtocol {
    func getCovidData(for scope: DataScope, completion: @escaping(Result<CovidDataWelcome, Error>)-> Void)
    func getStateList(completion: @escaping(Result<State, Error>)-> Void)
}

protocol HandleServiceError{
    func handleError()
}

enum DataScope {
    case nationalData
    case perStateData(Datum)
}

struct Constants {
    static let allStates: String = "https://api.covidtracking.com/v2/states.json"
}

class Service: ServiceProtocol {

    static let shared: Service = Service()
    var delegate: HandleServiceError?
    
    private init() {
        
    }
    
    public func getCovidData(for scope: DataScope, completion: @escaping(Result<CovidDataWelcome, Error>)-> Void){
        
        var url: String
        switch scope {
        case .nationalData:
            url = "https://api.covidtracking.com/v2/states/ca/daily.json"
        case .perStateData(let datum):
            url = "https://api.covidtracking.com/v2/states/\(datum.stateCode.lowercased())/daily.json"
        }
        
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return}
            
            do {
                let result = try JSONDecoder().decode(CovidDataWelcome.self, from: data)
                completion(.success(result))
            } catch let error {
                completion(.failure(error))
                self.delegate?.handleError()
            }
            
        }.resume()
    }
    
    public func getStateList(completion: @escaping(Result<State, Error>)-> Void){
        guard let url = URL(string: Constants.allStates) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return}
            
            do {
                let result = try JSONDecoder().decode(State.self, from: data)
                completion(.success(result))
            } catch let error {
                completion(.failure(error))
            }
            
        }.resume()
    }
    
}
