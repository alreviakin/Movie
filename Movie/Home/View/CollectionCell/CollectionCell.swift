//
//  CollectionCell.swift
//  Movie
//
//  Created by Алексей Ревякин on 13.08.2023.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    var viewModel: CollectionCellViewModel? {
        didSet {
            guard let viewModel else { return }
            movieImageView.image = UIImage(data: viewModel.image)
            nameLabel.text = viewModel.name
            dateLabel.text = viewModel.date
        }
    }
    
    private var movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cat2")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()
    private var nameLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    private var dateLabel: UILabel = {
       let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 10)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        contentView.addSubview(movieImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(dateLabel)
    }
    
    override func layoutSubviews() {
        dateLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
        }
        nameLabel.snp.makeConstraints { make in
            make.bottom.equalTo(dateLabel.snp.top).offset(-2)
            make.left.right.equalToSuperview()
        }
        movieImageView.snp.makeConstraints { make in
            make.bottom.equalTo(nameLabel.snp.top).offset(-4)
            make.left.right.top.equalToSuperview()
        }
    }
}
