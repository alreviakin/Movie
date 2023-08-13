//
//  CollectionCellViewModel.swift
//  Movie
//
//  Created by Алексей Ревякин on 13.08.2023.
//

import Foundation

class CollectionCellViewModel {
    let image: Data
    let name: String
    let date: String
    
    init(image: Data, name: String, date: String) {
        self.image = image
        self.name = name
        self.date = date
    }
}
