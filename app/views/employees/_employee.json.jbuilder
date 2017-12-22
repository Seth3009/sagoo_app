json.extract! employee, :id, :name, :phone, :email, :acc_no, :pob, :dob, :work_started, :work_end, :created_at, :updated_at
json.url employee_url(employee, format: :json)
