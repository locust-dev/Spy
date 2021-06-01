//
//  LocationsVC.swift
//  Spy
//
//  Created by Илья Тюрин on 07.04.2021.
//

import UIKit

private let reuseIdentifier = "locGroup"

class LocationsVC: UICollectionViewController {
    
    private let groupes = LocationGroup.getGroupes()
    private let info = InfoManager.shared
    
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
        let image = UIImage(named: info.imagesForLocations[indexPath.row])
        cell.configureCell(group: group, image: image!)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSetLocation" {
            if let indexPath = self.collectionView.indexPathsForSelectedItems?.first {
                let containerVC = segue.destination as! ContainerForTableViewVC
                containerVC.currentGroup = groupes[indexPath.row]
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
