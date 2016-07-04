module ApplicationHelper
  def humanize_boolean(boolean)
      I18n.t((!!boolean).to_s)
    end

  def pluralize_with_0(string, count)
    count <= 1 ? string :string.pluralize
  end
end
