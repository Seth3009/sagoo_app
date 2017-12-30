json.extract! employee_group, :id, :name, :salary, :note, :created_at, :updated_at
json.url employee_group_url(employee_group, format: :json)
