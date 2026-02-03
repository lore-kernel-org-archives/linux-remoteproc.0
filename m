Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012043.outbound.protection.outlook.com [52.101.43.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A71223DC9;
	Tue,  3 Feb 2026 22:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770159550; cv=fail; b=thUFpnYRhrZ8KzGKpTTep4jcaQnKdos5V3WpHxT+lqQ8Q55F2Qmw9UaamhM3vrNnfpg4mFNgGr0V/E+/1Kto6BUdUTV7mA3bysLda3NTesPzC+x4Sjg/fb30mxAyExD5DRvdNBWHpfkhEXQmgOdNC78C40WUTDZe13gt8l8VGQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770159550; c=relaxed/simple;
	bh=UGQPgmW5T3cG9xFUE403KxPH34Q/AtxcwLm08gY2oPg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=N9+5A2P1QxYJysg2mMCeQLq0uDzD+h9bZ6+WUtEJasf8rT6pjHQFkdcJMfcSYH7XkcQa6qqVOnrGLbKNZ6M+cWpioFksRHIoGy7hpfge3g/gIX+bCeWcogiOutu9ieLaZZAtpfn6ydkUshiolR5UFD4FGYFlFtfpeqqpk3+ziB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IuX8x2C2; arc=fail smtp.client-ip=52.101.43.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IuX8x2C2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RnfNTtcwx4OydeisXjk6tEGzdO7s60u3Bm9ZWAXxsVwTiZL/mIc873ToAp7mEQ/R0OmIMcyPB9a1U6GKwgRH4ctuADMMmPH9M/dg882sX0+VlLhJcxHLt62JxzByIq0/CG00Kz1+D6OUI/sz/u4XfVwuxFc3MBXlPf90qFSq6xVSKsWVR1TAvksvME3ryU/qly5sp/XjiXgi0ssVqLFSGnHMNJ8revWhLcnMKqNrx0cpf3Q5L7vQux29/XrYueVdbQZKfvrLm/VU6kxaNcl/zOvPe2cQvrALXm9nSKMdNRdj93+joYePpHo2PDkq0wTLnshnBSxcF2OgNN62BEQ7FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CMFuRPNf/svmCGgujlfwyxH8aAAJQigmpoeAZMfiZKA=;
 b=emPED7olIGwie81Qc7QCH7zPzZ3Qo9kSowNDYUyIaKiFXL+jangRYO53g0QMS274w/kupSKLwYjkxAS2Rwb2FwkD09of6ZeeaEnjPF746KMqabcQlED6XHfjJOKGuWnNb7Jr2C58kVg2R+qKQ+VHVBIlTc9eV0JJ2scu8HxF4hW6kMKOrdnRqSDD/HyT0o83ITmErHaQ5TSmytnvBWRhfSqGPeYIp/yVeX3KmbNRI3fNYFHm/mh0O5SWt1NtCR2jJQIPjqvlDkLjWUbUWMdQSv7hLYv0o3AMP0q9FR1Q8sq663cISLf3sHxIrsj23iXx53uwzr1fySirC0gBc2vVAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CMFuRPNf/svmCGgujlfwyxH8aAAJQigmpoeAZMfiZKA=;
 b=IuX8x2C2CgEaKIxCvspOE4DmfRF8OaKatlisKb0dP8GrMWoaNg/7udeoY8LWHmd34jy6g482ZOdSe0dYfmK827iCVLCU8cdFtB4k+B/jlicvGZGNtjBr4Xt/xjl5Bvx7WOA5DBniVGCU8WWFpapIBFm/SOKJgegj5aH8l8mmyEA=
Received: from MN2PR15CA0066.namprd15.prod.outlook.com (2603:10b6:208:237::35)
 by DM4PR12MB6589.namprd12.prod.outlook.com (2603:10b6:8:b4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 22:59:05 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2603:10b6:208:237:cafe::74) by MN2PR15CA0066.outlook.office365.com
 (2603:10b6:208:237::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 22:59:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 22:59:04 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 3 Feb
 2026 16:59:04 -0600
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 3 Feb 2026 14:59:04 -0800
From: Tanmay Shah <tanmay.shah@amd.com>
To: <jassisinghbrar@gmail.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
	"Tanmay Shah" <tanmay.shah@amd.com>
Subject: [PATCH v4 0/3] mailbox queue length check
Date: Tue, 3 Feb 2026 14:58:19 -0800
Message-ID: <20260203225821.3293475-1-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|DM4PR12MB6589:EE_
X-MS-Office365-Filtering-Correlation-Id: c874ead5-1eea-48c7-8aab-08de6377d46b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x62brSaPrDqGtYNnMP+qVY7ibhIy6Zn8L2bQNcSJwvMaZMdin6OTijme0v72?=
 =?us-ascii?Q?zls5qwOEICEt1Ywy3LbBIm3a0mh8YOaUROum6rP+ii5uTPnwxrnAMbwMccUc?=
 =?us-ascii?Q?PbWC7PP0chN+flrrROVvD197a9YdJXmqT7cY/ZQmKcQHoIyeIEGiGitRXMAJ?=
 =?us-ascii?Q?H4QBC9sbO7s924MkCqg90KlWDMQ8zBcQJgKX4m2Cu2FFKKQfgLTfVsZPTMNJ?=
 =?us-ascii?Q?0cBiH6utIrP843b1c91wQK1sG5o9jaX+gWf2+zTE3SnUtIxOUwNrWJHvlYNb?=
 =?us-ascii?Q?xVKgj3P/DfaSy+FfB4mv1D8BvQrNcmJ2f0CrvqWQdaUCaTxcXUyJv0tnNP4/?=
 =?us-ascii?Q?E0WLCTZz/9+9Bb5IQ05PasbY7vlL0HjNuLkwwquhKIGzXvqGAks07nqbMqCk?=
 =?us-ascii?Q?7tiRF5BOPSOrtn5j9XCPzytgA0pBqLem0a7q9vQUv/NeRsXQt9PmzGdYu00h?=
 =?us-ascii?Q?8DdhpmzyP5QjfU1oy12XCQrDsu6lETuaGj/k5LZjMeOn05o6qDP+uVWVo+Mg?=
 =?us-ascii?Q?1KfEeN2mE1gDQTVZvLsD+s2iNkrgFvVQelkGV3W+NOolTDTdGZvyAn5bv/zb?=
 =?us-ascii?Q?Gw4i2bvD7jUXCWuZabfuz5KPr1RFdv0j9G5pJPN3fIMuH69mX9d4dgcI7nsn?=
 =?us-ascii?Q?2T229bdHLMKJolpDfuUCoEVAuxnZH3m9hwK18QZgX8o0U3Gp4X1XxprGhJ4m?=
 =?us-ascii?Q?QU/DNFfjnLJRGcCzTBYk9XhLTCCR4oxUMgqwbrbfBkYOtkvwzkJPeJ2h5jCq?=
 =?us-ascii?Q?xEVWcavOsXFmWFhKSsqi+gBzrRc/+hyajXCcw7QoeZTerqR0ALJSxpcbnJ8e?=
 =?us-ascii?Q?LdsGMq+YfuFJ5UEiMP3/iUzpBfuoDlj+nmEqF6WLIQEY8fMBGbEmIW8xevoY?=
 =?us-ascii?Q?KJlkJ1Ar1qmG/mmwqh3lbbs5KS9qJsfTdk851ePChtcYJAh8t51SACZPyINj?=
 =?us-ascii?Q?aDFnB3rd5t1Ejxf98PNnE7vZLhuZq3L/EL9hImSe7R61rLnE2D1/5lBrEyQS?=
 =?us-ascii?Q?Ylhn5MYSwjmE1bHnLzFc41/e/BcYkZ/8W4+e+1W78EgUnamusldKB54h8VwQ?=
 =?us-ascii?Q?KzklsXlLd8s0zh9cPqSuW4yA5a5nmjUzXZiyppy9lOWkPHE0CPi1VCdg9Hia?=
 =?us-ascii?Q?JuVIrUJdbFxQ3kBQPM8mX7NLlN+NIcjUE6wu8+aIt0AYfg+E4Wa7WAxHNw1v?=
 =?us-ascii?Q?8Sfi1T6UYGfszgDel8BQo4hhDCL2YwnUNze1GZPldnyl0Ltm+OSWIm7zppig?=
 =?us-ascii?Q?CMFGL0KJDn1AqIQlbbFg2qx0tIJCQnNiajL6FXWDaWgIb5pXzOVBKRWT0HBQ?=
 =?us-ascii?Q?49W5lScbmyI2B3GDj5YCteLpAbnkM3myNFIHlwPazyORgdQC7vqu1geQWsFm?=
 =?us-ascii?Q?/nTsg1ZP/mbX+zjKBz2VT60OlEBHMdlv9dSvn16qXGvhLF6BfXDcUzrr17Hi?=
 =?us-ascii?Q?EjCsgqRMds0K4HCoQxZuTMZBY4AmyhSmJxbCvDmr1n/o8TdzXZUBfLQopGIu?=
 =?us-ascii?Q?MFfBsk3v3PUGcWBKRTJhChL6+o8b5cFnmQ9CIdKWZ4tYhbj4B0iTrqmAIh+j?=
 =?us-ascii?Q?izPLCerhUreuu/z53NwRdCRscPBIb5bBoWW2iJ644Nrt3Qmpjlxs1MQg6rvf?=
 =?us-ascii?Q?oC5zhjfO9pt31PP3rzGf2E+qa9rRNHUk3/mT5WvTVeRLeZWy7Brj4AvrFUdz?=
 =?us-ascii?Q?fotwOw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iX0lUbSBCbrxWtHj/uvsOx/ToN//5LvmaaPC+lp3wouDzz0quSMSofIMDJUbA9PkyK95zMhZ5jWRQ4I1CTHPfHi3YOsXR3GtutQ2gniiBXDnCO1Wyr2G4BCwsDlUfSQ6TpD1q7Wjcnrdo1PPcPbSd+CuaxA1v2O/2HAslQN7vseYkZwGtSdr+e6gzNwfCho4pIZhubhrLPF91D/SBTgBFPtSBCZUpw8sciyLeKDBoMyoCVleXtCJNmkX9LhOTjXNZp6k+Q6TthCe1iMRVBwsEg7c5JREQHeusPcj/91B3HsIWXoCHVGBqyTlWfiBeJhykmVIkLfNPZneBAsTwLKQhF+SnrXD2thXh4WOMK5APH7odIAICnvZnhR2zE8fIO+oiGhfbtrCnZ7mIQMULhdTOassehnLldObp0xbzjBWapRVS5h19xzM/4DMZAUc7EqP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 22:59:04.8833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c874ead5-1eea-48c7-8aab-08de6377d46b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6589

Provide mechanism to check mailbox queue length before posting new
message to the mailbox queue. Use this mechanims in xlnx r5 remoteproc
driver.

Changes in v4:
  - %s/msg_slot_ro/tx_slots_avail_ro/
  - do not use msg_count to calculate tx_slots_avail_ro instead modify
    it directly
  - separate xlnx remoteproc driver patch in to two patches


Changes in v3:
  - move msg_slot_ro to mbox_client instead of mbox_chan
  - allocate separate mailbox client to the "tx" mbox channel
  - modify rest of the patch to use msg_slot_ro from mbox_client

Changes in v2:
  - Split patchset in two patches for two different subsystems.
  - Change design and introduce new field per channel to track mbox
    queue length.
  - use this new field in xlnx remoteproc driver to prevent sending new
    messages if no slots available in the mbox tx channel queue.

Tanmay Shah (3):
  mailbox: check mailbox queue is full or not
  remoteproc: xlnx: assign mbox client per mbox channel
  remoteproc: xlnx: do not send new mbox notification

 drivers/mailbox/mailbox.c               |  3 +++
 drivers/remoteproc/xlnx_r5_remoteproc.c | 26 +++++++++++++++++++------
 include/linux/mailbox_client.h          |  2 ++
 3 files changed, 25 insertions(+), 6 deletions(-)


base-commit: fa3e2d1dc10864887674c484372a9ccc6a01eb18
-- 
2.34.1

