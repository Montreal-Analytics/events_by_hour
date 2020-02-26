- dashboard: events_per_hour
  title: events per hour
  layout: newspaper
  elements:
  - title: events per hour
    name: events per hour
    model: snowlooker_adam
    explore: events_month
    type: looker_line
    fields: [events_month.created_month, events_month.average_per_hour, events_month.max_per_hour]
    filters:
      events_month.created_year: '2019'
    sorts: [events_month.created_month desc]
    limit: 500
    query_timezone: Canada/Eastern
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
        reverse: false
    series_types:
      events_month.average_per_hour: area
      events_month.max_per_hour: area
    series_colors:
      events_month.average_per_hour: "#149888"
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#ff1910",
        line_value: '250', label: per hour cap}]
    defaults_version: 1
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 10
