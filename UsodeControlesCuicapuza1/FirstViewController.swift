//
//  FirstViewController.swift
//  UsodeControlesCuicapuza
//
//  Created by Janco Flores on 3/06/24.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var txtRpta: UITextField!
    @IBOutlet weak var txtNumero1: UITextField!
    @IBOutlet weak var txtNumero2: UITextField!
    
    var nro1:Double = 0
    var nro2:Double = 0
    var rpta:Double = 0
    
    @IBAction func btnSumar(_ sender: Any) {
        if Double(txtNumero1.text!) != nil && Double(txtNumero2.text!) != nil {
            nro1 = Double(txtNumero1.text!)!
            nro2 = Double(txtNumero2.text!)!
            rpta = nro1 + nro2
            txtRpta.text = String(rpta)
        } else {
            mostrarAlerta(titulo: "Error", mensaje: "Debe introducir solo valores numericos")
            print("Error al realizar operacion")
        }
    }
    
    @IBAction func btnRestar(_ sender: Any) {
        if let nro1 = Double(txtNumero1.text!), let nro2 = Double(txtNumero2.text!) {
            if nro1 >= nro2 {
                let rpta = nro1 - nro2
                txtRpta.text = String(rpta)
            } else {
                mostrarAlerta(titulo: "Error", mensaje: "El primer número debe ser mayor o igual que el segundo")
                print("Error al realizar operación")
            }
        } else {
            mostrarAlerta(titulo: "Error", mensaje: "Debe introducir solo valores numéricos")
            print("Error al realizar operación")
        }
    }
    
    @IBAction func btnDividir(_ sender: Any) {
        if let nro1 = Double(txtNumero1.text!), let nro2 = Double(txtNumero2.text!) {
                if nro2 != 0 {
                    let rpta = nro1 / nro2
                    txtRpta.text = String(rpta)
                } else {
                    mostrarAlerta(titulo: "Error", mensaje: "No se puede dividir entre cero")
                    print("Error al realizar operación")
                }
            } else {
                mostrarAlerta(titulo: "Error", mensaje: "Debe introducir solo valores numéricos")
                print("Error al realizar operación")
            }
    }
    
    @IBAction func btnMultiplicar(_ sender: Any) {
        if let nro1 = Double(txtNumero1.text!), let nro2 = Double(txtNumero2.text!) {
                let rpta = nro1 * nro2
                txtRpta.text = String(rpta)
            } else {
                mostrarAlerta(titulo: "Error", mensaje: "Debe introducir solo valores numéricos")
                print("Error al realizar operación")
            }
    }
    
    @IBAction func btnLimpiar(_ sender: Any) {
        self.Limpiar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func Limpiar() {
        self.txtNumero1.text = "0"
        self.txtNumero2.text = "0"
        self.txtRpta.text = "0"
    }
    
    func mostrarAlerta(titulo: String, mensaje: String) {
        let alerta = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        let limpiar = UIAlertAction(title:"Limpiar", style: .default, handler: {(action) in
            self.Limpiar()
        })
        let cancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: {(action) in
            //aciones a realizar
        })
        alerta.addAction(limpiar)
        alerta.addAction(cancelar)
        present(alerta, animated: true, completion: nil)
    }

}
