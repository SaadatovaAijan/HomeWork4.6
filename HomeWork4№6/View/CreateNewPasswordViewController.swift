//
//  ViewController.swift
//  HomeWork4№6
//
//  Created by Aijan Saadatova on 30/5/24.
//

import UIKit

class CreateNewPasswordViewController: UIViewController {
    
    private let backBtn: UIButton = {
        let btn = UIButton(frame: CGRect(x: 20, y: 20, width: 20, height: 20))
        btn.setImage(UIImage(systemName: "back"), for: .normal)
        //btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let createNewPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Create New Password 🔐"
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let infoTextLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Enter your new password. If you forget it, then you have to do forgot password."
        lbl.font = .systemFont(ofSize: 16, weight: .regular)
        lbl.textColor = .black
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let passwordlabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Password"
        lbl.font = .systemFont(ofSize: 16, weight: .bold)
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
        
    private let passwordTF: UITextField = {
        let tf = UITextField()
        tf.isSecureTextEntry = true
        tf.placeholder = "Enter password"
        
        tf.layer.borderWidth = 0.5
        tf.layer.cornerRadius = 15
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 5))
        tf.leftView = view
        tf.leftViewMode = .always
        
        let rightView = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 20))
        rightView.setBackgroundImage(UIImage(systemName: "eye"), for: .normal)
        rightView.tag = 0
        rightView.addTarget(self, action: #selector(hideOrShowPassword), for: .touchUpInside)
        
        tf.rightView = rightView
        tf.rightViewMode = .always
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private let confirmPasswordlabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Confirm Password"
        lbl.font = .systemFont(ofSize: 16, weight: .bold)
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
        
    private let confirmPasswordTF: UITextField = {
        let tf = UITextField()
        tf.isSecureTextEntry = true
        tf.placeholder = "Confirm the password"
        
        tf.layer.borderWidth = 0.5
        tf.layer.cornerRadius = 15
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 5))
        tf.leftView = view
        tf.leftViewMode = .always
        
        let rightView = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 20))
        rightView.setBackgroundImage(UIImage(systemName: "eye"), for: .normal)
        rightView.tag = 1
        rightView.addTarget(self, action: #selector(hideOrShowPassword), for: .touchUpInside)
        
        tf.rightView = rightView
        tf.rightViewMode = .always
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private let rememberView: UIView = {
        let stv = UIView()
        stv.translatesAutoresizingMaskIntoConstraints = false
        return stv
    }()
    
    private var isChecked: Bool = false
    
    private let checkMarkBtn: UIButton = {
        let btn = UIButton(/*type: .system*/)
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.borderWidth = 1
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
        
    private let rememberMeLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Remember Me"
        lbl.font = .systemFont(ofSize: 18, weight: .medium)
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let nextBTN : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 16
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //navigationController?.navigationBar.isHidden = true
        setupUI()
        
    }

    private func setupUI() {
        setupLabel()
        setupTF()
        viewRemember()
        setupNext()
        
        checkMarkBtn.addTarget(self, action: #selector(checkBoxTapped), for: .touchUpInside)
        passwordTF.addTarget(self, action: #selector(validatePassword), for: .editingChanged)
        confirmPasswordTF.addTarget(self, action: #selector(validatePassword), for: .editingChanged)
        
        nextBTN.addTarget(self, action: #selector(gotoNextView), for: .touchUpInside)
        
    }
    
    private func setupLabel() {
        view.addSubview(createNewPasswordLabel)
        
        NSLayoutConstraint.activate([
            createNewPasswordLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            createNewPasswordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            createNewPasswordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            createNewPasswordLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        view.addSubview(infoTextLabel)
        
        NSLayoutConstraint.activate([
            infoTextLabel.topAnchor.constraint(equalTo: createNewPasswordLabel.bottomAnchor, constant: 30),
            infoTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            infoTextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            infoTextLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupTF() {
        view.addSubview(passwordlabel)
        view.addSubview(passwordTF)
        
        NSLayoutConstraint.activate([
            passwordlabel.topAnchor.constraint(equalTo: infoTextLabel.bottomAnchor, constant: 20),
            passwordlabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordlabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            passwordlabel.heightAnchor.constraint(equalToConstant: 22),
            
            passwordTF.topAnchor.constraint(equalTo: passwordlabel.bottomAnchor, constant: 10),
            passwordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            passwordTF.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        view.addSubview(confirmPasswordlabel)
        view.addSubview(confirmPasswordTF)
        
        NSLayoutConstraint.activate([
            confirmPasswordlabel.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 15),
            confirmPasswordlabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            confirmPasswordlabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            confirmPasswordlabel.heightAnchor.constraint(equalToConstant: 22),
            
            confirmPasswordTF.topAnchor.constraint(equalTo: confirmPasswordlabel.bottomAnchor, constant: 10),
            confirmPasswordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            confirmPasswordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            confirmPasswordTF.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func viewRemember() {
        view.addSubview(rememberView)
        rememberView.addSubview(checkMarkBtn)
        rememberView.addSubview(rememberMeLabel)
        
        NSLayoutConstraint.activate([
            rememberView.topAnchor.constraint(equalTo: confirmPasswordTF.bottomAnchor, constant: 20),
            rememberView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23),
            rememberView.widthAnchor.constraint(equalToConstant: 200),
            rememberView.heightAnchor.constraint(equalToConstant: 25),
            
            checkMarkBtn.centerYAnchor.constraint(equalTo: rememberView.centerYAnchor),
            checkMarkBtn.leadingAnchor.constraint(equalTo: rememberView.leadingAnchor),
            checkMarkBtn.widthAnchor.constraint(equalToConstant: 15),
            checkMarkBtn.heightAnchor.constraint(equalToConstant: 15),
            
            rememberMeLabel.centerYAnchor.constraint(equalTo: rememberView.centerYAnchor),
            rememberMeLabel.leadingAnchor.constraint(equalTo: checkMarkBtn.trailingAnchor, constant: 4),
            rememberMeLabel.widthAnchor.constraint(equalToConstant: 150),
            rememberMeLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    private func setupNext() {
        view.addSubview(nextBTN)
        
        NSLayoutConstraint.activate([
            nextBTN.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            nextBTN.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nextBTN.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextBTN.heightAnchor.constraint(equalToConstant: 44)
            
        ])
    }
    
    @objc func checkBoxTapped(sender: UIButton){
        isChecked.toggle()
        sender.isSelected = isChecked
        
        if isChecked {
                sender.setImage(UIImage(named: "checked"), for: .normal)
            } else {
                sender.setImage(UIImage(systemName: "squaresquare.dotted"), for: .normal)
            }
    }
    
    @objc func validatePassword(_ sender: UIButton) {
        guard let password = passwordTF.text,
              let confirmPassword = confirmPasswordTF.text else { return }
        
        if password.count >= 8 && password == confirmPassword {
            passwordTF.layer.borderColor = UIColor.black.cgColor
            nextBTN.isEnabled = true
            nextBTN.backgroundColor = .cyan
        } else {
            if sender.tag == 0 {
                passwordTF.layer.borderColor = UIColor.darkGray.cgColor
            }
            nextBTN.isEnabled = false
            nextBTN.backgroundColor = .gray
        }
    }
    
    @objc func hideOrShowPassword(_ sender: UIButton) {
        if sender.tag == 0 {
            passwordTF.isSecureTextEntry = !passwordTF.isSecureTextEntry
        } else if sender.tag == 1 {
            confirmPasswordTF.isSecureTextEntry = !confirmPasswordTF.isSecureTextEntry
        }
    }
    
    @objc func gotoNextView(_ sender: UIButton) {
        validatePassword(sender)
        guard let password = passwordTF.text, let confirmPassword = confirmPasswordTF.text else {
            return
        }
        if password == confirmPassword && password.count >= 8 {
            let vc = ListNotificationViewController()
            navigationController?.pushViewController(vc, animated: true)
        } else {
            passwordTF.textColor = .darkGray
        }
    }

}


