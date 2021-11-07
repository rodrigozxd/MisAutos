//
//  DetailViewController.swift
//  MisAutos
//
//  Created by RodrigoParedes on 7/11/21.
//  Copyright © 2021 RodrigoParedes. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var informacion: [String: String] = [
        "Lexus LS": "El Lexus LS es un sedán de lujo, del segmento F",
        "Mazda 3": "Mazda 3 es el compacto de cinco puertas, que se fabrica en Japón por la compañía Mazda",
        "Toyota C-HR": "Toyota C-HR es un crossover compacto, del segmento C, producido por el fabricante de automóviles japonés Toyota",
        "Porsche 718 Boxster": "Porsche 718 Boxster es un descapotable biplaza con techo de lona y tracción trasera que sustituye al Porsche Boxster 2012",
        "Genesis G90": "Hyundai Genesis G90 2019 es un sedán de lujo con tracción trasera o total",
        "Hyundai Tucson": "El Hyundai Tucson es el sustituto del Hyundai ix35",
        "Subaru Ascent": "Subaru Ascent 2.4 (260 Cv) AWD CVT del año 2018 es un modelo de coche lanzado por la empresa Subaru",
        "Dodge Durango": "Durango cuenta con dos motores. El motor base es un nuevo motor V6 de 3.6 litros que produce 290 CV (220 kW 290 CV) y 260 libras pies (350 N · m) de torque a 4.800 rpm, el 90% del par máximo está disponible entre 1.600 y 6.400 rpm",
        "Kia Stinger": "KIA Stinger cuenta con una longitud de 4.830 mm, una altura de 1.400 mm y una anchura de 1.870 mm",
        "Nissan Titan": "Nissan Titan es una camioneta de tamaño completo (full size pick up truck)"
    ]
    
    @IBOutlet weak var imgCarro: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var txtInfo: UILabel!
    var recursoRecibido:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        imgCarro.image = UIImage(named: "CARROS/\(recursoRecibido!).jpg")
        textLabel.text = recursoRecibido!
        txtInfo.text = informacion[recursoRecibido!]
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
