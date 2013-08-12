﻿angular.module("CommentServices", ["ngResource"])
.factory "Comment", ['$resource',($resource) ->
  $resource "/odata/Comment:id/:action", {id:'@id',action:'@action'},
    recent:
      method: "GET"
      params:
        action:"recent"
    del:
      method: "POST"
      params:
        action:'delete'
    renew:
      method: "POST"
      params:
        action:'renew'
]