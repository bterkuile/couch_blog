module ActiveModel
  class Name
    def human_plural
      @human_plural ||= (I18n.t("activemodel.models.plural.#{i18n_key.to_s.gsub('/', '.')}", :default => nil ) || human.pluralize)
    end
  end
end
