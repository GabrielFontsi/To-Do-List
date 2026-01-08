//
//  HomeScreen.swift
//  To Do List
//
//  Created by Gabriel Fontenele on 03/01/26.
//

import UIKit

class HomeScreen: UIView {

    lazy var tableView: UITableView = {
        let tb = UITableView(frame: .zero, style: .grouped)
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.separatorStyle = .none
        tb.register(ToDoTableViewCell.self, forCellReuseIdentifier: ToDoTableViewCell.identifier)
        tb.backgroundColor = .clear
        return tb
    }()
    
    public func configTableViewDelegate(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupBackground()
        self.setupLayout()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBackground(){
        self.backgroundColor = .appBackground
    }
    
    private func setupLayout(){
        self.addSubview(self.tableView)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

}
