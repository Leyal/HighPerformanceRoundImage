<h1>iOS高性能圆角图片</h1>

>在tableView和collectionView的cell中使用了大量的view.layer.cornerRadius + ClipToBounds之后导致页面卡顿的情况。

具体实现方法：
<h3>给UIImage写一个分类:</h3>
UIImage+addRadius
```
 -(UIImage*)imageAddCornerRadius:(CGFloat)radius andSize:(CGSize)size;
```

```
-(UIImage *)imageAddCornerRadius:(CGFloat)radius andSize:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
    CGContextAddPath(ctx,path.CGPath);
    CGContextClip(ctx);
    [self drawInRect:rect];
    CGContextDrawPath(ctx, kCGPathFillStroke);
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
```
<h3>自定义一个UIImageView类继承自UIImageView</h3>
添加一个自定义方法：
```
-(void)addCorners:(CGFloat)radius;
```

实现
```
-(void)addCorners:(CGFloat)radius
{
    if(self.image)
    {
        self.image = [self.image imageAddCornerRadius:radius andSize:self.bounds.size];
    }
    return;
}
```
