class Task < ActiveRecord::Base
  belongs_to :project
  state_machine :state, initial: :open do
    state :open, value: 0
    state :work, value: 1
    state :qa, value: 2
    state :approved, value: 3
    state :dropped, value: 4
    
    event :to_work do
      transition [:open,:qa] => :work
    end
    event :to_qa do
      transition [:work, :dropped] => :qa
    end
    event :to_approved do
      transition :qa => :approved
    end
    event :to_dropped do
      transition [:open, :qa] => :dropped
    end
   
  end
end
