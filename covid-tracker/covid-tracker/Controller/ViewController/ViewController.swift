//
//  ViewController.swift
//  covid-tracker
//
//  Created by Amanda Detofol on 08/05/22.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    private lazy var covidDataTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    var covidData: [CovidData] = [] {
        didSet {
            DispatchQueue.main.async {
                self.covidDataTableView.reloadData()
                self.createGraph()
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
    
    private func createGraph(){
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.width/1.5))
        headerView.clipsToBounds = true
        headerView.backgroundColor = .darkGray
        
        
        let set = covidData.prefix(20)
        var entries: [BarChartDataEntry] = []
        for index in 0..<set.count {
            let data = covidData[index]
            entries.append(.init(x: Double(index), y: Double(data.cases.total.value)))
        }
        
        let dataSet = BarChartDataSet(entries: entries)
        dataSet.colors = ChartColorTemplates.vordiplom()
        
        let data = BarChartData(dataSet: dataSet)
        
        let chart = BarChartView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.width/1.5))
        headerView.addSubview(chart)
        chart.data = data
        covidDataTableView.tableHeaderView = headerView
    }
    
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
