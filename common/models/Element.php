<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "q5vp2_element".
 *
 * @property integer $id
 * @property string $name
 * @property string $status
 * @property string $desc
 *
 * @property Status[] $statuses
 */
class Element extends \yii\db\ActiveRecord
{
    const FOR_RECORDS = 2;
    const FOR_TARGET = 1;
    const FOR_APPLICATION = 1;
    const FOR_ITEM= 1;
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'q5vp2_element';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['statusid'], 'integer'],
            [['name'], 'string', 'max' => 50],
            [['desc'], 'string', 'max' => 255],
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
            'status' => 'Status',
            'desc' => 'Desc',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatuses()
    {
        return $this->hasMany(Status::className(), ['elementId' => 'id']);
    }
    
     /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatus()
    {
        return $this->hasOne(Status::className(), ['id' => 'statusid']);
    }
}
