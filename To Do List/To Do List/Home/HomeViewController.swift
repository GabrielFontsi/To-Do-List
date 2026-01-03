//
//  HomeViewController.swift
//  To Do List
//
//  Created by Gabriel Fontenele on 03/01/26.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var screen = HomeScreen()
    
    override func loadView() {
        self.view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }
}
