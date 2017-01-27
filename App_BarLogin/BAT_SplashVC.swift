//
//  BAT_SplashVC.swift
//  App_BarLogin
//
//  Created by cice on 27/1/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit

class BAT_SplashVC: UIViewController {

    //MARK: - Variables LOCALES
    var viewAnimator: UIViewPropertyAnimator!
    var desbloqueoGesto = Timer()
    
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var myImagenLogoBatman: UIImageView!
    @IBOutlet weak var myEtiquetaMarcaRegistradaLabel: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //preparamos la animación
        viewAnimator = UIViewPropertyAnimator(duration: 1.0,
                                              curve: .easeInOut,
                                              animations: nil)
        
        viewAnimator.addAnimations {
            //Aqui hacemos que nuestra etiqueta se quede completemante transparente
            self.myEtiquetaMarcaRegistradaLabel.layer.opacity = 0
            self.myImagenLogoBatman.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
            self.desbloqueoGesto = Timer.scheduledTimer(timeInterval: 1.5,
                                                        target: self,
                                                        selector: #selector(self.muestraAutomatico),
                                                        userInfo: nil,
                                                        repeats: false)
        }
        
        viewAnimator.startAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func muestraAutomatico(){
        //aqui creamos la otra animacion
        let logoAnimation = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut) { 
            self.myImagenLogoBatman.transform = CGAffineTransform(scaleX: 25, y: 25)
        }
        logoAnimation.startAnimation()
        logoAnimation.addCompletion { (void) in
            self.comienzoApp()
        }
    }
    
    func comienzoApp(){
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! BAT_LoginVC
        loginVC.modalTransitionStyle = .crossDissolve
        present(loginVC, animated: true, completion: nil)
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
