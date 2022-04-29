//
//  SettingViewController.swift
//  debtsdiary
//
//  Created by Ishaq Adheltyo on 28/04/22.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet var backButton: UIButton!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var currencyTextField: UITextField!
    @IBOutlet var submitButton: UIButton!
    
    private let userDefaults = UserDefaults.standard
    private var name: String? = ""
    private var currency: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        submitButton.setRounded()
        
        if userDefaults.string(forKey: "name") != nil && userDefaults.string(forKey: "currency") != nil {
            nameTextField.text = userDefaults.string(forKey: "name")
            currencyTextField.text = userDefaults.string(forKey: "currency")
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        if nameTextField.hasText && currencyTextField.hasText
        {
            name = nameTextField.text
            currency = currencyTextField.text
            userDefaults.set(nameTextField.text, forKey: "name")
            userDefaults.set(currencyTextField.text, forKey: "currency")
            segueToMain()
        }
        else
        {
            if nameTextField.text == ""
            {
                setAlert(textField: nameTextField, title: "Name Empty", message: "Please Add Your Name")
            }
            else if currencyTextField.text == ""
            {
                setAlert(textField: currencyTextField, title: "Currency Empty", message: "Please Add Your Currency")
            }
        }
    }
    
    /**
     * This Function Is To Change Notification Bar On Device
     */
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func segueToMain() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController =  storyboard.instantiateViewController(withIdentifier: "main")
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
    
    private func setAlert(textField: UITextField, title: String, message: String)
    {
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.red.cgColor
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okayButton = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(okayButton)
        self.present(alert, animated: true, completion: nil)
    }
}
