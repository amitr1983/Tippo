//
//  SettingsViewController.swift
//  Tippo
//
//  Created by amit kumar on 8/11/17.
//
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipSettingSegment: UISegmentedControl!
    
    var currentValue = 1

    let defaults:UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setdefaultTipsettings()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func defaultTipSlider(_ sender: UISlider) {
        let tipPercentageIndex = tipSettingSegment.selectedSegmentIndex
        defaults.set(tipPercentageIndex, forKey: "tipPercentageIndex")

    }
    
    func setdefaultTipsettings() {
        let defaultTipIndex = defaults.value(forKey: "tipPercentageIndex")!
        tipSettingSegment.selectedSegmentIndex=defaultTipIndex as! Int
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setdefaultTipsettings()
        print("view did appear")
    }
    

}
