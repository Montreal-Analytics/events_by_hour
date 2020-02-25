view: events_hour {
  derived_table: {
    sql:  select  DATE_TRUNC('hour', created_at) as created_at,
                  count(id) as total
          from "PUBLIC"."EVENTS"
          group by 1 ;;
  }

  dimension: total {
    primary_key: yes
    type: number
    sql: ${TABLE}."TOTAL" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      hour,
      date,
      month,
      year
    ]
    sql: ${TABLE}."CREATED_AT" ;;
  }

  measure: total_per_hour {
    type: sum
    sql: ${total} ;;
  }

  measure: max_per_hour {
    description: "Establishes the maximum number of messages sent per second for the selected timeframe (day, hours, minutes or seconds)"
    type: max
    value_format_name: decimal_0
    sql: ${total} ;;
  }

  measure: average_per_hour {
    description: "Establishes the average number of messages sent per second for the selected timeframe (day, hours, minutes or seconds)"
    type: average
    value_format_name: decimal_0
    sql: ${total} ;;
  }

}
