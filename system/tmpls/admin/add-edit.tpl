<?php $this->template('admin/header.tpl')?>
<?php $this->template('admin/top-panel.tpl')?>
<script type="text/javascript">
    $(function() {
        EditModel.init("<?=$client['id']?>");
    });
</script>
<form action="" method="post" name="newClient">
<div class="b-top-holder clrfix">
    <div class="b-top-holder__btns">
        <table>
            <tr>
                <td>
                    <table class="btn-box btn-gray btn-tilbage">
                        <tr>
                            <td class="btn-box__crnr-l"></td>
                            <td class="btn-box__crnr-r"><input type="button" class="button" value="Назад" onclick="window.location='<?=$path_host?>admin'" /></td>
                        </tr>
                    </table>
                </td>
                <?php if(isset($client)): ?>
                    <td>
                        <table class="btn-box btn-red">
                            <tr>
                                <td class="btn-box__crnr-l"></td>
                                <td class="btn-box__crnr-r">
                                    <input type="button" class="button" value="Удалить" />
                                </td>
                            </tr>
                        </table>
                    </td>
                <?php endif; ?>
                <td>
                    <table class="btn-box btn-blue">
                        <tr>
                            <td class="btn-box__crnr-l"></td>
                            <td class="btn-box__crnr-r"><input type="submit" name="addClient" class="button" value="Сохранить" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</div>
<div class="l-container clrfix">
<div class="l-col-left">
    <div class="b-window b-specific-window">
        <div class="b-window-head-l">
            <div class="b-window-head-r">
                <div class="b-window-head">
                    <?php if($client['number'] != 0): ?>
                        № <?=$client['number']?>
                    <?php elseif(!isset($client)): ?>
                        НОВЫЙ КЛИЕНТ
                    <?php endif; ?>
                </div>
            </div>
        </div>
        <div class="b-window-body clrfix">
            <div class="b-window-row clrfix">
                <div class="b-window-row__label m-lefted">
                    <label>Дата обращения:</label>
                </div>
                <div class="b-window-row__item">
                    <div class="b-textbox">
                        <div>
                            <input id="sd" type="text" name="data[startDate]" value="<?php if(isset($client) && $client['start_date']!=0):?><?=date('j.m.y', $client['start_date'])?><?php endif;?>" class="textbox">
                        </div>
                    </div>
                </div>
            </div>
            <div class="b-window-row clrfix">
                <div class="b-window-row__label m-lefted">
                    <label>Дата сдачи:</label>
                </div>
                <div class="b-window-row__item">
                    <div class="b-textbox">
                        <div>
                            <input id="dd" type="text" name="data[deliveryDate]" value="<?php if(isset($client) && $client['delivery_date']!=0):?><?=date('j.m.y', $client['delivery_date'])?><?php endif;?>" class="textbox">
                        </div>
                    </div>
                </div>
            </div>
            <div class="b-window-row clrfix">
                <div class="b-window-row__label m-lefted">
                    <label>Дата окончания теста:</label>
                </div>
                <div class="b-window-row__item">
                    <div class="b-textbox">
                        <div>
                            <input id="fd" type="text" name="data[finishDate]" value="<?php if(isset($client) && $client['finish_test_date']!=0):?><?=date('j.m.y', $client['finish_test_date'])?><?php endif;?>" class="textbox">
                        </div>
                    </div>
                </div>
            </div>
            <div class="b-window-row clrfix">
                <div class="b-window-row__label m-lefted">
                    <label>Статус:</label>
                </div>
                <div class="b-window-row__item">
                    <select name="data[status]">
                        <?php foreach($data['statuses'] as $status): ?>
                        <option <?php if($status['status'] == $client['status']):?>selected<?php endif;?> value="<?=$status['id']?>">
                        <?=$status['status']?>
                        </option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>
            <div class="b-window-row clrfix">
                <div class="b-window-row__label m-lefted">
                    <label>Источник:</label>
                </div>
                <div class="b-window-row__item">
                    <select name="data[source]">
                        <?php foreach($data['sources'] as $source): ?>
                        <option <?php if($source['source'] == $client['source']):?>selected<?php endif;?> value="<?=$source['id']?>">
                        <?=$source['source']?>
                        </option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>
            <div class="b-window-row clrfix">
                <div class="b-window-row__label m-lefted">
                    <label>URL:</label>
                </div>
                <div class="b-window-row__item">
                    <div class="b-textbox" style="width:400px;">
                        <div>
                            <input type="text" name="data[url]" value="<?=$client['url']?>" class="textbox">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="b-window-foot-l">
            <div class="b-window-foot-r">
                <div class="b-window-foot"></div>
            </div>
        </div>
    </div>
    <div class="b-window b-specific-window">
        <div class="b-window-head-l">
            <div class="b-window-head-r">
                <div class="b-window-head">Данные заказа</div>
            </div>
        </div>
        <div class="b-window-body clrfix">
            <div class="b-window-row clrfix">
                <div class="b-window-row__label m-lefted">
                    <label>Сайт и расцветка:</label>
                </div>
                <div class="b-window-row__item">
                    <select name="data[site]">
                        <?php foreach($data['sites'] as $site): ?>
                        <option <?php if($site['site_name'] == $client['site_name'] && $site['site_id'] == $client['site_num']):?>selected<?php endif;?> value="<?=$site['id']?>">
                        <?=$site['site_name']?>-<?=$site['site_id']?>
                        </option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>
            <div class="b-window-row clrfix">
                <div class="b-window-row__label m-lefted">
                    <label>Хостинг:</label>
                </div>
                <div class="b-window-row__item">
                    <select name="data[hosting]">
                        <?php foreach($data['options']['hosting'] as $key => $option): ?>
                            <option <?php if($client['hosting'] == $option['name_admin']):?>selected<?php endif;?> value="<?=$option['id']?>"><?=$option['name_admin']?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>
            <div class="b-window-row clrfix">
                <div class="b-window-row__label m-lefted">
                    <label>Логотип:</label>
                </div>
                <div class="b-window-row__item">
                    <select name="data[logo]">
                        <?php foreach($data['options']['logo'] as $key => $option): ?>
                            <option <?php if($client['logo'] == $option['name_admin']):?>selected<?php endif;?> value="<?=$option['id']?>"><?=$option['name_admin']?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>
            <?php foreach($data['options']['other'] as $key => $option): ?>
            <div class="b-window-row clrfix">
                <div class="b-window-row__label m-lefted">
                    <label><?=$option['name_admin']?></label>
                </div>
                <div class="b-window-row__item">
                    <input <?php if(isset($client) && array_search($option['name_admin'], $client['options']) !== false):?>checked<?php endif;?> name="data[option][<?=$option['id']?>]" type="checkbox" />
                </div>
            </div>
            <?php endforeach; ?>
            <div class="b-window-row__label m-lefted">
                <label>Пожелания:</label>
            </div>
            <br /><br />
            <div class="b-window-row">
                <div class="b-textarea-l">
                    <div class="b-textarea-r">
                        <div class="b-textarea">
                            <textarea rows="" name="data[wish]" cols=""><?=$client['comment']?></textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="b-window-foot-l">
            <div class="b-window-foot-r">
                <div class="b-window-foot"></div>
            </div>
        </div>
    </div>
