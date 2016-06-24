# coding: utf-8
module Mongoid
  module Closeable
    extend ActiveSupport::Concern

    included do
    end

    def closed?
      closed_at.present?
    end

    def close!
      self.closed_at = Time.now
      self.save
    end

    def open!
      self.closed_at = nil
      self.save
    end
  end
end
