<?php

namespace common\models;
use Yii;
use common\models\City;
use common\models\Status;
use yii\base\NotSupportedException;
use yii\behaviors\TimestampBehavior;
use yii\db\ActiveRecord;
use yii\web\IdentityInterface;
use yii\db\Expression;

/**
 * This is the model class for table "q5vp2_user".
 *
 * @property integer $id
 * @property string $username
 * @property string $phone
 * @property integer $cityid
 * @property string $genre
 * @property integer $typeid
 * @property string $auth_key
 * @property string $password_hash
 * @property string $password_reset_token
 * @property string $email
 * @property integer $statusid
 * @property integer $created_at
 * @property integer $updated_at
 *
 * @property Application[] $applications
 * @property Item[] $products
 * @property Item[] $items
 * @property Status $status
 * @property City $city
 */
class User  extends ActiveRecord implements IdentityInterface
{
    const STATUS_DELETED = 0;
    const STATUS_INACTIVE = 10;
    const STATUS_ACTIVE = 9;
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'q5vp2_user';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['username', 'email'], 'required'],
            [['cityid', 'typeid', 'statusid', 'sendmail'], 'integer'],
            [['username', 'email'], 'string', 'max' => 255],
            [['phone', 'auth_key'], 'string', 'max' => 32],
            [['genre'], 'string', 'max' => 2],
            [['username'], 'unique'],
            [['email'], 'unique'],
            [['statusid'], 'exist', 'skipOnError' => true, 'targetClass' => Status::className(), 'targetAttribute' => ['statusid' => 'id']],
            [['cityid'], 'exist', 'skipOnError' => true, 'targetClass' => City::className(), 'targetAttribute' => ['cityid' => 'id']],
            ['statusid', 'default', 'value' => self::STATUS_ACTIVE],
            ['statusid', 'in', 'range' => [self::STATUS_ACTIVE, self::STATUS_DELETED]],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'username' => 'Nombre de Usuario',
            'phone' => 'Telefono',
            'cityid' => 'Ciudad',
            'genre' => 'Género',
            'typeid' => 'Typeid',
            'auth_key' => 'Auth Key',
            'password_hash' => 'Password Hash',
            'password_reset_token' => 'Password Reset Token',
            'email' => 'Email',
            'status.name' => 'Estado',
            'sendmail' => Yii::t('app', 'sendmail'),
            
        ];
    }
    
    /**
     * @inheritdoc
     */
    public static function findIdentity($id)
    {
        return static::findOne(['id' => $id, 'statusid' => self::STATUS_ACTIVE]);
    }

    /**
     * @inheritdoc
     */
    public static function findIdentityByAccessToken($token, $type = null)
    {
        throw new NotSupportedException('"findIdentityByAccessToken" is not implemented.');
    }

    /**
     * Finds user by username
     *
     * @param string $username
     * @return static|null
     */
    public static function findByUsername($username)
    {
        return static::findOne(['username' => $username, 'statusid' => self::STATUS_ACTIVE]);
    }

    /**
     * Finds user by password reset token
     *
     * @param string $token password reset token
     * @return static|null
     */
    public static function findByPasswordResetToken($token)
    {
        if (!static::isPasswordResetTokenValid($token)) {
            return null;
        }

        return static::findOne([
            'password_reset_token' => $token,
            'statusid' => self::STATUS_ACTIVE,
        ]);
    }

    /**
     * Finds out if password reset token is valid
     *
     * @param string $token password reset token
     * @return bool
     */
    public static function isPasswordResetTokenValid($token)
    {
        if (empty($token)) {
            return false;
        }

        $timestamp = (int) substr($token, strrpos($token, '_') + 1);
        $expire = Yii::$app->params['user.passwordResetTokenExpire'];
        return $timestamp + $expire >= time();
    }

    /**
     * @inheritdoc
     */
    public function getId()
    {
        return $this->getPrimaryKey();
    }

    /**
     * @inheritdoc
     */
    public function getAuthKey()
    {
        return $this->auth_key;
    }

    /**
     * @inheritdoc
     */
    public function validateAuthKey($authKey)
    {
        return $this->getAuthKey() === $authKey;
    }

    /**
     * Validates password
     *
     * @param string $password password to validate
     * @return bool if password provided is valid for current user
     */
    public function validatePassword($password)
    {
        return Yii::$app->security->validatePassword($password, $this->password_hash);
    }

    /**
     * Generates password hash from password and sets it to the model
     *
     * @param string $password
     */
    public function setPassword($password)
    {
        $this->password_hash = Yii::$app->security->generatePasswordHash($password);
    }

    /**
     * Generates "remember me" authentication key
     */
    public function generateAuthKey()
    {
        $this->auth_key = Yii::$app->security->generateRandomString();
    }

    /**
     * Generates new password reset token
     */
    public function generatePasswordResetToken()
    {
        $this->password_reset_token = Yii::$app->security->generateRandomString() . '_' . time();
    }

    /**
     * Removes password reset token
     */
    public function removePasswordResetToken()
    {
        $this->password_reset_token = null;
    }
    
     /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
           
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
     * @return \yii\db\ActiveQuery
     */
    public function getApplications()
    {
        return $this->hasMany(Application::className(), ['userId' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProducts()
    {
        return $this->hasMany(Item::className(), ['id' => 'productId'])->viaTable('q5vp2_application', ['userId' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getItems()
    {
        return $this->hasMany(Item::className(), ['userId' => 'id']);
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
    public function getSendmail()
    {
        return $this->hasOne(Status::className(), ['id' => 'sendmail']);
    }
    
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCity()
    {
        return $this->hasOne(City::className(), ['id' => 'cityid']);
    }
}
