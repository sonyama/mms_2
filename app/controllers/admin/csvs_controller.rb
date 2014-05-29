class Admin::CsvsController < ApplicationController
  
  def export
    model = params[:model].constantize
    send_data export_csv(model), filename: "#{model.table_name}.csv"    
  end
  def import
    model = params[:model].constantize
    file  = params[:file]
    if file.nil?
      flash[:error] = "Please choose file to import."
    else
      import_csv model, file
      flash[:success] = "Import completed."
    end
    redirect_to admin_csvs_path
  end
  private
    def import_csv model, file
      CSV.foreach(file.path, headers: true) do |row|
        records = model.where id: row[0]
        model.create row.to_hash if records.empty?
      end
    end
    def export_csv model
      CSV.generate do |csv|
        csv << model.column_names
        model.all.each do |item|
          csv << item.attributes.values_at(*model.column_names)
        end
      end
    end
end