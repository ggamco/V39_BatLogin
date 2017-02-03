//
//  BAT_WebVC.swift
//  App_BarLogin
//
//  Created by cice on 3/2/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit

class BAT_WebVC: UIViewController {

    //MARK: - Variables locales
    var urlString: String?
    let batDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //MARK: - IBOutlets
    @IBOutlet weak var myWebView: UIWebView!
    
    
    //MARK: - IBActions
    @IBAction func cerrarVC(_ sender: AnyObject) {
        batDelegate.puedoRotar = false
        dismiss(animated: true, completion: nil)
    }
    @IBAction func irAtras(_ sender: AnyObject) {
        myWebView.goBack()
    }
    @IBAction func irAdelante(_ sender: AnyObject) {
        myWebView.goForward()
    }
    @IBAction func recargarPagina(_ sender: AnyObject) {
        myWebView.reload()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        batDelegate.puedoRotar = true
        
        let customUrl = URL(string: urlString!)
        let request = URLRequest(url: customUrl!)
        
        myWebView.loadRequest(request)

        // Do any additional setup after loading the view.
    }
    
    override var shouldAutorotate: Bool{
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .all
    }

}
