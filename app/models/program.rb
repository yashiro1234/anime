class Program < ActiveRecord::Base
  belongs_to :title
  belongs_to :channel
end
