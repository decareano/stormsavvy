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

  :contractor_name,
  :contractor_address_1,
  :contractor_address_2,
  :contractor_city,
  :contractor_state,
  :contractor_zipcode,

  :contract_number,
  :project_identifier_number,
  :wdid_number,
  :status,

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

  :gauge_reading_post_storm
  # x_inches

  :existing_vegetation_location1
  :existing_vegetation_location2
  :existing_vegetation_location3
  # preserve_existing_vegetation

  :existing_vegetation_right_location1
  :existing_vegetation_right_location2
  :existing_vegetation_right_location3
  # preserve_existing_vegetation

  :existing_vegetation_properly_installed1
  :existing_vegetation_properly_installed2
  :existing_vegetation_properly_installed3
  # preserve_existing_vegetation

  :existing_vegetation_maintenance_necessary1
  :existing_vegetation_maintenance_necessary2
  :existing_vegetation_maintenance_necessary3
  # preserve_existing_vegetation

  :existing_vegetation_photos1
  :existing_vegetation_photos2
  :existing_vegetation_photos3
  # preserve_existing_vegetation

  :existing_vegetation_comments1
  :existing_vegetation_comments2
  :existing_vegetation_comments3
  # preserve_existing_vegetation

  :DSA_management_location1
  :DSA_management_location1
  :DSA_management_location1
  # DSA_management

  :DSA_management_if_created1
  :DSA_management_if_created2
  :DSA_management_if_created3
  # DSA_management

  :DSA_management_date_created1
  :DSA_management_date_created2
  :DSA_management_date_created3
  # DSA_management

  :DSA_management_linear_sediment1
  :DSA_management_linear_sediment2
  :DSA_management_linear_sediment3
  # DSA_management

  :rain_event_boolean1
  :rain_event_boolean2
  :rain_event_boolean3
  # DSA_management

  :DSA_activity_boolean1
  :DSA_activity_boolean2
  :DSA_activity_boolean3
  # DSA_management

  :last_activity_date1
  :last_activity_date2
  :last_activity_date3
  # DSA_management

  :active_DSA_days1
  :active_DSA_days2
  :active_DSA_days3
  # DSA_management

  :comments4
  :comments5
  :comments6
  # DSA_management

  

  before_update :change_report_status

private

  def change_report_status
    self.status = "completed"
  end

end
