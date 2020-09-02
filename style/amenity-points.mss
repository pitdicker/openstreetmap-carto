@marina-text: #576ddf; // also swimming_pool
@wetland-text: darken(#4aa5fa, 25%); /* Also for mud */
@shop-icon: #ac39ac;
@shop-text: #939;
@transportation-icon: #0092da;
@transportation-text: #0066ff;
@accommodation-icon: @transportation-icon;
@accommodation-text: @transportation-text;
@airtransport: #8461C4; //also ferry_terminal
@health-color: #BF0000;
@amenity-brown: #734a08;
@gastronomy-icon: #C77400;
@gastronomy-text: darken(@gastronomy-icon, 5%);
@memorials: @amenity-brown;
@culture: @amenity-brown;
@public-service: @amenity-brown;
@office: #4863A0;
@man-made-icon: #666666;
@advertising-grey: @man-made-icon;
@barrier-icon: #3f3f3f;
@landform-color: #d08f55;
@leisure-green: darken(@park, 60%);
@leisure-blue: @transportation-icon;
@protected-area: #008000;
@aboriginal: #82643a;
@religious-icon: #000000;

@landcover-font-size: 10;
@landcover-wrap-width-size: 30; // 3 em
@landcover-line-spacing-size: -1.5; // -0.15 em
@landcover-font-size-big: 12;
@landcover-wrap-width-size-big: 36; // 3 em
@landcover-line-spacing-size-big: -1.8; // -0.15 em
@landcover-font-size-bigger: 15;
@landcover-wrap-width-size-bigger: 45; // 3 em
@landcover-line-spacing-size-bigger: -2.25; // -0.15 em
@landcover-face-name: @oblique-fonts;

@standard-font-size: 10;
@standard-wrap-width: 30; // 3 em
@standard-line-spacing-size: -1.5; // -0.15 em
@standard-font: @book-fonts;

#amenity-points {
  [feature = 'highway_bus_stop'] {
    [zoom >= 17] {
      marker-file: url('symbols/highway/bus_stop.12.svg');
      marker-width: 12;
    }
  }

  [feature = 'amenity_bus_station'][zoom >= 16] {
    marker-file: url('symbols/amenity/bus_station.svg');
    // use colors from SVG to allow for white background
    marker-clip: false;
  }

  [feature = 'tourism_camp_site'][zoom >= 16] {
    marker-file: url('symbols/tourism/camping.svg');
    marker-fill: @accommodation-icon;
    marker-clip: false;
  }

  [feature = 'tourism_caravan_site'][zoom >= 16] {
    marker-file: url('symbols/tourism/caravan_park.svg');
    marker-clip: false;
    marker-fill: @accommodation-icon;
  }

  [feature = 'amenity_fire_station'][zoom >= 16] {
    marker-file: url('symbols/amenity/firestation.svg');
    marker-fill: @public-service;
    marker-clip: false;
  }

  [feature = 'amenity_fountain'] {
    ::basin {
      [zoom = 17] {
        marker-fill: @water-color;
        marker-allow-overlap: true;
        marker-line-width: 0;
        marker-width: 10;
        marker-height: 10;
        marker-ignore-placement: true;
      }
    }
    ::nozzle {
      [zoom = 17] {
        nozzle/marker-fill: @marina-text;
        nozzle/marker-line-width: 0;
        nozzle/marker-width: 3;
        nozzle/marker-height: 3;
      }
      [zoom >= 18] {
        nozzle/marker-file: url('symbols/amenity/fountain.svg');
        nozzle/marker-fill: @marina-text;
        nozzle/marker-clip: false;
      }
    }
  }

  [feature = 'amenity_library'][zoom >= 17] {
    marker-file: url('symbols/amenity/library.svg');
    marker-fill: @culture;
    marker-clip: false;
  }

  [feature = 'amenity_courthouse'][zoom >= 17] {
    marker-file: url('symbols/amenity/courthouse.svg');
    marker-fill: @public-service;
    marker-clip: false;
  }

  [feature = 'amenity_community_centre'][zoom >= 17] {
    marker-file: url('symbols/amenity/community_centre.svg');
    marker-fill: @culture;
    marker-clip: false;
  }

  [feature = 'amenity_townhall'][zoom >= 16] {
    marker-file: url('symbols/amenity/town_hall.svg');
    marker-fill: @public-service;
    marker-clip: false;
  }

  [feature = 'tourism_museum'][zoom >= 17] {
    marker-file: url('symbols/tourism/museum.svg');
    marker-fill: @culture;
    marker-clip: false;
  }

  [feature = 'amenity_hospital'][zoom >= 15] {
    marker-file: url('symbols/amenity/hospital.svg');
    marker-fill: @health-color;
    marker-clip: false;
  }

  [feature = 'amenity_place_of_worship'][zoom >= 17] {
    marker-file: url('symbols/amenity/place_of_worship.svg');
    marker-fill: @religious-icon;
    marker-clip: false;
    [religion = 'christian'] {
      marker-file: url('symbols/religion/christian.svg');
      [denomination = 'jehovahs_witness']{
        marker-file: url('symbols/amenity/place_of_worship.svg');
      }
    }
    [religion = 'muslim'] {
      marker-file: url('symbols/religion/muslim.svg');
    }
    [religion = 'sikh'] {
      marker-file: url('symbols/religion/sikhist.svg');
    }
    [religion = 'jewish'] {
      marker-file: url('symbols/religion/jewish.svg');
    }
    [religion = 'hindu'] {
      marker-file: url('symbols/religion/hinduist.svg');
    }
    [religion = 'buddhist'] {
      marker-file: url('symbols/religion/buddhist.svg');
    }
    [religion = 'shinto'] {
      marker-file: url('symbols/religion/shintoist.svg');
    }
    [religion = 'taoist'] {
      marker-file: url('symbols/religion/taoist.svg');
    }
  }

  [feature = 'amenity_police'][zoom >= 16] {
    marker-file: url('symbols/amenity/police.svg');
    marker-fill: @public-service;
    marker-clip: false;
  }

  [feature = 'amenity_recycling'][recycling_type = 'centre'][zoom >= 16],
  [feature = 'amenity_recycling'][zoom >= 19] {
    marker-file: url('symbols/amenity/recycling.svg');
    marker-fill: @amenity-brown;
    marker-clip: false;
    [access != ''][access != 'permissive'][access != 'yes'] {
      marker-opacity: 0.33;
    }
  }

  [feature = 'amenity_theatre'][zoom >= 16] {
    marker-file: url('symbols/amenity/theatre.svg');
    marker-fill: @culture;
    marker-clip: false;
  }

  [feature = 'amenity_prison'][zoom >= 17] {
    marker-file: url('symbols/amenity/prison.svg');
    marker-fill: @public-service;
    marker-clip: false;
  }

  [feature = 'tourism_viewpoint'][zoom >= 16] {
    marker-file: url('symbols/tourism/viewpoint.svg');
    marker-fill: @amenity-brown;
    marker-clip: false;
  }

  [feature = 'man_made_water_tower'][zoom >= 16] {
    marker-file: url('symbols/man_made/water_tower.svg');
    marker-fill: @man-made-icon;
    marker-clip: false;
  }

  [feature = 'historic_memorial'][memorial = null][zoom >= 17],
  [feature = 'historic_memorial'][memorial != null][memorial != 'blue_plaque'][memorial != 'bust'][memorial != 'plaque'][memorial != 'stele'][memorial != 'stone'][zoom >= 17],
  [feature = 'historic_memorial'][memorial = 'statue'][zoom >= 17],
  [feature = 'historic_memorial'][memorial = 'bust'][zoom >= 18],
  [feature = 'historic_memorial'][memorial = 'stele'][zoom >= 18],
  [feature = 'historic_memorial'][memorial = 'stone'][zoom >= 18],
  [feature = 'historic_memorial'][memorial = 'blue_plaque'][zoom >= 19],
  [feature = 'historic_memorial'][memorial = 'plaque'][zoom >= 19] {
    marker-file: url('symbols/historic/memorial.svg');
    [memorial = 'bust']{
      marker-file: url('symbols/historic/bust.svg');
    }
    [memorial = 'blue_plaque'],
    [memorial = 'plaque'] {
      marker-file: url('symbols/historic/plaque.svg');
    }
    [memorial = 'statue'] {
      marker-file: url('symbols/historic/statue.svg');
    }
    [memorial = 'stone'] {
      marker-file: url('symbols/historic/stone.svg');
    }
    marker-fill: @memorials;
    marker-clip: false;
  }

  [feature = 'historic_monument'][zoom >= 17] {
    marker-file: url('symbols/historic/monument.svg');
    marker-fill: @memorials;
    marker-clip: false;
  }

  [feature = 'historic_fort'][zoom >= 16] {
    marker-file: url('symbols/historic/fort.svg');
    marker-fill: @memorials;
    marker-clip: false;
  }

  [feature = 'historic_castle'][castle_type != 'stately'][castle_type != 'manor'][zoom >= 15],
  [feature = 'historic_castle'][castle_type = 'stately'][zoom >= 16],
  [feature = 'historic_castle'][castle_type = 'manor'][zoom >= 16],
  [feature = 'historic_manor'][zoom >= 16] {
    marker-file: url('symbols/historic/castle.svg');
    marker-fill: @memorials;
    marker-clip: false;
    [castle_type = 'palace'],
    [castle_type = 'stately'] {
      marker-file: url('symbols/historic/palace.svg');
    }
    [castle_type = 'manor'],
    [feature = 'historic_manor'] {
      marker-file: url('symbols/historic/manor.svg');
    }
    [castle_type = 'fortress'],
    [castle_type = 'defensive'],
    [castle_type = 'castrum'],
    [castle_type = 'shiro'],
    [castle_type = 'kremlin'] {
      marker-file: url('symbols/historic/fortress.svg');
    }
  }

  [feature = 'leisure_water_park'][zoom >= 16],
  [feature = 'leisure_sports_centre'][sport = 'swimming'][zoom >= 16],
  [feature = 'leisure_swimming_area'][zoom >= 16] {
    marker-file: url('symbols/leisure/water_park.svg');
    marker-fill: @leisure-blue;
    marker-clip: false;
  }

  [feature = 'leisure_dog_park'][zoom >= 17] {
    marker-file: url('symbols/shop/pet.svg');
    marker-fill: @leisure-green;
    marker-clip: false;
  }

  [feature = 'leisure_playground'][zoom >= 17] {
    marker-file: url('symbols/leisure/playground.svg');
    marker-fill: @leisure-green;
    marker-clip: false;
    [access != ''][access != 'permissive'][access != 'yes'] {
      marker-opacity: 0.33;
    }
  }

  [feature = 'leisure_miniature_golf'][zoom >= 16] {
    marker-file: url('symbols/leisure/miniature_golf.svg');
    marker-fill: @leisure-green;
    marker-clip: false;
  }

  [feature = 'leisure_golf_course'][zoom >= 15] {
    marker-file: url('symbols/leisure/golf.svg');
    marker-fill: @leisure-green;
    marker-clip: false;
  }

  [feature = 'tourism_picnic_site'][zoom >= 16] {
    marker-file: url('symbols/tourism/picnic.svg');
    marker-fill: @leisure-green;
    marker-clip: false;
    [access != ''][access != 'permissive'][access != 'yes'] {
      marker-opacity: 0.33;
    }
  }

  [feature = 'leisure_picnic_table'][zoom >= 17] {
    marker-file: url('symbols/tourism/picnic.svg');
    marker-fill: @man-made-icon;
    marker-clip: false;
    [access != ''][access != 'permissive'][access != 'yes'] {
      marker-opacity: 0.33;
    }
  }

  [feature = 'leisure_firepit'][zoom >= 17] {
    marker-file: url('symbols/leisure/firepit.svg');
    marker-fill: @amenity-brown;
    marker-clip: false;
    [access != ''][access != 'permissive'][access != 'yes'] {
      marker-opacity: 0.33;
    }
  }

  [feature = 'leisure_outdoor_seating'][zoom >= 19] {
     marker-file: url('symbols/leisure/outdoor_seating.svg');
     marker-fill: @leisure-green;
     marker-clip: false;
   }

  [feature = 'leisure_bird_hide'][zoom >= 17] {
     marker-file: url('symbols/leisure/bird_hide.svg');
     marker-fill: @leisure-green;
     marker-clip: false;
   }

  [feature = 'amenity_ferry_terminal'][zoom >= 15] {
    marker-file: url('symbols/amenity/ferry.svg');
    marker-clip: false;
    marker-fill: @airtransport;
  }

  [feature = 'power_generator']['generator:source' = 'wind'] {
    [zoom >= 15][location != 'rooftop'][location != 'roof'],
    [zoom >= 15][location = null],
    [zoom >= 19] {
      marker-file: url('symbols/generator_wind.svg');
      marker-fill: @man-made-icon;
      marker-clip: false;
    }
  }

  [feature = 'man_made_windmill'][zoom >= 16] {
    marker-file: url('symbols/man_made/windmill.svg');
    marker-fill: @man-made-icon;
    marker-clip: false;
  }

  [feature = 'amenity_parking'],
  [feature = 'amenity_bicycle_parking'],
  [feature = 'amenity_motorcycle_parking'],
  [feature = 'amenity_parking_entrance'] {
    [zoom >= 14][way_pixels > 750],
    [zoom >= 17][feature = 'amenity_parking'],
    [zoom >= 18] {
      [feature = 'amenity_parking'] { marker-file: url('symbols/amenity/parking.svg'); }
      [feature = 'amenity_bicycle_parking'] { marker-file: url('symbols/amenity/bicycle_parking.svg'); }
      [feature = 'amenity_motorcycle_parking'] { marker-file: url('symbols/amenity/motorcycle_parking.svg'); }
      [feature = 'amenity_parking_entrance']["parking"='underground'] { marker-file: url('symbols/amenity/parking_entrance_underground.svg'); }
      [feature = 'amenity_parking_entrance']["parking"='multi-storey'] { marker-file: url('symbols/amenity/parking_entrance_multistorey.svg'); }
      marker-clip: false;
      marker-fill: @transportation-icon;
      [access != ''][access != 'permissive'][access != 'yes'] { marker-opacity: 0.33; }
    }
  }
}

