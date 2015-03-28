<!DOCTYPE html>
<html ng-app="storyTodayApp">
<head>
<title>Story Today</title>
<link href="bootstrap.css" rel="stylesheet" />
<link href="bootstrap-theme.css" rel="stylesheet" />
<script src="angular.js"></script>
<script>
	var storyTodayApp = angular.module("storyTodayApp", []);

	var model = {
		user : "Wei",
		stories : [ {
			description : "We were hiking",
			liked : false
		}, {
			description : "Samanta is having a new boyfriend",
			liked : false
		} ]
	};

	storyTodayApp.controller("StoryListCtrl", function($scope) {
		$scope.storyListModel = model;
	});
</script>
</head>
<body ng-controller="StoryListCtrl">
	<!-- <body ng-controller="ToDoCtrl"> -->
	<div class="page-header">
		<h1>{{storyListModel.user}}'s Stories Today!</h1>
	</div>
	<div class="panel">
		<div class="input-group">
			<input class="form-control"> <span class="input-group-btn">
				<button class="btn btn-default">Tell</button>
			</span>
		</div>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Story</th>
					<th>Liked</th>
				</tr>
			</thead>
			<tbody>
				<tr ng-repeat="story in storyListModel.stories">
					<td>{{story.description}}</td>
					<td>{{story.liked}}</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>

