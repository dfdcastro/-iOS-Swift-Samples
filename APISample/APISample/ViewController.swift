//
//  ViewController.swift
//  APISample
//
//  Created by Diego Castro on 22/04/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        CatService.getRanomFact { cat, error in
            guard let cat else { return }
            
            DispatchQueue.main.async {
                self.label.text = cat.data.first
            }
            
            FoxService.getRandomFox { fox, error  in
                guard let fox else { return }
                
                FoxService.getImage(urlString: fox.image) { data in
                    guard let data else { return }
                    
                    DispatchQueue.main.async {
                        self.image.image = UIImage(data: data)
                    }
                }
            }
        }
    }


}

