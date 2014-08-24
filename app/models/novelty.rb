#coding: utf-8
class Novelty < ActiveRecord::Base
  attr_accessible :message

  has_many :usr_novelties

  validate :message_must_be_present

  def message_must_be_present

    self.message.gsub! /\s+/, ' '
    self.message.split(' ').join(' ')
    errors.add(' ', 'El Mensaje no puede estar en blanco.') unless message.present?
  end

end
