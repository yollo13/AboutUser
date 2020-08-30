//
//  ViewController.swift
//  AboutUser
//
//  Created by YolloArts on 30.08.2020.
//  Copyright © 2020 YolloArts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IB Outlet
    let currentLogin = DataUserLogin(login: "Alex", password: "1234")
    
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    // MARK: - override methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LoginSegue" {
            guard let loginVC = segue.destination as? WelcomeViewController else {
                return
            }
            loginVC.userName = currentLogin.password
            //print("loginVC.userName as Any")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - IB Actions
    @IBAction func loginTap(_ sender: UIButton) {
        if passwordTF.text == currentLogin.password &&
            loginTF.text == currentLogin.login {
            performSegue(withIdentifier: "LoginSegue", sender: nil)
        } else { showAlert(with: "Неверный логин или пароль", and: "Попробуйте еще раз")
            passwordTF.text = ""
        }
    }
    
    @IBAction func forgotLoginTap() {
        showAlert(with: "Подсказка", and: "Логин - Alex")
    }
    
    @IBAction func forgotPasswordTap() {
        showAlert(with: "Подсказка", and: "Пароль - 1234")
    }
    
    
    @IBAction func unwindLoginScreen(segue: UIStoryboardSegue) {
        guard segue.source is WelcomeViewController else { return }
        loginTF.text = ""
        passwordTF.text = ""
    }
}

// MARK: - Alert Controller
extension ViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
