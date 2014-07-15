# coding: utf-8
require 'apress/breadcrumbs/version'
require 'active_support/concern'

module Apress
  module Breadcrumbs
    extend ActiveSupport::Concern

    included do
      helper_method :breadcrumbs
      helper_method :breadcrumbs_cache_key
      helper_method :breadcrumbs_cache_options
      helper_method :breadcrumbs_cache_wrap
    end

    protected

    def breadcrumbs
      default_breadcrumbs | (@breadcrumbs || [])
    end

    def breadcrumbs_cache(key, options = {})
      raise ArgumentError unless options.is_a?(Hash)

      @breadcrumbs_cache = {
        :key     => key.to_s + '_breadcrumbs',
        :options => options,
      }
    end

    def breadcrumbs_cache_key
      @breadcrumbs_cache ||= {}
      @breadcrumbs_cache[:key] || ''
    end

    def breadcrumbs_cache_options
      @breadcrumbs_cache ||= {}
      @breadcrumbs_cache[:options] || {}
    end

    def default_breadcrumbs
      # Если нужно, чтобы ко всем крошкам добавлялся какой-то постоянный ломоть - пожалуйста, переопределяйте
      # Но не трогайте сам breadcrumbs
      []
    end

    # Добавление крошки или крошек в конец
    # Если передан Hash - то это одна крошка, если массив, то набор Hash-крошек
    def add_breadcrumb(crumb)
      raise ArgumentError unless crumb.is_a?(Hash) || crumb.is_a?(Array)

      @breadcrumbs ||= []

      @breadcrumbs << crumb if crumb.is_a?(Hash)
      @breadcrumbs |= crumb if crumb.is_a?(Array)
    end

    # Заполнить все крошки тем чем хочу
    def set_breadcrumbs(crumbs)
      raise ArgumentError unless crumb.is_a? Array

      @breadcrumbs = crumbs
    end

    def breadcrumbs_cache_wrap(key, options, &block)
      if key.empty?
        yield
      else
        cache(key, options) do
          yield
        end
      end

      nil
    end
  end
end
