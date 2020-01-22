//
//  CategoryViewController.swift
//  black_shop
//
//  Created by Владислав Бочаров on 06/01/2020.
//  Copyright © 2020 Владислав Бочаров. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UIViewController {

    @IBOutlet weak var categoryTable: UITableView!
    
//    let realm = try! Realm()
//    var categories:Results<CategoryWears>!
    var categories: [CategoriesWears]=[]
    
    override func viewDidLoad() {
        
    let loaderCategory=AlamofireloaderCategory()
    loaderCategory.loadCategoriesWears { (data) in
         DispatchQueue.main.async {
             self.categories = data
             self.categoryTable.reloadData()
         }
        }
//
//             self.categories = self.realm.objects(CategoryWears.self)
//             self.categoryTable.reloadData()

//         }
         
     
     super.viewDidLoad()
//      categories = realm.objects(CategoryWears.self)

        // Do any additional setup after loading the view.

    }
}

extension CategoryViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if categories.count == 0{
//        return 0
//        }
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "loadCategory") as! CategoryTableViewCell
        let model = categories[indexPath.row]
        cell.nameCategortLabel.text="\(model.nameCategory)"
        cell.sortOrderLabel.text = "\(model.sortOrderCategory)"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){

    let selectedName = categories[indexPath.row]
//        switch selectedName{
//        case 0:
        let newView: SubCategoriesViewController = self.storyboard?.instantiateViewController(withIdentifier: "SubCategoriesViewController") as! SubCategoriesViewController
            print(indexPath.row)
        newView.nameOfCategory=selectedName.nameCategory
            present(newView, animated: true, completion: nil)
//        case 1:
//            let newView1: AboutViewController = self.storyboard?.instantiateViewController(withIdentifier: "AboutView") as! AboutViewController
//
//            present(newView1, animated: true, completion: nil)
//
//        default:
//            print("Pressed on \(randName[indexPath.row])")
//        }
               }
    
}

