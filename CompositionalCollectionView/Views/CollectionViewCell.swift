//
//  CollectionViewCell.swift
//  CompositionalCollectionView
//
//  Created by Navi on 02/08/22.
//

import UIKit
import SDWebImage

struct CellModel {
    let urlString: String
}

class CollectionViewCell: UICollectionViewCell {

    static let identifier = "myCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }
    
    @IBOutlet private var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(with model: CellModel) {
        imageView.sd_setImage(with: URL(string: model.urlString),
                                           placeholderImage: UIImage(systemName: "photo"),
                                           options: .continueInBackground,
                                           context: nil)
    }
}
