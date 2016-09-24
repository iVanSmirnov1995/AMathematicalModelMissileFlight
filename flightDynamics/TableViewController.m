//
//  TableViewController.m
//  flightDynamics
//
//  Created by Smirnov Ivan on 01.10.15.
//  Copyright © 2015 Ivan Smirnov. All rights reserved.
//

#import "TableViewController.h"
#import "func.h"
#import "ISViewPopController.h"

@interface TableViewController ()
@property(strong,nonatomic)NSMutableArray* ar;
@property(strong,nonatomic)NSString* point;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem* bat=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(batton:)];
    self.navigationItem.rightBarButtonItem=bat;
    
    NSMutableArray* ar=[NSMutableArray array];
    func* f=[[func alloc]init];
    f.mArry=ar;
    self.point=f.pointPad;
    
    [f sistem4X0:0 y0:0 V0:self.v TT0:self.tt*M_PI/180 to:0 tk:self.tk we:self.we m0:self.mo mt:self.mt wx:self.wx tolkoAut:self.tolkoAut tolkoPut:self.tolkoPut activ:0 aut:0];
    
    self.ar=f.mArry;
    self.point=f.pointPad;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.ar.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   static NSString* ident=@"";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
    }
    cell.textLabel.font=[UIFont systemFontOfSize:17];
    cell.textLabel.text=[self.ar objectAtIndex:indexPath.row];
    return cell;
}

-(void)batton:(UIBarButtonItem*)bat{
    ISViewPopController* vc=[self.storyboard instantiateViewControllerWithIdentifier:@"pp"];
    vc.view;
    NSLog(@"%@",self.point);
    vc.labelPoint.text=self.point;
    vc.modalPresentationStyle=UIModalPresentationPopover;
    vc.popoverPresentationController.barButtonItem=bat;
    [self presentViewController:vc animated:YES completion:^{
        
    }];

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
