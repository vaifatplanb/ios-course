//
//  HomeViewController.swift
//  sample_project
//
//  Created by Vaifat Huy on 3/7/21.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tapMeButton: UIButton!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Label
        headerLabel.text = "Fetched Data from Internet"
        nameTextField.placeholder = "Input name here"
    }
    
    // Touch up inside
    @IBAction func tapMeButtonClicked(_ sender: Any) {
        print("TapMe button clicked")
        let storybard = UIStoryboard(name: "Main", bundle: nil)
        let sampleVC = storybard.instantiateViewController(withIdentifier: "SampleTableViewController")
        present(sampleVC, animated: true) {
            print("This is called after the viewController is presented")
        }
    }
    
    // Value Changed
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        print("Status: \(sender.isOn)")
        if sender.isOn {
            indicatorView.startAnimating()
        }else {
            indicatorView.stopAnimating()
        }
    }
}
