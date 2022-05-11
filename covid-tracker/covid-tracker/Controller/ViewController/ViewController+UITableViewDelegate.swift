//
//  ViewController+UITableViewDelegate.swift
//  covid-tracker
//
//  Created by Amanda Detofol on 11/05/22.
//

import UIKit

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var state: String
        switch scope {
        case .nationalData:
            state = "ca"
        case .perStateData(let datum):
            state = datum.stateCode
        }
        
        let date = self.covidData[indexPath.row].date.replacingOccurrences(of: "-", with: "")
        
        Service.shared.getDayDataForDate(date, state: state) { result in
            switch result {
            case .success(let data):
                self.handleData(data: data)
            case.failure(let error):
                print(error)
                self.handleErrorForDay()
            }
        }
    }
    
    private func handleErrorForDay() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Ops!", message: "The data for this day are unavailable", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default) { action in
                self.dismiss(animated: true )
            }
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
    

    
    private func handleData(data: DayData) {
        if let datai = data.date,
           let state = data.state,
           let positive = data.positive,
           let totalTest = data.totalTestResultsSource,
           let hospitalCurrent = data.hospitalizedCurrently,
           let inIcu = data.inIcuCurrently,
           let death = data.death {
            DispatchQueue.main.async {
                let dayDataDetailView = CovidDayDataViewController()
                dayDataDetailView.configure(data: "\(datai)",
                                            state: state,
                                            positive: "\(positive)",
                                            totalTest: totalTest,
                                            hospitalized: "\(hospitalCurrent)",
                                            inIcu: "\(inIcu)",
                                            deaths: "\(death)")
                self.navigationController?.pushViewController(dayDataDetailView, animated: true)
            }
        } else {
            DispatchQueue.main.async {
                let dayDataIsNilErrorView = CovidDayDataErrorViewController()
                self.navigationController?.pushViewController(dayDataIsNilErrorView, animated: true)
            }
        }
        
       
    }
    
}
