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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140317165604) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "billing_codes", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "rate"
    t.integer  "period"
    t.uuid     "contract_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "billing_infos", force: true do |t|
    t.uuid     "user_account_id"
    t.uuid     "delegate_account_id"
    t.date     "start"
    t.date     "start_billing"
    t.integer  "billing_code_id"
    t.integer  "billing_code_period"
    t.integer  "delegate_billing_code_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "billing_profiles", force: true do |t|
    t.string   "stripe_customer_id"
    t.string   "card_number_last4"
    t.integer  "card_exp_month"
    t.integer  "card_exp_year"
    t.string   "card_type"
    t.uuid     "user_account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.uuid     "group_id"
    t.uuid     "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cloudsway_users", id: false, force: true do |t|
    t.string   "email",                    default: "",   null: false
    t.string   "encrypted_password",       default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.uuid     "id",                                      null: false
    t.string   "prefix"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "suffix"
    t.string   "nick_name"
    t.string   "telephone"
    t.string   "alternate_contact_number"
    t.string   "avatar"
    t.boolean  "gravatar_by_default",      default: true
    t.datetime "confirmed_at"
  end

  add_index "cloudsway_users", ["email"], name: "index_cloudsway_users_on_email", unique: true, using: :btree
  add_index "cloudsway_users", ["reset_password_token"], name: "index_cloudsway_users_on_reset_password_token", unique: true, using: :btree

  create_table "contracts", id: false, force: true do |t|
    t.string   "name"
    t.text     "description"
    t.uuid     "owner_id"
    t.integer  "rate_plan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.uuid     "id",                 null: false
    t.uuid     "parent_contract_id"
    t.string   "status"
    t.datetime "effective_date"
    t.integer  "effective_days"
  end

  create_table "conversation_to_user_accounts", force: true do |t|
    t.uuid     "conversation_id"
    t.uuid     "user_account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conversations", id: false, force: true do |t|
    t.uuid     "user_account_id"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.uuid     "id",              null: false
  end

  create_table "document_folders", id: false, force: true do |t|
    t.uuid     "owner_id"
    t.string   "name"
    t.uuid     "parent_folder_id"
    t.string   "path_from_user_root"
    t.uuid     "user_document_repository_id"
    t.string   "server_uri"
    t.boolean  "orphan"
    t.text     "description"
    t.uuid     "client_group_id"
    t.text     "json_tree"
    t.string   "remote_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.uuid     "id",                          null: false
  end

  create_table "document_repository_hosts", force: true do |t|
    t.string   "name"
    t.string   "string_uri"
    t.string   "repo_type"
    t.string   "protocol"
    t.string   "repo_credential"
    t.string   "logo_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", id: false, force: true do |t|
    t.uuid     "owner_id"
    t.string   "filename"
    t.integer  "size"
    t.text     "description"
    t.string   "mime_type"
    t.uuid     "document_folder_id"
    t.string   "resource_uri"
    t.boolean  "orphan"
    t.string   "document_file"
    t.string   "remote_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.uuid     "id",                 null: false
  end

  create_table "group_members", force: true do |t|
    t.uuid     "group_id"
    t.uuid     "user_account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", id: false, force: true do |t|
    t.uuid     "id",                                  null: false
    t.string   "name"
    t.string   "description"
    t.uuid     "owner_id"
    t.uuid     "parent_group_id"
    t.uuid     "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "group_type",      default: "General"
  end

  create_table "invitations", force: true do |t|
    t.string   "from"
    t.text     "from_id"
    t.string   "address"
    t.string   "subject"
    t.text     "content"
    t.string   "state"
    t.uuid     "invite_object_id"
    t.string   "invite_object_type"
    t.uuid     "invited_user_account_id"
    t.uuid     "invited_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoice_groups", force: true do |t|
    t.uuid     "sub_contract_id"
    t.integer  "invoice_id"
    t.string   "name"
    t.text     "description"
    t.string   "owner_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "total",           precision: 8, scale: 2
  end

  create_table "invoice_lines", force: true do |t|
    t.integer  "invoice_group_id"
    t.integer  "count"
    t.integer  "billing_code_id"
    t.integer  "billing_credit_id"
    t.uuid     "user_account_id"
    t.string   "account_name"
    t.string   "account_email"
    t.text     "billing_code_name"
    t.uuid     "delegate_account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "amount",              precision: 8, scale: 2
  end

  create_table "invoices", force: true do |t|
    t.datetime "bill_date"
    t.datetime "payment_date"
    t.uuid     "user_account_id"
    t.datetime "failed_date"
    t.text     "last_error"
    t.integer  "attempts"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "total_amount",    precision: 8, scale: 2
    t.decimal  "subtotal_amount", precision: 8, scale: 2
  end

  create_table "messages", id: false, force: true do |t|
    t.uuid     "user_account_id"
    t.string   "from"
    t.uuid     "from_id"
    t.integer  "status"
    t.text     "content"
    t.date     "date_sent"
    t.string   "to"
    t.uuid     "to_id"
    t.string   "subject"
    t.integer  "urgency"
    t.uuid     "reply_to"
    t.boolean  "is_invitation"
    t.string   "encoding"
    t.string   "folder_tag"
    t.uuid     "conversation_id"
    t.uuid     "group_id"
    t.uuid     "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.uuid     "id",              null: false
  end

  create_table "permissions", force: true do |t|
    t.uuid     "user_account_id"
    t.integer  "role_id"
    t.uuid     "team_id"
    t.uuid     "object_id"
    t.uuid     "cloudsway_context_id"
    t.string   "cloudsway_context_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plaid_webhook_antennas", force: true do |t|
    t.string   "access_token"
    t.text     "payload"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", id: false, force: true do |t|
    t.string   "name"
    t.string   "description"
    t.uuid     "owner_id"
    t.uuid     "id",          null: false
    t.string   "image_type"
    t.uuid     "image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rate_plans", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "account_limit"
    t.integer  "user_limit"
    t.integer  "file_storage_limit"
    t.integer  "admin_limit"
    t.integer  "project_limit"
    t.integer  "yearly_pricing"
    t.text     "individual_rates"
    t.integer  "owner_rate"
    t.integer  "client_rate"
    t.integer  "team_member_rate"
    t.integer  "admin_rate"
    t.integer  "prospect_rate"
    t.integer  "prospect_limit"
    t.integer  "client_limit"
    t.string   "client_plan"
    t.string   "prospect_plan"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "role_rates", force: true do |t|
    t.integer  "billing_code_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "cloudsway_context_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sharings", id: false, force: true do |t|
    t.uuid     "id",                     null: false
    t.uuid     "owner_id"
    t.integer  "share_type"
    t.uuid     "share_object_id"
    t.uuid     "target_user_account_id"
    t.uuid     "target_group_id"
    t.boolean  "transferred"
    t.uuid     "target_project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "task_lists", id: false, force: true do |t|
    t.string   "name"
    t.text     "description"
    t.uuid     "group_id"
    t.uuid     "owner_id"
    t.uuid     "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.uuid     "id",          null: false
  end

  create_table "tasks", id: false, force: true do |t|
    t.string   "name"
    t.text     "description"
    t.uuid     "related_task_id"
    t.date     "completion_date"
    t.date     "start_date"
    t.string   "label"
    t.uuid     "user_account_id"
    t.uuid     "creator"
    t.string   "status"
    t.uuid     "task_list_id"
    t.datetime "completed_at"
    t.uuid     "assigner_id"
    t.uuid     "project_id"
    t.integer  "recurring_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.uuid     "id",              null: false
  end

  create_table "user_accounts", id: false, force: true do |t|
    t.string   "email",               default: "",   null: false
    t.uuid     "cloudsway_user_id"
    t.string   "dba_name"
    t.string   "title"
    t.string   "organization"
    t.text     "description"
    t.string   "url"
    t.string   "telephone_1"
    t.string   "telephone_2"
    t.string   "fax"
    t.boolean  "locked"
    t.boolean  "default_account"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.uuid     "id",                                 null: false
    t.uuid     "contract_id"
    t.uuid     "sub_contract_id"
    t.string   "avatar"
    t.boolean  "gravatar_by_default", default: true
  end

  add_index "user_accounts", ["email"], name: "index_user_accounts_on_email", unique: true, using: :btree

  create_table "user_document_repositories", id: false, force: true do |t|
    t.uuid     "owner_id"
    t.date     "last_sync_date"
    t.integer  "document_repository_host_id"
    t.string   "user_credentials"
    t.string   "user_path"
    t.string   "user_name"
    t.integer  "connection_id"
    t.string   "connection_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.uuid     "id",                          null: false
  end

  create_table "user_settings", force: true do |t|
    t.uuid     "cloudsway_user_id"
    t.string   "settings_type"
    t.string   "key"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
