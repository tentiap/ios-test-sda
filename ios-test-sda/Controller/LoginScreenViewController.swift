//
//  LoginScreenViewController.swift
//  ios-test-sda
//
//  Created by Tenti Atika Putri on 15/10/22.
//

import UIKit

class LoginScreenViewController: UIViewController {


    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var palindromeTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var checkButton: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

        nextButton.layer.cornerRadius = 15.0
        checkButton.layer.cornerRadius = 15.0
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @IBAction func checkPalindrome(_ sender: Any) {
        if !nameTextField.text!.isEmpty && !palindromeTextField.text!.isEmpty  {
            let word = palindromeTextField.text!.lowercased().replacingOccurrences(of: " ", with: "")
            let reversedWord = String(word.reversed())

            if word == reversedWord {
                displayAlertMessage(userMessage: "isPalindrome")
            } else {
                displayAlertMessage(userMessage: "not palindrome")
            }

            palindromeTextField.text = ""

        } else {
            displayAlertMessage(userMessage: "Name and Palindrome cannot be empty")
        }
    }

    @IBAction func goToHomeScreen(_ sender: Any) {

        if !nameTextField.text!.isEmpty {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let homeScreenViewController = storyBoard.instantiateViewController(withIdentifier: "HomeScreenID") as? HomeScreenViewController
            homeScreenViewController?.modalTransitionStyle = .crossDissolve
            homeScreenViewController?.loginNameString = nameTextField.text!
            self.navigationController?.pushViewController(homeScreenViewController!, animated: true)
        } else {
            displayAlertMessage(userMessage: "Input name first!")
        }
    }


    func displayAlertMessage(userMessage: String) {
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
}

