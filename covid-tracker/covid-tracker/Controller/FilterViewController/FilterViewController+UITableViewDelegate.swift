//
//  FilterViewController+UITableViewDelegate.swift
//  covid-tracker
//
//  Created by Amanda Detofol on 11/05/22.
//

import UIKit

extension FilterViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        completion?(states[indexPath.row])
        self.navigationController?.popViewController(animated: true)
    }
    
}
