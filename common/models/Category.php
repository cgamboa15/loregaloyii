<?php

namespace common\models;

use Yii;
use yii\behaviors\TimestampBehavior;
use \yii\behaviors\SluggableBehavior;
use yii\behaviors\BlameableBehavior;
use yii\db\ActiveRecord;
use yii\db\Expression;

/**
 * This is the model class for table "q5vp2_category".
 *
 * @property integer $id
 * @property string $name
 * @property string $desc
 * @property integer $statusid
 * @property integer $fatherid
 * @property string $created_at
 * @property string $updated_at
 *
 * @property Status $status
 * @property Category $father
 * @property Category[] $categories
 * @property Item[] $items
 */
class Category extends \yii\db\ActiveRecord
{
    const STATUS_ACTIVE = 9;
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'q5vp2_category';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'desc', 'fatherid', 'statusid'], 'required'],
            [['statusid', 'fatherid'], 'integer'],
            [['image'], 'file'],
            [['created_at', 'updated_at'], 'safe'],
            [['name'], 'string', 'max' => 250],
            [['desc'], 'string', 'max' => 255],
            [['statusid'], 'exist', 'skipOnError' => true, 'targetClass' => Status::className(), 'targetAttribute' => ['statusid' => 'id']],
            [['fatherid'], 'exist', 'skipOnError' => true, 'targetClass' => Category::className(), 'targetAttribute' => ['fatherid' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
                 
                 [
                     'class' => BlameableBehavior::className(),
                     'createdByAttribute' => 'created_by',
                     'updatedByAttribute' => 'updated_by',
                 ],
                 'timestamp' => [
                     'class' => 'yii\behaviors\TimestampBehavior',
                     'attributes' => [
                         ActiveRecord::EVENT_BEFORE_INSERT => ['created_at', 'updated_at'],
                         ActiveRecord::EVENT_BEFORE_UPDATE => ['updated_at'],
                     ],
                     'value' => new Expression('NOW()'),
                 ],
             ];
    }
    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Name'),
            'desc' => Yii::t('app', 'Desc'),
            'status.name' => Yii::t('app', 'Statusid'),
            'father.name' => Yii::t('app', 'Father name'),
            'created_at' => Yii::t('app', 'Created At'),
            'updated_at' => Yii::t('app', 'Updated At'),
            'image' => Yii::t('app', ' Image'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatus()
    {
        return $this->hasOne(Status::className(), ['id' => 'statusid']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getFather()
    {
        return $this->hasOne(Category::className(), ['id' => 'fatherid']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCategories()
    {
        return $this->hasMany(Category::className(), ['fatherid' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getItems()
    {
        return $this->hasMany(Item::className(), ['categoryId' => 'id']);
    }
}
