//
//  StateSelectionController.swift
//  covid-tracker
//
//  Created by Amanda Detofol on 08/05/22.
//

import UIKit

class FilterViewController: UIViewController {
    
    private lazy var statesTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    public var completion: ((Datum) -> Void)?
    
    var states: [Datum] = [] {
        didSet {
            DispatchQueue.main.async {
                self.statesTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        self.getStates()
        super.viewDidLoad()
        self.setupView()
        self.setupNavigationController()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.statesTableView.frame = self.view.bounds
    }
    
    // MARK: Private methods
    private func setupNavigationController(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Select a state"
    }
    
    private func setupView() {
        self.view.addSubview(statesTableView)
    }
    
    private func getStates(){
        Service.shared.getStateList { result in
            switch result {
            case .success(let response):
                self.states = response.data
                
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}




