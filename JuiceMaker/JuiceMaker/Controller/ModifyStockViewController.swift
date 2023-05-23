//
//  ModifyStockViewController.swift
//  JuiceMaker
//
//  Created by Yena on 2023/05/16.
//

import UIKit

class ModifyStockViewController: UIViewController {
    let fruitStore: FruitStore = FruitStore.shared
    
    @IBOutlet var fruitStockLabels: [UILabel]!
    @IBOutlet var fruitStockSteppers: [UIStepper]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitStockLabel()
        initializeStepperValue()
    }
    
    @IBAction func touchUpStepper(_ sender: UIStepper) {
        if let stepperIndex = fruitStockSteppers.firstIndex(of: sender){
            fruitStore.fruitInventory[stepperIndex] = Int(sender.value)
            fruitStockLabels[stepperIndex].text = String(fruitStore.fruitInventory[stepperIndex])
        }
    }
    
    @IBAction func dismissModal(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    private func updateFruitStockLabel() {
        for fruitStockLabel in fruitStockLabels {
            fruitStockLabel.text = String(fruitStore.fruitInventory[fruitStockLabel.tag])
        }
    }
    
    private func initializeStepperValue() {
        for fruitStockStepper in fruitStockSteppers {
            fruitStockStepper.value = Double(fruitStore.fruitInventory[fruitStockStepper.tag])
        }
    }
}
