json.extract! appointment, :id, :coach_id, :availability_block_id, :date, :client_name, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
