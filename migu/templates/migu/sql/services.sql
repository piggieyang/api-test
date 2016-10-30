{% extends "migu/sql/base.sql" %}{% block content %}
/**
 * 时间：{{ now }}
 */

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for migu_{{ model }}_service
-- ----------------------------
DROP TABLE IF EXISTS `migu_{{ model }}_service`;
CREATE TABLE `migu_{{ model }}_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `service` varchar(50) NOT NULL,
  `version` varchar(5) NOT NULL,
  `data` longtext NOT NULL,
  `description` longtext,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `migu_{{ model }}_service_version_uniq` (`version`,`service`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of migu_{{ model }}_service
-- ----------------------------
{% autoescape off %}
{% for service in services %}
INSERT INTO `migu_{{ model }}_service` VALUES (
'{{ service.id }}',
'{{ service.name }}',
'{{ service.service }}',
'{{ service.version }}',
'{{ service.data }}',
'{{ service.description }}',
'{% if service.active %}1{% else %}0{% endif %}');
{% endfor %}
{% endautoescape %}
{% endblock content %}