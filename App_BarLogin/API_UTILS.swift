//
//  API_UTILS.swift
//  App_BarLogin
//
//  Created by cice on 3/2/17.
//  Copyright © 2017 cice. All rights reserved.
//

import Foundation
import UIKit

typealias diccionario = [String : Any]
typealias arrayDiccionario = [diccionario]
let CONSTANTES = Constantes()

let tareasManager = API_TareasManager.shared
let prefs = UserDefaults.standard

struct Constantes {
    let COLORES = Colores()
    let USER_DEFAULTS = UserDefaultsCustom()

}

struct Colores {
    let COLOR_NEGRO = UIColor.black
    let COLOR_AMARILLO = #colorLiteral(red: 0.9450980392, green: 0.768627451, blue: 0.05882352941, alpha: 1)
    let COLOR_GRIS_OSCURO = #colorLiteral(red: 0.1019607843, green: 0.09803921569, blue: 0.09803921569, alpha: 1)
}

struct UserDefaultsCustom {
    let KEY_TAREAS = "tareas"
    let KEY_DESCRIPCION_TAREA = "descripcion"
    let KEY_ICONO_TAREA = "icono"
    let KEY_IMAGEN_TAREA = "imagen"
    let KEY_TITULO_ICONO = "titulo"
    
}

func alertVC(_ miTitulo: String, miMensaje: String, miMensajeBoton: String) -> UIAlertController{
    let alertVC = UIAlertController(title: miTitulo, message: miMensaje, preferredStyle: .alert)
    alertVC.addAction(UIAlertAction(title: miMensajeBoton, style: .default, handler: nil))
    return alertVC
}
