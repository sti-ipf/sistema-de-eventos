module ApplicationHelper

  def generate_status_button(paper)
    if paper.status == Paper::APPROVED
      return link_to image_tag('icons/checked.png', :mouseover => 'icons/unchecked_hover.png', :alt => I18n.t('paper.unapproved'), :title => I18n.t('paper.unapproved')),
        update_paper_status_path(:id => paper.id, :status => 0), :remote => true
    else
      return link_to image_tag('icons/unchecked.png', :mouseover => 'icons/checked_hover.png', :alt => I18n.t('paper.approved'), :title => I18n.t('paper.approved')),
      update_paper_status_path(:id => paper.id, :status => 1), :remote => true
    end
  end
  
end
