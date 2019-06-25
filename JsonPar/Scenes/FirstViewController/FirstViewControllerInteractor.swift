//
//  FirstViewControllerInteractor.swift
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
// MARK: BusinessLogic Protocol

protocol FirstViewControllerBusinessLogic
{
  func doSomething(request: FirstViewController.Receiver.Request)
  func tellSender(request:FirstViewController.TellSender.Request)
}

protocol FirstViewControllerDataStore
{
var name: String { get set }
}

class FirstViewControllerInteractor: FirstViewControllerBusinessLogic, FirstViewControllerDataStore
{
    
    var presenter: FirstViewControllerPresentationLogic?
    var worker: FirstViewControllerWorker?
    var name: String = ""
    
        // MARK: Do Something
    
    func doSomething(request: FirstViewController.Receiver.Request)
    {
        
        worker=FirstViewControllerWorker()
        worker?.doSomeWork()
        
        let response = FirstViewController.Receiver.Response(title:name)
        presenter?.presentSomething(response: response)
    }
    
    //Mark: Tell Sender
    
    func tellSender(request: FirstViewController.TellSender.Request) {
      
        worker?.doSomeWork()
        if worker?.appData?.title != nil{
            name=((worker?.appData!.title)!)
        }
        let response = FirstViewController.TellSender.Response()
        presenter?.presentTellReceiver(response: response)
    }
    
}
