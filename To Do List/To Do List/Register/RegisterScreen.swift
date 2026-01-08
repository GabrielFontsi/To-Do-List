//
//  RegisterScreen.swift
//  To Do List
//
//  Created by Gabriel Fontenele on 06/01/26.
//

import UIKit

class RegisterScreen: UIView {

    lazy var imageButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        
        let config = UIImage.SymbolConfiguration(pointSize: 28, weight: .medium)
        let image = UIImage(systemName: "camera.fill", withConfiguration: config)
        
        bt.setImage(image, for: .normal)
        bt.tintColor = .systemGray
        bt.backgroundColor = .systemGray5
        bt.layer.cornerRadius = 50
        bt.clipsToBounds = true
        return bt
    }()

    lazy var titleTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Nome da tarefa"
        tf.borderStyle = .roundedRect
        return tf
    }()

    lazy var descriptionTextView: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.font = .systemFont(ofSize: 16)
        tv.layer.cornerRadius = 8
        tv.layer.borderWidth = 1
        tv.layer.borderColor = UIColor.systemGray4.cgColor
        return tv
    }()

    lazy var datePicker: UIDatePicker = {
        let dp = UIDatePicker()
        dp.translatesAutoresizingMaskIntoConstraints = false
        dp.datePickerMode = .date
        dp.preferredDatePickerStyle = .wheels
        return dp
    }()
    
    lazy var confirmButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Confirmar tarefa", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupBackground()
        self.setupLayout()
        self.setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupBackground() {
        self.backgroundColor = .appBackground
    }

    private func setupLayout() {
        self.addSubview(imageButton)
        self.addSubview(titleTextField)
        self.addSubview(descriptionTextView)
        self.addSubview(datePicker)
        self.addSubview(confirmButton)
    }


    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            imageButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 24),
            imageButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageButton.widthAnchor.constraint(equalToConstant: 100),
            imageButton.heightAnchor.constraint(equalToConstant: 100),
            
            titleTextField.topAnchor.constraint(equalTo: imageButton.bottomAnchor, constant: 24),
            titleTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),

            descriptionTextView.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 12),
            descriptionTextView.leadingAnchor.constraint(equalTo: titleTextField.leadingAnchor),
            descriptionTextView.trailingAnchor.constraint(equalTo: titleTextField.trailingAnchor),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 120),

            datePicker.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 16),
            datePicker.leadingAnchor.constraint(equalTo: titleTextField.leadingAnchor),
            datePicker.trailingAnchor.constraint(equalTo: titleTextField.trailingAnchor),
            datePicker.bottomAnchor.constraint(lessThanOrEqualTo: confirmButton.topAnchor, constant: -16),

            confirmButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            confirmButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            confirmButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            confirmButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

}


