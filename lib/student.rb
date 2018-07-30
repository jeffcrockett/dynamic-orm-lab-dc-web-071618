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

  def self.find_by(attr: value)
    sql = "SELECT * FROM ? WHERE ? = ?"
    binding.pry
    DB[:conn].execute(sql, self.table_name, attr, value)

  end
  # binding.pry
  # def self.find_by(name)
  #   self.find_by_name(name)
  # end
end
# binding.pry
