//
//  ViewController.swift
//  AboutUser
//
//  Created by YolloArts on 30.08.2020.
//  Copyright © 2020 YolloArts. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IB Outlet
    
    @IBOutlet var loginTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    private let currentLogin = DataUserLogin.getUserData()
    
    // MARK: - override methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        let welcomeVC = tabBarController.viewControllers?.first as! WelcomeViewController
        let navigationVC = tabBarController.viewControllers?.last as! UINavigationController
        let aboutUserVC = navigationVC.topViewController as! UserInfoViewController
        welcomeVC.userName = currentLogin
        aboutUserVC.userName = currentLogin
        
    }
    
    //    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        self.view.endEditing(true)
    //    }
    //
    // MARK: - IB Actions
    @IBAction func loginTap() {
        if passwordTF.text == currentLogin.password &&
            loginTF.text == currentLogin.login {
            performSegue(withIdentifier: "LoginSegue", sender: nil)
        } else { showAlert(with: "Неверный логин или пароль", and: "Попробуйте еще раз")
            passwordTF.text = ""
        }
    }
    
    @IBAction func forgotLoginTap() {
        showAlert(with: "Подсказка", and: "Логин \(currentLogin.login)")
    }
    
    @IBAction func forgotPasswordTap() {
        showAlert(with: "Подсказка", and: "Пароль \(currentLogin.password)")
    }
    
    
    @IBAction func unwindLoginScreen(segue: UIStoryboardSegue) {
        guard segue.source is WelcomeViewController else { return }
        loginTF.text = ""
        passwordTF.text = ""
        
    }
}

// MARK: - Alert Controller
extension LoginViewController {
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

// MARK: - Text Field Delegate

extension LoginViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTF {
            textField.resignFirstResponder()
            passwordTF.becomeFirstResponder()
        } else {
            loginTap()
        }
        return true
    }
    
}


