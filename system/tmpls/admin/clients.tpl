                <table class="tbl-main">
                    <tr class="row-filter row-noborder">
                        <td>
                            <a href="#" id="number">
                                №<span></span>
                            </a>
                        </td>
                        <td>
                            <a href="#" id="last_name">
                                ФИО<span></span>
                            </a>
                        </td>
                        <td>URL
                        </td>
                        <td>Сайт
                        </td>
                        <td>Доработки
                        </td>
                        <td>Хостинг
                        </td>
                        <td>
                            <a href="#" id="start_date">
                                Дата обращения<span></span>
                            </a>
                        </td>
                        <td>
                            <a href="#" id="delivery_date">
                                Дата сдачи<span></span>
                            </a>
                        </td>
                        <td>Статус
                        </td>
                    </tr>
                    <tr>
                    <?php foreach($clients as $key => $client): ?>
                        <tr <?php if($key % 2 == 0): ?>class="row-even"<?php endif; ?>>
                            <td><?php if($client['number'] != 0): ?><?=$client['number']?><?php endif; ?></td>
                            <td>
                                <a href="<?=$path_host?>admin/client/<?=$client['id']?>">
                                    <?=$client['last_name']?> <?=$client['name']?> <?=$client['surname']?>
                                </a>
                            </td>
                            <td><a target="_blank" href="<?=$client['url']?>"><?=$client['url']?></a></td>
                            <td class="site-name"><?=$client['site_name']?>-<?=$client['site_num']?></td>
                            <td>
                                <?=$client['options']?>
                            </td>
                            <td><?=$client['hosting']?></td>
                            <td><?php if($client['start_date'] != 0) echo date("j.m.y", $client['start_date']);?></td>
                            <td><?php if($client['delivery_date'] != 0) echo date("j.m.y", $client['delivery_date']);?></td>
                            <td><?=$client['status']?></td>
                        </tr>
                    <?php endforeach; ?>
                </table>