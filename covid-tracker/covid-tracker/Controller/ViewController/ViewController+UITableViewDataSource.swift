//
//  ViewController+UITableViewDataSource.swift
//  covid-tracker
//
//  Created by Amanda Detofol on 11/05/22.
//

import UIKit

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.covidData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellId")
        cell.textLabel?.text = "Date: \(covidData[indexPath.row].date)"
        cell.detailTextLabel?.text = "Positive cases: \(covidData[indexPath.row].cases.total.value)"
        return cell
    }
    
}
