//
//  AnimalListRepository.m
//  UITableViewAnimations
//
//  Created by Maksim Ivanov on 26/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import "AnimalListRepository.h"

@implementation AnimalListRepository

+ (NSArray<id> *)getAnimalList
{
    return @[
             @{
                 @"title": @"Корова",
                 @"subtitle": @"Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. "
                 },
             @{
                 @"title": @"Собака",
                 @"subtitle": @"Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот"
                 },
             @{
                 @"title": @"Кошка",
                 @"subtitle": @"Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset"
                 }
             ];
}

@end
