//
//  CovidDayDataErrorViewController.swift
//  covid-tracker
//
//  Created by Amanda Detofol on 11/05/22.
//

import UIKit

class CovidDayDataErrorViewController: UIViewController {
    
    private let errorView = CovidDayDetailErrorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = errorView
    }
    
}
