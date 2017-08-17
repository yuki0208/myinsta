class PhotosController < ApplicationController
  def index
    @photos = Photo.order(created_at: :desc)
  end

  def create
    Photo.create(photo_params)
    redirect_to root_path
  end

  def destroy
    Photo.find(params[:id]).destroy
    redirect_to root_path
  end   

  def photo_params
    params.require(:photo).permit(:picture)
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def edit
  end
 
  def update
  end

# ３つのアクションにルーティングつける　
#viewにshow.html.erb edit.html.erb作る
#やること
#画像投稿する時にコメントも投稿できるようにする
#画像をクリックすると詳細画面が見れる
#詳細画面には編集リンクがついてる
#クッリクすると編集画面に行ってコメントを編集できる
#戻るを押すと詳細に戻る
#保存押すと保存して詳細画面に戻る

end
