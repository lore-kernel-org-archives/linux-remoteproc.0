Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013047.outbound.protection.outlook.com [40.107.201.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20402CCB9;
	Thu, 18 Dec 2025 00:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766016166; cv=fail; b=AWUR82/U5tXj2Ij5MAF6A6MhKGnZ1nB2wT9JkabPKfY7/V3/0VzSQSy4airK2e0RtJZ5q5rGVfIUBdUDxBIpmtflETj0mnKmv9V6iklGX8V2909xoO/uQeK2j35OSa1nOMzdJ7clQvrMP6Pim3PHiJgk6B4jjHqZNOrdHojyhQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766016166; c=relaxed/simple;
	bh=els7ja4u6IHQ3iEn7ZraCDAYGieexdzSds+yIN9gt7s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i505HlqCYSz0k525BqCBVAVTOHiSTdS/H7o4he9J7NMvntsGLtb6XBIO750VMfaQK0RO6KbDOXrGv/6vj7BBTXvPvXgNfNWw72F4HicQD5hNiMfJ45ODeZyNZMPtRl0mlAMeJnc3oDRfMH3ywXb8q6ijNG3nTXPpXu31HgktoNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ak5stm+g; arc=fail smtp.client-ip=40.107.201.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ak5stm+g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e16sil5llOV7i0H7QnqpynIx4aa7fmluhACMt/v7yqw+mrVgOLwqOxYUor1EIScsyUqtovN8rQ64iryTyrOV/PKedmUdjGp+YaBqd0FOy+9/k/67nfI9goP0i9NEXMm5KaXIlRdnhYoZjW+JlJJbETmaQf6t/UFhpNbT5QINIrGpnS8a5aJwN2z3kPQTkW02lmbw+vLu5bIcPIVw3chxmciCFj49bxlLzc8Pp5T6jTlQJfh3zCEXrSHmEQXsXbyVOrh6QsIrrVRNB29f0s/1JP6o2szKHAHQSsdCzk7NryqbMHV++ZJCYw+GHonBI3PT+nWcmVs6jhHOKAeQIWT0Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkKIhVUYfG47kRkRTu95Sn9qlu6FISL1UE4LQK5bCOE=;
 b=irpupm6ESmh9WqJQA0NKdgbUh904FmZBrPcGI8uUneL4tP5GDGIv/+c3bhfguH4h2GrNJgibJwtWPnFnDA0/POJ4FMeDYoyxGrKDN9IOJHBZiLI1qA7A4NOXyJVKJVJV7H9zBOtFOjIAo2km7ZawDdOOjVF3KSucdx/wAIXdsCoKl70uCSRmwKmKyyMcbKsEwsKWxj1pGCC4JDewxpAWqbzdCvAINeu+KQQ7bil7tP/5m5pe1qVQXDEbKgS0Jj7tzhoHpHnF3SafX0ILy2j9pFTXEAols2D7+IS1Do0whZH/sHUB88EVzKZ+R0vphQEjZEChl5hldScQk0xCogwOQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkKIhVUYfG47kRkRTu95Sn9qlu6FISL1UE4LQK5bCOE=;
 b=ak5stm+gt7kNZeULXxTAJdMMOtV6M9WwCVUaK/SW3MDcBLlPgoKaYOWWnKnvkqY72RpcFdli1egQ4WfsulTlwev0dCYkBY64gMC96SJgLERwSLhuPg4mxFKMHKtX09MaTn7IrV6nMHS8Z4gLlL1XgNq3VbYs5F9/46B39M4EUpY=
Received: from PH0PR07CA0008.namprd07.prod.outlook.com (2603:10b6:510:5::13)
 by DS7PR12MB9042.namprd12.prod.outlook.com (2603:10b6:8:ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 21:27:45 +0000
Received: from CO1PEPF000044FB.namprd21.prod.outlook.com
 (2603:10b6:510:5:cafe::1d) by PH0PR07CA0008.outlook.office365.com
 (2603:10b6:510:5::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Wed,
 17 Dec 2025 21:27:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000044FB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.0 via Frontend Transport; Wed, 17 Dec 2025 21:27:44 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 17 Dec
 2025 15:27:44 -0600
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 17 Dec 2025 15:27:43 -0600
From: Tanmay Shah <tanmay.shah@amd.com>
To: <jassisinghbrar@gmail.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
	"Tanmay Shah" <tanmay.shah@amd.com>
Subject: [PATCH v3 0/2] mailbox queue length check
Date: Wed, 17 Dec 2025 13:27:26 -0800
Message-ID: <20251217212728.1540043-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FB:EE_|DS7PR12MB9042:EE_
X-MS-Office365-Filtering-Correlation-Id: a4cf0eab-1f31-4ad5-5703-08de3db31e49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?zUqWKf0EZSuizjJrTReyvwCNThO4E4jkvoeoH3ziW42BrjAfQhKBFuLw26Hi?=
 =?us-ascii?Q?83v0XA8wa70P+vChSup82w4P9dT+Ck2+vCtdaWIE8UOG7DPQidg1IfD6bxLQ?=
 =?us-ascii?Q?mT7EZTFMnYMMMP5ATvdQmY8kviBIy5IW1CHzHOow/Cr24aritihm3bg8Mi2k?=
 =?us-ascii?Q?/dCRP3/zXI9Y1BwM4KHOyBUxG6afQch9u0oJUvHQ1XlXWfyVOXKQhC3STrUV?=
 =?us-ascii?Q?qc/OrGUwbhWQqzukfGAGXPP0lXOnOsLQH9agDHnB843heeXF1r0PJyykKlaW?=
 =?us-ascii?Q?Z/LPPUAdBASvgKB/u+t6AZz3xN7ezBMF23OMCsjUBBJn+ahAC3BWQy8m1Fkl?=
 =?us-ascii?Q?EN1v/gcqDPmwyWjnx740SrFedEInFpyhNEqq4c5EkWh91oTqRPIXjopYU4yK?=
 =?us-ascii?Q?OuKQQNIZ2Jt+BAWSV3NzGU40oBvM44/v7ePzCzE4jWqQ+luLcqhUIqHZFM9P?=
 =?us-ascii?Q?Lvj2g/a54BOYMJmQ36Q1qBmEPZS63k3LIfY8CF8qlRYnZUXBFXvflWTYtphZ?=
 =?us-ascii?Q?bBR9oa2njP+ZhdDL10f1EEJ9sQmcYwD3pxouMtR95Cflnd5qjhqDYHKsq2L7?=
 =?us-ascii?Q?y66WxgreHqggIzuVoHzeB8dRRqlyGa3dWsbKaAoPmAc6xjLjo1aLewd4PF5e?=
 =?us-ascii?Q?ezaLukIHFF+iY7suN5EEV3BlI5z+wpLHeybOVq6I0/+Z/mZGesMc1RSyuJzU?=
 =?us-ascii?Q?hHxb3vLZcsW+CmpUiVi1kvXKbV0huE+soLJ7YWmgiMZKgSm/3V/Hq7ofjA1y?=
 =?us-ascii?Q?fabK+uTcDG+mI1+5wzk3IXs0uKoDgP5+1E0ELYPvO5TK2VEUYVnwGgXh9zqI?=
 =?us-ascii?Q?JSMFUUgBx8Txym7XJ8EHrNjl0uI350bC2faOtCMzWTt1U6jeLM9+nkQX2UAe?=
 =?us-ascii?Q?dUkDTQJxdOSWp51V3IAFeE3qZ6oZb8N7v3fvf2jJCcVxZ/F1n/qILGlO+ZB5?=
 =?us-ascii?Q?LsiVZKNjMf0rDp8qa+8WjFWK2SljyBOwCd3JAMEQDJrk3TIB/1RuOPIocFoa?=
 =?us-ascii?Q?kvVSYukztaeuYf3puXJscdaI+7J/g1vm1yJufDeuKfnTi8K1AXxHkDCrQwfe?=
 =?us-ascii?Q?6Q+Gznd9Dt/LhVGWWFLXEwMuJQhOi3rSrivtYEGey1pfzvu68q2QMKyOXKdZ?=
 =?us-ascii?Q?sBTes5ncvqjxgCgZH1aOizv56SrRrEUllM7BR7xk4yDjFQLNSS+hnklYfRIZ?=
 =?us-ascii?Q?nMU6Yo5oLH/HNur/EgGgMkKyLrsSj9gJKkyVwaba7S+v9uYolMs+/ISxz5yc?=
 =?us-ascii?Q?DalFvWNQUHFsml3iIx9CpQ9vYigGCFXNs1THw6D1rtn1cfRFi5n82gMaA8bW?=
 =?us-ascii?Q?tmaqPCmRf1W1cfq3ZdBifBO66mB0YpEYzZdfU3MHAcmyQ9ltbhIEZG5ScXiW?=
 =?us-ascii?Q?tJxfhZMzNzwLDXJ7WxqY8B/VHXsomiWXjjoXhnOphKmI7sglLJQAu2rupZzS?=
 =?us-ascii?Q?EYrQLbj0J8O3u8W5r+9GRbGwizIT8NDrSmxS7ro6FLNivFIsC9VAtSOozTmc?=
 =?us-ascii?Q?haG3inH+/9wds53s5WxDRSzKYbaCo91LMfc9NrFYFhk0devVzIUBzpcS9sDD?=
 =?us-ascii?Q?MeJ8CbY3/57lcpwFTZI=3D?=
X-Forefront-Antispam-Report:
 CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 21:27:44.8408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4cf0eab-1f31-4ad5-5703-08de3db31e49
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
 CO1PEPF000044FB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9042

Provide mechanism to check mailbox queue length before posting new
message to the mailbox queue.

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


Note: The patch series is developed on top of latest remoteproc for-next
branch.

Tanmay Shah (2):
  mailbox: check mailbox queue is full or not
  remoteproc: xlnx: do not kick if mbox queue is full

 drivers/mailbox/mailbox.c               |  3 +++
 drivers/remoteproc/xlnx_r5_remoteproc.c | 24 +++++++++++++++++++-----
 include/linux/mailbox_client.h          |  2 ++
 3 files changed, 24 insertions(+), 5 deletions(-)


base-commit: 6a95c70e60a03d83b31b855ce9af8cf6aeec7f90
-- 
2.34.1

