Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011022.outbound.protection.outlook.com [40.93.194.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D02F3587A2;
	Tue,  3 Mar 2026 23:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772580996; cv=fail; b=NA1iEwqY7+v4nv7kXIxrFtG3NpoXWrBMcCtj5XZmBKr00I6kyF98HyvjiK8DpJRtCby1+Lns3X5zXnWiSRQ8MbcqiHFc+abubha8xdKVOh2eBPMNRBUDtAlBxhnuzpgSkNqHLIkKrNW7csHyWRTZremVjZNFPEJGW7hlHXKrWps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772580996; c=relaxed/simple;
	bh=DEsIj6hkBrV7HMW+ErideaYz+4nPkYqiim2YgTuQwHI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IIJfWzpTvb66DVbSMQio6GaUjS+jUaMjHHymAofG2+jJSq4BPDup2rskJ8YeDZgvNzmt8ujFRmpD4HelSbXU5nrcyHnOh1yGwz4WYnECq8oYeQIpNzQZLL3WqDJvmKo5CPWNPYs0pmS/XEuisAFFeYHeNv27qccS+nopQcVk4ok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wPr0ZyBg; arc=fail smtp.client-ip=40.93.194.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wPr0ZyBg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E4KVUcqQx1n7kmGoLlg/lm4K1r/fQrOAs8aKF91lvLxU04sqyLq+UCo23p8Kwp0HTnZRkXe5KRSA8TKEwJx5WJFwfKqh/C0M3cXwtHsGC2nzBoTgJEoGuFCdeVzBUcp47n9D0dAdV4HVlwNagXURegmV/tCN7ksjZJLxa9RSV4fxyKdOD1C0Wg/4T0gt3Fk+Shlwg04TLEqle60ReBb4xcQLxD3tQ5mye/4KRdfbWAlsR1cPYAQT48fw+T//heyD561fHyih0rXSO6hcJClwjHf0IV2x0eimDQWE5q0Zu5ZVlHjXmtvUKCHlnVoony124ASntlEaO/CZJBd28n0lwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SqNqS5FNPn32/vt2c1xDr2oKXGNjB/NRyuUAJtl9etU=;
 b=OHZOAtcPr9HvZ80pudh4R2KLq5ZWzAP5gwTBPphUokOC7rDCyRrPJoTC1eYc7fHJJoEkKxfxCbuJywCxLLCom0fbwTzyEvsPDiBhvjUhNt9jf+iW72eGD8q/Sh5DZ7uK+qMH3wwHsw9I5MeJo9ORdhauWFQBtJyjaALcaeiXTZwmnyFl3nPaQ9QNgkBbLPEzPwu2/bng82+nI/Q+GMizPqAqmSDw/UQkQBYmHl7zXWhPTDQaTUq6nMBfuhGv1nk29MozSIICWrA3L9XrC7lxB7v/llZzEnhdfQ/Oe4r4KCN9zlySvsyzT7uvqyr/sRapq7WQSqdkjpmnYqRunkgGjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqNqS5FNPn32/vt2c1xDr2oKXGNjB/NRyuUAJtl9etU=;
 b=wPr0ZyBgylu1SGLY4LsRdYPuHI+rtFb90k1bCDquINQZTEe8hpXDoMDeY6ZAgQ5AKNDeqLg+pDxg9m46IdicrammzdOCmSbrg5QBLDUajOuyXA9675MAhr+9JIutFp2eA0sKo5BtGLaCXmsVq0CI3TRsmUktQdRngtYRNs7pA0E=
Received: from PH8PR22CA0015.namprd22.prod.outlook.com (2603:10b6:510:2d1::23)
 by IA1PR12MB8312.namprd12.prod.outlook.com (2603:10b6:208:3fc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 23:36:31 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:510:2d1:cafe::e2) by PH8PR22CA0015.outlook.office365.com
 (2603:10b6:510:2d1::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 23:36:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 23:36:30 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 3 Mar
 2026 17:36:29 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 3 Mar
 2026 17:36:29 -0600
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 3 Mar 2026 17:36:28 -0600
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>
Subject: [PATCH v4 0/2] remoteproc: xlnx: remote crash recovery
Date: Tue, 3 Mar 2026 15:35:31 -0800
Message-ID: <20260303233533.2310513-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|IA1PR12MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: 60685969-9832-439f-94b8-08de797db2b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700015;
X-Microsoft-Antispam-Message-Info:
	xmITVD3vpMXywP46Icwg+m9GGhSQQNcYeLS96v6PZy3FCy0rFwFNqiNPU2wUXOSm+IpAFLHYQo8PEiD/tRXCq7Q90kVsIaVRHvqStL58NH3VezPkB8E+Cg4GXxVVzsuCsxDC4ZxWbOeNjWx3fbNuCED2KGg7SUdTrj25SMMx4AufBhnNQ5DOuUbdw1OSC4W4Y7mRdRBNCQDgwGQAJVQMieLaU1p3JwM8HPUPRhyY6oGXZ/LWQMKTPwtopkZdbxhLY2OhYiH3tJaLKJHi2EgeLsKjNIFUKDGJcXJpbbSR7FeqhMKXQ6nR+KBmjJ7FFJKm/Rp4EsepOvMrbqk3CgLIifx9NoZU4tsZloRgFtpTa7jZL8W2M2QBR3FvrgRoXub2YQgJYebA0Nuig+GKCZvYnYTdZKHMqMtINq4k/n3WzzTuUNTZ676V92SvLH37+W56OsvSrrmgAgUS0o4jZB3JmXdye/GJl7siSxNTVnT27bPNpY5y9aiGxk3SWF6c/GkJJO87ihLbkuOZNaskvQIfuadDZw7o7XECCObRxs3ehqonDVXG2J/g0O2GiG2H5PirK5WV+OibUwt8+yW1RqyA0u0KI6bhvFGqgNm+lw7Kf+CCqmDKPP2UjJLOwNPN12BjJo9HjKvszTgACiLRDYi+OgmVeRIav5jKaABTCfFI60s9DuCKq3xyT+UAr9dV1RHgqW+oEX0XgomNjqhCuTqEMDgmXj62iQXcCjrIpWGxoOhuqoneOlW4TbuHv+uKWjnFUmRBIAguvz/y8ou0OCJKdQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eE7t/M3QB8LHs22wYAGpGpmJcIGRXazldcFEashtNM6wsaHQMTaYrPSZU9WG6iEGVMqPYiwAUqj/g3Pl7uTVnklZnWZml7LKebo7pl4zoCeziRAgzYYGxMTADYDEcnJFhbqwXqC18ZmtIz/PZBKtYQvRcpUUp8H65ZoaNkZBwbNSuHRz6E+RRLfPAmy6FEASz2TL6sFbYaG9slcUDZbMIG8sI2iOH4hkw40EwLApo7h9yyf88NOYc67S23nXCtM1OdgN9t3pQeKMoDe91WslzcGid8R27LRXt2t238H6PZtbud7BDpJt08iIYJ/jF1gZnWLxymeqySwQwgGthBD9lBu1bs1cs49y+Uucih7jc6NXA0t9bedfWrCHuH52gmkBwucqaEEgUvK00yg9DJR3KieoEQhuz9O6DGn8WdYMUT2S/kGA84bfnL2E87GdtOtq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 23:36:30.8460
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60685969-9832-439f-94b8-08de797db2b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8312

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

 drivers/remoteproc/remoteproc_core.c    | 15 +++++-
 drivers/remoteproc/xlnx_r5_remoteproc.c | 71 ++++++++++++++++++++++++-
 2 files changed, 84 insertions(+), 2 deletions(-)


base-commit: 098493c6dced7b02545e8bd0053ef4099a2b769e
-- 
2.34.1

