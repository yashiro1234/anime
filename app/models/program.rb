class Program < ActiveRecord::Base
  belongs_to :title
  belongs_to :channel,
             foreign_key: "ch_gid"
end
