//
//  RootViewController.m
//  EDWBaseViewControllerDemo
//
//  Created by mac on 2018/9/6.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)createUI{
    [super createUI];
    [self createTableViewWithStyle:UITableViewStyleGrouped];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}


- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        
    }
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:{
            [self showCancelMessage:@"完成"];
        }
            break;
            
            
        case 1:{
            [self sendSMSMessageWithMessage:@"你好" andTels:@[@"13602177158"]];
            
        }
            break;
            
        case 2:{
            
        }
            break;
            
        case 3:{
            
        }
            break;
            
            
        case 4:{
            
        }
            break;
            
            
            
        case 5:{
            
        }
            break;
            
            
        case 6:{
            
        }
            break;
            
            
            
        case 7:{
            
        }
            break;
            
        default:
            break;
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
