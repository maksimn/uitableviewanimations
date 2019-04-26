//
//  ViewController.m
//  UITableViewAnimations
//
//  Created by Maksim Ivanov on 26/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import "ViewController.h"
#import "AnimalTableViewCell.h"
#import "AnimalListRepository.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *animals;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerClass:[AnimalTableViewCell class] forCellReuseIdentifier:NSStringFromClass([AnimalTableViewCell class])];
    
    [self.view addSubview:self.tableView];
    
    NSArray *data = [AnimalListRepository getAnimalList];
    
    self.animals = data;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.animals.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AnimalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AnimalTableViewCell class]) forIndexPath:indexPath];
    
    id animalData = self.animals[indexPath.row];
    
    cell.titleLabel.text = animalData[@"title"];
    cell.subtitleLable.text = animalData[@"subtitle"];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    AnimalTableViewCell *animalTableViewCell = (AnimalTableViewCell *)cell;
    ///NSLog(@"x = %f", animalTableViewCell.coverImageView.layer.position.x);
    CGFloat x = animalTableViewCell.coverImageView.layer.position.x;
    
    if (x > 0)
    {
        CABasicAnimation *coverImageViewAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
        coverImageViewAnimation.duration = 0.75;
        coverImageViewAnimation.fromValue = @(-40.0);
        coverImageViewAnimation.toValue = @(x);
        
        [animalTableViewCell.coverImageView.layer addAnimation:coverImageViewAnimation forKey:@"coverImageViewAnimation"];
    }
}

@end
