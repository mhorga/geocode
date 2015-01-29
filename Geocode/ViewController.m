//
//  ViewController.m
//  Geocode
//
//  Created by Marius Horga on 1/23/15.
//  Copyright (c) 2015 Marius Horga. All rights reserved.
//

/*
 The app should pretty much have one text field (to enter the zip code) and should display city and state (and optional more information). Also only allow number input in the text field (don't show an alert but rather don't even allow input of characters).
 
 Example: I enter 94301 and the app will display "Palo Alto, CA".
*/

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
    //[lookup getInformationForZip:@"94301"];
    [lookup getInformationForZip:input];
    self.label.text = lookup.address;
}

@end
