//
//  ListNotificationViewController.swift
//  HomeWork4№6
//
//  Created by Aijan Saadatova on 30/5/24.
//

import UIKit

class ListNotificationViewController: UIViewController {
    
    private let generalLabel: UILabel = {
        let generalLabel = UILabel()
        generalLabel.text = "General"
        generalLabel.textColor = .red
        generalLabel.font = UIFont.systemFont(ofSize: 18)
        generalLabel.translatesAutoresizingMaskIntoConstraints = false
        return generalLabel
    }()
    
    private let systemLabel: UILabel = {
        let systemLabel = UILabel()
        systemLabel.text = "System"
        systemLabel.textColor = .darkGray
        systemLabel.font = UIFont.systemFont(ofSize: 18)
        systemLabel.translatesAutoresizingMaskIntoConstraints = false
        return systemLabel
    }()
    private lazy var redLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var grayLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var notesTableView: UITableView = {
        let view = UITableView()
        view.separatorInset = UIEdgeInsets.init(top: 0, left: 16, bottom: 0, right: 16)
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        setupNavigationBar()
        generalLabels()
        systemLabels()
        lineViews()
        graylineViews()
        setupTableView()
        
        notesTableView.register(NotesTableViewCell.self, forCellReuseIdentifier: NotesTableViewCell.reuseID)
        notesTableView.delegate = self
        notesTableView.dataSource = self
        
        navigationItem.hidesBackButton = true
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Notification"
        navigationController?.navigationBar.isHidden = false
        
        let rightBarButton = UIBarButtonItem(image: UIImage(systemName: "gearshape.fill"), style: .plain, target: self, action: #selector(settingsTapped))
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    private func generalLabels() {
        view.addSubview(generalLabel)
        NSLayoutConstraint.activate([
            generalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            generalLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
        ])
    }
    
    private func systemLabels() {
        view.addSubview(systemLabel)
        NSLayoutConstraint.activate([
            systemLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            systemLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            ])
    }
    
    private func lineViews(){
        view.addSubview(redLineView)
        NSLayoutConstraint.activate([
            redLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            redLineView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            redLineView.topAnchor.constraint(equalTo: generalLabel.bottomAnchor, constant: 10),
            redLineView.heightAnchor.constraint(equalToConstant: 3)
        ])
    }
    
    private func graylineViews(){
        view.addSubview(grayLineView)
        NSLayoutConstraint.activate([
            grayLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            grayLineView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            grayLineView.topAnchor.constraint(equalTo: systemLabel.bottomAnchor, constant: 10),
            grayLineView.heightAnchor.constraint(equalToConstant: 3)
        ])
    }
    
    private func setupTableView() {
        view.addSubview(notesTableView)
        NSLayoutConstraint.activate([
            notesTableView.topAnchor.constraint(equalTo: generalLabel.bottomAnchor, constant: 20),
            notesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            notesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            notesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private var cotegories: [Notifications] = [
        Notifications(personImage: UIImage(resource: .person1), info: "Jane Cooper has published a new recipe!", time: "Today | 09:24 AM", image: UIImage(resource: .image1)),
        Notifications(personImage: UIImage(resource: .person2), info: "Rochel has commented on your recipe", time: "1 day ago | 14:43 PM", image: UIImage(resource: .image2)),
        Notifications(personImage: UIImage(resource: .person3), info: "Brad Wigington liked your comment", time: "1 day ago | 09:29 AM", image: UIImage(resource: .image3)),
        Notifications(personImage: UIImage(resource: .person4), info: "Tyra Ballentine has published a new recipe!", time: "2 days ago | 10:29 AM", image: UIImage(resource: .image4)),
        Notifications(personImage: UIImage(resource: .person5), info: "Marci Winkles has published a new recipe!", time: "3 days ago | 16:52 PM", image: UIImage(resource: .image5)),
        Notifications(personImage: UIImage(resource: .person6), info: "Aileen has commented on your recipe", time: "4 days ago | 14:27 PM", image: UIImage(resource: .image6)),
        Notifications(personImage: UIImage(resource: .person7), info: "George has commented on your recipe", time: "5 days ago | 09:20 AM", image: UIImage(resource: .image7)),
    ]
    
    @objc private func settingsTapped() {
        print("")
    }
}

extension ListNotificationViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cotegories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NotesTableViewCell.reuseID, for: indexPath) as! NotesTableViewCell
        
        let elemects = cotegories[indexPath.row]
        cell.configure(with: elemects)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ListNotificationViewController: UITableViewDelegate {
    
}
