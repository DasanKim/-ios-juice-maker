//
//  ModifyStockViewController.swift
//  JuiceMaker
//
//  Created by Yena on 2023/05/16.
//

import UIKit

class ModifyStockViewController: UIViewController {

    var fruitStore: FruitStore = FruitStore.shared
    @IBOutlet var fruitStockLabels: [UILabel]!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitStockLabel()
    }
    
    @IBAction func dismissModal(_ sender: UIButton) {
        // stepper 구현 예정
        for i in 0..<fruitStore.fruitInventory.count {
            fruitStore.fruitInventory[i] += 100
        }
        dismiss(animated: true, completion: nil)
    }
    
    func updateFruitStockLabel() {
        for fruitStockLabel in fruitStockLabels {
            fruitStockLabel.text = String(fruitStore.fruitInventory[fruitStockLabel.tag])
        }
    }
}
