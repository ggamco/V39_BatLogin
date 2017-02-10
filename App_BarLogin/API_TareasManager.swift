//
//  API_TareasManager.swift
//  App_BarLogin
//
//  Created by cice on 10/2/17.
//  Copyright © 2017 cice. All rights reserved.
//

import Foundation

class API_TareasManager{
    
    //Singleton
    static let shared = API_TareasManager()
    
    var tareas : arrayDiccionario = []
    var fotoTarea : arrayDiccionario = []
    
    func salvarTareas(){
        prefs.set(tareas, forKey: CONSTANTES.USER_DEFAULTS.KEY_TAREAS)
        prefs.set(fotoTarea, forKey: CONSTANTES.USER_DEFAULTS.KEY_IMAGEN_TAREA)
        
    }
    
    func cargarDatosTareas(){
        if let myArrayTareas = prefs.array(forKey: CONSTANTES.USER_DEFAULTS.KEY_TAREAS) as? arrayDiccionario{
            tareas = myArrayTareas
        }
        
        if let myArrayFotos = prefs.array(forKey: CONSTANTES.USER_DEFAULTS.KEY_IMAGEN_TAREA) as? arrayDiccionario{
            fotoTarea = myArrayFotos
        }
        
    }
    
}
