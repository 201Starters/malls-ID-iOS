//
//  DetailViewController.m
//  Malls@ID
//
//  Created by Farandi Kusumo on 1/14/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailTabBarController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize labelVenue;
@synthesize labelLocation;
@synthesize thumbnailImage;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    DetailTabBarController *tabBar = (DetailTabBarController *)self.tabBarController;
    labelVenue.text = [NSString stringWithFormat:@"%@",tabBar.mallName];
    labelLocation.text = [NSString stringWithFormat:@"%@",tabBar.mallLocation];
    thumbnailImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",tabBar.mallThumbnail]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
