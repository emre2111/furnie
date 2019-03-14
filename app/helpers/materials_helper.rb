module MaterialsHelper
  def label_for_material(material)
    labels = {
      "all" => 'All',
      "realleather" => 'Real Leather',
      "textile" => 'Textile',
      "solidwood" => 'Solid Wood',
      "syntheticleather" => 'Synthetic Leather',
      "glass" => 'Glass',
      "woodsemisolid" => 'Wood Semi Solid',
      "plastic" => 'Plastic',
      "wood" => 'Wood',
    }
    return labels[material]
  end
end
