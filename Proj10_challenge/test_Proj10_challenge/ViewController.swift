//
//  ViewController.swift
//  test_Proj10_challenge
//
//  Created by Enrique Casas on 10/23/21.
//

import UIKit

class ViewController: UICollectionViewController {
    
    var pictures = [String]()
    var ans = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                self.pictures.append(item)
            }
        }
        
        self.pictures.sort()
        
        self.collectionView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Person", for: indexPath) as? PersonCell else {
                // we failed to get a PersonCell - bail out!
                fatalError("Unable to dequeue PersonCell.")
        }

        cell.name.text = pictures[indexPath.item]

        cell.imageView.image = UIImage(named: pictures[indexPath.item])

        cell.imageView.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
        cell.imageView.layer.borderWidth = 2
        cell.imageView.layer.cornerRadius = 3
        cell.layer.cornerRadius = 7
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.item]
            //print(pictures[indexPath.item])
            //vc.selectedPictureNumber = indexPath.item + 1
            //vc.totalPictures = pictures.count
            //print (pictures.count)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

