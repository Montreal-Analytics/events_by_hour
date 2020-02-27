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
      {% assign vis_config = '@{vis_config_for_hour}' %}
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
      {% assign vis_config = '@{vis_config_for_hour}' %}
      /explore/events_by_hour_drilldown/events_hour?fields=events_hour.created_hour,events_hour.total_per_hour&f[events_hour.created_date]={{ created_date | url_encode }}%20for%201%20day&vis_config={{ vis_config | encode_uri }}&sorts=events.created_hour+asc"
    }
  }

}
