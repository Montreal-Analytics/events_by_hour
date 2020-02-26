view: events_day {
  derived_table: {
    explore_source: events_hour {
      column: created_hour {}
      column: total_per_hour {}
    }
  }

  dimension_group: created {
    type: time
    timeframes: [date,month]
    allow_fill: no
    sql: ${TABLE}.created_hour ;;
  }

  dimension: total_per_hour {
    hidden: yes
    type: number
    sql: ${TABLE}.total_per_hour ;;
  }

  measure: average_per_hour {
    description: "Establishes the average number of events per hour for the selected timeframe"
    type: average
    value_format: "0"
    sql: ${total_per_hour} ;;
    link: {
      label: "Drill into this day ({{ created_date }})"
      url: "
      {% assign vis_config = '{
      \"type\"  : \"looker_area\",
      \"point_style\" : \"circle_outline\",
      \"color_application\" : {
        \"collection_id\" : \"5591d8d1-6b49-4f8e-bafa-b874d82f8eb7\",
        \"palette_id\" : \"18d0c733-1d87-42a9-934f-4ba8ef81d736\"
      },
      \"series_colors\" : {
        \"events_hour.total_per_hour\" : \"#149888\"
      },
      \"y_axes\" : [{
      \"maxValue\" : 400,
      \"minValue\" : 0
      }],
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
      \"label\" : \"Per second cap\"
      }]
      }'
      %}
      /explore/events_by_hour_drilldown/events_hour?fields=events_hour.created_hour,events_hour.total_per_hour&f[events_hour.created_date]={{ created_date | url_encode }}%20for%201%20day&vis_config={{ vis_config | encode_uri }}&sorts=events.created_hour+asc"
    }
  }

  measure: max_per_hour {
    description: "Establishes the maximum number of events per hour for the selected timeframe"
    type: max
    value_format: "0"
    sql: ${total_per_hour} ;;
    link: {
      label: "Drill into this day ({{ created_date }})"
      url: "
      {% assign vis_config = '{
      \"type\"  : \"looker_area\",
      \"point_style\" : \"circle_outline\",
      \"color_application\" : {
        \"collection_id\" : \"5591d8d1-6b49-4f8e-bafa-b874d82f8eb7\",
        \"palette_id\" : \"18d0c733-1d87-42a9-934f-4ba8ef81d736\"
      },
      \"series_colors\" : {
        \"events_hour.total_per_hour\" : \"#149888\"
      },
      \"y_axes\" : [{
      \"maxValue\" : 400,
      \"minValue\" : 0
      }],
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
      \"label\" : \"Per second cap\"
      }]
      }'
      %}
      /explore/events_by_hour_drilldown/events_hour?fields=events_hour.created_hour,events_hour.total_per_hour&f[events_hour.created_date]={{ created_date | url_encode }}%20for%201%20day&vis_config={{ vis_config | encode_uri }}&sorts=events.created_hour+asc"
    }
  }

}
