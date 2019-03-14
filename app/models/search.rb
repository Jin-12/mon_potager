class Search < ApplicationRecord
    def search_gardens
        search = Garden.all 
        search = Garden.where(["name LIKE ?","%#{params[:search]}%"]) if keyword.present?
        search = Garden.where(["adress LIKE ?","%#{params[:search]}%"]) if keyword.present?
        search = Garden.where(Garden.products.where(["name LIKE ?","%#{params[:search]}%"])) if keyword.present?
        return search 
    end
end
