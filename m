Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012065.outbound.protection.outlook.com [40.107.200.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA98E2FBE14;
	Thu, 13 Nov 2025 15:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763048699; cv=fail; b=JTjDMNfN25AVohY5/zsHNhys2wUZyvSoeg1RL19vnYj+eMQx3bjhMBgLXJ5TXPfNRdgX+oBxHnUT08Ns9yoxN7kB2+JvTkMsP2eqhZJ+PG26I6ngMfpcgq6K31sFNEXv1ycxF+ONx3M0p7a1fmx8dEWKxjHOq4LHKP0zzYeLDv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763048699; c=relaxed/simple;
	bh=9tXbCdjKBVHf+0oRchEmFsgAW0IWKpxjRHvxXNk8yo8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B89DUvULWOcTpqaelbf7uSr2aoKUvK+VOyFWWLlp2zufcd33zqTiijyQxXEy1/GYzKW1E+1aw/vb6SPLHCYria38b6PqlA4stdw+vSR5dgM6GKHmoIGA9DdsfLz3cTM5vPIY0SaoiO9B2avwAn2Vn5xzKn8yW3IN6Z1jrCZKYRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UhYglcMc; arc=fail smtp.client-ip=40.107.200.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UhYglcMc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X/kYK/D5khfoXGYZ2jGnvRZ+1zK4w7KUrLCMSGUSIqfV4+BDcWdgZxtNHa2fOmnHLwHAf0U4X/ZQKrdKEcpd1UiLBWpg5OT2ejqlEi10vujfqXlC90/O+ophlJMw6ndBXb4bEQeQkyjWyJerYgpIXtl5fL+xABIkbA93nXfhbtAwnoKwnK9Yeufd+zxqEzWBHuSuzEfNDXAXKK6kZjMI3hg3vKI2qpOhmEpP9zuF4/Zwj5437m4fw8RrKF9obVQR6ZhD098tRwGQalQP65Jy6Kok8/LxCv/P1ZLPMatCTT4RPNXh0zDexpfIj45hXvBEuskea6V79WHzrPKDJFQ0lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2SHnhRSKEYCldj4VsSxXcs/tKFGR8MOobgHa96/Axcc=;
 b=joaitiCMD3wCuC4tPg4miRYqxA3v2CnCuL05XETdWUqLZ8inGpKuH+oHUeSvsPuyvbFvBgiPQI5UgUgtMU2rh4vrhMCrhY1Jhph9EoVVyYeAMqhpTH5qBsYOAnfeu5iUY8j/A3NMijM3fg3i8hj2COnbCVlDxqXKx7jB78nOnoDXyiSyD2Z0e2BggtTvaE7nI/F+1gumZlXOMnvh5D10JBOL6gquqCA0Xu+0ECcdrOZfsrXx0GDmk4H2R4Xe9Ha04gg59IUqVjXDUvph6XqIg76aZSjPcPgtvV3cGljKEoV0y8hzw0NbmIGdfa2A+YIaVoOs+FwonhRRFfvPDslLBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2SHnhRSKEYCldj4VsSxXcs/tKFGR8MOobgHa96/Axcc=;
 b=UhYglcMclO75nbRtEB/BgZQl49FZ24r9Ewd6syZBuSa4UKaomxkMIVKy3Pqhe9LM3mCJ2RTenvIjmoNc6UkI64uM2JMAwate2jCuAr5TY+XfKUUFyoFAtg7wqdMklFMq41qPLr8vjqZaj943uzj2MCZgAD59+INai6WvB06r8OQ=
Received: from PH7P220CA0029.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::21)
 by DS7PR12MB8292.namprd12.prod.outlook.com (2603:10b6:8:e2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 15:44:54 +0000
Received: from CY4PEPF0000EE30.namprd05.prod.outlook.com
 (2603:10b6:510:326:cafe::de) by PH7P220CA0029.outlook.office365.com
 (2603:10b6:510:326::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 15:44:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE30.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 15:44:53 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 13 Nov
 2025 07:44:52 -0800
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 13 Nov 2025 07:44:52 -0800
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Tanmay Shah" <tanmay.shah@amd.com>
Subject: [PATCH 0/3] remoteproc: xlnx: remote crash recovery
Date: Thu, 13 Nov 2025 07:44:01 -0800
Message-ID: <20251113154403.2454319-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|DS7PR12MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: e3bf0728-480d-4096-9bdf-08de22cb96a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zhoL4dWoXK/0HJMyFj1UhgR9zlz6h2ye43//EU5AApfHRYB7le0XSc3ROamO?=
 =?us-ascii?Q?8js5R6sbeVp1gmTmB5bx6xGmgcK1lt7b1LPu0VC7ufjqrgmZv9RFF97szIab?=
 =?us-ascii?Q?DEqza6kldt2ZLD9w/d1tQJQ2GH83Hu9sIHH4uH5YAN0e6vW8bFrVheWe11k+?=
 =?us-ascii?Q?ysdnhSGBQUiV2P3I7y0MLhMEYCkvYtd9aSPobCE2azb1xsOuL4wCsGBxWzo/?=
 =?us-ascii?Q?C+/dLks7HIpfUIcVpdhg0++OyhnulkDAjkkqPSfvH90LQOe64/42eKv/GLaZ?=
 =?us-ascii?Q?km9N68FByiIxK67mJJZgBn7bl7d7q5pbnixDIiuUlhaqkvoKjI3kH+AHmwzf?=
 =?us-ascii?Q?edvrfLu341MOh+JUt1WQU2hVFkQ2wHM0TZ8PDfTGyzcS4zttCFV86bV35v0G?=
 =?us-ascii?Q?P0usXoaCM6UCL+iq+fh7603T5DbJQmwOOxZZgEC+CVpCm+tCpr9IkOKyLckQ?=
 =?us-ascii?Q?mvuKYH3/yQmueXcse+iakjAwnK39ecWvJe1AmxEhJkznrdiv4ZMuJVr6EMDB?=
 =?us-ascii?Q?bkkEowlAhEEd5QhnoFhSc6tkhJRgr4Np1j5Sp5gWbD97iYk462PgmgTScLIu?=
 =?us-ascii?Q?ICPi4b7oNwIe905sAGxsvS3wX6AXuFVoriOgC+RCRFsz9RLyCE4l81oP/dTy?=
 =?us-ascii?Q?NR0DRtc1o4Lx9L7Ee6jorLNxJnisqt4GNWZSbm76g8qgkCMYhZ36sPHkRCfT?=
 =?us-ascii?Q?hopSnL4A8rvDKaGWzmWw8L8GmtjO5EulI3LrASY/NDxzLoJPFY8yH2N+SbFD?=
 =?us-ascii?Q?UvBC1w+by+Jw5QFEDKCFpPd14faJeEl5dvt8gBnBEOJZxS+EG3QRU/8DGUXL?=
 =?us-ascii?Q?ffXobEGtxWTriQH+VQ/E8o/5XIjpm81B9z04t9KOzNM5WX2A9M4uZuXRa+Gi?=
 =?us-ascii?Q?J1rwauJ0knmYyAxU5GJ05zKTBR+Jj7c5ztck0qdjWcSxJU5c1BcXEDFBt3kF?=
 =?us-ascii?Q?3OITVQ4s9jiXYmaTXUNdYpqotLCYg2JwqQ3g+eb0r9cbylg2BB2LtRAhzzoG?=
 =?us-ascii?Q?uat5oTML2+SktBcowdO0NAFIbWSTr1ccQnMU5zKeAhdq6eIzsENSC4ljYuP9?=
 =?us-ascii?Q?cQVgmvvVY8wMEi3pNSin2CYDLFhn1xQKt7M0rfqlvp0OfOw81jcHL3TBJOOO?=
 =?us-ascii?Q?cONcCCirhvoHM5s+DG44wbc9tUqihY+IZ5fQ52s96+ECASQGU/BMFlJRWA7g?=
 =?us-ascii?Q?tambhfaUQvV71RIVmBm1huFvNme3/+YAEwymjXeSxL7E0IHXphEetMIzISjS?=
 =?us-ascii?Q?X7+kxb/EHinCGFaAp1TDKU3vo6HPsnQK6SZ8yACZ24CnkTZMnkF38/3wh3Ih?=
 =?us-ascii?Q?Riw4sv54RNaZM9Jgv1iUJ8V5GH8wVjFdWMw73821ZKvzQDjbegb+VFhTGby4?=
 =?us-ascii?Q?CaSXGJ9VHQKJKeyav1mt3naDF63rSrvO0iN8XgJeSx8dGmId9UHcwRgwr4IM?=
 =?us-ascii?Q?Fw4fifCRYAmNYGJEWtnDbS6qftoLZjL4XawJAjNjwxz5a2jeEAP7+KFuO05k?=
 =?us-ascii?Q?Uq5QXTsToVoNSe6xj51sZE+0OwuJmXWBevA/2DKbTM0GNoarhW4qvR5ceU5f?=
 =?us-ascii?Q?DHmBhrTekg9ROIRMjqc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 15:44:53.3455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3bf0728-480d-4096-9bdf-08de22cb96a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8292

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
this complete rproc_detach followed by rproc_boot calls are needed. That
is what this patch-series is fixing along with adding rproc recovery
methods for xlnx platform.

Change log:

Changes in v2:
  - use rproc_boot instead of rproc_attach
  - move debug message early in the function
  - clear attach recovery boot flag during detach and stop ops


Tanmay Shah (3):
  remoteproc: xlnx: enable boot recovery
  remoteproc: core: full attach detach during recovery
  remoteproc: xlnx: add crash detection mechanism

 drivers/remoteproc/remoteproc_core.c    | 26 +++++-----
 drivers/remoteproc/xlnx_r5_remoteproc.c | 64 ++++++++++++++++++++++++-
 2 files changed, 78 insertions(+), 12 deletions(-)


base-commit: f982fbb1a6ca3553c15763ad9eb2beeae78d3684
-- 
2.34.1

