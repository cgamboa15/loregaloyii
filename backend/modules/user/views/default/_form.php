<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use \yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $model common\models\User */
/* @var $form yii\widgets\ActiveForm */
//  Html::dropDownList( 'provincyid',null, $provincyList, ['class' => 'form-options']);
if(!is_numeric($model->cityid))
{
    $selectedProvincy = null;
    $cityList="";//inicialmente no debe mostrar nada
}else{
    $selectedProvincy = $model->city->provincyid;
}

?>

<div class="user-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'username')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'phone')->textInput(['maxlength' => true]) ?>

    <div class="form-group field-user-cityid" style="display: ">
        <label class="control-label" for="user-cityid">Seleccione un Departamento</label>
    <?= Html::dropDownList( 'provincyId',$selectedProvincy, $provincyList, ['class' => 'form-control', 
                                                                'id' => 'provincyId',
                                                            'prompt' => 'Seleccione un Departamento',
                                                            'style' => 'width:250px'
        ]);  ?>
        <div class="help-block"></div>
    </div>
        
    <?= $form->field($model, 'cityid')->dropDownList( $cityList ) ?>

    <?= $form->field($model, 'genre')->dropDownList(['M'=>'M', 'F'=>'F', ],['maxlength' => true, 'style' => 'width:80px']) ?>

    <?= $form->field($model, 'typeid')->textInput() ?>

    <?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'statusid')->dropDownList($statusList) ?>
    
    <?= $form->field($model, 'created_at')->textInput() ?>

    <?= $form->field($model, 'updated_at')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Crear' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
<?php $this->registerJs(' 
// Actualizando por jquery el campo ciudad
$( "#provincyId" ).change( 
    function( event ) {
        // Send the data using post
        var posting = $.post( \''.Url::to(["loadcity"]).'\', { provincyId: $("#provincyId").val() } );

        // Put the results in a div
         posting.done( function( data ) {
                $( "#user-cityid" ).html( data );
                }
             );
    }
);');
