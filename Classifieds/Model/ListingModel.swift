//
//  ListingModel.swift
//  Classifieds
//
//  Created by Prajoth D'sa on 18/01/21.
//


import Foundation

struct Listing : Codable {
    let name : String
    let price : String
    let uid : String
    let created_at : String
    var createdAtFormatted: String? {return formattedDate(created_at) }
    let image_urls : [String]
    let image_urls_thumbnails : [String]
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case price = "price"
        case uid = "uid"
        case created_at = "created_at"
        case image_urls = "image_urls"
        case image_urls_thumbnails = "image_urls_thumbnails"
    }
    
    func formattedDate (_ inpDate: String) -> String {
        let dateAsString = inpDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd HH:mm:ss.SSSS"
        if let date = dateFormatter.date(from: dateAsString)
        {
            dateFormatter.dateFormat = "MMMM dd, yyyy - h:mm a"
            let outputDate = dateFormatter.string(from: date)
            return outputDate
        }
        return inpDate
    }
}

struct Listings: Codable {
    var results: [Listing]
}

