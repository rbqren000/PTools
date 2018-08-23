//
//  YMShowImageView.h
//  WFCoretext
//
//  Created by 阿虎 on 14/11/3.
//  Copyright (c) 2014年 tigerwf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PooShowImageModel.h"
#import <SceneKit/SceneKit.h>

@class YMShowImageView;

#define YMShowImageViewClickTagAppend 9999
#define HZPhotoBrowserImageViewMargin 10

#define kMinZoomScale 0.6f
#define kMaxZoomScale 2.0f

typedef void(^didRemoveImage)(void);
typedef void(^YMShowImageViewDidDeleted) (YMShowImageView *siv,NSInteger index);

@interface YMShowImageView : UIView<UIScrollViewDelegate>{
    UIImageView *showImage;
    
    UIColor *currentPageIndicatorTintColor;
    UIColor *pageIndicatorTintColor;
}

@property (nonatomic,copy) didRemoveImage removeImg;
@property (nonatomic,copy) YMShowImageViewDidDeleted didDeleted;
@property (nonatomic,strong) NSMutableArray *saveImageArr;
@property (nonatomic, copy) void(^saveImageStatus)(BOOL saveStatus);


- (void)showWithFinish:(didRemoveImage)tempBlock;

- (void)show:(UIView *)bgView didFinish:(didRemoveImage)tempBlock;

- (id)initWithByClick:(NSInteger)clickTag appendArray:(NSArray <PooShowImageModel*>*)appendArray titleColor:(UIColor *)tC fontName:(NSString *)fName currentPageIndicatorTintColor:(UIColor *)cpic pageIndicatorTintColor:(UIColor *)pic showImageBackgroundColor:(UIColor *)sibc showWindow:(UIWindow *)w loadingImageName:(NSString *)li deleteAble:(BOOL)canDelete saveAble:(BOOL)canSave moreActionImageName:(NSString *)main;
@end

@interface PShowImageSingleView : UIView
@property (nonatomic,strong) UIScrollView *scrollview;
@property (nonatomic,strong) UIImageView *imageview;
@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, assign) BOOL beginLoadingImage;
@property (nonatomic,strong) SCNSphere *sphere;
/**判断图片是否加载成功*/
@property (nonatomic, assign) BOOL hasLoadedImage;
@property (nonatomic,assign) CGSize zoomImageSize;
@property (nonatomic,assign) CGPoint scrollOffset;
@property (nonatomic, strong) void(^scrollViewDidScroll)(CGPoint offset);
@property (nonatomic,copy) void(^scrollViewWillEndDragging)(CGPoint velocity,CGPoint offset);//返回scrollView滚动速度
@property (nonatomic,copy) void(^scrollViewDidEndDecelerating)(void);
@property (nonatomic, assign) BOOL isFullWidthForLandScape;
- (void)setImageWithModel:(PooShowImageModel *)model placeholderImage:(UIImage *)placeholder;

@end
