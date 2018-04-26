//
//  LeftViewController.m
//  PictureBanner
//
//  Created by super on 2018/4/25.
//  Copyright © 2018年 super. All rights reserved.
//

#import "LeftViewController.h"
#import "SWRevealViewController.h"
#import "HomeViewController.h"

@interface LeftViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , strong) NSArray *menuArray;

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
}

- (NSArray *)menuArray {
    if (!_menuArray) {
        _menuArray = [NSArray arrayWithObjects:@"基础动画",@"关键帧动画",@"组动画",@"过渡动画",@"仿射变换",@"综合案例", nil];
    }
    return _menuArray;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT-20) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView {
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menuArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *TABLE_VIEW_ID = @"table_view_id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TABLE_VIEW_ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TABLE_VIEW_ID];
    }
    cell.textLabel.text = [self.menuArray objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SWRevealViewController *revealViewController = self.revealViewController;
    UIViewController *viewController;
    
    switch (indexPath.row) {
        case 0:
            viewController = [[HomeViewController alloc] init];
            break;
        case 1:
            viewController = [[HomeViewController alloc] init];
            break;
        case 2:
            viewController = [[HomeViewController alloc] init];
            break;
        case 3:
            viewController = [[HomeViewController alloc] init];
            break;
        case 4:
            viewController = [[HomeViewController alloc] init];
            break;
        case 5:
            viewController = [[HomeViewController alloc] init];
            break;
        default:
            break;
    }
    [revealViewController pushFrontViewController:viewController animated:YES];
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
