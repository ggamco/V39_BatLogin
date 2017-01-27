//
//  BAT_LoginVC.swift
//  App_BarLogin
//
//  Created by cice on 27/1/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit

class BAT_LoginVC: UIViewController {

    //MARK: - Variables
    var animacionChula : UIViewPropertyAnimator!
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var myLogoBatman: UIImageView!
    @IBOutlet weak var myTextoBatman: UIImageView!
    @IBOutlet weak var myUsuarioLabel: UILabel!
    @IBOutlet weak var myUsuarioTF: UITextField!
    @IBOutlet weak var myPasswordLabel: UILabel!
    @IBOutlet weak var myPasswordTF: UITextField!
    @IBOutlet weak var myEntrarBTN: UIButton!
    
    
    //MARK: - IBActions
    @IBAction func saltaVC(_ sender: AnyObject) {
        
        let customBound = myEntrarBTN.bounds
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 10,
                       options: .curveEaseInOut,
                       animations: { 
                        self.myEntrarBTN.bounds = CGRect(x: customBound.origin.x - 20,
                                                         y: customBound.origin.y,
                                                         width: customBound.width + 20,
                                                         height: customBound.height)
            }) { (void) in
                let tabVC = self.storyboard?.instantiateViewController(withIdentifier: "RootTabBarVC") as! BAT_RootTabBarVC
                tabVC.modalTransitionStyle = .crossDissolve
                self.present(tabVC, animated: true, completion: nil)
        }
        
    }
    
    //MARK: - LIFE VC
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.statusBarStyle = .lightContent

        myEntrarBTN.layer.cornerRadius = 5
        objetosSinOpacidad()
        objetosDesplazados()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        iniciaAnimacion()
    }
    
    
    func objetosSinOpacidad(){
        
        myLogoBatman.layer.opacity = 0
        myTextoBatman.layer.opacity = 0
        myUsuarioLabel.layer.opacity = 0
        myUsuarioTF.layer.opacity = 0
        myPasswordLabel.layer.opacity = 0
        myPasswordTF.layer.opacity = 0
        myEntrarBTN.layer.opacity = 0
        
    }
    
    func objetosDesplazados(){
        
        myLogoBatman.transform = CGAffineTransform(translationX: 0, y: 620)
        myTextoBatman.transform = CGAffineTransform(translationX: 0, y: 620)
        myUsuarioLabel.transform = CGAffineTransform(translationX: 0, y: 620)
        myUsuarioTF.transform = CGAffineTransform(translationX: 0, y: 620)
        myPasswordLabel.transform = CGAffineTransform(translationX: 0, y: 620)
        myPasswordTF.transform = CGAffineTransform(translationX: 0, y: 620)
        myEntrarBTN.transform = CGAffineTransform(translationX: 0, y: 620)
        
    }
    
    func iniciaAnimacion(){
        
        setAnimation(myDuracion: 0.6, myObjeto: myLogoBatman)
        setAnimation(myDuracion: 0.7, myObjeto: myTextoBatman)
        setAnimation(myDuracion: 0.8, myObjeto: myUsuarioLabel)
        setAnimation(myDuracion: 0.9, myObjeto: myUsuarioTF)
        setAnimation(myDuracion: 1.0, myObjeto: myPasswordLabel)
        setAnimation(myDuracion: 1.1, myObjeto: myPasswordTF)
        setAnimation(myDuracion: 1.2, myObjeto: myEntrarBTN)
        
    }
    
    func setAnimation(myDuracion: Double, myObjeto: UIView){
        
        animacionChula = UIViewPropertyAnimator(duration: myDuracion, curve: .easeInOut, animations: {
            myObjeto.layer.opacity = 1
            myObjeto.transform = CGAffineTransform.identity
        })
        
        animacionChula.startAnimation()
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
