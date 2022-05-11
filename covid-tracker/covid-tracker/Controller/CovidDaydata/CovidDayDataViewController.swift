//
//  CovidDayDataViewController.swift
//  covid-tracker
//
//  Created by Amanda Detofol on 11/05/22.
//

import UIKit

class CovidDayDataViewController: UIViewController {
    
    private var dayDataView: CovidDayDetailView = CovidDayDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = dayDataView
    }
    
    // MARK: Public methods
    public func configure(data: String, state: String, positive: String, totalTest: String, hospitalized:String, inIcu:String, deaths: String){
        dayDataView.configure(data: data,
                              state: state,
                              positive: positive,
                              totalTest: totalTest,
                              hospitalized: hospitalized,
                              inIcu: inIcu,
                              deaths: deaths)
    }
}
