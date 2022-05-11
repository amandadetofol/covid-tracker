//
//  CovidDayDetailView.swift
//  covid-tracker
//
//  Created by Amanda Detofol on 11/05/22.
//

import UIKit

class CovidDayDetailView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 32)
        label.textAlignment = .left
        label.text = "Day Data"
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .left
        return label
    }()
    
    private let positiveCasesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .left
        label.text = "Positive cases: "
        return label
    }()
    
    private let totalTestLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .left
        label.text = "Total tests made: "
        return label
    }()
    private let hospitalizedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .left
        label.text = "Hopitalized: "
        return label
    }()
    
    private let inIcuLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .left
        label.text = "Hospitalized in ICU: "
        return label
    }()
    
    private let deathsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .left
        label.text = "Number os deaths: "
        return label
    }()
    
    init(){
        super.init(frame: .zero)
        self.setupView()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(data: String, state: String, positive: String, totalTest: String, hospitalized:String, inIcu:String, deaths: String){
        self.subtitleLabel.text = state
        self.positiveCasesLabel.text = "\(positiveCasesLabel.text!) \(positive)"
        self.totalTestLabel.text = "\(totalTestLabel.text!) \(totalTest)"
        self.hospitalizedLabel.text = "\(hospitalizedLabel.text!) \(hospitalized)"
        self.hospitalizedLabel.text = "\(hospitalizedLabel.text!) \(hospitalized)"
        self.inIcuLabel.text = "\(inIcuLabel.text!) \(inIcu)"
        self.deathsLabel.text = "\(deathsLabel.text!) \(deaths)"
    }
    
    // MARK: Private methods
    private func setupView(){
        self.addSubview(titleLabel)
        self.addSubview(subtitleLabel)
        self.addSubview(positiveCasesLabel)
        self.addSubview(totalTestLabel)
        self.addSubview(hospitalizedLabel)
        self.addSubview(inIcuLabel)
        self.addSubview(deathsLabel)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: self.bounds.width/2),
            
            self.subtitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 8),
            self.subtitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.subtitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: self.bounds.width/2),
            
            self.positiveCasesLabel.topAnchor.constraint(equalTo: self.subtitleLabel.bottomAnchor, constant: 64),
            self.positiveCasesLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.positiveCasesLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            
            self.totalTestLabel.topAnchor.constraint(equalTo: self.positiveCasesLabel.bottomAnchor, constant: 16),
            self.totalTestLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.totalTestLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            
            self.hospitalizedLabel.topAnchor.constraint(equalTo: self.totalTestLabel.bottomAnchor, constant: 16),
            self.hospitalizedLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.hospitalizedLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            
            self.inIcuLabel.topAnchor.constraint(equalTo: self.hospitalizedLabel.bottomAnchor, constant: 16),
            self.inIcuLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.inIcuLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            
            self.deathsLabel.topAnchor.constraint(equalTo: self.inIcuLabel.bottomAnchor, constant: 16),
            self.deathsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.deathsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            
        ])
    }
    
}


