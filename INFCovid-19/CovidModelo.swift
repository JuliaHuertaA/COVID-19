//
//  CovidModelo.swift
//  INFCovid-19
//
//  Created by Mac7 on 16/12/20.
//

import Foundation

struct CovidModelo {
    let nombrePais:String
    let casos:Int
    let muertes:Int
    let recuperados:Int
    let bandera:String
    var casosCadena: String{
        return String(casos)
    }
    var muertesCadena: String{
        return String(muertes)
    }
    var recuperadosCadena: String{
        return String(recuperados)
    }
}

