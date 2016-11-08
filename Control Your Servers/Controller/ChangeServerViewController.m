//
//  ChangeServerViewController.m
//  Control Your Servers
//
//  Created by Bodya on 29.10.16.
//  Copyright © 2016 Aleksey. All rights reserved.
//

#import "ChangeServerViewController.h"

@interface ChangeServerViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameServerTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressServerTextField;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;                  //default hide
@property (nonatomic, strong) NSMutableArray *servers;
@end

@implementation ChangeServerViewController

NSString* const validatorNameConstant1 = @"1234567890zaqwsxcderfvbgtyhnmjuikolp QAZWSXEDCRFVTGBYHNUJMIKOLP.";
NSString* const validatorAddressConstant1 = @"1234567890zaqwsxcderfvbgtyhnmjuikolp QAZWSXEDCRFVTGBYHNUJMIKOLP./:";


#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupModel];
    [self setupView];
    // Do any additional setup after loading the view.
}

- (void)setupModel {
    self.servers =  [[[NSUserDefaults standardUserDefaults] arrayForKey:@"servers"] mutableCopy];
    
    if(!self.servers){
        self.servers = [NSMutableArray new];
    }
}

-(void)setupView {
    self.nameServerTextField.text = [self currentServerName];
    self.addressServerTextField.text = [self currentServerAddress];
}

- (NSString *)currentServerName {
    return [[self.servers objectAtIndex:self.indexPathForSelectedRow.row] objectForKey:@"name"];
}
- (NSString *)currentServerAddress {
    return [[self.servers objectAtIndex:self.indexPathForSelectedRow.row] objectForKey:@"address"];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.nameServerTextField endEditing:YES];
    [self.addressServerTextField endEditing:YES];
}

-(void)changeServerNameTo:(NSString *)name AddressTo:(NSString *)address {
    
    NSDictionary *server = @{
                             @"name" : name,
                             @"address" : address
                             };
    [self.servers replaceObjectAtIndex:self.indexPathForSelectedRow.row withObject:server];
    [[NSUserDefaults standardUserDefaults] setObject:[self.servers copy] forKey:@"servers"];
    
}

#pragma mark - Actions

- (IBAction)changeServerAction:(id)sender {
    NSString *name = self.nameServerTextField.text;
    NSString *address = self.addressServerTextField.text;
    
    NSString *currentName = [self currentServerName];
    NSString *currentAddress = [self currentServerAddress];
    
    if (!name.length && !address.length) {
        [self showAndHideMessageWithText:@"Strings can not be empty" withColor:[UIColor redColor]];
        }
    else if (name == currentName && address == currentAddress){
        [self showAndHideMessageWithText:@"Please enter the changes" withColor:[UIColor redColor]];
        }
    else {
        [self changeServerNameTo:name AddressTo:address];
        [self showAndHideMessageWithText:@"Server was changed" withColor:[UIColor greenColor]];

    }
}


-(void)showAndHideMessageWithText:(NSString *)text withColor:(UIColor *)color {
    
    self.messageLabel.textColor = color;
    self.messageLabel.text = text;
    
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [self.messageLabel setAlpha:1];
                     }
                     completion:^(BOOL finished) {
                         if (finished)
                         {
                             [UIView animateWithDuration:0.4
                                                   delay:0.9
                                                 options:UIViewAnimationOptionCurveEaseOut
                                              animations:^{
                                                  [self.messageLabel setAlpha:0];
                                              } completion:nil];
                         }
                     }];
}


-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (textField == self.nameServerTextField) {
        NSCharacterSet* set = [NSCharacterSet characterSetWithCharactersInString:validatorNameConstant1];
        if ([string rangeOfCharacterFromSet:set].location != NSNotFound || !string.length) {
            return YES;
        }
        else{
            [self showAndHideMessageWithText:@"Incorrectly symbol" withColor:[UIColor redColor]];
            return NO;
        }
    }
    
    if (textField == self.addressServerTextField) {
        NSCharacterSet* set = [NSCharacterSet characterSetWithCharactersInString:validatorAddressConstant1];
        if ([string rangeOfCharacterFromSet:set].location != NSNotFound || !string.length) {
            return YES;
        }
        else{
            [self showAndHideMessageWithText:@"Incorrectly symbol" withColor:[UIColor redColor]];
            return NO;
        }
    }
    
    return NO;
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
