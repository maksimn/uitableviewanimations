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
        UITapGestureRecognizer *tapOnCoverImage = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapCoverImage)] ;
        
        _coverImageView = [UIImageView new];
        _coverImageView.backgroundColor = [UIColor yellowColor];
        _coverImageView.translatesAutoresizingMaskIntoConstraints = NO;
        _coverImageView.userInteractionEnabled = YES;
        [_coverImageView addGestureRecognizer:tapOnCoverImage];
        [self.contentView addSubview:_coverImageView];
        
        _titleLabel = [UILabel new];
        _titleLabel.backgroundColor = [UIColor greenColor];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_titleLabel];
        
        _subtitleLable = [UILabel new];
        _subtitleLable.backgroundColor = [UIColor blueColor];
        _subtitleLable.numberOfLines = 0;
        _subtitleLable.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_subtitleLable];
        
        [self makeConstraints];
    }
    
    return self;
}

- (void)prepareForReuse
{
    self.subtitleLable.text = nil;
    self.titleLabel.text = nil;
    [super prepareForReuse];
}

- (void) makeConstraints
{
    NSLayoutConstraint *bottomConstraint = [_subtitleLable.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-16.f];
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
                                              [_subtitleLable.leftAnchor constraintEqualToAnchor:_coverImageView.rightAnchor constant:16.f],
                                              [_subtitleLable.topAnchor constraintEqualToAnchor:_titleLabel.bottomAnchor constant:16.f],
                                              [_subtitleLable.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:-16.f],
                                              bottomConstraint
                                              ]];
}

- (void)didTapCoverImage
{
    [self.coverImageView removeConstraint:self.topCoverImageConstraint];
    NSLayoutConstraint *alignCenterYConstraint = [self.coverImageView.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor];
    [self.contentView addConstraint:alignCenterYConstraint];
    [UIView animateWithDuration:0.5 animations:^{
        [self layoutIfNeeded];
    }];
}

@end
