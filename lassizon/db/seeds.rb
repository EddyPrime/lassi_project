# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
    {
        name: 'Paolo',
        surname: 'User',
        data: Date.today.to_s,
        roles_mask: 0,
        email: 'paolo.user@test.it',
        password: '12345678'
        #encrypted_password: User.new(password: '12345678').encrypted_password
    },
    {
        name: 'Francesca',
        surname: 'User',
        data: Date.today.to_s,
        roles_mask: 0,
        email: 'francesca.user@test.it',
        password: '12345678'
    },
    {
        name: 'Ambrogio',
        surname: 'User',
        data: Date.today.to_s,
        roles_mask: 0,
        email: 'ambrogio.user@test.it',
        password: '12345678'
    },
    {
        name: 'Romeo',
        surname: 'Vendor',
        roles_mask: 1,
        data: Date.today.to_s,
        email: 'romeo.vendor@test.it',
        password: '12345678'
    },
    {
        name: 'Giulietta',
        surname: 'Vendor',
        roles_mask: 1,
        data: Date.today.to_s,
        email: 'giulietta.vendor@test.it',
        password: '12345678'
    },
    {
        name: 'MatEdo',
        surname: 'Admin',
        roles_mask: 2,
        data: Date.today.to_s,
        email: 'matedo.admin@test.it',
        password: 'admin1234'
    }
])

products = Product.create([
    {
        name: 'Ferrari Enzo',
        product_type: 'Auto Supercar',
        price: '2345678',
        user_id: User.where(roles_mask: 1).first.id
    },
    {
        name: 'Lamborghini Aventador',
        product_type: 'Auto Supercar',
        price: '1230000',
        user_id: User.where(roles_mask: 1).first.id
    },
    {
        name: 'Pagani Zonda R',
        product_type: 'Auto Supercar',
        price: '789000',
        user_id: User.where(roles_mask: 1).first.id
    },
    {
        name: 'Pirelli 21 pollici',
        product_type: 'Pneumatici',
        price: '200',
        user_id: User.where(roles_mask: 1).first.id
    },
    {
        name: 'Bridgestone 17 pollici invernali',
        product_type: 'Pneumatici',
        price: '130',
        user_id: User.where(roles_mask: 1).first.id
    },
    {
        name: 'iPhone',
        product_type: 'Smarphone',
        price: '1500',
        user_id: User.where(roles_mask: 1).last.id
    },
    {
        name: 'Galaxy 9',
        product_type: 'Smartphone',
        price: '1000',
        user_id: User.where(roles_mask: 1).last.id
    }
])

payement_methods = PayementMethod.create([
    {
        number: '1234',
        user_id: User.where(roles_mask: 0).first.id
    },
    {
        number: '9876',
        user_id: User.where(email: 'francesca.user@test.it').first.id
    },
    {
        number: '5432',
        user_id: User.where(email: 'francesca.user@test.it').first.id
    }
])

purchases = Purchase.create([
    {
        price: '2345678',
        user_id: User.where(roles_mask: 0).first.id,
        product_id: Product.where(name: 'Ferrari Enzo').first.id,
        description: Product.where(name: 'Ferrari Enzo').first.name + ' ' + Product.where(name: 'Ferrari Enzo').first.product_type
    },
    {
        price: '220',
        user_id: User.where(roles_mask: 0).first.id,
        product_id: Product.where(name: 'Pirelli 21 pollici').first.id,
        description: Product.where(name: 'Pirelli 21 pollici').first.name + ' ' + Product.where(name: 'Pirelli 21 pollici').first.product_type
    },
    {
        price: '1225000',
        user_id: User.where(email: 'francesca.user@test.it').first.id,
        product_id: Product.where(name: 'Lamborghini Aventador').first.id,
        description: Product.where(name: 'Lamborghini Aventador').first.name + ' ' + Product.where(name: 'Lamborghini Aventador').first.product_type
    },
    {
        price: '184.97',
        user_id: User.where(email: 'francesca.user@test.it').first.id,
        product_id: Product.where(name: 'Pirelli 21 pollici').first.id,
        description: Product.where(name: 'Pirelli 21 pollici').first.name + ' ' + Product.where(name: 'Pirelli 21 pollici').first.product_type
    },
    {
        price: '1270',
        user_id: User.where(email: 'francesca.user@test.it').first.id,
        product_id: Product.where(name: 'iPhone').first.id,
        description: Product.where(name: 'iPhone').first.name + ' ' + Product.where(name: 'iPhone').first.product_type
    }
])

reviews = Review.create([
    {
        value: '5.0',
        user_id: User.where(roles_mask: 0).first.id,
        product_id: Product.where(name: 'Ferrari Enzo').first.id
    },
    {
        value: '4.0',
        user_id: User.where(email: 'francesca.user@test.it').first.id,
        product_id: Product.where(name: 'Pirelli 21 pollici').first.id
    },
    {
        value: '2.0',
        user_id: User.where(email: 'francesca.user@test.it').first.id,
        product_id: Product.where(name: 'Pirelli 21 pollici').first.id
    },
    {
        value: '4.4',
        user_id: User.where(email: 'francesca.user@test.it').first.id,
        product_id: Product.where(name: 'iPhone').first.id
    }
])