//
//  HomeViewController.swift
//  debtsdiary
//
//  Created by Ishaq Adheltyo on 28/04/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var helloNameLabel: UILabel!
    @IBOutlet var totalDebtsView: UIView!
    @IBOutlet var totalDebtsLabel: UILabel!
    @IBOutlet var unpaidDebtsView: UIView!
    @IBOutlet var unpaidDebtsLabel: UILabel!
    @IBOutlet var settingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settingButton.setRounded()
        totalDebtsView.setRounded()
        unpaidDebtsView.setRounded()
    }
    

    @IBAction func settingButtonPressed(_ sender: Any) {
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
