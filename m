Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012013.outbound.protection.outlook.com [52.101.53.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925383537F6;
	Wed, 10 Jun 2026 18:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781116088; cv=fail; b=mcp0Mfvz+WxYgXhe8KNpL3Sy71XBiv4D7ZUWS1grRO7j2wy8SYW5/i0fP/6T/sZ6/KBVDQ+mUP1qsLronKiaz9+Oym0noo64GYPQ8TdYivyfxjE/c2nXRR00PTKwpZYRV2KtyQWyKwa2zKPwsGxOpxPfieHwW5pkOfeSjS/thgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781116088; c=relaxed/simple;
	bh=84hJx8Y9k4tIcvuWTnBfIKtCPirdLyUSDOFeNwj6SxQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AvIhbrL3E5LTENEQqrQK1wV2aBprc/wuuXlTmivohu1ib8S1JHF9XCUftYHUz7pFt6DklS81fJTvnzrJdYVyNOX4uzOckUTDFY7oDeu9WEo4q3uShDEQxnrc/66SCF9+UHAgYyHjblcW2VKxXkHQpKlaooZYB4H5JZCZfGbPHTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=D76SbB1t; arc=fail smtp.client-ip=52.101.53.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="D76SbB1t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eesBjhJFeAj5jvqZK7R26n9zmmWqMelL6d5z6ra12Mtptv8z00XurBFej+e8zN7f7Pzk3sBb7fX/D/t9te+A6VnhZYjb/m8Mg5wfOJlHyFM3zbRe9oKFrfavGZMsBJUEVE1OmRV9svzqFqFu9gAR6xXUb/qDfYyyiYXen+dsK4IV9MftqSsgDQg8oBoRzeKHNvpbyrgK4p/foHw4Eqbr02i4shm9Tvhmajjo1+6j27msitglmnTN//I3+NSriQ6eeG+oz5IoFyWSGLWNlb0pNtb0KxrnRsjoxh6dmPKKhLDs6fUBdpNiw125dTen7vWIgCNRS1WKvFuwWSyDN3NBEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oz6my8edrizlzZl24hJ1UycgytQO7pfMbJHYtMMpfRc=;
 b=gpvRVVurcbVivyIQ1OiyjIxu/t6hvNYIzRsJm1bBjDHALPjqw4gI2v6hnv4wHt4jKzxo0E5lGlzrhULNCWTuTuD7SqNSk6I3aQR12/Yz/TsmHQnL7pl2NkypdZs4mee6AYuFikJQM1wgpv06qeXyhmoeABT0PzHn1cBSY4RImLHgbAuEdDGU7XtuKdRLnqOYgisUDbANL44/2MdKY6YUTzgmna14PHe1k3g4PmXmojDhGTQfgoXsgWERgjb5yqhgz2c0GgHLTwdh7qMnPoXf8f22l00bFhjGB6nItkYSzF8N4tkbPlBSwZz0cPKsz1HzXs75jf90CfEfTc+6jALpnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oz6my8edrizlzZl24hJ1UycgytQO7pfMbJHYtMMpfRc=;
 b=D76SbB1tsgtj66JcMfNjvLxe293HHOTpcGDquJ1BcZw1UmHZNIpuPllnQmVUeiws7at07gy1SN2h4X70CRFndE337MvKW5K0LuSUGqp84y9Qpomxv5I49thq7DeVNRbdzit0p5vlS5DgsueJK9L+qtmpR5hux5pjMSbsJMK13pM=
Received: from SJ0PR13CA0101.namprd13.prod.outlook.com (2603:10b6:a03:2c5::16)
 by SN7PR12MB7881.namprd12.prod.outlook.com (2603:10b6:806:34a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 18:28:02 +0000
Received: from SJ1PEPF00002321.namprd03.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::6e) by SJ0PR13CA0101.outlook.office365.com
 (2603:10b6:a03:2c5::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Wed,
 10 Jun 2026 18:28:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002321.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 18:28:02 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 10 Jun
 2026 13:28:00 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 10 Jun 2026 13:28:00 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Tanmay Shah" <tanmay.shah@amd.com>
Subject: [PATCH v5 0/2] remoteproc: xlnx: remote crash recovery
Date: Wed, 10 Jun 2026 11:27:09 -0700
Message-ID: <20260610182711.1758544-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002321:EE_|SN7PR12MB7881:EE_
X-MS-Office365-Filtering-Correlation-Id: 3447d937-9d22-470a-fb09-08dec71e019c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|6133799003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	IQ8nz8Cu7u6z12Krs5xTuKOw0mJ18YUK6qUoRZhobGlSeRJL/wWrczoIdMEwGaBjhL2yIwHjb21eD+DkyK75d5NT1IazgIMMHJD2QJbEQSmiPUhc0JFmgPwbiies8d8jRCh5RbtLP8i8Y09s6Cr36oAgYBudivkURL2AtJFcqTNyhmzyAuN3eMlv9ho9+SsV+tR9uKNIfPXhKdfBt/5/J0OFIHQStLtK731yeGoQXl86Q1CQTY9WZPK1z96fi5krwpcIHK7HUnzwaivE/6qa4jNJ5GAV4iIevCx9PgVR9H/4rrPYMaZZZPgjhglg65yfqAoowDjhhgeLj3Lk8eGIDb60F4g8MCgfKc5NWE64Kto/l7xgLo6MErJ3PSAogcpfmMGx5WN4XVNutwUkyQJmJRTzcDA3WiTxzxKPVX56/VtKmEm5017cC0DKoxujJ14wKk83xKijEW4bnTF+S5JJFgxcM0hJHiOVpyvXT4gWdrZJudnv/7NsnLOJ1F/HH7hE2oGUwNlQLiDzvfBs7+Grz6IiDxbep/yQwuZSFn4IWfyN9wDRCnF8kdacdIudMtzmczG1iWiBzhZRPuCuqJ36stFtx5/XItGrnt8GTjBz9/+sgfcokyPOuucYECV/Cptyj1RRqoWJCD758M9m3QFgkqDl2W4dKZOQwjdw7MFq4wy5IqqBu3Ds0pkiIhFd3BCNqBSeqJAXjEWJdGuH9J3kVEDcu+bcBlbnnZ7y2uCHyEk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(6133799003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o0cW///mgQUx6+ij6VBcD1n0zrzFO7KK5W1E/FR/AsCWKgZrPMF9BMRz0SBCOk+go3+awi7c+M4hRp7X22ojYyWzdIqeVwmLkfSlQCI/HSEgWF7eHl2lVKzCqvb0GOJ2bKGTfpbXzCEbuED+YHadwaMIKureFnkcq4jXH62/W4Mjzsu+84Cyw9jFRyFi0eygfYC/jI9izLtEYV2AMwVZch+N54SwYvxHY19XWt9H98/iXfNO5/n3VIyP3QiDFKirgSaFYJ9n2qvWpc/dl7wq512BaLbPVkq9rESMk3tLRMdCCRK0epxKkJOrUB9ouukDOpUrKlbDRqZafed+s0pWV0OgaTzdBR0V+py51w/XyfcFC+9KRJmf0suv/ozIMkSQvIrlQk80UruUSgqsn4XYxkUtQp+O6ycfzZwfObzDZKZHL7XVqhBZg+hNTxQJdhWm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 18:28:02.1853
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3447d937-9d22-470a-fb09-08dec71e019c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002321.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7881

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

Changes in v5:
  - use local variable to access crash report pointer
  - End crash report string with '\0' without relying on fw

Changes in v4:
  - move pieces needed from rproc_detach() to rproc_attach_recovery() to
    cleanup the resources
  - use rproc_attach() over __rproc_attach() to create resources again
  - keep rproc_trigger_recovery() unmodified
  - Optimize crash resource memory by changing type to u32 to u8
  - Introduce version field in the crash resource
  - Check crash related condition before rproc state related condition
  - Move crash reporting to the bottom half of the isr instead of
    actual irq handler
  - Introduce 16 bytes array in the crash report to store crash reason
    in the string format
  - Remove redundant type cast

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

Tanmay Shah (2):
  remoteproc: core: full attach detach during recovery
  remoteproc: xlnx: add crash detection mechanism

 drivers/remoteproc/remoteproc_core.c    | 15 ++++-
 drivers/remoteproc/xlnx_r5_remoteproc.c | 73 ++++++++++++++++++++++++-
 2 files changed, 86 insertions(+), 2 deletions(-)


base-commit: 85842b61f64cac93d28e129d35193e329d463fd1
-- 
2.34.1

