//
//  ViewController.swift
//  covid-tracker
//
//  Created by Amanda Detofol on 08/05/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    //MARK: Private methods
    private func setupNavigationBar(){
        self.navigationController?.navigationBar.prefersLargeTitles = true 
        self.navigationItem.title = "COVID Cases"
    }

}

