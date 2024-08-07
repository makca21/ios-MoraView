//
//   MovieCell.swift
//  MoraView
//
//  Created by Şevval Armağan on 7.08.2024.
//

import UIKit

protocol HomeCellDelegate: AnyObject {
    
    func handleImageView(imageData: Data)
}

final class HomeCell: UICollectionViewCell {
    
    private weak var delegate: HomeCellDelegate?
    
    private lazy var generalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 0, left: 20, bottom: 20, right: 20)
        return stackView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var imagesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.clipsToBounds = true
        return stackView
    }()
    
    private lazy var imageViews: [UIImageView] = {
            var imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFill
            imageView.backgroundColor = .lightGray
            imageView.layer.cornerRadius = 4
            imageView.clipsToBounds = true
            imageView.isUserInteractionEnabled = true
            
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGestureRecognizer(_:)))
            imageView.addGestureRecognizer(tapGestureRecognizer)
        
        return imageViews
            
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [nameLabel, imagesStackView].forEach { view in
            generalStackView.addArrangedSubview(view)
        }
        
        imageViews.forEach { view in
            imagesStackView.addArrangedSubview(view)
        }
        
        addSubview(generalStackView)
        
        NSLayoutConstraint.activate([
            nameLabel.heightAnchor.constraint(equalToConstant: 22),
            generalStackView.topAnchor.constraint(equalTo: topAnchor),
            generalStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            generalStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            generalStackView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    
    func set(
        name: String,
        imageUrls: [String],
        delegate: HomeCellDelegate?
    ) {
        nameLabel.text = name
        self.delegate = delegate
    }
    
    @objc
    private func handleTapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        guard let tag = sender.view?.tag,
              let imageData = imageViews[tag - 1].image?.pngData() else {
            return
        }
        
        delegate?.handleImageView(imageData: imageData)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

