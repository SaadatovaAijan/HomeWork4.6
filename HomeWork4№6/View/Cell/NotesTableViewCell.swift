//
//  NotesTableViewCell.swift
//  HomeWork4№6
//
//  Created by Aijan Saadatova on 30/5/24.
//

import UIKit

class NotesTableViewCell: UITableViewCell {
    
    private let personImage: UIImageView = {
        let leftImage = UIImageView()
        leftImage.layer.cornerRadius = 12.5
        leftImage.contentMode = .scaleAspectFit
        leftImage.translatesAutoresizingMaskIntoConstraints = false
        return leftImage
    }()
    
    private let infoLabel: UILabel = {
        let Label = UILabel()
        Label.textColor = .black
        Label.numberOfLines = 2
        Label.font = .systemFont(ofSize: 18, weight: .regular)
        Label.translatesAutoresizingMaskIntoConstraints = false
        return Label
    }()
    
    private let timeLabel: UILabel = {
        let Label = UILabel()
        Label.textColor = .systemGray
        Label.font = .systemFont(ofSize: 14, weight: .medium)
        Label.numberOfLines = 0
        Label.translatesAutoresizingMaskIntoConstraints = false
        return Label
    }()
    
    private let rightImage : UIImageView = {
        let rightImage = UIImageView()
        rightImage.contentMode = .scaleAspectFit
        rightImage.backgroundColor = .white
        rightImage.translatesAutoresizingMaskIntoConstraints = false
        return rightImage
    }()
    
    private let tripleBTN: UIButton = {
        let tripleBTN = UIButton(type: .system)
        tripleBTN.tintColor = .darkGray
        tripleBTN.setImage(UIImage(named: "Vector"), for: .normal)
        tripleBTN.translatesAutoresizingMaskIntoConstraints = false
        return tripleBTN
    }()
    
    static var reuseID = "Reuse ID"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(personImage)
        NSLayoutConstraint.activate([
            personImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            personImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            personImage.heightAnchor.constraint(equalToConstant: 50),
            personImage.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        contentView.addSubview(rightImage)
        NSLayoutConstraint.activate([
            rightImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            rightImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            rightImage.heightAnchor.constraint(equalToConstant: 60),
            rightImage.widthAnchor.constraint(equalToConstant: 60)
        ])

        contentView.addSubview(infoLabel)
        NSLayoutConstraint.activate([
            infoLabel.leadingAnchor.constraint(equalTo: personImage.trailingAnchor, constant: 20),
            infoLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            infoLabel.trailingAnchor.constraint(equalTo: rightImage.leadingAnchor, constant: -16)
       ])
        
        contentView.addSubview(timeLabel)
        NSLayoutConstraint.activate([
            timeLabel.leadingAnchor.constraint(equalTo: personImage.trailingAnchor, constant: 20),
            timeLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 10),
            timeLabel.trailingAnchor.constraint(equalTo: rightImage.leadingAnchor, constant: -16)
       ])
        
        contentView.addSubview(tripleBTN)
        NSLayoutConstraint.activate([
            tripleBTN.leadingAnchor.constraint(equalTo: rightImage.trailingAnchor),
            tripleBTN.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            tripleBTN.heightAnchor.constraint(equalToConstant: 24),
            tripleBTN.widthAnchor.constraint(equalToConstant: 24)
       ])
            }
    
    func configure(with elements: Notifications) {
        personImage.image = elements.personImage
        infoLabel.text = elements.info
        timeLabel.text = elements.time
        rightImage.image = elements.image
    }
}
