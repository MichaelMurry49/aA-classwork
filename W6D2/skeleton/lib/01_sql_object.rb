require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
  hash = DBConnection.execute(<<-SQL)
  SELECT
    *
  FROM 
    cats
  LIMIT 1
  SQL
  columns = []
  hash.each { |pair| columns << pair.keys }
  columns.flatten.map(&:to_sym)
  end

  def self.finalize!
  end

  def self.table_name=(table_name)
    
  end

  def self.table_name
    self.to_s.downcase + "s"
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...
  end

  def attributes
    # ...
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
