//
//  AppDelegate.swift
//  App_BarLogin
//
//  Created by cice on 27/1/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var puedoRotar = false
    var orientacionDisponible : UIInterfaceOrientationMask = .portrait

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        tareasManager.cargarDatosTareas()
        
        personalizaUI()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        tareasManager.salvarTareas()
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        tareasManager.salvarTareas()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        tareasManager.cargarDatosTareas()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        tareasManager.cargarDatosTareas()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        tareasManager.salvarTareas()
    }

    //MARK: - Funciones de orientacion
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        if puedoRotar{
            return .all
        }else{
            return orientacionDisponible
        }
    }
    
    //MARK: - UTILS
    func personalizaUI(){
        
        let navigation = UINavigationBar.appearance()
        let tabBar = UITabBar.appearance()
        
        
        navigation.barTintColor = CONSTANTES.COLORES.COLOR_NEGRO
        navigation.tintColor = CONSTANTES.COLORES.COLOR_AMARILLO
        navigation.titleTextAttributes = [NSForegroundColorAttributeName: CONSTANTES.COLORES.COLOR_AMARILLO]
        
        tabBar.barTintColor = CONSTANTES.COLORES.COLOR_GRIS_OSCURO
        tabBar.tintColor = CONSTANTES.COLORES.COLOR_AMARILLO
        
    }
    

}

