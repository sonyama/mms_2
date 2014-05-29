class Admin::CsvsController < ApplicationController
  def export
    CSV.generate do |csv|
      model = params[:model].constantize
      #if params[:model]=='users'
        
        csv << model.column_names
        User.all.each do |user|
          csv << user.attributes.values_at(*model.column_names)
        end
      #end
    end
    render text: CSV
  end
end