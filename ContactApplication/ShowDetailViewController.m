//
//  ShowDetailViewController.m
//  ContactApplication
//
//  Created by Bukalapak on 6/17/16.
//  Copyright © 2016 Bukalapak. All rights reserved.
//

#import "ShowDetailViewController.h"
#import "AddContactViewController.h"

@interface ShowDetailViewController ()

@end

@implementation ShowDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.DetailImage.layer setCornerRadius:self.DetailImage.frame.size.width/2];
    [self.DetailImage.layer setMasksToBounds:YES];
    
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString:@"EditProfile"]){
        AddContactViewController *destination = [segue destinationViewController];
        destination.EditContact =@[_Details[0],_Details[1],_Details[2],_Details[3],_Details[4],_Details[5],_Details[6]];
    }
}


@end
