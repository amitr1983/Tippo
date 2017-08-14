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
    
    // Default value for slider
    var currentValue = 1
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        setLastbill()
        setdefaultTipsettings()
        tipCalculate(nil)
        self.view.backgroundColor=UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    //Calculator tip when person slider changes
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        currentValue = Int(sender.value)
        personSlider.value = Float(currentValue)
        personCountLabel.text = "\(currentValue)"
        tipCalculate(sender)
    }
    
    //Calculate tip on the basis of user output
    @IBAction func tipCalculate(_ sender: Any!) {
        let tipPercentage=[0.18,0.20,0.25]
        let perPerson = Double(personSlider.value)
        let bill = Double(billField.text!) ?? 0.0
        let tip = bill * tipPercentage[option.selectedSegmentIndex]
        let billtotal=bill+tip
        let perPersonTotal=(billtotal/perPerson)
        let tipPerPerson=tip/perPerson
        let locale=setdefaultLocale()
        Formatter.currency.locale = Locale(identifier: "\(locale)")
        
        tiplabel.text=tipPerPerson.currency
        totallabel.text=perPersonTotal.currency
        total.text=billtotal.currency
        savelastBill(bill: bill )
    }
    
    // Set value of past bill to Bill field
    func setLastbill(){
        if defaults.value(forKey: "pastBill") != nil {
            let previousBill = defaults.value(forKey: "pastBill") as! Double
            billField.text = "\(previousBill)"
        } else {
            print("Doesn’t have a default past bill value")
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        billField.becomeFirstResponder()
        setLastbill()
        setdefaultTipsettings()
        tipCalculate(nil)
        print("view will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billField.becomeFirstResponder()
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
        
        if defaults.value(forKey: "tipPercentageIndex") != nil {
            let defaultTipIndex = defaults.value(forKey: "tipPercentageIndex")!
            option.selectedSegmentIndex=defaultTipIndex as! Int
        } else {
            print("Doesn’t have a default tip settings.")
        }
    }
    
    func setdefaultLocale()->String {
        var defaultLocale: String
        if defaults.value(forKey: "locale") != nil {
            defaultLocale = defaults.value(forKey: "locale")! as! String
        } else {
            defaultLocale = "en_US"
        }
        return defaultLocale
    }
}

extension NumberFormatter {
    convenience init(style: Style) {
        self.init()
        numberStyle = style
    }
}

extension Formatter {
    static let currency = NumberFormatter(style: .currency)
}

extension FloatingPoint {
    var currency: String {
        return Formatter.currency.string(for: self) ?? ""
    }
}

