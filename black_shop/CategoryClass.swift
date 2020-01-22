

import Foundation
import Realm
import RealmSwift

class CategoriesWears {
   var nameCategory=""
   var sortOrderCategory=0

    
    init?(data: NSDictionary) {
      nameCategory = data["name"] as? String ?? ""
      sortOrderCategory = Int(data["sortOrder"] as? String ?? "") ?? 0
    }
    
}

class SubCategoryWears: CategoriesWears{
    var nameSubCategory:[String]=[]
    var sortOrderSubCategory:[Int]=[]
    var typeSubCategory:[String]=[]


    override init?(data: NSDictionary) {
     super.init(data: data)
        let subdata = data["subcategories"] as! [NSDictionary] //?? ["":""]
        for sub in subdata{
            nameSubCategory.append(sub["name"] as? String ?? "")
            sortOrderSubCategory.append(Int(sub["sortOrder"] as? String ?? "") ?? 0)
            typeSubCategory.append(sub["type"] as? String ?? "")
        }
    }
}
