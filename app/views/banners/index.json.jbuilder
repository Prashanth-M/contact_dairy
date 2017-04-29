json.array!(@banners) do |banner|
  json.extract! banner, :id, :banner_image
end