class StaticPagesController < ApplicationController
  
  def faq ;
  end
 
  def co_to ;
  end
  
  def strona;
  end
  
  def spis
     @user = User.find_by(id: params[:id]);
  end
  
  
end
