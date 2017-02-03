//
//  API_UTILS.swift
//  App_BarLogin
//
//  Created by cice on 3/2/17.
//  Copyright © 2017 cice. All rights reserved.
//

import Foundation
import UIKit

typealias diccionario = [String : String]
typealias arrayDiccionario = [diccionario]
let CONSTANTES = Constantes()

struct Constantes {
    let COLORES = Colores()

}

struct Colores {
    let COLOR_NEGRO = UIColor.black
    let COLOR_AMARILLO = #colorLiteral(red: 0.9450980392, green: 0.768627451, blue: 0.05882352941, alpha: 1)
    let COLOR_GRIS_OSCURO = #colorLiteral(red: 0.1019607843, green: 0.09803921569, blue: 0.09803921569, alpha: 1)
}

func alertVC(_ miTitulo: String, miMensaje: String, miMensajeBoton: String) -> UIAlertController{
    let alertVC = UIAlertController(title: miTitulo, message: miMensaje, preferredStyle: .alert)
    alertVC.addAction(UIAlertAction(title: miMensajeBoton, style: .default, handler: nil))
    return alertVC
}
