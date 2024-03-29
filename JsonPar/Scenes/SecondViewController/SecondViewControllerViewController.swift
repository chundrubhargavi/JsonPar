//
//  SecondViewControllerViewController.swift
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

protocol SecondViewControllerDisplayLogic: class
{
  func displaySomething(viewModel: SecondViewController.Sender.ViewModel)
      func displayTellReceiver(viewModel: SecondViewController.TellReceiver.ViewModel)
   }

class SecondViewControllerViewController: UIViewController, SecondViewControllerDisplayLogic
{
  
  var interactor: SecondViewControllerBusinessLogic?
  var router: (NSObjectProtocol & SecondViewControllerRoutingLogic & SecondViewControllerDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = SecondViewControllerInteractor()
    let presenter = SecondViewControllerPresenter()
    let router = SecondViewControllerRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
  
  }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
         doSomething()
        
    }

  
 //@IBOutlet weak var senderLbl: UILabel!
  
    @IBOutlet weak var senderLbl: UILabel!
    //MARK: Do Something
    
    func doSomething()
  {
    let request = SecondViewController.Sender.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: SecondViewController.Sender.ViewModel)
  {
  
   senderLbl.text = viewModel.title
    
  }
    
    @IBAction func senderBtnAction(_ sender: Any) {
        tellReceiver()
    }
    func tellReceiver()
    {
        let name = senderLbl.text!
        let request = SecondViewController.TellReceiver.Request(title:name)
        interactor?.tellReceiver(request: request)
    }
    
    func displayTellReceiver(viewModel: SecondViewController.TellReceiver.ViewModel)
    {
        router?.routeToReceiver(segue: nil)
    }
}
