@airtransport: #8461C4; // also ferry_terminal
@barrier-icon: #3f3f3f;
@transportation-icon: #0092da;
@transportation-text: #0066ff;

#amenity-points {
  // lighten if not publicly accessible
  [feature = 'amenity_parking'],
  [feature = 'amenity_bicycle_parking'],
  [feature = 'amenity_motorcycle_parking'],
  [feature = 'amenity_parking_entrance'],
  [feature = 'amenity_charging_station'] {
    [access != ''][access != 'permissive'][access != 'yes'] {
      marker-opacity: 0.33;
    }
  }

  // parking

  [feature = 'amenity_parking']["parking" != 'street_side']["parking" != 'lane'],
  [feature = 'amenity_bicycle_parking'],
  [feature = 'amenity_motorcycle_parking'],
  [feature = 'amenity_parking_entrance'] {
    [zoom >= 14][way_pixels > 750],
    [zoom >= 17] {
      marker-fill: @transportation-icon;
      marker-clip: false;
      [feature = 'amenity_parking'] {
        marker-file: url('symbols/amenity/parking.svg');
      }
      [feature = 'amenity_bicycle_parking'] {
        marker-file: url('symbols/amenity/bicycle_parking.svg');
      }
      [feature = 'amenity_motorcycle_parking'] {
        marker-file: url('symbols/amenity/motorcycle_parking.svg');
      }
      [feature = 'amenity_parking_entrance']["parking"='underground'] {
        marker-file: url('symbols/amenity/parking_entrance_underground.svg');
      }
      [feature = 'amenity_parking_entrance']["parking"='multi-storey'] {
        marker-file: url('symbols/amenity/parking_entrance_multistorey.svg');
      }
    }
  }

  [feature = 'amenity_parking']["parking" = 'street_side'],
  [feature = 'amenity_parking']["parking" != 'lane'] {
    [zoom >= 18] {
      marker-file: url('symbols/amenity/parking_subtle.svg');
      marker-clip: false;
      marker-fill: @transportation-icon;
    }
  }

  // bus network

  [feature = 'highway_bus_stop'] {
    [zoom >= 16] {
      marker-fill: @transportation-icon;
      marker-clip: false;
      [zoom < 17] {
        marker-file: url('symbols/square.svg');
        marker-width: 6;
      }
      [zoom >= 17] {
        marker-file: url('symbols/highway/bus_stop.12.svg');
      }
    }
  }

  [feature = 'amenity_bus_station'][zoom >= 16] {
    marker-file: url('symbols/amenity/bus_station.svg');
    // use colors from SVG to allow for white background
    marker-clip: false;
  }

  // various

  [feature = 'barrier_toll_booth'],
  [feature = 'highway_traffic_signals'],
  [feature = 'amenity_charging_station'],
  [feature = 'amenity_fuel'],
  [feature = 'amenity_bicycle_rental'],
  [feature = 'amenity_boat_rental'],
  [feature = 'amenity_car_rental'],
  [feature = 'amenity_taxi'],
  [feature = 'highway_elevator'] {
    [zoom >= 16] {
      marker-fill: @transportation-icon;
      marker-clip: false;
      [feature = 'barrier_toll_booth'] {
        marker-file: url('symbols/barrier/toll_booth.svg');
      }
    }
    [zoom >= 17] {
      [feature = 'highway_traffic_signals'] {
        marker-file: url('symbols/highway/traffic_light.13.svg');
        marker-fill: #545454;
      }
      [feature = 'amenity_taxi'] {
        marker-file: url('symbols/amenity/taxi.svg');
      }
      [feature = 'amenity_charging_station'] {
        marker-file: url('symbols/amenity/charging_station.svg');
      }
      [feature = 'amenity_fuel'] {
        marker-file: url('symbols/amenity/fuel.svg');
      }
      [feature = 'amenity_bicycle_rental'] {
        marker-file: url('symbols/amenity/rental_bicycle.svg');
      }
      [feature = 'amenity_car_rental'] {
        marker-file: url('symbols/amenity/rental_car.svg');
      }
      [feature = 'amenity_boat_rental'] {
        marker-file: url('symbols/amenity/boat_rental.svg');
      }
    }
    [zoom >= 18] {
      [feature = 'highway_elevator'][zoom >= 18] {
        [access = null],
        [access = 'yes'] {
          marker-file: url('symbols/highway/elevator.12.svg');
        }
      }
    }
  }

  // ferry and aeroways

  [feature = 'amenity_ferry_terminal'][zoom >= 15] {
    marker-file: url('symbols/amenity/ferry.svg');
    marker-clip: false;
    marker-fill: @airtransport;
  }

  [feature = 'aeroway_helipad'][zoom >= 16] {
    marker-file: url('symbols/helipad.16.svg');
    marker-clip: false;
    marker-fill: @airtransport;
  }

  [feature = 'aeroway_aerodrome']['access' != 'private']['icao' != null]['iata' != null][zoom >= 10][zoom < 17],
  [feature = 'aeroway_aerodrome']['access' = 'private'][zoom >= 12][zoom < 18],
  [feature = 'aeroway_aerodrome']['icao' = null][zoom >= 12][zoom < 18],
  [feature = 'aeroway_aerodrome']['iata' = null][zoom >= 12][zoom < 18] {
    [way_pixels <= 192000],
    [way_pixels = null] {
      marker-file: url('symbols/aerodrome.12.svg');
      marker-clip: false;
      marker-fill: @airtransport;
    }
  }
}

