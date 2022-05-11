//
//  CovidDayDetailErrorView.swift
//  covid-tracker
//
//  Created by Amanda Detofol on 11/05/22.
//

import UIKit

class CovidDayDetailErrorView: UIView {
    
    private let errorMessageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 32)
        label.textAlignment = .center
        label.text = "Ops!"
        return label
    }()
    
    private let errorDetailMessageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.text = "We haven't found any data for this day."
        return label
    }()
    
    private let errorImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "ops")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 100
        imageView.backgroundColor = .white
        imageView.isAccessibilityElement = false
        return imageView
    }()
    
    init(){
        super.init(frame: .zero)
        buildView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //Private methods
    private func buildView(){
        self.addSubview(errorMessageLabel)
        self.addSubview(errorDetailMessageLabel)
        self.addSubview(errorImage)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 32),
            errorMessageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            errorMessageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            errorMessageLabel.heightAnchor.constraint(equalToConstant: 100),
            
            errorImage.topAnchor.constraint(equalTo: errorMessageLabel.bottomAnchor, constant: 16),
            errorImage.heightAnchor.constraint(equalToConstant: 200),
            errorImage.widthAnchor.constraint(equalToConstant: 200),
            errorImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            errorDetailMessageLabel.topAnchor.constraint(equalTo: errorImage.bottomAnchor),
            errorDetailMessageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            errorDetailMessageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            errorDetailMessageLabel.heightAnchor.constraint(equalToConstant: 200),
        ])
        
    }
    
}
