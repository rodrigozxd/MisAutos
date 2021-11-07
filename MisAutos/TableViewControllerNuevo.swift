//
//  TableViewControllerNuevo.swift
//  MisAutos
//
//  Created by RodrigoParedes on 5/11/21.
//  Copyright © 2021 RodrigoParedes. All rights reserved.
//

import UIKit

class TableViewControllerNuevo: UITableViewController {
    
    var arregloCarros = ["Lexus LS", "Mazda 3", "Toyota C-HR", "Porsche 718 Boxster", "Genesis G90", "Hyundai Tucson", "Subaru Ascent", "Dodge Durango", "Kia Stinger", "Nissan Titan" ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isEditing = true
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        setEditing(true, animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arregloCarros.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellR", for: indexPath)
        cell.textLabel?.text = arregloCarros[indexPath.row]
        switch cell.textLabel?.text {
        case "Lexus LS":
            cell.imageView?.image = UIImage(named: "CARROS/Lexus LS.jpg")
            cell.detailTextLabel?.text = "El Lexus LS es un sedán de lujo, del segmento F"
        case "Mazda 3":
            cell.imageView?.image = UIImage(named: "CARROS/Mazda 3.jpg")
            cell.detailTextLabel?.text = "Mazda 3 es el compacto de cinco puertas, que se fabrica en Japón por la compañía Mazda"
        case "Toyota C-HR":
            cell.imageView?.image = UIImage(named: "CARROS/Toyota C-HR.jpg")
            cell.detailTextLabel?.text = "Toyota C-HR es un crossover compacto, del segmento C, producido por el fabricante de automóviles japonés Toyota"
        case "Porsche 718 Boxster":
            cell.imageView?.image = UIImage(named: "CARROS/Porsche 718 Boxster.jpg")
            cell.detailTextLabel?.text = "Porsche 718 Boxster es un descapotable biplaza con techo de lona y tracción trasera que sustituye al Porsche Boxster 2012"
        case "Genesis G90":
            cell.imageView?.image = UIImage(named: "CARROS/Genesis G90.jpg")
            cell.detailTextLabel?.text = "Hyundai Genesis G90 2019 es un sedán de lujo con tracción trasera o total"
        case "Hyundai Tucson":
            cell.imageView?.image = UIImage(named: "CARROS/Hyundai Tucson.jpg")
            cell.detailTextLabel?.text = "El Hyundai Tucson es el sustituto del Hyundai ix35"
        case "Subaru Ascent":
            cell.imageView?.image = UIImage(named: "CARROS/Subaru Ascent.jpg")
            cell.detailTextLabel?.text = "Subaru Ascent 2.4 (260 Cv) AWD CVT del año 2018 es un modelo de coche lanzado por la empresa Subaru"
        case "Dodge Durango":
            cell.imageView?.image = UIImage(named: "CARROS/Dodge Durango.jpg")
            cell.detailTextLabel?.text = "Durango cuenta con dos motores. El motor base es un nuevo motor V6 de 3.6 litros que produce 290 CV (220 kW 290 CV) y 260 libras pies (350 N · m) de torque a 4.800 rpm, el 90% del par máximo está disponible entre 1.600 y 6.400 rpm"
        case "Kia Stinger":
            cell.imageView?.image = UIImage(named: "CARROS/Kia Stinger.jpg")
            cell.detailTextLabel?.text = "KIA Stinger cuenta con una longitud de 4.830 mm, una altura de 1.400 mm y una anchura de 1.870 mm"
        case "Nissan Titan":
            cell.imageView?.image = UIImage(named: "CARROS/Nissan Titan.jpg")
            cell.detailTextLabel?.text = "Nissan Titan es una camioneta de tamaño completo (full size pick up truck)"
        default:
            print("No hay mas elementos para llenar imagen")
        }
        return cell
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if (self.isEditing) {
            self.editButtonItem.title = "Hecho"
        }
        else {
            self.editButtonItem.title = "Editar"
        }
    }

    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let objetoMovido = self.arregloCarros[fromIndexPath.row]
        arregloCarros.remove(at: fromIndexPath.row)
        arregloCarros.insert(objetoMovido, at: to.row)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let botonEliminar = UITableViewRowAction(style: .normal, title: "Eliminar") { accionesFila, indiceFila in
            self.arregloCarros.remove(at: indexPath.row)
            tableView.reloadData()
        }
        botonEliminar.backgroundColor = UIColor.red
        let botonVerMas = UITableViewRowAction.init(style: .default, title: "Ver Mas") { (action, cellPath) in
            let recursoSeleccionado = indexPath.row
            self.performSegue(withIdentifier: "showDetailsSegue", sender: recursoSeleccionado)
        }
        botonEliminar.backgroundColor = UIColor.green
        return [botonEliminar,botonVerMas]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailsSegue" {
            let idrecursoRecibido = sender as! Int
            let pantalla2:DetailViewController = segue.destination as! DetailViewController
            pantalla2.recursoRecibido = arregloCarros[idrecursoRecibido]
        }
    }
    


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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
