//
//  Activity.swift
//  l2a
//
//  Created by Valentyn on 2020-03-25.
//  Copyright © 2020 Valentyn. All rights reserved.
//

import Foundation

class Activity {
    init(){
    }
    func LEDcontrol(LEDState: String){
        //URL contains internal IP adress of the microcontroller
        let url = URL(string: "http://192.168.0.37/led/"+LEDState)!
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        //HTTP request type
        request.httpMethod = "POST"
        let postString = ""
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(String(describing: error))")
                return
            }

            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
            }

            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(String(describing: responseString))")
        }
        task.resume()
    }
}
