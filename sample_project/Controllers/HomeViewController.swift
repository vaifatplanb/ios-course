//
//  HomeViewController.swift
//  sample_project
//
//  Created by Vaifat Huy on 3/7/21.
//

import UIKit
import KeychainSwift

class HomeViewController: UIViewController {
    @IBOutlet weak var tapMeButton: UIButton!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var environmentName: UILabel!
    
    let userDefault = UserDefaults()
    let keychain = KeychainSwift()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Label
        headerLabel.text = "Fetched Data from Internet"
//        if let textFromUserDefault = userDefault.string(forKey: UserDefaultKeys.age.value) {
//            headerLabel.text = textFromUserDefault
//        }
        
        if let textFromKeychain = keychain.get(KeychainKeys.age.value) {
            headerLabel.text = textFromKeychain
        }
        nameTextField.placeholder = "Input name here"
        
        environmentName.text = Configuration.environment.baseURL
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        guard let text = ageTextField.text else { return }
        // Save content in ageTextField to UserDefaults
//        userDefault.set(text, forKey: UserDefaultKeys.age.value)
//        if let textFromUserDefault = userDefault.string(forKey: UserDefaultKeys.age.value) {
//            headerLabel.text = textFromUserDefault
//        }
        
        // Store content in ageTextField to Keychain
        keychain.set(text, forKey: KeychainKeys.age.value)
        
        if let textFromKeychain = keychain.get(KeychainKeys.age.value) {
            headerLabel.text = textFromKeychain
        }
    }
    
    // Touch up inside
    @IBAction func tapMeButtonClicked(_ sender: Any) {
        print("TapMe button clicked")
        let storybard = UIStoryboard(name: "Main", bundle: nil)
        let sampleVC = storybard.instantiateViewController(withIdentifier: "CustomCollectionViewController")
        sampleVC.modalPresentationStyle = .fullScreen
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
