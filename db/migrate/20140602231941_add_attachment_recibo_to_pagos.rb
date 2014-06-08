class AddAttachmentReciboToPagos < ActiveRecord::Migration
  def self.up
    change_table :pagos do |t|
      t.attachment :recibo
    end
  end

  def self.down
    drop_attached_file :pagos, :recibo
  end
end