</div>
<div class="l-col-right">
    <div class="b-window b-specific-window">
        <div class="b-window-head-l">
            <div class="b-window-head-r">
                <div class="b-window-head">Клиент</div>
            </div>
        </div>
        <div class="b-window-body b-edit-col clrfix">
            <div class="b-window-row clrfix">
                <div class="b-window-row__label m-lefted">
                    <label>Фамилия:</label>
                </div>
                <div class="b-window-row__item">
                    <div class="b-textbox">
                        <div>
                            <input id="lastname" type="text" name="data[lastname]" value="<?=$client['last_name']?>" class="textbox">
                        </div>
                    </div>
                </div>
            </div>
            <div class="b-window-row clrfix">
                <div class="b-window-row__label m-lefted">
                    <label>Имя:</label>
                </div>
                <div class="b-window-row__item">
                    <div class="b-textbox">
                        <div>
                            <input id="name" type="text" name="data[name]" value="<?=$client['name']?>" class="textbox">
                        </div>
                    </div>
                </div>
            </div>
            <div class="b-window-row clrfix">
                <div class="b-window-row__label m-lefted">
                    <label>Отчество:</label>
                </div>
                <div class="b-window-row__item">
                    <div class="b-textbox">
                        <div>
                            <input id="surname" type="text" name="data[surname]" value="<?=$client['surname']?>" class="textbox">
                        </div>
                    </div>
                </div>
            </div>
            <div class="b-window-row clrfix">
                <div class="b-window-row__label m-lefted">
                    <label>Номер клиента:</label>
                </div>
                <div class="b-window-row__item">
                    <div class="b-textbox">
                        <div>
                            <input id="number" type="text" maxlength="3" name="data[number]" value="<?php if($client['number'] != 0): ?><?=$client['number']?><?php endif; ?>" class="textbox">
                        </div>
                    </div>
                </div>
            </div>
            <div class="b-window-row clrfix">
                <div class="b-window-row__label m-lefted">
                    <label>Страна:</label>
                </div>
                <div class="b-window-row__item">
                    <select name="data[country]">
                        <?php foreach($data['lands'] as $land): ?>
                        <option <?php if($client['country'] == $land['country']):?>selected<?php endif;?> value="<?=$land['id']?>"><?=$land['country']?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>
            <div class="b-window-row clrfix">
                <div class="b-window-row__label m-lefted">
                    <label>E-mail:</label>
                </div>
                <div class="b-window-row__item">
                    <div class="b-textbox">
                        <div>
                            <input type="text" name="data[email]" value="<?=$client['email']?>" class="textbox">
                        </div>
                    </div>
                </div>
            </div>
            <div class="b-window-row clrfix">
                <div class="b-window-row__label m-lefted">
                    <label>Телефон:</label>
                </div>
                <div class="b-window-row__item">
                    <div class="b-textbox">
                        <div>
                            <input type="text" name="data[phone]" value="<?=$client['phone']?>" class="textbox">
                        </div>
                    </div>
                </div>
            </div>
            <div class="b-window-row clrfix">
                <div class="b-window-row__label m-lefted">
                    <label>Skype:</label>
                </div>
                <div class="b-window-row__item">
                    <div class="b-textbox">
                        <div>
                            <input type="text" name="data[skype]" value="<?=$client['skype']?>" class="textbox">
                        </div>
                    </div>
                </div>
            </div>
            <div class="b-window-row clrfix">
                <div class="b-window-row__label m-lefted">
                    <label>Предпочтительное средство связи:</label>
                </div>
                <div class="b-window-row__item">
                    <select name="data[communication]">
                        <option <?php if($client['communication'] == 'other'):?>selected<?php endif;?> value="other">Не указано</option>
                        <option <?php if($client['communication'] == 'email'):?>selected<?php endif;?> value="email">Email</option>
                        <option <?php if($client['communication'] == 'phone'):?>selected<?php endif;?> value="phone">Телефон</option>
                        <option <?php if($client['communication'] == 'skype'):?>selected<?php endif;?> value="skype">Skype</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="b-window-foot-l">
            <div class="b-window-foot-r">
                <div class="b-window-foot"></div>
            </div>
        </div>
    </div>
