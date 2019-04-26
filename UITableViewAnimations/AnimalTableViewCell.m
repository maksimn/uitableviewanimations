//
//  AnimalTableViewCell.m
//  UITableViewAnimations
//
//  Created by Maksim Ivanov on 26/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import "AnimalTableViewCell.h"

@interface AnimalTableViewCell ()

@property (nonatomic, strong) NSLayoutConstraint *topCoverImageConstraint;

@end

@implementation AnimalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        CAGradientLayer *gradientLayer = [CAGradientLayer new];
        gradientLayer.frame = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 72.f);
        gradientLayer.colors = [NSArray arrayWithObjects:(id)UIColor.orangeColor.CGColor, UIColor.yellowColor.CGColor,
                                UIColor.whiteColor.CGColor, nil];
        
        [self.contentView.layer addSublayer:gradientLayer];
        _coverImageView = [UIImageView new];
        _coverImageView.backgroundColor = UIColor.blueColor;
        _coverImageView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_coverImageView];
        
        _titleLabel = [UILabel new];
        _titleLabel.backgroundColor = [UIColor greenColor];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_titleLabel];
        
        _subtitleLabel = [UILabel new];
        _subtitleLabel.backgroundColor = [UIColor cyanColor];
        _subtitleLabel.numberOfLines = 0;
        _subtitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_subtitleLabel];
        
        [self makeConstraints];
    }
    
    return self;
}

- (void)prepareForReuse
{
    self.subtitleLabel.text = nil;
    self.titleLabel.text = nil;
    [super prepareForReuse];
}

- (void)makeConstraints
{
    NSLayoutConstraint *bottomConstraint = [_subtitleLabel.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-16.f];
    bottomConstraint.priority = UILayoutPriorityDefaultHigh;
    
    self.topCoverImageConstraint =[_coverImageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:16.f];
    [NSLayoutConstraint activateConstraints:@[
                                              [_coverImageView.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:16.f],
                                              self.topCoverImageConstraint,
                                              [_coverImageView.widthAnchor constraintEqualToConstant:40.f],
                                              [_coverImageView.heightAnchor constraintEqualToConstant:40.f],
                                              [_titleLabel.leftAnchor constraintEqualToAnchor:_coverImageView.rightAnchor constant:16.f],
                                              [_titleLabel.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:16.f],
                                              [_titleLabel.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:-16.f],
                                              [_titleLabel.heightAnchor constraintEqualToConstant:16.f],
                                              [_subtitleLabel.leftAnchor constraintEqualToAnchor:_coverImageView.rightAnchor constant:16.f],
                                              [_subtitleLabel.topAnchor constraintEqualToAnchor:_titleLabel.bottomAnchor constant:16.f],
                                              [_subtitleLabel.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:-16.f],
                                              bottomConstraint
                                              ]];
}

@end
