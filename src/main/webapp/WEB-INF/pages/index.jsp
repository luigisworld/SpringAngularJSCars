<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Activating AngularJS in the entire document-->
<html ng-app>
    <head>
        <!-- Adding AngularJS and our controller -->
        <title>Luigi's world MVC bananas</title>
        <link href="css/style.css" rel="stylesheet">
        <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.4/angular.min.js"></script>
        <script src="js/controller.js"></script><!-- our controller -->
    </head>
    <!-- Activating carsCtrl in the body -->
    <body ng-controller="carsCtrl">
                       
         <div class="carsFrame">
              <!-- JSTL: This part is used to load just the first 3 cars-->
              <c:forEach var="car" items="${cars.carList}">
                  <div class="carsFrame">
                       <img src="${car.src}"/>
                       <h1>${car.name}</h1>
                  </div>
               </c:forEach>
                   
               <!-- AngularJS manages cars injection after have loaded the 3 first-->
               <!-- We use ng-src instead src because src doesn't work in elements generated by AngularJS  -->
               <div ng-repeat="car in cars" class="carsFrame">
                   <img ng-src="{{car.src}}"/>
                   <h1>{{car.name}}</h1>
               </div>
         </div>
               
         <div id="button_container">
               <!-- ng-click binds click event with AngularJS' $scope-->
               <!-- Load function is implemented in the controller -->
               <!-- As I said in the controller javascript cannot know the context, so we give it as a parameter-->
               <button type="button" class="btn btn-xlarge btn-primary" ng-click="load('${pageContext.request.contextPath}')">3 more...</button>
         </div>
    </body>
</html>
