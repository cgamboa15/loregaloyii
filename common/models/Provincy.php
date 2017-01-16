<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "q5vp2_provincy".
 *
 * @property integer $id
 * @property string $name
 * @property integer $countryid
 * @property integer $statusid
 *
 * @property City[] $cities
 * @property Item[] $items
 * @property Status $status
 */
class Provincy extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'q5vp2_provincy';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['countryid', 'statusid'], 'integer'],
            [['name'], 'string', 'max' => 30],
            [['statusid'], 'exist', 'skipOnError' => true, 'targetClass' => Status::className(), 'targetAttribute' => ['statusid' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'countryid' => 'Countryid',
            'statusid' => 'Statusid',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCities()
    {
        return $this->hasMany(City::className(), ['provincyid' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getItems()
    {
        return $this->hasMany(Item::className(), ['provincyId' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatus()
    {
        return $this->hasOne(Status::className(), ['id' => 'statusid']);
    }
}
