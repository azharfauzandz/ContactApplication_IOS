//
//  AddImageViewController.h
//  ContactApplication
//
//  Created by Bukalapak on 6/20/16.
//  Copyright © 2016 Bukalapak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddImageViewController : UIViewController

- (IBAction)PickerImage:(id)sender;

- (IBAction)CameraImage:(id)sender;

- (IBAction)SavePressed:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *PreviewImage;
@end
