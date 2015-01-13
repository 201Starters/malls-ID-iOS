//
//  VenueTableViewCell.h
//  Malls@ID
//
//  Created by Farandi Kusumo on 1/13/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VenueTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *thumbnail;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;

@end
