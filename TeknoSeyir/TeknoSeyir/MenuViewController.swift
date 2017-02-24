//
//  MenuViewController.swift
//  TeknoSeyir
//
//  Created by Admin on 20/12/2016.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit

protocol SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex(_ index : Int32)
}

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate /*,UIGestureRecognizerDelegate*/{

    /**
     *  Array to display menu options
     */
    @IBOutlet weak var tblMenuOptions: UITableView!

    
    /**
     *  Transparent button to hide menu
     */
    @IBOutlet weak var btnCloseMenuOverlay: UIButton!
    
    
    
    /**
     *  Menu button which was tapped to display the menu
     */
    var btnMenu : UIButton!
    
    /**
     *  Delegate of the MenuVC
     */
    var delegate : SlideMenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblMenuOptions.tableFooterView = UIView()
        // Do any additional setup after loading the view.
        
        /*let tapPressGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.cellClick(_:)))
        tapPressGesture.delegate = ViewController().self
        tapPressGesture.numberOfTapsRequired = 1
        tapPressGesture.numberOfTouchesRequired = 1
        self.tblMenuOptions.addGestureRecognizer(tapPressGesture)*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCloseMenuClick(_ button:UIButton!){
        if btnMenu != nil
        {
            BaseViewController.isOpen = false
            btnMenu.tag = 0
            
            if (self.delegate != nil) {
                var index = Int32(button.tag)
                if(button == self.btnCloseMenuOverlay){
                    index = -1
                }
                delegate?.slideMenuItemSelectedAtIndex(index)
            }
            
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
                self.view.layoutIfNeeded()
                self.view.backgroundColor = UIColor.clear
            }, completion: { (finished) -> Void in
                self.view.removeFromSuperview()
                self.removeFromParentViewController()
            })
        }
        else if (button.tag == 31)
        {
            BaseViewController.isOpen = false
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
                self.view.layoutIfNeeded()
                self.view.backgroundColor = UIColor.clear
            }, completion: { (finished) -> Void in
                self.view.removeFromSuperview()
                self.removeFromParentViewController()
            })
        }
        else
        {
            BaseViewController.isOpen = false
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
                self.view.layoutIfNeeded()
                self.view.backgroundColor = UIColor.clear
            }, completion: { (finished) -> Void in
                self.view.removeFromSuperview()
                self.removeFromParentViewController()
            })
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0
        {
            let cell = Bundle.main.loadNibNamed("HeaderTableViewCell", owner: self, options: nil)?.first as! HeaderTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.araButton.tag = 31
            cell.ayarlarButton.tag = 31
            cell.ayarlarButton.addTarget(ViewController().self, action: #selector(ViewController.ayarlarClick(_:)), for: UIControlEvents.touchUpInside)
            cell.ayarlarButton.addTarget(self, action: #selector(MenuViewController.menuKapat(_:)), for: UIControlEvents.touchUpInside)
            cell.araButton.addTarget(ViewController().self, action: #selector(ViewController.araClick(_:)), for: UIControlEvents.touchUpInside)
            cell.araButton.addTarget(self, action: #selector(MenuViewController.menuKapat(_:)), for: UIControlEvents.touchUpInside)
            return cell
        }
        else if indexPath.row == 1
        {
            let cell = Bundle.main.loadNibNamed("ImageTableViewCell", owner: self, options: nil)?.first as! ImageTableViewCell
            /*let tapPressGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.cellClick(_:)))
            //tapPressGesture.delegate = ViewController().self
            tapPressGesture.delegate = self
            tapPressGesture.numberOfTapsRequired = 1
            tapPressGesture.numberOfTouchesRequired = 1
            cell.addGestureRecognizer(tapPressGesture)*/
            //cell.contentView.addTa
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.button.tag = 31
            cell.button.addTarget(ViewController().self, action: #selector(ViewController().imageButtonClick(_:)), for: UIControlEvents.touchUpInside)
            cell.button.addTarget(self, action: #selector(MenuViewController.menuKapat(_:)), for: UIControlEvents.touchUpInside)
            return cell
        }
        else if indexPath.row == 2
        {
            let cell = Bundle.main.loadNibNamed("ImageTableViewCell", owner: self, options: nil)?.first as! ImageTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.button.tag = 31
            cell.button.setTitle( "Mağaza" , for: .normal )
            cell.button.addTarget(ViewController().self, action: #selector(ViewController().imageButtonClick(_:)), for: UIControlEvents.touchUpInside)
            cell.button.addTarget(self, action: #selector(MenuViewController.menuKapat(_:)), for: UIControlEvents.touchUpInside)
            cell.foto.image = UIImage(named: "shopping-cart")
            return cell
        }
        else if indexPath.row == 3
        {
            let cell = Bundle.main.loadNibNamed("ImageTableViewCell", owner: self, options: nil)?.first as! ImageTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.button.tag = 31
            cell.button.setTitle( "Gündem Etiketleri" , for: .normal )
            cell.button.addTarget(ViewController().self, action: #selector(ViewController().imageButtonClick(_:)), for: UIControlEvents.touchUpInside)
            cell.button.addTarget(self, action: #selector(MenuViewController.menuKapat(_:)), for: UIControlEvents.touchUpInside)
            cell.foto.image = UIImage(named: "fire")
            return cell
        }
        else if indexPath.row == 4
        {
            let cell = Bundle.main.loadNibNamed("ImageTableViewCell", owner: self, options: nil)?.first as! ImageTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.button.tag = 32
            cell.button.setTitle( ViewController.favoriHashTag , for: .normal )
            cell.button.addTarget(ViewController().self, action: #selector(ViewController().imageButtonClick(_:)), for: UIControlEvents.touchUpInside)
            cell.button.addTarget(self, action: #selector(MenuViewController.menuKapat(_:)), for: UIControlEvents.touchUpInside)
            cell.foto.image = UIImage(named: "label-outline")
            return cell
        }
        else if indexPath.row == 5
        {
            let cell = Bundle.main.loadNibNamed("ImageTableViewCell", owner: self, options: nil)?.first as! ImageTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.button.tag = 31
            cell.button.setTitle( "Keşfet" , for: .normal )
            cell.button.addTarget(ViewController().self, action: #selector(ViewController().imageButtonClick(_:)), for: UIControlEvents.touchUpInside)
            cell.button.addTarget(self, action: #selector(MenuViewController.menuKapat(_:)), for: UIControlEvents.touchUpInside)
            cell.foto.image = UIImage(named: "compass-with-white-needles")
            return cell
        }
        else if indexPath.row == 6
        {
            let cell = Bundle.main.loadNibNamed("ImageTableViewCell", owner: self, options: nil)?.first as! ImageTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.button.tag = 31
            cell.button.setTitle( "Videolar" , for: .normal )
            cell.button.addTarget(ViewController().self, action: #selector(ViewController().imageButtonClick(_:)), for: UIControlEvents.touchUpInside)
            cell.button.addTarget(self, action: #selector(MenuViewController.menuKapat(_:)), for: UIControlEvents.touchUpInside)
            cell.foto.image = UIImage(named: "video-camera")
            return cell
        }
        else if indexPath.row == 7
        {
            let cell = Bundle.main.loadNibNamed("ImageTableViewCell", owner: self, options: nil)?.first as! ImageTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.button.tag = 31
            cell.button.setTitle( "Bloglar" , for: .normal )
            cell.button.addTarget(ViewController().self, action: #selector(ViewController().imageButtonClick(_:)), for: UIControlEvents.touchUpInside)
            cell.button.addTarget(self, action: #selector(MenuViewController.menuKapat(_:)), for: UIControlEvents.touchUpInside)
            cell.foto.image = UIImage(named: "blogging")
            return cell
        }
        else if indexPath.row == 8
        {
            let cell = Bundle.main.loadNibNamed("ImageTableViewCell", owner: self, options: nil)?.first as! ImageTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.button.tag = 31
            cell.button.setTitle( "İncelemeler" , for: .normal )
            cell.button.addTarget(ViewController().self, action: #selector(ViewController().imageButtonClick(_:)), for: UIControlEvents.touchUpInside)
            cell.button.addTarget(self, action: #selector(MenuViewController.menuKapat(_:)), for: UIControlEvents.touchUpInside)
            cell.foto.image = UIImage(named: "document")
            return cell
        }
        else if indexPath.row == 9
        {
            let cell = Bundle.main.loadNibNamed("ImageTableViewCell", owner: self, options: nil)?.first as! ImageTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.button.tag = 31
            cell.button.setTitle( "Mobil" , for: .normal )
            cell.button.addTarget(ViewController().self, action: #selector(ViewController().imageButtonClick(_:)), for: UIControlEvents.touchUpInside)
            cell.button.addTarget(self, action: #selector(MenuViewController.menuKapat(_:)), for: UIControlEvents.touchUpInside)
            cell.foto.image = UIImage(named: "smartphone")
            return cell
        }
        else if indexPath.row == 10
        {
            let cell = Bundle.main.loadNibNamed("ImageTableViewCell", owner: self, options: nil)?.first as! ImageTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.button.tag = 31
            cell.button.setTitle( "Tozlu Raflar" , for: .normal )
            cell.button.addTarget(ViewController().self, action: #selector(ViewController().imageButtonClick(_:)), for: UIControlEvents.touchUpInside)
            cell.button.addTarget(self, action: #selector(MenuViewController.menuKapat(_:)), for: UIControlEvents.touchUpInside)
            cell.foto.image = UIImage(named: "broom")
            return cell
        }
        else if indexPath.row == 11
        {
            let cell = Bundle.main.loadNibNamed("ImageTableViewCell", owner: self, options: nil)?.first as! ImageTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.button.tag = 31
            cell.button.setTitle( "Oyun" , for: .normal )
            cell.button.addTarget(ViewController().self, action: #selector(ViewController().imageButtonClick(_:)), for: UIControlEvents.touchUpInside)
            cell.button.addTarget(self, action: #selector(MenuViewController.menuKapat(_:)), for: UIControlEvents.touchUpInside)
            cell.foto.image = UIImage(named: "gamepad")
            return cell
        }
        else if indexPath.row == 12
        {
            let cell = Bundle.main.loadNibNamed("ImageTableViewCell", owner: self, options: nil)?.first as! ImageTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.button.tag = 31
            cell.button.setTitle( "Otoseyir" , for: .normal )
            cell.button.addTarget(ViewController().self, action: #selector(ViewController().imageButtonClick(_:)), for: UIControlEvents.touchUpInside)
            cell.button.addTarget(self, action: #selector(MenuViewController.menuKapat(_:)), for: UIControlEvents.touchUpInside)
            cell.foto.image = UIImage(named: "car")
            return cell
        }
        else if indexPath.row == 13
        {
            let cell = Bundle.main.loadNibNamed("ImageTableViewCell", owner: self, options: nil)?.first as! ImageTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.button.tag = 31
            cell.button.setTitle( "Hobi" , for: .normal )
            cell.button.addTarget(ViewController().self, action: #selector(ViewController().imageButtonClick(_:)), for: UIControlEvents.touchUpInside)
            cell.button.addTarget(self, action: #selector(MenuViewController.menuKapat(_:)), for: UIControlEvents.touchUpInside)
            cell.foto.image = UIImage(named: "like")
            return cell
        }
        else if indexPath.row == 14
        {
            let cell = Bundle.main.loadNibNamed("ImageTableViewCell", owner: self, options: nil)?.first as! ImageTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.button.tag = 31
            cell.button.setTitle( "Bilim" , for: .normal )
            cell.button.addTarget(ViewController().self, action: #selector(ViewController().imageButtonClick(_:)), for: UIControlEvents.touchUpInside)
            cell.button.addTarget(self, action: #selector(MenuViewController.menuKapat(_:)), for: UIControlEvents.touchUpInside)
            cell.foto.image = UIImage(named: "flasks")
            return cell
        }
        else if indexPath.row == 15
        {
            let cell = Bundle.main.loadNibNamed("ImageTableViewCell", owner: self, options: nil)?.first as! ImageTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.button.tag = 31
            cell.button.setTitle( "Ağ" , for: .normal )
            cell.button.addTarget(ViewController().self, action: #selector(ViewController().imageButtonClick(_:)), for: UIControlEvents.touchUpInside)
            cell.button.addTarget(self, action: #selector(MenuViewController.menuKapat(_:)), for: UIControlEvents.touchUpInside)
            cell.foto.image = UIImage(named: "computers-network-interface-symbol")
            return cell
        }
        else if indexPath.row == 16
        {
            let cell = Bundle.main.loadNibNamed("LabelTableViewCell", owner: self, options: nil)?.first as! LabelTableViewCell
            cell.button.tag = 31
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.button.addTarget(ViewController().self, action: #selector(ViewController().labelButtonClick(_:)), for: UIControlEvents.touchUpInside)
            return cell
        }
        else if indexPath.row == 17
        {
            let cell = Bundle.main.loadNibNamed("LabelTableViewCell", owner: self, options: nil)?.first as! LabelTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.button.tag = 31
            cell.button.setTitle( "TeknoSeyir Twitter" , for: .normal )
            cell.button.addTarget(ViewController().self, action: #selector(ViewController().labelButtonClick(_:)), for: UIControlEvents.touchUpInside)
            return cell
        }
        else if indexPath.row == 18
        {
            let cell = Bundle.main.loadNibNamed("LabelTableViewCell", owner: self, options: nil)?.first as! LabelTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.button.tag = 31
            cell.button.setTitle( "TeknoSeyir Instagram" , for: .normal )
            cell.button.addTarget(ViewController().self, action: #selector(ViewController().labelButtonClick(_:)), for: UIControlEvents.touchUpInside)
            return cell
        }
        else if indexPath.row == 19
        {
            let cell = Bundle.main.loadNibNamed("LabelTableViewCell", owner: self, options: nil)?.first as! LabelTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.button.tag = 31
            cell.button.setTitle( "TeknoSeyir Twitch" , for: .normal )
            cell.button.addTarget(ViewController().self, action: #selector(ViewController().labelButtonClick(_:)), for: UIControlEvents.touchUpInside)
            return cell
        }
        else if indexPath.row == 20
        {
            let cell = Bundle.main.loadNibNamed("LabelTableViewCell", owner: self, options: nil)?.first as! LabelTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.button.tag = 31
            cell.button.setTitle( "OtoSeyir Youtube" , for: .normal )
            cell.button.addTarget(ViewController().self, action: #selector(ViewController().labelButtonClick(_:)), for: UIControlEvents.touchUpInside)
            return cell
        }
        else if indexPath.row == 21
        {
            let cell = Bundle.main.loadNibNamed("LabelTableViewCell", owner: self, options: nil)?.first as! LabelTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.button.tag = 31
            cell.button.setTitle( "Gamende Youtube" , for: .normal )
            cell.button.addTarget(ViewController().self, action: #selector(ViewController().labelButtonClick(_:)), for: UIControlEvents.touchUpInside)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let btn = UIButton(type: UIButtonType.custom)
        btn.tag = indexPath.row
        delegate?.slideMenuItemSelectedAtIndex(Int32(indexPath.row))
        self.onCloseMenuClick(btn)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 22
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0
        {
            let cell = Bundle.main.loadNibNamed("HeaderTableViewCell", owner: self, options: nil)?.first as! HeaderTableViewCell
            return cell.contentView.frame.height
        }
        else
        {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        ViewController.seciliCell = indexPath.row
    }
    
    /*func araClick(_ sender: UIButton){
        let buttonTag = sender.tag
        print("qwewqewqe")
        print(buttonTag)
        
        BaseViewController.isOpen = false
        btnMenu.tag = 0
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            self.view.removeFromSuperview()
            self.removeFromParentViewController()
        })
    }*/
    
    func menuKapat(_ sender: UIButton)
    {
        BaseViewController.isOpen = false
        self.view.removeFromSuperview()
    }
}
