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
    private var debtsArr = [Debts]()
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewWillAppear(_ animated: Bool) {
        loadItem()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
