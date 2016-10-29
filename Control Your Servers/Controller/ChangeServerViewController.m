//
//  ChangeServerViewController.m
//  Control Your Servers
//
//  Created by Bodya on 29.10.16.
//  Copyright © 2016 Aleksey. All rights reserved.
//

#import "ChangeServerViewController.h"

@interface ChangeServerViewController ()

@end

@implementation ChangeServerViewController

#define VALIDATOR_NAME_CONSTANT @"1234567890zaqwsxcderfvbgtyhnmjuikolp QAZWSXEDCRFVTGBYHNUJMIKOLP."
#define VALIDATOP_ADDRESS_CONSTANT @"1234567890zaqwsxcderfvbgtyhnmjuikolp QAZWSXEDCRFVTGBYHNUJMIKOLP./:"

#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupModel];
    // Do any additional setup after loading the view.
}

- (void)setupModel {
    self.servers =  [[[NSUserDefaults standardUserDefaults] arrayForKey:@"servers"] mutableCopy];
    
    if(!self.servers){
        self.servers = [NSMutableArray new];
    }
}

-(void)setupView {
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.nameServerTextField endEditing:YES];
    [self.addressServerTextField endEditing:YES];
}

-(void)saveServerWithName:(NSString *)name withAddress:(NSString *)address {
    
    NSDictionary *server = @{
                             @"name" : name,
                             @"address" : address
                             };
    [self.servers addObject:server];
    [[NSUserDefaults standardUserDefaults] setObject:[self.servers copy] forKey:@"servers"];
    
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
        NSCharacterSet* set = [NSCharacterSet characterSetWithCharactersInString:VALIDATOR_NAME_CONSTANT];
        if ([string rangeOfCharacterFromSet:set].location != NSNotFound || !string.length) {
            return YES;
        }
        else{
            [self showAndHideMessageWithText:@"Incorrectly symbol" withColor:[UIColor redColor]];
            return NO;
        }
    }
    
    if (textField == self.addressServerTextField) {
        NSCharacterSet* set = [NSCharacterSet characterSetWithCharactersInString:VALIDATOP_ADDRESS_CONSTANT];
        if ([string rangeOfCharacterFromSet:set].location !=NSNotFound || !string.length) {
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
