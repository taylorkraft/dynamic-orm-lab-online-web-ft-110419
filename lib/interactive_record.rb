require_relative "../config/environment.rb"
require 'active_support/inflector'

class InteractiveRecord

  def self.table_name
    self.to_s.downcase.pluralize
  end

  def self.column_names
    DB[:conn].results_as_hash = true

    sql = "PRAGMA table_info('#{table_name}')"

    table_info = DB[:conn].execute(sql)
    column_names = []
    table_info.each do |row|
      column_names << row['name']
    end
    column_names.compact
  end

  def initialize(id: nil, name: nil, grade: nil)
    @id = id
    @name = name
    @grade = grade
  end

  def table_name_for_insert
  end
end
