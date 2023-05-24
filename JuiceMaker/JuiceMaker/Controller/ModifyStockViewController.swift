//
//  ModifyStockViewController.swift
//  JuiceMaker
//
//  Created by Yena on 2023/05/16.
//

import UIKit

class ModifyStockViewController: UIViewController {
    
    var fruitStocks: [Int] = [Int]()

    @IBOutlet var fruitStockLabels: [UILabel]!
    @IBOutlet var fruitStockSteppers: [UIStepper]!
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(getStock), name: Notification.Name("modifyNotification"), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateFruitStockLabel()
        initializeFruitStockStepper()
    }
    
    @objc func getStock(_ notification: Notification) {
        if let stocks = notification.userInfo?["inventory"] as? [Int] {
            fruitStocks = stocks
        }
    }
    
    @IBAction func touchUpStepper(_ sender: UIStepper) {
        guard let stepperIndex = fruitStockSteppers.firstIndex(of: sender) else {
            return
        }
        fruitStocks[stepperIndex] = Int(sender.value)
        fruitStockLabels[stepperIndex].text = String(Int(sender.value))
    }
    
    @IBAction func dismissModal(_ sender: UIButton) {
        let stock = ["inventory": fruitStocks]
        NotificationCenter.default.post(name: Notification.Name("juiceMakerNotification") ,object: nil, userInfo: stock)
        dismiss(animated: true, completion: nil)
    }
    
    func updateFruitStockLabel() {
        for fruitStockLabel in fruitStockLabels {
            fruitStockLabel.text = String(fruitStocks[fruitStockLabel.tag])
        }
    }
    func initializeFruitStockStepper() {
        for fruitStockStepper in fruitStockSteppers {
            fruitStockStepper.minimumValue = Double(fruitStocks[fruitStockStepper.tag])
        }
    }
}
