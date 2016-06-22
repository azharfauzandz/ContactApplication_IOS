//
//  AddContactViewController.h
//  ContactApplication
//
//  Created by Bukalapak on 6/16/16.
//  Copyright © 2016 Bukalapak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextFieldValidator.h"
#import <RSKImageCropper/RSKImageCropper.h>

@interface AddContactViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, RSKImageCropViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *PhotoProfile;
@property (weak, nonatomic) IBOutlet TextFieldValidator *Fullname;
@property (weak, nonatomic) IBOutlet TextFieldValidator *Email;
@property (weak, nonatomic) IBOutlet TextFieldValidator *PhoneNumber;
@property (weak, nonatomic) IBOutlet UITextView *Address;
@property (strong, nonatomic) NSArray *EditContact;
- (IBAction)ChangeImage:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *ChangeImageBut;



@property (strong) NSManagedObjectContext *contact;

- (IBAction)SaveButton:(id)sender;


- (IBAction)DismissKeyboard:(id)sender;


@end
