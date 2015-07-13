class ImportController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def import
    @klass = params[:klass].constantize
    @file = params[:file]

    if File.extname(@file.original_filename) == ".xlsx"
      @file_uploaded = Roo::Excelx.new(@file.path, extension: :xlsx)
    elsif File.extname(@file.original_filename) == ".xls"
      @file_uploaded = Roo::Excel.new(@file.path, extension: :xls)
    elsif File.extname(@file.original_filename) == ".csv"
      @file_uploaded = Roo::CSV.new(@file.path, extension: :csv)
    else
      raise "Unknown file type: #{@file.original_filename}"
    end

    name = params[:file].original_filename
    directory = "public/uploads"
    path = File.join(directory, name)
    File.open(path, "wb") { |f| f.write(params[:file].read) }

    @file_path = path

    header_attributes = @file_uploaded.row(1)
    @attributes_dropdown = Hash[[header_attributes].transpose].to_hash
    puts "==========#{header_attributes}"

    respond_to do |format|
      format.html { redirect_to :back}
      format.js
    end
  end

  def importing
    @model = params[:klass].camelize.constantize
    @mapping = params[params[:klass].to_sym]
    @model.importing(params[:file_path], @mapping)
    File.delete(params[:file_path])

    respond_to do |format|
      format.html { redirect_to :back, notice: "Data successfully imported."}
    end
  end

  def show

  end
end
