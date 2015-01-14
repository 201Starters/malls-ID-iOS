//
//  DetailTabBarController.h
//  Malls@ID
//
//  Created by Farandi Kusumo on 1/14/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailTabBarController : UITabBarController
@property (nonatomic, strong) NSString *mallName;
@property (nonatomic,strong)  NSString *mallLocation;
@property (nonatomic,strong)  NSString *mallThumbnail;

@end
