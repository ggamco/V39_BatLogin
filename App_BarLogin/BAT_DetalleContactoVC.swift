//
//  BAT_DetalleContactoVC.swift
//  App_BarLogin
//
//  Created by cice on 3/2/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit

class BAT_DetalleContactoVC: UIViewController {

    //Variables Locales
    var dataContacto: diccionario = [:]
    
    //MARK: - IBOutlets
    @IBOutlet weak var myFotoPerfil: UIImageView!
    @IBOutlet weak var myNombre: UILabel!
    @IBOutlet weak var myApellido: UILabel!
    @IBOutlet weak var myMovil: UILabel!
    @IBOutlet weak var myTrabajo: UILabel!
    @IBOutlet weak var myEmail: UILabel!
    @IBOutlet weak var myExtracto: UILabel!
    @IBOutlet weak var myDescripcion: UILabel!
    @IBOutlet weak var myCreado: UILabel!
    @IBOutlet weak var myTwitter: UILabel!
    @IBOutlet weak var myLinkedin: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imagen = UIImage(named: dataContacto["imageProfile"]! as! String)
        myFotoPerfil.image = imagen
        
        myNombre.text = dataContacto["firstName"] as! String?
        myApellido.text = dataContacto["lastName"] as! String?
        myMovil.text = dataContacto["telefonoMovil"] as! String?
        myTrabajo.text = dataContacto["telefonoTrabajo"] as! String?
        myEmail.text = dataContacto["email"] as! String?
        myExtracto.text = dataContacto["abstractoVC"] as! String?
        myDescripcion.text = dataContacto["description"] as! String?
        myCreado.text = dataContacto["createdPost"] as! String?
        myTwitter.text = dataContacto["usernameTwitter"] as! String?
        myLinkedin.text = dataContacto["cuentaLinkedin"] as! String?
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
