connection: "snowlooker"

# include all the views
include: "/views/**/*.view"

datagroup: snowlooker_adam_default_datagroup {
  max_cache_age: "1 hour"
}

persist_with: snowlooker_adam_default_datagroup

########### Events drilldown ########### {

explore: events_hour {
  hidden: yes
}

explore: events_day {
  hidden: yes
}

explore: events_month {
  always_filter: {
    filters: {
      field: created_year
      value: "2019"
    }
  }
}
