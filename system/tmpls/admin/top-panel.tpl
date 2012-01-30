<div class="l-header">
    <div class="l-header__inner clrfix">
        <div class="b-logo"><a href="<?=$path_host?>admin"><img src="<?=$path_host?>images/admin/logo.gif" width="104" height="25" alt="" /></a></div>
        <div class="nav-user">Welcome, <b><?=$_SERVER['PHP_AUTH_USER']?></b><br />
            <table class="btn-box btn-gray" align="right">
                <tr>
                    <td class="btn-box__crnr-l"></td>
                    <td class="btn-box__crnr-r">
                        <form action="<?=$path_host?>admin/" method="post">
                            <input type='hidden' name='SeenBefore' value='1' />
                            <input type='hidden' name='OldAuth' value="<?=$_SERVER['PHP_AUTH_USER']?>" />
                            <input type="submit" name="logout" class="button" value="Logout" />
                        </form>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<div class="nav-top-l">
    <div class="nav-top-r">
        <div class="nav-top">
            <ul class="clrfix">
                <li class="active"><span><a href="<?=$path_host?>admin">Клиенты</a></span></li>
            </ul>
        </div>
    </div>
</div>