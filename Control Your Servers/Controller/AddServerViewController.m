//
//  AddServerViewController.m
//  Control Your Servers
//
//  Created by Bodya on 24.10.16.
//  Copyright © 2016 Aleksey. All rights reserved.
//

#import "AddServerViewController.h"
#import "ServerModel.h"
@interface AddServerViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameServerTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressServerTextField;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;                  //default hide
@property (nonatomic, strong) NSMutableArray *servers;
@end

@implementation AddServerViewController

#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupModel];
}

- (void)setupModel {
    self.servers =  [[[NSUserDefaults standardUserDefaults] arrayForKey:@"servers"] mutableCopy];
    
    if(!self.servers){
        self.servers = [NSMutableArray new];
    }
    self.title = @"Add server";
}

#pragma mark - Actions

- (IBAction)addServerAction:(id)sender {
    
    NSString* name = self.nameServerTextField.text;
    NSString* address = self.addressServerTextField.text;
    if (name.length && address.length) {
        NSDictionary *server = @{
                                 @"name" : name,
                                 @"address" : address
                                 };
        [self.servers addObject:server];
        [[NSUserDefaults standardUserDefaults] setObject:[self.servers copy] forKey:@"servers"];
        [self showAndHideMessageWithText:@"Server was added" withColor:[UIColor greenColor]];
        self.nameServerTextField.text = @"";
        self.addressServerTextField.text = @"";
    }
    [self showAndHideMessageWithText:@"Server was not added" withColor:[UIColor redColor]];
}

#pragma mark - TextField delegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.nameServerTextField endEditing:YES];
    [self.addressServerTextField endEditing:YES];
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
    NSLog(@"%@",string);
    if (textField == self.nameServerTextField) {
            NSCharacterSet* set = [NSCharacterSet characterSetWithCharactersInString:@"1234567890zaqwsxcderfvbgtyhnmjuikolp QAZWSXEDCRFVTGBYHNUJMIKOLP."];
            if ([string rangeOfCharacterFromSet:set].location != NSNotFound || !string.length) {
                return YES;
            }
            else{
                [self showAndHideMessageWithText:@"Incorrectly symbol" withColor:[UIColor redColor]];
                return NO;
            }
    }
    
    if (textField == self.addressServerTextField) {
        NSCharacterSet* set = [NSCharacterSet characterSetWithCharactersInString:@"1234567890zaqwsxcderfvbgtyhnmjuikolp QAZWSXEDCRFVTGBYHNUJMIKOLP./:"];
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


@end
