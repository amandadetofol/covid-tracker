//
//  FilterViewController+UITableViewDataSource.swift
//  covid-tracker
//
//  Created by Amanda Detofol on 11/05/22.
//

import UIKit

extension FilterViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.states.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.text = states[indexPath.row].name
        return cell
    }

}
