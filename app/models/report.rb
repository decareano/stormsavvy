class Report < ActiveRecord::Base

  scope :needs_attention, where(status: "needs_attention")
  scope :completed, where(status: "completed")

  belongs_to :site

  attr_accessible :type,
  :site_information_name,
  :site_address_1,
  :site_address_2,
  :site_city,
  :site_state,
  :site_zipcode,

  :contract_number,
  :project_identifier_number,
  :wdid_number,
  :status,
  # end header fields

  # start page 1
  :contractor_name,
  :contractor_address_1,
  :contractor_address_2,
  :contractor_city,
  :contractor_state,
  :contractor_zipcode,

  :submitted_by_contractor,
  :submitted_by_date,

  :wpc_manager,
  :wpc_phone,
  :wpc_emergency_phone,

  :inspector_name,
  :inspection_date,

  :weather_condition,
  # clear / partly cloudy / cloudy

  :precipitation_condition,
  # misty/ light_rain / rain / heavy_rain / hail / snow

  :wind_condition,
  # none / less_5mph / more_5mph

  :construction_phase,
  # highway_construction / plant_establishment /
  # suspension_of_work

  :total_area,
  :total_DSA,
  :current_DSA,
  :inactive_DSA,

  :inspection_type,
  # weekly / quarterly / pre_storm / during_storm /
  # post-storm

  :time_elapsed_last_storm,
  # x_days

  :precipitation_received,
  # x_inches

  :time_storm_expected,
  # x_time, x_date

  :expected_precipitation_amount,
  # x_inches

  :time_elapsed_during_storm,
  # x_hours_minutes

  :gauge_reading_during_storm,
  # x_inches

  :time_elapsed_post_storm,
  # x_hours_minutes

  :gauge_reading_post_storm,
  # x_inches

  # start page 2
  :existing_vegetation_location1,
  :existing_vegetation_location2,
  :existing_vegetation_location3,
  # preserve_existing_vegetation

  :existing_vegetation_right_location1,
  :existing_vegetation_right_location2,
  :existing_vegetation_right_location3,
  # preserve_existing_vegetation

  :existing_vegetation_properly_installed1,
  :existing_vegetation_properly_installed2,
  :existing_vegetation_properly_installed3,
  # preserve_existing_vegetation

  :existing_vegetation_maintenance_necessary1,
  :existing_vegetation_maintenance_necessary2,
  :existing_vegetation_maintenance_necessary3,
  # preserve_existing_vegetation

  :existing_vegetation_photos1,
  :existing_vegetation_photos2,
  :existing_vegetation_photos3,
  # preserve_existing_vegetation

  :existing_vegetation_comments1,
  :existing_vegetation_comments2,
  :existing_vegetation_comments3,
  # preserve_existing_vegetation

  :DSA_management_location1,
  :DSA_management_location2,
  :DSA_management_location3,
  # DSA_management

  :DSA_management_if_created1,
  :DSA_management_if_created2,
  :DSA_management_if_created3,
  # DSA_management

  :DSA_management_date_created1,
  :DSA_management_date_created2,
  :DSA_management_date_created3,
  # DSA_management

  :DSA_management_linear_sediment1,
  :DSA_management_linear_sediment2,
  :DSA_management_linear_sediment3,
  # DSA_management

  :DSA_management_rain_event1,
  :DSA_management_rain_event2,
  :DSA_management_rain_event3,
  # DSA_management

  :DSA_management_if_activity1,
  :DSA_management_if_activity2,
  :DSA_management_if_activity3,
  # DSA_management

  :DSA_management_last_activity1,
  :DSA_management_last_activity2,
  :DSA_management_last_activity3,
  # DSA_management

  :DSA_management_active_duration1,
  :DSA_management_active_duration2,
  :DSA_management_active_duration3,
  # DSA_management

  :DSA_management_comments1,
  :DSA_management_comments2,
  :DSA_management_comments3,
  # DSA_management

  :temporary_stabilization_location1,
  :temporary_stabilization_location2,
  :temporary_stabilization_location3,
  # temporary_stabilization

  :temporary_stabilization_inactive_covered1,
  :temporary_stabilization_inactive_covered2,
  :temporary_stabilization_inactive_covered3,
  # temporary_stabilization

  :temporary_stabilization_complete_coverage1,
  :temporary_stabilization_complete_coverage2,
  :temporary_stabilization_complete_coverage3,
  # temporary_stabilization

  :temporary_stabilization_visible_erosion1,
  :temporary_stabilization_visible_erosion2,
  :temporary_stabilization_visible_erosion3,
  # temporary_stabilization

  :temporary_stabilization_photos1,
  :temporary_stabilization_photos2,
  :temporary_stabilization_photos3,
  # temporary_stabilization

  :temporary_stabilization_comments1,
  :temporary_stabilization_comments2,
  :temporary_stabilization_comments3,
  # temporary_stabilization

  # start page 3

  :linear_sediment_location1,
  :linear_sediment_location2,
  :linear_sediment_location3,
  # temporary_linear_sediment

  :correct_barrier_location1,
  :correct_barrier_location2,
  :correct_barrier_location3,
  # temporary_linear_sediment
  
  :proper_barrier_installation1,
  :proper_barrier_installation2,
  :proper_barrier_installation3,
  # temporary_linear_sediment

  :maintain_when_full1,
  :maintain_when_full2,
  :maintain_when_full3,
  # temporary_linear_sediment

  :linear_sediment_photos1,
  :linear_sediment_photos2,
  :linear_sediment_photos3,
  # temporary_linear_sediment

  :linear_sediment_comments1,
  :linear_sediment_comments2,
  :linear_sediment_comments3,
  # temporary_linear_sediment

  :inlet_location1,
  :inlet_location2,
  :inlet_location3,
  # inlet_protection
  
  :if_protected1,
  :if_protected2,
  :if_protected3,
  # inlet_protection

  :proper_protection_installation1,
  :proper_protection_installation2,
  :proper_protection_installation3,
  # inlet_protection

  :protection_requires_maintenance1,
  :protection_requires_maintenance2,
  :protection_requires_maintenance3,
  # inlet_protection

  :inlet_protection_photos1,
  :inlet_protection_photos2,
  :inlet_protection_photos3,
  # inlet_protection

  :inlet_protection_comments1,
  :inlet_protection_comments2,
  :inlet_protection_comments3,
  # inlet_protection
  
  # start page 4

  :stockpile_location1,
  :stockpile_location2,
  :stockpile_location3,
  # stockpile_management
  
  :date_stockpile_created1,
  :date_stockpile_created2,
  :date_stockpile_created3,
  # stockpile_management

  :listed_as_inactive1,
  :listed_as_inactive2,
  :listed_as_inactive3,
  # stockpile_management

  :forecast_rain_event1,
  :forecast_rain_event2,
  :forecast_rain_event3,
  # stockpile_management
  
  :if_stockpile_active1,
  :if_stockpile_active2,
  :if_stockpile_active3,
  # stockpile_management

  :days_since_active1,
  :days_since_active2,
  :days_since_active3,
  # stockpile_management

  :threedays_since_active1,
  :threedays_since_active2,
  :threedays_since_active3,
  # stockpile_management

  :stockpile_management_location1,
  :stockpile_management_location2,
  :stockpile_management_location3,
  # stockpile_management
  
  :if_stockpile_photo1,
  :if_stockpile_photo2,
  :if_stockpile_photo3,
  # stockpile_management
  
  :stockpile_action_number1,
  :stockpile_action_number2,
  :stockpile_action_number3,
  # stockpile_management
  
  :inactive_stockpile_location1,
  :inactive_stockpile_location2,
  :inactive_stockpile_location3,
  # inactive_stockpile

  :material_type1,
  :material_type2,
  :material_type3,
  # inactive_stockpile

  :if_properly_located1,
  :if_properly_located2,
  :if_properly_located3,
  # inactive_stockpile

  :if_inactive_covered1,
  :if_inactive_covered2,
  :if_inactive_covered3,
  # inactive_stockpile

  :if_perimeter_control1,
  :if_perimeter_control2,
  :if_perimeter_control3,
  # inactive_stockpile
  
  :if_maintenance_required1,
  :if_maintenance_required2,
  :if_maintenance_required3,
  # inactive_stockpile

  :inactive_comments1,
  :inactive_comments2,
  :inactive_comments3,
  # inactive_stockpile
  
  :if_inactive_photos1,
  :if_inactive_photos2,
  :if_inactive_photos3,
  # inactive_stockpile
  
  :inactive_action_number1,
  :inactive_action_number2,
  :inactive_action_number3,
  # inactive_stockpile
  
  # start page 5
  
  :if_basins_working1,
  :if_basins_working2,
  :if_basins_working3,
  # sediment_basins 

  :if_basin_filled1,
  :if_basin_filled2,
  :if_basin_filled3,
  # sediment_basins

  :if_basin_maintenance_req1,
  :if_basin_maintenance_req2,
  :if_basin_maintenance_req3,
  # sediment_basins

  :if_basin_photos1,
  :if_basin_photos2,
  :if_basin_photos3,
  # sediment_basins

  :if_basin_photos1,
  :if_basin_photos2,
  :if_basin_photos3,
  # sediment_basins
  
  :sediment_basin_comments1,
  :sediment_basin_comments2,
  :sediment_basin_comments3,
  # sediment_basins
  
  :sediment_basin_action1,
  :sediment_basin_action2,
  :sediment_basin_action3,
  # sediment_basins
  
  :tracking_location1,
  :tracking_location2,
  :tracking_location3,
  # tracking_controls
  
  :if_controls_present1,
  :if_controls_present2,
  :if_controls_present3,
  # tracking_controls
  
  :if_sediment_free1, 
  :if_sediment_free2, 
  :if_sediment_free3, 
  # tracking_controls
  
  :if_clean_plates1,
  :if_clean_plates2,
  :if_clean_plates3,
  # tracking_controls

  :if_daily_sweeping1,
  :if_daily_sweeping2,
  :if_daily_sweeping3,
  # tracking_controls

  :if_tracking_photos1, 
  :if_tracking_photos2, 
  :if_tracking_photos3, 
  # tracking_controls

  :tracking_control_comments1,
  :tracking_control_comments2,
  :tracking_control_comments3,
  # tracking_controls

  :wind_erosion_location1, 
  :wind_erosion_location2, 
  :wind_erosion_location3, 
  # wind_erosion

  :if_water_truck1,
  :if_water_truck2,
  :if_water_truck3,
  # wind_erosion

  :if_visible_dust1,
  :if_visible_dust2,
  :if_visible_dust3,
  # wind_erosion

  :if_dust_photos1,
  :if_dust_photos2,
  :if_dust_photos3,
  # wind_erosion

  :wind_erosion_comments1,
  :wind_erosion_comments2,
  :wind_erosion_comments3,
  # wind_erosion

  :wind_erosion_action1,
  :wind_erosion_action2,
  :wind_erosion_action3,
  # wind_erosion
  
  :dewatering_location1,
  :dewatering_location2,
  :dewatering_location3,
  # dewatering_operations

  :if_dewatering_active1,
  :if_dewatering_active2,
  :if_dewatering_active3,
  # dewatering_operations

  :dewatering_per_permit1,
  :dewatering_per_permit2,
  :dewatering_per_permit3,
  # dewatering_operations

  :if_dewatering_photos1,
  :if_dewatering_photos2,
  :if_dewatering_photos3,
  # dewatering_operations

  :if_dewatering_photos1,
  :if_dewatering_photos2,
  :if_dewatering_photos3,
  # dewatering_operations

  :dewatering_comments1,
  :dewatering_comments2,
  :dewatering_comments3,
  # dewatering_operations

  :dewatering_action1,
  :dewatering_action2,
  :dewatering_action3,
  # dewatering_operations

  # start page 6
  
  :stream_crossing_location1,
  :stream_crossing_location2,
  :stream_crossing_location3,
  # temporary_stream_crossing

  :constructed_per_plan1,
  :constructed_per_plan2,
  :constructed_per_plan3,
  # temporary_stream_crossing

  :crossing_compliance1,
  :crossing_compliance2,
  :crossing_compliance3,
  # temporary_stream_crossing

  :crossing_maintenance_required1,
  :crossing_maintenance_required2,
  :crossing_maintenance_required3,
  # temporary_stream_crossing

  :if_crossing_photos1,
  :if_crossing_photos2,
  :if_crossing_photos3,
  # temporary_stream_crossing

  :crossing_photos1,
  :crossing_photos2,
  :crossing_photos3,
  # temporary_stream_crossing

  :crossing_action1,
  :crossing_action2,
  :crossing_action3,
  # temporary_stream_crossing

  :safely_stored1,
  :safely_stored2,
  :safely_stored3,
  # material_storage

  :protected_from_flow1,
  :protected_from_flow2,
  :protected_from_flow3,
  # material_storage

  :bagged_and_boxed1,
  :bagged_and_boxed2,
  :bagged_and_boxed3,
  # material_storage

  :free_from_leaks1,
  :free_from_leaks2,
  :free_from_leaks3,
  # material_storage

  :if_inventory_updated1,
  :if_inventory_updated2,
  :if_inventory_updated3,
  # material_storage

  :if_secondary_containment1,
  :if_secondary_containment2,
  :if_secondary_containment3,
  # material_storage

  :if_storage_photos1,
  :if_storage_photos2,
  :if_storage_photos3,
  # material_storage

  :stored_safely1,
  :stored_safely2,
  :stored_safely3,
  # waste_management

  :secured_safely1,
  :secured_safely2,
  :secured_safely3,
  # waste_management

  :if_adequate_capacity1,
  :if_adequate_capacity2,
  :if_adequate_capacity3,
  # waste_management

  :if_leaks_checked1,
  :if_leaks_checked2,
  :if_leaks_checked3,
  # waste_management

  :if_leaks_found1,
  :if_leaks_found2,
  :if_leaks_found3,
  # waste_management

  :waste_photos1,
  :waste_photos2,
  :waste_photos3,
  # waste_management

  :waste_comment1,
  :waste_comment2,
  :waste_comment3,
  # waste_management

  :waste_action1,
  :waste_action2,
  :waste_action3,
  # waste_management
  
  :properly_located1,
  :properly_located2,
  :properly_located3,
  # project_specific

  :properly_installed1,
  :properly_installed2,
  :properly_installed3,
  # project_specific

  :if_maintenance_required1,
  :if_maintenance_required2,
  :if_maintenance_required3,
  # project_specific

  :if_bmp_photo1,
  :if_bmp_photo2,
  :if_bmp_photo3,
  # project_specific
  
  :project_specific_action1,
  :project_specific_action2,
  :project_specific_action3,
  # project_specific

  :project_specific_comment1,
  :project_specific_comment2,
  :project_specific_comment3,
  # project_specific

  :properly_located4,
  :properly_located5,
  :properly_located6,
  # project_specific

  :properly_installed4,
  :properly_installed5,
  :properly_installed6,
  # project_specific

  :if_maintenance_required4,
  :if_maintenance_required5,
  :if_maintenance_required6,
  # project_specific

  :if_bmp_photo4,
  :if_bmp_photo5,
  :if_bmp_photo6,
  # project_specific

  :project_specific_comment4,
  :project_specific_comment5,
  :project_specific_comment6,
  # project_specific

  :project_specific_action4,
  :project_specific_action5,
  :project_specific_action6,
  # project_specific

  before_update :change_report_status

private

  def change_report_status
    self.status = "completed"
  end

end
