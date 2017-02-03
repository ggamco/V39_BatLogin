//
//  DELEGADOS.swift
//  App_BarLogin
//
//  Created by cice on 3/2/17.
//  Copyright © 2017 cice. All rights reserved.
//

import Foundation
import UIKit


protocol delegacion {
    func funcionDelegada(UIView: UIViewController)
}

class miClasePropia {
    var protocoloDelegado:delegacion?
    
    func muestraMiPerfilVC(){
        
    }
}

