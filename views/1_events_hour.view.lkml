view: events_hour {
  sql_table_name: "PUBLIC"."EVENTS" ;;

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
    type: count
  }
}
