//
//  WeatherViewModel.swift
//  RequestAPI
//
//  Created by Preksha Dahal on 01/09/2022.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class WeatherViewModel {
    
    static let shared = WeatherViewModel()
    
    func getWeather(lat: Double, long: Double, success: @escaping (WeatherModel) -> Void, fail: @escaping (String) -> Void) {
            
        let url = "https://api.openweathermap.org/data/2.5/weather?lat=\(27.7170)&lon=\(85.2735)&appid=f5fc7de0bfa453dc18cb3e02e2f8d436"
        
        AF.request(url, method:.get, encoding: URLEncoding.default).responseObject(completionHandler: { (response: AFDataResponse<WeatherModel>) in
            
            print(response.request)
            switch response.result {

            case .success(let value):

                success(value)

            case .failure(let error):

                fail(error.localizedDescription)

            }

        })
        }
}
