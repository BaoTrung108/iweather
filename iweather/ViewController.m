//
//  ViewController.m
//  iweather
//
//  Created by trung bao on 12/09/2015.
//  Copyright (c) Năm 2015 baotrung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UIButton *nhietDo;
@property (weak, nonatomic) IBOutlet UILabel *donviNhietDo;
@property (weak, nonatomic) IBOutlet UIImageView *thoiTiet;
@property (weak, nonatomic) IBOutlet UILabel *danhNgon;

@end

@implementation ViewController
{
    NSArray* locations;
    NSArray* thoiTiets;
    NSArray* danhNgons;
    float nhietdoHienTai;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    locations=@[@"Ha Noi, Viet Nam",@"Hai Phong, Viet Nam",@"Vinh, Viet Nam",@"Da Nang, Viet Nam",@"Nha Trang, Viet Nam",@"TP Ho Chi Minh, Viet Nam"];
    thoiTiets=@[@"sun",@"rain",@"cloudy",@"storm"];
    danhNgons=@[@"Một con ngựa đau cả tàu bỏ cỏ",@"Có công mài sắt có ngày nên kim",@"Không ai có thể cho bạn sự bình yên bằng chính bạn",@"Nghị lực bền bỉ có thể chinh phục mọi thứ",@"Không thể nào thay đổi ngày hôm qua nhưng ngày hôm nay vẫn còn cơ hội"];
    self.donviNhietDo.text=@"C";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)update:(id)sender {
    self.donviNhietDo.text=@"C";
    int locationIndex = arc4random_uniform(locations.count);
    self.location.text=locations[locationIndex];
    
    int thoiTietIndex= arc4random_uniform(thoiTiets.count);
    self.thoiTiet.image=[UIImage imageNamed:thoiTiets[thoiTietIndex]];
    int danhNgonIndex= arc4random_uniform(danhNgons.count);
    self.danhNgon.text=danhNgons[danhNgonIndex];
    NSString* string=[NSString stringWithFormat:@"%2.1f",[self getNhietDo]];
    [self.nhietDo setTitle:string forState:UIControlStateNormal];
    nhietdoHienTai=[string floatValue];
}
- (IBAction)doiNhietDo:(id)sender {
    if ([self.donviNhietDo.text isEqual:@"C"]) {
        self.donviNhietDo.text=@"F";
        float nhietDo=nhietdoHienTai*1.8+32;
        NSString *string=[NSString stringWithFormat:@"%2.1f",nhietDo];
        [self.nhietDo setTitle:string forState:UIControlStateNormal];
    } else {
        self.donviNhietDo.text=@"C";
        NSString *string=[NSString stringWithFormat:@"%2.1f",nhietdoHienTai];
        [self.nhietDo setTitle:string forState:UIControlStateNormal];
    }
    
}
-(float) getNhietDo {
    return 14.0 + arc4random_uniform(18) + (float)arc4random()/INT32_MAX;
}
@end
