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
    [self setupView];
    // Do any additional setup after loading the view.
}

- (void)setupView {
    self.servers =  [[[NSUserDefaults standardUserDefaults] arrayForKey:@"servers"]mutableCopy];
    
    if(!self.servers){
        self.servers = [NSMutableArray new];
    }
    
}

#pragma mark - Actions

- (IBAction)addServerAction:(id)sender {
    
    NSString* name = self.nameServerTextField.text;
    NSString* address = self.addressServerTextField.text;
    
    if ((![name isEqual:@""])&&(![address isEqual:@""])) {

        NSDictionary* server = [NSDictionary dictionaryWithObjectsAndKeys:name,@"name",address,@"address",nil];
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
