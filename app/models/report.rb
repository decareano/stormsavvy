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
  

  before_update :change_report_status

private

  def change_report_status
    self.status = "completed"
  end

end
