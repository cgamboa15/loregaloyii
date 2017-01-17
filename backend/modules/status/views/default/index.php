<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\modules\status\models\search\statusSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Estados de registros y Elementos';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="status-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Crear Estado', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            ['attribute' => 'id', 
                            'headerOptions' => ['style'=>'width:20px;']
            ],
            
            'name',
            ['attribute' => 'status', 
                'headerOptions' => ['class'=>'visible-lg', 'style'=>'width:20px;'],
                'contentOptions' => ['class'=>'visible-lg', 'style'=>'width:20px;']
                
            ],
            'element.name',
            ['class' => 'yii\grid\ActionColumn'],
        ],
        'rowOptions' => //esto muestra el registro de color rojo si está desactivado
                                function ($model, $key, $index, $column){
                                        if( !$model['status'] == '1' )
                                            return ['class'=>'danger'];
                                        else
                                            return ['class'=>''];
                                        
                                    },  
    ]); ?>
</div>
