

import Foundation
import Alamofire



class AlamofireloaderCategory{
    
    func loadCategoriesWears(completion: @escaping ([CategoriesWears]) -> Void) {
        Alamofire.request("https://blackstarshop.ru/index.php?route=api/v1/categories").responseJSON{response in
        if let object=response.result.value,
            let jsonDict = object as? NSDictionary{
//                let jsonList = jsonDict["list"] as? [NSDictionary]
                 var categories: [CategoriesWears]=[]
                for (_,data) in jsonDict where data is NSDictionary{
//                    let jsonTemp = dict["main"] as? NSDictionary
                
                    if  let category = CategoriesWears(data: data as! NSDictionary){
                    categories.append(category)
                    print(category.nameCategory)

                
                    }
                }
                completion(categories)
}
}
}
    func loadSubCategoriesWears(completion: @escaping ([SubCategoryWears]) -> Void) {
            Alamofire.request("https://blackstarshop.ru/index.php?route=api/v1/categories").responseJSON{response in
            if let object=response.result.value,
                let jsonDict = object as? NSDictionary{
    //                let jsonList = jsonDict["list"] as? [NSDictionary]
//                     var categories: [CategoriesWears]=[]
                
                     var subcategories: [SubCategoryWears]=[]
                    for (_,data) in jsonDict where data is NSDictionary{
//                        let data1 = data as! NSDictionary
//                        let subdata = data1["subcategories"] as! [NSDictionary] //?? ["":""]
//                        for sub in subdata{
                
                    if  let subcategory = SubCategoryWears(data: data as! NSDictionary ){
                        subcategories.append(subcategory)
//                            print(subcategory.nameSubCategory)

                    
//                        }
                        }}
                    completion(subcategories)
    }
    }
    }
}

