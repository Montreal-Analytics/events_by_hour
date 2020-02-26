connection: "snowlooker"

# include all the views
include: "/views/**/*.view"

# include the LookML dashboard
include: "/dashboards/events_per_hour.dashboard"

datagroup: events_by_hour_datagroup {
  max_cache_age: "1 hour"
}

persist_with: events_by_hour_datagroup

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
