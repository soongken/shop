//
//  DetailViewController.m
//  shop
//
//  Created by lanou on 16/1/23.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "DetailViewController.h"
#import "List.h"
@interface DetailViewController ()<UITableViewDelegate,UITableViewDataSource,NSXMLParserDelegate>

@property (nonatomic,strong) NSString *selected;
@property (nonatomic,strong) List *list;

@property (nonatomic,strong) NSMutableArray *listArr;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    //处理数据
    
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"Categories" ofType:@"xml"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    
    parser.delegate = self;
    [parser parse];
    
    
    
    
    
}

//点击方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    List *list = self.listArr[indexPath.section];
    
    
    if (self.block) {
        self.block(list.subcategories[indexPath.row]);
    };
    [self.navigationController popViewControllerAnimated:YES];
    
}




//XML 解析 通过协议方法是完成 解析

-(void)parserDidStartDocument:(NSXMLParser *)parser
{
    NSLog(@"开始解析某个节点");
    
    
    
}
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict
{
    NSLog(@"开始解析标签为:%@",elementName);
    if ([elementName isEqualToString:@"categories"]) {
       self.list = [List new];
        self.list.subcategories = [NSMutableArray new];
    }
    self.selected = elementName;
    
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    NSLog(@"取值");
    
    if ([self.selected isEqualToString:@"category_name"] && self.list.category_name == nil  ) {
        self.list.category_name = string;
    }else if ([self.selected isEqualToString:@"subcategories"] && ![string isEqualToString:@"\n\t\t"])
    {
        [self.list.subcategories addObject:string];
//
    }
    
    

    
    
    
}

//分区头标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.listArr[section] category_name];
}

//懒加载
-(NSMutableArray *)listArr
{
    
    if (!_listArr) {
        _listArr = [NSMutableArray new];
    }
    return  _listArr;
}


-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    NSLog(@"结束解析");
    
    if ([elementName isEqualToString:@"categories"]) {
        [self.listArr addObject:self.list];
        self.list = nil;
    }
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

//分区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return self.listArr.count;
}

//row
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    List *list = self.listArr[section];
    return list.subcategories.count;
}
//cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse1"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"reuse1"];
    }
    
    
//    赋值
    List *list = self.listArr[indexPath.section];
    cell.textLabel.text  = list.subcategories[indexPath.row];

    
    
    return cell;
    
    
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
