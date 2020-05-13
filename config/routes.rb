Rails.application.routes.draw do
  def hello
    render html: "hello, world!!"
  end
end
