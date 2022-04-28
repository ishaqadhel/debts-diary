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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
    }
    
    /**
     * This Function Is To Change Notification Bar On Device
     */
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
