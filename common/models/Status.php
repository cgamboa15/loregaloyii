<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "q5vp2_status".
 *
 * @property integer $id
 * @property string $name
 * @property string $status
 * @property integer $elementId
 *
 * @property Category[] $categories
 * @property Image[] $images
 * @property Item[] $items
 * @property Element $element
 */
class Status extends \yii\db\ActiveRecord
{
    const STATUS_INACTIVE = 10;
    const STATUS_ACTIVE = 9;
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'q5vp2_status';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['status'], 'string'],
            [['elementId'], 'integer'],
            [['name'], 'string', 'max' => 50],
            [['elementId'], 'exist', 'skipOnError' => true, 'targetClass' => Element::className(), 'targetAttribute' => ['elementId' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Nombre',
            'status' => 'Estado',
            'elementId' => 'Element ID',
            'element.name' => 'Elemento ',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCategories()
    {
        return $this->hasMany(Category::className(), ['statusid' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getImages()
    {
        return $this->hasMany(Image::className(), ['statusid' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getItems()
    {
        return $this->hasMany(Item::className(), ['usedtime' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getElement()
    {
        return $this->hasOne(Element::className(), ['id' => 'elementId']);
    }
}
