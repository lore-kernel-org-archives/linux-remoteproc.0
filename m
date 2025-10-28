Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010024.outbound.protection.outlook.com [52.101.61.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401501758B;
	Tue, 28 Oct 2025 04:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761627601; cv=fail; b=Tdwr1PSZQuTxvTw1sIjHW68hyGw9MAzQVUs0iG7y8AXS5cPK9SW13hDVJYFDp8NNJXEzUj+fvcGME4xCEfpLg1ljziLEHz6wISrcO6yfNdg7quC6PWAvzYgiuDWOWO9kQ2LaJXdbDPC8yARVvohV/l4cOpz1Ub6Q8jMMy8ZDRbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761627601; c=relaxed/simple;
	bh=exPjRQRNISWXlD81+pnKXU8CV05cmgeISWnYpNb5dIo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i2zVtNv0mJSRxB9hcAdV7ejzIxcaMfnZy7VwLyMD6RbMfxRuphBHOdpJZPPszkf8xYjbgLXriGFViydGuPsFYSiAp3cqdePiFeYQ5uwMOcWN9XVvpJklpaxYQYCFBWJb+WRX2pQF+O/H3WmPyq/UmxyVReELj5Op881gnBrHyDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pdnvgFfB; arc=fail smtp.client-ip=52.101.61.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pdnvgFfB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RVbpFLH+m17mnOjtvtjUA0v9Y/GIRnWHq9Jkd5mcG6byCpKljf3dn4frjZWMjvQp4F3Jo7p+ZXUFJDqzl12FYSZUauOS3hyL/O54znvfEhS9du9IZDhRZ4/AIXaWIbfQi3weJpy1i122NjCMQoKd9iRPGQA7XT5E2AK8wUNDa3qwjRhNoQTk2d593slFev2KsSZPQYTRsCIZkdJ40qzVcnxW6tK3t2jK7HnETUxewo9myyR/VUKG4g5UBCoIWJipL/fKj+oJKpYcYdFVUC21LNlU3KsVCYl054Jfzn0h77tf09MTwRPEQWQtoK4mj4WBulX7BeF5iZXPLO9oWNeyHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KR4HJtlb+UK5jrXi6FYdifkruP2NRHoltTYX1Qg7RDQ=;
 b=g6lch0aAQhixWSpQYbnhJJ3cMt9t1E27qghiCTNDaNQFKfXkJ+B5AMN09s+4piXGmSJ4dIlUvnvlX6yERWmyTdcO1M6UgGj6zcJeikmxTm2bnbtsCtKCmzE19iqv/b3eBZ3J+vlm5vhm4ncBDafV+fkJ7Xm/DSJWnWmTnijpdCsKd/qjd1VpRJYs3DwMIy0oIeMAHC0A0NxOhbZYw4/wZlivjJBoV41YsfBC7RUD4z96RRzjLdsAyU6p5f0wiJ+juOruFT7oAYJitQrIhaGTuHnUARBmKKE68bLhqKOb0PECWdjhm44NCi7PjRId3hspxYQKTCJNrcrPyZJwUGpRPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KR4HJtlb+UK5jrXi6FYdifkruP2NRHoltTYX1Qg7RDQ=;
 b=pdnvgFfBjjCmu686p+VLxY87u3qJAS+uqGePfe6O8MtBJgyDtu4PnMX19WNqEhuW2vgkaKF/V+89aynIedgS5l+qJdctzM3xBawoohn1gYrrqqN/emyQSplUn05ynhNI7Iy0DfsFsP4hrTTqKttY2ciTZLOcPETGioobJult18o=
Received: from CH2PR18CA0043.namprd18.prod.outlook.com (2603:10b6:610:55::23)
 by BL1PR12MB5921.namprd12.prod.outlook.com (2603:10b6:208:398::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 04:59:56 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:55:cafe::f3) by CH2PR18CA0043.outlook.office365.com
 (2603:10b6:610:55::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Tue,
 28 Oct 2025 04:59:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Tue, 28 Oct 2025 04:59:56 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 27 Oct
 2025 21:59:56 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 27 Oct
 2025 23:59:56 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 27 Oct 2025 21:59:55 -0700
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>
Subject: [PATCH 0/3] remoteproc: xlnx: remote crash recovery
Date: Mon, 27 Oct 2025 21:57:28 -0700
Message-ID: <20251028045730.1622685-1-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: tanmay.shah@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|BL1PR12MB5921:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b4d95ea-32fe-44de-99d3-08de15ded6fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oMmGYzieVT5t1ezvbNByCCf1jKJJSeHF4c0jbEbHYzmRIySRWkwerqGsr8+g?=
 =?us-ascii?Q?cnhxvrAf5MsHf0Y12Gix1Rft9vC8/2XozviloWrvwxDeynE/4B2Hb5TI2VhV?=
 =?us-ascii?Q?iLG94oLpScWJtw00c6qUG7vKRjVDDN0gTYqrL7x4oj6rnnAgNyKI3WgJ6mXc?=
 =?us-ascii?Q?gyn7cIZxYYzOX9BnCesutXaRuZFK/aiHMQkpxml1+En472n7jPh+AzoLUVWm?=
 =?us-ascii?Q?ucSp4TgnA8uLuce206/oWpJeQoufd1446GSfpWZ8qUqRyUHfMyMhWsXLtGqg?=
 =?us-ascii?Q?qo6WMqUgEf1o0p3rW3rwGQBSXI8zMDOwbhgphqMQMIdSxZVBcWA58nXxnn8k?=
 =?us-ascii?Q?C3aMGVWjqc8ufOu/Tc4x/yid1cL9m4aZr9ae9EanLbZ+0NeVx/2aIIv49l3Z?=
 =?us-ascii?Q?+GGoaJYOgdoj5R324C8VNbR2Qu85E9nKNZ21SIgJIIlYcaL9Ijyvq5ykSUsG?=
 =?us-ascii?Q?IyKn+DpPBh2nzXOJqbsG2UnysEWqBQwf9aU4H83i+BNu1DOvbm7MqDlBTexU?=
 =?us-ascii?Q?+N6dqNdeTLwddTuSC0PhTAzB6ZfLhBSspg+B4X5nZ0jYbBYEOhCqA9LXDiH+?=
 =?us-ascii?Q?P33xng1Ii2U8CfFXqeSsvRaZENa2BNwr5lFHei39aNehEI4oEtxvKD1qNj1j?=
 =?us-ascii?Q?yqxhQgMXx2l81PaZHnoA3jobuj9if2lXqvfXxnSXYyA/c7kaN1vphMtoIjAw?=
 =?us-ascii?Q?Ll3JkECQwZIEVOCP4LPpHs6wZ51am2C2wXCyGv/o8u6r6vsKFm6Axc08sCJc?=
 =?us-ascii?Q?cjsYL3lRUIK6usVF/8twbn+2Xr+gXDIXUHqGILG5PvpWiVG/13EjZaGrTRqK?=
 =?us-ascii?Q?xQ7Z2okfzRKTe9wSKmKz5OJrRkI5fXBPRLbUAKG/xKdho9KGLsjSyyfhb7iI?=
 =?us-ascii?Q?+i01iTiQ9MqubcKH4h/mttqG30pgI9HDyPQalXiSu3kuNYIQaf5jEHitkf12?=
 =?us-ascii?Q?VOQX5lQ/4XC6+AAf1piRD/Z4doDdOQs2LMpm3KpBbAjRWVzPXncyoiSdLSQy?=
 =?us-ascii?Q?i1cutjMEZtiMPB+wnxHxkRufQqGm6nOhUXkdlUpx68PnEvF9IVEuLWcA1mcw?=
 =?us-ascii?Q?Xtsquo1qK54nTZ7AmLVx/5+HPbZuq0Phh66CRLeRX3RCupifoLaipDSkqy+3?=
 =?us-ascii?Q?5q2odc2iiognolDRToBKvz6g9t7K0aaztNHOHpytYH42FrbNwJVxKdSNqDj4?=
 =?us-ascii?Q?Y57kZwfSoGBsJ2SUwW5fZsmQrIj+D1x7VT43rftCH5Y6iSKfsfrlHQsj3WCO?=
 =?us-ascii?Q?mtxGO3LYDC/M3ipn/yWWQw4gqyTdlb2T4hpkFBcMQrWYhLqHbJ394OxFHDBg?=
 =?us-ascii?Q?xNJ4CWZsaxAdGhKYiErVMG4bcPvqxPdZQpC1l+g75+5yg3Kg3jc2ycLLMk9x?=
 =?us-ascii?Q?YiTiCHSLR1KFJxJbfkO98jjvCBKhEKK8Oelyuh99eTqFhJ6MyBJyeRwvhyC4?=
 =?us-ascii?Q?CjKyDJ9oQVOQhTK4REiDPs4lXi7dA/bw5wabWM9FgEhkn/oNFj4+UBv72WoV?=
 =?us-ascii?Q?OLXpfGTTQgRRVhnHjk4p1tIKDhrIM8WsNkgY7nliz570OgWRs3CGX5gLW9R3?=
 =?us-ascii?Q?demrQ4Pm2TRyilD/Ehc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 04:59:56.6309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b4d95ea-32fe-44de-99d3-08de15ded6fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5921

Remote processor can crash or hang during normal execution. Linux
remoteproc framework supports different mechanisms to recover the
remote processor and re-establish the RPMsg communication in such case.

Crash reporting:

1) Using debugfs node

User can report the crash to the core framework via debugfs node using
following command:

echo 1 > /sys/kernel/debug/remoteproc/remoteproc0/crash

2) Remoteproc notify to the host about crash state and crash reason
via the resource table

