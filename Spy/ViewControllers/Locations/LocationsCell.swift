//
//  LocationCell.swift
//  Spy
//
//  Created by Илья Тюрин on 07.04.2021.
//

import UIKit

class LocationsCell: UICollectionViewCell {
    
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var imageLocation: UIImageView!
    
    func configureCell(group: LocationGroup, image: UIImage) {
        let imageBack = UIImageView(image: UIImage(named: "backgroundForCell"))
        imageBack.layer.cornerRadius = 25
        imageBack.clipsToBounds = true
        backgroundView = imageBack
        
        groupName.layer.shadowRadius = 1
        groupName.text = group.title
        
        imageLocation.image = image
        contentView.layer.cornerRadius = 25
        contentView.layer.masksToBounds = true
        layer.cornerRadius = 25
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 5
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 1, height: 1)
    }
    
}
