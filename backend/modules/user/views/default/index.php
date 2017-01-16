<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\modules\user\models\search\userSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Usuarios';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="user-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Crear Usuario', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'username',
            'phone',
            'city.name',
            'genre',
            // 'typeid',
            // 'auth_key',
            // 'password_hash',
            // 'password_reset_token',
            'email:email',
            // 'statusid',
            // 'created_at',
            // 'updated_at',
            // 'sendmail',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
