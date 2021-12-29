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
    var cornerRadius: CGFloat = 10.0

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(listing: Listing) {
        //print(listings)
        unitNumberLabel.text =  Dictionaries.shared.listingIDtoUnitNumber[listing.id]
        unitImageView.downloadImage(from: listing.picture)
        //ratingButton.setTitle("\(listing.rating)", for: .normal)
    }
    
    
    private func applyCornerRadiusAndShadow() {
        // Apply rounded corners to contentView
        contentView.layer.cornerRadius = cornerRadius
        contentView.layer.masksToBounds = true
        
        // Set masks to bounds to false to avoid the shadow
        // from being clipped to the corner radius
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = false
        
        // Apply a shadow
        layer.shadowRadius = 8.0
        layer.shadowOpacity = 0.10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5)
        
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
        let height: CGFloat = itemWidth + 40
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            unitImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            unitImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            unitImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
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
