Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013042.outbound.protection.outlook.com [40.93.201.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD85346E66;
	Wed, 22 Apr 2026 20:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776889600; cv=fail; b=G5c6tA/LlJLCZSw2lHwqyddQgYd6C+gTGVWUZdIqAPlLf/MQOUiImBiPg52+dEMCAlr6R5DZe7owezyaWmdAWPscpvRqBnb/2tKOUi/QXUnocIs4vtb4jMdMhFS1QTDVUHmIm5lDdq/7yy4L0K7V5KNJsiq7HaHN3duSuTuTM7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776889600; c=relaxed/simple;
	bh=B3n7wWLp2fHRiArOJfrMlMgoCmQDNDrwy3WJu/m/H5w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=b51OhqkTN+yh9u2YcsJuwsN8J5PrZW6AcFZi1E+Q+ZrlOq4I+LKv6hxezNpXkCvvaezMEVvi+mJoxszK3zQ5/ThxU1wWdNfvrG0ixwCVbpp9PQrQvgGEaad6l4IqbNzis1YGPk00HZoW8EF0FMZT2N3KfGrO9XOCiuUHJGyr1kc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oM8h1mg+; arc=fail smtp.client-ip=40.93.201.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oM8h1mg+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/iIaHRuFTS8j19IxB2JHSge9YawQC3IKF995PgqOi6/l4p2Hz89DG+7Pg1r6FPc+2U4oIcrmSsbQPzHY+/WJ5mnQegGjuWUskQTriaQ0iaeakeNG38fW94bVs15NAAhJloqHxu3t15uyq198JzjsYiOv1sApDs+XmChxrheh5WL4ocfN7SmhjsZUv5FsPsjOe5kcFSMk7MPueG2bSx5OnQAEgE1tZ/nT8BXoFEDyS0k5mRZTl+hG40kwim5hD5L83Lp33FTnpZZLOTS0HVX0wnO4jXp3fHe0mXpc95hvpDmKyfPjpFqc2c3PLfKAENC7cXUI4l8PCUSCH6Bh1x5hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NnxfaIqJ0ICCY2LzpWP9PPAuDbbiPpjE3lzV+tmL00o=;
 b=khQ3SpCwHyrFqsjc+i6atTJPSZ2rnyfhiudqGT6izbT3J/UjiUdJuSy5Q/co56zteDZREvZ51JSsU3n/sE0NQI8p7oUeIL8u3mms37mt4UIDoEW90t9/sWhFtX4nbyo7+vi9Xb09KB/iM9DBY+8PIlHcWQHGLtnaRx4euHYqrN6muB5bEwGepAoW4ITXGo+dyYLa3e+5PfX/jLKKXp0ivjaIDedACpU4Fo0g9xIxCjgdSPGrvHvuql0WHpFhb8KlVN8qCYI1d6tRg2G4VziUcc2mGCBzdttJTFHX/lJ8FoSplDP1RzG5MFFLAS/GufoGm+am3su1YLriZ+IgKyEWjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NnxfaIqJ0ICCY2LzpWP9PPAuDbbiPpjE3lzV+tmL00o=;
 b=oM8h1mg+3UtcKz/geTssMYKk7Irm3Lep93y8gRoEUe1w83trZ4WJaCRPn4qvvyYbZuw+wbMP5NdDCKZWZiau8/uDeCcwTe70JwSVfwZQQFVgGhuT6D2YtGvzMR5v9PMmdmWjPslKYL2xcRk+aCHRoraV9h4g39WQWwjwUAWhY6s=
Received: from PH5P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::17)
 by CH3PR12MB8901.namprd12.prod.outlook.com (2603:10b6:610:180::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Wed, 22 Apr
 2026 20:26:28 +0000
Received: from CY4PEPF0000E9CE.namprd03.prod.outlook.com
 (2603:10b6:510:34a:cafe::87) by PH5P220CA0002.outlook.office365.com
 (2603:10b6:510:34a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Wed,
 22 Apr 2026 20:26:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9CE.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 22 Apr 2026 20:26:27 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 22 Apr
 2026 15:26:26 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 22 Apr 2026 15:26:25 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <michal.simek@amd.com>,
	<ben.levinsky@amd.com>, <tanmay.shah@amd.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] remoteproc: xlnx: add auto-boot support 
Date: Wed, 22 Apr 2026 13:25:56 -0700
Message-ID: <20260422202558.2362971-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CE:EE_|CH3PR12MB8901:EE_
X-MS-Office365-Filtering-Correlation-Id: 54e05583-3a30-4f2c-e35e-08dea0ad6ea9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	8OiJIYh8ZLUPD0BB3bqNgTha0DEgSBJNPj8/AwelLKH3EkQPJhReS7UUaKjKLPNc//Twb0DRT6SZ9GYivDSl+pHaenw9t5Zk3k9P4Y+Nl1F7LIQmaj0jf3rQsyTf8wfgQUDuN7egiN9HdX1dSgedZKhlaXYRWwp1fzIs2ISrp4bjLONiqgjkSGkwTeWn6RAJTZHFTDBdy08PiikrzppKaq+qiR+E89Hf0CH9llFU5GlEnMI1ozEGCTPSzTdtjH3awAIEt0h2ELWuoxpGdtTznW1BvpvB7cr91L/Ypmcvdrn6pVVjN23FpopTVubNIbbuuo0q02ngX1fS1AlwqgxUN0LBbO83eS577m4imZF0mfZHwpLdw6v/k7mvqoSdDIrqLcxA67di3Og0ITArf44lFHV2IupN9+QL4jnVD6vovllbETmQh41KMDxo0Tq1TaTFbQkDlSu4lvlUiLyHx3wH2x7udkfzqd5SfIR1N7SEoMFSTpCFZ/Qzw+XqLqX1og9zulYSCxRBNI7MGW4jGYryydWKvujCYZRTVv1bQ8w6c+NZrvzanHduE8uuevwRuLqlkuPQoXYNv9hZ1yhxTNXKPZwfnYvEJg/p/SWDiYdXijw7uXX3Rc5liZHzNIIB8pjHYtO80T6t9haPRA5LHCsyWZyO9zSyClfIj0RHjnzGN0fKNY79FWYobnnnabvi8tV9HwHmsEZtsh0xSVFq3t6Nl6OzHieXtGClveHUyCKZneu6u3rHvl2plipz4kNFWrnbY5IiZjFrGaa7AaxkObwaIw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5f/R0C1gDvL7KXEs22RQYRH7ddyObm7zDho/edlWvwoEQETQvhSKNzzHo/aNheU0OaiwoJrt4PtfAcKgBOVbvBOpv7XoIoPQ7RQl+FUMbpaQIwkt83qBTr6+cpVL+L7MEgjUsg9wlvBitPCLkHIw7AQ+NBYuVwN0+xp1S/vXaLeGXULII85zqLtWagUCsYKrFIyih1vSUop0Zbzl+eRpm5815xL2j1BX0u9AqcDSRcGbAzTsTPiWRTgKH1DOf10hWPl/G6Uu79WkJ4VT7B4MaJOZ6+lwMkvRScBy4rfIrif3Wngvdrq3qqpbJOn/OztDJOjghmeRuOXNHU8ko8VMvbtOcXoN1iQZIi56ee1EybGWPZ2CZAVuoSz4OpKQuadLJb8/ALATiyP2VwgZsCaujLViG3pF8kuaa/WVtLhrrilPMjfw4KVYS17+7mCwo4Vg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 20:26:27.8728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54e05583-3a30-4f2c-e35e-08dea0ad6ea9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8901

The Cortex-R remote processors on AMD-Xilinx platforms can run
before linux boot. Add auto-boot property to notify linux that remote
processor is ready to be used, so linux can load fw and start it or
attach to the running processor.


Tanmay Shah (2):
  dt-bindings: remoteproc: xlnx: add auto boot feature
  remoteproc: xlnx: enable auto boot feature

 .../remoteproc/xlnx,zynqmp-r5fss.yaml         |  8 +++
 drivers/remoteproc/xlnx_r5_remoteproc.c       | 49 +++++++++++++------
 2 files changed, 42 insertions(+), 15 deletions(-)


base-commit: 6f860d238b44da8ac57be25289b9f4410691c4e2
-- 
2.34.1

