require 'axlsx'

# Creates an excel file for confirm status of users
class ExportService
  def self.generate_excel
    # Create a new Excel workbook
    p = Axlsx::Package.new
    workbook = p.workbook

    # Add a worksheet
    workbook.add_worksheet(name: "Users") do |sheet|
      sheet.add_row ["ID", "Email", "Confirm Status"]

      # Add user info to the worksheet
      User.find_each do |user|
        sheet.add_row [user.id, user.email, user.confirmed? ? "Confirmed" : "Not Confirmed"]
      end
    end

    # Save the workbook
    file_path = "#{Rails.root}/tmp/users_#{Time.now.strftime('%Y%m%d')}.xlsx"
    p.serialize(file_path)

    file_path
  end
end
