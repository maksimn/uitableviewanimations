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
    cell.subtitleLabel.text = animalData[@"subtitle"];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    AnimalTableViewCell *animalTableViewCell = (AnimalTableViewCell *)cell;
    
    CGFloat animationDuration = 0.75;
    
    CGFloat coverImageViewPositionX = animalTableViewCell.coverImageView.layer.position.x;
    
    if (coverImageViewPositionX > 0)
    {
        CABasicAnimation *coverImageViewAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
        coverImageViewAnimation.duration = animationDuration;
        coverImageViewAnimation.fromValue = @(-40.0);
        coverImageViewAnimation.toValue = @(coverImageViewPositionX);
        
        [animalTableViewCell.coverImageView.layer addAnimation:coverImageViewAnimation forKey:@"coverImageViewAnimation"];
    }
    
    CGFloat cellWidth = cell.bounds.size.width;
    CGFloat titleLabelPositionX = animalTableViewCell.titleLabel.layer.position.x;
    
    if (titleLabelPositionX > 0)
    {
        CABasicAnimation *titleLabelAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
        titleLabelAnimation.duration = animationDuration;
        titleLabelAnimation.fromValue = @(cellWidth);
        titleLabelAnimation.toValue = @(titleLabelPositionX);
        titleLabelAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        
        [animalTableViewCell.titleLabel.layer addAnimation:titleLabelAnimation forKey:@"titleLabelAnimation"];
    }
    
    CGFloat subtitleLabelPositionX = animalTableViewCell.subtitleLabel.layer.position.x;
    
    if (subtitleLabelPositionX > 0)
    {
        CABasicAnimation *subtitleLabelAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
        subtitleLabelAnimation.duration = animationDuration;
        subtitleLabelAnimation.fromValue = @(cellWidth);
        subtitleLabelAnimation.toValue = @(subtitleLabelPositionX);
        
        [animalTableViewCell.subtitleLabel.layer addAnimation:subtitleLabelAnimation forKey:@"subtitleLabelAnimation"];
    }
}

@end
