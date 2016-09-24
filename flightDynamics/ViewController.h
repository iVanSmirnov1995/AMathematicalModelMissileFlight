//
//  ViewController.h
//  flightDynamics
//
//  Created by Smirnov Ivan on 01.10.15.
//  Copyright © 2015 Ivan Smirnov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)goDenamic:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *goGame;
@property (weak, nonatomic) IBOutlet UITextField *vText;
@property (weak, nonatomic) IBOutlet UITextField *ttText;
@property (weak, nonatomic) IBOutlet UITextField *moText;
@property (weak, nonatomic) IBOutlet UITextField *mtText;
@property (weak, nonatomic) IBOutlet UITextField *weText;
@property (weak, nonatomic) IBOutlet UITextField *tkText;
@property (weak, nonatomic) IBOutlet UISwitch *autSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *putSwitch;
@property (weak, nonatomic) IBOutlet UITextField *wxText;

- (IBAction)goGame:(UIButton *)sender;

@end

