//
//  AddContactViewController.h
//  ContactApplication
//
//  Created by Bukalapak on 6/16/16.
//  Copyright © 2016 Bukalapak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextFieldValidator.h"

@interface AddContactViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *PhotoProfile;
@property (weak, nonatomic) IBOutlet TextFieldValidator *Fullname;
@property (weak, nonatomic) IBOutlet TextFieldValidator *Email;
@property (weak, nonatomic) IBOutlet TextFieldValidator *PhoneNumber;
@property (weak, nonatomic) IBOutlet UITextView *Address;
@property (strong, nonatomic) NSArray *EditContact;
- (IBAction)PickerImage:(id)sender;
- (IBAction)CameraImage:(id)sender;


@property (strong) NSManagedObjectContext *contact;

- (IBAction)SaveButton:(id)sender;


- (IBAction)DismissKeyboard:(id)sender;


@end
