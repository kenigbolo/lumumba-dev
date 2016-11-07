FactoryGirl.define do
  factory :design do
    image { SpecHelpers.any_image }
    image_desc { SecureRandom.hex }

    first_garment_design { SpecHelpers.any_image }
    first_garment_model_design { SpecHelpers.any_image }
    first_garment_print_design { SpecHelpers.any_image }
    first_garment_technical_design { SpecHelpers.any_image }
    first_garment_desc { SecureRandom.hex }

    second_garment_design { SpecHelpers.any_image }
    second_garment_model_design { SpecHelpers.any_image }
    second_garment_print_design { SpecHelpers.any_image }
    second_garment_technical_design { SpecHelpers.any_image }
    second_garment_desc { SecureRandom.hex }

    third_garment_design { SpecHelpers.any_image }
    third_garment_model_design { SpecHelpers.any_image }
    third_garment_print_design { SpecHelpers.any_image }
    third_garment_technical_design { SpecHelpers.any_image }
    third_garment_desc { SecureRandom.hex }

    for_competition true
    competition false
    user
  end
end
