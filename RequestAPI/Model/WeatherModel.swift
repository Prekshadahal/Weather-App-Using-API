//
//  WeatherModel.swift
//  RequestAPI
//
//  Created by Preksha Dahal on 01/09/2022.
//

import Foundation
import ObjectMapper

struct WeatherModel : Mappable {
    var coord : Coord?
    var weather : [Weather]?
    var base : String?
    var main : Main?
    var visibility : Int?
    var wind : Wind?
    var clouds : Clouds?
    var dt : Int?
    var sys : Sys?
    var timezone : Int?
    var id : Int?
    var name : String?
    var cod : Int?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        coord <- map["coord"]
        weather <- map["weather"]
        base <- map["base"]
        main <- map["main"]
        visibility <- map["visibility"]
        wind <- map["wind"]
        clouds <- map["clouds"]
        dt <- map["dt"]
        sys <- map["sys"]
        timezone <- map["timezone"]
        id <- map["id"]
        name <- map["name"]
        cod <- map["cod"]
    }

}
