$(function() {

  let search_list = $(".listBottom");

  function appendMenu(menu) {
    let html = `<div class="listBox">
                  <div class="boxImage">
                    <img src="${menu.image}">
                  </div>
                  <div class="boxInfo">
                    <div class="boxInfo__name">
                      ${menu.user_name}の今日のごはん
                    </div>
                    <div class="boxInfo__time">
                      調理時間：${menu.time}分
                    </div>
                    <div class="boxInfo__point">
                      Point：${menu.point}
                    </div>
                  </div>
                </div>`
    search_list.append(html);
  }

  function appendErrMsgToHTML(msg) {
    let html = `<div class="searchErrMsg>${ msg }</div>`
    search_list.append(html);
  }

  $(".searchForm__inputBox").on("keyup", function() {
    let input = $(".searchForm__inputBox").val();
    $.ajax({
      type: 'GET',
      url: '/menus/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(menus) {
      search_list.empty();
      if (menus.length !== 0) {
        menus.forEach(function(menu) {
          appendMenu(menu);
        });
      }
      else {
        appendErrMsgToHTML("検索結果なし")
      }
    })
  });
});