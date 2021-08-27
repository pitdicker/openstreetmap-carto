@leisure-green: darken(@park, 60%);

#amenity-points {
  [feature = 'leisure_golf_course'][zoom >= 15],
  [feature = 'leisure_beach_resort'][zoom >= 16],
  [feature = 'tourism_picnic_site'][zoom >= 16],
  [feature = 'leisure_amusement_arcade'][zoom >= 17],
  [feature = 'leisure_bird_hide'][zoom >= 17],
  [feature = 'leisure_bowling_alley'][zoom >= 17],
  [feature = 'leisure_dog_park'][zoom >= 17],
  [feature = 'leisure_firepit'][zoom >= 17],
  [feature = 'leisure_fishing'][zoom >= 17],
  [feature = 'leisure_fitness_centre'][zoom >= 17],
  [feature = 'leisure_fitness_station'][zoom >= 17],
  [feature = 'leisure_miniature_golf'][zoom >= 17],
  [feature = 'leisure_picnic_table'][zoom >= 17],
  [feature = 'leisure_playground'][zoom >= 17],
  [feature = 'leisure_sauna'][zoom >= 17],
  [feature = 'leisure_slipway'][zoom >= 17],
  [feature = 'leisure_water_park'][zoom >= 17],
  [feature = 'leisure_sports_centre'][sport = 'swimming'][zoom >= 17],
  [feature = 'leisure_swimming_area'][zoom >= 17],
  [feature = 'shop'][shop = 'massage'][zoom >= 18],
  [feature = 'leisure_outdoor_seating'][zoom >= 19] {
    marker-fill: @leisure-green;
    marker-clip: false;
    [feature = 'leisure_golf_course'] {
      marker-file: url('symbols/leisure/golf.svg');
    }
    [feature = 'leisure_beach_resort'] {
      marker-file: url('symbols/leisure/beach_resort.svg');
    }
    [feature = 'tourism_picnic_site'] {
      marker-file: url('symbols/tourism/picnic.svg');
    }
    [feature = 'leisure_amusement_arcade'] {
      marker-file: url('symbols/leisure/amusement_arcade.svg');
    }
    [feature = 'leisure_bird_hide'] {
      marker-file: url('symbols/leisure/bird_hide.svg');
    }
    [feature = 'leisure_bowling_alley'] {
      marker-file: url('symbols/leisure/bowling_alley.svg');
    }
    [feature = 'leisure_dog_park'] {
      marker-file: url('symbols/shop/pet.svg');
    }
    [feature = 'leisure_firepit'] {
      marker-file: url('symbols/leisure/firepit.svg');
      marker-fill: @amenity-brown;
    }
    [feature = 'leisure_fishing'] {
      marker-file: url('symbols/leisure/fishing.svg');
    }
    [feature = 'leisure_fitness_centre'],
    [feature = 'leisure_fitness_station'] {
      marker-file: url('symbols/leisure/fitness.svg');
    }
    [feature = 'leisure_miniature_golf'] {
      marker-file: url('symbols/leisure/miniature_golf.svg');
    }
    [feature = 'leisure_picnic_table'] {
      marker-file: url('symbols/tourism/picnic.svg');
      marker-fill: @man-made-icon;
    }
    [feature = 'leisure_playground'] {
      marker-file: url('symbols/leisure/playground.svg');
    }
    [feature = 'leisure_sauna'] {
      marker-file: url('symbols/leisure/sauna.svg');
    }
    // Slipway tagging on points - slipway on lines is defined later
    [feature = 'leisure_slipway'] {
      marker-file: url('symbols/leisure/slipway.svg');
    }
    [feature = 'leisure_water_park'],
    [feature = 'leisure_sports_centre'][sport = 'swimming'] {
      marker-file: url('symbols/leisure/water_park.svg');
    }
    [feature = 'shop'][shop = 'massage'] {
      marker-file: url('symbols/shop/massage.svg');
    }
    [feature = 'leisure_outdoor_seating'] {
      marker-file: url('symbols/leisure/outdoor_seating.svg');
    }

    [feature = 'leisure_firepit'],
    [feature = 'leisure_fitness_centre'],
    [feature = 'leisure_fitness_station'],
    [feature = 'tourism_picnic_site'],
    [feature = 'leisure_playground'] {
      [access != ''][access != 'permissive'][access != 'yes'] {
        marker-opacity: 0.33;
      }
    }
  }
}

