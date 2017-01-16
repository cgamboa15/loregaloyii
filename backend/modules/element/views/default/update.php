<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Element */

$this->title = 'Actualizar Elemento: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Elements', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="element-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'statusList' => $statusList,
    ]) ?>

</div>
