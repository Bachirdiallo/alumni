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
                if k == "campuse_id".to_sym
                  sow = Campus.find_or_create_by(:name => data.row(entry)[mapping[k].to_i].upcase)
                  import_data[k] = sow.id
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