This is a platform specific method where the remote firmware contains
vendor specific resource to update the crash state and the crash
reason. Then the remote notifies the crash to the host via mailbox
notification. The host then will check this resource on every mbox
notification and reports the crash to the core framework if needed.

Crash recovery mechanism:

There are two mechanisms available to recover the remote processor from
the crash. 1) boot recovery, 2) attach on recovery

Remoteproc core framework will choose proper mechanism based on the
rproc features set by the platform driver.

1) Boot recovery

This is the default mechanism to recover the remote processor.
In this method core framework will first stop the remote processor,
load the firmware again and then starts the remote processor. On
AMD-Xilinx platforms this method is supported. The coredump callback in
the platform driver isn't implemented so far, but that shouldn't cause
the recovery failure.

2) Attach on recovery

If RPROC_ATTACH_ON_RECOVERY feature is enabled by the platform driver,
then the core framework will choose this method for recovery.

On zynqmp platform following is the sequence of events expected during
remoteproc crash and attach on recovery:

a) rproc attach/detach flow is working, and RPMsg comm is established
b) Remote processor (RPU) crashed (crash not reported yet)
c) Platform management controller stops and reloads elf on inactive
   remote processor before reboot
d) platform management controller reboots the remote processor
e) Remote processor boots again, and detects previous crash (platform
   specific mechanism to detect the crash)
f) Remote processor Reports crash to the Linux (Host) and wait for
   the recovery.
g) Linux performs full detach and reattach to remote processor.
h) Normal RPMsg communication is established.

It is required to destroy all RPMsg related resource and re-create them
during recovery to establish successful RPMsg communication. To achieve
this complete rproc_detach followed by rproc_attach calls are needed.


Tanmay Shah (3):
  remoteproc: xlnx: enable boot recovery
  remoteproc: core: full attach detach during recovery
  remoteproc: xlnx: add crash detection mechanism

 drivers/remoteproc/remoteproc_core.c    | 22 +++++----
 drivers/remoteproc/xlnx_r5_remoteproc.c | 66 ++++++++++++++++++++++++-
 2 files changed, 77 insertions(+), 11 deletions(-)


base-commit: 5f4d69f0ef4f09cd926d193fe0df0c84d53e8252
-- 
2.34.1

