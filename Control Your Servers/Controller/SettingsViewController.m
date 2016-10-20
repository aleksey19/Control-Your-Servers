//
//  SettingsViewController.m
//  Control Your Servers
//
//  Created by Bodya on 12.10.16.
//  Copyright © 2016 Aleksey. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *connectionPicker;
@property (weak, nonatomic) IBOutlet UILabel *currentInterval;
@property (weak, nonatomic) IBOutlet UIView *connectionPickerCurtain;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *connectionPickerCurtainConstraint;

@end

@implementation SettingsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
      self.currentInterval.text = [NSString stringWithFormat:@"Current interval: %@ min",[NSUserDefaults.standardUserDefaults objectForKey:@"interval"]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if ([pickerView isEqual:self.connectionPicker]){
            return 60;
    }
    return 0;
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    if ([pickerView isEqual:self.connectionPicker]){
        
        return 1;
    }
    return 0;
}


-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if ([pickerView isEqual:self.connectionPicker]){
        
        return [NSString stringWithFormat:@"%ld min",(row+1)];
    }
    
    return nil;

}


- (IBAction)saveIntervalConnection:(id)sender {
  
    if (self.connectionPickerCurtainConstraint.constant == 0) {
        self.connectionPickerCurtainConstraint.constant = 125;
    }
    else if (self.connectionPickerCurtainConstraint.constant == 125)
    {
        self.connectionPickerCurtainConstraint.constant = 0;
        [NSUserDefaults.standardUserDefaults setInteger:([self.connectionPicker selectedRowInComponent:0 ]+1) forKey:@"interval"];
        self.currentInterval.text = [NSString stringWithFormat:@"Current interval: %@ min",[NSUserDefaults.standardUserDefaults objectForKey:@"interval"]];
    }

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
