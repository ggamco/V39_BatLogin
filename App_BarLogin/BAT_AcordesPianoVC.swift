//
//  BAT_AcordesPianoVC.swift
//  App_BarLogin
//
//  Created by cice on 17/2/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit

class BAT_AcordesPianoVC: UIViewController {

    //MARK: - IBOutlets
    
    @IBOutlet weak var myImagenPiano: UIImageView!
    
    
    
    //MARK: - IBActions
    
    @IBAction func acordeSeleccionado(_ sender: AnyObject) {
        
        let opcion = sender.tag
        
        switch opcion! {
        case 0:
            myImagenPiano.image = UIImage(named: "img_p_do")
        case 1:
            myImagenPiano.image = UIImage(named: "img_p_re")
        case 2:
            myImagenPiano.image = UIImage(named: "img_p_rem")
        case 3:
            myImagenPiano.image = UIImage(named: "img_p_mi")
        case 4:
            myImagenPiano.image = UIImage(named: "img_p_mim")
        case 5:
            myImagenPiano.image = UIImage(named: "img_p_fa")
        case 6:
            myImagenPiano.image = UIImage(named: "img_p_fam")
        case 7:
            myImagenPiano.image = UIImage(named: "img_p_sol")
        case 8:
            myImagenPiano.image = UIImage(named: "img_p_la")
        case 9:
            myImagenPiano.image = UIImage(named: "img_p_lam")
        case 10:
            myImagenPiano.image = UIImage(named: "img_p_si")
        case 11:
            myImagenPiano.image = UIImage(named: "img_p_sim")
        default:
            myImagenPiano.image = UIImage(named: "img_piano")
        }
        
    }
    
    
    //MARK: - LIFE VC
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
