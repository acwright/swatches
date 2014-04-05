class Swatch
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :color,  type: String
  field :name,   type: String
end