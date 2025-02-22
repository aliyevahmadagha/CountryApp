//
//  BaseController.swift
//  CountryApp
//
//  Created by Khalida Aliyeva on 22.02.25.
//

import UIKit

class BaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureView()
        configureConstraint()
        configureTargets()
    }
    
    open func configureView() {}
    open func configureConstraint() {}
    open func configureTargets() {}

}
