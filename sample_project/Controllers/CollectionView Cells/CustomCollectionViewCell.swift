//
//  CustomCollectionViewCell.swift
//  sample_project
//
//  Created by Vaifat Huy on 4/3/21.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(title: String, image: String){
        titleLabel.text = title
        iconImageView.image = UIImage(named: image)
    }

}
