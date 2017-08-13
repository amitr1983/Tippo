//
//  ViewController.swift
//  Tippo
//
//  Created by amit kumar on 8/10/17.
//
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var total: UILabel!
    
    @IBOutlet weak var sliderValue: UISlider!
    
    @IBOutlet weak var option: UISegmentedControl!
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tiplabel: UILabel!
    
    @IBOutlet weak var totallabel: UILabel!
    
    @IBOutlet weak var personSlider: UISlider!
    
    @IBOutlet weak var personCountLabel: UILabel!
    
    let defaults:UserDefaults = UserDefaults.standard
    
    var currentValue = 1
    

    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
        setLastbill()
        setdefaultTipsettings()
        tipCalculate(nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        currentValue = Int(sender.value)
        personSlider.value = Float(currentValue)
        personCountLabel.text = "\(currentValue)"
        tipCalculate(sender)
        
    }
    
    @IBAction func tipCalculate(_ sender: Any!) {
        let tipPercentage=[0.18,0.20,0.25]
        let perPerson = Double(personSlider.value)
        let bill = Double(billField.text!) ?? 0.0
        let tip = bill * tipPercentage[option.selectedSegmentIndex]
        let billtotal=bill+tip
        let perPersonTotal=(billtotal/perPerson)
        
        tiplabel.text=String(format: "$%.2f", tip/perPerson)
        totallabel.text=String(format: "$%.2f", perPersonTotal)
        total.text=String(format: "$%.2f", billtotal)
        savelastBill(bill: bill )
    }
    
    func setLastbill(){
        let previousBill = defaults.value(forKey: "pastBill") as! Double
        billField.text = "\(previousBill)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setLastbill()
        setdefaultTipsettings()
        tipCalculate(nil)
        print("view will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setLastbill()
        setdefaultTipsettings()
        tipCalculate(nil)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    func savelastBill(bill: Double){
        defaults.set(bill, forKey: "pastBill")
    }
    
    func setdefaultTipsettings() {
        let defaultTipIndex = defaults.value(forKey: "tipPercentageIndex")!
        option.selectedSegmentIndex=defaultTipIndex as! Int
    }
}

