angular
  .module("Poll")
  .controller "QuestionController", ["$scope", ($scope) ->
    $scope.options = []

    $scope.setOption = (id) ->
      $scope.option = id

      setTimeout ->
        $scope.bindOptionEvent()
      , 1

    $scope.bindOptionEvent = ->
      $scope.$watch "option", ->
        nanobar = new Nanobar({
          bg: "#27ae60"
        })
        nanobar.go(30)
        $.ajax
          url: "/votes.json"
          type: "put"
          dataType: "json"
          data:
            "vote[option_id]": $scope.option
            "vote[question_id]": $("[name='vote[question_id]']").val()
          success: ->
            nanobar.go(100)

    $scope.optionBlur = ($index, option) ->
      $scope.options.splice($index, 1) if option == ""

    $scope.getOptions = ->
      return options

    $scope.$watchCollection "options", ->
      if $scope.options.slice(-1)[0] != ""
        $scope.options.push ""

  ]
