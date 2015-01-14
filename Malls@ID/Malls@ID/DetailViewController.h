//
//  DetailViewController.h
//  Malls@ID
//
//  Created by Farandi Kusumo on 1/14/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImage;
@property (weak, nonatomic) IBOutlet UILabel *labelVenue;
@property (weak, nonatomic) IBOutlet UILabel *labelLocation;

@end
