//
//  PopupView.swift
//  CompositionalCollectionView
//
//  Created by Navi on 02/08/22.
//

import UIKit
import SDWebImage

class PopupView: UIView {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "close"), for: .normal)
        button.addTarget(self, action: #selector(didTapClose), for: .touchUpInside)
        return button
    }()
    
    var image: String!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        imageView.addSubview(closeButton)
    }
    
    convenience init(image: String) {
        self.init(frame: .zero)
        self.image = image
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupViews() {
        imageView.frame = self.bounds
        imageView.sd_setImage(with: URL(string: image)!, completed: nil)
    }
    
    @objc private func didTapClose() {

    }
}
