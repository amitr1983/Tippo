//
//  ViewController.swift
//  Tippo
//
//  Created by amit kumar on 8/10/17.
//
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var camera: UIBarButtonItem!

    @IBOutlet weak var total: UILabel!
    
    @IBOutlet weak var sliderValue: UISlider!
    
    @IBOutlet weak var option: UISegmentedControl!
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tiplabel: UILabel!
    
    @IBOutlet weak var totallabel: UILabel!
    
    @IBOutlet weak var personSlider: UISlider!
    
    @IBOutlet weak var personCountLabel: UILabel!
    
    let defaults:UserDefaults = UserDefaults.standard
    
    let imagePicker = UIImagePickerController()
    
    // Default value for slider
    var currentValue: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        setLastbill()
        setdefaultTipsettings()
        tipCalculate(nil)
        self.navigationController?.view.backgroundColor = UIColor.white
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
        let bill = Double(billField.text!) ?? 0.00
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
        //handle nav controller recoloring
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        billField.becomeFirstResponder()
        themeColor()
        setLastbill()
        setdefaultTipsettings()
        tipCalculate(nil)
        defaults.synchronize()
        print("view will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        themeColor()
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
    
    @IBAction func animateStart(_ sender: UITextField) {
        UIView.animate(withDuration: 1.0, animations: {
            self.billField.backgroundColor=UIColor(red: 246/255.0, green: 246/255.0, blue: 246/255.0, alpha: 1.0)
            })
        
    }
    
    @IBAction func animateStop(_ sender: UITextField) {
        billField.backgroundColor=UIColor.white
    }

    //Apply theme color
    func themeColor() {

        let theme=selectTheme()
        
        let lightBackground = UIColor.Theme.light.backgroundColor
        let darkBackground = UIColor.Theme.dark.backgroundColor
        let tintLightcolor = UIColor.Theme.light.tintColor
        let tintDarkcolor = UIColor.Theme.dark.tintColor
        let sliderLightBackground = UIColor.Theme.light.sliderColor
        let sliderDarkBackground = UIColor.Theme.dark.sliderColor
        
        switch theme {
        case "isLight":
            let barColor = self.navigationController?.navigationBar
            barColor?.barTintColor = tintLightcolor
            barColor?.barTintColor = UIColor.Theme.light.tintColor
            
            barColor?.tintColor = lightBackground
            barColor?.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
            view.backgroundColor = lightBackground
            billField.backgroundColor=lightBackground
            personCountLabel.textColor=tintLightcolor
            option.backgroundColor=lightBackground
            option.tintColor=tintLightcolor
            sliderValue.tintColor=tintLightcolor
            sliderValue.maximumTrackTintColor=sliderLightBackground
        case "isDark":
            let barColor = self.navigationController?.navigationBar
            barColor?.barTintColor = darkBackground
            barColor?.tintColor = lightBackground
            barColor?.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
            view.backgroundColor = tintDarkcolor
            billField.backgroundColor=lightBackground
            personCountLabel.textColor=darkBackground
            sliderValue.tintColor=sliderDarkBackground
            sliderValue.maximumTrackTintColor=sliderLightBackground
            option.backgroundColor=darkBackground
            option.tintColor=UIColor.white
        default:
            break
            
        }
    }
    
    func selectTheme() -> String{
        
        var theme: String
        if defaults.value(forKey: "theme") != nil {
            theme = defaults.value(forKey: "theme")! as! String
        } else {
            theme = "isLight"
        }
        print(theme)
        return theme
    }
    
    @IBAction func openCamera(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let capturedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            UIImageWriteToSavedPhotosAlbum(capturedImage, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
            
            dismiss(animated: true, completion: nil)
        }
    }
    
    func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            let alert = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        } else {
            let alert = UIAlertController(title: "Photo Saved", message: "Your Reciept has been Saved", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
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

