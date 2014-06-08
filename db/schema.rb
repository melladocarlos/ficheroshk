# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140602231941) do

  create_table "actividads", :force => true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "asistencia", :force => true do |t|
    t.date     "fecha"
    t.integer  "ficha_id"
    t.integer  "horas"
    t.date     "mes_ano"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cargos", :force => true do |t|
    t.text     "descripcion"
    t.string   "nombre"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "eventos", :force => true do |t|
    t.date     "fecha"
    t.text     "descripcion"
    t.string   "nombre"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "examen", :force => true do |t|
    t.integer  "ficha_id"
    t.date     "fecha"
    t.text     "detalle"
    t.string   "pagado"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "fichas", :force => true do |t|
    t.string   "nombre"
    t.string   "rut"
    t.date     "fechanacimiento"
    t.integer  "local_id"
    t.integer  "tipo_id"
    t.integer  "lugar_id"
    t.integer  "actividad_id"
    t.string   "email"
    t.string   "fono"
    t.string   "password"
    t.string   "password_confirmation"
    t.integer  "cargo_id"
    t.string   "password_digest"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "locals", :force => true do |t|
    t.string   "nombre"
    t.string   "ubicacion"
    t.string   "fono"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lugars", :force => true do |t|
    t.string   "nombre"
    t.string   "ubicacion"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pagos", :force => true do |t|
    t.integer  "ficha_id"
    t.date     "fecha"
    t.integer  "valor"
    t.text     "detalle"
    t.date     "mes_ano"
    t.integer  "tipo_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "recibo_file_name"
    t.string   "recibo_content_type"
    t.integer  "recibo_file_size"
    t.datetime "recibo_updated_at"
  end

  create_table "participacions", :force => true do |t|
    t.integer  "ficha_id"
    t.date     "fecha"
    t.integer  "evento_id"
    t.text     "detalle"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tipos", :force => true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "password_confirmation"
    t.string   "password_digest"
    t.string   "password_hash"
    t.string   "password_salt"
    t.integer  "ficha_id"
    t.integer  "cargo_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

end
