//
//  DebtsHomeViewController.swift
//  debtsdiary
//
//  Created by Ishaq Adheltyo on 28/04/22.
//

import UIKit
import CoreData

class DebtsHomeViewController: UIViewController {

    @IBOutlet var plusButton: UIButton!
    @IBOutlet var debtsTableView: UITableView!
    private var debtsArr = [Debts]()
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private let userDefaults = UserDefaults.standard

    override func viewWillAppear(_ animated: Bool) {
        loadItem()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        debtsTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        debtsTableView.dataSource = self
        debtsTableView.delegate = self
        debtsTableView.backgroundColor = nil
    }
    
    /**
     * This Function Is To Change Notification Bar On Device
     */
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func loadItem() {
        let request: NSFetchRequest<Debts> = Debts.fetchRequest()
        do {
            debtsArr = try context.fetch(request)
            
            // debug
            for debt in debtsArr {
                print("\(String(describing: debt.name))")
            }
            
        } catch {
            print("Fetching data failed")
        }
    }
}

extension DebtsHomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return debtsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "DebtCell", for: indexPath) as? DebtTableViewCell {
            let debt = debtsArr[indexPath.row]
            cell.nameLabel.text = debt.name
            cell.descLabel.text = debt.desc
            
            let currency = userDefaults.string(forKey: "currency")
            cell.amountLabel.text = currency! + " " + String(debt.amount)
            
            let dateF = DateFormatter()
            dateF.dateFormat = "MMM d yyyy"
            let debtDate = dateF.string(from: debt.createdAt!)
            
            cell.dateLabel.text = debtDate
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
