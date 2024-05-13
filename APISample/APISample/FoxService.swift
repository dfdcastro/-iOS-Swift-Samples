//
//  FoxService.swift
//  APISample
//
//  Created by Diego Castro on 22/04/24.
//

import Foundation

class FoxService {
    static let url = URL(string: "https://randomfox.ca/floof/")
    
    public static func getRandomFox(completion: @escaping (FoxModel?, Error?) -> Void) {
        guard let url else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else { return }
            
            do {
                let result = try JSONDecoder().decode(FoxModel.self, from: data)
                
                completion(result, nil)
            }
            catch {}
        }.resume()
    }
    
    public static func getImage(urlString: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else { return }
            completion(data)
        }.resume()
    }
}