#amenity-low-priority {
  [feature = 'railway_level_crossing'][zoom >= 17]::railway,
  [feature = 'railway_crossing'][zoom >= 17]::railway{
    marker-file: url('symbols/level_crossing2.svg');
  }

  [feature = 'highway_mini_roundabout'][zoom >= 17]::highway {
    marker-file: url('symbols/highway/mini_roundabout.svg');
    marker-clip: false;
  }

  [feature = 'barrier_gate']::barrier {
    [zoom >= 17] {
      marker-file: url('symbols/barrier/gate.svg');
      marker-clip: false;
    }
  }

  [feature = 'barrier_lift_gate'][zoom >= 17]::barrier,
  [feature = 'barrier_swing_gate'][zoom >= 17]::barrier {
    marker-file: url('symbols/barrier/lift_gate.svg');
    marker-fill: @barrier-icon;
    marker-clip: false;
  }

  [feature = 'barrier_cattle_grid'][zoom >= 17]::barrier {
    marker-file: url('symbols/barrier/cattle_grid.svg');
    marker-fill: @barrier-icon;
    marker-clip: false;
  }

  [feature = 'barrier_stile'][zoom >= 17]::barrier {
    marker-file: url('symbols/barrier/stile.svg');
    marker-fill: @barrier-icon;
    marker-clip: false;
  }

  [feature = 'barrier_motorcycle_barrier'][zoom >= 17]::barrier {
    marker-file: url('symbols/barrier/motorcycle_barrier.svg');
    marker-fill: @barrier-icon;
    marker-clip: false;
  }

  [feature = 'barrier_cycle_barrier'][zoom >= 17]::barrier {
    marker-file: url('symbols/barrier/cycle_barrier.svg');
    marker-fill: @barrier-icon;
    marker-clip: false;
  }

  [feature = 'barrier_full-height_turnstile'][zoom >= 17]::barrier {
    marker-file: url('symbols/barrier/full-height_turnstile.svg');
    marker-fill: @barrier-icon;
    marker-clip: false;
  }

  [feature = 'barrier_kissing_gate'][zoom >= 17]::barrier {
    marker-file: url('symbols/barrier/kissing_gate.svg');
    marker-fill: @barrier-icon;
    marker-clip: false;
  }

  [feature = 'barrier_bollard'],
  [feature = 'barrier_block'],
  [feature = 'barrier_log'],
  [feature = 'barrier_turnstile'] {
    [zoom >= 17] {
      marker-width: 3;
      marker-line-width: 0;
      marker-fill: #7d7c7c;

      [zoom >= 18] {
        marker-width: 4;
      }
    }
  }

  [feature = 'amenity_bench'][zoom >= 17]::amenity {
    marker-file: url('symbols/amenity/bench.svg');
    marker-fill: @man-made-icon;
    [access != ''][access != 'permissive'][access != 'yes'] {
      marker-opacity: 0.33;
    }
  }

  [feature = 'amenity_waste_basket'][zoom >= 19]::amenity {
    marker-file: url('symbols/amenity/waste_basket.svg');
    marker-fill: @man-made-icon;
    [access != ''][access != 'permissive'][access != 'yes'] {
      marker-opacity: 0.33;
    }
  }

  // waste_disposal tagging on nodes - tagging on ways is defined earlier
  [feature = 'amenity_waste_disposal'][zoom >= 19]::amenity {
    [access = null],
    [access = 'permissive'],
    [access = 'yes'] {
      marker-file: url('symbols/amenity/waste_disposal.svg');
      marker-fill: @man-made-icon;
    }
  }
}

