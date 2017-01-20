<?php

namespace backend\modules\category\controllers;

use Yii;
use common\models\Category;
use common\models\Status;
use common\models\Element;
use backend\modules\category\models\search\categorySearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * DefaultController implements the CRUD actions for Category model.
 */
class DefaultController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Category models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new categorySearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Category model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Category model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Category();
        
        $fatherList = Category::find()->select('id, name')->where( ['statusid' =>Category::STATUS_ACTIVE])->all();
        $fatherList = \yii\helpers\ArrayHelper::map($fatherList, 'id', 'name');
        
        $statusList = Status::find()->select(['id', 'name'])->where(['elementid' => Element::FOR_RECORDS])->all();
        $statusList = \yii\helpers\ArrayHelper::map($statusList, 'id', 'name');
        
        //var_dump($fatherList);
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            if($model->getErrors())
            {
               // var_dump ($model->getErrors()); die();
            }
            return $this->render('create', [
                'model' => $model,
                'fatherList' => $fatherList,
                'statusList' => $statusList,
            ]);
        }
    }

    /**
     * Updates an existing Category model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
         $statusList = Status::find()->select(['id', 'name'])->where(['elementid' => Element::FOR_RECORDS])->all();
        $statusList = \yii\helpers\ArrayHelper::map($statusList, 'id', 'name');

         $fatherList = Category::find()->select('id, name')->where( ['statusid' =>Category::STATUS_ACTIVE])->all();
        $fatherList = \yii\helpers\ArrayHelper::map($fatherList, 'id', 'name');
        
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
                'fatherList' => $fatherList,
                'statusList' => $statusList,
            ]);
        }
    }

    /**
     * Deletes an existing Category model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Category model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Category the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Category::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
