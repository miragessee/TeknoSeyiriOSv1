//
//  ViewController.swift
//  TeknoSeyir
//
//  Created by Admin on 20/12/2016.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit

class ViewController: BaseViewController , UIWebViewDelegate /*, UIScrollViewDelegate , UIGestureRecognizerDelegate*/{

    @IBOutlet weak var organizeBarButton: UIBarButtonItem!
    @IBOutlet weak var homeBarButton: UIBarButtonItem!
    @IBOutlet var screenEdgePanWebView2: UIScreenEdgePanGestureRecognizer!
    @IBOutlet var screenEdgePacWebView: UIScreenEdgePanGestureRecognizer!
    @IBOutlet var screenEdgePanView: UIScreenEdgePanGestureRecognizer!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var webView2: UIWebView!
    //@IBOutlet weak var myIndicator: UIActivityIndicatorView!
    @IBOutlet weak var toolBar2: UIToolbar!
    
    public static var URL = NSURL(string: "https://teknoseyir.com/")
    
    public static var seciliCell = -1
    
    public static var strArray = [String]()
    public static var strArrayLinkleri = [String]()
    public static var favoriHashTag : String = "#akış"
    public static var favoriHasTagUrl : String = "https://teknoseyir.com/?s=%23ak%C4%B1%C5%9F"
    
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    var popupViewController : UIViewController = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
        // Do any additional setup after loading the view, typically from a nib.
        webView.delegate = self
        webView2.delegate = self
        /*webView.scrollView.delegate = self
        webView2.scrollView.delegate = self*/
        screenEdgePanView.edges = .left
        screenEdgePacWebView.edges = .left
        screenEdgePanWebView2.edges = .left
        
        webView.loadRequest(NSURLRequest(url: ViewController.URL! as URL) as URLRequest)
        
        webView.scalesPageToFit = true
        webView2.scalesPageToFit = true
        
        self.webView.scrollView.minimumZoomScale = 1.0
        self.webView.scrollView.maximumZoomScale = 5.0
        
        self.webView2.scrollView.minimumZoomScale = 1.0
        self.webView2.scrollView.maximumZoomScale = 5.0
        
        /*self.webView.stringByEvaluatingJavaScript(from: "document.querySelector('meta[name=viewport]').setAttribute('content', 'user-scalable = 1;', false); ")*/
        
        //self.webView.scrollView.zoomScale = 3
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*@IBAction func webViewPinchGesture(_ sender: UIPinchGestureRecognizer) {
        print(sender.scale)
        
        webView.scalesPageToFit = true
        
        self.webView.scrollView.minimumZoomScale = 1.0
        self.webView.scrollView.maximumZoomScale = 5.0
        
        /*webView.scalesPageToFit = true
        
        self.webView.scrollView.minimumZoomScale = 1.0
        self.webView.scrollView.maximumZoomScale = 5.0
        
        if(sender.scale < 1.0)
        {
            sender.scale = 1.0
            webView.scrollView.zoomScale = 1.0
        }
        else
        {
            
            webView.scrollView.zoomScale = sender.scale * 2
        }*/
        
        if (sender.state == .ended)
        {
            if(sender.scale < 1.0)
            {
                sender.scale = 1.1
                webView.scrollView.zoomScale = 1.1
            }
            else
            {
                
                webView.scrollView.zoomScale = sender.scale * 2
            }
        }
    }
    
    @IBAction func webView2PinchGesture(_ sender: UIPinchGestureRecognizer) {
        print(sender.scale)
        self.webView2.scrollView.zoomScale = sender.scale
    }*/
    
    
    /*func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        print("zoomluyorum")
        return webView
    }*/

