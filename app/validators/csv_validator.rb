class CsvValidator < ActiveModel::EachValidator
  require 'csv'
  def validate_each(record, attribute, value)
    begin
      # TODO this is not going to scale for huge csv files
      csv = CSV.read(value.path)
    rescue ArgumentError
      record.errors[attribute] << (options[:message] || "invalid csv file")
    end
  end
end
