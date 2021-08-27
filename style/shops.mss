@shop-icon: #ac39ac;
@shop-text: #939;

#amenity-points {
  [feature = 'amenity_marketplace'][zoom >= 16][way_pixels > 3000],
  [feature = 'amenity_marketplace'][zoom >= 17] {
    marker-clip: false;
    marker-fill: @shop-icon;
    marker-file: url('symbols/shop/marketplace.svg');
  }

  [feature = 'shop'],
  [feature = 'shop'][shop != 'car_repair'], // treated as amenity
  [feature = 'shop'][shop != 'massage'], // treated as leisure
  [feature = 'shop'][shop != 'mall'], // only text, no marker
  [feature = 'amenity_driving_school'],
  [feature = 'amenity_marketplace'] {
    [shop = 'supermarket'][zoom >= 16] {
      marker-file: url('symbols/shop/supermarket.svg');
      marker-clip: false;
      marker-fill: @shop-icon;
    }

    [shop = 'department_store'][zoom >= 16] {
      marker-file: url('symbols/shop/department_store.svg');
      marker-clip: false;
      marker-fill: @shop-icon;
    }

    [zoom >= 17][zoom < 18][shop != 'supermarket'][shop != 'department_store'] {
      marker-clip: false;
      marker-fill: @shop-icon;
      marker-width: 4;
      marker-line-width: 0;
    }

    [zoom >= 18] {
      marker-clip: false;
      marker-fill: @shop-icon;

      [shop = 'other'],
      [feature = 'amenity_driving_school'] {
        marker-width: 6;
        marker-line-width: 0;
      }

      [shop = 'art'] {
        marker-file: url('symbols/shop/art.svg');
      }
      [shop = 'bag'] {
        marker-file: url('symbols/shop/bag.svg');
      }
      [shop = 'bakery'] {
        marker-file: url('symbols/shop/bakery.svg');
      }
      [shop = 'beauty'] {
        marker-file: url('symbols/shop/beauty.svg');
      }
      [shop = 'bed'] {
        marker-file: url('symbols/shop/bed.svg');
      }
      [shop = 'beverages'] {
        marker-file: url('symbols/shop/beverages.svg');
      }
      [shop = 'bookmaker'] {
        marker-file: url('symbols/shop/bookmaker.svg');
      }
      [shop = 'books'] {
        marker-file: url('symbols/amenity/library.svg');
      }
      [shop = 'butcher'] {
        marker-file: url('symbols/shop/butcher.svg');
      }
      [shop = 'carpet'] {
        marker-file: url('symbols/shop/carpet.svg');
      }
      [shop = 'charity'] {
        marker-file: url('symbols/shop/charity.svg');
      }
      [shop = 'chemist'] {
        marker-file: url('symbols/shop/chemist.svg');
      }
      [shop = 'clothes'],
      [shop = 'fashion'] {
        marker-file: url('symbols/shop/clothes.svg');
      }
      [shop = 'coffee'] {
        marker-file: url('symbols/shop/coffee.svg');
      }
      [shop = 'computer'] {
        marker-file: url('symbols/shop/computer.svg');
      }
      [shop = 'convenience'] {
        marker-file: url('symbols/shop/convenience.svg');
      }
      [shop = 'chocolate'],
      [shop = 'confectionery'],
      [shop = 'pastry'] {
        marker-file: url('symbols/shop/confectionery.svg');
      }
      [shop = 'copyshop'] {
        marker-file: url('symbols/shop/copyshop.svg');
      }
      [shop = 'cosmetics'],
      [shop = 'perfumery'] {
        marker-file: url('symbols/shop/perfumery.svg');
      }
      [shop = 'deli'] {
        marker-file: url('symbols/shop/deli.svg');
      }
      [shop = 'doityourself'],
      [shop = 'hardware'] {
        marker-file: url('symbols/shop/diy.svg');
      }
      [shop = 'dry_cleaning'],
      [shop = 'laundry'] {
        marker-file: url('symbols/shop/laundry.svg');
      }
      [shop = 'fabric'] {
        marker-file: url('symbols/shop/fabric.svg');
      }
      [shop = 'fishmonger'],
      [shop = 'seafood'] {
        marker-file: url('symbols/shop/seafood.svg');
      }
      [shop = 'florist'] {
        marker-file: url('symbols/shop/florist.svg');
      }
      [shop = 'garden_centre'] {
        marker-file: url('symbols/shop/garden_centre.svg');
      }
      [shop = 'greengrocer'],
      [shop = 'farm'] {
        marker-file: url('symbols/shop/greengrocer.svg');
      }
      [shop = 'hairdresser'] {
        marker-file: url('symbols/shop/hairdresser.svg');
      }
      [shop = 'hifi'] {
        marker-file: url('symbols/shop/hifi.svg');
      }
      [shop = 'houseware'] {
        marker-file: url('symbols/shop/houseware.svg');
      }
      [shop = 'car'] {
        marker-file: url('symbols/shop/car.svg');
      }
      [shop = 'car_parts'] {
        marker-file: url('symbols/shop/car_parts.svg');
      }
      [shop = 'dairy'] {
        marker-file: url('symbols/shop/dairy.svg');
      }
      [shop = 'bicycle'] {
        marker-file: url('symbols/shop/bicycle.svg');
      }
      [shop = 'pet'] {
        marker-file: url('symbols/shop/pet.svg');
      }
      [shop = 'photo'],
      [shop = 'photo_studio'],
      [shop = 'photography'] {
        marker-file: url('symbols/shop/photo.svg');
      }
      [shop = 'paint'] {
        marker-file: url('symbols/shop/paint.svg');
      }
      [shop = 'shoes'] {
        marker-file: url('symbols/shop/shoes.svg');
      }
      [shop = 'gift'] {
        marker-file: url('symbols/shop/gift.svg');
      }
      [shop = 'electronics'] {
        marker-file: url('symbols/shop/electronics.svg');
      }
      [shop = 'alcohol'],
      [shop = 'wine'] {
        marker-file: url('symbols/shop/alcohol.svg');
      }
      [shop = 'optician'] {
        marker-file: url('symbols/shop/optician.svg');
      }
      [shop = 'outdoor'] {
        marker-file: url('symbols/shop/outdoor.svg');
      }
      [shop = 'furniture'] {
        marker-file: url('symbols/shop/furniture.svg');
      }
      [shop = 'interior_decoration'] {
        marker-file: url('symbols/shop/interior_decoration.svg');
      }
      [shop = 'medical_supply']{
        marker-file: url('symbols/shop/medical_supply.svg');
      }
      [shop = 'mobile_phone'] {
        marker-file: url('symbols/shop/mobile_phone.svg');
      }
      [shop = 'motorcycle'] {
        marker-file: url('symbols/shop/motorcycle.svg');
      }
      [shop = 'music'] {
        marker-file: url('symbols/shop/music.svg');
      }
      [shop = 'musical_instrument'] {
        marker-file: url('symbols/shop/musical_instrument.svg');
      }
      [shop = 'kiosk'],
      [shop = 'newsagent'] {
        marker-file: url('symbols/shop/newsagent.svg');
      }
      [shop = 'jewelry'],
      [shop = 'jewellery'] {
        marker-file: url('symbols/shop/jewelry.svg');
      }
      [shop = 'toys'] {
        marker-file: url('symbols/shop/toys.svg');
      }
      [shop = 'travel_agency'] {
        marker-file: url('symbols/shop/travel_agency.svg');
      }
      [shop = 'second_hand'] {
        marker-file: url('symbols/shop/second_hand.svg');
      }
      [shop = 'sports'] {
        marker-file: url('symbols/shop/sports.svg');
      }
      [shop = 'stationery'] {
        marker-file: url('symbols/shop/stationery.svg');
      }
      [shop = 'tobacco'] {
        marker-file: url('symbols/shop/tobacco.svg');
      }
      [shop = 'tea'] {
        marker-file: url('symbols/shop/tea.svg');
      }
      [shop = 'ticket'] {
        marker-file: url('symbols/shop/ticket.svg');
      }
      [shop = 'trade'] {
        marker-file: url('symbols/shop/trade.svg');
      }
      [shop = 'wholesale'] {
        marker-file: url('symbols/shop/trade.svg');
      }
      [shop = 'tyres'] {
        marker-file: url('symbols/shop/tyres.svg');
      }
      [shop = 'variety_store'] {
        marker-file: url('symbols/shop/variety_store.svg');
      }
      [shop = 'video'] {
        marker-file: url('symbols/shop/video.svg');
      }
      [shop = 'video_games'] {
        marker-file: url('symbols/shop/video_games.svg');
      }
    }
  }
}

#text-poly-low-zoom[zoom < 10],
#text-point[zoom >= 10] {
  [feature = 'shop_supermarket'],
  [feature = 'shop_department_store'] {
    [zoom >= 16] {
      text-name: "[name]";
      text-size: @standard-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-dy: 12;
      text-fill: @shop-text;
      text-face-name: @standard-font;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: rgba(255, 255, 255, 0.6);
    }
  }

  [feature = 'amenity_marketplace'][zoom >= 16][way_pixels > 3000],
  [feature = 'amenity_marketplace'][zoom >= 17] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-dy: 12;
    text-fill: @shop-text;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: rgba(255, 255, 255, 0.6);
  }

  [feature = 'shop'][shop != 'mall'][shop != 'car_repair'][shop != 'massage'],
  [feature = 'amenity_driving_school'] {
    [way_pixels > 3000][zoom >= 17],
    [zoom >= 18] {
      text-name: "[name]";
      text-size: @standard-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-dy: 12;
      text-fill: @shop-text;
      text-face-name: @standard-font;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: rgba(255, 255, 255, 0.6);
    }
  }
}