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
        
        self.nameServerTextField.text = @"";
        self.addressServerTextField.text = @"";
    }
}

#pragma mark - TextField delegate

//-(BOOL)textFieldShouldReturn:(UITextField *)textField {
//    [textField resignFirstResponder];
//    
//    return YES;
//}

@end
