require 'rails_helper'
require 'cancan/matchers'

describe Canard::Abilities, '#users' do
  let(:acting_user) { User.create(roles: %w(user)) }
  subject(:user_ability) { Ability.new(acting_user) }

  describe 'on PayementMethod' do
    let(:payement_method) { PayementMethod.create }

    it { is_expected.to be_able_to(:manage, payement_method) }
  end
  # on PayementMethod
  describe 'on Purchases' do
    let(:purchase) { Purchase.create }

    it { is_expected.to_not be_able_to(:manage, purchase) }
  end
  # on Purchases
end
