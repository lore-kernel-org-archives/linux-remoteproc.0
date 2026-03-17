Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012070.outbound.protection.outlook.com [52.101.53.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4C43016F7;
	Tue, 17 Mar 2026 21:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773782167; cv=fail; b=rD+CQuTAXsFNRcehSfVDLP0NJw9U8DeMSBhS4hf7WDnLezMUpILSR70XrlL9/AD6ORdcwUsRJGBfS7mWfL9+xH8sukj/Svs38gUVJjxn2Qd6jonqe61CMFlpxlUzvFISefNWHBzNP1hsRUyu0pQxHFMSULAsLNZBsG7MHtGfBd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773782167; c=relaxed/simple;
	bh=KRk0axCwTNH2JjSsIpZ6TbVG5K23HyGV6JRxRwMTXJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CFruSp/TkC0T8o8YgVRmhu8hnbkHnhg95xACBUSSiOGXuQu20aG8KdlOGVK2X54U5tsiDEO+6fW55lqcXRgS4oyK89/qOhask6EmVk65mwLIcqd7b7MoY67gb7Sq/PMZyW51vVKxlLFfFjvrgJypR67N7jsqNKaUB8xcQ+nt8No=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UiXzfbPf; arc=fail smtp.client-ip=52.101.53.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UiXzfbPf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRfL+TVgMwCXcI3HHNmxcxpIWgwVUWkO+mjFne6zKTluFGvUVdQi31mjqoocpshNbKKDo39qZEzTf/XurJSaps+Uwf3ta7h2M9p6HvVIRtJeALpLR7mvSwIUj61JeTyhYL2BhK2pCtglkPHkqRU3M2ythQC8RcVhJSmO059UTM4HfnqVmt4IXo0vRroDtIjqLMhj4ZrdR9LQLoQvcRcJdf78nK1gumpduqgphiN4bqnVBg2cag0KjYsU8ct8GAQkElqDOzz+HujunsSVt/EVU6VvKAYbRUWPaFNR5PoprpbbuKcESaTYSZhXe/cypbymLkl5eIyBQXEuQOmBn0vIFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFdxEqovyb8fyi2QMsfYIxQ1UXQ/lB4axkWFF2iow/A=;
 b=sI52075O47bMM6r0u02FcgRFkRZmTiPdcT3+x3RpIosZKGutI8woh5T9pTs+jb6d/c6rfqjAkCbbojDu0fn5kv//HvrOyaJS9BUyRK609U633rtaITG6RCJn/UHbG6n4d4//Pf7rxm03YoYgkYQdMkoiA+OcqxmNJ8bo5H5rBZ2h3N4RIyYl2MqKty1jmqXOjJGp8qDGL10lsr2ZpHfAc/bDML0LDPrAYxSJlOoJtmsBt/OUvBc5UoRRBwXZfy4rNm48Ty8KRAWxkjVQRuzgQgINN2uq+zs+dbfoXsxdecmYB5R50iCMZeNMC8o/m+tZtLAyRg1ACHVyeikwspcbAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFdxEqovyb8fyi2QMsfYIxQ1UXQ/lB4axkWFF2iow/A=;
 b=UiXzfbPfWoWEvIHZXilGLCpGi0Bv2Z4cqAxG6AsCSavovkPhujGAdz6veX8lR2gEiCdxaK0bvT4O5fFiCaiJSqZXKdNxZMwRxRobCmYED+RpMIo2a7qsmNUs6sGtw0Dre+NTcLxjFluKcXWQFPCcdpP48WqeEhq75flFxCL8THA=
Received: from SJ0P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::32)
 by LV5PR12MB9753.namprd12.prod.outlook.com (2603:10b6:408:2b6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 21:16:02 +0000
Received: from SJ1PEPF00002310.namprd03.prod.outlook.com
 (2603:10b6:a03:41b:cafe::f7) by SJ0P220CA0024.outlook.office365.com
 (2603:10b6:a03:41b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Tue,
 17 Mar 2026 21:15:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002310.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 21:16:01 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 17 Mar
 2026 16:16:01 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 17 Mar
 2026 14:16:01 -0700
Received: from [10.31.206.142] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 17 Mar 2026 16:16:00 -0500
Message-ID: <cc0f3ec9-7e65-4eb4-b54f-41612f3f26db@amd.com>
Date: Tue, 17 Mar 2026 16:16:00 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH v4 0/2] remoteproc: xlnx: remote crash recovery
To: Tanmay Shah <tanmay.shah@amd.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260303233533.2310513-1-tanmay.shah@amd.com>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <20260303233533.2310513-1-tanmay.shah@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002310:EE_|LV5PR12MB9753:EE_
X-MS-Office365-Filtering-Correlation-Id: 571b58df-83e1-4228-d871-08de846a646c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	MDrvBtHwkcocE4HOVi334njp9nXbeG3eH6HYKid2+rmQScpk0FJpCOR6TJa682s585dMv1BZO1Dp+ZEzWe/pCxR0ykJhO+/fp+mUoQyhykMYmJM/DMIo6V5OZBoIY1edEPxsVCmwg47RFwWP1t4dI+WmPTde1I9IGveIiXPjUDPJ1zCUByFStjKH4sZdqp++NeN0G5FOjDvxUL2QxKHhe9VA8XhBhA2UiOt+ZRPRpcQt9aobuCsthva+mmNqwgL6zXo8yjr1QUUBJZL5Z4LB/PBlYBJjUCiXs3UYWbAuMm9PYqs0PUDfwAvvvKeKkd5b6O2FZlzqoFkMlUWq+5jdGr8ps0g+Dygw8MPYFFw97Y2RYjz710iCM0ZFpJ2AahnYJwHolI2CKikr2ctEXsxs9WW2V3k4z8DxU8F1WTem9x3uEY4/7QCBwfYW/k9XNlGQvN49NwVn4E6AQjWtVgAWvk6cnzI1e/R4aO1cbPVYDJxBdoAKoxr2fmacWm26M51f/aGWombXqs9/Oxw4DTw3glRcBGqpmK1OfpeWZfUBaGlkPUVi0ovmi/PkFMgBFLtMDonBN1fYkLYktYrUu+/zdLbaWVGhbm7aoj8yU/tyeB2L0FZdUillEwe5ZkpqnU1w8FFhQJVgpUNZz9wCKrRbp5TuQiQWKLmbTDJzD8vol9Dik8jcasn/beV7lWqLcT2W74mY7/mDcKsoLQnKWsaxZzz+Vebo4yANKhOR/iA4zSVPLVN9Ko7jsm4T5fnjde5lDKBSiLtSPiIavVX/reWIgg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GqsXz/vLULbCcPPjkDYihEfKWXU4pF6HEHlT4GTJVkH2r0wwEp09LVV2suC+AMFZYf4gSfl1QUKHXPI1pDECzCW7Kvh2D4txnY7Q5/uA5ApapNCfYiA1wPuUU7ouvcAiXejO+6W7rES3+nkHgME/9RmOzQn9ox8RmFEG+Kf5ZNGPu6KFCaU5HRTVyEA0kaA7pAtVCEWOFR3ceGbOuMi4zmO1lp+JZ1zCsJ4/eiUJJIFVlM6U6m6FGygMZNvnU7kt7fBkjgoUdYKtCMMJXRdquSHuk6/bZrF7yGBgaku6Iyk9/SVOhXkjaBeXcbbzgVLiRJUpnBzcJ/DhuU9nyRfiJngnZdiPNtBSloI2LcQ8Nmy7Zdw/wi1g5dRHQptaQhtMn80Ss/0WG7ZuAw2ZrLSKRCJ/jIjMNpe+zRXDch6V80TU0fEbnCWs+4Oxfp2KS02m
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 21:16:01.8319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 571b58df-83e1-4228-d871-08de846a646c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002310.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9753



On 3/3/2026 5:35 PM, Tanmay Shah wrote:

Hi Bjorn, requesting reviews on this patch series.

Thanks,
Tanmay

> Remote processor can crash or hang during normal execution. Linux
> remoteproc framework supports different mechanisms to recover the
> remote processor and re-establish the RPMsg communication in such case.
> 
> Crash reporting on AMD-Xilinx platform:
> 
> 1) Using debugfs node
> 
> User can report the crash to the core framework via debugfs node using
> following command:
> 
> echo 1 > /sys/kernel/debug/remoteproc/remoteproc0/crash
> 
> 2) Remoteproc notify to the host about crash state and crash reason
> via the resource table
> 
> This is a platform specific method where the remote firmware contains
> vendor specific resource to update the crash state and the crash
> reason. Then the remote notifies the crash to the host via mailbox
> notification. The host then will check this resource on every mbox
> notification and reports the crash to the core framework if needed.
> 
> Crash recovery mechanism on AMD-Xilnx platform:
> 
> There are two mechanisms available to recover the remote processor from
> the crash. 1) boot recovery, 2) attach on recovery
> 
> Remoteproc core framework will choose proper mechanism based on the
> rproc features set by the platform driver.
> 
> 1) Boot recovery
> 
> This is the default mechanism to recover the remote processor.
> In this method core framework will first stop the remote processor,
> load the firmware again and then starts the remote processor. On
> AMD-Xilinx platforms this method is supported. The default coredump
> method is supported.
> 
> 2) Attach on recovery
> 
> If RPROC_ATTACH_ON_RECOVERY feature is enabled by the platform driver,
> then the core framework will choose this method for recovery.
> 
> On versal and later platforms following is the sequence of events expected
> during remoteproc crash and attach on recovery:
> 
> a) Remoteproc attach/detach flow is working, and RPMsg comm is established
> b) Remote processor (RPU) crashed (crash not reported yet)
> c) Platform management controller is instructed to stop and reload elf
>    on inactive remote processor before reboot (platform specific method)
> d) Platform management controller reboots the remote processor
> e) Remote processor boots again, and detects previous crash (platform
>    specific mechanism to detect the crash)
> f) Remote processor Reports crash to the Linux (Host) and wait for
>    the recovery.
> g) Linux performs full detach and reattach to remote processor.
> h) Normal RPMsg communication is established.
> 
> It is required to destroy all RPMsg related resources and recreate them
> during recovery to establish successful RPMsg communication. To achieve
> this complete rproc_detach followed by rproc_boot calls are needed. That
> is what this patch-series is fixing along with adding rproc recovery
> methods for AMD-Xilinx platforms.
> 
> Change log:
> 
> Changes in 3: 
>   - both rproc_attach_recovery() and
>     rproc_boot_recovery() are called the same way.
>   - remove unrelated changes
>   - %s/kick/mailbox notification/
>   - %s/core framework/rproc core framework/
>   - fold simple function within zynqmp_r5_handle_rsc().
>   - remove spurious change
>   - reset crash state after reporting the crash
>   - document set and reset of ATTACH_ON_RECOVERY flag
>   - set recovery_disabled flag to false
>   - check condition rproc->crash_reason != NULL
> 
> Changes in v2:
>   - use rproc_boot instead of rproc_attach
>   - move debug message early in the function
>   - clear attach recovery boot flag during detach and stop ops
> Tanmay Shah (2):
>   remoteproc: core: full attach detach during recovery
>   remoteproc: xlnx: add crash detection mechanism
> 
>  drivers/remoteproc/remoteproc_core.c    | 15 +++++-
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 71 ++++++++++++++++++++++++-
>  2 files changed, 84 insertions(+), 2 deletions(-)
> 
> 
> base-commit: 098493c6dced7b02545e8bd0053ef4099a2b769e

