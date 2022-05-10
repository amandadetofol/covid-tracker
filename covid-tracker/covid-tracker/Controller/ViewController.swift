//
//  ViewController.swift
//  covid-tracker
//
//  Created by Amanda Detofol on 08/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    public var scope: DataScope = .nationalData

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    //MARK: Private methods
    private func setupNavigationBar(){
        self.navigationController?.navigationBar.prefersLargeTitles = true 
        self.navigationItem.title = "COVID Cases"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter",
                                                                 style: .done,
                                                                 target: self,
                                                                 action: #selector(handleFilterButtonTap))
    }
    
    private func fetchData(){
        
    }

}

extension ViewController {
    
    @objc func handleFilterButtonTap() {
        let viewController = FilterViewController()
        viewController.completion = { state in
            self.scope = .perStateData(state)
            self.fetchData()
        }
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
