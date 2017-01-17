<?php

namespace common\models;

use Yii;

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
            [['name', 'desc', 'fatherid', 'created_at', 'updated_at'], 'required'],
            [['statusid', 'fatherid'], 'integer'],
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
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Name'),
            'desc' => Yii::t('app', 'Desc'),
            'statusid' => Yii::t('app', 'Statusid'),
            'fatherid' => Yii::t('app', 'Fatherid'),
            'created_at' => Yii::t('app', 'Created At'),
            'updated_at' => Yii::t('app', 'Updated At'),
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
