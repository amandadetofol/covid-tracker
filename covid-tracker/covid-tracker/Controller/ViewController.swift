//
//  ViewController.swift
//  covid-tracker
//
//  Created by Amanda Detofol on 08/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var covidDataTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.dataSource = self
        return tableView
    }()
    
    var covidData: [CovidData] = [] {
        didSet {
            DispatchQueue.main.async {
                self.covidDataTableView.reloadData()
            }
        }
    }
    
    public var scope: DataScope = .nationalData
    
    override func viewDidLoad() {
        self.fetchData()
        super.viewDidLoad()
        self.setupView()
        self.setupNavigationBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.covidDataTableView.frame = self.view.frame
    }
    
    //MARK: Private methods
    private func setupView(){
        self.view.addSubview(covidDataTableView)
    }
    
    private func setupNavigationBar(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "COVID Cases"
        self.setupRightBarButton()
    }
    
    private func setupRightBarButton(){
        var textTitle: String
        switch scope {
        case .nationalData:
            textTitle = "National"
        case .perStateData(let datum):
            textTitle = datum.name
        }
        DispatchQueue.main.async {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: textTitle,
                                                                     style: .done,
                                                                     target: self,
                                                                     action: #selector(self.handleFilterButtonTap))
        }
    }
    
    private func fetchData(){
        let service = Service.shared
        service.delegate = self
        
        service.getCovidData(for: self.scope) { result in
            switch result {
            case .success(let covidData):
                self.covidData = covidData.data
                self.setupRightBarButton()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}


extension ViewController: HandleServiceError {
    func handleError() {
        let alert = UIAlertController(title: "Ops!", message: "The data for this state are unavailable", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default) { action in
            self.dismiss(animated: true )
        }
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.covidData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellId")
        cell.textLabel?.text = "Date: \(covidData[indexPath.row].date)"
        cell.detailTextLabel?.text = "Positive cases: \(covidData[indexPath.row].cases.total.value)"
        return cell
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
