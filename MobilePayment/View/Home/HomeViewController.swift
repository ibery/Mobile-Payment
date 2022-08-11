//
//  HomeViewController.swift
//  MobilePayment
//
//  Created by Narkoz on 10.08.2022.
//

import UIKit

class HomeViewController : BaseViewController  {
    
    
    // MARK: - Properties
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    
    // MARK: - Setup

    @IBAction func cashierButtonClicked(_ sender: UIButton) {
        guard let viewController = Storyboard.cashierPage.viewController else {return}
        self.navigationController?.show(viewController, sender: nil)
        
        
    }
    
    @IBAction func customerButtonClicked(_ sender: UIButton) {

        guard let customerViewController  = Storyboard.customerPage.viewController else {return}
        self.show(customerViewController, sender: nil)
    }
    
    // MARK: - Actions
    
    
    //MARK: - Methods
    
}

