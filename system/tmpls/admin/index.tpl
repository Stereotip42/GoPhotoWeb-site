<?php $this->template('admin/header.tpl')?>
<?php $this->template('admin/top-panel.tpl')?>
<script type="text/javascript">
    $(function() {
        ListClientsModel.init(<?=$countClients?>, 'select[name=page]', 'select[name=count]', 'select[name=status]', 'input[name=search]', '.row-filter > td > a');
    });
</script>
    <div class="b-top-holder clrfix">
        <h1>Клиенты GoPhotoWeb</h1>
        <img id="loader" src="<?=$path_host?>images/admin/loader.gif" />
        <div class="b-top-holder__btns">
            <table>
                <tr>
                    <td><table class="btn-box btn-blue btn-play">
                            <tr>
                                <td class="btn-box__crnr-l"></td>
                                <td class="btn-box__crnr-r"><form action="<?=$path_host?>admin/add" method="post"><input type="submit" class="button" value="Добавить нового клиента" /></form></td>
                            </tr>
                        </table></td>
                </tr>
            </table>
        </div>
    </div>
    <div class="l-container">
        <div class="b-window b-window-nohead">
            <div class="b-window-head-n-l">
                <div class="b-window-head-n-r">
                    <div class="b-window-head-n"></div>
                </div>
            </div>
            <div class="b-window-body clrfix">
                <div class="b-overview-filter">
                    <table>
                        <tr>
                            <td>Поиск</td>
                            <td>
                                <input name="search" />
                            </td>
                            <td><img src="images/sep_mdl.gif" width="2" height="26" alt="" /></td>
                            <td><img src="images/sep_mdl.gif" width="2" height="26" alt="" /></td>
                            <td>Страница:</td>
                            <td>
                                <select name="page" class="selectbox" style="width:70px;">
                                    <?php for($i = 1; $i <= ceil($countClients/400); $i++): ?>
                                        <option value="<?=$i?>"><?=$i?></option>
                                    <?php endfor; ?>
                                </select>
                            </td>
                            <td id="from">из <?=ceil($countClients/400)?></td>
                            <td><img src="images/sep_mdl.gif" width="2" height="26" alt="" /></td>
                            <td>По</td>
                            <td>
                                <select class="selectbox" name="count" style="width:70px;">
                                    <option value="50">50</option>
                                    <option value="100">100</option>
                                    <option value="200">200</option>
                                    <option selected value="400">400</option>
                                </select>
                            </td>
                            <td>на странице</td>
                            <td><img src="images/sep_mdl.gif" width="2" height="26" alt="" /></td>
                            <td>Статус клиента:</td>
                            <td>
                                <select class="selectbox" name="status" style="width:150px;">
                                    <option value="0">любой</option>
                                    <?php foreach($statuses as $key => $status): ?>
                                        <option value="<?=$key+1?>"><?=$status['status']?></option>
                                    <?php endforeach; ?>
                                </select>
                            </td>
                        </tr>
                    </table>
                </div>
                <?php $this->template('admin/clients.tpl')?>
            </div>
            <div class="b-window-foot-l">
                <div class="b-window-foot-r">
                    <div class="b-window-foot"></div>
                </div>
            </div>
        </div>
    </div>
<?php $this->template('admin/footer.tpl')?>