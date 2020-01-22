//
//  SubCategoriesViewController.swift
//  black_shop
//
//  Created by Владислав Бочаров on 06/01/2020.
//  Copyright © 2020 Владислав Бочаров. All rights reserved.
//

import UIKit

class SubCategoriesViewController: UIViewController {

    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    var nameOfCategory = ""
  
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var tableSubCategories: UITableView!
    var subCategories: [SubCategoryWears]=[]
    var subCategoriesNow: [String]=[]
        override func viewDidLoad() {
            
        let loaderSubCategory=AlamofireloaderCategory()
            loaderSubCategory.loadSubCategoriesWears{ (data) in
             DispatchQueue.main.async {
                 self.subCategories = data
                for sub in self.subCategories{
                    if sub.nameCategory==self.nameOfCategory{
                        for type in sub.typeSubCategory{
                            if type == "Category"{
                        self.subCategoriesNow = sub.nameSubCategory
                            }}}
                }
                 self.tableSubCategories.reloadData()
             }
            }
    //
    //             self.categories = self.realm.objects(CategoryWears.self)
    //             self.categoryTable.reloadData()

    //         }
            titleLabel.text=nameOfCategory
         super.viewDidLoad()
    //      categories = realm.objects(CategoryWears.self)

            // Do any additional setup after loading the view.

        }
    }

extension SubCategoriesViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if categories.count == 0{
//        return 0
//        }
        return subCategoriesNow.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "loadSubCategory") as! SubCategoriesTableViewCell
//        let model = subCategoriesNow[indexPath.row]
        cell.nameSubCategoryLabel.text="\(subCategoriesNow[indexPath.row])"
//        cell.sortOrderSubCategoryLabel.text = "\(model.sortOrderSubCategory)"
//        cell.nameC.text="\(model.nameCategory)"
//        cell.typeC.text = "\(model.typeSubCategory)"
        return cell
    }
    
}


