//
//  CovidData.swift
//  INFCovid-19
//
//  Created by Mac7 on 16/12/20.
//

import Foundation

struct CovidData : Codable {
    let country :String
    let countryInfo : CountryInfo
    let cases:Int
    let deaths:Int
    let recovered:Int
}
struct CountryInfo : Codable {
    let flag:String
}

