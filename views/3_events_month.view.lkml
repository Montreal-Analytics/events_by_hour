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
      {% assign vis_config = '@{vis_config_for_day}' %}
      /explore/events_by_hour_drilldown/events_day?fields=events_day.created_date,events_day.average_per_hour,events_day.max_per_hour&f[events_day.created_month]={{ created_month | url_encode }}%20for%201%20month&vis_config={{ vis_config | encode_uri }}&sorts=events_day.created_day+asc
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
      {% assign vis_config = '@{vis_config_for_day}'%}
      /explore/events_by_hour_drilldown/events_day?fields=events_day.created_date,events_day.average_per_hour,events_day.max_per_hour&f[events_day.created_month]={{ created_month | url_encode }}%20for%201%20month&vis_config={{ vis_config | encode_uri }}&sorts=events_day.created_day+asc
      "
    }
  }
}
