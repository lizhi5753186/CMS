fs = require("fs")
appPath = process.cwd()
mongoose = require("mongoose")
User = mongoose.model("User")

initData = (model, path) ->
  require(appPath + path).forEach (item) ->
    data = new model(item)
    data.save()
    console.log "Database init: #{path} import successful."

module.exports = ->
  User.find().exec (err, users) ->
    unless users.length
      initData(mongoose.model("User"), "/bootstrap/db/system/user.json")
      initData(mongoose.model("Article"), "/bootstrap/db/article/article.json")
      initData(mongoose.model("Category"), "/bootstrap/db/article/category.json")
      initData(mongoose.model("Comment"), "/bootstrap/db/common/comment.json")
      initData(mongoose.model("Tag"), "/bootstrap/db/common/tag.json")
      initData(mongoose.model("Gallery"), "/bootstrap/db/photo/gallery.json")
      initData(mongoose.model("Photo"), "/bootstrap/db/photo/photo.json")
