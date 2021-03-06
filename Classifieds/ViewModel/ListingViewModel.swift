//
//  ListingViewModel.swift
//  Classifieds
//
//  Created by Prajoth D'sa on 18/01/21.
//


import Foundation

class ListingViewModel {
    init(model: [Listing]? = nil) {
        if let inputModel = model {
            listings = inputModel
        }
    }
    var listings = [Listing]()
}

extension ListingViewModel {
    func fetchListings(completion: @escaping (Result<[Listing], Error>) -> Void) {
        HTTPManager.shared.get(urlString: apiUrl, completionBlock: { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .failure(let error):
                print ("failure", error)
            case .success(let dta) :
                let decoder = JSONDecoder()
                do
                {
                    if let jsonListings = try? decoder.decode(Listings.self, from: dta) {
                        self.listings = jsonListings.results
                        print(self.listings.count)
                        completion(.success(jsonListings.results))
                    }
                } catch {
                    // deal with error from JSON decoding if used in production
                }
            }
        })
    }
    
    //For XCTest
    func validateListings(listingObj: Listing) -> String {
        if listingObj.name == ""{
            return "Name Empty"
        } else if listingObj.price == "" {
            return "Price Empty"
        } else if listingObj.image_urls.count == 0 && listingObj.image_urls_thumbnails.count == 0 {
            return "Images Empty"
        }
        return "Good"
    }
}

