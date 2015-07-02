module Importable
  extend ActiveSupport::Concern
  included do

    def self.importing(path, mapping)

      if path.match(/.xlsx/)
        data = Roo::Spreadsheet.open(path, extension: :xlsx)
      elsif path.match(/.xls/)
        data = Roo::Spreadsheet.open(path, extension: :xls)
      elsif path.match(/.csv/)
        data = Roo::Spreadsheet.open(path, extension: :csv)
      else
        raise "Unknown file type: #{path.original_filename}"
      end

      (data.first_row + 1..data.last_row).to_a.each do |entry|
        import_data = nil

          attr_hash = self.name.constantize::IMPORT_ENABLED.select{|a, b| b[:is_identifier] == true}
          attrs = {}

          attr_hash.each do |c, v|
            attrs[c] = data.row(entry)[mapping[c].to_i] unless mapping[c].nil?
          end

        import_data = self.find_or_initialize_by(attrs)
          attr_hash = self.name.constantize::IMPORT_ENABLED.select{|a, b| b[:is_identifier] == false}
          attr_hash.each do |k, v|
            if !mapping[k].nil? and !mapping[k].blank?
              if !data.row(entry)[mapping[k].to_i].nil? && !data.row(entry)[mapping[k].to_i].blank?
                if k == "batch_id".to_sym
                  the_date = data.row(entry)[mapping[k].to_i]
                  batch = Batch.find_or_create_by(:year => Date.strptime(the_date, "%Y-%m").year, :month => Date.strptime(the_date, "%Y-%m").month)
                  import_data[k] = batch.id
                else
                  import_data[k] = data.row(entry)[mapping[k].to_i]
                end
              end
            end
          end
        import_data.save
      end
    end

  end
end
