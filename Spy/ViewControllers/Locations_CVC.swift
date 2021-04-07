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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groupes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! LocationCell
    
        cell.group = groupes[indexPath.row]
        cell.groupName.text = cell.group.title
        
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
