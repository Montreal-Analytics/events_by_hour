view: events_month {
  derived_table: {
    explore_source: events_day {
      column: created_date {}
      column: max_per_hour {}
      column: average_per_hour {}
    }
  }

  dimension_group: created {
    type: time
    timeframes: [month,year]
    allow_fill: no
    sql: ${TABLE}.created_date ;;
  }

  dimension: max_total {
    hidden: yes
    type: number
    sql: ${TABLE}.max_per_hour ;;
  }

  dimension: avg_total {
    hidden: yes
    type: number
    sql: ${TABLE}.average_per_hour ;;
  }

  measure: average_per_hour {
    description: "Establishes the average number of events per hour for the selected timeframe"
    type: average
    value_format: "0"
    sql: ${avg_total} ;;
    link: {
      label: "Drill into this month ({{ created_month }})"
      url: "
      {% assign vis_config = '{
        \"type\"  : \"looker_area\",
        \"y_axes\" : [{
          \"maxValue\" : 400,
          \"minValue\" : 0
        }],
        \"show_y_axis_labels\" : \"true\",
        \"show_y_axis_ticks\" : \"true\",
        \"y_axis_tick_density\" : \"default\",
        \"y_axis_tick_density_custom\" : 5,
        \"series_types\" : {
          \"events_day.average_per_hour\" : \"area\",
          \"events_day.max_per_hour\" : \"area\"
        },
        \"point_style\" : \"circle_outline\",
        \"color_application\" : {
          \"collection_id\" : \"5591d8d1-6b49-4f8e-bafa-b874d82f8eb7\",
          \"palette_id\" : \"18d0c733-1d87-42a9-934f-4ba8ef81d736\"
          },
        \"series_colors\" : {
          \"events_day.average_per_hour\" : \"#149888\"
        },
        \"reference_lines\" : [{
          \"reference_type\" : \"line\",
          \"range_start\" : \"max\",
          \"range_end\" : \"min\",
          \"margin_top\" : \"deviation\",
          \"margin_value\" : \"mean\",
          \"margin_bottom\" : \"deviation\",
          \"label_position\" : \"right\",
          \"color\" : \"#bf101a\",
          \"line_value\" : \"250\",
          \"label\" : \"Per hour cap\"
        }],
        \"defaults_version\" : 0,
        \"width\" : 24,
        \"height\" : 20
      }'
      %}
      /explore/snowlooker_adam/events_day?fields=events_day.created_date,events_day.average_per_hour,events_day.max_per_hour&f[events_day.created_month]={{ created_month | url_encode }}%20for%201%20month&vis_config={{ vis_config | encode_uri }}&sorts=events_day.created_day+asc
      "
    }
  }

  measure: max_per_hour {
    description: "Establishes the maximum number of events per hour for the selected timeframe"
    type: max
    value_format: "0"
    sql: ${max_total} ;;
    link: {
      label: "Drill into this month ({{ created_month }})"
      url: "
      {% assign vis_config = '{
        \"type\"  : \"looker_area\",
        \"y_axes\" : [{
          \"maxValue\" : 400,
          \"minValue\" : 0
        }],
        \"show_y_axis_labels\" : \"true\",
        \"show_y_axis_ticks\" : \"true\",
        \"y_axis_tick_density\" : \"default\",
        \"y_axis_tick_density_custom\" : 5,
        \"series_types\" : {
          \"events_day.average_per_hour\" : \"area\",
          \"events_day.max_per_hour\" : \"area\"
        },
        \"point_style\" : \"circle_outline\",
        \"color_application\" : {
          \"collection_id\" : \"5591d8d1-6b49-4f8e-bafa-b874d82f8eb7\",
          \"palette_id\" : \"18d0c733-1d87-42a9-934f-4ba8ef81d736\"
          },
        \"series_colors\" : {
          \"events_day.average_per_hour\" : \"#149888\"
        },
        \"reference_lines\" : [{
          \"reference_type\" : \"line\",
          \"range_start\" : \"max\",
          \"range_end\" : \"min\",
          \"margin_top\" : \"deviation\",
          \"margin_value\" : \"mean\",
          \"margin_bottom\" : \"deviation\",
          \"label_position\" : \"right\",
          \"color\" : \"#bf101a\",
          \"line_value\" : \"250\",
          \"label\" : \"Per hour cap\"
        }],
        \"defaults_version\" : 0,
        \"width\" : 24,
        \"height\" : 20
      }'
      %}
      /explore/snowlooker_adam/events_day?fields=events_day.created_date,events_day.average_per_hour,events_day.max_per_hour&f[events_day.created_month]={{ created_month | url_encode }}%20for%201%20month&vis_config={{ vis_config | encode_uri }}&sorts=events_day.created_day+asc
      "
    }
  }
}
