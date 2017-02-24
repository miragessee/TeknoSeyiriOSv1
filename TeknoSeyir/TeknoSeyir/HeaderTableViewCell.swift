//
//  HeaderTableViewCell.swift
//  TeknoSeyir
//
//  Created by Admin on 20/12/2016.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell , UITextFieldDelegate/*, SlideMenuDelegate*/{
    
    /*internal func slideMenuItemSelectedAtIndex(_ index: Int32) {
        print("zzaa")
    }*/

    @IBOutlet weak var ayarlarButton: UIButton!
    @IBOutlet weak var araButton: UIButton!
    @IBOutlet weak var headerGradientView: GradientView!
    @IBOutlet weak var headerRoundedView: UIView!
    @IBOutlet weak var cb1: VKCheckbox!
    @IBOutlet weak var cb2: VKCheckbox!
    @IBOutlet weak var cb3: VKCheckbox!
    @IBOutlet weak var cb4: VKCheckbox!
    @IBOutlet weak var cb5: VKCheckbox!
    @IBOutlet weak var aramaTextField: UITextField!

    // MARK: - Properties
    
    //let gradientView = GradientView()
    
    /*override func layoutSubviews() {
        headerView = gradientView
        self.backgroundView = UIView()
        self.backgroundView?.layer.insertSublayer(gradientView.layer, at: 0)
        
        gradientView.colors = [
            HexStringToUIColor.hexStringToUIColor(hex: "#ab1500"),
            .white
        ]
        
        // You can configure the locations as well
        gradientView.locations = [0.4, 1]
    }*/
    
    /*let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    var menuController : UIViewController = UIViewController()*/
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        aramaTextField.delegate = self
        
        /*self.backgroundView = UIView()
        self.backgroundView?.layer.insertSublayer(gradientView.layer, at: 0)
        
        headerView = gradientView*/
        
        /*gradientView.colors = [
            HexStringToUIColor.hexStringToUIColor(hex: "#ab1500"),
            .white
        ]
        
        // You can configure the locations as well
        gradientView.locations = [0.4, 1]*/
        
        headerGradientView.colors = [HexStringToUIColor.hexStringToUIColor(hex: "#ab1500"),.white]
        
        headerGradientView.locations = [0.4, 1]
        
        headerRoundedView.layer.cornerRadius = 8.0
        
        headerRoundedView.layer.shadowColor = UIColor.black.cgColor
        headerRoundedView.layer.shadowOffset = CGSize.zero
        headerRoundedView.layer.shadowOpacity = 0.5
        headerRoundedView.layer.shadowRadius = 5
        
        cb1.checkboxValueChangedBlock = {
            isOn in
            print("Basic checkbox is \(isOn ? "ON" : "OFF")")
            if (isOn)
            {
                self.cb2.setOn(false)
                self.cb3.setOn(false)
                self.cb4.setOn(false)
                self.cb5.setOn(false)
            }
        }
        
        cb2.checkboxValueChangedBlock = {
            isOn in
            print("Basic checkbox is \(isOn ? "ON" : "OFF")")
            if (isOn)
            {
                self.cb1.setOn(false)
                self.cb3.setOn(false)
                self.cb4.setOn(false)
                self.cb5.setOn(false)
            }
        }
        
        cb3.checkboxValueChangedBlock = {
            isOn in
            print("Basic checkbox is \(isOn ? "ON" : "OFF")")
            if (isOn)
            {
                self.cb1.setOn(false)
                self.cb2.setOn(false)
                self.cb4.setOn(false)
                self.cb5.setOn(false)
            }
        }
        
        cb4.checkboxValueChangedBlock = {
            isOn in
            print("Basic checkbox is \(isOn ? "ON" : "OFF")")
            if (isOn)
            {
                self.cb1.setOn(false)
                self.cb2.setOn(false)
                self.cb3.setOn(false)
                self.cb5.setOn(false)
            }
        }
        
        cb5.checkboxValueChangedBlock = {
            isOn in
            print("Basic checkbox is \(isOn ? "ON" : "OFF")")
            if (isOn)
            {
                self.cb1.setOn(false)
                self.cb2.setOn(false)
                self.cb3.setOn(false)
                self.cb4.setOn(false)
            }
        }
        
        //araButton.addTarget(self, action: #selector(MenuViewController.araClick(_:)), for: .touchUpInside)
        /*let longPressGesture:UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.longPress(_:)))
        longPressGesture.minimumPressDuration = 0.3 // 1 second press
        longPressGesture.delegate = self*/
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /*@IBAction func araAction(_ button:UIButton!) {
        /*let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let viewControl : ViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        var URL = NSURL(string: "https://teknoseyir.com/?s=" + aramaTextField.text! + "&type=")
        viewControl.webView.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)*/
        print("asdasd")
        //menuController = storyBoard.instantiateViewController(withIdentifier: "MenuViewController")
        
        ViewController.URL = NSURL(string: "https://teknoseyir.com/?s=" + aramaTextField.text! + "&type=")

        /*let menuVC : MenuViewController = storyBoard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        menuVC.delegate = self
        
        BaseViewController.isOpen = false
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            menuVC.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            menuVC.view.layoutIfNeeded()
            menuVC.view.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            menuVC.view.removeFromSuperview()
            menuVC.removeFromParentViewController()
        })*/
    }*/
    
    func textFieldShouldReturn(_ aramaTextField: UITextField) -> Bool {
        cb1.checkboxValueChangedBlock = {
            isOn in
            print("Basic checkbox is \(isOn ? "ON" : "OFF")")
            if (isOn)
            {
                ViewController.URL = NSURL(string: "https://teknoseyir.com/?s=" + aramaTextField.text! + "&type=")
            }
        }
        cb2.checkboxValueChangedBlock = {
            isOn in
            print("Basic checkbox is \(isOn ? "ON" : "OFF")")
            if (isOn)
            {
                ViewController.URL = NSURL(string: "https://teknoseyir.com/?s=" + aramaTextField.text! + "&type=video")
            }
        }
        cb3.checkboxValueChangedBlock = {
            isOn in
            print("Basic checkbox is \(isOn ? "ON" : "OFF")")
            if (isOn)
            {
                ViewController.URL = NSURL(string: "https://teknoseyir.com/?s=" + aramaTextField.text! + "&type=inceleme")
            }
        }
        cb4.checkboxValueChangedBlock = {
            isOn in
            print("Basic checkbox is \(isOn ? "ON" : "OFF")")
            if (isOn)
            {
                ViewController.URL = NSURL(string: "https://teknoseyir.com/?s=" + aramaTextField.text! + "&type=user")
            }
        }
        cb5.checkboxValueChangedBlock = {
            isOn in
            print("Basic checkbox is \(isOn ? "ON" : "OFF")")
            if (isOn)
            {
                ViewController.URL = NSURL(string: "https://teknoseyir.com/?s=" + aramaTextField.text! + "&type=blog")
            }
        }
        ViewController.URL = NSURL(string: "https://teknoseyir.com/?s=" + aramaTextField.text! + "&type=")
        aramaTextField.resignFirstResponder()
        return true
    }
}
