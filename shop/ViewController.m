//
//  ViewController.m
//  shop
//
//  Created by lanou on 16/1/23.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"
#import "DetailViewController.h"
#import "SignatrueEncryption.h"
#import "CommonDefine.h"
@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  //sssskkk
    //ssss
    ///dfasdfsdafsdafas
    
    
    
//    NSDictionary *dic = @{,nil};

    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"city",@"上海",@"category",@"美食",@"limit",@"30",@"page",@"1", nil];
      
         NSDictionary * dictionary = [SignatrueEncryption encryptedParamsWithBaseParams:dic];
    
     NSString *str = [NSString stringWithFormat:@"%@/v1/deal/find_deals?appkey=%@&sign=%@&city=%@&category=%@&limit=&@&page=%@",kBASE_SERVER_URL,kAPP_KEY,dictionary[@"sign"],dictionary[@"city"],dictionary[@"category"],dictionary[@"limit"],dictionary[@"page"]];
    NSLog(@"%@",str);
    
    

    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    //怎么使用segue
    DetailViewController *detailVC = [segue destinationViewController];
    
    detailVC.block = ^(NSString *str){
        self.navigationItem.title = str;
    };
    
    
}
//row
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 10;
}
//cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse" forIndexPath:indexPath];
    
    
    return cell;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
