//
//  FirstSetupViewController.swift
//  debtsdiary
//
//  Created by Ishaq Adheltyo on 28/04/22.
//

import UIKit

class FirstSetupViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var currencyTextField: UITextField!
    @IBOutlet var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func segueToMain() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController =  storyboard.instantiateViewController(withIdentifier: "main")
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
    

    @IBAction func submitButtonPressed(_ sender: Any) {
        segueToMain()
    }
}
