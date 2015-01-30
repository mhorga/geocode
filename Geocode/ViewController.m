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
    LookupLocation *lookup = [LookupLocation sharedInstance];
    
    [lookup setOnCompletionBlock:^(NSString * city, NSString *state) {
        NSString *address = [NSString stringWithFormat:@"%@, %@", city, state];
        self.label.text = address;
    }];
     
    [lookup getInformationForZip:input];
    [self.textField resignFirstResponder];
}

@end
