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
        //print(listings)
        unitNumberLabel.text = listing.id
        //ratingButton.setTitle("\(listing.rating)", for: .normal)
    }
    
    
    private func configure() {
        addSubview(unitImageView)
        addSubview(unitNumberLabel)
        //addSubview(ratingButton)
        let width = contentView.bounds.width
        let padding2: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth = width - (padding2 * 2) - (minimumItemSpacing)
        let itemWidth = availableWidth / 2
        let height: CGFloat = itemWidth
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            unitImageView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            unitImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            unitImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            unitImageView.heightAnchor.constraint(equalToConstant: height),
            
            unitNumberLabel.topAnchor.constraint(equalTo: unitImageView.bottomAnchor, constant: 1),
            unitNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            unitNumberLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            unitNumberLabel.heightAnchor.constraint(equalToConstant: 20)
            
//            ratingButton.topAnchor.constraint(equalTo: unitImageView.bottomAnchor, constant: padding),
//            ratingButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
//            ratingButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
//            ratingButton.heightAnchor.constraint(equalToConstant: 16)
            
        ])
    }
    
}
