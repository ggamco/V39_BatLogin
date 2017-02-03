//
//  BAT_MiPerfilVC.swift
//  App_BarLogin
//
//  Created by cice on 3/2/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit

class BAT_MiPerfilVC: UIViewController {

    let urlData = "https://www.gmbdesign.es/es"
    
    
    @IBAction func cerrarPerfilVC(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "muestraWebVC"{
            let webVC = segue.destination as! BAT_WebVC
            webVC.urlString = urlData
        }
    }
    

}
