//
//  DebtDetailViewController.swift
//  debtsdiary
//
//  Created by Ishaq Adheltyo on 29/04/22.
//

import UIKit
import CoreData

class DebtDetailViewController: UIViewController {

    @IBOutlet var screenTitle: UILabel!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var peopleNameTextField: UITextField!
    @IBOutlet var descriptionTextField: UITextField!
    @IBOutlet var amountTextField: UITextField!
    @IBOutlet var paidStatusSlider: UISlider!
    @IBOutlet var submitButton: UIButton!
    
    @IBOutlet var deleteButton: UIButton!
    
    var debtsStruct : Debts? = nil
    
    private let date = Date()
    private var paidStatus = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        submitButton.setRounded()
        deleteButton.isHidden = true
        if(debtsStruct != nil)
        {
            screenTitle.text = "Edit Debt"
            deleteButton.isHidden = false
            peopleNameTextField.text = debtsStruct?.name
            descriptionTextField.text = debtsStruct?.desc
            amountTextField.text = String(debtsStruct!.amount)
            
            if(debtsStruct!.paid == true)
            {
                paidStatusSlider.value = 1.0
            }
            else
            {
                paidStatusSlider.value = 0.0
            }
        }
    }
    
    /**
     * This Function Is To Change Notification Bar On Device
     */
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func paidStatusSliderPressed(_ sender: UISlider) {
        handleSlider(sender: sender)
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        
        if(debtsStruct == nil)
        {
            let entity = NSEntityDescription.entity(forEntityName: "Debts", in: context)
            let newDebt = Debts(entity: entity!, insertInto: context)
            newDebt.name = peopleNameTextField.text
            newDebt.desc = descriptionTextField.text
            newDebt.amount = Double(amountTextField.text!)!
            newDebt.createdAt = date
            
            do
            {
                try context.save()
                navigationController?.popViewController(animated: true)
            }
            catch
            {
                print("context save error")
            }
        }
        else
        {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Debts")
            do {
                let results:NSArray = try context.fetch(request) as NSArray
                for result in results
                {
                    let debt = result as! Debts
                    
                    if(debt == debtsStruct)
                    {
                        debt.name = peopleNameTextField.text!
                        debt.desc = descriptionTextField.text!
                        debt.amount = Double(amountTextField.text!)!
                        debt.paid = paidStatus
                        try context.save()
                        navigationController?.popViewController(animated: true)
                    }
                }
            }
            catch
            {
                print("Fetch Failed")
            }
        }
    }
    
    private func handleSlider (sender : UISlider) {
        if sender.value >= 0.75 {
            sender.setValue(Float(1.0), animated: true)
        }else if sender.value <= 0.25 {
            sender.setValue(Float(0.0), animated: true)
        }else {
            sender.setValue(Float(0.5), animated: true)
        }
        
        if sender == paidStatusSlider
        {
            if sender.value == 1.0
            {
                paidStatus = true
            }
            else
            {
                paidStatus = false
            }
        }

    }
    @IBAction func deleteButtonPressed(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Debts")
        do {
            let results:NSArray = try context.fetch(request) as NSArray
            for result in results
            {
                let debt = result as! Debts
                if(debt == debtsStruct)
                {
                    context.delete(debt)
                    navigationController?.popViewController(animated: true)
                }
            }
        }
        catch
        {
            print("Fetch Failed")
        }
    }
}
