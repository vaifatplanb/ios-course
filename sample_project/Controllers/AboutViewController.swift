//
//  AboutViewController.swift
//  sample_project
//
//  Created by Vaifat Huy on 3/21/21.
//

import UIKit

class AboutViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var closeButtonBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "iOS Course PLAN-B"
        welcomeLabel.textColor = UIColor(white: 0.5, alpha: 0.5)
        closeButtonBottomConstraint.constant = 56.0
        view.layoutIfNeeded()
    }
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        dismiss(animated: true) {
            print("AboutVC is dismissed")
        }
    }
}
