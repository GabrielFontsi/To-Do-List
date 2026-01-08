//
//  RegisterViewController.swift
//  To Do List
//
//  Created by Gabriel Fontenele on 06/01/26.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var screen: RegisterScreen?
    
    override func loadView() {
        self.screen = RegisterScreen()
        self.view = self.screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
