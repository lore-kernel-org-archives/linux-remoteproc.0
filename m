Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011009.outbound.protection.outlook.com [40.93.194.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377B9369238;
	Mon, 23 Feb 2026 18:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771872628; cv=fail; b=sjaUJyERzKFzszJDzMsyK809itstWIIZNOi/FGz3Sh9I0sYzAIfPDxDdXtdTOM84egUTOTZHKCNustYcA0mnnQwnwwT3x2cqZtxGTVsm8iTfUXdsU2Xaa2EedSfLpc29uUGUdW9CErfkDXSlx06N/IhRPglmru0nzExXKgoXhnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771872628; c=relaxed/simple;
	bh=FfWQg8VnvJVMyeLQk51vLO/q08VWWR0jiBCyH0BLnZc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CHXUr6z8Hsxb6uuQZKo+AQCy8kvD2HV77qtv17XmFWIEXPpgsysdid85IXBvIvj1bHvun0gM6IFx7z141sJ+y+2PMgPSLKMtAhh60LzHCsAQBZimlcE336JcLuA6qwVmrDjsjnkpY+GYaDcuJwij0iSQdOnPV3eQMdEQPFPPMhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wJjj6XnO; arc=fail smtp.client-ip=40.93.194.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wJjj6XnO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mfVvaA09b1HwgetcwqDJNfsxvOhEMXWTSDiFhESLrhuBJunvr8EcycKTKJJJE2p2r34QLtsJH0z9lEWVoTVotcjflpHqI+N08RfYK8VIk6ZfkhfLHvXS7bymlD4t9+zO5ftxSE/XqlF5O/ocfIrbEPB9DPia766VKHo01M/3XpGXWOIXoaxMMsYqM7XBSRG9gk3cl8Fir3/pinB1wv3nXQrYnXLo+AGq+8xHvKIbpghGRXrldxXUz8cXfycHRT0fo8r6VCWq1mHFzeKqpUCMB+1MHLbxtel8JLtCxu1ZQZEdfQ43vd0re87l7CFFzK3mn8ojcGUuaxEyJLkifGalKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Opm/cOdD+z5W6M3LR2ccaHh4uP+JBwAyC6UjzKeMSA=;
 b=aycxGlALxDASAeLDcCIm0CrKirsEENRlhPVY5Iz71O04OBim3gadxCgNM3mGQDeZosdasmHN7cZb7akPlr+lVNKZ5KZS1JlOFJfmR25bmT3GocdLfymnVdtLyGIRYvQ0bX3P0Y430gAjYUbYpGmph9TssxoXGWp10gXdRzF5+84/ewheGWN2q+N/dqnS5NLE+fAOXNELGMrk5+3F0ef9rpUkHD6A5z3j4RitsM45ympdKcv22fww7Sfx+yXCmo6bG06UZ2eNg1Raa5UlkJ9fROWo1WIE+jYcNZHFj5I2On6eHn5sO2Sp21fBc/r6LakcVeRGKLaLIOREe4U95WUKLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Opm/cOdD+z5W6M3LR2ccaHh4uP+JBwAyC6UjzKeMSA=;
 b=wJjj6XnOuIey8soUBswL3ocP69a61ou+/v2cjFa7dBbNTSBDdWWb9s0ii6Nr2B907VC/bnfGlrI9C8aYwE9B6fWSlXhkFhUg0IqzVRmAYdHentkWjEYMa0yEENXIiOlgeVqTJNQhdeTWpbBDout26q9WB1ryxvw4iR439qAkyAY=
Received: from BL1PR13CA0450.namprd13.prod.outlook.com (2603:10b6:208:2c3::35)
 by CH3PR12MB7596.namprd12.prod.outlook.com (2603:10b6:610:14b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 18:50:21 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:2c3:cafe::d9) by BL1PR13CA0450.outlook.office365.com
 (2603:10b6:208:2c3::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 18:50:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 18:50:21 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 23 Feb
 2026 12:50:20 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Feb
 2026 12:50:20 -0600
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 23 Feb 2026 12:50:20 -0600
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>
Subject: [PATCH v3 0/2] remoteproc: xlnx: remote crash recovery
Date: Mon, 23 Feb 2026 10:50:04 -0800
Message-ID: <20260223185006.1278518-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|CH3PR12MB7596:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ebfec24-9065-402d-52e6-08de730c6562
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kYnwh8TzzQdWlt6CqkHPPIiMx3SPm+51JCJvuxBISKClZH/zld55crXBl4FT?=
 =?us-ascii?Q?yHKv3waAaQpBBdS1eZ/pY7Vf+Lc5edMjaFcxyGcZq44m59V13TPfFXQti4xo?=
 =?us-ascii?Q?5jDp8LF1TtRXYOdS4b4SSrwRdAr7r97rBn/7+ZFoYNKZVwTeyK70QdQHcASQ?=
 =?us-ascii?Q?oH4zdfWJ8XPjiSpY3XDGmJ38qeS4uY4jYxyRBlKQMBCL5SuWPwYOf5Y3l0zg?=
 =?us-ascii?Q?ipyQhyR1Yj8WhzETwpnaNDOuiMSn+gygMHYzeuAB+3E9yXasIS8LWOToaCYK?=
 =?us-ascii?Q?Eh+L4DzoO50C6UipqI1u8+nRJby3Pp1XeQP9vl+UZq+AgaZDEm6ZUn9zO0Pn?=
 =?us-ascii?Q?3lV3VSc0jfRi9trQhz9RYdkGHXhXOqn7bz6bkS2cRiw3Knuwq7ATWe1t6wmS?=
 =?us-ascii?Q?F0sHc5CcHOHxpNK0/VDNukp8k7518lSYFWmo26UN7q6gC7CrHi+3Ce+ul1F9?=
 =?us-ascii?Q?s0g7NCMfI6iRVX03PiO41HRwTHMBP+HWKkpGphslFH7FIVv6MBQNDNSkrrri?=
 =?us-ascii?Q?IvYUJSDqZunwv1eXIfu083c+yjdFdbtsm7q0CyzYR3t1PBjNNZvO01l6XPq8?=
 =?us-ascii?Q?2Hdv/d+Ir5oDi22JxMUmBdANXzJjFyIvBOgwTP9c3PrA2PFhtDChLXpIiEdA?=
 =?us-ascii?Q?KEfT0czXFfiwLvefUySuQr57kZ4rxDss3fLW9S2H71yDB1xeJQOIiwKjEkff?=
 =?us-ascii?Q?ntoKhFMFhn8mmL5r6WGD8VsY2CEb+CeBY6oHffJbcyJRWVQlsQoWfkzqYOBh?=
 =?us-ascii?Q?3PnMtmw5PMUVYk1Uv8U88Rw3SZW81jdwM/3sadLJoaXXqQsDvByTuTFS4o30?=
 =?us-ascii?Q?hrM7ZgehmNkyFihqLhVQ6hQkDu84BIW8RZlrCF2VnvFPOQDII8W8q2ZqcMqP?=
 =?us-ascii?Q?MT7DpElyZmbVnOp89V/LOZUTutzL2gR/X2pOPJS7bvr7pE7JIwnGkdgGUMOK?=
 =?us-ascii?Q?u2nJbgXPmfcsUNLbrJDvvgrCAp3LDkmVwlC3kbC0LLyO3P/Lv35d6o8UBrG8?=
 =?us-ascii?Q?J85S4sgrWg0LF86x5VcqZIRbluHxgm6v5yj710RjkMxNigMn/bIqAHrRSX25?=
 =?us-ascii?Q?HPjLrY1+wp933odXvtTGH2I2QHs9LWqkxLYbb6by47fXTejNxWHIs1HPakWq?=
 =?us-ascii?Q?MHEjTRYcyoLYul8znwwAITotxG92gOJSz4bNaVOktoHWoy0lr2m6BThA72qD?=
 =?us-ascii?Q?ttllg/O09bCQHDKmX86Eg32RuHQcybEJrj4LsHIlOQRRy61EfOGYwxfVFFaX?=
 =?us-ascii?Q?t5kfYd8TrKTacjOcTkmvvFZXvr5QXNsi3x/8Prt6s2XJ6ICMhVzWL26jXNou?=
 =?us-ascii?Q?K0b0oQFxgVBz4RZaRSIpcsp//Xa9UfVb5G2GUNZkb6wqrogWyervVRIngHUX?=
 =?us-ascii?Q?2FuDsNRjw9sYPISNsfFSKrzi6+Hp1fRdeSfb24VNK7L5yetchnRTyZgiun5W?=
 =?us-ascii?Q?HEZwuOEtNz3LiPowW3UODrqw66ytx/Xy0/99Ibpp3piAu9ARQN2FsxAiZIw2?=
 =?us-ascii?Q?8dqxOb5W84Qf+AT/8bVqOS7uNmGIQaPlsyETuDOnGeUNKcgX3g7WlV0mGxEu?=
 =?us-ascii?Q?j1rgFTJ8wgKBMglcCCyqbWg5UunYUPc68U8O1Ar9rfhqp/Wn0xyru8P/Jmyx?=
 =?us-ascii?Q?MVkFeJsoECcM5+5J/nCoca4iXp5rS8X02l3mdE9Kmb9MyJFEtC37Eb6oNspu?=
 =?us-ascii?Q?MjdMUw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UI26OQHBfDOl13YYxcHnICllt7Q8byFO12aBrRUxWGb+FatcNSnCXeBxJCGJAfDavHjPW4tO7S5vLc+B/RVVLGc6mQSHP/8On5DQaJjNQNsuKE419vl9w05CnPMaiDOcjhJTfWXbORyvw/p48/KkeSXvlVNzyltkQhC62byCGAlccjbDuEnZADc8WnAAAPC+eh2WuQKRsFpv8vSPFXm+4Ad+pq4iH9tx9M1qvINXtSExz0I0oEkihGr6NvzCZx0c8chzwoEwsKt/giZlrpeECNw7Yo+Wx7TzyGyHGSsJ1+jsS1BwHua2umMq83xhskMjqqYkgh5TjSzS0sNv5lPb0p65aoWX/YFZ1QUyjsVwXr7QsAtiB1t4spfPE38b6UcfkL8W9Jj9EQW9yXdiwTVIhnOJ9OO6m9DUsv8OhIRy4sIDJV33KC2aNbfduvWV9MyB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 18:50:21.0491
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ebfec24-9065-402d-52e6-08de730c6562
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7596

Remote processor can crash or hang during normal execution. Linux
remoteproc framework supports different mechanisms to recover the
remote processor and re-establish the RPMsg communication in such case.

Crash reporting on AMD-Xilinx platform:

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

Crash recovery mechanism on AMD-Xilnx platform:

There are two mechanisms available to recover the remote processor from
the crash. 1) boot recovery, 2) attach on recovery