/* Note that these layers are also used in water.mss */
#text-poly-low-zoom[zoom < 10],
#text-point[zoom >= 10] {
  [feature = 'place_locality'][zoom >= 16] {
    text-name: "[name]";
    text-size: 10;
    text-fill: @placenames;
    text-face-name: @book-fonts;
    text-halo-fill: @standard-halo-fill;
    text-halo-radius: @standard-halo-radius * 1.5;
    text-wrap-width: 45; // 4.5 em
    text-line-spacing: -0.8; // -0.08 em
    text-margin: 7.0; // 0.7 em
    [zoom >= 17] {
      text-size: 12;
      text-wrap-width: 60; // 5.0 em
      text-line-spacing: -0.60; // -0.05 em
      text-margin: 8.4; // 0.7 em
      text-fill: @placenames-light;
      text-halo-fill: white;
    }
  }

  [feature = 'place_square'][zoom >= 17] {
    text-name: "[name]";
    text-size: 11;
    text-face-name: @book-fonts;
    text-halo-fill: @standard-halo-fill;
    text-halo-radius: @standard-halo-radius * 1.5;
    text-wrap-width: 45; // 4.5 em
    text-line-spacing: -0.8; // -0.08 em
    text-margin: 7.0; // 0.7 em
  }

  [feature = 'amenity_library'],
  [feature = 'tourism_museum'],
  [feature = 'amenity_theatre'],
  [feature = 'amenity_cinema'],
  [feature = 'amenity_arts_centre'],
  [feature = 'amenity_community_centre'],
  [feature = 'historic_archaeological_site'] {
    [zoom >= 17] {
      text-name: "[name]";
      text-size: @standard-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-fill: @culture;
      text-dy: 11;
      [feature = 'amenity_community_centre'] { text-dy: 10; }
      text-face-name: @standard-font;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      [feature = 'amenity_nightclub']{
        text-dy: 12;
      }
    }
  }

  [feature = 'amenity_public_bath'][zoom >= 17] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @amenity-brown;
    text-dy: 11;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [feature = 'leisure_sauna'][zoom >= 17] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @leisure-green;
    text-dy: 11;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [feature = 'amenity_townhall'][zoom >= 17],
  [feature = 'amenity_police'][zoom >= 17],
  [feature = 'amenity_fire_station'][zoom >= 17],
  [feature = 'amenity_prison'][zoom >= 17] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @public-service;
    text-dy: 11;
    [feature = 'amenity_courthouse'] { text-dy: 13; }
    [feature = 'amenity_townhall'] { text-dy: 13; }
    [feature = 'amenity_prison'] { text-dy: 12; }
    [feature = 'amenity_bank'] { text-dy: 9; }
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [feature = 'leisure_bird_hide'][zoom >= 17] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @amenity-brown;
    [feature = 'leisure_outdoor_seating'],
    [feature = 'leisure_fishing'],
    [feature = 'leisure_bowling_alley'],
    [feature = 'leisure_bird_hide'],
    [feature = 'leisure_amusement_arcade'],
    [feature = 'leisure_beach_resort'] {
      text-fill: @leisure-green;
    }
    text-dy: 10;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [feature = 'amenity_bbq'][zoom >= 17],
  [feature = 'amenity_drinking_water'][zoom >= 17],
  [feature = 'tourism_picnic_site'][zoom >= 17] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @amenity-brown;
    [feature = 'tourism_picnic_site'] {
      text-fill: @leisure-green;
    }
    text-dy: 10;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    [access != ''][access != 'permissive'][access != 'yes'] {
      text-opacity: 0.33;
      text-halo-radius: 0;
    }
  }

  [feature = 'amenity_place_of_worship'][zoom >= 17] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: #000033;
    text-dy: 12;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
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

  [feature = 'power_generator']['generator:source' = 'wind'][location != 'rooftop'][location != 'roof'][zoom >= 17],
  [feature = 'power_generator']['generator:source' = 'wind'][location = null][zoom >= 17],
  [feature = 'power_generator']['generator:source' = 'wind'][zoom >= 19],
  [feature = 'historic_city_gate'][zoom >= 17],
  [feature = 'natural_cave_entrance'][zoom >= 15],
  [feature = 'man_made_mast'][zoom >= 18],
  [feature = 'man_made_tower'][zoom >= 17],
  [feature = 'man_made_storage_tank'][zoom >= 18],
  [feature = 'man_made_silo'][zoom >= 18],
  [feature = 'man_made_communications_tower'][zoom >= 17],
  [feature = 'man_made_telescope']["telescope:type" != 'optical']["telescope:type" != null][zoom >= 16],
  [feature = 'man_made_telescope'][zoom >= 17],
  [feature = 'man_made_water_tower'][zoom >= 17],
  [feature = 'man_made_chimney'][zoom >= 17],
  [feature = 'man_made_crane'][zoom >= 17],
  [feature = 'man_made_waste_water_plant'][zoom >= 17] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: darken(@man-made-icon, 20%);
    [feature = 'power_generator']['generator:source' = 'wind'],
    [feature = 'historic_city_gate'],
    [feature = 'man_made_mast'],
    [feature = 'man_made_tower'],
    [feature = 'man_made_communications_tower'],
    [feature = 'man_made_telescope'],
    [feature = 'man_made_water_tower'],
    [feature = 'man_made_storage_tank'],
    [feature = 'man_made_silo'],
    [feature = 'man_made_chimney'],
    [feature = 'man_made_crane'] {
      text-dy: 10;
    }
    [feature = 'natural_cave_entrance'] {
      text-dy: 11;
    }
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [feature = 'leisure_miniature_golf'][zoom >= 17],
  [feature = 'leisure_golf_course'][zoom >= 15] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @leisure-green;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    text-dy: 13;
  }

  [feature = 'leisure_water_park'],
  [feature = 'leisure_sports_centre'][sport = 'swimming'],
  [feature = 'leisure_swimming_area'] {
    [zoom >= 14][way_pixels > 3000],
    [zoom >= 17] {
      text-name: "[name]";
      text-size: @standard-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-fill: @leisure-green;
      text-dy: 11;
      text-face-name: @standard-font;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
    }
  }

  [feature = 'leisure_swimming_pool'][is_building = 'no'] {
    [zoom >= 14][way_pixels > 3000],
    [zoom >= 17] {
      text-name: "[name]";
      text-size: @landcover-font-size;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      [way_pixels > 12000] {
        text-size: @landcover-font-size-big;
        text-wrap-width: @landcover-wrap-width-size-big;
        text-line-spacing: @landcover-line-spacing-size-big;
      }
      [way_pixels > 48000] {
        text-size: @landcover-font-size-bigger;
        text-wrap-width: @landcover-wrap-width-size-bigger;
        text-line-spacing: @landcover-line-spacing-size-bigger;
      }
      text-fill: @marina-text;
      text-face-name: @landcover-face-name;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
    }
  }

  [feature = 'leisure_playground'],
  [feature = 'leisure_dog_park'] {
    [zoom >= 14][way_pixels > 3000],
    [zoom >= 17] {
      text-name: "[name]";
      text-size: @standard-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-dy: 13;
      text-fill: @leisure-green;
      text-face-name: @standard-font;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      [access != ''][access != 'permissive'][access != 'yes'] {
        text-fill: darken(@park, 50%);
      }
    }
  }

  [feature = 'landuse_military'],
  [feature = 'natural_wood'],
  [feature = 'landuse_forest'],
  [feature = 'boundary_national_park'],
  [feature = 'leisure_nature_reserve'],
  [feature = 'boundary_aboriginal_lands'],
  [feature = 'boundary_protected_area'] {
    [zoom >= 8][way_pixels > 3000][is_building = 'no'],
    [zoom >= 17] {
      text-name: "[name]";
      text-size: @landcover-font-size;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      [way_pixels > 12000] {
        text-size: @landcover-font-size-big;
        text-wrap-width: @landcover-wrap-width-size-big;
        text-line-spacing: @landcover-line-spacing-size-big;
      }
      [way_pixels > 48000] {
        text-size: @landcover-font-size-bigger;
        text-wrap-width: @landcover-wrap-width-size-bigger;
        text-line-spacing: @landcover-line-spacing-size-bigger;
      }
      text-face-name: @landcover-face-name;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      [feature = 'landuse_military'] {
        text-fill: darken(@military, 40%);
      }
      [feature = 'boundary_aboriginal_lands'] {
        text-fill: @aboriginal;
      }
      [feature = 'natural_wood'],
      [feature = 'landuse_forest'] {
        text-fill: @forest-text;
      }
      [feature = 'boundary_national_park'],
      [feature = 'leisure_nature_reserve'],
      [feature = 'boundary_protected_area'] {
        text-fill: @protected-area;
      }
    }
  }

  [feature = 'landuse_garages'][is_building = 'no'] {
    [zoom >= 13][way_pixels > 3000],
    [zoom >= 17] {
      text-name: "[name]";
      text-size: @landcover-font-size;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      [way_pixels > 12000] {
        text-size: @landcover-font-size-big;
        text-wrap-width: @landcover-wrap-width-size-big;
        text-line-spacing: @landcover-line-spacing-size-big;
      }
      [way_pixels > 48000] {
        text-size: @landcover-font-size-bigger;
        text-wrap-width: @landcover-wrap-width-size-bigger;
        text-line-spacing: @landcover-line-spacing-size-bigger;
      }
      text-fill: darken(@garages, 50%);
      text-face-name: @landcover-face-name;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
    }
  }

  [feature = 'natural_wetland'],
  [feature = 'natural_mud'],
  [feature = 'leisure_park'],
  [feature = 'leisure_recreation_ground'],
  [feature = 'landuse_recreation_ground'],
  [feature = 'landuse_village_green'],
  [feature = 'leisure_garden'],
  [feature = 'landuse_quarry'],
  [feature = 'landuse_vineyard'],
  [feature = 'landuse_orchard'],
  [feature = 'landuse_plant_nursery'],
  [feature = 'landuse_cemetery'],
  [feature = 'amenity_grave_yard'],
  [feature = 'landuse_residential'],
  [feature = 'landuse_meadow'],
  [feature = 'natural_grassland'],
  [feature = 'landuse_grass'],
  [feature = 'landuse_allotments'],
  [feature = 'landuse_farmyard'],
  [feature = 'landuse_farmland'],
  [feature = 'landuse_greenhouse_horticulture'],
  [feature = 'shop'][shop = 'mall'][location != 'underground'],
  [feature = 'landuse_retail'],
  [feature = 'landuse_industrial'],
  [feature = 'landuse_railway'],
  [feature = 'man_made_works'],
  [feature = 'man_made_water_works'],
  [feature = 'man_made_wastewater_plant'],
  [feature = 'landuse_commercial'],
  [feature = 'landuse_brownfield'],
  [feature = 'landuse_landfill'],
  [feature = 'landuse_construction'],
  [feature = 'landuse_salt_pond'],
  [feature = 'tourism_theme_park'],
  [feature = 'tourism_zoo'],
  [feature = 'amenity_kindergarten'],
  [feature = 'amenity_school'],
  [feature = 'amenity_college'],
  [feature = 'amenity_university'],
  [feature = 'landuse_religious'],
  [feature = 'natural_heath'],
  [feature = 'natural_scrub'],
  [feature = 'natural_beach'],
  [feature = 'natural_shoal'],
  [feature = 'natural_reef'],
  [feature = 'leisure_fitness_centre'],
  [feature = 'leisure_fitness_station'],
  [feature = 'leisure_sports_centre'],
  [feature = 'leisure_stadium'],
  [feature = 'leisure_track'],
  [feature = 'leisure_dog_park'],
  [feature = 'leisure_ice_rink'],
  [feature = 'leisure_pitch'] {
    [zoom >= 10][way_pixels > 3000][is_building = 'no'],
    [zoom >= 17][is_building = 'no'],
    [zoom >= 10][way_pixels > 3000][shop = 'mall'],
    [zoom >= 17][shop = 'mall'] {
      text-name: "[name]";
      text-size: @landcover-font-size;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      [way_pixels > 12000] {
        text-size: @landcover-font-size-big;
        text-wrap-width: @landcover-wrap-width-size-big;
        text-line-spacing: @landcover-line-spacing-size-big;
      }
      [way_pixels > 48000] {
        text-size: @landcover-font-size-bigger;
        text-wrap-width: @landcover-wrap-width-size-bigger;
        text-line-spacing: @landcover-line-spacing-size-bigger;
      }
      text-face-name: @landcover-face-name;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      [feature = 'natural_reef'],
      [feature = 'natural_wetland'],
      [feature = 'natural_mud'],
      [feature = 'landuse_salt_pond'] {
        text-fill: @wetland-text;
      }
      [feature = 'leisure_park'],
      [feature = 'leisure_recreation_ground'],
      [feature = 'landuse_recreation_ground'],
      [feature = 'landuse_village_green'],
      [feature = 'leisure_garden'] {
        text-fill: @leisure-green;
      }
      [feature = 'landuse_quarry'] {
        text-fill: darken(@quarry, 60%);
      }
      [feature = 'landuse_vineyard'],
      [feature = 'landuse_orchard'],
      [feature = 'landuse_plant_nursery'] {
        text-fill: darken(@orchard, 50%);
      }
      [feature = 'landuse_cemetery'],
      [feature = 'amenity_grave_yard'] {
        text-fill: darken(@cemetery, 50%);
        text-halo-radius: @standard-halo-radius * 1.5; /* extra halo needed to overpower the cemetery polygon pattern */
      }
      [feature = 'landuse_residential'] {
        text-fill: darken(@residential, 50%);
      }
      [feature = 'landuse_meadow'],
      [feature = 'natural_grassland'],
      [feature = 'landuse_grass'] {
        text-fill: darken(@grass, 50%);
      }
      [feature = 'landuse_allotments'] {
        text-fill: darken(@allotments, 50%);
      }
      [feature = 'landuse_farmyard'] {
        text-fill: darken(@farmyard, 50%);
      }
      [feature = 'landuse_farm'],
      [feature = 'landuse_farmland'],
      [feature = 'landuse_greenhouse_horticulture'] {
        text-fill: darken(@farmland, 50%);
      }
      [feature = 'shop'][shop = 'mall'],
      [feature = 'landuse_retail'] {
        text-fill: darken(@retail, 50%);
      }
      [feature = 'landuse_industrial'],
      [feature = 'landuse_railway'],
      [feature = 'man_made_wastewater_plant'],
      [feature = 'man_made_water_works'],
      [feature = 'man_made_works'] {
        text-fill: darken(@industrial, 60%);
      }
      [feature = 'landuse_commercial'] {
        text-fill: darken(@commercial, 60%);
      }
      [feature = 'landuse_brownfield'],
      [feature = 'landuse_landfill'],
      [feature = 'landuse_construction'] {
        text-fill: darken(@construction, 50%);
      }
      [feature = 'tourism_caravan_site'] {
        text-fill: darken(@campsite, 50%);
        text-dy: 15;
      }
      [feature = 'tourism_theme_park'],
      [feature = 'tourism_zoo'] {
        text-fill: @tourism;
        text-face-name: @bold-fonts; /*rendered bold to improve visibility since theme parks tend to have crowded backgrounds*/
      }
      [feature = 'amenity_kindergarten'],
      [feature = 'amenity_school'],
      [feature = 'amenity_college'],
      [feature = 'amenity_university'] {
        text-fill: darken(@societal_amenities, 80%);
      }
      [feature = 'landuse_religious'] {
        text-fill: darken(@place_of_worship, 50%);
      }
      [feature = 'natural_heath'] {
        text-fill: darken(@heath, 40%);
      }
      [feature = 'natural_scrub'] {
        text-fill: darken(@scrub, 60%);
      }
      [feature = 'natural_beach'],
      [feature = 'natural_shoal'] {
        text-fill: darken(@beach, 60%);
      }
      [feature = 'leisure_sports_centre'],
      [feature = 'leisure_stadium'] {
        text-fill: darken(@stadium, 70%);
      }
      [feature = 'leisure_fitness_centre'],
      [feature = 'leisure_fitness_station'] {
        text-fill: @leisure-green;
        [access != ''][access != 'permissive'][access != 'yes'] {
          text-opacity: 0.33;
          text-halo-radius: 0;
        }
      }
      [feature = 'leisure_dog_park'] {
        text-fill: @leisure-green;
        text-halo-radius: @standard-halo-radius * 1.5; /* Extra halo needed to stand out from paw pattern. */
        text-halo-fill: @standard-halo-fill;
      }
      [feature = 'leisure_track'] {
        text-fill: darken(@track, 40%);
      }
      [feature = 'leisure_ice_rink'],
      [feature = 'leisure_pitch'] {
        text-fill: darken(@pitch, 40%);
      }
    }
  }

  [feature = 'leisure_picnic_table'][zoom >= 17],
  [feature = 'tourism_camp_site'][zoom >= 17],
  [feature = 'tourism_caravan_site'][zoom >= 17], {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @accommodation-text;
    text-dy: 11;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    [feature = 'tourism_camp_site'],
    [feature = 'tourism_caravan_site'] {
      text-dy: 15;
    }
    [feature = 'leisure_picnic_table'][zoom >= 17] {
      text-fill: @man-made-icon;
    }
  }


  [feature = 'highway_bus_stop'],
  [feature = 'amenity_bus_station'] {
    [zoom >= 17] {
      text-name: "[name]";
      text-size: @standard-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-fill: @transportation-text;
      text-dy: 11;
      text-face-name: @standard-font;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      [feature = 'highway_bus_stop'] {
        text-dy: 9;
      }
      [access != ''][access != 'permissive'][access != 'yes'] {
        text-opacity: 0.33;
        text-halo-radius: 0;
      }
    }
  }

  [feature = 'leisure_marina'][zoom >= 15] {
    [zoom >= 10][way_pixels > 3000],
    [zoom >= 17] {
      text-name: "[name]";
      text-size: @landcover-font-size;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      [way_pixels > 12000] {
        text-size: @landcover-font-size-big;
        text-wrap-width: @landcover-wrap-width-size-big;
        text-line-spacing: @landcover-line-spacing-size-big;
      }
      [way_pixels > 48000] {
        text-size: @landcover-font-size-bigger;
        text-wrap-width: @landcover-wrap-width-size-bigger;
        text-line-spacing: @landcover-line-spacing-size-bigger;
      }
      text-fill: @marina-text;
      text-face-name: @landcover-face-name;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
    }
  }

  [feature = 'amenity_fountain'][zoom >= 17] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @marina-text;
    text-dy: 4;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    [zoom >= 18] {
      text-dy: 10;
    }
  }

  [feature = 'man_made_lighthouse'][zoom >= 15],
  [feature = 'man_made_windmill'][zoom >= 17] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: darken(@man-made-icon, 20%);
    text-dy: 10;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [feature = 'amenity_recycling'][recycling_type = 'centre'][zoom >= 17],
  [feature = 'amenity_recycling'][zoom >= 19] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @amenity-brown;
    text-dy: 10;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [feature = 'amenity_hospital'][zoom >= 16],
  [feature = 'healthcare_hospital'][zoom >= 16] {
    text-name: "[name]";
    text-fill: @health-color;
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-dy: 10;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [feature = 'power_plant'][is_building = 'no'][zoom >= 10],
  [feature = 'power_generator'][is_building = 'no']["generator:source" != 'wind'][zoom >= 10],
  [feature = 'power_substation'][is_building = 'no'][zoom >= 13]{
    [way_pixels > 3000],
    [zoom >= 17] {
      text-name: "[name]";
      text-size: @landcover-font-size;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      [way_pixels > 12000] {
        text-size: @landcover-font-size-big;
        text-wrap-width: @landcover-wrap-width-size-big;
        text-line-spacing: @landcover-line-spacing-size-big;
      }
      [way_pixels > 48000] {
        text-size: @landcover-font-size-bigger;
        text-wrap-width: @landcover-wrap-width-size-bigger;
        text-line-spacing: @landcover-line-spacing-size-bigger;
      }
      text-fill: darken(@power, 40%);
      text-face-name: @landcover-face-name;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
    }
  }

  [feature = 'highway_services'][is_building = 'no'],
  [feature = 'highway_rest_area'][is_building = 'no'] {
    [zoom >= 10][way_pixels > 3000],
    [zoom >= 17] {
      text-name: "[name]";
      text-size: @landcover-font-size;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      [way_pixels > 12000] {
        text-size: @landcover-font-size-big;
        text-wrap-width: @landcover-wrap-width-size-big;
        text-line-spacing: @landcover-line-spacing-size-big;
      }
      [way_pixels > 48000] {
        text-size: @landcover-font-size-bigger;
        text-wrap-width: @landcover-wrap-width-size-bigger;
        text-line-spacing: @landcover-line-spacing-size-bigger;
      }
      text-fill: darken(@rest_area, 40%);
      text-face-name: @landcover-face-name;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
    }
  }

  [feature = 'amenity_ferry_terminal'][zoom >= 15] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: darken(@airtransport, 15%);
    text-dy: 10;
    text-face-name: @oblique-fonts;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [feature = 'natural_tree'][zoom >= 17] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: green;
    text-dy: 7;
    [zoom >= 18] { text-dy: 8; }
    [zoom >= 19] { text-dy: 11; }
    [zoom >= 20] { text-dy: 18; }
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [feature = 'tourism_attraction'][zoom >= 17][is_building = 'no'] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @tourism;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    text-face-name: @standard-font;
  }

  [feature = 'amenity_parking'],
  [feature = 'amenity_bicycle_parking'],
  [feature = 'amenity_motorcycle_parking'],
  [feature = 'amenity_parking_entrance']["parking"='underground'] {
    [zoom >= 14][way_pixels > 3000],
    [zoom >= 18] {
      text-name: "[name]";
      text-size: @standard-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-fill: @transportation-text;
      text-dy: 9;
      text-face-name: @standard-font;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      [access != ''][access != 'permissive'][access != 'yes'] {
        text-opacity: 0.33;
        text-halo-radius: 0;
      }
      [feature = 'amenity_bicycle_parking'],
      [feature = 'amenity_motorcycle_parking'] { text-dy: 12; }
    }
  }
}

