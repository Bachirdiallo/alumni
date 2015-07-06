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
          import_data = self.find_or_initialize_by(attrs)
          attr_hash.each do |c, v|
            if !mapping[c].nil? and !mapping[c].blank?
              if !data.row(entry)[mapping[c].to_i].nil? && !data.row(entry)[mapping[c].to_i].blank?
                if c == "user_id".to_sym
                  user = User.find_or_create_by(:student_id => data.row(entry)[mapping[c].to_i], :email => "md@mail.com", :encrypted_password => "password")
                  import_data[c] = user.id
                end
              end
            end
          end

        import_data = self.find_or_initialize_by(attrs)
          attr_hash = self.name.constantize::IMPORT_ENABLED.select{|a, b| b[:is_identifier] == false}
          attr_hash.each do |k, v|
            if !mapping[k].nil? and !mapping[k].blank?
              if !data.row(entry)[mapping[k].to_i].nil? && !data.row(entry)[mapping[k].to_i].blank?
                if k == "batch_id".to_sym
                  the_date = data.row(entry)[mapping[k].to_i].to_s
                  the_month =  Date.strptime(the_date, '%Y-%m').month
                  the_year = Date.strptime(the_date, '%Y-%m').year
                  batch = Batch.find_or_create_by(:month => the_month, :year => the_year)
                  import_data[k] = batch.id
                elsif k == "programme_id".to_sym
                  programme = Programme.find_or_create_by(:name => data.row(entry)[mapping[k].to_i])
                  import_data[k] = programme.id
                elsif k == "campu_id".to_sym
                  campus = Campu.find_or_create_by(:name => data.row(entry)[mapping[k].to_i])
                  import_data[k] = campus.id
                elsif k == "faculty_id".to_sym
                  faculty = Faculty.find_or_create_by(:name => data.row(entry)[mapping[k].to_i])
                  import_data[k] = faculty.id
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
