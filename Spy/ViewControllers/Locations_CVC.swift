//
//  Locations_CVC.swift
//  Spy
//
//  Created by Илья Тюрин on 07.04.2021.
//

import UIKit

private let reuseIdentifier = "locGroup"

class Locations_CVC: UICollectionViewController {
    
    let groupes = Group.getGroupes()
    let images = ["countries", "sports", "travels", "culture", "child", "timeMachine"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = .white
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groupes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! LocationCell
        
        // Data model
        cell.group = groupes[indexPath.row]
        // Image
        cell.image.image = UIImage(named: images[indexPath.row])
        // Label
        cell.groupName.layer.shadowRadius = 1
        cell.groupName.text = cell.group.title
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
                let setVC = segue.destination as! Container_VC
                setVC.currentGroup = groupes[indexPath.row]
            }
        }
    }
    
    
    
}
