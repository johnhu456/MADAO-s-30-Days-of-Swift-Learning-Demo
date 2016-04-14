

import UIKit

class MovieSummaryCell: UITableViewCell {

    @IBOutlet weak var imgMovieImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    
    var movieMode:MovieModel?{
        willSet{
            imgMovieImage.image = UIImage(named: (newValue?.image)!)
            lblTitle.text = newValue?.title
            lblDescription.text = newValue?.des
            lblRating.text = newValue?.rating
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        lblRating.layer.cornerRadius = lblRating.frame.size.width/2
        lblRating.layer.masksToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
