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
    let images = ["countries", "sports", "travels"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem?.tintColor = .white
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groupes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! LocationCell
    
        cell.group = groupes[indexPath.row]
        cell.groupName.text = cell.group.title
        cell.image.image = UIImage(named: images[indexPath.row])
        cell.image.alpha = 0.9
        cell.layer.cornerRadius = 25
        cell.groupName.layer.cornerRadius = 25
        cell.groupName.layer.masksToBounds = true
        
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
