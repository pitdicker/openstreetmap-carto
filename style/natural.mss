@leisure-green: darken(@park, 60%);

#amenity-points {
  // Natural features

  [feature = 'natural_peak'][zoom >= 11] {
    marker-file: url('symbols/natural/peak.svg');
    marker-fill: @landform-color;
    marker-clip: false;
  }

  [feature = 'natural_volcano'][zoom >= 11] {
    marker-file: url('symbols/natural/peak.svg');
    marker-fill: #d40000;
    marker-clip: false;
  }

  [feature = 'natural_saddle'][zoom >= 15] {
    marker-file: url('symbols/natural/saddle.svg');
    marker-fill: @landform-color;
    marker-clip: false;
  }

  [feature = 'natural_cave_entrance'][zoom >= 15] {
    marker-file: url('symbols/natural/cave.svg');
    marker-clip: false;
  }

  [feature = 'natural_spring'][zoom >= 14] {
    marker-file: url('symbols/spring.svg');
    marker-clip: false;
  }

  [feature = 'waterway_waterfall'] {
    [zoom >= 13][height > 20],
    [zoom >= 14][height > 10],
    [zoom >= 15][name != null],
    [zoom >= 16] {
      marker-file: url('symbols/waterfall.svg');
      marker-clip: false;
      marker-fill: @water-text;
    }
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

#text-poly-low-zoom[zoom < 10],
#text-point[zoom >= 10] {
  // Natural features

  [feature = 'natural_peak'][zoom >= 13],
  [feature = 'natural_volcano'][zoom >= 13],
  [feature = 'natural_saddle'][zoom >= 15] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: darken(@landform-color, 30%);
    [feature = 'natural_volcano'] { text-fill: #d40000; }
    text-dy: 7;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [feature = 'natural_cape'][zoom >= 14] {
    text-name: "[name]";
    text-fill: #000;
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [feature = 'natural_cave_entrance'][zoom >= 15] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: darken(@man-made-icon, 20%);
    text-dy: 11;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [feature = 'natural_spring'][zoom >= 16] {
    text-name: "[name]";
    text-size: 10;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @water-text;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    text-dy: 6;
  }

  [feature = 'waterway_waterfall'] {
    [zoom >= 13][height > 20],
    [zoom >= 14][height > 10],
    [zoom >= 15][name != null],
    [zoom >= 16] {
      text-name: "[name]";
      text-size: @standard-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-fill: @water-text;
      text-dy: 10;
      text-face-name: @standard-font;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
    }
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
}
