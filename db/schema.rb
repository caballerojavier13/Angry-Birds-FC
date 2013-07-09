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

ActiveRecord::Schema.define(:version => 20130709114906) do

  create_table "calificacions", :force => true do |t|
    t.integer  "valor"
    t.integer  "persona_id"
    t.integer  "noticia_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "funcionalidads", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "imagens", :force => true do |t|
    t.string   "url"
    t.datetime "updated_at", :null => false
    t.integer  "persona_id"
    t.datetime "created_at", :null => false
    t.string   "picasa_id"
  end

  create_table "noticia", :force => true do |t|
    t.string   "titulo"
    t.text     "cuerpo"
    t.datetime "updated_at", :null => false
    t.integer  "persona_id"
    t.integer  "imagen_id"
    t.datetime "created_at", :null => false
  end

  create_table "personas", :force => true do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "username"
    t.string   "salt"
    t.string   "hashed_password"
    t.string   "email"
    t.boolean  "genero"
    t.date     "fechaNacimiento"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "tipo_usuario_id"
    t.boolean  "activo"
    t.string   "codigo"
  end

  create_table "tipo_usuario_funcionalidads", :force => true do |t|
    t.integer  "tipoUsuario_id"
    t.integer  "funcionalidad"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "tipo_usuarios", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "videos", :force => true do |t|
    t.string   "titulo"
    t.string   "url"
    t.datetime "updated_at", :null => false
    t.integer  "persona_id"
    t.datetime "created_at", :null => false
  end

end
