json.extract! item, :id, :content, :position_x, :position_y, :width, :height, :file, :link, :board_id, :created_at, :updated_at
json.url item_url(item, format: :json)
