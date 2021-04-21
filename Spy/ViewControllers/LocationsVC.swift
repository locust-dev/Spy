//
//  LocationsVC.swift
//  Spy
//
//  Created by Илья Тюрин on 07.04.2021.
//

import UIKit

private let reuseIdentifier = "locGroup"

class LocationsVC: UICollectionViewController {
    
    let groupes = LocationGroup.getGroupes()
    let images = ["allLocations", "countries", "sports", "travels", "culture", "child", "timeMachine", "adult"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundView = UIImageView(image: UIImage(named: "Spy_Background"))
        navigationController?.navigationBar.tintColor = .white
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        groupes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! LocationCell
        let group = groupes[indexPath.item]
        
        // Image
        cell.image.image = UIImage(named: images[indexPath.row])
        // Background
        let imageBack = UIImageView(image: UIImage(named: "backgroundForCell"))
        imageBack.layer.cornerRadius = 25
        imageBack.clipsToBounds = true
        cell.backgroundView = imageBack
        // Label
        cell.groupName.layer.shadowRadius = 1
        cell.groupName.text = group.title
        // Corners
        cell.contentView.layer.cornerRadius = 25
        cell.contentView.layer.masksToBounds = true
        cell.layer.cornerRadius = 25
        cell.layer.masksToBounds = false
        // Shadow
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowRadius = 5
        cell.layer.shadowOpacity = 1
        cell.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSetLocation" {
            if let indexPath = self.collectionView.indexPathsForSelectedItems?.first {
                let setVC = segue.destination as! ContainerForTableViewVC
                setVC.currentGroup = groupes[indexPath.row]
            }
        }
    }
    
}

extension LocationsVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingWidth: CGFloat = 30 * 2
        let avalibleWidth = collectionView.frame.width - paddingWidth
        return CGSize(width: avalibleWidth, height: 110)
    }
    
}
