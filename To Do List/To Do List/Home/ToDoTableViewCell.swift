//
//  ToDoTableViewCell.swift
//  To Do List
//
//  Created by Gabriel Fontenele on 03/01/26.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: ToDoTableViewCell.self)
    
    lazy var toDoTableViewCellScreen: ToDoCellScreen = {
        let view = ToDoCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.setCardShadow()
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupBackground()
        self.setupLayout()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String, description: String, date: String, photo: UIImage?, isCompleted: Bool) {
        toDoTableViewCellScreen.configure(
            with: title,
            description: description,
            date: date,
            photo: photo,
            isCompleted: isCompleted
        )
    }
    
    private func setupBackground() {
       self.backgroundColor = .clear
        self.selectionStyle = .none
    }
    
    private func setupLayout() {
        self.contentView.addSubview(self.toDoTableViewCellScreen)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            toDoTableViewCellScreen.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            toDoTableViewCellScreen.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            toDoTableViewCellScreen.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            toDoTableViewCellScreen.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }

}
