require_relative "../config/environment.rb"
require 'active_support/inflector'
require 'interactive_record.rb'
require 'pry'
class Student < InteractiveRecord

  def initialize(props={})
    @id = props[:id]
    @name = props[:name]
    @grade = props[:grade]
  end

  self.column_names.each do |col|
    attr_accessor col.to_sym
  end

  def self.find_by(hash)
    array = []
    hash.each do |key, value|
      array << key
      array << value
    end
    sql = "SELECT * FROM #{self.table_name} WHERE #{array[0]} = #{array[1]}"
    binding.pry
    DB[:conn].execute(sql)

  end
  # binding.pry
  # def self.find_by(name)
  #   self.find_by_name(name)
  # end
end
# binding.pry
