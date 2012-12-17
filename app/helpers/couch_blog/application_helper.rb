module CouchBlog
  module ApplicationHelper

    # Helper for empty index result
    def empty_result model
      t('couch_blog.general.empty_result', models: model.model_name.human_plural)
    end

    def title(action, model)
      if model.present?
        @current_model = model
      end
      content_for :title do 
        if action.is_a?(Symbol)
          if action == :index
            t("couch_blog.action.#{action}.title", models: model.model_name.human_plural)
          else
            t("couch_blog.action.#{action}.title", model: model.model_name.human)
          end
        else
          action
        end
      end
    end

    def attribute(attr)
      if @current_model.present?
        @current_model.human_attribute_name(attr)
      else
        attr.to_s
      end
    end

    def page_link(to, options = {})
      @page_links ||= []
      if to.is_a?(Symbol)
        url = couch_blog.url_for({action: to, only_path: true})
        if @current_model.present?
          if to == :index
            @page_links << link_to(t("couch_blog.action.#{to}.link", models: @current_model.model_name.human_plural), url, options.reverse_merge(class: 'btn'))
          else
            @page_links << link_to(t("couch_blog.action.#{to}.link", model: @current_model.model_name.human), url, options.reverse_merge(class: 'btn btn-info'))
          end
        else
          @page_links << link_to(t("couch_blog.action.#{to}.link"), url, options)
        end
      else
        @page_links << to
      end

      # Return last added link
      @page_links.last + '&nbsp;'.html_safe
    end

    def page_links(options = {}, &block)
      content_for :page_links, &block
    end

    def table_edit(record)
      link_to t('couch_blog.action.edit.table_link'), [couch_blog, :edit, :admin, record], class: 'btn btn-warning'
    end

    def table_destroy(record)
      link_to t('couch_blog.action.destroy.table_link'), [couch_blog, :admin, record], method: :delete, confirm: are_you_sure?, class: 'btn btn-danger'
    end

    def if_cmtool_present(options = {}, &block)
      if defined?(Cmtool)
        capture(&block)
      end
    end

    def are_you_sure?
      t('couch_blog.general.are_you_sure')
    end

    def warnings
      []
    end
  end
end
