//
//  CustomCollectionViewController.swift
//  sample_project
//
//  Created by Vaifat Huy on 4/3/21.
//

import UIKit

class CustomCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate{
    
    @IBOutlet weak var customCollectionView: UICollectionView!
    
    private let reuseIdentifier = "CustomCollectionViewCell"
    private let headerIdentifier = "CustomHeaderCollectionReusableView"
    
    var items: [TodoItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customCollectionView.dataSource = self
        customCollectionView.delegate = self
        // Register cell classes
        let nib = UINib(nibName: "CustomCollectionViewCell", bundle: nil)
        self.customCollectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Register Collection Reusable Views
        let headerNib = UINib(nibName: "CustomHeaderCollectionReusableView", bundle: nil)
        self.customCollectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        
        fetchData()
    }
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - Network API
extension CustomCollectionViewController {
    // Networking library
    // https://github.com/Alamofire/Alamofire
    func fetchData(){
        let urlSession = URLSession.shared
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        urlSession.dataTask(with: request, completionHandler: { [weak self] (data, response, error) in
            guard let `self` = self else { return }
            
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            guard let data = data else { return }
            
            do{
                let decodedData = try JSONDecoder().decode([TodoItem].self, from: data)
                
                DispatchQueue.main.async {
                    self.items = decodedData
                    self.customCollectionView.reloadData()
                    print("Data is fetched")
                    return
                }
            
            }catch {
                print(error.localizedDescription)
                return
            }
        }).resume()
    }
}

// MARK: -Collection View's Delegate functions
extension CustomCollectionViewController {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier, for: indexPath) as! CustomHeaderCollectionReusableView
            view.configureView(title: "SECTION \(indexPath.section)")
            return view
            
        }else { return UICollectionReusableView() }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CustomCollectionViewCell
        
        let item = items[indexPath.item]
        
        cell.configureCell(title: item.title, image: "ios14")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = items[indexPath.item]
        
        print("Title: \(item.title) - Index: \(indexPath.item)")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2, height: 50)
    }
}
