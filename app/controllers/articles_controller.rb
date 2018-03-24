class ArticlesController < ApplicationController
  def new
    @article = Article.new
    
   end
  
   def edit

    @article = Article.find(params[:id])

  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
    flash[:success] = "Article was sucessfully created"
    redirect_to article_path(@article)
     else
       render 'new'
    end 
    
  end
  
  def show
    @article = Article.find(params[:id])
    
  end
  
  def destroy
    @article = Aricle.find(params[:id])
    @article.destroy
    flash[:success] = "Aricle was sucessfully deleted "
    redirect_to article_path
    
  end
  
 
  
  
  def update

    @article = Article.find(params[:id])
  
    if @article.update(article_params)

    flash[:success] = "Article was successfully updated"

    redirect_to article_path(@article)

     else

       render 'edit'

  end

end
  
  def index

   @articles = Article.all

end
    
  
  private
  
  def article_params
    params.require(:article).permit(:title,:description)
   
  end
    
    
  end