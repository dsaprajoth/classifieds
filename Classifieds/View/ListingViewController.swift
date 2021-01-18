//
//  ListingViewController.swift
//  Classifieds
//
//  Created by Prajoth D'sa on 18/01/21.
//

import UIKit

class ListingCustomCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var imgThumb: UIImageView!
}

class ListingViewController: UIViewController {
    
    @IBOutlet weak var tblListing: UITableView!
        
    var listingViewModel = ListingViewModel()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Classifieds"
        listingViewModel.fetchListings{ [weak self] listings in
            DispatchQueue.main.async {
                self?.updateUI()
            }
        }
    }
    
    func updateUI() {
        tblListing.reloadData()
    }
}

extension ListingViewController: UITableViewDataSource  {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListingCustomCell
        let cellData = listingViewModel.listings[indexPath.row]
        cell.lblName.text = cellData.name.capitalized
        cell.lblDate.text = cellData.createdAtFormatted
        cell.lblPrice.text = cellData.price
        cell.imgThumb.imageFromServerURL(urlString: cellData.image_urls_thumbnails.first ?? "", PlaceHolderImage: UIImage(systemName: "square.and.arrow.down.fill")!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listingViewModel.listings.count
    }
    
}

extension ListingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailVC") as? DetailViewController
        detailVC?.listingDetail = listingViewModel.listings[indexPath.row]
        self.navigationController?.pushViewController(detailVC!, animated: true)
    }
}

extension UIImageView {
    public func imageFromServerURL(urlString: String, PlaceHolderImage:UIImage) {
        if self.image == nil{
            self.image = PlaceHolderImage
        }
        
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error ?? "No Error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
            
        }).resume()
    }
}