</form>
<?php if(isset($client)):?>
<div class="b-window b-comment-window">
    <div class="b-window-head-l">
        <div class="b-window-head-r">
            <div class="b-window-head">Комментарии</div>
        </div>
    </div>
    <div class="b-window-body clrfix">
        <div class="b-window-row">
            <label>Комментарий:</label>
        </div>
        <div class="b-window-row">
            <div class="b-textarea-l">
                <div class="b-textarea-r">
                    <div class="b-textarea">
                        <textarea id="text-comment" rows="" cols=""></textarea>
                    </div>
                </div>
            </div>
        </div>
        <div class="b-window-row clrfix">
            <table class="btn-box btn-blue btn-gem fr">
                <tr>
                    <td class="btn-box__crnr-l"></td>
                    <td class="btn-box__crnr-r"><input type="submit" class="button" value="Добавить комментарий" id="addComment" /></td>
                </tr>
            </table>
        </div>
        <div class="b-window-row b-comment-list clrfix">
            <?php if(isset($client)): foreach($client['comments'] as $comment): ?>
            <div class="b-comment-item">
                <div class="b-comment-item__name"><?=date('d-m-y H:i:s', $comment['date'])?> <?=$comment['name']?></div>
                <div class="b-comment-item__info"><?=$comment['comment']?></div>
            </div>
            <?php endforeach; endif; ?>
        </div>
    </div>
    <div class="b-window-foot-l">
        <div class="b-window-foot-r">
            <div class="b-window-foot"></div>
        </div>
    </div>
</div>
<?php endif;?>
</div>

</div>
<div class="l-container clrfix">
    <div class="l-col-left">

    </div>
</div>
<?php $this->template('admin/footer.tpl')?>