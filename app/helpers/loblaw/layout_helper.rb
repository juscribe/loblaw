# encoding: utf-8

module Loblaw
  module LayoutHelper

    def html_title
      [app_name, @page_title || action_name.humanize].join(': ')
    end

    def body_class
      a_name = action_name == 'browse' ? 'index' : action_name
      [controller_name, a_name].join('-')
    end

    def body_tag_for(*args, &block)
      opts = args.extract_options!
      (record, *) = args
      opts.merge!(class: body_class)
      opts.merge!(id: "body-#{record.class.model_name.singular}") if record
      content_tag(:body, opts) do
        capture(&block) << render(partial: 'loblaw/shared/foot')
      end
    end
    alias_method :body_tag, :body_tag_for

    def get_canvas_class
      [controller_action_name, "C_#{controller_name}",
                               "A_#{action_name}"].join(' ')
    end

    def page_header(opts = {}, &block)
      content_tag :header, class: 'page-header' do
        opts[:partial] ? render(partial: opts[:partial]) : capture(&block)
      end
    end

    def page_header_for(record, &block)
      content_tag :header, class: 'page-header' do
        block_given? ? capture(&block) :
                       render_for(record, 'header', no_wrap: true)
      end
    end

    def sidebar(opts = {}, &block)
      content_tag :aside, id: 'sidebar', class: 'span4' do
        make_section(partial: 'shared/mini_feed') +
        (opts[:partial] ? render(partial: opts[:partial]) : capture(&block))
      end
    end

    def sidebar_for(record, &block)
      content_tag :aside, id: 'sidebar', class: 'span4' do
        make_section(partial: 'shared/mini_feed') +
        (block_given? ? capture(&block) :
                        render_for(record, 'sidebar', no_wrap: true))
      end
    end

    def make_section(*args, &block)
      opts = args.extract_options!
      content_tag_unless(opts.delete(:no_wrap), :section, { class:
        ['section', *_partial_class(opts[:partial]), *opts[:class]] * ' ' }.
                                                  merge(opts.except(:partial))) do
        opts[:partial] ? render(opts.slice(:partial)) : capture(&block)
      end
    end

    def render_for(rec_or_sym, partial_path, opts = {})
      rec_or_sym.is_a?(Symbol) || rec_or_sym.is_a?(ActiveRecord::Base) or
                                                               raise ArgumentError
      partial_template, view_directory = _template_and_directory(partial_path)
      plural, singular = _names_from_input(rec_or_sym)
      view_directory ||= plural
      opts[:class] = "#{singular}-#{partial_template} #{partial_template}"
      opts[:id] = rec_or_sym.is_a?(Symbol) ? nil :
                                      [dom_id(rec_or_sym), partial_template] * '-'
      record = rec_or_sym.is_a?(Symbol) ? singular.classify.constantize.scoped : nil
      record_sym = plural == view_directory ? singular.to_sym : :object

      make_section opts do
        render partial: "#{view_directory}/#{partial_template}",
               locals: { record_sym => record, object: record }
      end
    end

    private
    def _template_and_directory(partial_path)
      partial_path.to_s.split('/').reverse
    end

    def _partial_class(partial_path)
      _template_and_directory(partial_path)[-2]
    end

    def _names_from_input(record_or_sym)
      if record_or_sym.is_a?(Symbol)
        record_or_sym.to_s.try { |name| [name.pluralize,
                                         name.pluralize.singularize] }
      else
        record_or_sym.class.model_name.try { |name| [name.plural, name.element] }
      end
    end
  end
end
