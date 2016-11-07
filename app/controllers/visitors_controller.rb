class VisitorsController < ApplicationController
  def index
    @user=User.all
    @project_names = Project.all
    @task_names = Task.all
  end
  def create

  end
   def demo

   end
end
