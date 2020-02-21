# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
2.6.5

* Rails version
6.0.0

* Database creation
mysql version 5.6

## **DB設計**

#### **projects table**

|Column       |type         |option       |
|:------------|:------------|:------------|
|id           |             |             |
|name         |string       |null:false   |

#### **Asociation**
has_many tasks

#### **tasks table**

|Column       |type         |option       |
|:------------|:------------|:------------|
|id           |             |             |
|title        |string       |null:false   |
|deadline     |data         |             |
|description  |text         |             |
|project      |references   |foreign_key  |

#### **Asociation**
belongs_to project

## 将来設計
タグをタスクに追加する場合

#### **projects table**

変更なし

#### **Asociation**

変更なし

#### **tasks table**

|Column       |type         |option       |
|:------------|:------------|:------------|
|id           |             |             |
|title        |string       |null:false   |
|deadline     |data         |             |
|description  |text         |             |
|project      |references   |foreign_key  |

#### **Asociation**
belongs_to project
has_many tags, through :task_tags

#### **task_tags table**

|Column       |type         |option       |
|:------------|:------------|:------------|
|id           |             |             |
|task         |references   |foreign_key  |
|tag          |references   |foreign_key  |

#### **Asociation**
belongs_to task
belongs_to tag

#### **tags table**

|Column       |type         |option       |
|:------------|:------------|:------------|
|id           |             |             |
|title        |string       |null:false   |


#### **Asociation**
なし
