//
//  CovidManager.swift
//  INFCovid-19
//
//  Created by Mac7 on 16/12/20.
//

import Foundation
protocol CovidManagerDelegate {
    func actualizarInfo(covid:CovidModelo)
}
struct CovidManager {
    
    var delegado: CovidManagerDelegate?
    let CovidURL = "https://disease.sh/v3/covid-19/countries/"
    func fetchCovid(nombrePais:String){
        let urlString = "\(CovidURL)\(nombrePais)?yesterday=true&strict=true"
        print(urlString)
        realizarSolicitud(urlString:urlString)
    }
    func realizarSolicitud(urlString:String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let tarea = session.dataTask(with: url){(data,respuesta,error) in
                if error != nil{
                    print(error!)
                    return
                }
                if let datosSeguros = data{
                    if let covid = self.parseJSON(covidData: datosSeguros){
                        delegado?.actualizarInfo(covid: covid)
                    }
                }
            }
            tarea.resume()
        }
    }

    
    func parseJSON(covidData: Data) -> CovidModelo?{
        let decoder = JSONDecoder()
        do{
           let dataDecodificada = try decoder.decode(CovidData.self, from: covidData)
            let nombrePais =  dataDecodificada.country
            let casos = dataDecodificada.cases
            let muertes = dataDecodificada.deaths
            let recuperados = dataDecodificada.recovered
            let bandera = dataDecodificada.countryInfo.flag

            let ObjCovid = CovidModelo(nombrePais: nombrePais, casos: casos, muertes: muertes, recuperados: recuperados,bandera: bandera)
            return ObjCovid
            
         
        }catch{
            print(error)
            return nil
        }
    }
    
}

