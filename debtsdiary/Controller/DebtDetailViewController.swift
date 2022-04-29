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
    
    var debtsStruct : DebtsStruct = DebtsStruct()
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private let date = Date()
    private var paidStatus = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        submitButton.setRounded()
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
        if peopleNameTextField.hasText && descriptionTextField.hasText && amountTextField.hasText {
            debtsStruct.name = peopleNameTextField.text!
            debtsStruct.desc = descriptionTextField.text!
            debtsStruct.amount = Double(amountTextField.text!)!
            
            let entity = NSEntityDescription.entity(forEntityName: "Debts", in: self.context)
            let newEntry = NSManagedObject(entity: entity!, insertInto: self.context)
            
            self.saveData(entryDBObj: newEntry)
            self.navigationController!.popToRootViewController(animated: true)
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
                debtsStruct.paid = paidStatus
            }
            else
            {
                debtsStruct.paid = paidStatus
            }
        }

    }
    
    private func saveData(entryDBObj:NSManagedObject){
        entryDBObj.setValue(self.debtsStruct.name, forKey: "name")
        entryDBObj.setValue(self.debtsStruct.desc, forKey: "desc")
        entryDBObj.setValue(self.debtsStruct.amount, forKey: "amount")
        entryDBObj.setValue(self.debtsStruct.paid, forKey: "paid")
        entryDBObj.setValue(self.date, forKey: "createdAt")

        do {
            try context.save()
        } catch {
            print("Storing data Failed")
        }

    }
}
