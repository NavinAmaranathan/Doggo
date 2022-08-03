//
//  ViewModel.swift
//  CompositionalCollectionView
//
//  Created by Navi on 02/08/22.
//

import Foundation

protocol ViewModelDelegate: AnyObject {
    func didFetchImages(list: [String])
}

class ViewModel {
    weak var delegate: ViewModelDelegate?
    
    func fetch() {
        let API = "https://shibe.online/api/shibes?count=100&urls=true&httpsUrls=true"
        guard let url = URL(string: API) else {
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let response = try JSONDecoder().decode(DogImages.self,
                                                from: data)
                self?.delegate?.didFetchImages(list: response)
            } catch let error {
                debugPrint(error.localizedDescription)
            }
        }
        dataTask.resume()
        
    }
}
