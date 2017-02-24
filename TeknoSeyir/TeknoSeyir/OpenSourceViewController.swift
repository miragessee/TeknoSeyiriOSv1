//
//  OpenSourceViewController.swift
//  TeknoSeyir
//
//  Created by Admin on 26/12/2016.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit

class OpenSourceViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension OpenSourceViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
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
        if (indexPath.row == 0)
        {
            let cell = Bundle.main.loadNibNamed("OpenSourceTableViewCell", owner: self, options: nil)?.first as! OpenSourceTableViewCell
            return cell
        }
        else if (indexPath.row == 1)
        {
            let cell = Bundle.main.loadNibNamed("OpenSourceTableViewCell", owner: self, options: nil)?.first as! OpenSourceTableViewCell
            cell.baslikLabel.text = "VKCheckbox"
            cell.icerikLabel.text = "The MIT License (MIT) \n" +
            
                "\nCopyright (c) 2016 Vladislav Kovalyov \n" +
                
                "Permission is hereby granted, free of charge, to any person obtaining a copy \n" +
                "of this software and associated documentation files (the " + "Software" + "), to deal \n" +
                "in the Software without restriction, including without limitation the rights \n" +
                "to use, copy, modify, merge, publish, distribute, sublicense, and/or sell \n" +
                "copies of the Software, and to permit persons to whom the Software is \n" +
                "furnished to do so, subject to the following conditions: \n" +
                
                "\nThe above copyright notice and this permission notice shall be included in all \n" +
                "copies or substantial portions of the Software. \n" +
                
                "\nTHE SOFTWARE IS PROVIDED " + "AS IS" + ", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR \n" +
                "IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, \n" +
                "FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE \n" +
                "AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER \n" +
                "LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, \n" +
                "OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE \n" +
            "SOFTWARE."
            return cell
        }
        else if (indexPath.row == 2)
        {
            let cell = Bundle.main.loadNibNamed("OpenSourceTableViewCell", owner: self, options: nil)?.first as! OpenSourceTableViewCell
            cell.baslikLabel.text = "hpple"
            cell.icerikLabel.text = "Copyright (c) 2009 Topfunky Corporation, http://topfunky.com \n" +
            
            "\nMIT LICENSE \n" +
            
            "\nPermission is hereby granted, free of charge, to any person obtaining \n" +
            "a copy of this software and associated documentation files (the \n" +
            "Software" + "), to deal in the Software without restriction, including \n" +
            "without limitation the rights to use, copy, modify, merge, publish, \n" +
            "distribute, sublicense, and/or sell copies of the Software, and to \n" +
            "permit persons to whom the Software is furnished to do so, subject to \n" +
            "the following conditions: \n" +
            
            "\nThe above copyright notice and this permission notice shall be \n" +
            "included in all copies or substantial portions of the Software. \n" +
            
            "\nTHE SOFTWARE IS PROVIDED " + "AS IS" + ", WITHOUT WARRANTY OF ANY KIND, \n" +
            "EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF \n" +
            "MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND \n" +
            "NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE \n" +
            "LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION \n" +
            "OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION \n" +
            "WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. \n"
            return cell
        }
        else
        {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = Bundle.main.loadNibNamed("OpenSourceTableViewCell", owner: self, options: nil)?.first as! OpenSourceTableViewCell
        return cell.contentView.frame.height
    }
    
}

// MARK: -
// MARK: UITableView Delegate

extension OpenSourceViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

