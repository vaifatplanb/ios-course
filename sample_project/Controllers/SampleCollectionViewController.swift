//
//  SampleCollectionViewController.swift
//  sample_project
//
//  Created by Vaifat Huy on 4/3/21.
//

import UIKit

private let reuseIdentifier = "CustomCollectionViewCell"
private let headerIdentifier = "CustomHeaderCollectionReusableView"

class SampleCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var list = [
        "WELCOME", "TO", "MY", "COURSE", "PLAN-B", "2021"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        let nib = UINib(nibName: "CustomCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Register Collection Reusable Views
        let headerNib = UINib(nibName: "CustomHeaderCollectionReusableView", bundle: nil)
        self.collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier, for: indexPath) as! CustomHeaderCollectionReusableView
            view.configureView(title: "SECTION \(indexPath.section)")
            return view
            
        }else { return UICollectionReusableView() }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2, height: 40)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CustomCollectionViewCell
        cell.configureCell(title: "Sample \(indexPath.item)", image: "ios14")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2, height: 50)
    }
}
