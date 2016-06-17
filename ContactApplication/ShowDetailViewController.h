//
//  ShowDetailViewController.h
//  ContactApplication
//
//  Created by Bukalapak on 6/17/16.
//  Copyright © 2016 Bukalapak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowDetailViewController : UIViewController

@property (strong, nonatomic) NSArray *Details;


@property (weak, nonatomic) IBOutlet UILabel *DetailFullName;
@property (weak, nonatomic) IBOutlet UILabel *DetailEmail;
@property (weak, nonatomic) IBOutlet UILabel *DetailPhoneNumber;
@property (weak, nonatomic) IBOutlet UILabel *DetailAddress;

@end
