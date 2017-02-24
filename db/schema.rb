# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170222055843) do

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "password_digest"
    t.integer  "status"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "agentapps", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "applyname"
    t.string   "phonenumber"
    t.string   "summary"
    t.integer  "status"
    t.string   "remarks"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "banners", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "status"
    t.string   "link"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "banner_file_name"
    t.string   "banner_content_type"
    t.integer  "banner_file_size"
    t.datetime "banner_updated_at"
  end

  create_table "busines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.float    "salessum",                   limit: 24
    t.string   "phonenumber"
    t.datetime "registertime"
    t.string   "jianjie"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "businelicense_file_name"
    t.string   "businelicense_content_type"
    t.integer  "businelicense_file_size"
    t.datetime "businelicense_updated_at"
    t.string   "businelogo_file_name"
    t.string   "businelogo_content_type"
    t.integer  "businelogo_file_size"
    t.datetime "businelogo_updated_at"
    t.string   "busineaddre"
  end

  create_table "busines_classifications", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "busine_id",         null: false
    t.integer "classification_id", null: false
  end

  create_table "businespictures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "busine_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "businesssettleds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "phonenumber"
    t.string   "summary"
    t.integer  "status"
    t.string   "remarks"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "carnumbers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "number"
    t.integer  "isselect"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "classname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classifications_wares", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "classification_id", null: false
    t.integer "ware_id",           null: false
  end

  create_table "examines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.float    "amount",     limit: 24
    t.integer  "status"
    t.string   "ramarks"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "favorites", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "ware_id"
    t.integer  "user_id"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "integraldetaileds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "integralnumber"
    t.integer  "status"
    t.string   "remarks"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "malls", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "mallname"
    t.string   "descripte"
    t.string   "telephone"
    t.string   "storerecruit"
    t.string   "customerservice"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "malllogo_file_name"
    t.string   "malllogo_content_type"
    t.integer  "malllogo_file_size"
    t.datetime "malllogo_updated_at"
  end

  create_table "menbersettleds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "settledname"
    t.string   "summary"
    t.string   "phonenumber"
    t.integer  "status"
    t.string   "ramarks"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "menbersettledpicture_file_name"
    t.string   "menbersettledpicture_content_type"
    t.integer  "menbersettledpicture_file_size"
    t.datetime "menbersettledpicture_updated_at"
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "ware_id"
    t.integer  "user_id"
    t.float    "number",       limit: 24
    t.float    "sum",          limit: 24
    t.float    "userintegral", limit: 24
    t.integer  "state"
    t.float    "fare",         limit: 24
    t.string   "ramarks"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "powers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "powername"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "powers_roles", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "power_id", null: false
    t.integer "role_id",  null: false
  end

  create_table "receiptadds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "shouhuoname"
    t.string   "address"
    t.string   "phonenumber"
    t.integer  "isselect"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "admin_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "consumebase",   limit: 24
    t.float    "memberratio",   limit: 24
    t.float    "agentratio",    limit: 24
    t.float    "refereeratio",  limit: 24
    t.float    "consumemin",    limit: 24
    t.float    "consumemax",    limit: 24
    t.float    "consumecash",   limit: 24
    t.float    "withdrawmin",   limit: 24
    t.float    "withdrawmax",   limit: 24
    t.float    "withdrawratio", limit: 24
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "shoppingcars", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "ware_id"
    t.integer  "user_id"
    t.string   "spec"
    t.float    "number",     limit: 24
    t.string   "remarks"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "tests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "referee_id"
    t.string   "name"
    t.string   "username"
    t.string   "password_digest"
    t.integer  "sex"
    t.string   "phonenumber"
    t.datetime "birthday"
    t.integer  "age"
    t.string   "email"
    t.string   "wecharnumber"
    t.string   "refereenumber"
    t.string   "menber"
    t.string   "localarea"
    t.integer  "state"
    t.float    "canuserebate",             limit: 24
    t.datetime "codetime"
    t.string   "code"
    t.float    "rebate",                   limit: 24
    t.float    "summationamount",          limit: 24
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "headpicture_file_name"
    t.string   "headpicture_content_type"
    t.integer  "headpicture_file_size"
    t.datetime "headpicture_updated_at"
    t.float    "alreadamount",             limit: 24
    t.float    "arrear",                   limit: 24
    t.float    "backintegration",          limit: 24
  end

  create_table "warelabels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "waretype_id"
    t.string   "labelname"
    t.float    "increaseprice", limit: 24
    t.integer  "isselect"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "warepictures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "wareid"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "ware_id"
  end

  create_table "wares", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "classification_id"
    t.string   "ware"
    t.float    "price",                    limit: 24
    t.float    "discountprice",            limit: 24
    t.integer  "salevolume"
    t.string   "describe"
    t.float    "stock",                    limit: 24
    t.float    "freight",                  limit: 24
    t.float    "discount",                 limit: 24
    t.float    "baseprice",                limit: 24
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "warepicture_file_name"
    t.string   "warepicture_content_type"
    t.integer  "warepicture_file_size"
    t.datetime "warepicture_updated_at"
    t.integer  "isnew"
  end

  create_table "waretypes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "ware_id"
    t.string   "typename"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "withdraws", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.float    "amount",     limit: 24
    t.integer  "status"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

end
