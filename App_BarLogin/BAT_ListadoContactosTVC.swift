//
//  BAT_ListadoContactosTVC.swift
//  App_BarLogin
//
//  Created by cice on 3/2/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit

class BAT_ListadoContactosTVC: UITableViewController {

    
    var arrayContactos: arrayDiccionario = []
    var diccionariosContactos : diccionario = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        let customButtonBN = UIButton(type: .custom)
        customButtonBN.setImage(UIImage(named: "brad-pitt.jpg"), for: .normal)
        customButtonBN.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        customButtonBN.layer.cornerRadius = customButtonBN.frame.size.width / 2
        customButtonBN.layer.borderColor = CONSTANTES.COLORES.COLOR_AMARILLO.cgColor
        customButtonBN.layer.borderWidth = 0.5
        customButtonBN.imageView?.contentMode = .scaleAspectFill
        customButtonBN.clipsToBounds = true
        customButtonBN.addTarget(self, action: #selector(self.muestraMiPerfilVC), for: .touchUpInside)
        
        let barButtonItem = UIBarButtonItem(customView: customButtonBN)
        navigationItem.rightBarButtonItem = barButtonItem
        
        //CAMBIO EL COLOR DEL STATUS BAR, SOLO FUNCIONA SI EN EL INFO.PLIST HEMOS AÑADIDO LA FILA 'View controller-based status bar appearance' - > NO
        UIApplication.shared.statusBarStyle = .lightContent

        let rutaFichero = Bundle.main.path(forResource: "Contactos", ofType: "plist")
        arrayContactos = NSArray(contentsOfFile: rutaFichero!) as! arrayDiccionario
        
        tableView.register(UINib(nibName: "BAT_VistaMiContactoCustomCell", bundle: nil), forCellReuseIdentifier: "VistaMiContactoCustomCell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayContactos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let miPerfilCell = tableView.dequeueReusableCell(withIdentifier: "VistaMiContactoCustomCell", for: indexPath) as! BAT_VistaMiContactoCustomCell
        diccionariosContactos = arrayContactos[indexPath.row]
        miPerfilCell.myFotoContacto.image = UIImage(named: diccionariosContactos["imageProfile"]! as! String)
        miPerfilCell.myNombreLB.text = diccionariosContactos["firstName"] as! String?
        miPerfilCell.myApellidoLB.text = diccionariosContactos["lastName"] as! String?

        return miPerfilCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func muestraMiPerfilVC(){
        //present(alertVC("Esta es otra VC", miMensaje: "Bienvenido", miMensajeBoton: "OK"), animated: true, completion: nil)
        let perfilVC = self.storyboard?.instantiateViewController(withIdentifier: "MiPerfilVC") as! BAT_MiPerfilVC
        present(perfilVC, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ventanaDetalle = self.storyboard?.instantiateViewController(withIdentifier: "DetalleContactoVC") as! BAT_DetalleContactoVC
            
        ventanaDetalle.dataContacto = arrayContactos[indexPath.row]
            
        self.navigationController?.pushViewController(ventanaDetalle, animated: true)
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}














