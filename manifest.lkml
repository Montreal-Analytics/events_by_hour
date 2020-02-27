project_name: "events_by_hour"

constant: vis_config_for_day {
  value: "{
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
    }"
}

constant: vis_config_for_hour {
  value: "{
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
      }"
}
