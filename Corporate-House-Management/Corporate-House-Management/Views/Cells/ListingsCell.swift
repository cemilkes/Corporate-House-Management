//
//  ListingsCell.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/27/21.
//

import UIKit

class ListingsCell: UICollectionViewCell {
    
    static let reuseID  = "ListingsCell"
    let unitImageView   = UnitImageView(frame: .zero)
    let unitNumberLabel = CHTitleLabel(textAlignment: .left, fontSize: 14.0)
    let ratingButton    = CHButton(backgroundColor: .systemGray, title: "Rating")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(listing: Listing) {
        unitNumberLabel.text = listing.id
        ratingButton.setTitle("\(listing.rating)", for: .normal)
    }
    
    
    private func configure() {
        addSubview(unitImageView)
        unitImageView.addSubview(unitNumberLabel)
        addSubview(ratingButton)
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            unitImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            unitImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            unitImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            
            unitNumberLabel.bottomAnchor.constraint(equalTo: unitImageView.bottomAnchor, constant: -padding),
            unitNumberLabel.leadingAnchor.constraint(equalTo: unitImageView.leadingAnchor, constant: padding),
            unitNumberLabel.trailingAnchor.constraint(equalTo: unitImageView.trailingAnchor, constant: -padding),
            unitNumberLabel.heightAnchor.constraint(equalToConstant: 20),
            
            ratingButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
            ratingButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            ratingButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            ratingButton.heightAnchor.constraint(equalToConstant: 16)
            
        ])
    }
    
}
