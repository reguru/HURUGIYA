// function initMap() {
//   geocoder = new google.maps.Geocoder()
//   //初期位置
//   let latlng = new google.maps.LatLng(38.60, 139.5);
//   //デザイン
//   let styles = [
//     {
//       styles: [
//         {"saturation": 0},
//         {"lightness": 0}
//       ]
//     }
//   ];

//   let map = new google.maps.Map(document.getElementById('map'), {
//     zoom: 5.5,
//     styles: styles,
//     center: latlng
//   });
//   let transitLayer = new google.maps.TransitLayer();
//   transitLayer.setMap(map);

//   //複数マーカー
//   <% @posts.each do |post| %>
//     (function() {
//       let markerLatLng = {lat: <%= post.latitude %>, lng: <%= post.longitude %>};
//       let marker = new google.maps.Marker({
//         position: markerLatLng,
//         map: map
//       });

//       //マーカーをクリックしたとき、詳細情報を表示
//       let infowindow = new google.maps.Infowindow({
//         position: markerLatLng,
//         content: "<a href='<%= post_url(post.id) %>' target='_blank'><%= post.name %></a>"
//       });
//       marker.addListener('click', function() {
//         infowindow.open(map, marker);
//       });
//     });
//   <% end %>
// }
