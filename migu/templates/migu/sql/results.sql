{% extends "migu/sql/base.sql" %}{% block content %}
/**
 * 时间: {{ now }}
 */

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for migu_test_result
-- ----------------------------
DROP TABLE IF EXISTS `migu_test_result`;
CREATE TABLE `migu_test_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service` varchar(50) NOT NULL,
  `version` varchar(25) NOT NULL,
  `data` longtext NOT NULL,
  `url` longtext NOT NULL,
  `headers` longtext,
  `status` int(11) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `result` longtext,
  `ExecutionTime` double NOT NULL,
  `CreateTime` datetime NOT NULL,
  `server_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `migu_test_result_5dc6e1b7` (`server_id`),
  CONSTRAINT `migu_test_result_server_id_c017d42_fk_migu_server_id` FOREIGN KEY (`server_id`) REFERENCES `migu_server` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of migu_test_result
-- ----------------------------
{% autoescape off %}
{% for result in results %}
INSERT INTO `migu_test_result` VALUES (
'{{ result.id }}',
'{{ result.service }}',
'{{ result.version }}',
'{{ result.data }}',
'{{ result.url }}',
'{{ result.headers }}',
'{{ result.status }}',
'{{ result.message }}',
'{{ result.result }}',
'{{ result.ExecutionTime }}',
'{{ result.CreateTime|date:"Y-m-d H:i:s" }}',
'{{ result.server_id }}');
{% endfor %}
{% endautoescape %}
{% endblock content %}