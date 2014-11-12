module ApplicationHelper


  # form helpers
  def input_for(column, field_method = default_field_method(column))
    column = column.to_sym
    field_method = method(field_method.to_sym)
    form_group do
      label_tag(column) +
          field_method.call(column,params[column], class:'form-control')
    end
  end

  def submit_for(column)
    form_group {submit_tag column, class:'btn btn-primary'}
  end

  private
  def default_field_method(column)
    column =~ /password/ ? :password_field_tag : :text_field_tag
  end
  def form_group(&blk)
    content_tag :div, class:'form-group', &blk
  end
end