    @IBAction func leftSlideAction(_ sender: UIScreenEdgePanGestureRecognizer) {
        if (sender as AnyObject).state == .ended
        {
            BaseViewController.isOpen = true
            print("left slide")
            
            let menuVC : MenuViewController = self.storyboard!.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
            menuVC.delegate = self
            self.view.addSubview(menuVC.view)
            self.addChildViewController(menuVC)
            menuVC.view.layoutIfNeeded()
            
            
            menuVC.view.frame=CGRect(x: 0 - UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
            
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                menuVC.view.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
            }, completion:nil)
        }
    }
    
    @IBAction func paylasAction(_ sender: Any) {
        if (webView2.alpha == 0)
        {
            if (webView.request?.url?.absoluteString == nil)
            {
                let alert = UIAlertController(title: "", message: "Bağlantı yok", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else
            {
                // text to share
                let text = webView.request?.url?.absoluteString
                
                // set up activity view controller
                let textToShare = [ text ]
                let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
                activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
                
                // exclude some activity types from the list (optional)
                activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
                
                // present the view controller
                self.present(activityViewController, animated: true, completion: nil)
            }
        }
        else if (webView2.alpha == 1)
        {
            if (webView2.request?.url?.absoluteString == nil)
            {
                let alert = UIAlertController(title: "", message: "Bağlantı yok", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else
            {
                // text to share
                let text = webView.request?.url?.absoluteString
                
                // set up activity view controller
                let textToShare = [ text ]
                let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
                activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
                
                // exclude some activity types from the list (optional)
                activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
                
                // present the view controller
                self.present(activityViewController, animated: true, completion: nil)
            }
        }
    }
    
    /*func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return false
    }*/
    
    
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if navigationType == UIWebViewNavigationType.linkClicked {
            if (request.url?.absoluteString == "https://teknoseyir.com/magaza"){
                UIApplication.shared.openURL(request.url!)
                return false
            } else {
                return true
            }
        }
        return true
    }
    
    @IBAction func homeAction(_ sender: Any) {
        UIView.animate(withDuration: 1, animations:
            {
                self.homeBarButton.tintColor = HexStringToUIColor.hexStringToUIColor(hex: "#ab1500")
                self.organizeBarButton.tintColor = nil
                self.toolBar2.alpha = 0
                self.webView2.alpha = 0
        }) { (success:Bool) in
            print("bitti asdasd")
        }
    }
    
    @IBAction func organizeAction(_ sender: Any) {
        UIView.animate(withDuration: 1, animations:
            {
                self.homeBarButton.tintColor = nil
                self.organizeBarButton.tintColor = HexStringToUIColor.hexStringToUIColor(hex: "#ab1500")
                self.navigationController?.navigationBar.isHidden = false
                self.toolBar2.alpha = 1
                self.webView2.alpha = 1
        }) { (success:Bool) in
            print("bitti asdasd")
        }
    }
    
    @IBAction func kopyalaAction(_ sender: Any) {
        if (webView2.alpha == 0)
        {
            if (webView.request?.url?.absoluteString == nil)
            {
                let alert = UIAlertController(title: "", message: "Bağlantı yok", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else
            {
            UIPasteboard.general.string = webView.request?.url?.absoluteString
            let alert = UIAlertController(title: "", message: "Bağlantı kopyalandı", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            }
        }
        else if (webView2.alpha == 1)
        {
            if (webView2.request?.url?.absoluteString == nil)
            {
                let alert = UIAlertController(title: "", message: "Bağlantı yok", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else
            {
            UIPasteboard.general.string = webView2.request?.url?.absoluteString
            let alert = UIAlertController(title: "", message: "Bağlantı kopyalandı", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            }
        }
        
    }
    
    func organizeCellButtonAction(_ sender: UIButton)
    {
        print(sender.tag)
        var urlx : String = ViewController.strArrayLinkleri[sender.tag].addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        urlx = urlx.replacingOccurrences(of: "25", with: "")
        print(urlx)
        var URL = NSURL(string: urlx)
        print(URL!)
        print(ViewController.strArrayLinkleri[sender.tag])
        self.webView2.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
        self.navigationController?.navigationBar.isHidden = true
        self.toolBar2.alpha = 0
        self.webView2.alpha = 0
        UIView.animate(withDuration: 1, animations:
            {
                self.homeBarButton.tintColor = nil
                self.organizeBarButton.tintColor = HexStringToUIColor.hexStringToUIColor(hex: "#ab1500")
                self.navigationController?.navigationBar.isHidden = false
                self.toolBar2.alpha = 1
                self.webView2.alpha = 1
        }) { (success:Bool) in
            print("bitti asdasd")
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews();
        
        self.webView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.webView2?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        webView.scrollView.contentInset = UIEdgeInsets.zero;
        webView2.scrollView.contentInset = UIEdgeInsets.zero;
    }
    
    override func viewDidLayoutSubviews() {
        self.webView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.webView2?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        webView.scrollView.contentInset = UIEdgeInsets.zero;
        webView2.scrollView.contentInset = UIEdgeInsets.zero;
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape
        {
            webView.frame.origin.y = 32
            webView.frame.size.height += 32
            webView2.frame.origin.y = 32
            webView2.frame.size.height += 32
            self.webView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.webView2?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            webView.scrollView.contentInset = UIEdgeInsets.zero;
            webView2.scrollView.contentInset = UIEdgeInsets.zero;
        }
        else
        {
            webView.frame.origin.y = 64
            webView.frame.size.height -= 32
            webView2.frame.origin.y = 64
            webView2.frame.size.height -= 32
            self.webView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.webView2?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            webView.scrollView.contentInset = UIEdgeInsets.zero;
            webView2.scrollView.contentInset = UIEdgeInsets.zero;
        }
    }

    @IBAction func yukariCikAction(_ sender: Any) {
        webView.scrollView.setContentOffset(CGPoint.zero, animated: true)
    }
    
    @IBAction func yukariCikAction2(_ sender: Any) {
        webView2.scrollView.setContentOffset(CGPoint.zero, animated: true)
    }
    
    /*override func viewDidAppear(_ animated: Bool) {
        webView.loadRequest(NSURLRequest(url: ViewController.URL! as URL) as URLRequest)
    }*/
    
    /*func webViewDidStartLoad(_ webView: UIWebView) {
        myIndicator.isHidden = false
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        myIndicator.isHidden = true
    }*/
    
    func ayarlarClick(_ sender: UIButton){
        let destViewController : UIViewController = self.storyboard!.instantiateViewController(withIdentifier: "AyarlarViewController")
        self.navigationController!.pushViewController(destViewController, animated: true)
    }
    
    func araClick(_ sender: UIButton){
        if (ViewController.URL != nil)
        {
        self.webView.loadRequest(NSURLRequest(url: ViewController.URL! as URL) as URLRequest)
        //self.webView.reload()
        let buttonTag = sender.tag
        print("qwewqewqe")
        print(buttonTag)
        
        let menuVC : MenuViewController = self.storyboard!.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        menuVC.delegate = self
        
        BaseViewController.isOpen = false
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            menuVC.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            menuVC.view.layoutIfNeeded()
            menuVC.view.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            menuVC.view.removeFromSuperview()
            menuVC.removeFromParentViewController()
        })
        
        /*    let base : BaseViewController = BaseViewController()
            
        for subview in base.view.subviews {
            /*if subview is MenuViewController {
                subview.removeFromSuperview()
            }*/
            //subview.removeFromSuperview()
            print(subview)
        }*/
            
        //self.view.removeFromSuperview()
        
        /*let menuVC : MenuViewController = self.storyboard!.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        menuVC.onCloseMenuClick(sender)*/
        }
    }
    
    /*func cellClick(_ tapGestureRecognizer: UITapGestureRecognizer)
    {
        print("cellClick")
    }*/
    
    public func labelButtonClick(_ sender: UIButton)
    {
        if (sender.titleLabel?.text == "TeknoSeyir Facebook")
        {
            UIApplication.shared.openURL(NSURL(string: "https://www.facebook.com/TeknoSeyir/")! as URL)
        }
        else if (sender.titleLabel?.text == "TeknoSeyir Twitch")
        {
            UIApplication.shared.openURL(NSURL(string: "https://www.twitch.tv/teknoseyir")! as URL)
        }
        else if (sender.titleLabel?.text == "TeknoSeyir Twitter")
        {
            UIApplication.shared.openURL(NSURL(string: "https://twitter.com/teknoseyir")! as URL)
        }
        else if (sender.titleLabel?.text == "TeknoSeyir Instagram")
        {
            UIApplication.shared.openURL(NSURL(string: "https://www.instagram.com/teknoseyir/")! as URL)
        }
        else if (sender.titleLabel?.text == "OtoSeyir Youtube")
        {
            UIApplication.shared.openURL(NSURL(string: "https://www.youtube.com/channel/UCsBqTbGrvtDZYLXt73vkYvw")! as URL)
        }
        else if (sender.titleLabel?.text == "Gamende Youtube")
        {
            UIApplication.shared.openURL(NSURL(string: "https://www.youtube.com/channel/UCZCl64NLRytf0ckqC-r3gzQ")! as URL)
        }
    }
    
    public func imageButtonClick(_ sender: UIButton)
    {
        print("image button click")
        
        if (sender.titleLabel?.text == "Anasayfa")
        {
            if (webView2.alpha == 0)
            {
                var URL = NSURL(string: "https://teknoseyir.com/")
                self.webView.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
            }
            else if (webView2.alpha == 1)
            {
                var URL = NSURL(string: "https://teknoseyir.com/")
                self.webView2.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
            }
        }
        else if (sender.titleLabel?.text == "Mağaza")
        {
            //var URL = NSURL(string: "https://teknoseyir.com/magaza")
            //self.webView.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
            UIApplication.shared.openURL(NSURL(string: "https://teknoseyir.com/magaza")! as URL)
        }
        else if (sender.titleLabel?.text == "Gündem Etiketleri")
        {
            ViewController.strArray.removeAll()
            ViewController.strArrayLinkleri.removeAll()
            
            let data = NSData(contentsOf: NSURL(string: "https://www.teknoseyir.com")! as URL)
            let doc = TFHpple(htmlData: data as Data!)
            
            if let elements = doc?.search(withXPathQuery: "//div[@class='widget widget_teknoseyir_gundemi']") as? [TFHppleElement] {
                for element in elements {
                    print("------")
                    print(element.content)
                    var gundemler : [String] = element.content.components(separatedBy: "#")
                    
                    for gundem in 1 ... gundemler.count-1 {
                        var str : String = "\(gundem). \("#")\(gundemler[gundem])"
                        ViewController.strArray.append(str)
                    }
                    
                    
                    if let linkler = element.search(withXPathQuery: "//a/@href") as? [TFHppleElement] {
                        for link in linkler {
                            //
                            print(link.content)
                            ViewController.strArrayLinkleri.append(link.content)
                        }
                    }
                }
                popupViewController = storyBoard.instantiateViewController(withIdentifier: "PopUpViewController")
                self.addChildViewController(popupViewController)
                popupViewController.view.frame = self.view.frame
                self.view.addSubview(popupViewController.view)
                
                popupViewController.view.center = self.view.center
                popupViewController.view.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
                popupViewController.view.alpha = 0
                
                UIView.animate(withDuration: 0.4)
                {
                    self.popupViewController.view.alpha = 1
                    self.popupViewController.view.transform = CGAffineTransform.identity
                }
                
                self.navigationController?.navigationBar.isHidden = true
                popupViewController.didMove(toParentViewController: self)
            }
        }
        else if (sender.titleLabel?.text == "#akış" || sender.tag == 32)
        {
            if (sender.titleLabel?.text == "#akış")
            {
                var URL = NSURL(string: "https://teknoseyir.com/?s=%23ak%C4%B1%C5%9F")
                self.webView2.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
                self.navigationController?.navigationBar.isHidden = true
                self.toolBar2.alpha = 0
                self.webView2.alpha = 0
                UIView.animate(withDuration: 1, animations:
                    {
                        self.homeBarButton.tintColor = nil
                        self.organizeBarButton.tintColor = HexStringToUIColor.hexStringToUIColor(hex: "#ab1500")
                        self.navigationController?.navigationBar.isHidden = false
                        self.toolBar2.alpha = 1
                        self.webView2.alpha = 1
                }) { (success:Bool) in
                    print("bitti asdasd")
                }
            }
            else
            {
                var urlx : String = ViewController.favoriHasTagUrl.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
                urlx = urlx.replacingOccurrences(of: "25", with: "")
                print(urlx)
                var URL = NSURL(string: urlx)
                self.webView2.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
                self.navigationController?.navigationBar.isHidden = true
                self.toolBar2.alpha = 0
                self.webView2.alpha = 0
                UIView.animate(withDuration: 1, animations:
                    {
                        self.homeBarButton.tintColor = nil
                        self.organizeBarButton.tintColor = HexStringToUIColor.hexStringToUIColor(hex: "#ab1500")
                        self.navigationController?.navigationBar.isHidden = false
                        self.toolBar2.alpha = 1
                        self.webView2.alpha = 1
                }) { (success:Bool) in
                    print("bitti asdasd")
                }
            }
        }
        else if (sender.titleLabel?.text == "Keşfet")
        {
            if (webView2.alpha == 0)
            {
                var URL = NSURL(string: "https://teknoseyir.com/kesfet")
                self.webView.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
            }
            else if (webView2.alpha == 1)
            {
                var URL = NSURL(string: "https://teknoseyir.com/kesfet")
                self.webView2.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
            }
        }
        else if (sender.titleLabel?.text == "Videolar")
        {
            if (webView2.alpha == 0)
            {
                var URL = NSURL(string: "https://teknoseyir.com/videolar")
                self.webView.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
            }
            else if (webView2.alpha == 1)
            {
                var URL = NSURL(string: "https://teknoseyir.com/videolar")
                self.webView2.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
            }
        }
        else if (sender.titleLabel?.text == "İncelemeler")
        {
            if (webView2.alpha == 0)
            {
                var URL = NSURL(string: "https://teknoseyir.com/incelemeler")
                self.webView.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
            }
            else if (webView2.alpha == 1)
            {
                var URL = NSURL(string: "https://teknoseyir.com/incelemeler")
                self.webView2.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
            }
        }
        else if (sender.titleLabel?.text == "Mobil")
        {
            if (webView2.alpha == 0)
            {
                var URL = NSURL(string: "https://teknoseyir.com/k/mobil")
                self.webView.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
            }
            else if (webView2.alpha == 1)
            {
                var URL = NSURL(string: "https://teknoseyir.com/k/mobil")
                self.webView2.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
            }
        }
        else if (sender.titleLabel?.text == "Tozlu Raflar")
        {
            if (webView2.alpha == 0)
            {
                var URL = NSURL(string: "https://teknoseyir.com/k/tozlu-raflar")
                self.webView.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
            }
            else if (webView2.alpha == 1)
            {
                var URL = NSURL(string: "https://teknoseyir.com/k/tozlu-raflar")
                self.webView2.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
            }
        }
        else if (sender.titleLabel?.text == "Oyun")
        {
            if (webView2.alpha == 0)
            {
                var URL = NSURL(string: "https://teknoseyir.com/k/oyun")
                self.webView.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
            }
            else if (webView2.alpha == 1)
            {
                var URL = NSURL(string: "https://teknoseyir.com/k/oyun")
                self.webView2.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
            }
        }
        else if (sender.titleLabel?.text == "Otoseyir")
        {
            if (webView2.alpha == 0)
            {
                var URL = NSURL(string: "https://teknoseyir.com/k/otoseyir")
                self.webView.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
            }
            else if (webView2.alpha == 1)
            {
                var URL = NSURL(string: "https://teknoseyir.com/k/otoseyir")
                self.webView2.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
            }
        }
        else if (sender.titleLabel?.text == "Hobi")
        {
            if (webView2.alpha == 0)
            {
                var URL = NSURL(string: "https://teknoseyir.com/k/hobi")
                self.webView.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
            }
            else if (webView2.alpha == 1)
            {
                var URL = NSURL(string: "https://teknoseyir.com/k/hobi")
                self.webView2.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
            }
        }
        else if (sender.titleLabel?.text == "Bilim")
        {
            if (webView2.alpha == 0)
            {
                var URL = NSURL(string: "https://teknoseyir.com/k/bilim")
                self.webView.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
            }
            else if (webView2.alpha == 1)
            {
                var URL = NSURL(string: "https://teknoseyir.com/k/bilim")
                self.webView2.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
            }
        }
        else if (sender.titleLabel?.text == "Ağ")
        {
            if (webView2.alpha == 0)
            {
                var URL = NSURL(string: "https://teknoseyir.com/k/ag")
                self.webView.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
            }
            else if (webView2.alpha == 1)
            {
                var URL = NSURL(string: "https://teknoseyir.com/k/ag")
                self.webView2.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
            }
        }
        else if (sender.titleLabel?.text == "Bloglar")
        {
            if (webView2.alpha == 0)
            {
                var URL = NSURL(string: "https://teknoseyir.com/bloglar")
                self.webView.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
            }
            else if (webView2.alpha == 1)
            {
                var URL = NSURL(string: "https://teknoseyir.com/bloglar")
                self.webView2.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
            }
        }
    }
}

