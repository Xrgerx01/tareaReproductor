//
//  detalleCancion.swift
//  reproductorTarea
//
//  Created by XrgerX on 6/08/16.
//  Copyright © 2016 XrgerX. All rights reserved.
//

import UIKit
import AVFoundation

class detalleCancion: UIViewController {

    @IBOutlet weak var tituloPortada: UILabel!
    @IBOutlet weak var imagenPortada: UIImageView!
    @IBOutlet weak var volumen: UILabel!
    
    var canciones: [String] = ["Bailando - Enrique Iglesias", "Corazon Espinado - Mana", "Eres Mia - Romeo Santos", "Es Por Ti - Juanes", "Mi Soledad - Alejandro Sanz"]
    var titulos = ["bailando", "corazon", "eresMia", "esPorTi", "miSoledad"]
    var imagenesCancion = ["bailando.jpg", "corazon.jpg", "eresMia.jpg", "esPorTi.jpg", "miSoledad.jpg"]
    var extensionCancion: String = "mp3"
    var indiceCancion: String = ""
    private var reproductorElegido: AVAudioPlayer!
    
    override func viewWillAppear(animated: Bool) {
        
        var images = [UIImage]()
        var sonidoURL: NSURL? = nil
        
        switch indiceCancion
        {
        case "0":
                tituloPortada.text = canciones[0]
                images.append(UIImage(named: imagenesCancion[0])!)
                imagenPortada.animationImages = images
                imagenPortada.startAnimating()
                sonidoURL = NSBundle.mainBundle().URLForResource(titulos[0], withExtension: extensionCancion)
        case "1":
                tituloPortada.text = canciones[1]
                images.append(UIImage(named: imagenesCancion[1])!)
                imagenPortada.animationImages = images
                imagenPortada.startAnimating()
                sonidoURL = NSBundle.mainBundle().URLForResource(titulos[1], withExtension: extensionCancion)
        case "2":
                tituloPortada.text = canciones[2]
                images.append(UIImage(named: imagenesCancion[2])!)
                imagenPortada.animationImages = images
                imagenPortada.startAnimating()
                sonidoURL = NSBundle.mainBundle().URLForResource(titulos[2], withExtension: extensionCancion)
        case "3":
                tituloPortada.text = canciones[3]
                images.append(UIImage(named: imagenesCancion[3])!)
                imagenPortada.animationImages = images
                imagenPortada.startAnimating()
                sonidoURL = NSBundle.mainBundle().URLForResource(titulos[3], withExtension: extensionCancion)
        case "4":
                tituloPortada.text = canciones[4]
                images.append(UIImage(named: imagenesCancion[4])!)
                imagenPortada.animationImages = images
                imagenPortada.startAnimating()
                sonidoURL = NSBundle.mainBundle().URLForResource(titulos[4], withExtension: extensionCancion)
        default: 0
        }
        
        do {
            try reproductorElegido = AVAudioPlayer(contentsOfURL: sonidoURL!)
            reproductorElegido.play()
            reproductorElegido.volume = 50.0
        } catch {
            print("Error al cargar el archivo de sonido")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var sonidoURL: NSURL? = nil
        switch indiceCancion
        {
        case "0":
         sonidoURL = NSBundle.mainBundle().URLForResource(titulos[0], withExtension: extensionCancion)
        case "1":
         sonidoURL = NSBundle.mainBundle().URLForResource(titulos[1], withExtension: extensionCancion)
        case "2":
         sonidoURL = NSBundle.mainBundle().URLForResource(titulos[2], withExtension: extensionCancion)
        case "3":
         sonidoURL = NSBundle.mainBundle().URLForResource(titulos[3], withExtension: extensionCancion)
        case "4":
         sonidoURL = NSBundle.mainBundle().URLForResource(titulos[4], withExtension: extensionCancion)
        default: 0
        }
        
        do {
            try reproductorElegido = AVAudioPlayer(contentsOfURL: sonidoURL!)
        } catch {
            print("Error al cargar el archivo de sonido")
        }        // Do any additional setup after loading the view.
    }

    @IBAction func play() {
        if !reproductorElegido.playing {
            reproductorElegido.play()
        }    }

    @IBAction func pause() {
        if reproductorElegido.playing {
            reproductorElegido.pause()
        }
    }
    
    @IBAction func stop() {
        if reproductorElegido.playing {
            reproductorElegido.stop()
            reproductorElegido.currentTime = 0.0
        }
    }

    @IBAction func volumen1(sender: UIStepper) {
       volumen.text = "Vomunen " + Int(sender.value).description + "%"
        let valor: Float = Float(sender.value)
        reproductorElegido.volume = valor
    }

}
