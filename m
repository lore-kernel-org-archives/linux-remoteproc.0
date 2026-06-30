Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011056.outbound.protection.outlook.com [52.101.62.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DB31A0BF1;
	Tue, 30 Jun 2026 00:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782780518; cv=fail; b=LPF4l7kSMBFJVUnpPUmOTpAiFlFd9BZLfiJMntYiB7dgspa52u5RI/h1yTI+UHtX8uJgPuk+iuz5DqQw0Hz7QJ8gR70NHUXBrrhVkKGRAtd6R12eZaNTy3c7Sl+jSMxcsBeFtuShSteUk1dlqw3pIDWUzYTeAR7NijiFbi55Zoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782780518; c=relaxed/simple;
	bh=CFdAc9rVLgAqxJMi8jm5KMvo/2vkYhix2CdMNUXXg2g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=a11Df6VQkVwAuha6XZLi3hs33KwTdeg1AK0qagTtdd1eN0A2RGymTThon72WyiTd3m411Zt2C9icxqgDCoTmIRZpojKoyfx8onOlTufPXo+1uGNn9y//bo3tvAkQtM00rA8AgqS3OMH8qNSyTCfDMkWRKNC4qCH3TZtFprBQLO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YXr6asca; arc=fail smtp.client-ip=52.101.62.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YXr6asca"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jf7DVFI8r9X/ICgv77ORYyHoy9/JR135hFKuPiL3tCs5EiDGPuu7IG6GjGxtf44BLQ5qey2taqJ4Fdn2vA3ILkmMSyZxKSSHgF+UtOfogQkQiroKB+Kc/NqAutiNlzSNPsLihi03TUktlX92nBaKDZMmwAKmnrWhVUSme9pota58TnO1xL5VehZ+Txz3x6yusjmFmnKto4ohSnf0nxb2FdjwPubRLK2eSEuZcT+4nNY6jIvNk23WYfxoOkBzdnglvDzdQhE09NP7CZCKt6T6oXVxcVtWl62UTnFwwMS/xkwe7MvbadjDC5FdSQKOcd7mdw4a9VhH6TYhDUzB1zliJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5pJndMpqhUHvOqpEkR5ZttRurFzt3mnqnp0PWGjWQwY=;
 b=RI6pko1u4CG3OOgrnCu7847w6vIEihVaPGzB7OJ24x2/nWGbcXFKmM8Hs4zkz+LoFp0K3DR0oW+HMR123wRrppWQ6CBigB7RzQr4YFkuIPLCJafyWSgDZZxxncNZcsLKPJ5iMCsZ5i5LR+um3zShMlGYB6M9w1/JGLMPaW+fwTSOds/QBl5WKhAsxQnEwWcd9AWmFOXUMceEOpc73u8zPD1XfiWGDKp+8dN8O8TfFD0sNtBoEmQB8i+5xd29AsLx0DKB3lQ+wZa/psAAzPwgUo03MVe5htyetEtYK2jj4ajodqaA7lMOyPosXx0+lGjlRZAiDnzoyezat5+ngSIlSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5pJndMpqhUHvOqpEkR5ZttRurFzt3mnqnp0PWGjWQwY=;
 b=YXr6ascaTcOsN8ltKL9bjgw1LHEMgYtCrBCMBVYusSLEZfFI+XN8CptaAGFPz5rqpyml8iDGe0m2511iLItx8klNZ5Jy5rdqkb/mPi/4Q/UjI/mgEZoIzjmaIcGNUbLa2E49hagxs2ddTv23UGC9RO07KmeDd1Cag24yQSH6uh8=
Received: from DM6PR21CA0027.namprd21.prod.outlook.com (2603:10b6:5:174::37)
 by CH3PR12MB8281.namprd12.prod.outlook.com (2603:10b6:610:128::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 00:48:31 +0000
Received: from SN1PEPF0002BA4B.namprd03.prod.outlook.com
 (2603:10b6:5:174:cafe::51) by DM6PR21CA0027.outlook.office365.com
 (2603:10b6:5:174::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.0 via Frontend Transport; Tue, 30
 Jun 2026 00:48:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA4B.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 00:48:31 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 19:48:30 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 17:48:30 -0700
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 29 Jun 2026 19:48:30 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>
Subject: [PATCH v6 0/2] remoteproc: xlnx: remote crash recovery
Date: Mon, 29 Jun 2026 17:48:04 -0700
Message-ID: <20260630004806.3835488-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4B:EE_|CH3PR12MB8281:EE_
X-MS-Office365-Filtering-Correlation-Id: 00970c33-6ddf-4a7d-c369-08ded6414ea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	GoXoq1wei5JkLnk4j7T2+6v0u/AM/pneRjlzZAcoEYXFzh7bHul6RogiiPbXQ2RicxUfITEw1K5Hkj426yVu/mMHkrmn1g9IKDleLFFSt3qwemMjJWuTYKiKLsViS1x6Pqd0VFY5QJeu4W4/wfX4pYKpRgZWP6sPtUbTzBb7js/3LnblRebhK2PLozYOTdMIDEo0CG/hEX1I3xFAWj/VWJrohm9tyoEcqmrf3cCiEJEACDSgYwj/c4zr5936grXQZVtL74nkdRcZiZoANoWeO9AUNXZjxK3o+Sa6TB/0S+o4a9pAqyq08bFWlwqhmxJYANBG0effYVjk6RIstDPu2cpxi93QoCgOtD4Mi0kJCF/TdrIiXNjZTokPqbV9AGsM+nTLncaQbr1eupvPP1r6l3mEOl00Sv9RtNx/iRipdc4iAl2/Y0TYGUqsJsTnHQR5hcxkjf9p8EmXu4DSuiTrjb8lobD0SNHODTAie1fMy3X0TfcWqG1sYZM/1be6hnmpyEvpTrX0pslY8mYgtvGivEXa0kY6dZduJCSYM8L2ZG/QWgyMBhY48jZjove/wmOx5qimFXep8xAaJpcLrgTEiNtjAGyGO4MM6my5DURZ16T1nwkQ/fzk5g/TUGPQl7ssAOOkhXSiAa+FcXV/Hel8zpWCUtp/isYZwzlKkbg7KLJffCILffwufjkV6zb7V1rCR65Gk5VQpLxhurBKpNrjoA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	41TibGsWfkhSEcaBN3UdLpCmnvCkOUl+jVOX1mviGZLehXAv9U0SMAfPWwM43x89br0f7ScCvYfNNSW0xnMkOBHEKGu/TAB+AS204E1/4w4puQgNm/g8CWzORZmsO8qrUOjSlZl1Ipbfu/fJ0MxAna71LsxYQAXBFUyovt6eybf5LN4TUslo6WMcjhEqJ0ZWvRwzYR3Fao4SzEqwkU/vxLMdtMujVrCOgLTILJk+38RF8i6th56W1gF0inKHzRTqkv2abqLC2kPRc/hmJOp0ZAFi6TWkJpao+aCSGX/N9HxWQE5c2O9E++XLMGBLlFJl9pJ+GEOabCyMW8M6j8RLWq9g8SxcZPU1UsaUARUe3dipv6p4OQvnICc2VcDOvktVtDszOZK8bnJC9ZkLd3DSWJi/0ELCiQJZ/vk5EG4VOXmlVlgqq491zR3yyazHYsWW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 00:48:31.3721
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00970c33-6ddf-4a7d-c369-08ded6414ea8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8281

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

Changes in v6:
  - %s/XLNX_RPROC_FW_CRASH_REASON/XLNX_RPROC_FW_CRASH_REPORT/
  - fix if else condition to reduce indent level
  - %s/crash_state/crashed
  - move setting rproc feature during probe
  - remove redundant clearing of the features during detach() op

Changes in v5:
  - cache crash report to a local variable then act on it.
  - End crash report string with '\0' without relying on fw

Changes in v4:
  - Optimize crash resource memory by changing type to u32 to u8
  - Introduce version field in the crash resource
  - Check crash related condition before rproc state related condition
  - Move crash reporting to the bottom half of the isr instead of
    actual irq handler
  - Introduce 16 bytes array in the crash report to store crash reason
    in the string format
  - Remove redundant type cast

Changes in v3:
  - %s/kick/mailbox notification/
  - %s/core framework/rproc core framework/
  - fold simple function within zynqmp_r5_handle_rsc().
  - remove spurious change
  - reset crash state after reporting the crash
  - document set and reset of ATTACH_ON_RECOVERY flag
  - set recovery_disabled flag to false
  - check condition rproc->crash_reason != NULL


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

 drivers/remoteproc/remoteproc_core.c    | 15 +++++-
 drivers/remoteproc/xlnx_r5_remoteproc.c | 70 ++++++++++++++++++++++++-
 2 files changed, 83 insertions(+), 2 deletions(-)


base-commit: 78fb7968943f5064766af7f33d82e6bfe90e0db0
-- 
2.34.1

