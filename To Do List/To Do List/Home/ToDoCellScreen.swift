//
//  ToDoCellScreen.swift
//  To Do List
//
//  Created by Gabriel Fontenele on 03/01/26.
//

import UIKit

private enum Layout {
    static let padding: CGFloat = 12
    static let spacingSmall: CGFloat = 6
    static let spacingMedium: CGFloat = 8
    static let imageSize: CGFloat = 40
    static let checkSize: CGFloat = 24
    static let cornerRadius: CGFloat = 8
}

class ToDoCellScreen: UIView {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.cardBackground
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .darkGray
        label.numberOfLines = 1
           return label
       }()
       
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
       }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = 2
        return label
        }()
        
        private let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        label.textColor = .darkGray
        label.textAlignment = .right
        return label
        }()
    
    private let checkButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .systemGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var isChecked: Bool = false {
        didSet {
            updateCheckUI()
        }
    }

    private func updateCheckUI() {
        let imageName = isChecked ? "checkmark.circle.fill" : "checkmark.circle"
        checkButton.setImage(UIImage(systemName: imageName), for: .normal)
    }


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupConstraints()
        setupActions()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with title: String, description: String, date: String, photo: UIImage?,isCompleted: Bool) {
        titleLabel.text = title
        descriptionLabel.text = description
        dateLabel.text = date
        imageView.image = photo
        self.isChecked = isCompleted
    }

    
    private func setupActions() {
        checkButton.addTarget(self, action: #selector(didTapCheck), for: .touchUpInside)
    }
    
    @objc private func didTapCheck() {
        isChecked.toggle()
    }

    private func setupLayout() {
        self.addSubview(self.containerView)
        self.containerView.addSubview(self.imageView)
        self.containerView.addSubview(self.titleLabel)
        self.containerView.addSubview(self.descriptionLabel)
        self.containerView.addSubview(self.dateLabel)
        self.containerView.addSubview(self.checkButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
          
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),

            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Layout.padding),
            imageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: Layout.imageSize),
            imageView.heightAnchor.constraint(equalToConstant: Layout.imageSize),

            checkButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Layout.padding),
            checkButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            checkButton.widthAnchor.constraint(equalToConstant: Layout.checkSize),
            checkButton.heightAnchor.constraint(equalToConstant: Layout.checkSize),

            titleLabel.topAnchor.constraint(equalTo: imageView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: Layout.padding),
            titleLabel.trailingAnchor.constraint(equalTo: checkButton.leadingAnchor, constant: -Layout.spacingMedium),

            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Layout.spacingSmall),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),

            //dateLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Layout.spacingSmall),
            dateLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            dateLabel.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor, constant: -Layout.padding)
        ])
    }
}