Remoteproc core framework will choose proper mechanism based on the
rproc features set by the platform driver.

1) Boot recovery

This is the default mechanism to recover the remote processor.
In this method core framework will first stop the remote processor,
load the firmware again and then starts the remote processor. On
AMD-Xilinx platforms this method is supported. The default coredump
method is supported.

2) Attach on recovery

If RPROC_ATTACH_ON_RECOVERY feature is enabled by the platform driver,
then the core framework will choose this method for recovery.

On versal and later platforms following is the sequence of events expected
during remoteproc crash and attach on recovery:

a) Remoteproc attach/detach flow is working, and RPMsg comm is established
b) Remote processor (RPU) crashed (crash not reported yet)
c) Platform management controller is instructed to stop and reload elf
   on inactive remote processor before reboot (platform specific method)
d) Platform management controller reboots the remote processor
e) Remote processor boots again, and detects previous crash (platform
   specific mechanism to detect the crash)
f) Remote processor Reports crash to the Linux (Host) and wait for
   the recovery.
g) Linux performs full detach and reattach to remote processor.
h) Normal RPMsg communication is established.

It is required to destroy all RPMsg related resources and recreate them
during recovery to establish successful RPMsg communication. To achieve
this complete rproc_detach followed by rproc_boot calls are needed. That
is what this patch-series is fixing along with adding rproc recovery
methods for AMD-Xilinx platforms.

Change log:

Changes in 3: 
  - both rproc_attach_recovery() and
    rproc_boot_recovery() are called the same way.
  - remove unrelated changes
  - %s/kick/mailbox notification/
  - %s/core framework/rproc core framework/
  - fold simple function within zynqmp_r5_handle_rsc().
  - remove spurious change
  - reset crash state after reporting the crash
  - document set and reset of ATTACH_ON_RECOVERY flag
  - set recovery_disabled flag to false
  - check condition rproc->crash_reason != NULL

Changes in v2:
  - use rproc_boot instead of rproc_attach
  - move debug message early in the function
  - clear attach recovery boot flag during detach and stop ops


Tanmay Shah (2):
  remoteproc: core: full attach detach during recovery
  remoteproc: xlnx: add crash detection mechanism

 drivers/remoteproc/remoteproc_core.c    | 33 ++++++--------
 drivers/remoteproc/xlnx_r5_remoteproc.c | 60 ++++++++++++++++++++++++-
 2 files changed, 72 insertions(+), 21 deletions(-)


base-commit: 85ab651885e1b542ee0bb9ec4642ef0b11716997
-- 
2.34.1

