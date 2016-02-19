//
//  ViewController.m
//  TouchDemo
//
//  Created by chenbin on 2/18/16.
//  Copyright © 2016 TouchDemo. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, UIViewControllerPreviewingDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *cellTitles;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.cellTitles = @[@"Red", @"Yellow", @"Blue"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(shortcutItemDidTouch:) name:@"shortcutItemTouched" object:nil];
    
    [self registerForPreviewingWithDelegate:self sourceView:self.tableView];
}

#pragma mark - Notification
- (void)shortcutItemDidTouch:(NSNotification *)notification
{
    NSString *controllerTitle = (NSString *)notification.object;
    [self.navigationController popToRootViewControllerAnimated:NO];
    DetailViewController *detailController = [[DetailViewController alloc] initWithIdentifier:controllerTitle];
    [self.navigationController pushViewController:detailController animated:YES];
}

#pragma mark - UITableViewDelegate & DataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellTitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = self.cellTitles[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *identifier = self.cellTitles[indexPath.row];
    DetailViewController *detailController = [[DetailViewController alloc] initWithIdentifier:identifier];
    
    [self.navigationController pushViewController:detailController animated:YES];
}

#pragma mark - UIViewControllerPreviewingDelegate
- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:location];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    NSString *controllerTitle = self.cellTitles[indexPath.row];
    DetailViewController *detailController = [[DetailViewController alloc] initWithIdentifier:controllerTitle];
    previewingContext.sourceRect = cell.frame;
    
    
    
    return detailController;
}

- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    [self.navigationController pushViewController:viewControllerToCommit animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"shortcutItemTouched" object:nil];
}

@end
