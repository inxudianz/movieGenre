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
        checkInterfaceStyle()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        checkInterfaceStyle()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        checkInterfaceStyle()
    }
    
    private func checkInterfaceStyle() {
        if traitCollection.userInterfaceStyle == .light {
            self.view.backgroundColor = .white
        }
        else {
            self.view.backgroundColor = .black
        }
    }
}

extension SuperViewController: SuperViewControllerProtocol {
    @objc func setupView() {
        self.title = "Super"
    }
    
    @objc func loadData() {
        
    }
    
    
}
