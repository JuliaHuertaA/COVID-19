//
//  ViewController.swift
//  INFCovid-19
//
//  Created by Mac4 on 16/12/20.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, CovidManagerDelegate {
    func actualizarInfo(covid: CovidModelo) {
        print(covid.bandera)
        DispatchQueue.main.async {
            let urlImagen:NSURL? = NSURL(string:covid.bandera)
            let data:NSData? = NSData(contentsOf : urlImagen! as URL)
            let image = UIImage(data : data! as Data)

            self.banderaImageView.image = image
            self.paisLabel.text = covid.nombrePais
            self.casosNumeroLabel.text = covid.casosCadena
            self.numeroMuertesLabel.text = covid.muertesCadena
            self.numeroRecuperadosLabel.text = covid.recuperadosCadena
        }
    }
    

    var covidManager = CovidManager()
 
    @IBOutlet weak var buscarTextField: UITextField!
    @IBOutlet weak var banderaImageView: UIImageView!
    @IBOutlet weak var paisLabel: UILabel!
    @IBOutlet weak var casosConfirmadosLabel: UILabel!
    @IBOutlet weak var casosNumeroLabel: UILabel!
    @IBOutlet weak var muertesLabel: UILabel!
    @IBOutlet weak var numeroMuertesLabel: UILabel!
    @IBOutlet weak var recuperadosLabel: UILabel!
    @IBOutlet weak var numeroRecuperadosLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action:#selector(tapGestureHandler))
        view.addGestureRecognizer(tapGesture)
        covidManager.delegado = self
        buscarTextField.delegate = self
    }
    @objc func tapGestureHandler() {
            buscarTextField.endEditing(true)
      }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        paisLabel.text = buscarTextField.text
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if buscarTextField.text != ""{
            return true
        }else{
            buscarTextField.placeholder = "Ingresa un país"
            return false
        }
    }
    
    @IBAction func buscarButton(_ sender: UIButton) {
        paisLabel.text = buscarTextField.text
        covidManager.fetchCovid(nombrePais: buscarTextField.text!)
    }
    

}

