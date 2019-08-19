//
//  CollectionViewController.swift
//  Project13
//
//  Created by Alex Motor on 8/19/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {

    private let dataSource = GirlDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let width = view.frame.width / 3
        
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        
        layout.sectionHeadersPinToVisibleBounds = true
        
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(refreshCollection), for: .valueChanged)
        collectionView.refreshControl = refresh
        
        installsStandardGestureForInteractiveMovement = true
    }
    
    @objc private func refreshCollection() {
        addItem()
        
        collectionView.refreshControl?.endRefreshing()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.girls.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.girls[section].places.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "place", for: indexPath) as! PlaceCollectionViewCell
    
        cell.place = dataSource.girls[indexPath.section].places[indexPath.item]
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as? SectionHeaderView {
            
            view.girl = dataSource.girls[indexPath.section]
            
            return view
        }

        return UICollectionReusableView()
    }
    
    override func collectionView(_ collectionView: UICollectionView, targetIndexPathForMoveFromItemAt originalIndexPath: IndexPath, toProposedIndexPath proposedIndexPath: IndexPath) -> IndexPath {
        if originalIndexPath.section != proposedIndexPath.section {
            return originalIndexPath
        }
        
        return proposedIndexPath
    }
    
    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let girl = dataSource.girls[sourceIndexPath.section]
        girl.places.swapAt(sourceIndexPath.item, destinationIndexPath.item)
    }
    
    @IBAction private func addItem() {
        let randomGirl = dataSource.girls.randomElement()!
        let randomPlace = randomGirl.places.randomElement()!
        
//        var place = Place(name: randomPlace.name, image: randomPlace.imageName)
        let place = randomPlace.copy() as! Place
        place.name = "New place"
        
        let index = Int.random(in: 0..<dataSource.girls.count)
        dataSource.girls[index].places.append(place)
        collectionView.insertItems(at: [IndexPath(item: dataSource.girls[index].places.count - 1, section: index)])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let cell = sender as? UICollectionViewCell, let indexPath = collectionView.indexPath(for: cell) else { return }
        
        let vc = segue.destination as! PlaceViewController
        let girl = dataSource.girls[indexPath.section]
        vc.girl = girl
        vc.place = girl.places[indexPath.item]
    }

}
