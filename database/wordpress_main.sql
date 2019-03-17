-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: wordpress_main
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_commentmeta`
--

LOCK TABLES `wp_commentmeta` WRITE;
/*!40000 ALTER TABLE `wp_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_comments`
--

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;
INSERT INTO `wp_comments` VALUES (1,1,'A WordPress Commenter','wapuu@wordpress.example','https://wordpress.org/','','2018-12-15 21:53:52','2018-12-15 21:53:52','Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com\">Gravatar</a>.',0,'1','','',0,0);
/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_links`
--

LOCK TABLES `wp_links` WRITE;
/*!40000 ALTER TABLE `wp_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_options`
--

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
INSERT INTO `wp_options` VALUES (1,'siteurl','http://192.168.44.44','yes'),(2,'home','http://192.168.44.44','yes'),(3,'blogname','Mighty Ops','yes'),(4,'blogdescription','','yes'),(5,'users_can_register','0','yes'),(6,'admin_email','admin@mightybox.io','yes'),(7,'start_of_week','1','yes'),(8,'use_balanceTags','0','yes'),(9,'use_smilies','1','yes'),(10,'require_name_email','1','yes'),(11,'comments_notify','1','yes'),(12,'posts_per_rss','10','yes'),(13,'rss_use_excerpt','0','yes'),(14,'mailserver_url','mail.example.com','yes'),(15,'mailserver_login','login@example.com','yes'),(16,'mailserver_pass','password','yes'),(17,'mailserver_port','110','yes'),(18,'default_category','1','yes'),(19,'default_comment_status','open','yes'),(20,'default_ping_status','open','yes'),(21,'default_pingback_flag','1','yes'),(22,'posts_per_page','10','yes'),(23,'date_format','F j, Y','yes'),(24,'time_format','g:i a','yes'),(25,'links_updated_date_format','F j, Y g:i a','yes'),(26,'comment_moderation','0','yes'),(27,'moderation_notify','1','yes'),(28,'permalink_structure','/%postname%/','yes'),(29,'rewrite_rules','a:115:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:10:\"clients/?$\";s:27:\"index.php?post_type=clients\";s:40:\"clients/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=clients&feed=$matches[1]\";s:35:\"clients/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=clients&feed=$matches[1]\";s:27:\"clients/page/([0-9]{1,})/?$\";s:45:\"index.php?post_type=clients&paged=$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:46:\"topic/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?skills=$matches[1]&feed=$matches[2]\";s:41:\"topic/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?skills=$matches[1]&feed=$matches[2]\";s:22:\"topic/([^/]+)/embed/?$\";s:39:\"index.php?skills=$matches[1]&embed=true\";s:34:\"topic/([^/]+)/page/?([0-9]{1,})/?$\";s:46:\"index.php?skills=$matches[1]&paged=$matches[2]\";s:16:\"topic/([^/]+)/?$\";s:28:\"index.php?skills=$matches[1]\";s:35:\"clients/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:45:\"clients/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:65:\"clients/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"clients/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"clients/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:41:\"clients/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:24:\"clients/([^/]+)/embed/?$\";s:40:\"index.php?clients=$matches[1]&embed=true\";s:28:\"clients/([^/]+)/trackback/?$\";s:34:\"index.php?clients=$matches[1]&tb=1\";s:48:\"clients/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?clients=$matches[1]&feed=$matches[2]\";s:43:\"clients/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?clients=$matches[1]&feed=$matches[2]\";s:36:\"clients/([^/]+)/page/?([0-9]{1,})/?$\";s:47:\"index.php?clients=$matches[1]&paged=$matches[2]\";s:43:\"clients/([^/]+)/comment-page-([0-9]{1,})/?$\";s:47:\"index.php?clients=$matches[1]&cpage=$matches[2]\";s:32:\"clients/([^/]+)(?:/([0-9]+))?/?$\";s:46:\"index.php?clients=$matches[1]&page=$matches[2]\";s:24:\"clients/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:34:\"clients/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:54:\"clients/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"clients/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"clients/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:30:\"clients/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}','yes'),(30,'hack_file','0','yes'),(31,'blog_charset','UTF-8','yes'),(32,'moderation_keys','','no'),(33,'active_plugins','a:0:{}','yes'),(34,'category_base','','yes'),(35,'ping_sites','http://rpc.pingomatic.com/','yes'),(36,'comment_max_links','2','yes'),(37,'gmt_offset','0','yes'),(38,'default_email_category','1','yes'),(39,'recently_edited','','no'),(40,'template','mightyops','yes'),(41,'stylesheet','mightyops','yes'),(42,'comment_whitelist','1','yes'),(43,'blacklist_keys','','no'),(44,'comment_registration','0','yes'),(45,'html_type','text/html','yes'),(46,'use_trackback','0','yes'),(47,'default_role','subscriber','yes'),(48,'db_version','43764','yes'),(49,'uploads_use_yearmonth_folders','1','yes'),(50,'upload_path','','yes'),(51,'blog_public','1','yes'),(52,'default_link_category','2','yes'),(53,'show_on_front','posts','yes'),(54,'tag_base','','yes'),(55,'show_avatars','1','yes'),(56,'avatar_rating','G','yes'),(57,'upload_url_path','','yes'),(58,'thumbnail_size_w','150','yes'),(59,'thumbnail_size_h','150','yes'),(60,'thumbnail_crop','1','yes'),(61,'medium_size_w','300','yes'),(62,'medium_size_h','300','yes'),(63,'avatar_default','mystery','yes'),(64,'large_size_w','1024','yes'),(65,'large_size_h','1024','yes'),(66,'image_default_link_type','none','yes'),(67,'image_default_size','','yes'),(68,'image_default_align','','yes'),(69,'close_comments_for_old_posts','0','yes'),(70,'close_comments_days_old','14','yes'),(71,'thread_comments','1','yes'),(72,'thread_comments_depth','5','yes'),(73,'page_comments','0','yes'),(74,'comments_per_page','50','yes'),(75,'default_comments_page','newest','yes'),(76,'comment_order','asc','yes'),(77,'sticky_posts','a:0:{}','yes'),(78,'widget_categories','a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(79,'widget_text','a:0:{}','yes'),(80,'widget_rss','a:0:{}','yes'),(81,'uninstall_plugins','a:0:{}','no'),(82,'timezone_string','','yes'),(83,'page_for_posts','0','yes'),(84,'page_on_front','0','yes'),(85,'default_post_format','0','yes'),(86,'link_manager_enabled','0','yes'),(87,'finished_splitting_shared_terms','1','yes'),(88,'site_icon','0','yes'),(89,'medium_large_size_w','768','yes'),(90,'medium_large_size_h','0','yes'),(91,'wp_page_for_privacy_policy','3','yes'),(92,'show_comments_cookies_opt_in','0','yes'),(93,'initial_db_version','43764','yes'),(94,'wp_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','yes'),(95,'fresh_site','1','yes'),(96,'widget_search','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(97,'widget_recent-posts','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(98,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(99,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(100,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(101,'sidebars_widgets','a:2:{s:19:\"wp_inactive_widgets\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}','yes'),(102,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(103,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(104,'widget_media_audio','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(105,'widget_media_image','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(106,'widget_media_gallery','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(107,'widget_media_video','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(108,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(109,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(110,'widget_custom_html','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(111,'cron','a:5:{i:1552784032;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1552816432;a:3:{s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1552859688;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1552866336;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}','yes'),(112,'theme_mods_twentynineteen','a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1544910924;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}','yes'),(123,'can_compress_scripts','0','no'),(130,'WPLANG','','yes'),(131,'new_admin_email','admin@mightybox.io','yes'),(136,'current_theme','mightyops | Mighty | Middle Seat','yes'),(137,'theme_mods_mightyops','a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:12:\"Social Links\";i:21;}s:18:\"custom_css_post_id\";i:-1;}','yes'),(138,'theme_switched','','yes'),(139,'category_children','a:0:{}','yes'),(157,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:3:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.1.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.1.1.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.1.1-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.1.1-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.1.1\";s:7:\"version\";s:5:\"5.1.1\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.0\";s:15:\"partial_version\";s:0:\"\";}i:1;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.1.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.1.1.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.1.1-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.1.1-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.1.1\";s:7:\"version\";s:5:\"5.1.1\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.0\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}i:2;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.0.4.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.0.4.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.0.4-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.0.4-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-5.0.4-partial-2.zip\";s:8:\"rollback\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.0.4-rollback-2.zip\";}s:7:\"current\";s:5:\"5.0.4\";s:7:\"version\";s:5:\"5.0.4\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.0\";s:15:\"partial_version\";s:5:\"5.0.2\";s:9:\"new_files\";s:0:\"\";}}s:12:\"last_checked\";i:1552781755;s:15:\"version_checked\";s:5:\"5.0.2\";s:12:\"translations\";a:0:{}}','no'),(169,'nav_menu_options','a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}','yes'),(246,'_site_transient_timeout_theme_roots','1552783554','no'),(247,'_site_transient_theme_roots','a:2:{s:9:\"mightyops\";s:7:\"/themes\";s:14:\"twentynineteen\";s:7:\"/themes\";}','no'),(249,'_site_transient_update_themes','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1552781756;s:7:\"checked\";a:2:{s:9:\"mightyops\";s:5:\"1.0.0\";s:14:\"twentynineteen\";s:3:\"1.1\";}s:8:\"response\";a:1:{s:14:\"twentynineteen\";a:4:{s:5:\"theme\";s:14:\"twentynineteen\";s:11:\"new_version\";s:3:\"1.3\";s:3:\"url\";s:44:\"https://wordpress.org/themes/twentynineteen/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/theme/twentynineteen.1.3.zip\";}}s:12:\"translations\";a:0:{}}','no'),(250,'_site_transient_update_plugins','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1552781756;s:7:\"checked\";a:2:{s:19:\"akismet/akismet.php\";s:3:\"4.1\";s:9:\"hello.php\";s:5:\"1.7.1\";}s:8:\"response\";a:1:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.1.1\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.1.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:3:\"5.1\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:1:{s:9:\"hello.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=969907\";s:2:\"1x\";s:63:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=969907\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:65:\"https://ps.w.org/hello-dolly/assets/banner-772x250.png?rev=478342\";}s:11:\"banners_rtl\";a:0:{}}}}','no');
/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_postmeta`
--

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` VALUES (1,2,'_wp_page_template','default'),(2,3,'_wp_page_template','default'),(3,6,'_edit_last','1'),(4,6,'_edit_lock','1544929827:1'),(5,8,'_wp_attached_file','2018/12/splash.png'),(6,8,'_wp_attachment_metadata','a:4:{s:5:\"width\";i:3360;s:6:\"height\";i:2568;s:4:\"file\";s:18:\"2018/12/splash.png\";s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(7,6,'_thumbnail_id','8'),(8,9,'_wp_attached_file','2018/12/host.png'),(9,9,'_wp_attachment_metadata','a:4:{s:5:\"width\";i:3360;s:6:\"height\";i:2222;s:4:\"file\";s:16:\"2018/12/host.png\";s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(14,10,'_wp_attached_file','2018/12/aclu.svg'),(15,6,'_client','10'),(16,11,'_edit_last','1'),(17,11,'_edit_lock','1544929839:1'),(18,12,'_wp_attached_file','2018/12/beto.svg'),(19,11,'_client','12'),(20,14,'_wp_attached_file','2018/12/votebeto.png'),(21,14,'_wp_attachment_metadata','a:4:{s:5:\"width\";i:3360;s:6:\"height\";i:6730;s:4:\"file\";s:20:\"2018/12/votebeto.png\";s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(22,11,'_thumbnail_id','14'),(23,15,'_edit_last','1'),(24,15,'_edit_lock','1544929995:1'),(25,16,'_wp_attached_file','2018/12/commondefense.svg'),(26,17,'_wp_attached_file','2018/12/home.png'),(27,17,'_wp_attachment_metadata','a:4:{s:5:\"width\";i:3360;s:6:\"height\";i:5236;s:4:\"file\";s:16:\"2018/12/home.png\";s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(28,15,'_thumbnail_id','17'),(29,15,'_client','16'),(30,19,'_edit_last','1'),(31,19,'_edit_lock','1544928921:1'),(32,20,'_wp_attached_file','2018/12/fairnessmaryland.svg'),(33,21,'_wp_attached_file','2018/12/realjustice.svg'),(34,22,'_wp_attached_file','2018/12/zephyr.svg'),(35,23,'_wp_attached_file','2018/12/home-1.png'),(36,23,'_wp_attachment_metadata','a:4:{s:5:\"width\";i:3360;s:6:\"height\";i:7666;s:4:\"file\";s:18:\"2018/12/home-1.png\";s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(37,19,'_thumbnail_id','23'),(38,19,'_client','20'),(39,25,'_edit_last','1'),(40,25,'_edit_lock','1544929045:1'),(41,25,'_client','21'),(42,27,'_wp_attached_file','2018/12/commit.png'),(43,27,'_wp_attachment_metadata','a:4:{s:5:\"width\";i:3360;s:6:\"height\";i:5494;s:4:\"file\";s:18:\"2018/12/commit.png\";s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(44,25,'_thumbnail_id','27'),(45,28,'_edit_last','1'),(46,28,'_edit_lock','1544929811:1'),(47,29,'_wp_attached_file','2018/12/home-2.png'),(48,29,'_wp_attachment_metadata','a:4:{s:5:\"width\";i:3360;s:6:\"height\";i:8856;s:4:\"file\";s:18:\"2018/12/home-2.png\";s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(49,28,'_thumbnail_id','29'),(50,28,'_client','22'),(51,6,'_featured','featured'),(53,11,'_featured','featured'),(54,15,'_featured','featured'),(55,37,'_edit_last','1'),(56,37,'_edit_lock','1545429666:1'),(57,37,'_thumbnail_id','8'),(58,37,'_client','10'),(59,37,'_featured','featured'),(60,37,'_link','https://peoplepower.org/phonebank'),(61,39,'_edit_last','1'),(62,39,'_edit_lock','1546913394:1'),(63,39,'_thumbnail_id','14'),(64,39,'_client','12'),(65,39,'_featured','featured'),(66,39,'_link','https://betofortexas.com/meetbeto/'),(67,41,'_edit_last','1'),(68,41,'_edit_lock','1545429782:1'),(69,41,'_thumbnail_id','17'),(70,41,'_client','16'),(71,41,'_featured','featured'),(72,41,'_link','https://commondefense.us'),(73,43,'_edit_last','1'),(74,43,'_edit_lock','1545429875:1'),(75,43,'_thumbnail_id','23'),(76,43,'_client','20'),(77,43,'_featured','featured'),(78,43,'_link','https://fairnessmaryland.org'),(79,45,'_edit_last','1'),(80,45,'_edit_lock','1545430047:1'),(81,45,'_thumbnail_id','27'),(82,45,'_client','21'),(83,45,'_featured','featured'),(84,45,'_link','https://realjusticepac.org'),(85,47,'_edit_last','1'),(86,47,'_edit_lock','1547059005:1'),(87,47,'_thumbnail_id','29'),(88,47,'_client','22'),(89,47,'_featured','featured'),(90,47,'_link','https://zephyrforny.com/'),(91,49,'_menu_item_type','custom'),(92,49,'_menu_item_menu_item_parent','0'),(93,49,'_menu_item_object_id','49'),(94,49,'_menu_item_object','custom'),(95,49,'_menu_item_target',''),(96,49,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(97,49,'_menu_item_xfn',''),(98,49,'_menu_item_url','https://github.com/ashsaraga'),(100,50,'_menu_item_type','custom'),(101,50,'_menu_item_menu_item_parent','0'),(102,50,'_menu_item_object_id','50'),(103,50,'_menu_item_object','custom'),(104,50,'_menu_item_target',''),(105,50,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(106,50,'_menu_item_xfn',''),(107,50,'_menu_item_url','https://www.behance.net/ashsaraga9c31'),(109,51,'_menu_item_type','custom'),(110,51,'_menu_item_menu_item_parent','0'),(111,51,'_menu_item_object_id','51'),(112,51,'_menu_item_object','custom'),(113,51,'_menu_item_target',''),(114,51,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(115,51,'_menu_item_xfn',''),(116,51,'_menu_item_url','https://twitter.com/mighty_lady?lang=en'),(118,52,'_menu_item_type','custom'),(119,52,'_menu_item_menu_item_parent','0'),(120,52,'_menu_item_object_id','52'),(121,52,'_menu_item_object','custom'),(122,52,'_menu_item_target',''),(123,52,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(124,52,'_menu_item_xfn',''),(125,52,'_menu_item_url','mailto:ash@mightyops.io'),(133,70,'_edit_last','1'),(134,70,'_edit_lock','1546641021:1'),(135,70,'_rating','85'),(136,70,'_icon','html5'),(137,70,'_iconSet','font-awesome-brands'),(138,71,'_edit_last','1'),(139,71,'_edit_lock','1546641020:1'),(140,71,'_rating','85'),(141,71,'_icon','css3'),(142,71,'_iconSet','font-awesome-brands'),(143,72,'_edit_last','1'),(144,72,'_edit_lock','1546732039:1'),(145,72,'_rating','70'),(146,72,'_icon','js-square'),(147,72,'_iconSet','font-awesome-brands'),(148,73,'_edit_last','1'),(149,73,'_edit_lock','1546732068:1'),(150,73,'_rating','50'),(151,73,'_icon','project-diagram'),(152,73,'_iconSet','font-awesome'),(153,74,'_edit_last','1'),(154,74,'_edit_lock','1546732063:1'),(155,74,'_rating','75'),(156,74,'_icon','adobe'),(157,74,'_iconSet','font-awesome-brands'),(158,75,'_edit_last','1'),(159,75,'_edit_lock','1546641017:1'),(160,75,'_rating','80'),(161,75,'_icon','wordpress'),(162,75,'_iconSet','font-awesome-brands'),(163,76,'_edit_last','1'),(164,76,'_edit_lock','1546641017:1'),(165,76,'_rating','80'),(166,76,'_icon','plus-square'),(167,76,'_iconSet','font-awesome'),(168,76,'_stack','front-end'),(169,75,'_stack','front-end'),(170,74,'_stack','front-end'),(171,73,'_stack','front-end'),(172,72,'_stack','front-end'),(173,71,'_stack','front-end'),(174,70,'_stack','front-end'),(175,77,'_edit_last','1'),(176,77,'_edit_lock','1546641010:1'),(177,77,'_rating','75'),(178,77,'_icon','ubuntu'),(179,77,'_iconSet','font-awesome-brands'),(180,77,'_stack','back-end'),(181,78,'_edit_last','1'),(182,78,'_edit_lock','1546641006:1'),(183,78,'_rating','65'),(184,78,'_icon','window'),(185,78,'_iconSet','font-awesome'),(186,78,'_stack','back-end'),(187,79,'_edit_last','1'),(188,79,'_edit_lock','1546641002:1'),(189,79,'_rating','60'),(190,79,'_icon','database'),(191,79,'_iconSet','font-awesome'),(192,79,'_stack','back-end'),(193,80,'_edit_last','1'),(194,80,'_edit_lock','1546640998:1'),(195,80,'_rating','65'),(196,80,'_icon','php'),(197,80,'_iconSet','font-awesome-brands'),(198,80,'_stack','back-end'),(199,81,'_edit_last','1'),(200,81,'_edit_lock','1546640991:1'),(201,81,'_rating','35'),(202,81,'_icon','python'),(203,81,'_iconSet','font-awesome-brands'),(204,81,'_stack','back-end'),(205,82,'_edit_last','1'),(206,82,'_edit_lock','1546640986:1'),(207,82,'_rating','40'),(208,82,'_icon','gem'),(209,82,'_iconSet','font-awesome'),(210,82,'_stack','back-end'),(211,83,'_edit_last','1'),(212,83,'_edit_lock','1546640981:1'),(213,83,'_rating','55'),(214,83,'_icon','hashtag'),(215,83,'_iconSet','font-awesome'),(216,83,'_stack','back-end');
/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_posts`
--

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES (1,1,'2018-12-15 21:53:52','2018-12-15 21:53:52','<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->','Hello world!','','publish','open','open','','hello-world','','','2018-12-15 21:53:52','2018-12-15 21:53:52','',0,'http://192.168.44.44/?p=1',0,'post','',1),(2,1,'2018-12-15 21:53:52','2018-12-15 21:53:52','<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"http://192.168.44.44/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->','Sample Page','','publish','closed','open','','sample-page','','','2018-12-15 21:53:52','2018-12-15 21:53:52','',0,'http://192.168.44.44/?page_id=2',0,'page','',0),(3,1,'2018-12-15 21:53:52','2018-12-15 21:53:52','<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Our website address is: http://192.168.44.44.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What personal data we collect and why we collect it</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Comments</h3><!-- /wp:heading --><!-- wp:paragraph --><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Media</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Contact forms</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Cookies</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you have an account and you log in to this site, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Embedded content from other websites</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Analytics</h3><!-- /wp:heading --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where we send your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Your contact information</h2><!-- /wp:heading --><!-- wp:heading --><h2>Additional information</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>How we protect your data</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What data breach procedures we have in place</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What third parties we receive data from</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What automated decision making and/or profiling we do with user data</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Industry regulatory disclosure requirements</h3><!-- /wp:heading -->','Privacy Policy','','draft','closed','open','','privacy-policy','','','2018-12-15 21:53:52','2018-12-15 21:53:52','',0,'http://192.168.44.44/?page_id=3',0,'page','',0),(6,1,'2018-12-16 01:45:25','2018-12-16 01:45:25','','ACLU People Power','','publish','closed','closed','','aclu-people-power','','','2018-12-16 03:12:47','2018-12-16 03:12:47','',0,'http://192.168.44.44/?post_type=projects&#038;p=6',0,'projects','',0),(7,1,'2018-12-16 01:45:25','2018-12-16 01:45:25','','ACLU People Power','','inherit','closed','closed','','6-revision-v1','','','2018-12-16 01:45:25','2018-12-16 01:45:25','',6,'http://192.168.44.44/6-revision-v1/',0,'revision','',0),(8,1,'2018-12-16 01:46:59','2018-12-16 01:46:59','','splash','','inherit','closed','closed','','splash','','','2018-12-16 01:46:59','2018-12-16 01:46:59','',6,'http://192.168.44.44/wp-content/uploads/2018/12/splash.png',0,'attachment','image/png',0),(9,1,'2018-12-16 01:47:20','2018-12-16 01:47:20','','host','','inherit','closed','closed','','host','','','2018-12-16 01:47:20','2018-12-16 01:47:20','',6,'http://192.168.44.44/wp-content/uploads/2018/12/host.png',0,'attachment','image/png',0),(10,1,'2018-12-16 02:35:50','2018-12-16 02:35:50','','aclu','','inherit','closed','closed','','aclu','','','2018-12-16 02:35:50','2018-12-16 02:35:50','',6,'http://192.168.44.44/wp-content/uploads/2018/12/aclu.svg',0,'attachment','image/svg+xml',0),(11,1,'2018-12-16 02:44:20','2018-12-16 02:44:20','','Beto O\'Rourke','','publish','closed','closed','','beto-orourke','','','2018-12-16 03:13:02','2018-12-16 03:13:02','',0,'http://192.168.44.44/?post_type=projects&#038;p=11',0,'projects','',0),(12,1,'2018-12-16 02:40:23','2018-12-16 02:40:23','','beto','','inherit','closed','closed','','beto','','','2018-12-16 02:40:23','2018-12-16 02:40:23','',11,'http://192.168.44.44/wp-content/uploads/2018/12/beto.svg',0,'attachment','image/svg+xml',0),(13,1,'2018-12-16 02:44:20','2018-12-16 02:44:20','','Beto O\'Rourke','','inherit','closed','closed','','11-revision-v1','','','2018-12-16 02:44:20','2018-12-16 02:44:20','',11,'http://192.168.44.44/11-revision-v1/',0,'revision','',0),(14,1,'2018-12-16 02:47:25','2018-12-16 02:47:25','','votebeto','','inherit','closed','closed','','votebeto','','','2018-12-16 02:47:25','2018-12-16 02:47:25','',11,'http://192.168.44.44/wp-content/uploads/2018/12/votebeto.png',0,'attachment','image/png',0),(15,1,'2018-12-16 02:50:04','2018-12-16 02:50:04','','Common Defense','','publish','closed','closed','','common-defense','','','2018-12-16 03:13:15','2018-12-16 03:13:15','',0,'http://192.168.44.44/?post_type=projects&#038;p=15',0,'projects','',0),(16,1,'2018-12-16 02:48:18','2018-12-16 02:48:18','','commondefense','','inherit','closed','closed','','commondefense','','','2018-12-16 02:48:18','2018-12-16 02:48:18','',15,'http://192.168.44.44/wp-content/uploads/2018/12/commondefense.svg',0,'attachment','image/svg+xml',0),(17,1,'2018-12-16 02:49:57','2018-12-16 02:49:57','','home','','inherit','closed','closed','','home','','','2018-12-16 02:49:57','2018-12-16 02:49:57','',15,'http://192.168.44.44/wp-content/uploads/2018/12/home.png',0,'attachment','image/png',0),(18,1,'2018-12-16 02:50:04','2018-12-16 02:50:04','','Common Defense','','inherit','closed','closed','','15-revision-v1','','','2018-12-16 02:50:04','2018-12-16 02:50:04','',15,'http://192.168.44.44/15-revision-v1/',0,'revision','',0),(19,1,'2018-12-16 02:57:44','2018-12-16 02:57:44','','Fairness Maryland','','publish','closed','closed','','fairness-maryland','','','2018-12-16 02:57:44','2018-12-16 02:57:44','',0,'http://192.168.44.44/?post_type=projects&#038;p=19',0,'projects','',0),(20,1,'2018-12-16 02:56:54','2018-12-16 02:56:54','','fairnessmaryland','','inherit','closed','closed','','fairnessmaryland','','','2018-12-16 02:56:54','2018-12-16 02:56:54','',19,'http://192.168.44.44/wp-content/uploads/2018/12/fairnessmaryland.svg',0,'attachment','image/svg+xml',0),(21,1,'2018-12-16 02:56:54','2018-12-16 02:56:54','','realjustice','','inherit','closed','closed','','realjustice','','','2018-12-16 02:56:54','2018-12-16 02:56:54','',19,'http://192.168.44.44/wp-content/uploads/2018/12/realjustice.svg',0,'attachment','image/svg+xml',0),(22,1,'2018-12-16 02:56:54','2018-12-16 02:56:54','','zephyr','','inherit','closed','closed','','zephyr','','','2018-12-16 02:56:54','2018-12-16 02:56:54','',19,'http://192.168.44.44/wp-content/uploads/2018/12/zephyr.svg',0,'attachment','image/svg+xml',0),(23,1,'2018-12-16 02:57:37','2018-12-16 02:57:37','','home','','inherit','closed','closed','','home-2','','','2018-12-16 02:57:37','2018-12-16 02:57:37','',19,'http://192.168.44.44/wp-content/uploads/2018/12/home-1.png',0,'attachment','image/png',0),(24,1,'2018-12-16 02:57:44','2018-12-16 02:57:44','','Fairness Maryland','','inherit','closed','closed','','19-revision-v1','','','2018-12-16 02:57:44','2018-12-16 02:57:44','',19,'http://192.168.44.44/19-revision-v1/',0,'revision','',0),(25,1,'2018-12-16 02:59:06','2018-12-16 02:59:06','','Real Justice','','publish','closed','closed','','real-justice','','','2018-12-16 02:59:43','2018-12-16 02:59:43','',0,'http://192.168.44.44/?post_type=projects&#038;p=25',0,'projects','',0),(26,1,'2018-12-16 02:59:06','2018-12-16 02:59:06','','Real Justice','','inherit','closed','closed','','25-revision-v1','','','2018-12-16 02:59:06','2018-12-16 02:59:06','',25,'http://192.168.44.44/25-revision-v1/',0,'revision','',0),(27,1,'2018-12-16 02:59:36','2018-12-16 02:59:36','','commit','','inherit','closed','closed','','commit','','','2018-12-16 02:59:36','2018-12-16 02:59:36','',25,'http://192.168.44.44/wp-content/uploads/2018/12/commit.png',0,'attachment','image/png',0),(28,1,'2018-12-16 03:00:50','2018-12-16 03:00:50','','Zephyr Teachout','','publish','closed','closed','','zephyr-teachout','','','2018-12-16 03:00:50','2018-12-16 03:00:50','',0,'http://192.168.44.44/?post_type=projects&#038;p=28',0,'projects','',0),(29,1,'2018-12-16 03:00:43','2018-12-16 03:00:43','','home','','inherit','closed','closed','','home-3','','','2018-12-16 03:00:43','2018-12-16 03:00:43','',28,'http://192.168.44.44/wp-content/uploads/2018/12/home-2.png',0,'attachment','image/png',0),(30,1,'2018-12-16 03:00:50','2018-12-16 03:00:50','','Zephyr Teachout','','inherit','closed','closed','','28-revision-v1','','','2018-12-16 03:00:50','2018-12-16 03:00:50','',28,'http://192.168.44.44/28-revision-v1/',0,'revision','',0),(37,1,'2018-12-21 21:57:27','2018-12-21 21:57:27','','ACLU People Power','','publish','closed','closed','','aclu-people-power','','','2018-12-21 22:03:29','2018-12-21 22:03:29','',0,'http://192.168.44.44/?post_type=clients&#038;p=37',0,'clients','',0),(38,1,'2018-12-21 21:57:27','2018-12-21 21:57:27','','ACLU People Power','','inherit','closed','closed','','37-revision-v1','','','2018-12-21 21:57:27','2018-12-21 21:57:27','',37,'http://192.168.44.44/37-revision-v1/',0,'revision','',0),(39,1,'2018-12-21 22:00:23','2018-12-21 22:00:23','','Beto O\'Rourke','','publish','closed','closed','','beto-orourke','','','2018-12-21 22:01:35','2018-12-21 22:01:35','',0,'http://192.168.44.44/?post_type=clients&#038;p=39',0,'clients','',0),(40,1,'2018-12-21 22:00:23','2018-12-21 22:00:23','','Beto O\'Rourke','','inherit','closed','closed','','39-revision-v1','','','2018-12-21 22:00:23','2018-12-21 22:00:23','',39,'http://192.168.44.44/39-revision-v1/',0,'revision','',0),(41,1,'2018-12-21 22:05:25','2018-12-21 22:05:25','','Common Defense','','publish','closed','closed','','common-defense','','','2018-12-21 22:05:25','2018-12-21 22:05:25','',0,'http://192.168.44.44/?post_type=clients&#038;p=41',0,'clients','',0),(42,1,'2018-12-21 22:05:25','2018-12-21 22:05:25','','Common Defense','','inherit','closed','closed','','41-revision-v1','','','2018-12-21 22:05:25','2018-12-21 22:05:25','',41,'http://192.168.44.44/41-revision-v1/',0,'revision','',0),(43,1,'2018-12-21 22:06:58','2018-12-21 22:06:58','','Fairness Maryland','','publish','closed','closed','','fairness-maryland','','','2018-12-21 22:06:58','2018-12-21 22:06:58','',0,'http://192.168.44.44/?post_type=clients&#038;p=43',0,'clients','',0),(44,1,'2018-12-21 22:06:58','2018-12-21 22:06:58','','Fairness Maryland','','inherit','closed','closed','','43-revision-v1','','','2018-12-21 22:06:58','2018-12-21 22:06:58','',43,'http://192.168.44.44/43-revision-v1/',0,'revision','',0),(45,1,'2018-12-21 22:09:50','2018-12-21 22:09:50','','Real Justice','','publish','closed','closed','','real-justice','','','2018-12-21 22:09:50','2018-12-21 22:09:50','',0,'http://192.168.44.44/?post_type=clients&#038;p=45',0,'clients','',0),(46,1,'2018-12-21 22:09:50','2018-12-21 22:09:50','','Real Justice','','inherit','closed','closed','','45-revision-v1','','','2018-12-21 22:09:50','2018-12-21 22:09:50','',45,'http://192.168.44.44/45-revision-v1/',0,'revision','',0),(47,1,'2018-12-21 22:11:27','2018-12-21 22:11:27','','Zephyr Teachout','','publish','closed','closed','','zephyr-teachout','','','2018-12-21 22:11:27','2018-12-21 22:11:27','',0,'http://192.168.44.44/?post_type=clients&#038;p=47',0,'clients','',0),(48,1,'2018-12-21 22:11:27','2018-12-21 22:11:27','','Zephyr Teachout','','inherit','closed','closed','','47-revision-v1','','','2018-12-21 22:11:27','2018-12-21 22:11:27','',47,'http://192.168.44.44/47-revision-v1/',0,'revision','',0),(49,1,'2018-12-21 22:47:30','2018-12-21 22:47:30','','github','','publish','closed','closed','','github','','','2018-12-21 22:47:30','2018-12-21 22:47:30','',0,'http://192.168.44.44/?p=49',1,'nav_menu_item','',0),(50,1,'2018-12-21 22:47:30','2018-12-21 22:47:30','','behance','','publish','closed','closed','','behance','','','2018-12-21 22:47:30','2018-12-21 22:47:30','',0,'http://192.168.44.44/?p=50',2,'nav_menu_item','',0),(51,1,'2018-12-21 22:47:30','2018-12-21 22:47:30','','twitter','','publish','closed','closed','','twitter','','','2018-12-21 22:47:30','2018-12-21 22:47:30','',0,'http://192.168.44.44/?p=51',3,'nav_menu_item','',0),(52,1,'2018-12-21 22:47:30','2018-12-21 22:47:30','','at','','publish','closed','closed','','at','','','2018-12-21 22:47:30','2018-12-21 22:47:30','',0,'http://192.168.44.44/?p=52',4,'nav_menu_item','',0),(70,1,'2019-01-04 17:43:20','2019-01-04 17:43:20','','html','','publish','closed','closed','','html','','','2019-01-04 22:30:15','2019-01-04 22:30:15','',0,'http://192.168.44.44/?post_type=skills&#038;p=70',0,'skills','',0),(71,1,'2019-01-04 17:43:32','2019-01-04 17:43:32','','css','','publish','closed','closed','','css','','','2019-01-04 22:30:12','2019-01-04 22:30:12','',0,'http://192.168.44.44/?post_type=skills&#038;p=71',0,'skills','',0),(72,1,'2019-01-04 17:44:21','2019-01-04 17:44:21','','javascript','','publish','closed','closed','','javascript','','','2019-01-05 23:49:03','2019-01-05 23:49:03','',0,'http://192.168.44.44/?post_type=skills&#038;p=72',0,'skills','',0),(73,1,'2019-01-04 17:46:22','2019-01-04 17:46:22','','api / webhooks','','publish','closed','closed','','api-webhooks','','','2019-01-05 23:50:12','2019-01-05 23:50:12','',0,'http://192.168.44.44/?post_type=skills&#038;p=73',0,'skills','',0),(74,1,'2019-01-04 17:47:26','2019-01-04 17:47:26','','web design / ui','','publish','closed','closed','','web-design-ui','','','2019-01-04 22:31:09','2019-01-04 22:31:09','',0,'http://192.168.44.44/?post_type=skills&#038;p=74',0,'skills','',0),(75,1,'2019-01-04 17:47:57','2019-01-04 17:47:57','','wordpress','','publish','closed','closed','','wordpress','','','2019-01-04 22:29:51','2019-01-04 22:29:51','',0,'http://192.168.44.44/?post_type=skills&#038;p=75',0,'skills','',0),(76,1,'2019-01-04 17:48:39','2019-01-04 17:48:39','','action kit','','publish','closed','closed','','action-kit','','','2019-01-04 22:29:48','2019-01-04 22:29:48','',0,'http://192.168.44.44/?post_type=skills&#038;p=76',0,'skills','',0),(77,1,'2019-01-04 21:43:13','2019-01-04 21:43:13','','ubuntu','','publish','closed','closed','','ubuntu','','','2019-01-04 22:32:35','2019-01-04 22:32:35','',0,'http://192.168.44.44/?post_type=skills&#038;p=77',0,'skills','',0),(78,1,'2019-01-04 21:45:05','2019-01-04 21:45:05','','apache2','','publish','closed','closed','','apache2','','','2019-01-04 22:32:30','2019-01-04 22:32:30','',0,'http://192.168.44.44/?post_type=skills&#038;p=78',0,'skills','',0),(79,1,'2019-01-04 21:45:45','2019-01-04 21:45:45','','mySQL','','publish','closed','closed','','mysql','','','2019-01-04 22:32:26','2019-01-04 22:32:26','',0,'http://192.168.44.44/?post_type=skills&#038;p=79',0,'skills','',0),(80,1,'2019-01-04 21:47:14','2019-01-04 21:47:14','','php','','publish','closed','closed','','php','','','2019-01-04 22:32:20','2019-01-04 22:32:20','',0,'http://192.168.44.44/?post_type=skills&#038;p=80',0,'skills','',0),(81,1,'2019-01-04 21:48:38','2019-01-04 21:48:38','','python','','publish','closed','closed','','python','','','2019-01-04 22:32:15','2019-01-04 22:32:15','',0,'http://192.168.44.44/?post_type=skills&#038;p=81',0,'skills','',0),(82,1,'2019-01-04 21:49:24','2019-01-04 21:49:24','','ruby','','publish','closed','closed','','ruby','','','2019-01-04 22:32:10','2019-01-04 22:32:10','',0,'http://192.168.44.44/?post_type=skills&#038;p=82',0,'skills','',0),(83,1,'2019-01-04 21:53:17','2019-01-04 21:53:17','','bash','','publish','closed','closed','','bash','','','2019-01-04 22:32:05','2019-01-04 22:32:05','',0,'http://192.168.44.44/?post_type=skills&#038;p=83',0,'skills','',0);
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_relationships`
--

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;
INSERT INTO `wp_term_relationships` VALUES (1,1,0),(6,2,0),(6,3,0),(6,4,0),(6,5,0),(6,6,0),(6,7,0),(6,8,0),(6,9,0),(11,2,0),(11,3,0),(11,4,0),(11,10,0),(11,11,0),(11,12,0),(15,4,0),(15,10,0),(15,11,0),(15,13,0),(15,14,0),(19,4,0),(19,10,0),(19,11,0),(19,12,0),(19,13,0),(19,14,0),(25,2,0),(25,10,0),(25,11,0),(25,12,0),(25,15,0),(25,16,0),(28,4,0),(28,10,0),(28,11,0),(28,13,0),(28,15,0),(37,2,0),(37,3,0),(37,4,0),(37,9,0),(37,10,0),(37,18,0),(37,19,0),(39,2,0),(39,4,0),(39,10,0),(39,11,0),(39,12,0),(39,17,0),(41,4,0),(41,10,0),(41,11,0),(41,13,0),(41,20,0),(43,4,0),(43,10,0),(43,11,0),(43,13,0),(45,2,0),(45,4,0),(45,10,0),(45,11,0),(45,12,0),(45,13,0),(45,20,0),(47,4,0),(47,10,0),(47,11,0),(47,13,0),(47,15,0),(49,21,0),(50,21,0),(51,21,0),(52,21,0);
/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_taxonomy`
--

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES (1,1,'category','',0,1),(2,2,'skills','',0,3),(3,3,'skills','',0,1),(4,4,'skills','',0,6),(5,5,'skills','',0,1),(6,6,'skills','',0,1),(7,7,'skills','',0,1),(8,8,'skills','',0,1),(9,9,'skills','',0,1),(10,10,'skills','',0,6),(11,11,'skills','',0,5),(12,12,'skills','',0,2),(13,13,'skills','',0,4),(14,14,'skills','',0,2),(15,15,'skills','',0,1),(16,16,'skills','',0,1),(17,17,'skills','',0,1),(18,18,'skills','',0,1),(19,19,'skills','',0,1),(20,20,'skills','',0,2),(21,21,'nav_menu','',0,4);
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_termmeta`
--

DROP TABLE IF EXISTS `wp_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_termmeta`
--

LOCK TABLES `wp_termmeta` WRITE;
/*!40000 ALTER TABLE `wp_termmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_termmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_terms`
--

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` VALUES (1,'Uncategorized','uncategorized',0),(2,'action kit','action-kit',0),(3,'django','django',0),(4,'js','js',0),(5,'html/css','html-css',0),(6,'git','git',0),(7,'npm','npm',0),(8,'nuxt','nuxt',0),(9,'bulma','bulma',0),(10,'wordpress','wordpress',0),(11,'php','php',0),(12,'api','api',0),(13,'apache2','apache2',0),(14,'ruby','ruby',0),(15,'action network','action-network',0),(16,'actblue','actblue',0),(17,'pantheon','pantheon',0),(18,'npm/node','npm-node',0),(19,'netlify','netlify',0),(20,'webhooks','webhooks',0),(21,'Social','social',0);
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_usermeta`
--

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;
INSERT INTO `wp_usermeta` VALUES (1,1,'nickname','root'),(2,1,'first_name',''),(3,1,'last_name',''),(4,1,'description',''),(5,1,'rich_editing','true'),(6,1,'syntax_highlighting','true'),(7,1,'comment_shortcuts','false'),(8,1,'admin_color','fresh'),(9,1,'use_ssl','0'),(10,1,'show_admin_bar_front','true'),(11,1,'locale',''),(12,1,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),(13,1,'wp_user_level','10'),(14,1,'dismissed_wp_pointers','wp496_privacy'),(15,1,'show_welcome_panel','1'),(16,1,'session_tokens','a:2:{s:64:\"7deec1977657d9398d896f8979519d3c8198782fd22d40a43c1c6378ac21d603\";a:4:{s:10:\"expiration\";i:1547231800;s:2:\"ip\";s:12:\"192.168.44.1\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36\";s:5:\"login\";i:1547059000;}s:64:\"f8e9e400bb60682c3e10e83b3621e9759d010fd5b15023e3fa3aa089f55fc06a\";a:4:{s:10:\"expiration\";i:1547326763;s:2:\"ip\";s:12:\"192.168.44.1\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36\";s:5:\"login\";i:1547153963;}}'),(17,1,'wp_user-settings','libraryContent=browse&editor=tinymce'),(18,1,'wp_user-settings-time','1544928469'),(19,1,'wp_dashboard_quick_press_last_post_id','53'),(20,1,'community-events-location','a:1:{s:2:\"ip\";s:12:\"192.168.44.0\";}'),(21,1,'managenav-menuscolumnshidden','a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),(22,1,'metaboxhidden_nav-menus','a:3:{i:0;s:21:\"add-post-type-clients\";i:1;s:12:\"add-post_tag\";i:2;s:10:\"add-skills\";}');
/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_users`
--

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;
INSERT INTO `wp_users` VALUES (1,'root','$P$BtxOZJmLR7sZgBrbrM1vZkhCG5t5sz1','root','admin@mightybox.io','','2018-12-15 21:53:52','',0,'root');
/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-16 20:18:42
