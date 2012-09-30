#!/bin/bash

rails g migration add_page2_fields_to_CEM2030_report \
  existing_vegetation_location1:string \
  existing_vegetation_location2:string \
  existing_vegetation_location3:string \

  existing_vegetation_right_location1:string \
  existing_vegetation_right_location2:string \
  existing_vegetation_right_location3:string \

  existing_vegetation_properly_installed1:string \
  existing_vegetation_properly_installed2:string \
  existing_vegetation_properly_installed3:string \

  existing_vegetation_maintenance_necessary1:string \
  existing_vegetation_maintenance_necessary2:string \
  existing_vegetation_maintenance_necessary3:string \

  existing_vegetation_photos1:string \
  existing_vegetation_photos2:string \
  existing_vegetation_photos3:string \

  existing_vegetation_comments1:string \
  existing_vegetation_comments2:string \
  existing_vegetation_comments3:string \

  DSA_management_location1:string \
  DSA_management_location2:string \
  DSA_management_location3:string \

  DSA_management_if_created1:string \
  DSA_management_if_created2:string \
  DSA_management_if_created3:string \

  DSA_management_date_created1:datetime \
  DSA_management_date_created2:datetime \
  DSA_management_date_created3:datetime \

  DSA_management_linear_sediment1:string \
  DSA_management_linear_sediment2:string \
  DSA_management_linear_sediment3:string \

  DSA_management_rain_event1:string \
  DSA_management_rain_event2:string \
  DSA_management_rain_event3:string \

  DSA_management_if_activity1:string \
  DSA_management_if_activity2:string \
  DSA_management_if_activity3:string \

  DSA_management_last_activity1:datetime \
  DSA_management_last_activity2:datetime \
  DSA_management_last_activity3:datetime \

  DSA_management_active_duration1:integer \
  DSA_management_active_duration2:integer \
  DSA_management_active_duration3:integer \

  DSA_management_comments1;string \
  DSA_management_comments2:string \
  DSA_management_comments3:string \

  temporary_stabilization_location1:string \
  temporary_stabilization_location2;string \
  temporary_stabilization_location3:string \

  temporary_stabilization_inactive_covered1:string \
  temporary_stabilization_inactive_covered2:string \
  temporary_stabilization_inactive_covered3:string \

  temporary_stabilization_complete_coverage1:string \
  temporary_stabilization_complete_coverage2:string \
  temporary_stabilization_complete_coverage3:string \

  temporary_stabilization_visible_erosion1:string \
  temporary_stabilization_visible_erosion2:string \
  temporary_stabilization_visible_erosion3:string \

  temporary_stabilization_photos1:string \
  temporary_stabilization_photos2:string \
  temporary_stabilization_photos3:string \

  temporary_stabilization_comments1:string \
  temporary_stabilization_comments2:string \
  temporary_stabilization_comments3:string \

