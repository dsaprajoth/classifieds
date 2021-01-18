//
//  DetailViewController.swift
//  Classifieds
//
//  Created by Prajoth D'sa on 18/01/21.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imgListing: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblCreatedAt: UILabel!
    var listingDetail: Listing? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = listingDetail?.name.capitalized
        lblName.text = listingDetail?.name.capitalized
        lblPrice.text = listingDetail?.price
        lblCreatedAt.text = listingDetail?.createdAtFormatted
        imgListing.imageFromServerURL(urlString: listingDetail?.image_urls.first ?? "", PlaceHolderImage: UIImage(systemName: "square.and.arrow.down.fill")!)
    }
}
