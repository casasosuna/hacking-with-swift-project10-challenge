//
//  DetailViewController.swift
//  test_Proj10_challenge
//
//  Created by Enrique Casas on 10/23/21.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var photoView: UIImageView!
    
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageToLoad = selectedImage {
            photoView.image = UIImage(named:imageToLoad)
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
