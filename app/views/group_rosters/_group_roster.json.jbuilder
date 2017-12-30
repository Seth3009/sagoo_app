json.extract! group_roster, :id, :group_id, :roster_id, :amount, :created_at, :updated_at
json.url group_roster_url(group_roster, format: :json)