#text-poly-low-zoom[zoom < 10],
#text-point[zoom >= 10] {
  [feature = 'leisure_dog_park'],
  [feature = 'leisure_fitness_centre'],
  [feature = 'leisure_fitness_station'],
  [feature = 'leisure_playground'],
  [feature = 'leisure_sports_centre'],
  [feature = 'leisure_swimming_area'],
  [feature = 'leisure_water_park'] {
    [zoom >= 14][way_pixels > 3000] {
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

  [feature = 'leisure_golf_course'][zoom >= 15],
  [feature = 'leisure_beach_resort'][zoom >= 17],
  [feature = 'tourism_picnic_site'][zoom >= 17],
  [feature = 'leisure_amusement_arcade'][zoom >= 17],
  [feature = 'leisure_bird_hide'][zoom >= 17],
  [feature = 'leisure_bowling_alley'][zoom >= 17],
  [feature = 'leisure_dog_park'][zoom >= 17],
  [feature = 'leisure_fishing'][zoom >= 17],
  [feature = 'leisure_fitness_centre'][zoom >= 17],
  [feature = 'leisure_fitness_station'][zoom >= 17],
  [feature = 'leisure_miniature_golf'][zoom >= 17],
  [feature = 'leisure_picnic_table'][zoom >= 17],
  [feature = 'leisure_playground'][zoom >= 17],
  [feature = 'leisure_sauna'][zoom >= 17],
  [feature = 'leisure_swimming_area'][zoom >= 17],
  [feature = 'leisure_water_park'][zoom >= 17],
  [feature = 'leisure_sports_centre'][sport = 'swimming'][zoom >= 17],
  [feature = 'leisure_outdoor_seating'][zoom >= 19] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @leisure-green;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    [feature = 'leisure_beach_resort'] { text-dy: 10; }
    [feature = 'leisure_golf_course'] { text-dy: 13; }
    [feature = 'leisure_beach_resort'] { text-dy: 10; }
    [feature = 'tourism_picnic_site'] { text-dy: 10; }
    [feature = 'leisure_amusement_arcade'] { text-dy: 10; }
    [feature = 'leisure_bird_hide'] { text-dy: 10; }
    [feature = 'leisure_bowling_alley'] { text-dy: 10; }
    [feature = 'leisure_dog_park'] { text-dy: 13; }
    [feature = 'leisure_fishing'] { text-dy: 10; }
    [feature = 'leisure_fitness_centre'] { text-dy: 13; }
    [feature = 'leisure_fitness_station'] { text-dy: 13; }
    [feature = 'leisure_miniature_golf'] { text-dy: 13; }
    [feature = 'leisure_picnic_table'] {
      text-dy: 13;
      text-fill: @man-made-icon;
    }
    [feature = 'leisure_playground'] { text-dy: 13; }
    [feature = 'leisure_sauna'] { text-dy: 11; }
    [feature = 'leisure_swimming_area'] { text-dy: 11; }
    [feature = 'leisure_water_park'] { text-dy: 11; }
    [feature = 'leisure_sports_centre'][sport = 'swimming'] { text-dy: 11; }
    [feature = 'leisure_outdoor_seating'] { text-dy: 10; }

    [feature = 'tourism_picnic_site'] {
      [access != ''][access != 'permissive'][access != 'yes'] {
        text-opacity: 0.33;
        text-halo-radius: 0;
      }
    }
  }
}
