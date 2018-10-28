//
//  TrackTableViewCell.swift
//  iTunesInMVVM
//
//  Created by Gokhan Gultekin on 28.10.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import UIKit
import AlamofireImage

class TrackTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    let radius: CGFloat = 2
    
    override func awakeFromNib() {
        super.awakeFromNib()

        coverImageView.layer.roundCorners(corners: [.topLeft, .bottomLeft], radius: radius)
        containerView.layer.cornerRadius = radius
        containerView.dropShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func load(data: Track) {
        trackNameLabel.text = data.trackName
        artistNameLabel.text = data.artistName
        
        if let imageURL = data.artworkUrl100 {
            coverImageView.af_setImage(withURL: URL(string: imageURL)!)
        }
    }
}

//TODO: Move these extensions to the new Pod
extension CALayer {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
        
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        mask = shape
    }
}

extension UIView {
    
    public func dropShadow() {
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowOpacity = 0.70
        layer.shadowRadius = 12
        layer.shadowColor = UIColor.lightGray.cgColor
    }
}
