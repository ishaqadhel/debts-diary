//
//  HomeViewController.swift
//  debtsdiary
//
//  Created by Ishaq Adheltyo on 28/04/22.
//

import UIKit
import CoreData

class HomeViewController: UIViewController {

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var helloNameLabel: UILabel!
    @IBOutlet var totalDebtsView: UIView!
    @IBOutlet var totalDebtsLabel: UILabel!
    @IBOutlet var unpaidDebtsView: UIView!
    @IBOutlet var unpaidDebtsLabel: UILabel!
    @IBOutlet var settingButton: UIButton!
    
    private let userDefaults = UserDefaults.standard
    private let date = Date()
    private var debtsArr = [Debts]()
    private var unpaidDebtsArr = [Debts]()
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewWillAppear(_ animated: Bool) {
        loadItem()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settingButton.setRounded()
        totalDebtsView.setRounded()
        unpaidDebtsView.setRounded()
        
        let name = userDefaults.string(forKey: "name")
        helloNameLabel.text = "Hello, \(name!)!"
        
        let todayDate = getTodayDate()
        dateLabel.text = todayDate
    }
    
    private func getTodayDate() -> String {
        let dateF = DateFormatter()
        dateF.dateFormat = "EEEE, MMM d yyyy"
        let todayDate = dateF.string(from: date)
        return todayDate
    }
    
    private func loadItem() {
        let request: NSFetchRequest<Debts> = Debts.fetchRequest()
        do {
            debtsArr = try context.fetch(request)
            
            let unpaidDebtsPredicate = NSPredicate(format: "paid == %@", NSNumber(value: false))
            request.predicate = unpaidDebtsPredicate
            
            unpaidDebtsArr = try context.fetch(request)
            
            // debug
            for debt in debtsArr {
                print("\(String(describing: debt.name))")
            }
            
            totalDebtsLabel.text = String(debtsArr.count)
            unpaidDebtsLabel.text = String(unpaidDebtsArr.count)
            
        } catch {
            print("Fetching data failed")
        }
    }

    @IBAction func settingButtonPressed(_ sender: Any) {
    }
    
    /**
     * This Function Is To Change Notification Bar On Device
     */
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
