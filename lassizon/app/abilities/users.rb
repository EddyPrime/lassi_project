Canard::Abilities.for(:user) do
  can [:manage], PayementMethod
  can [:read, :create], Review
  can [:read], Product
  cannot [:create, :update, :delete, :destroy], Product
  can [:read, :create], Purchase
  cannot [:update, :delete, :destroy], Purchase
end
