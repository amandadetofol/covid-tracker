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
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter",
                                                                 style: .done,
                                                                 target: self,
                                                                 action: #selector(handleFilterButtonTap))
    }

}

extension ViewController {
    
    @objc func handleFilterButtonTap() {
        let viewController = FilterViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
