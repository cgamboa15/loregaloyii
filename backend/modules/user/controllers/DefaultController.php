<?php

namespace backend\modules\user\controllers;

use Yii;
use common\models\User;
use common\models\Status;
use common\models\City;
use common\models\Provincy;
use common\models\Element;
use backend\modules\user\models\search\userSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\filters\AccessControl;
/**
 * DefaultController implements the CRUD actions for User model.
 */
class DefaultController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['index', 'create', 'update', 'view'],
                'rules' => [
                    [
                        'allow' => true,
                        'actions' => ['login', 'signup'],
                        'roles' => ['?'],
                    ],
                    [
                        'allow' => true,
                        'actions' => ['index', 'create', 'update', 'view'],
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
            
        ];
    }

    /**
     * Lists all User models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new userSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single User model.
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
     * Creates a new User model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new User();
        $statusList = Status::find()->select(['id', 'name'])->where(['elementid' => Element::FOR_RECORDS])->all();
        $statusList = \yii\helpers\ArrayHelper::map($statusList, 'id', 'name');
        
        $provincyList = Provincy::find()->with('cities')->select(['id', 'name'])->where(['statusid' => Status::STATUS_ACTIVE])->all();
        $provincyList = \yii\helpers\ArrayHelper::map($provincyList, 'id', 'name');
        
        $cityList = City::find()->select(['id', 'name'])->where(['statusid' => Status::STATUS_ACTIVE])->orderBy( ['name' => SORT_ASC] )->all();
        $cityList = \yii\helpers\ArrayHelper::map($cityList, 'id', 'name');
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
                'statusList' => $statusList,
                'cityList' => $cityList,
                'provincyList' => $provincyList,
            ]);
        }
    }

     /**
     * Get a city list from a selected provincy
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionLoadcity( )
    {
        $cityList = City::find()->select(['id', 'name'])->where(['provincyid' => $_POST['provincyId']])->all();
        $cityList = \yii\helpers\ArrayHelper::map($cityList, 'id', 'name');
        //var_dump($cityList);
       return Html::dropDownList( 'cityid',null, $cityList, ['class' => 'form-control']);
    }

    /**
     * Updates an existing User model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        
        $selectedProvincy = null;
        $statusList = Status::find()->select(['id', 'name'])->where(['elementid' => Element::FOR_RECORDS])->all();
        $statusList = \yii\helpers\ArrayHelper::map($statusList, 'id', 'name');
        
        $provincyList = Provincy::find()->with('cities')->select(['id', 'name'])->where(['statusid' => Status::STATUS_ACTIVE])->all();
        $provincyList = \yii\helpers\ArrayHelper::map($provincyList, 'id', 'name');
        
        $cityList = City::find()->select(['id', 'name'])->where(['statusid' => Status::STATUS_ACTIVE])->orderBy( ['name' => SORT_ASC] )->all();
        $cityList = \yii\helpers\ArrayHelper::map($cityList, 'id', 'name');
        //var_dump(Yii::$app->request->post());exit;
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
                'statusList' => $statusList,
                'cityList' => $cityList,
                'provincyList' => $provincyList,
                'selectedProvincy' => $selectedProvincy,
            ]);
        }
    }

    /**
     * Deletes an existing User model.
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
     * Finds the User model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return User the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = User::find()->where(['id' => $id])->with('city')->one()) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
