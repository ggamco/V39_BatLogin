//
//  BAT_NuevaTareaTVC.swift
//  App_BarLogin
//
//  Created by cice on 10/2/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit

class BAT_NuevaTareaTVC: UITableViewController {

    //MARK: - Variables Locales
    
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var myImagenPerfil: UIImageView!
    @IBOutlet weak var myUsernameLB: UILabel!
    @IBOutlet weak var myFechaLB: UILabel!
    @IBOutlet weak var myDescripcionNuevaTarea: UITextView!
    @IBOutlet weak var myImagenPostNuevaTarea: UIImageView!
    @IBOutlet weak var myOcultarImagenBTN: UIButton!
    
    //MARK: - IBActions
    @IBAction func ocultarImagen(_ sender: AnyObject) {
        myImagenPostNuevaTarea.image = nil
        myOcultarImagenBTN.isHidden = true
    }
    
    @IBAction func cerrarNuevaTarea(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: - LIFE VC
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //este metodo inicia la vista con el foco en este textview
        //preparando la vista para empezar a escribir
        myDescripcionNuevaTarea.becomeFirstResponder()
    }
    
    func bajarTeclado(){
        myDescripcionNuevaTarea.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ocultar boton de quitar fotos
        myOcultarImagenBTN.isHidden = true
        
        //para conseguir que la celda de texto
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
        myDescripcionNuevaTarea.delegate = self
        
        //Bloque ToolBar
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 0, height: 44))
        let camera = UIBarButtonItem(image: UIImage(named: "camara"),
                                     style: .done,
                                     target: self,
                                     action: #selector(self.pickerFoto))
        let salvarDatos = UIBarButtonItem(title: "Salvar",
                                          style: .plain,
                                          target: self,
                                          action: #selector(self.salvarDatos))
        let barraFlexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar.items = [camera, barraFlexible, salvarDatos]
        toolBar.barTintColor = CONSTANTES.COLORES.COLOR_NEGRO
        toolBar.tintColor = CONSTANTES.COLORES.COLOR_AMARILLO
        
        myDescripcionNuevaTarea.inputAccessoryView = toolBar
        
        let gestureReconizer = UITapGestureRecognizer(target: self, action: #selector(self.bajarTeclado))
        tableView.addGestureRecognizer(gestureReconizer)
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1{
            return UITableViewAutomaticDimension
        }
        
        return super.tableView(tableView, heightForRowAt: indexPath)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - FUNCIONES PROPIAS
    
    func pickerFoto(){
        pickerPicture()
    }
    
    func salvarDatos(){
        
        if myDescripcionNuevaTarea.text != "" && myImagenPostNuevaTarea.image != nil{
            let imageData = UIImageJPEGRepresentation(myImagenPostNuevaTarea.image!, 0.3)
            tareasManager.tareas.append([CONSTANTES.USER_DEFAULTS.KEY_DESCRIPCION_TAREA : myDescripcionNuevaTarea.text as String])
            tareasManager.fotoTarea.append([CONSTANTES.USER_DEFAULTS.KEY_IMAGEN_TAREA : imageData! as Data])
            
            print("tareas \(tareasManager.tareas.count)")
            dismiss(animated: true, completion: nil)
        }
        present(alertVC("Hey", miMensaje: "mi mensaje", miMensajeBoton: "ok"), animated: true, completion: nil)
        
    }

}

extension BAT_NuevaTareaTVC : UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
        
        //Esto es necesario para conseguir que el textView crezca de tamaño segun se escribe
        let currentOffset = tableView.contentOffset
        UIView.setAnimationsEnabled(false)
        tableView.beginUpdates()
        tableView.endUpdates()
        UIView.setAnimationsEnabled(true)
        tableView.setContentOffset(currentOffset, animated: false)
    }
}

extension BAT_NuevaTareaTVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func pickerPicture(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            showMenu()
        }else{
            showLibraryPictures()
        }
    }
    
    func showMenu(){
        let actionVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionVC.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        actionVC.addAction(UIAlertAction(title: "Tomar foto", style: .default, handler: {
            Void in
            self.pickerFoto()
        }))
        actionVC.addAction(UIAlertAction(title: "Escoge de la librería", style: .default, handler: { Void in
            self.showLibraryPictures()
        }))
        present(actionVC, animated: true, completion: nil)
    }
    
    func showLibraryPictures(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: self.muestraBotonEliminar)
    }
    
    func cameraPictures(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: self.muestraBotonEliminar)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let imageData = info[UIImagePickerControllerOriginalImage] as? UIImage{
            myImagenPostNuevaTarea.image = imageData
        }
        dismiss(animated: true, completion: nil)
    }
    
    func muestraBotonEliminar(){
        myOcultarImagenBTN.isHidden = false
    }
    
}















