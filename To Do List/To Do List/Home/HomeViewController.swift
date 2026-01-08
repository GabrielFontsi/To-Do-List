//
//  HomeViewController.swift
//  To Do List
//
//  Created by Gabriel Fontenele on 03/01/26.
//

import UIKit

class HomeViewController: UIViewController {
    
    var screen: HomeScreen?
    
    private let items: [ToDoItem] = [
        ToDoItem(
            title: "Estudar Swift",
            description: "Revisar Auto Layout e UIKit",
            date: "Hoje",
            image: UIImage(systemName: "book"),
            isCompleted: false
        ),
        ToDoItem(
            title: "Treinar",
            description: "Treino de peito e tríceps",
            date: "08:00",
            image: UIImage(systemName: "figure.walk"),
            isCompleted: true
        ),
        ToDoItem(
            title: "Projeto iOS",
            description: "Finalizar tela de tarefas",
            date: "14:00",
            image: UIImage(systemName: "iphone"),
            isCompleted: false
        ),
        ToDoItem(
            title: "Ler",
            description: "Ler 20 páginas",
            date: "Noite",
            image: UIImage(systemName: "book.closed"),
            isCompleted: false
        ),
        ToDoItem(
            title: "Organizar semana",
            description: "Planejar tarefas",
            date: "Domingo",
            image: UIImage(systemName: "calendar"),
            isCompleted: true
        )
    ]
    
    override func loadView() {
        self.screen = HomeScreen()
        self.view = self.screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.configTableViewDelegate(delegate: self, dataSource: self)
        configNavigationBar()
    }
    
    func configNavigationBar() {
        self.title = "To Do List"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(registerProduct))
        navigationItem.rightBarButtonItem = addButton
        navigationController?.navigationBar.tintColor = .white
    }
    
    @objc func registerProduct() {
        let registerVC = RegisterViewController()
        navigationController?.pushViewController(registerVC, animated: true)
    }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ToDoTableViewCell.identifier,for: indexPath) as? ToDoTableViewCell else {
            return UITableViewCell()
    }
        
        let item = items[indexPath.row]
        
        cell.configure(title: item.title, description: item.description, date: item.date, photo: item.image,isCompleted: item.isCompleted)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}



