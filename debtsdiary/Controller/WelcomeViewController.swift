//
//  WelcomeViewController.swift
//  debtsdiary
//
//  Created by Ishaq Adheltyo on 28/04/22.
//

import UIKit

class WelcomeViewController: UIViewController {

    
    @IBOutlet var getStartedButton: UIButton!
    @IBOutlet var welcomeTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getStartedButton.setRounded()
        
        let text = NSMutableAttributedString()
        text.append(NSAttributedString(string: "Welcome To ", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]));
        text.append(NSAttributedString(string: "Debts ", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "#8DEAA2")]))
        text.append(NSAttributedString(string: "Diary!", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]));
        welcomeTitle.attributedText = text
    }
    
    /**
     * This Function Is To Change Notification Bar On Device
     */
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
