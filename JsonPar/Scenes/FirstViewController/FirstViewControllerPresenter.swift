//
//  FirstViewControllerPresenter.swift
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

// MARK: Presentation Protocol

protocol FirstViewControllerPresentationLogic
{
  func presentSomething(response: FirstViewController.Receiver.Response)
     func presentTellReceiver(response: FirstViewController.TellSender.Response)
}

class FirstViewControllerPresenter: FirstViewControllerPresentationLogic
{
     weak var viewController: FirstViewControllerDisplayLogic?
    
    //MARK: Present Something
    
    func presentSomething(response: FirstViewController.Receiver.Response)
    {
        let appData=response.title
        let viewModel = FirstViewController.Receiver.ViewModel(title: appData)
        viewController?.displaySomething(viewModel: viewModel)
    }
    //MARK: TellReceiver
    
    func presentTellReceiver(response: FirstViewController.TellSender.Response) {
        let viewModel = FirstViewController.TellSender.ViewModel()
        viewController?.displayTellSender(viewModel: viewModel)
    }
       
}
