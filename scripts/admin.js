
ListClientsModel = {
    countClients: 0,
    pageBox: '',
    countBox: '',
    statusBox: '',
    searchBox: '',
    sortLinks: '',
    isDesc: '',
    lastId: '',
    init: function(countClients, page, count, status, search, sorting) {
        ListClientsModel.countClients = countClients;
        ListClientsModel.countBox = count;
        ListClientsModel.pageBox = page;
        ListClientsModel.statusBox = status;
        ListClientsModel.searchBox = search;
        ListClientsModel.sortLinks = sorting;
        var sort = '';
        $(ListClientsModel.searchBox).keyup(function(){ ListClientsModel.search($(this).val()); });
        $(ListClientsModel.pageBox).bind('change', function(){
            sort = $('.row-filter > td > a > span:parent').parent('a').attr('id');
            ListClientsModel.chageClientsCount(sort);
        });
        $(ListClientsModel.sortLinks).live('click', function(){
            if ($(this).attr('id') == ListClientsModel.lastId)
                ListClientsModel.isDesc = ListClientsModel.isDesc == ' DESC' ? '' : ' DESC';
            sort = $(this).attr('id');
            ListClientsModel.chageClientsCount(sort);
        });
        $(ListClientsModel.countBox).bind('change', function(){
            $(ListClientsModel.pageBox).val(1);
            sort = $('.row-filter > td > a > span:parent').parent('a').attr('id');
            ListClientsModel.chageClientsCount(sort);
        });
        $(ListClientsModel.statusBox).bind('change', function(){
            $(ListClientsModel.pageBox).val(1);
            sort = $('.row-filter > td > a > span:parent').parent('a').attr('id');
            ListClientsModel.changeStatus(sort);
        });
    },
    chageClientsCount: function(sort) {
        var page = $(ListClientsModel.pageBox).val();
        var count = $(ListClientsModel.countBox).val();
        var status = $(ListClientsModel.statusBox).val();
        $(ListClientsModel.searchBox).val('');
        var sorting = '';
        if (ListClientsModel.isDesc == ' DESC' && $('#' + sort).attr('id') == ListClientsModel.lastId) {
            sorting = '&#9650;';
        }
        else if ($('#' + sort).attr('id') == ListClientsModel.lastId) {
            ListClientsModel.isDesc = '';
            sorting = '&#9660;';
        }
        else {
            $('.row-filter > td > a > span').each(function(){$(this).empty();});
            ListClientsModel.isDesc = '';
            sorting = '&#9660;';
        }
        ListClientsModel.lastId = $('#' + sort).attr('id');
        $.ajax({
            url : 'admin/getSomeClients',
            type: 'POST',
            data: {page: page, count: count, status: status, sort: sort, desc: ListClientsModel.isDesc},
            dataType: 'json',
            cache : true,
            beforeSend: function() {
                $('#loader').show();
            },
            success : function(json) {
                $('table.tbl-main').html(json.body);
                $('#'+sort).children('span').html(sorting);
                $('#loader').hide();
            }
        });
        var countPages = Math.ceil(ListClientsModel.countClients / count);
        $('#from').html('из ' + countPages);
        var pagesBox = '';
        for (var i = 1; i <= countPages; i++)
            pagesBox += "<option value='"+i+"'>"+i+"</option>";
        $(ListClientsModel.pageBox).html(pagesBox);
        $(ListClientsModel.pageBox + ' > option[value='+page+']').attr('selected', 'true');
    },
    changeStatus: function(sort){
        var page = $(ListClientsModel.pageBox).val();
        var count = $(ListClientsModel.countBox).val();
        var status = $(ListClientsModel.statusBox).val();
        $(ListClientsModel.searchBox).val('');
        $.ajax({
            url : 'admin/getSomeClients',
            type: 'POST',
            data: {page: page, count: count, status: status, sort: sort},
            dataType: 'json',
            cache : true,
            beforeSend: function() {
                $('#loader').show();
            },
            success : function(json) {
                ListClientsModel.countClients = json.count;
                var countPages = Math.ceil(ListClientsModel.countClients / count);
                $('#from').html('из ' + countPages);
                var pagesBox = '';
                for (var i = 1; i <= countPages; i++)
                    pagesBox += "<option value='"+i+"'>"+i+"</option>";
	            $(ListClientsModel.pageBox).html(pagesBox);
                $('table.tbl-main').html(json.body);
                $('#loader').hide();
            }
        });
    },
    search: function(query){
        if (query == "") {
            ListClientsModel.chageClientsCount();
        }
        else {
            $.ajax({
                url : 'admin/search',
                type: 'POST',
                data: {query: query},
                dataType: 'json',
                cache : true,
                beforeSend: function() {
                    $('#loader').show();
                },
                success : function(json) {
                    $('table.tbl-main').html(json.body);
                    $('#loader').hide();
                }
            });
        }
    }
};

EditModel = {
    id: 0,
    init: function(id){
        EditModel.id = id;
        $('input[value=Удалить]').bind('click', function() { if (confirm('Удалить этого клиента?') === true) window.location='../delete/'+EditModel.id;});
        $("#sd, #dd, #fd").datepicker({ showAnim: 'slideDown', dateFormat: 'dd.mm.yy', changeMonth: true, firstDay: 1 });
        $('#addComment').bind('click', function() {
            EditModel.newComment();
            return false;
        });
        $('input[name=addClient]').bind('click', function(){
            if (EditModel.validate() == false)
                return false;
        });
    },
    newComment: function(){
        var comment = $('#text-comment').val().replace(/\r\n|\r|\/r|\/n|\n/g,"<br />");
        $.ajax({
            url : '/admin/addComment',
            type: 'POST',
            data: {comment: comment, id: EditModel.id},
            dataType: 'json',
            cache : true,
            success : function(json) {
                var commentBlock = '<div style="display: none" class="b-comment-item">' +
                    '<div class="b-comment-item__name">' + json.date + ' ' + json.login + '</div>' +
                    '<div class="b-comment-item__info">' + comment + '</div></div>';
                $('.b-comment-list').prepend(commentBlock);
                $('.b-comment-item:first').slideDown();
                $('#text-comment').val("");
            }
        });
    },
    validate: function(){
        if ($('#lastname').val() == "" && $('#name').val() == "" && $("#surname").val() == "") {
            $('#lastname, #name, #surname').css('background', '#faffbc');
            return false;
        }
    }
}