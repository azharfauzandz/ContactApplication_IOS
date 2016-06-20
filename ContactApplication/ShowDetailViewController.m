//
//  ShowDetailViewController.m
//  ContactApplication
//
//  Created by Bukalapak on 6/17/16.
//  Copyright © 2016 Bukalapak. All rights reserved.
//

#import "ShowDetailViewController.h"

@interface ShowDetailViewController ()

@end

@implementation ShowDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //get details information
    self.DetailFullName.text = _Details[0];
    self.DetailEmail.text = _Details[1];
    self.DetailPhoneNumber.text = _Details[2];
    self.DetailAddress.text = _Details[3];

    UIImage *photo = [UIImage imageWithData:_Details[4]];
    [self.DetailImage setImage:photo];
    
}

- (void) viewDidLayoutSubviews{
    
    //to set to fit text
    self.DetailAddress.numberOfLines = 0;
    [self.DetailAddress sizeToFit];
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
