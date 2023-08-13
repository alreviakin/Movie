//
//  HeaderSuplementaryView.swift
//  Movie
//
//  Created by Алексей Ревякин on 13.08.2023.
//

import Foundation
import UIKit

class HeaderSuplementaryView: UICollectionReusableView {
    var label: UILabel = {
       let label = UILabel()
        label.text = "Header"
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(label)
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
