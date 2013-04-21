class InspectionEvent < ActiveRecord::Base

  scope :needs_attention, where(:completed => false)
  scope :completed, where(:completed => true)

  belongs_to :site
  accepts_nested_attributes_for :site

  attr_accessible :inspected_by,
    :inspection_date,
    :inspection_description,
    :inspection_type,
    :site_id,
    :submitted_by,
    :status,
    :completed,
    :attachment # s3 uploads via paperclip

  has_attached_file :attachment,
    :url => "http://stormsavvy.s3-website-us-east-1.amazonaws.com",
    :storage => :s3,
    :bucket => 'stormsavvy'
  # validates_attachment :attachment, presence: true, size: { less_than: 10.megabytes }

private

  def change_inspection_event_status
    self.status = "completed"
  end

end
