//
//  PopUpViewController.swift
//  TeknoSeyir
//
//  Created by Admin on 26/12/2016.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController , UIGestureRecognizerDelegate{

    @IBOutlet weak var kapatButton: UIButton!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        popupView.layer.cornerRadius = 8.0
        
        popupView.layer.shadowColor = UIColor.black.cgColor
        popupView.layer.shadowOffset = CGSize.zero
        popupView.layer.shadowOpacity = 0.5
        popupView.layer.shadowRadius = 5
        
        kapatButton.backgroundColor = .clear
        kapatButton.layer.cornerRadius = 5
        kapatButton.layer.borderWidth = 1
        kapatButton.layer.borderColor = UIColor.black.cgColor
        
        let longPressGesture:UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.longPress(_:)))
        longPressGesture.minimumPressDuration = 0.3 // 1 second press
        longPressGesture.delegate = self
        self.tableView.addGestureRecognizer(longPressGesture)
    }
    
    func longPress(_ longPressGestureRecognizer: UILongPressGestureRecognizer) {
        
        if longPressGestureRecognizer.state == UIGestureRecognizerState.began {
            
            let touchPoint = longPressGestureRecognizer.location(in: self.tableView)
            if let indexPath = tableView.indexPathForRow(at: touchPoint) {
                
                // your code here, get the row for the indexPath or do whatever you want
                print("basili tutmaya başladım QWEWQE")
                print(indexPath.row)
                ViewController.favoriHashTag = ViewController.strArray[indexPath.row]
                ViewController.favoriHasTagUrl = ViewController.strArrayLinkleri[indexPath.row]
                UIView.animate(withDuration: 0.3, animations:
                    {
                        self.view.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
                        self.view.alpha = 0
                        
                }) { (success:Bool) in
                    self.navigationController?.navigationBar.isHidden = false
                    self.tabBarController?.tabBar.isHidden = false
                    self.view.removeFromSuperview()
                }
            }
        }
        /*else if longPressGestureRecognizer.state == UIGestureRecognizerState.ended {
            let touchPoint = longPressGestureRecognizer.location(in: self.popupView)
            if let indexPath = tableView.indexPathForRow(at: touchPoint) {
                
                // your code here, get the row for the indexPath or do whatever you want
                print("basili tutmayı bıraktım")
                print(indexPath.row)
                ViewController.favoriHashTag = ViewController.strArray[indexPath.row]
                ViewController.favoriHasTagUrl = ViewController.strArrayLinkleri[indexPath.row]
                UIView.animate(withDuration: 0.3, animations:
                    {
                        self.view.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
                        self.view.alpha = 0
                        
                }) { (success:Bool) in
                    self.navigationController?.navigationBar.isHidden = false
                    self.tabBarController?.tabBar.isHidden = false
                    self.view.removeFromSuperview()
                }
            }
        }*/
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func kapatAction(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations:
            {
                self.view.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
                self.view.alpha = 0
                
        }) { (success:Bool) in
            self.navigationController?.navigationBar.isHidden = false
            self.tabBarController?.tabBar.isHidden = false
            self.view.removeFromSuperview()
        }
    }
    
    func popupKapat(_ sender: UIButton)
    {
        self.view.removeFromSuperview()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: -
// MARK: UITableView Data Source

extension PopUpViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewController.strArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*let cellIdentifier = "cellIdentifier"
         var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
         
         if cell == nil {
         cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
         cell!.contentView.backgroundColor = UIColor(red: 250/255.0, green: 250/255.0, blue: 251/255.0, alpha: 1.0)
         }
         
         if let cell = cell {
         cell.textLabel?.text = "\((indexPath as NSIndexPath).row)"
         return cell
         }
         
         return UITableViewCell()*/
        
         let cell = Bundle.main.loadNibNamed("PopUpTableViewCell", owner: self, options: nil)?.first as! PopUpTableViewCell
         cell.label.text = ViewController.strArray[indexPath.row]
         cell.button.tag = indexPath.row
         cell.button.addTarget(ViewController().self, action: #selector(ViewController().organizeCellButtonAction(_:)), for: UIControlEvents.touchUpInside)
        cell.button.addTarget(self, action: #selector(PopUpViewController.popupKapat(_:)), for: UIControlEvents.touchUpInside)
         return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = Bundle.main.loadNibNamed("PopUpTableViewCell", owner: self, options: nil)?.first as! PopUpTableViewCell
        return cell.contentView.frame.height
    }
    
}

// MARK: -
// MARK: UITableView Delegate

extension PopUpViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
