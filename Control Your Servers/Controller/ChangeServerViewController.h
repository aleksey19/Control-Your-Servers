//
//  ChangeServerViewController.h
//  Control Your Servers
//
//  Created by Bodya on 29.10.16.
//  Copyright © 2016 Aleksey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangeServerViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameServerTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressServerTextField;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;                  //default hide
@property (nonatomic, strong) NSMutableArray *servers;


@end
