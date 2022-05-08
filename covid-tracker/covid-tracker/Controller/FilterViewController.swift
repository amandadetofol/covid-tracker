//
//  StateSelectionController.swift
//  covid-tracker
//
//  Created by Amanda Detofol on 08/05/22.
//

import UIKit

class FilterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Private methods
    private func setupView(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Select a state"
    }
    
}

