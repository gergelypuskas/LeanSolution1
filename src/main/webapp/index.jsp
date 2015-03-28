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
		} ],
		hideNotLiked: false
	};

	storyTodayApp.filter("storyListFilter", function() {
		return function(items, hideNotLiked) {
			var results = [];
			angular.forEach(items, function(item) {
				if (item.liked == true || hideNotLiked == false) {
					results.push(item);
				}
			});
			return results;
		}
	});
	
	storyTodayApp.controller("StoryListCtrl", function($scope) {
		$scope.storyListModel = model;

		$scope.likedCount = function() {
			var count = 0;
			angular.forEach($scope.storyListModel.stories, function(item) {
				if (item.liked) {
					count++;
				}
			});
			return count;
		}

		$scope.likedCountClass = function() {
			if ($scope.likedCount() > 1) {
				return "label-warning";
			} else {
				return "label-success";
			}
		}

		$scope.addStory = function(storyText) {
			$scope.storyListModel.stories.push({
				description : storyText,
				liked : false
			});
		}
	});
	

	
</script>
</head>
<body ng-controller="StoryListCtrl">
	<!-- <body ng-controller="ToDoCtrl"> -->
	<div class="page-header">
		<h1>
			{{storyListModel.user}}'s Stories Today! <span
				class="label label-default" ng-hide="likedCount() == 0"
				ng-class="likedCountClass()"> {{likedCount()}} </span>

		</h1>
		<div class="checkbox-inline">
			<label><input type="checkbox" ng-model="storyListModel.hideNotLiked">Hide
				not liked</label>
		</div>
	</div>

	<div class="panel">
		<div class="input-group">
			<input class="form-control" ng-model="storyText"> <span
				class="input-group-btn">
				<button class="btn btn-default" ng-click="addStory(storyText)">Tell</button>
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
				<tr
					ng-repeat="story in storyListModel.stories | storyListFilter:storyListModel.hideNotLiked | orderBy:'-liked' ">
					<td>{{story.description}}</td>
					<td><input type="checkbox" ng-model="story.liked" /></td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>

