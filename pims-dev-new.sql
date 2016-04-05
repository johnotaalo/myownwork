-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2016 at 03:40 PM
-- Server version: 5.6.21
-- PHP Version: 5.5.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pims-dev-new`
--
CREATE DATABASE IF NOT EXISTS `pims-dev-new` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `pims-dev-new`;

-- --------------------------------------------------------

--
-- Table structure for table `deliverable_category`
--

DROP TABLE IF EXISTS `deliverable_category`;
CREATE TABLE IF NOT EXISTS `deliverable_category` (
  `id` int(11) NOT NULL,
  `category` varchar(45) DEFAULT NULL,
  `category_date_title` varchar(100) DEFAULT NULL,
  `category_attribute_title` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ea_indicator`
--

DROP TABLE IF EXISTS `ea_indicator`;
CREATE TABLE IF NOT EXISTS `ea_indicator` (
`id` int(11) NOT NULL,
  `ea_id` int(11) DEFAULT NULL,
  `ea_no` varchar(45) DEFAULT NULL,
  `indicator` varchar(150) DEFAULT NULL,
  `baseline` int(11) DEFAULT NULL,
  `target` int(11) DEFAULT NULL,
  `unit` text,
  `results_achieved` text,
  `variable` varchar(45) DEFAULT NULL,
  `impact_external_factors` varchar(45) DEFAULT NULL,
  `storage_of_data` varchar(45) DEFAULT NULL,
  `periodicity` varchar(45) DEFAULT NULL,
  `clarification_of_data` varchar(45) DEFAULT NULL,
  `internal_external_use_of_data` varchar(45) DEFAULT NULL,
  `other_data_sources` text,
  `other_collection_methods` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ea_indicator_collection_method_id`
--

DROP TABLE IF EXISTS `ea_indicator_collection_method_id`;
CREATE TABLE IF NOT EXISTS `ea_indicator_collection_method_id` (
`id` int(11) NOT NULL,
  `collection_method_id` int(11) DEFAULT NULL,
  `ea_indicator_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ea_indicator_data_source`
--

DROP TABLE IF EXISTS `ea_indicator_data_source`;
CREATE TABLE IF NOT EXISTS `ea_indicator_data_source` (
`id` int(11) NOT NULL,
  `ea_indicator_id` int(11) DEFAULT NULL,
  `data_source_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ea_indicator_interim_progress`
--

DROP TABLE IF EXISTS `ea_indicator_interim_progress`;
CREATE TABLE IF NOT EXISTS `ea_indicator_interim_progress` (
`id` int(11) NOT NULL,
  `period_id` int(11) DEFAULT NULL,
  `ea_indicator_id` int(11) DEFAULT NULL,
  `value` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ea_lesson_learned`
--

DROP TABLE IF EXISTS `ea_lesson_learned`;
CREATE TABLE IF NOT EXISTS `ea_lesson_learned` (
`id` int(11) NOT NULL,
  `ea_overview_id` int(11) DEFAULT NULL,
  `period_id` int(11) DEFAULT NULL,
  `lesson_learned` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ea_overview`
--

DROP TABLE IF EXISTS `ea_overview`;
CREATE TABLE IF NOT EXISTS `ea_overview` (
`id` int(11) NOT NULL,
  `sub_programme_detail_id` int(11) DEFAULT NULL,
  `ea_code` int(11) DEFAULT NULL,
  `ea_name` varchar(255) DEFAULT NULL,
  `ea_statement` text,
  `ea_risks` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ea_performance_remarks`
--

DROP TABLE IF EXISTS `ea_performance_remarks`;
CREATE TABLE IF NOT EXISTS `ea_performance_remarks` (
`id` int(11) NOT NULL,
  `ea_overview_id` int(11) DEFAULT NULL,
  `ea_period_id` int(11) DEFAULT NULL,
  `ea_progress_rating_id` int(11) DEFAULT NULL,
  `ea_performance_remarks` text,
  `pow_output_performance_remarks` text,
  `project_performance_remarks` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ea_pow`
--

DROP TABLE IF EXISTS `ea_pow`;
CREATE TABLE IF NOT EXISTS `ea_pow` (
`id` int(11) NOT NULL,
  `ea_overview_id` int(11) DEFAULT NULL,
  `imdis_deliverable_category_id` int(11) DEFAULT NULL,
  `unep_division_id` int(11) DEFAULT NULL,
  `pow_no` int(11) DEFAULT NULL,
  `pow_description` text,
  `pow_output_target` text,
  `quantity` int(11) DEFAULT NULL,
  `pow_output_implementation_progress` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `imdis_recommendation_status`
--

DROP TABLE IF EXISTS `imdis_recommendation_status`;
CREATE TABLE IF NOT EXISTS `imdis_recommendation_status` (
`id` int(11) NOT NULL,
  `recommendation_status` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `imdis_staus`
--

DROP TABLE IF EXISTS `imdis_staus`;
CREATE TABLE IF NOT EXISTS `imdis_staus` (
`id` int(11) NOT NULL,
  `status` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `implementation_challenges`
--

DROP TABLE IF EXISTS `implementation_challenges`;
CREATE TABLE IF NOT EXISTS `implementation_challenges` (
`id` int(11) NOT NULL,
  `implementation_challenge` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `implementation_follow_up_status`
--

DROP TABLE IF EXISTS `implementation_follow_up_status`;
CREATE TABLE IF NOT EXISTS `implementation_follow_up_status` (
`id` int(11) NOT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `interim_progress_report`
--

DROP TABLE IF EXISTS `interim_progress_report`;
CREATE TABLE IF NOT EXISTS `interim_progress_report` (
  `id` int(11) NOT NULL,
  `project_indicator_id` int(11) DEFAULT NULL,
  `period_id` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `period`
--

DROP TABLE IF EXISTS `period`;
CREATE TABLE IF NOT EXISTS `period` (
`id` int(11) NOT NULL,
  `period` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pims_profile`
--

DROP TABLE IF EXISTS `pims_profile`;
CREATE TABLE IF NOT EXISTS `pims_profile` (
  `id` int(11) NOT NULL,
  `email_address` varchar(150) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `lotus` varchar(100) DEFAULT NULL,
  `permissions` text,
  `creation_date` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
CREATE TABLE IF NOT EXISTS `project` (
`id` int(11) NOT NULL,
  `project_status_id` int(11) DEFAULT NULL COMMENT 'This column is connected to the project_status table',
  `project_type_id` int(11) DEFAULT NULL COMMENT 'This column is connected to the var_project_type table',
  `project_execution_mode_id` int(11) DEFAULT NULL COMMENT 'This column connects to the var_project_execution_mode table',
  `unep_division_id` int(11) DEFAULT NULL COMMENT 'This column connects to the unep_division table',
  `project_title` varchar(45) NOT NULL,
  `project_imis_number` varchar(45) DEFAULT NULL,
  `project_identification` varchar(45) DEFAULT NULL,
  `umojaID` varchar(45) DEFAULT NULL,
  `website` text,
  `project_summary` text,
  `key_issues` text,
  `main_activities` text,
  `objectives` text,
  `challenges` text,
  `planned_duration` varchar(45) DEFAULT NULL,
  `anticipated_results` text,
  `expected_start_date` date DEFAULT NULL,
  `expected_completion_date` date DEFAULT NULL,
  `actual_start_date` date DEFAULT NULL,
  `actual_completion_date` date DEFAULT NULL,
  `project_framework_approval_id` int(11) DEFAULT NULL,
  `project_approval_complete` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_approval`
--

DROP TABLE IF EXISTS `project_approval`;
CREATE TABLE IF NOT EXISTS `project_approval` (
`id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `lifecycle_action_id` int(11) DEFAULT NULL,
  `lifecyle_result_id` int(11) DEFAULT NULL,
  `lifecycle_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_country`
--

DROP TABLE IF EXISTS `project_country`;
CREATE TABLE IF NOT EXISTS `project_country` (
  `project_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_document`
--

DROP TABLE IF EXISTS `project_document`;
CREATE TABLE IF NOT EXISTS `project_document` (
`id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `pims_profile_id` int(11) DEFAULT NULL,
  `document_type_id` int(11) DEFAULT NULL,
  `document_title` varchar(200) DEFAULT NULL,
  `document_source` varchar(50) DEFAULT NULL,
  `document_description` text,
  `upload_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_finance`
--

DROP TABLE IF EXISTS `project_finance`;
CREATE TABLE IF NOT EXISTS `project_finance` (
  `project_id` int(11) DEFAULT NULL,
  `funding_source_id` int(11) DEFAULT NULL,
  `project_finance_status_remarks` text,
  `project_finance_reasons_for_delay` text,
  `planned_project_budget` float DEFAULT NULL,
  `co_finance_total` float DEFAULT NULL,
  `estimated_evaluation_cost` float DEFAULT NULL,
  `estimated_program_support_cost` float DEFAULT NULL,
  `estimated_communication_cost` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_highlight`
--

DROP TABLE IF EXISTS `project_highlight`;
CREATE TABLE IF NOT EXISTS `project_highlight` (
`id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `period_id` int(11) DEFAULT NULL,
  `project_performance_highlight` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_implementation`
--

DROP TABLE IF EXISTS `project_implementation`;
CREATE TABLE IF NOT EXISTS `project_implementation` (
`id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `period_id` int(11) DEFAULT NULL,
  `strategies_to_address_challenges` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_implementation_challenge`
--

DROP TABLE IF EXISTS `project_implementation_challenge`;
CREATE TABLE IF NOT EXISTS `project_implementation_challenge` (
`id` int(11) NOT NULL,
  `project_implementation_id` int(11) DEFAULT NULL,
  `implementation_challenge_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_indicator`
--

DROP TABLE IF EXISTS `project_indicator`;
CREATE TABLE IF NOT EXISTS `project_indicator` (
`id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `indicator_type_id` int(11) DEFAULT NULL,
  `indicator_type` varchar(45) DEFAULT NULL,
  `baseline` text,
  `target` varchar(45) DEFAULT NULL,
  `means_of_verification` text,
  `baseline_revision_notes` text,
  `progress_remarks` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_lesson_learned`
--

DROP TABLE IF EXISTS `project_lesson_learned`;
CREATE TABLE IF NOT EXISTS `project_lesson_learned` (
`id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `period_id` int(11) DEFAULT NULL,
  `lesson_learned` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_management_action`
--

DROP TABLE IF EXISTS `project_management_action`;
CREATE TABLE IF NOT EXISTS `project_management_action` (
`id` int(11) NOT NULL,
  `project_implementation_id` int(11) DEFAULT NULL,
  `pims_profile_id` int(11) DEFAULT NULL,
  `implementation_follow_up_status_id` int(11) DEFAULT NULL,
  `actions_to_take` text,
  `date_to_take_action` date DEFAULT NULL,
  `notes` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_milestones`
--

DROP TABLE IF EXISTS `project_milestones`;
CREATE TABLE IF NOT EXISTS `project_milestones` (
`id` int(11) NOT NULL,
  `ea_pow_id` int(11) DEFAULT NULL,
  `milestone` varchar(255) DEFAULT NULL,
  `planned_milestone_date` date DEFAULT NULL,
  `actual_milestone_date` date DEFAULT NULL,
  `milestone_remarks` text,
  `milestones_attained` text,
  `milestone_type` varchar(15) DEFAULT NULL,
  `milestone_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_other_divisions`
--

DROP TABLE IF EXISTS `project_other_divisions`;
CREATE TABLE IF NOT EXISTS `project_other_divisions` (
  `project_id` int(11) DEFAULT NULL,
  `unep_division_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_outcome`
--

DROP TABLE IF EXISTS `project_outcome`;
CREATE TABLE IF NOT EXISTS `project_outcome` (
`id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `outcome_description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_outcome_pow`
--

DROP TABLE IF EXISTS `project_outcome_pow`;
CREATE TABLE IF NOT EXISTS `project_outcome_pow` (
`id` int(11) NOT NULL,
  `project_outcome_id` int(11) DEFAULT NULL,
  `ea_pow_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_outcome_progress`
--

DROP TABLE IF EXISTS `project_outcome_progress`;
CREATE TABLE IF NOT EXISTS `project_outcome_progress` (
`id` int(11) NOT NULL,
  `project_outcome_id` int(11) DEFAULT NULL,
  `period_id` int(11) DEFAULT NULL,
  `outcome_progress` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_output`
--

DROP TABLE IF EXISTS `project_output`;
CREATE TABLE IF NOT EXISTS `project_output` (
`id` int(11) NOT NULL,
  `unep_division_id` int(11) DEFAULT NULL,
  `pims_profile_id` int(11) DEFAULT NULL,
  `short_description` text,
  `full_description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_output_pow`
--

DROP TABLE IF EXISTS `project_output_pow`;
CREATE TABLE IF NOT EXISTS `project_output_pow` (
`id` int(11) NOT NULL,
  `ea_pow_id` int(11) DEFAULT NULL,
  `project_output_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='		';

-- --------------------------------------------------------

--
-- Table structure for table `project_output_result`
--

DROP TABLE IF EXISTS `project_output_result`;
CREATE TABLE IF NOT EXISTS `project_output_result` (
`id` int(11) NOT NULL,
  `project_output_id` int(11) DEFAULT NULL,
  `period_id` int(11) DEFAULT NULL,
  `result` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_pow`
--

DROP TABLE IF EXISTS `project_pow`;
CREATE TABLE IF NOT EXISTS `project_pow` (
  `id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `ea_pow_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_product_service`
--

DROP TABLE IF EXISTS `project_product_service`;
CREATE TABLE IF NOT EXISTS `project_product_service` (
`id` int(11) NOT NULL,
  `deliverable_category_id` int(11) DEFAULT NULL,
  `imdis_status_id` int(11) DEFAULT NULL,
  `imdis_recommendation_status_id` int(11) DEFAULT NULL,
  `ea_pow_id` int(11) DEFAULT NULL,
  `un_regular_budget_professional` int(11) DEFAULT NULL,
  `un_ef_xb_prof` int(11) DEFAULT NULL,
  `un_regular_budget_consultant` int(11) DEFAULT NULL,
  `un_ef_xb_consultant` int(11) DEFAULT NULL,
  `planned_start_date` date DEFAULT NULL,
  `planned_end_date` date DEFAULT NULL,
  `actual_start_date` date DEFAULT NULL,
  `actual_end_date` date DEFAULT NULL,
  `category_date` date DEFAULT NULL,
  `category_attribute` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_region`
--

DROP TABLE IF EXISTS `project_region`;
CREATE TABLE IF NOT EXISTS `project_region` (
  `project_id` int(11) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_reporting_staff`
--

DROP TABLE IF EXISTS `project_reporting_staff`;
CREATE TABLE IF NOT EXISTS `project_reporting_staff` (
`id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `reporting_as` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `time` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_sub_programme`
--

DROP TABLE IF EXISTS `project_sub_programme`;
CREATE TABLE IF NOT EXISTS `project_sub_programme` (
`id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `sub_programme_detail_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_sub_region`
--

DROP TABLE IF EXISTS `project_sub_region`;
CREATE TABLE IF NOT EXISTS `project_sub_region` (
  `project_id` int(11) DEFAULT NULL,
  `sub_region_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sp_document`
--

DROP TABLE IF EXISTS `sp_document`;
CREATE TABLE IF NOT EXISTS `sp_document` (
`id` int(11) NOT NULL,
  `sub_programme_detail_id` int(11) DEFAULT NULL,
  `pims_profile_id` int(11) DEFAULT NULL,
  `sp_document_type_id` int(11) DEFAULT NULL,
  `document_title` varchar(150) DEFAULT NULL,
  `document_source` varchar(45) DEFAULT NULL,
  `document_path` text,
  `document_description` text,
  `document_added_on` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sp_imdis_deliverable`
--

DROP TABLE IF EXISTS `sp_imdis_deliverable`;
CREATE TABLE IF NOT EXISTS `sp_imdis_deliverable` (
`id` int(11) NOT NULL,
  `sub_programme_detail_id` int(11) DEFAULT NULL,
  `imdis_recommendation_status_id` int(11) DEFAULT NULL,
  `project_product_service_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sp_mngt_recommendations`
--

DROP TABLE IF EXISTS `sp_mngt_recommendations`;
CREATE TABLE IF NOT EXISTS `sp_mngt_recommendations` (
`id` int(11) NOT NULL,
  `period_id` int(11) DEFAULT NULL,
  `sub_programme_detail_id` int(11) DEFAULT NULL,
  `mngt_recommendation` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sp_reporting_staff`
--

DROP TABLE IF EXISTS `sp_reporting_staff`;
CREATE TABLE IF NOT EXISTS `sp_reporting_staff` (
`id` int(11) NOT NULL,
  `sub_programme_detail_id` int(11) DEFAULT NULL,
  `pims_profile_id` int(11) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `memo` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sp_schedule_action`
--

DROP TABLE IF EXISTS `sp_schedule_action`;
CREATE TABLE IF NOT EXISTS `sp_schedule_action` (
`id` int(11) NOT NULL,
  `sp_mngt_recommendation_id` int(11) DEFAULT NULL,
  `pims_profile_id` int(11) DEFAULT NULL,
  `implementation_follow_up_status_id` int(11) DEFAULT NULL,
  `action` varchar(150) DEFAULT NULL,
  `action_date` date DEFAULT NULL,
  `action_notes` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sub_programme`
--

DROP TABLE IF EXISTS `sub_programme`;
CREATE TABLE IF NOT EXISTS `sub_programme` (
`id` int(11) NOT NULL,
  `sub_programme` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sub_programme_detail`
--

DROP TABLE IF EXISTS `sub_programme_detail`;
CREATE TABLE IF NOT EXISTS `sub_programme_detail` (
`id` int(11) NOT NULL,
  `sub_programme_id` int(11) DEFAULT NULL,
  `biennium_id` int(11) DEFAULT NULL,
  `unep_division_id` int(11) DEFAULT NULL,
  `pims_profile_id` int(11) DEFAULT NULL,
  `sp_status_id` int(11) DEFAULT NULL,
  `sp_objectives` text,
  `sp_highlights` text,
  `sp_constraints` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `unep_division`
--

DROP TABLE IF EXISTS `unep_division`;
CREATE TABLE IF NOT EXISTS `unep_division` (
`id` int(11) NOT NULL,
  `division_name` varchar(45) DEFAULT NULL,
  `division_acronym` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `var_biennium`
--

DROP TABLE IF EXISTS `var_biennium`;
CREATE TABLE IF NOT EXISTS `var_biennium` (
`id` int(11) NOT NULL,
  `biennium` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `var_collection_method`
--

DROP TABLE IF EXISTS `var_collection_method`;
CREATE TABLE IF NOT EXISTS `var_collection_method` (
`id` int(11) NOT NULL,
  `collection_method` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `var_country`
--

DROP TABLE IF EXISTS `var_country`;
CREATE TABLE IF NOT EXISTS `var_country` (
`id` int(11) NOT NULL,
  `sub_region_id` int(11) DEFAULT NULL,
  `country_name` varchar(60) DEFAULT NULL,
  `country_iso_code` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `var_data_source`
--

DROP TABLE IF EXISTS `var_data_source`;
CREATE TABLE IF NOT EXISTS `var_data_source` (
`id` int(11) NOT NULL,
  `data_source` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `var_ea_period`
--

DROP TABLE IF EXISTS `var_ea_period`;
CREATE TABLE IF NOT EXISTS `var_ea_period` (
`id` int(11) NOT NULL,
  `period` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `var_ea_progress_rating`
--

DROP TABLE IF EXISTS `var_ea_progress_rating`;
CREATE TABLE IF NOT EXISTS `var_ea_progress_rating` (
`id` int(11) NOT NULL,
  `rating` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `var_funding_source`
--

DROP TABLE IF EXISTS `var_funding_source`;
CREATE TABLE IF NOT EXISTS `var_funding_source` (
  `id` int(11) NOT NULL,
  `funding_code` varchar(5) DEFAULT NULL,
  `funding_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `var_imdis_deliverable_category`
--

DROP TABLE IF EXISTS `var_imdis_deliverable_category`;
CREATE TABLE IF NOT EXISTS `var_imdis_deliverable_category` (
`id` int(11) NOT NULL,
  `imdis_deliverable_category` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `var_lifecycle_action`
--

DROP TABLE IF EXISTS `var_lifecycle_action`;
CREATE TABLE IF NOT EXISTS `var_lifecycle_action` (
`id` int(11) NOT NULL,
  `lifecycle_action` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `var_lifecycle_result`
--

DROP TABLE IF EXISTS `var_lifecycle_result`;
CREATE TABLE IF NOT EXISTS `var_lifecycle_result` (
`id` int(11) NOT NULL,
  `lifecycle_result` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `var_project_document_type`
--

DROP TABLE IF EXISTS `var_project_document_type`;
CREATE TABLE IF NOT EXISTS `var_project_document_type` (
`id` int(11) NOT NULL,
  `document_type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `var_project_execution_mode`
--

DROP TABLE IF EXISTS `var_project_execution_mode`;
CREATE TABLE IF NOT EXISTS `var_project_execution_mode` (
`id` int(11) NOT NULL,
  `project_execution_mode` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `var_project_framework_approval`
--

DROP TABLE IF EXISTS `var_project_framework_approval`;
CREATE TABLE IF NOT EXISTS `var_project_framework_approval` (
`id` int(11) NOT NULL,
  `project_framework_approval_type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `var_project_status`
--

DROP TABLE IF EXISTS `var_project_status`;
CREATE TABLE IF NOT EXISTS `var_project_status` (
`id` int(11) NOT NULL,
  `project_status` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `var_project_type`
--

DROP TABLE IF EXISTS `var_project_type`;
CREATE TABLE IF NOT EXISTS `var_project_type` (
`id` int(11) NOT NULL,
  `project_type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `var_region`
--

DROP TABLE IF EXISTS `var_region`;
CREATE TABLE IF NOT EXISTS `var_region` (
`id` int(11) NOT NULL,
  `region_code` varchar(10) DEFAULT NULL,
  `region_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `var_settings_reporting`
--

DROP TABLE IF EXISTS `var_settings_reporting`;
CREATE TABLE IF NOT EXISTS `var_settings_reporting` (
`id` int(11) NOT NULL,
  `period_id` int(11) DEFAULT NULL,
  `pims_profile_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `var_sp_document_type`
--

DROP TABLE IF EXISTS `var_sp_document_type`;
CREATE TABLE IF NOT EXISTS `var_sp_document_type` (
`id` int(11) NOT NULL,
  `sp_document_type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `var_sp_status`
--

DROP TABLE IF EXISTS `var_sp_status`;
CREATE TABLE IF NOT EXISTS `var_sp_status` (
`id` int(11) NOT NULL,
  `sp_status` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `var_sub_region`
--

DROP TABLE IF EXISTS `var_sub_region`;
CREATE TABLE IF NOT EXISTS `var_sub_region` (
`id` int(11) NOT NULL,
  `region_id` int(11) DEFAULT NULL,
  `sub_region_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `deliverable_category`
--
ALTER TABLE `deliverable_category`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_indicator`
--
ALTER TABLE `ea_indicator`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_indicator_collection_method_id`
--
ALTER TABLE `ea_indicator_collection_method_id`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_indicator_data_source`
--
ALTER TABLE `ea_indicator_data_source`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_indicator_interim_progress`
--
ALTER TABLE `ea_indicator_interim_progress`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_lesson_learned`
--
ALTER TABLE `ea_lesson_learned`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_overview`
--
ALTER TABLE `ea_overview`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_performance_remarks`
--
ALTER TABLE `ea_performance_remarks`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_pow`
--
ALTER TABLE `ea_pow`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `imdis_recommendation_status`
--
ALTER TABLE `imdis_recommendation_status`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `imdis_staus`
--
ALTER TABLE `imdis_staus`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `implementation_challenges`
--
ALTER TABLE `implementation_challenges`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `implementation_follow_up_status`
--
ALTER TABLE `implementation_follow_up_status`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `interim_progress_report`
--
ALTER TABLE `interim_progress_report`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `period`
--
ALTER TABLE `period`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pims_profile`
--
ALTER TABLE `pims_profile`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_approval`
--
ALTER TABLE `project_approval`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_document`
--
ALTER TABLE `project_document`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_highlight`
--
ALTER TABLE `project_highlight`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_implementation`
--
ALTER TABLE `project_implementation`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_implementation_challenge`
--
ALTER TABLE `project_implementation_challenge`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_indicator`
--
ALTER TABLE `project_indicator`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_lesson_learned`
--
ALTER TABLE `project_lesson_learned`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_management_action`
--
ALTER TABLE `project_management_action`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_milestones`
--
ALTER TABLE `project_milestones`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_outcome`
--
ALTER TABLE `project_outcome`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_outcome_pow`
--
ALTER TABLE `project_outcome_pow`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_outcome_progress`
--
ALTER TABLE `project_outcome_progress`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_output`
--
ALTER TABLE `project_output`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_output_pow`
--
ALTER TABLE `project_output_pow`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_output_result`
--
ALTER TABLE `project_output_result`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_pow`
--
ALTER TABLE `project_pow`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_product_service`
--
ALTER TABLE `project_product_service`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_reporting_staff`
--
ALTER TABLE `project_reporting_staff`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_sub_programme`
--
ALTER TABLE `project_sub_programme`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_document`
--
ALTER TABLE `sp_document`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_imdis_deliverable`
--
ALTER TABLE `sp_imdis_deliverable`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_mngt_recommendations`
--
ALTER TABLE `sp_mngt_recommendations`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_reporting_staff`
--
ALTER TABLE `sp_reporting_staff`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_schedule_action`
--
ALTER TABLE `sp_schedule_action`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_programme`
--
ALTER TABLE `sub_programme`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_programme_detail`
--
ALTER TABLE `sub_programme_detail`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unep_division`
--
ALTER TABLE `unep_division`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `division_acronym_UNIQUE` (`division_acronym`);

--
-- Indexes for table `var_biennium`
--
ALTER TABLE `var_biennium`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `var_collection_method`
--
ALTER TABLE `var_collection_method`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `var_country`
--
ALTER TABLE `var_country`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `var_data_source`
--
ALTER TABLE `var_data_source`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `var_ea_period`
--
ALTER TABLE `var_ea_period`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `var_ea_progress_rating`
--
ALTER TABLE `var_ea_progress_rating`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `var_funding_source`
--
ALTER TABLE `var_funding_source`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `funding_code_UNIQUE` (`funding_code`);

--
-- Indexes for table `var_imdis_deliverable_category`
--
ALTER TABLE `var_imdis_deliverable_category`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `var_lifecycle_action`
--
ALTER TABLE `var_lifecycle_action`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `var_lifecycle_result`
--
ALTER TABLE `var_lifecycle_result`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `var_project_document_type`
--
ALTER TABLE `var_project_document_type`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `var_project_execution_mode`
--
ALTER TABLE `var_project_execution_mode`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `var_project_framework_approval`
--
ALTER TABLE `var_project_framework_approval`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `var_project_status`
--
ALTER TABLE `var_project_status`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `var_project_type`
--
ALTER TABLE `var_project_type`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `var_region`
--
ALTER TABLE `var_region`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `var_settings_reporting`
--
ALTER TABLE `var_settings_reporting`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `var_sp_document_type`
--
ALTER TABLE `var_sp_document_type`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `var_sp_status`
--
ALTER TABLE `var_sp_status`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `var_sub_region`
--
ALTER TABLE `var_sub_region`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ea_indicator`
--
ALTER TABLE `ea_indicator`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ea_indicator_collection_method_id`
--
ALTER TABLE `ea_indicator_collection_method_id`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ea_indicator_data_source`
--
ALTER TABLE `ea_indicator_data_source`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ea_indicator_interim_progress`
--
ALTER TABLE `ea_indicator_interim_progress`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ea_lesson_learned`
--
ALTER TABLE `ea_lesson_learned`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ea_overview`
--
ALTER TABLE `ea_overview`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ea_performance_remarks`
--
ALTER TABLE `ea_performance_remarks`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ea_pow`
--
ALTER TABLE `ea_pow`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `imdis_recommendation_status`
--
ALTER TABLE `imdis_recommendation_status`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `imdis_staus`
--
ALTER TABLE `imdis_staus`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `implementation_challenges`
--
ALTER TABLE `implementation_challenges`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `implementation_follow_up_status`
--
ALTER TABLE `implementation_follow_up_status`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `period`
--
ALTER TABLE `period`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_approval`
--
ALTER TABLE `project_approval`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_document`
--
ALTER TABLE `project_document`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_highlight`
--
ALTER TABLE `project_highlight`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_implementation`
--
ALTER TABLE `project_implementation`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_implementation_challenge`
--
ALTER TABLE `project_implementation_challenge`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_indicator`
--
ALTER TABLE `project_indicator`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_lesson_learned`
--
ALTER TABLE `project_lesson_learned`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_management_action`
--
ALTER TABLE `project_management_action`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_milestones`
--
ALTER TABLE `project_milestones`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_outcome`
--
ALTER TABLE `project_outcome`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_outcome_pow`
--
ALTER TABLE `project_outcome_pow`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_outcome_progress`
--
ALTER TABLE `project_outcome_progress`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_output`
--
ALTER TABLE `project_output`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_output_pow`
--
ALTER TABLE `project_output_pow`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_output_result`
--
ALTER TABLE `project_output_result`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_product_service`
--
ALTER TABLE `project_product_service`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_reporting_staff`
--
ALTER TABLE `project_reporting_staff`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_sub_programme`
--
ALTER TABLE `project_sub_programme`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sp_document`
--
ALTER TABLE `sp_document`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sp_imdis_deliverable`
--
ALTER TABLE `sp_imdis_deliverable`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sp_mngt_recommendations`
--
ALTER TABLE `sp_mngt_recommendations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sp_reporting_staff`
--
ALTER TABLE `sp_reporting_staff`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sp_schedule_action`
--
ALTER TABLE `sp_schedule_action`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sub_programme`
--
ALTER TABLE `sub_programme`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sub_programme_detail`
--
ALTER TABLE `sub_programme_detail`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unep_division`
--
ALTER TABLE `unep_division`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `var_biennium`
--
ALTER TABLE `var_biennium`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `var_collection_method`
--
ALTER TABLE `var_collection_method`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `var_country`
--
ALTER TABLE `var_country`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `var_data_source`
--
ALTER TABLE `var_data_source`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `var_ea_period`
--
ALTER TABLE `var_ea_period`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `var_ea_progress_rating`
--
ALTER TABLE `var_ea_progress_rating`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `var_imdis_deliverable_category`
--
ALTER TABLE `var_imdis_deliverable_category`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `var_lifecycle_action`
--
ALTER TABLE `var_lifecycle_action`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `var_lifecycle_result`
--
ALTER TABLE `var_lifecycle_result`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `var_project_document_type`
--
ALTER TABLE `var_project_document_type`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `var_project_execution_mode`
--
ALTER TABLE `var_project_execution_mode`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `var_project_framework_approval`
--
ALTER TABLE `var_project_framework_approval`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `var_project_status`
--
ALTER TABLE `var_project_status`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `var_project_type`
--
ALTER TABLE `var_project_type`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `var_region`
--
ALTER TABLE `var_region`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `var_settings_reporting`
--
ALTER TABLE `var_settings_reporting`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `var_sp_document_type`
--
ALTER TABLE `var_sp_document_type`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `var_sp_status`
--
ALTER TABLE `var_sp_status`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `var_sub_region`
--
ALTER TABLE `var_sub_region`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
