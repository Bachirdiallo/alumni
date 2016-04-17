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
        user = User.new
        batch_id = nil
        programme_id = nil
        campus_id = nil
        faculty_id = nil
        #import_data = self.find_or_initialize_by({})
          attr_hash = self.name.constantize::IMPORT_ENABLED.select{|a, b| b[:is_identifier] == false}
          attr_hash.each do |k, v|
            if !mapping[k].nil? and !mapping[k].blank?
              if !data.row(entry)[mapping[k].to_i].nil? && !data.row(entry)[mapping[k].to_i].blank?
                if k == "user_id".to_sym
                  user = User.find_or_initialize_by(:student_id => data.row(entry)[mapping[k].to_i])
                elsif k == "name".to_sym
                  user.name = data.row(entry)[mapping[k].to_i]
                elsif k == "last_name".to_sym
                  user.last_name = data.row(entry)[mapping[k].to_i].downcase
                elsif k == "email".to_sym
                  user.email = data.row(entry)[mapping[k].to_i].to_s
                elsif k == "alumni_key".to_sym
                  user.alumni_key = data.row(entry)[mapping[k].to_i]
                elsif k == "batch_id".to_sym
                  the_date = data.row(entry)[mapping[k].to_i].to_s
                  the_month = Date.strptime(the_date, '%Y-%m').month
                  the_year = Date.strptime(the_date, '%Y-%m').year
                  batch = Batch.find_or_create_by(:month => the_month, :year => the_year)
                  batch_id = batch.id
                elsif k == "programme_id".to_sym
                  programme = Programme.find_or_create_by(:name => data.row(entry)[mapping[k].to_i])
                  programme_id = programme.id
                elsif k == "campu_id".to_sym
                  campus = Campu.find_or_create_by(:name => data.row(entry)[mapping[k].to_i])
                  campus_id = campus.id
                elsif k == "faculty_id".to_sym
                  faculty = Faculty.find_or_create_by(:name => data.row(entry)[mapping[k].to_i])
                  faculty_id = faculty.id
                else
                  import_data[k] = data.row(entry)[mapping[k].to_i]
                end
              end
            end
          end

       if user.password.blank?
         password_length = 8
         user.password = Devise.friendly_token.first(password_length)
       end

       import_data = self.find_or_initialize_by({"batch_id" => batch_id, "programme_id" => programme_id, "campu_id" => campus_id, "faculty_id" => faculty_id})
        user.save
        import_data.user = user
        import_data.save
      end
    end
  end
end
