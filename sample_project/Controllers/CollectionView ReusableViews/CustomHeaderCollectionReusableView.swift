//
//  CustomHeaderCollectionReusableView.swift
//  sample_project
//
//  Created by Vaifat Huy on 4/3/21.
//

import UIKit

class CustomHeaderCollectionReusableView: UICollectionReusableView {
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        title.textColor = .white
        backgroundColor = .gray
    }
    
    func configureView(title: String) {
        self.title.text = title
    }
    
}
