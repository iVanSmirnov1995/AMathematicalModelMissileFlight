//
//  ViewController.m
//  flightDynamics
//
//  Created by Smirnov Ivan on 01.10.15.
//  Copyright © 2015 Ivan Smirnov. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
#import "ISAnimationClass.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  //  NSMutableArray* ar=[NSMutableArray array];
    self.vText.text=@"53";
    self.ttText.text=@"48";
    self.moText.text=@"175";
    self.mtText.text=@"141";
    self.weText.text=@"2430";
    self.tkText.text=@"4.4";
    self.wxText.text=@"0";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goDenamic:(UIButton *)sender {
    
    TableViewController* vc=[self.storyboard instantiateViewControllerWithIdentifier:@"aa"];
    vc.v=[self.vText.text floatValue];
    vc.tt=[self.ttText.text floatValue];
    vc.mo=[self.moText.text floatValue];
    vc.mt=[self.mtText.text floatValue];
    vc.we=[self.weText.text floatValue];
    vc.tk=[self.tkText.text floatValue];
    vc.wx=[self.wxText.text floatValue];
    vc.tolkoAut=self.autSwitch.on;
    vc.tolkoPut=self.putSwitch.on;
    
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)goGame:(UIButton *)sender {
     
    ISAnimationClass* vc=[self.storyboard instantiateViewControllerWithIdentifier:@"animation"];
    vc.v=[self.vText.text floatValue];
    vc.tt=[self.ttText.text floatValue];
    vc.mo=[self.moText.text floatValue];
    vc.mt=[self.mtText.text floatValue];
    vc.we=[self.weText.text floatValue];
    vc.tk=[self.tkText.text floatValue];
    vc.wx=[self.wxText.text floatValue];
    vc.tolkoAut=self.autSwitch.on;
    vc.tolkoPut=self.putSwitch.on;
    [self.navigationController pushViewController:vc animated:YES];
}
@end
