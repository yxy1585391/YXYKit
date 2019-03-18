//
//  UIView+NoData.h
//  Angelet
//
//  Created by 燕晓玉 on 2019/1/10.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (NoData)


- (void)addNoDataStatusImageName:(NSString *)imgName textDescribe:(NSString *)text finishBlock:(void(^_Nullable)(void))block;

- (void)removeNoDataView;

@end

NS_ASSUME_NONNULL_END
