//
//  DebtDetailViewController.swift
//  debtsdiary
//
//  Created by Ishaq Adheltyo on 29/04/22.
//

import UIKit

class DebtDetailViewController: UIViewController {

    @IBOutlet var screenTitle: UILabel!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var peopleNameTextField: UITextField!
    @IBOutlet var descriptionTextField: UITextField!
    @IBOutlet var amountTextField: UITextField!
    @IBOutlet var paidStatusSlider: UISlider!
    @IBOutlet var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