#amenity-line {
  // Ford tagging on ways
  [feature = 'highway_ford'][zoom >= 16] {
    marker-file: url('symbols/highway/ford.svg');
    marker-fill: @transportation-icon;
  }
  // Slipway tagging on ways
  [feature = 'leisure_slipway'][zoom >= 17] {
    marker-file: url('symbols/leisure/slipway.svg');
    marker-fill: @transportation-icon;
  }

  [feature = 'leisure_track'] {
    [zoom >= 16] {
      [zoom >= 17] {
        bridgecasing/line-color: saturate(darken(@pitch, 30%), 20%);
        bridgecasing/line-join: round;
        bridgecasing/line-width: 1.25;
        [zoom >= 18] { bridgecasing/line-width: 2.5; }
        [zoom >= 19] { bridgecasing/line-width: 5; }
      }
      line-color: @pitch;
      line-join: round;
      line-cap: round;
      line-width: 1;
      [zoom >= 18] { line-width: 2; }
      [zoom >= 19] { line-width: 4; }
    }
  }

  [feature = 'attraction_water_slide'] {
    [zoom >= 16] {
      [zoom >= 17] {
        bridgecasing/line-color: black;
        bridgecasing/line-join: round;
        bridgecasing/line-width: 1.25;
        [zoom >= 18] { bridgecasing/line-width: 2.5; }
        [zoom >= 19] { bridgecasing/line-width: 5; }
      }
      line-color: @pitch;
      line-join: round;
      line-cap: round;
      line-width: 1;
      [zoom >= 18] { line-width: 2; }
      [zoom >= 19] { line-width: 4; }
    }
  }
}

