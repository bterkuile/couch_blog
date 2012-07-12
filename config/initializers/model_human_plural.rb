module ActiveModel
  class Name
    def human_plural
      I18n.t("activemodel.models.plural.#{underscore.gsub('/', '.')}", :default => nil ) || human.pluralize
    end
  end
end
