import 'package:flutter/material.dart';

class FeatureProduct {
  final String image;
  final String name;
  final int price;
  final String detail;


  FeatureProduct(this.image, this.name, this.price, this.detail);
  static List feature = [
    FeatureProduct(
        'https://www.skechers.com/dw/image/v2/BDCN_PRD/on/demandware.static/-/Sites-skechers-master/default/dw5985fad7/images/large/136486_NVRD.jpg?sw=400',
        'On-the-GO Flex - Luminara',
        70,
        "Set sail in pure comfort wearing Skechers On-the-GO® Flex - Luminara. This vegan 'Americana' themed boat shoe features a sparkle mesh upper with subtle trim, a Skechers Air-Cooled Goga Mat™ insole, and lightweight ULTRA GO® cushioning."),
    FeatureProduct(
        'https://www.skechers.com/dw/image/v2/BDCN_PRD/on/demandware.static/-/Sites-skechers-master/default/dw07213802/images/large/129455_WNVR.jpg?sw=400',
        'Skechers Slip-ins: GO RUN Lite - Anthem',
        90,
    "Give cheers to the red, white, and blue in Skechers Hands Free Slip-ins®: GO RUN® Lite™ - Anthem. Designed with our exclusive Heel Pillow™ and recycled materials, this American themed performance lace-up features a mesh and synthetic upper with responsive ULTRA GO® cushioning and Skechers Air-Cooled Memory Foam® insole. Our Planet Matters®: Good for your feet. Good for the world.®"),
    FeatureProduct(
        'https://www.skechers.com/dw/image/v2/BDCN_PRD/on/demandware.static/-/Sites-skechers-master/default/dw72536cba/images/large/220773_NVY.jpg?sw=400',
        "GO RUN Consistent 2.0 - Americana",
        85,
    "Run with the stars and stripes in comfort wearing Skechers GO RUN Consistent 2.0™ - Americana. Crafted for both style and performance, this American themed running design features a lace-up breathable mesh and leather overlay upper with responsive ULTRA LIGHT midsole cushioning and a high-rebound Skechers Air-Cooled Goga Mat™ insole."),
    FeatureProduct(
        'https://www.skechers.com/dw/image/v2/BDCN_PRD/on/demandware.static/-/Sites-skechers-master/default/dwd1f55146/images/large/216773_WNV.jpg?sw=578',
        "Skechers Slip-ins: GO WALK 7",
        100,"Give cheers to the red, white and blue in Skechers Hands Free Slip-ins®: GO WALK 7™. Crafted for both style and comfort, this American themed walking design features our exclusive Heel Pillow™, an engineered mesh upper with stretch laces, Skechers Air-Cooled Memory Foam® insole, lightweight ULTRA GO® cushioning, and high-rebound Hyper Pillars™ for added support."),
    FeatureProduct(
        'https://www.skechers.com/dw/image/v2/BDCN_PRD/on/demandware.static/-/Sites-skechers-master/default/dw5985fad7/images/large/136486_NVRD.jpg?sw=400',
        'On-the-GO Flex - Luminara',
        70,
        "Set sail in pure comfort wearing Skechers On-the-GO® Flex - Luminara. This vegan 'Americana' themed boat shoe features a sparkle mesh upper with subtle trim, a Skechers Air-Cooled Goga Mat™ insole, and lightweight ULTRA GO® cushioning."),
    FeatureProduct(
        'https://www.skechers.com/dw/image/v2/BDCN_PRD/on/demandware.static/-/Sites-skechers-master/default/dw07213802/images/large/129455_WNVR.jpg?sw=400',
        'Skechers Slip-ins: GO RUN Lite - Anthem',
        90,
        "Give cheers to the red, white, and blue in Skechers Hands Free Slip-ins®: GO RUN® Lite™ - Anthem. Designed with our exclusive Heel Pillow™ and recycled materials, this American themed performance lace-up features a mesh and synthetic upper with responsive ULTRA GO® cushioning and Skechers Air-Cooled Memory Foam® insole. Our Planet Matters®: Good for your feet. Good for the world.®"),
    FeatureProduct(
        'https://www.skechers.com/dw/image/v2/BDCN_PRD/on/demandware.static/-/Sites-skechers-master/default/dw72536cba/images/large/220773_NVY.jpg?sw=400',
        "GO RUN Consistent 2.0 - Americana",
        85,
        "Run with the stars and stripes in comfort wearing Skechers GO RUN Consistent 2.0™ - Americana. Crafted for both style and performance, this American themed running design features a lace-up breathable mesh and leather overlay upper with responsive ULTRA LIGHT midsole cushioning and a high-rebound Skechers Air-Cooled Goga Mat™ insole."),
    FeatureProduct(
        'https://www.skechers.com/dw/image/v2/BDCN_PRD/on/demandware.static/-/Sites-skechers-master/default/dwd1f55146/images/large/216773_WNV.jpg?sw=578',
        "Skechers Slip-ins: GO WALK 7",
        100,"Give cheers to the red, white and blue in Skechers Hands Free Slip-ins®: GO WALK 7™. Crafted for both style and comfort, this American themed walking design features our exclusive Heel Pillow™, an engineered mesh upper with stretch laces, Skechers Air-Cooled Memory Foam® insole, lightweight ULTRA GO® cushioning, and high-rebound Hyper Pillars™ for added support."),
    FeatureProduct(
        'https://www.skechers.com/dw/image/v2/BDCN_PRD/on/demandware.static/-/Sites-skechers-master/default/dw5985fad7/images/large/136486_NVRD.jpg?sw=400',
        'On-the-GO Flex - Luminara',
        70,
        "Set sail in pure comfort wearing Skechers On-the-GO® Flex - Luminara. This vegan 'Americana' themed boat shoe features a sparkle mesh upper with subtle trim, a Skechers Air-Cooled Goga Mat™ insole, and lightweight ULTRA GO® cushioning."),
    FeatureProduct(
        'https://www.skechers.com/dw/image/v2/BDCN_PRD/on/demandware.static/-/Sites-skechers-master/default/dw07213802/images/large/129455_WNVR.jpg?sw=400',
        'Skechers Slip-ins: GO RUN Lite - Anthem',
        90,
        "Give cheers to the red, white, and blue in Skechers Hands Free Slip-ins®: GO RUN® Lite™ - Anthem. Designed with our exclusive Heel Pillow™ and recycled materials, this American themed performance lace-up features a mesh and synthetic upper with responsive ULTRA GO® cushioning and Skechers Air-Cooled Memory Foam® insole. Our Planet Matters®: Good for your feet. Good for the world.®"),
    FeatureProduct(
        'https://www.skechers.com/dw/image/v2/BDCN_PRD/on/demandware.static/-/Sites-skechers-master/default/dw72536cba/images/large/220773_NVY.jpg?sw=400',
        "GO RUN Consistent 2.0 - Americana",
        85,
        "Run with the stars and stripes in comfort wearing Skechers GO RUN Consistent 2.0™ - Americana. Crafted for both style and performance, this American themed running design features a lace-up breathable mesh and leather overlay upper with responsive ULTRA LIGHT midsole cushioning and a high-rebound Skechers Air-Cooled Goga Mat™ insole."),
    FeatureProduct(
        'https://www.skechers.com/dw/image/v2/BDCN_PRD/on/demandware.static/-/Sites-skechers-master/default/dwd1f55146/images/large/216773_WNV.jpg?sw=578',
        "Skechers Slip-ins: GO WALK 7",
        100,"Give cheers to the red, white and blue in Skechers Hands Free Slip-ins®: GO WALK 7™. Crafted for both style and comfort, this American themed walking design features our exclusive Heel Pillow™, an engineered mesh upper with stretch laces, Skechers Air-Cooled Memory Foam® insole, lightweight ULTRA GO® cushioning, and high-rebound Hyper Pillars™ for added support."),


  ];
}