#text-line {
  [feature = 'leisure_track'],
  [feature = 'attraction_water_slide'] {
    [zoom >= 19] {
      text-name: "[name]";
      text-size: 10;
      text-face-name: @oblique-fonts;
      text-fill: darken(@pitch, 40%);
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      text-placement: line;
      text-vertical-alignment: middle;
      text-repeat-distance: @waterway-text-repeat-distance;
      text-dy: 8;
    }
  }

  [feature = 'leisure_slipway'][zoom >= 17] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @transportation-text;
    text-dy: 13;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }
}

#trees [zoom >= 16] {
  ::canopy {
    opacity: 0.3;
    [natural = 'tree_row'] {
      line-color: green;
      line-cap: round;
      line-width: 2.5;
      [zoom >= 17] {
        line-width: 5;
      }
      [zoom >= 18] {
        line-width: 10;
      }
      [zoom >= 19] {
        line-width: 15;
      }
      [zoom >= 20] {
        line-width: 30;
      }
    }
    [natural = 'tree'] {
      [zoom >= 18] {
        marker-fill: green;
        marker-allow-overlap: true;
        marker-line-width: 0;
        marker-ignore-placement: true;
        marker-width: 10;
        marker-height: 10;
      }
      [zoom >= 19] {
        marker-width: 15;
        marker-height: 15;
      }
      [zoom >= 20] {
        marker-width: 30;
        marker-height: 30;
      }
    }
  }
  [natural = 'tree']::trunk {
    [zoom >= 18] {
      trunk/marker-fill: #b27f36;
      trunk/marker-allow-overlap: true;
      trunk/marker-line-width: 0;
      trunk/marker-width: 2;
      trunk/marker-height: 2;
      trunk/marker-ignore-placement: true;
    }
    [zoom >= 19] {
      trunk/marker-width: 3;
      trunk/marker-height: 3;
    }
    [zoom >= 20] {
      trunk/marker-width: 6;
      trunk/marker-height: 6;
    }
  }
}
