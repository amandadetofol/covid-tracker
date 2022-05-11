//
//  ViewController+HandleServiceError.swift
//  covid-tracker
//
//  Created by Amanda Detofol on 11/05/22.
//

import UIKit

extension ViewController: HandleServiceError {
    func handleError() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Ops!", message: "The data for this state are unavailable", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default) { action in
                self.dismiss(animated: true )
            }
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
