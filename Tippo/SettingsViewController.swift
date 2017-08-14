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
    
    @IBOutlet weak var localeSettingSegment: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.white
        //Change color of back button
        self.navigationController?.navigationBar.tintColor = UIColor.white
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

    @IBAction func defaultTipSegment(_ sender: Any) {
        let tipPercentageIndex = tipSettingSegment.selectedSegmentIndex
        defaults.set(tipPercentageIndex, forKey: "tipPercentageIndex")

    }
    
    @IBAction func defaultLocale(_ sender: UISegmentedControl) {
        var  localeValue="en_US"
        let localeIndex = localeSettingSegment.selectedSegmentIndex
        
        switch localeIndex
        {
            case 0:
                localeValue = "en_US"
            case 1:
                localeValue = "en_UK";
            case 2:
                localeValue = "fr_FR";
            default:
                break
        }
        //Save locale
        saveLocalesettings(locale: localeValue, index: localeIndex )
    }

    func setdefaultTipsettings() {
        if defaults.value(forKey: "tipPercentageIndex") != nil {
            let defaultTipIndex = defaults.value(forKey: "tipPercentageIndex")!
            tipSettingSegment.selectedSegmentIndex=defaultTipIndex as! Int
        } else {
            print("Doesn’t have a default tip settings.")
        }
    }
    
    func saveLocalesettings(locale: String, index: Int) {
        defaults.set(locale, forKey: "locale")
        defaults.set(index, forKey: "localIndex")
        
    }
    
    func setdefaultLocalesettings() {
        if defaults.value(forKey: "localIndex") != nil {
            let defaultLocaleIndex = defaults.value(forKey: "localIndex")!
            localeSettingSegment.selectedSegmentIndex=defaultLocaleIndex as! Int
        } else {
            print("Doesn’t have a default locale settings.")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setdefaultTipsettings()
        setdefaultLocalesettings()
        defaults.synchronize()
        print("view did appear")
    }

}
