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
    
    private let userDefaults = UserDefaults.standard
    private var name: String? = ""
    private var currency: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getStartedButton.setRounded()
        
        let text = NSMutableAttributedString()
        text.append(NSAttributedString(string: "Welcome To ", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]));
        text.append(NSAttributedString(string: "Debts ", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "#8DEAA2")]))
        text.append(NSAttributedString(string: "Diary!", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]));
        welcomeTitle.attributedText = text
    }
    
    override func viewWillLayoutSubviews() {
        name = userDefaults.string(forKey: "name")
        currency = userDefaults.string(forKey: "currency")
        if name != nil && currency != nil {
            segueToMain()
        }
    }
    
    private func segueToMain() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController =  storyboard.instantiateViewController(withIdentifier: "main")
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
    
    /**
     * This Function Is To Change Notification Bar On Device
     */
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
