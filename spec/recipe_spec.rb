require("spec_helper")

describe(Recipe) do
  it { should have_many(:ingredients) }
end

describe(Recipe) do
  it { should have_many(:instructions) }
end

describe(Recipe) do
  it { should have_and_belong_to_many(:categories)}
end
