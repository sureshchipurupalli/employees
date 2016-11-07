class Employee < ActiveRecord::Base

  validates_presence_of :name, :dateofbirth, :age, :designation, :mobile
  validates_uniqueness_of :name ,:message => 'already exists'
  validates_numericality_of   :mobile,
                              :only_integer => true,:message => ' number must be only integers',
                              :allow_nil => false
  validates_inclusion_of  :age,
                          :in => 1..100,:message => ' must be between 1 to 100'
  validates_length_of :mobile,
                      :minimum => 10 ,         # more than 8 characters
                      :maximum => 10 ,:message => ' number must have 10 numbers'


  def self.to_csv(options={})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |employee|
        csv << employee.attributes.values_at(*column_names)

      end

    end
end

end
