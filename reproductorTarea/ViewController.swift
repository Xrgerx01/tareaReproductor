//
//  ViewController.swift
//  reproductorTarea
//
//  Created by XrgerX on 6/08/16.
//  Copyright © 2016 XrgerX. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonAleatorio: UIButton!
    var datos: [String] = []
    var accionBotton: Int = 0
    var aleatoriox: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        datos = ["Bailando - Enrique Iglesias", "Corazon Espinado - Mana", "Eres Mia - Romeo Santos", "Es Por Ti - Juanes", "Mi Soledad - Alejandro Sanz"]
        tableView.reloadData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        accionBotton = 0
        return datos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MiCelda", forIndexPath: indexPath)
        let cancion = datos[indexPath.row]
        cell.textLabel?.text = cancion
        accionBotton = 0
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if accionBotton == 1 {
            let resulCancion = cancionAleatoria()
            let sigVista = segue.destinationViewController as! detalleCancion
            sigVista.indiceCancion = String(resulCancion)        }
        else {
            accionBotton = 0
            let resulCancion = tableView!.indexPathForSelectedRow!.row
            let sigVista = segue.destinationViewController as! detalleCancion
            sigVista.indiceCancion = String(resulCancion)
        }
    }
    
    @IBAction func aleatorio() {
     accionBotton = 1
    }
    
    func cancionAleatoria() -> Int {
        aleatoriox = Int(arc4random_uniform(5))
        accionBotton = 0
        return aleatoriox
    }

}