#amenity-low-priority {
  [feature = 'barrier_bollard'],
  [feature = 'barrier_block'],
  [feature = 'barrier_log'],
  [feature = 'barrier_turnstile'] {
    [zoom >= 17] {
      marker-width: 3;
      marker-line-width: 0;
      marker-fill: #7d7c7c;
    }
    [zoom >= 18] {
      marker-width: 4;
    }
  }

  [feature = 'barrier_gate']::barrier,
  [feature = 'barrier_lift_gate']::barrier,
  [feature = 'barrier_swing_gate']::barrier,
  [feature = 'barrier_cattle_grid']::barrier,
  [feature = 'barrier_stile']::barrier,
  [feature = 'barrier_cycle_barrier']::barrier,
  [feature = 'barrier_full-height_turnstile']::barrier,
  [feature = 'barrier_kissing_gate']::barrier {
    [zoom >= 17] {
      marker-fill: @barrier-icon;
      marker-clip: false;
      [feature = 'barrier_gate'] {
        marker-file: url('symbols/barrier/gate.svg');
        marker-fill: #ffffff;
      }
      [feature = 'barrier_lift_gate'],
      [feature = 'barrier_swing_gate'] {
        marker-file: url('symbols/barrier/lift_gate.svg');
      }
      [feature = 'barrier_cattle_grid'] {
        marker-file: url('symbols/barrier/cattle_grid.svg');
      }
      [feature = 'barrier_stile'] {
        marker-file: url('symbols/barrier/stile.svg');
      }
      [feature = 'barrier_motorcycle_barrier'] {
        marker-file: url('symbols/barrier/motorcycle_barrier.svg');
      }
      [feature = 'barrier_cycle_barrier'] {
        marker-file: url('symbols/barrier/cycle_barrier.svg');
      }
      [feature = 'barrier_full-height_turnstile'] {
        marker-file: url('symbols/barrier/full-height_turnstile.svg');
      }
      [feature = 'barrier_kissing_gate'] {
        marker-file: url('symbols/barrier/kissing_gate.svg');
      }
    }
  }

  [feature = 'railway_level_crossing'][zoom >= 14]::railway,
  [feature = 'railway_crossing'][zoom >= 15]::railway{
    marker-file: url('symbols/level_crossing.svg');
    [zoom >= 16] {
      marker-file: url('symbols/level_crossing2.svg');
    }
  }
}

#text-poly-low-zoom[zoom < 10],
#text-point[zoom >= 10] {
  // parking

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
      text-face-name: @standard-font;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      [access != ''][access != 'permissive'][access != 'yes'] {
        text-opacity: 0.33;
        text-halo-radius: 0;
      }
      [feature = 'amenity_parking'] { text-dy: 9; }
      [feature = 'amenity_bicycle_parking'] { text-dy: 12; }
      [feature = 'amenity_motorcycle_parking'] { text-dy: 12; }
      [feature = 'amenity_parking_entrance'] { text-dy: 9; }
    }
  }

  // ferry and aeroways

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

  [feature = 'aeroway_helipad'][zoom >= 16] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @airtransport;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    text-dy: -10;
  }

  [feature = 'aeroway_aerodrome']['access' != 'private']['icao' != null]['iata' != null][zoom >= 11][zoom < 17],
  [feature = 'aeroway_aerodrome']['access' = 'private'][zoom >= 13][zoom < 18],
  [feature = 'aeroway_aerodrome']['icao' = null][zoom >= 13][zoom < 18],
  [feature = 'aeroway_aerodrome']['iata' = null][zoom >= 13][zoom < 18] {
    [way_pixels <= 192000],
    [way_pixels = null] {
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
  }

  [feature = 'aeroway_gate'][zoom >= 17] {
    text-name: "[ref]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: black;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  // various

  [feature = 'amenity_car_rental'],
  [feature = 'amenity_bicycle_rental'],
  [feature = 'amenity_boat_rental'],
  [feature = 'barrier_toll_booth'],
  [feature = 'highway_bus_stop'],
  [feature = 'amenity_charging_station'],
  [feature = 'amenity_fuel'],
  [feature = 'amenity_bus_station'] {
    [zoom >= 17] {
      text-name: "[name]";
      text-size: @standard-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-fill: @transportation-text;
      text-face-name: @standard-font;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      [feature = 'highway_bus_stop']         { text-dy: 9; }
      [feature = 'amenity_car_rental']       { text-dy: 10; }
      [feature = 'amenity_bicycle_rental']   { text-dy: 10; }
      [feature = 'amenity_boat_rental']      { text-dy: 13; }
      [feature = 'amenity_taxi']             { text-dy: 11; }
      [feature = 'amenity_charging_station'] { text-dy: 11; }
      [feature = 'amenity_fuel']             { text-dy: 11; }
      [feature = 'amenity_bus_station']      { text-dy: 11; }
      [feature = 'barrier_toll_booth']       { text-dy: 13; }
      [feature = 'amenity_charging_station'][access != ''][access != 'permissive'][access != 'yes'] {
            text-opacity: 0.33;
            text-halo-radius: 0;
        }
    }
  }
}

#amenity-line {
  // Ford tagging on ways
  [feature = 'highway_ford'][zoom >= 16] {
    marker-file: url('symbols/highway/ford.svg');
    marker-fill: @transportation-icon;
  }
}
