//
//  JanitorHoursHeaderView.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 1/15/22.
//

import UIKit

class JanitorHoursHeaderView: UITableViewHeaderFooterView {

    static let reuseID          = "JanitorHoursHeaderCell"
    let padding: CGFloat        = 8
    let totalAmountSoFarLabel   = CHTitleLabel(textAlignment: .left, fontSize: 20)
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        //configure()
        backgroundColor = .systemPink
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        
        contentView.addSubview(totalAmountSoFarLabel)
        totalAmountSoFarLabel.backgroundColor = .systemPurple
        
        NSLayoutConstraint.activate([
            totalAmountSoFarLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            totalAmountSoFarLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            totalAmountSoFarLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
            totalAmountSoFarLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
        
    }
    
}
