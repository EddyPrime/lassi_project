Canard::Abilities.for(:vendor) do
  can   [:read], Review
  cannot [:create, :update, :delete, :destroy], Review
  can   [:manage], Product
  cannot [:manage], PayementMethod
  cannot [:manage], Purchase
end
