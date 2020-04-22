//
//  SuperViewController.swift
//  movieGenre
//
//  Created by William Inx on 22/04/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

protocol SuperViewControllerProtocol {
    func setupView()
    func loadData()
}

class SuperViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension SuperViewController: SuperViewControllerProtocol {
    @objc func setupView() {
        self.title = "Super"
    }
    
    @objc func loadData() {
        
    }
    
    
}
