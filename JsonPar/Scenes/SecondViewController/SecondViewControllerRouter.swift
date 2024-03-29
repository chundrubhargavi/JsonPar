//
//  SecondViewControllerRouter.swift
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
// MARK: Navigation Protocol

@objc protocol SecondViewControllerRoutingLogic
{
  func routeToReceiver(segue: UIStoryboardSegue?)
}
// MARK: Data Passing Protocol

protocol SecondViewControllerDataPassing
{
  var dataStore: SecondViewControllerDataStore? { get }
}

class SecondViewControllerRouter: NSObject, SecondViewControllerRoutingLogic, SecondViewControllerDataPassing
{
  weak var viewController: SecondViewControllerViewController?
  var dataStore: SecondViewControllerDataStore?
  
  // MARK: Routing
  
  func routeToReceiver(segue: UIStoryboardSegue?)
  {

     let destinationVC=viewController?.presentingViewController  as! FirstViewControllerViewController
     var destinationDS = destinationVC.router!.dataStore!
     passDataToSender(source: dataStore!, destination: &destinationDS)
      navigateToSomewhere(source: viewController!, destination: destinationVC)
 
  }

  // MARK: Navigation
  
  func navigateToSomewhere(source: SecondViewControllerViewController, destination: FirstViewControllerViewController)
  {
    source.dismiss(animated: true, completion: nil)
  }
  
  // MARK: Passing data
  
  func passDataToSender(source: SecondViewControllerDataStore, destination: inout FirstViewControllerDataStore)
  {
    destination.name = source.name
  }
}
