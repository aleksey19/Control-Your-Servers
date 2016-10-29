//
//  CustomTableViewCell.h
//  Control Your Servers
//
//  Created by Bodya on 28.10.16.
//  Copyright © 2016 Aleksey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameServerLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressServerLabel;

@end
