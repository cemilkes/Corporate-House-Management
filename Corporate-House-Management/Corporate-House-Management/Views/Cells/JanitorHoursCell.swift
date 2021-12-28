//
//  JanitorHoursCell.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/27/21.
//

import UIKit

class JanitorHoursCell: UITableViewCell {
    
    // MARK: Error occured - Fixed
    //Warning once only: Detected a case where constraints ambiguously suggest a height of zero for a table view cell's content view. We're considering the collapse unintentional and using standard height instead.
    //https://www.hackingwithswift.com/forums/ios/uitableview-automatic-row-height-programatically/2203
    static let reuseID = "JanitorHoursCell"
    
    var dateLabel                   = CHTitleLabel(textAlignment: .left, fontSize: 16)
    var dailyTotalLabel             = CHTitleLabel(textAlignment: .right, fontSize: 14)
    var unitNumberLabel             = CHBodyLabel(textAlignment: .left)
    var unitNumberCleaningFeeLabel  = CHBodyLabel(textAlignment: .left)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configure()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func configure() {
        backgroundColor = .clear
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        addSubview(unitNumberLabel)
        addSubview(unitNumberCleaningFeeLabel)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            unitNumberLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            unitNumberLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: padding),
            unitNumberLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            
            unitNumberCleaningFeeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            unitNumberCleaningFeeLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -padding),
            unitNumberCleaningFeeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding)
            
        ])
    }
    
}
