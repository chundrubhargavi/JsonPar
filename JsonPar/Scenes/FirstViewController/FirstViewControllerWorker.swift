//
//  FirstViewControllerWorker.swift
//  JsonPar
//
//  Created by Amruta on 20/06/19.
//  Copyright (c) 2019 Bhargavi. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
protocol ServerResponse {
    var title: String { get set}
}

class FirstViewControllerWorker:ServerResponse
{
    // MARK: Variable Declaration
    
    var title: String = ""
    var appData:FirstViewController.TellSender.Request?
    var serverData:ServerResponse?
    // MARK: APL Call
    
    func doSomeWork()
    {
        var urlRequest = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/todos/1")!)
        urlRequest.httpMethod = "GET"
        var urlSession=URLSession.shared.dataTask(with: urlRequest) { (data, resp, err) in
            print(data as Any)
            do{
                self.appData = try JSONDecoder().decode(FirstViewController.TellSender.Request.self, from: data!)
                DispatchQueue.main.async {
                    
                    if self.appData != nil{
                        self.title = self.appData?.title as Any as! String
                        print(self.title)
                    }}}catch{
                print("unable to show data")
            }}
            urlSession.resume()
    }
}