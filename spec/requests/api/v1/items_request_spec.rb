require 'rails_helper'

describe 'Items API' do
  it 'can return a list of items' do
    items = create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_success

    response_items = JSON.parse(response.body)

    expect(response_items.first["id"]).to eq(items.first.id)
    expect(response_items.first["name"]).to eq(items.first.name)
    expect(response_items.first["description"]).to eq(items.first.description)
    expect(response_items.first["image_url"]).to eq(items.first.image_url)
    expect(response_items.first["created_at"]).to eq(nil)
    expect(response_items.first["updated_at"]).to eq(nil)
  end
end