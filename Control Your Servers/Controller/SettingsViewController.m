//
//  SettingsViewController.m
//  Control Your Servers
//
//  Created by Bodya on 12.10.16.
//  Copyright © 2016 Aleksey. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *connectionPicker;
@property (weak, nonatomic) IBOutlet UILabel *currentIntervalLabel;
@property (weak, nonatomic) IBOutlet UIView *connectionPickerCurtain;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *connectionPickerCurtainConstraint;

@end

@implementation SettingsViewController

#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)setupView {
    self.title = @"Settings";
    
    NSString *interval = [NSUserDefaults.standardUserDefaults objectForKey:@"interval"];
    interval ? (self.currentIntervalLabel.text = [NSString stringWithFormat:@"Current interval: %@ min", interval]) : (self.currentIntervalLabel.text = @"Set refresh interval");
    
}

#pragma mark - Picker view datasource

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if ([pickerView isEqual:self.connectionPicker]){
            return 60;
    }
    return 0;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    if ([pickerView isEqual:self.connectionPicker]) {
        
        return 1;
    }
    return 0;
}

#pragma mark - Picker view delegate

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if ([pickerView isEqual:self.connectionPicker]){
        
        return [NSString stringWithFormat:@"%ld min",(row+1)];
    }
    
    return nil;
}

#pragma mark - Actions 

- (IBAction)saveIntervalConnection:(id)sender {
  
    if (self.connectionPickerCurtainConstraint.constant == 0) {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        
        self.connectionPickerCurtainConstraint.constant = 125;
    }
    else if (self.connectionPickerCurtainConstraint.constant == 125)
    {
        [NSUserDefaults.standardUserDefaults setInteger:([self.connectionPicker selectedRowInComponent:0 ]+1) forKey:@"interval"];
        self.currentIntervalLabel.text = [NSString stringWithFormat:@"Current interval: %@ min",[NSUserDefaults.standardUserDefaults objectForKey:@"interval"]];
        
        [sender setTitle:@"Change" forState:UIControlStateNormal];
        self.connectionPickerCurtainConstraint.constant = 0;
    }
}

@end
