//
//  ViewController.m
//  Geocode
//
//  Created by Marius Horga on 1/23/15.
//  Copyright (c) 2015 Marius Horga. All rights reserved.
//

#import "ViewController.h"
#import "LookupLocation.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)buttonPressed:(id)sender {
    NSString *input = self.textField.text;
    LookupLocation* lookup = [LookupLocation sharedInstance];
    [lookup onCompletionBlock:^(void)(NSString* city, NSString* state) {
        self.label.text = lookup.address;
    }];
    [lookup getInformationForZip:input];
    [self.textField resignFirstResponder];
}

@end
