//
//  CatService.swift
//  APISample
//
//  Created by Diego Castro on 22/04/24.
//

import Foundation

class CatService {
    static let url = URL(string: "https://meowfacts.herokuapp.com/?lang=por-br")
    
    public static func getRanomFact(completion: @escaping (CatModel?, Error?) -> Void) {
        guard let url else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else { return }
            
            do {
                let result = try JSONDecoder().decode(CatModel.self, from: data)
                completion(result, nil)
            }
            catch {
                
            }
        }.resume()
    }
}
