class Meeting < ActiveRecord::Base
	belongs_to :user
	validates :name, presence: true
	validates :start_time, presence: true
	validate :start_must_be_before_end_time

    private

      def start_must_be_before_end_time
      	if (start_time != nil && end_time != nil)
          errors.add(:start_time, "must be before end time") unless
            start_time <= end_time
        end
      end 
end
