module Projects
  include ApplicationHelper
  def create_projects(new_project_params)
    errors = []
    project_name = new_project_params[:name]
    project_description = new_project_params[:description]

    if project_name.blank?
      errors << custom_error(103,"please enter a valid project")

    end

    if errors.present?
      return errors
    end

    project = Project.new(project_strong_params)
    project.save
    return errors

  end

  private

  def project_strong_params
    params.require(:project).permit(:name, :description)
  end
end