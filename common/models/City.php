<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "q5vp2_city".
 *
 * @property integer $id
 * @property string $name
 * @property integer $provincyid
 * @property integer $countryid
 * @property integer $statusid
 *
 * @property Provincy $provincy
 * @property Status $status
 * @property Item[] $items
 * @property User[] $users
 */
class City extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'q5vp2_city';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'provincyid', 'countryid'], 'required'],
            [['provincyid', 'countryid', 'statusid'], 'integer'],
            [['name'], 'string', 'max' => 50],
            [['provincyid'], 'exist', 'skipOnError' => true, 'targetClass' => Provincy::className(), 'targetAttribute' => ['provincyid' => 'id']],
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
            'provincyid' => 'Provincyid',
            'countryid' => 'Countryid',
            'statusid' => 'Statusid',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProvincy()
    {
        return $this->hasOne(Provincy::className(), ['id' => 'provincyid']);
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
    public function getItems()
    {
        return $this->hasMany(Item::className(), ['cityId' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUsers()
    {
        return $this->hasMany(User::className(), ['cityid' => 'id']);
    }
}
