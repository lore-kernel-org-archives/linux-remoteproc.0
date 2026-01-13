Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011055.outbound.protection.outlook.com [52.101.52.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A07029D27D;
	Tue, 13 Jan 2026 16:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768322280; cv=fail; b=R8FbpfThyozbggQIyrWD65xlPQz4+5YQ+Pf8tax7hpkShg940tiAwcrxjlOAJG6GL0RazCl22vvgZmU7QhWIbxaNJEE2bYx4RjllhP5X7CE7Tf6ICX+rXPgasTMG5CBd8uAjFdtrYZBsyIid1zcARL9NPNZGlsLy1d6TsmMg3ac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768322280; c=relaxed/simple;
	bh=1Xw6BsBycFlDbvZw8K4M0Cn3wuZJ1DrTQ+XTLxjuXoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hY1+LnBdU5lK9myI8IScXDITiCYXrilIKlXmyFk69emgqXD6szepZJzzjBWcQ7YKgcGBsvg96ZeeOWBxp6sUwPZ73qNXSePZlcPU+b3M3385Io6CsgUATP9zkvD4uINHhaUwrjsWanUA4lXA2+OBQ27NSq6NtQC47qtLpMy1aHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=qdURhhBA; arc=fail smtp.client-ip=52.101.52.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qdURhhBA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SocKhvtZt4o48pA3juuuzw5VtiCyNNi9QQyz65m0a2lrjwY+a9CSHLsVCHmb5fi110gU/knEpFKJ2yNh9pflBX6u/N1Mu4sbTFvhdy+lZkIEnTFM3CNpliZ+XkGM6M7yilpWhibNRJeuMOrwjXElrbgj/3ZlUCv3LDbkCE3LU1jZvhaN6zmJCdXEvk+17h1nQY03KB8HmieXhKZWYLz+vNm68gPHFcc9OWCUtvb+BpnnVaL0/jq5HAI2qQhAXf07Eihb/G9dqycXJrtZmyWA11N5xVTmBHjWnz9vZ3K1VmEpB4KBK87d7/30O2at7te55iRL7+pIGaR5jCqvoePpxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZ8MPuLWlxgVB4vxef+c6u2AUpSFiaYWpJzE/la5ZZ8=;
 b=mo5J8R1xv1hAJktTbukGI4A33oU3rEICZovm5/hjmcICqn54okMr88nIGC7tFZl7Vuic2xGbbI82z77bFumyfq7kun8jydS/vA6GV0Q46JkPOO6qJh3cfOugenlyow/7AfkqoyIxXLL/V2zfCGBWq3MhEdxh7Ul2u5Gjxv3LELzpektrrA6Ww19P6ikAjuivsro4UHlHpK8GxOdJd2BCrnyyQiqYLjzx5cZBiAeIAPqX3nXiHaWA6vnbLkFJOgNkbAV4OS04QfUg2zGOhFRy08CosWVWfHh99OjlbT9fc86e2yoWQqcicOcsCBqV9xyV7AfVizXvRhNiNhh76wuV3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZ8MPuLWlxgVB4vxef+c6u2AUpSFiaYWpJzE/la5ZZ8=;
 b=qdURhhBAYmGccYEeBNuNvH7nOKtIeZbv63r0KDgySeaqGPWAb8tvH2apA1DH2aFslWXioYFriBrgCXARgCkAHjqXeBTF7s57enCfY2m0qSHQ7GwNA788fzZlmLd/96gabx11JJVvL0g5A6Q6fy2d+sRpLfWQgADA1uPJ08S5TCA=
Received: from SJ0PR05CA0130.namprd05.prod.outlook.com (2603:10b6:a03:33d::15)
 by BN0PR10MB5207.namprd10.prod.outlook.com (2603:10b6:408:12c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Tue, 13 Jan
 2026 16:37:56 +0000
Received: from SJ5PEPF00000209.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::ef) by SJ0PR05CA0130.outlook.office365.com
 (2603:10b6:a03:33d::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Tue,
 13 Jan 2026 16:37:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF00000209.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 16:37:55 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 10:37:52 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 10:37:52 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 13 Jan 2026 10:37:52 -0600
Received: from [172.24.234.212] (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60DGbmCj2449478;
	Tue, 13 Jan 2026 10:37:49 -0600
Message-ID: <096432b0-ce65-42df-b821-4cee40a6ff62@ti.com>
Date: Tue, 13 Jan 2026 22:07:48 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] remoteproc: k3: support for graceful shutdown of
 remote cores
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <andersson@kernel.org>, <richard.genoud@bootlin.com>, <afd@ti.com>,
	<hnagalla@ti.com>, <jm@ti.com>, <u-kumar1@ti.com>, <jan.kiszka@siemens.com>,
	<christophe.jaillet@wanadoo.fr>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20251125083746.2605721-1-b-padhi@ti.com> <aUHb_ax7rn3K_QeW@p14s>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <aUHb_ax7rn3K_QeW@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000209:EE_|BN0PR10MB5207:EE_
X-MS-Office365-Filtering-Correlation-Id: ed87158a-b74c-47d1-2934-08de52c21a61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|34020700016|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RU1OSUtUOHBXNjJEY2U2R0xuM1dTK3NCU0EwdW5sMEVmV0Z0OVBJNkkvZk9E?=
 =?utf-8?B?UzVjQy9PMlJYMkUycDJEZ1J0blFNVy9ZWXZTMTdBRGEvenJDODZDT3pYa2Vw?=
 =?utf-8?B?THoyOE5lKzZKYXJ4NElSVzVGQzN5U1MxTGdTYnhiek5yZXg0RU02VDBZaUNE?=
 =?utf-8?B?Q2RMUklYUnQ0dlNpSG5mazl1b0phQnV6YzdZMGRORkFjZ1lhekQ4UTU1VE5X?=
 =?utf-8?B?NGxGQVpRNFV6c0N4NmN3VG44MnNPcE5CWUcrUkMyNUlieHkzQWZhang3NWtn?=
 =?utf-8?B?UkF3a3RyWnJhVFlhRnZiOEZwZHpQSjlaZmVKTkZ2WFc3cnRUUTl2Unh2Tnla?=
 =?utf-8?B?MUtORmY5eC9qOHlVNUFtdXVzaGgrZC82c0RTOXZiS2FJSHJTV3FhbUdxNWky?=
 =?utf-8?B?UGgySnRIS01vSnRTaUwyZHIxeEgreW9LNmdKOE8zVjdZUTMxTnVmYVNYVnZy?=
 =?utf-8?B?OElKczdTSWdMM2U3KzdLK1VaY1ArWS9saFBZb0VCS0NjdkFCVDM3MVpiVTIr?=
 =?utf-8?B?dGFhL3Q0Ky80WVVFeVpEUEI3aG15ZE5UYWF4VGptYjh2U2FOZVJ0L251TzN6?=
 =?utf-8?B?SlcyaitONXcva1BiWTA4YTdXcWIyTW9hRGR0UjZNOWtGVG9zSERFOEd4QlBm?=
 =?utf-8?B?STFPdjk1aGlFMGwzNnRCQ2tuaUs1ZXpBWW5sbEpBWS80SFczZ05vbGlIZjhW?=
 =?utf-8?B?UlV6d2pqcHlhRFZhMU8rTjl1enZ4ZjdReVN3RDBxczFoNjlBbHlKQ0doMG9E?=
 =?utf-8?B?b1RmbG1RMlJOaDZrSVFtd3BmNURGak1halQyY0tHbENIRmlVaXdVclNlTVMv?=
 =?utf-8?B?Z2Q3YXVzU1VlV0I0cEZmV2FFRjJJOHJmdXRHTjUwb2F1UWdGL1VEU2VSMGRV?=
 =?utf-8?B?bHNqU2o3eWRqYmY5ZEpmbEp0YzBCeGtpa3Z2dExpblJSaUR1L1FZOGtxRkc1?=
 =?utf-8?B?cU1KcjlYZ0ZDV05TMmRuK1NNY2M1UVJrNUk3blZkeG9rZEs3d2FsUTM0QnhX?=
 =?utf-8?B?L2ptZXk0MlRxcFpZZ0c4UHU2RlpHNVA2YW9tVzQ3YTFNMm1aNjFJZnY4bTNn?=
 =?utf-8?B?N0J6YjZKSTR0NDhhb2JXRzJGT2F2eUU0R3AwblJ5ZXRrYVdhQ1Q5Y3JmMzhJ?=
 =?utf-8?B?UVEwekxta1VZUUtaRFlpcjJYcUlhb2hhdDVKeThqMFQ0MVFSb1dFb3JSeDM0?=
 =?utf-8?B?bXZZVllaRkg0eGVPTG56SWtIcnZZTWZwZHA5bGx3ZjVCRUx5bW5rOUpObWVE?=
 =?utf-8?B?cHNoUzY0TWhlaWtDUTZoVVdMMmlwY3IyNWM3MHlCN0pJSDNhNGtYVmVkZGFR?=
 =?utf-8?B?OGo2ZlM5ZkpwRHpISDNLTkJyOVlEaUs1NkJCNnBOYUQrbWVGNnBUSlozNTZY?=
 =?utf-8?B?TDNnOFRFMmdseXhTdGFzbnFKYW9lT0ZxZmZ2QkJBUFprT0laTTE3eHVqcE1E?=
 =?utf-8?B?cjJpWUM2MXFpV1h3YllYSFAxUE0zaWlDV0twZ3hBKzZtcHpYa3VBdjhKVGd5?=
 =?utf-8?B?VENud1FTaXF1bUhkeEdMZDlQY0JxU1V5d2VHbnNwS2dOdVJOTENqdCt5V1lS?=
 =?utf-8?B?Q0dueklCOUpvWFYzSWhqc0s4MUl3U1QxU2pOdUZDN0c1MDlKcWlvNys2MThO?=
 =?utf-8?B?Mko2SWNGblNlV0RORUxBQzMxVXhKVnhodm9IUG9wazA2bmNQWXlTa0t0NzFS?=
 =?utf-8?B?eks5RnowdnVnSWU5MjdWRlM0ME5tQXRpOVhxRGdSVUV4TDJNM2c4RUZJcDFS?=
 =?utf-8?B?UnA0cmx5VmV5aEN6ZFlJRVpFUXZHenFERk5SUUdESWZUTVRnR1FvRllOcVVS?=
 =?utf-8?B?NGdkWTFrcm1MbnBEY1dtUGZKK0VyVHYwb2xyc3pod3htUHFZamlsNHVST2NW?=
 =?utf-8?B?bTB4MHlHQ3FGV2VQbE45TVhEdVZJYXNMcm92TFhUN2ZELzRsbmtUR3MrbExO?=
 =?utf-8?B?aFpTTEk2VTdEamJ2RnFZdS8wVE1mZTZlS0crMGxsOUkydFo3WUpGV25qQnI4?=
 =?utf-8?B?bG9YWHVIemMxZzZSclUxOGd6TUMzUERnNkhVTyswN0xsNTNhczB5MGgwSXEv?=
 =?utf-8?B?SURsNDNlcEZCZ1BRZGtNU3c0S2IvdE1NOUxPc1dVbG9sNE1nemRGS0Y1dlAw?=
 =?utf-8?Q?xdPs=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(34020700016)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 16:37:55.1473
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed87158a-b74c-47d1-2934-08de52c21a61
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5207

Hi Mathieu,

Sorry for the delay in response here. Somehow all the messages
in this thread ended up in spam. Didn't realize there were new
msgs until I looked up on lore.

On 17/12/25 03:53, Mathieu Poirier wrote:
> Hi Beleswar,
>
> On Tue, Nov 25, 2025 at 02:07:46PM +0530, Beleswar Padhi wrote:
>> From: Richard Genoud <richard.genoud@bootlin.com>
>>
>> Introduce software IPC handshake between the host running Linux and the
>> remote processors to gracefully stop/reset the remote core.
>>
>> Upon a stop request, remoteproc driver sends a RP_MBOX_SHUTDOWN mailbox
>> message to the remotecore.
>> The remote core is expected to:
>> - relinquish all the resources acquired through Device Manager (DM)
>> - disable its interrupts
>> - send back a mailbox acknowledgment RP_MBOX_SHUDOWN_ACK
>> - enter WFI state.
>>
>> Meanwhile, the K3 remoteproc driver does:
>> - wait for the RP_MBOX_SHUTDOWN_ACK from the remote core
>> - wait for the remoteproc to enter WFI state
>> - reset the remote core through device manager
>>
>> Based on work from: Hari Nagalla <hnagalla@ti.com>
>>
>> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
>> [b-padhi@ti.com: Extend support to all rprocs]
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>> ---
>> v2: Changelog:
>> 1. Extend graceful shutdown support for all rprocs (R5, DSP, M4)
>> 2. Halt core only if SHUTDOWN_ACK is received from rproc and it has
>> entered WFI state.
>> 3. Convert return type of is_core_in_wfi() to bool. Works better with
>> readx_poll_timeout() condition.
>> 4. Cast RP_MBOX_SHUTDOWN to uintptr_t to suppress compiler warnings
>> when void* is 64 bit.
>> 5. Wrapped Graceful shutdown code in the form of notify_shutdown_rproc
>> function.
>> 6. Updated commit message to fix minor typos and such.
>>
>> Link to v1:
>> https://lore.kernel.org/all/20240621150058.319524-5-richard.genoud@bootlin.com/
>>
>> Testing done:
>> 1. Tested Boot across all TI K3 EVM/SK boards.
>> 2. Tested IPC on all TI K3 J7* EVM/SK boards (& AM62x SK).
>> 4. Tested R5 rprocs can now be shutdown and powered back on
>> from userspace.
>> 3. Tested that each patch in the series generates no new
>> warnings/errors.
>>
>>  drivers/remoteproc/omap_remoteproc.h      |  9 ++-
>>  drivers/remoteproc/ti_k3_common.c         | 72 +++++++++++++++++++++++
>>  drivers/remoteproc/ti_k3_common.h         |  4 ++
>>  drivers/remoteproc/ti_k3_dsp_remoteproc.c |  2 +
>>  drivers/remoteproc/ti_k3_m4_remoteproc.c  |  2 +
>>  drivers/remoteproc/ti_k3_r5_remoteproc.c  |  5 ++
>>  6 files changed, 93 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/omap_remoteproc.h b/drivers/remoteproc/omap_remoteproc.h
>> index 828e13256c023..c008f11fa2a43 100644
>> --- a/drivers/remoteproc/omap_remoteproc.h
>> +++ b/drivers/remoteproc/omap_remoteproc.h
>> @@ -42,6 +42,11 @@
>>   * @RP_MBOX_SUSPEND_CANCEL: a cancel suspend response from a remote processor
>>   * on a suspend request
>>   *
>> + * @RP_MBOX_SHUTDOWN: shutdown request for the remote processor
>> + *
>> + * @RP_MBOX_SHUTDOWN_ACK: successful response from remote processor for a
>> + * shutdown request. The remote processor should be in WFI state short after.
>> + *
>>   * Introduce new message definitions if any here.
>>   *
>>   * @RP_MBOX_END_MSG: Indicates end of known/defined messages from remote core
>> @@ -59,7 +64,9 @@ enum omap_rp_mbox_messages {
>>  	RP_MBOX_SUSPEND_SYSTEM	= 0xFFFFFF11,
>>  	RP_MBOX_SUSPEND_ACK	= 0xFFFFFF12,
>>  	RP_MBOX_SUSPEND_CANCEL	= 0xFFFFFF13,
>> -	RP_MBOX_END_MSG		= 0xFFFFFF14,
>> +	RP_MBOX_SHUTDOWN	= 0xFFFFFF14,
>> +	RP_MBOX_SHUTDOWN_ACK	= 0xFFFFFF15,
>> +	RP_MBOX_END_MSG		= 0xFFFFFF16,
>>  };
>>  
>>  #endif /* _OMAP_RPMSG_H */
>> diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
>> index 56b71652e449f..5d469f65115c3 100644
>> --- a/drivers/remoteproc/ti_k3_common.c
>> +++ b/drivers/remoteproc/ti_k3_common.c
>> @@ -18,7 +18,9 @@
>>   *	Hari Nagalla <hnagalla@ti.com>
>>   */
>>  
>> +#include <linux/delay.h>
>>  #include <linux/io.h>
>> +#include <linux/iopoll.h>
>>  #include <linux/mailbox_client.h>
>>  #include <linux/module.h>
>>  #include <linux/of_address.h>
>> @@ -69,6 +71,10 @@ void k3_rproc_mbox_callback(struct mbox_client *client, void *data)
>>  	case RP_MBOX_ECHO_REPLY:
>>  		dev_info(dev, "received echo reply from %s\n", rproc->name);
>>  		break;
>> +	case RP_MBOX_SHUTDOWN_ACK:
>> +		dev_dbg(dev, "received shutdown_ack from %s\n", rproc->name);
>> +		complete(&kproc->shutdown_complete);
>> +		break;
>>  	default:
>>  		/* silently handle all other valid messages */
>>  		if (msg >= RP_MBOX_READY && msg < RP_MBOX_END_MSG)
>> @@ -188,6 +194,67 @@ int k3_rproc_request_mbox(struct rproc *rproc)
>>  }
>>  EXPORT_SYMBOL_GPL(k3_rproc_request_mbox);
>>  
>> +/**
>> + * is_core_in_wfi - Utility function to check core status
>> + * @kproc: remote core pointer used for checking core status
>> + *
>> + * This utility function is invoked by the shutdown sequence to ensure
>> + * the remote core is in wfi, before asserting a reset.
>> + */
>> +bool is_core_in_wfi(struct k3_rproc *kproc)
>> +{
>> +	int ret;
>> +	u64 boot_vec;
>> +	u32 cfg, ctrl, stat;
>> +
>> +	ret = ti_sci_proc_get_status(kproc->tsp, &boot_vec, &cfg, &ctrl, &stat);
>> +	if (ret)
>> +		return false;
>> +
>> +	return (bool)(stat & PROC_BOOT_STATUS_FLAG_CPU_WFI);
>> +}
>> +EXPORT_SYMBOL_GPL(is_core_in_wfi);
>> +
>> +/**
>> + * notify_shutdown_rproc - Prepare the remoteproc for a shutdown
>> + * @kproc: remote core pointer used for sending mbox msg
>> + *
>> + * This function sends the shutdown prepare message to remote processor and
>> + * waits for an ACK. Further, it checks if the remote processor has entered
>> + * into WFI mode. It is invoked in shutdown sequence to ensure the rproc
>> + * has relinquished its resources before asserting a reset, so the shutdown
>> + * happens cleanly.
>> + */
>> +int notify_shutdown_rproc(struct k3_rproc *kproc)
>> +{
>> +	bool wfi_status = false;
>> +	int ret;
>> +
>> +	reinit_completion(&kproc->shutdown_complete);
>> +
>> +	ret = mbox_send_message(kproc->mbox, (void *)(uintptr_t)RP_MBOX_SHUTDOWN);
>> +	if (ret < 0) {
>> +		dev_err(kproc->dev, "PM mbox_send_message failed: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = wait_for_completion_timeout(&kproc->shutdown_complete,
>> +					  msecs_to_jiffies(5000));
>> +	if (ret == 0) {
>> +		dev_err(kproc->dev, "%s: timeout waiting for rproc completion event\n",
>> +			__func__);
>> +		return -EBUSY;
>> +	}
>> +
>
> Won't that create an issue on systems with an older FW that doesn't send a
> RP_MBOX_SHUDOWN_ACK message?  Unless I'm missing something, this kind of feature
> needs to be backward compatible.   


I feel it would be unsafe to just abruptly power off a core without some
handshake.. The core could be executing something, there could be
pending bus transactions leading to system hangs etc.. We start the
IPC mechanism with a handshake, so we should end it with a
handshake too.. And for firmwares that don't support this handshake,
IMO its better to reject the shutdown request. What do you think?

For older TI firmwares also, doing rproc_stop() resulted in those
intermittent bugs as mentioned above. So we never really supported
the stop() feature until now.

Thanks,
Beleswar

>
> Thanks,
> Mathieu
>
>> +	ret = readx_poll_timeout(is_core_in_wfi, kproc, wfi_status, wfi_status,
>> +				 200, 2000);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(notify_shutdown_rproc);
>> +
>>  /*
>>   * The K3 DSP and M4 cores have a local reset that affects only the CPU, and a
>>   * generic module reset that powers on the device and allows the internal
>> @@ -288,6 +355,11 @@ EXPORT_SYMBOL_GPL(k3_rproc_start);
>>  int k3_rproc_stop(struct rproc *rproc)
>>  {
>>  	struct k3_rproc *kproc = rproc->priv;
>> +	int ret;
>> +
>> +	ret = notify_shutdown_rproc(kproc);
>> +	if (ret)
>> +		return ret;
>>  
>>  	return k3_rproc_reset(kproc);
>>  }
>> diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
>> index aee3c28dbe510..2a025f4894b82 100644
>> --- a/drivers/remoteproc/ti_k3_common.h
>> +++ b/drivers/remoteproc/ti_k3_common.h
>> @@ -22,6 +22,7 @@
>>  #define REMOTEPROC_TI_K3_COMMON_H
>>  
>>  #define KEYSTONE_RPROC_LOCAL_ADDRESS_MASK	(SZ_16M - 1)
>> +#define PROC_BOOT_STATUS_FLAG_CPU_WFI		0x00000002
>>  
>>  /**
>>   * struct k3_rproc_mem - internal memory structure
>> @@ -92,6 +93,7 @@ struct k3_rproc {
>>  	u32 ti_sci_id;
>>  	struct mbox_chan *mbox;
>>  	struct mbox_client client;
>> +	struct completion shutdown_complete;
>>  	void *priv;
>>  };
>>  
>> @@ -115,4 +117,6 @@ int k3_rproc_of_get_memories(struct platform_device *pdev,
>>  void k3_mem_release(void *data);
>>  int k3_reserved_mem_init(struct k3_rproc *kproc);
>>  void k3_release_tsp(void *data);
>> +bool is_core_in_wfi(struct k3_rproc *kproc);
>> +int notify_shutdown_rproc(struct k3_rproc *kproc);
>>  #endif /* REMOTEPROC_TI_K3_COMMON_H */
>> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
>> index d6ceea6dc920e..156ae09d8ee25 100644
>> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
>> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
>> @@ -133,6 +133,8 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
>>  	if (ret)
>>  		return ret;
>>  
>> +	init_completion(&kproc->shutdown_complete);
>> +
>>  	ret = k3_rproc_of_get_memories(pdev, kproc);
>>  	if (ret)
>>  		return ret;
>> diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
>> index 3a11fd24eb52b..64d99071279b0 100644
>> --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
>> +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
>> @@ -90,6 +90,8 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
>>  	if (ret)
>>  		return ret;
>>  
>> +	init_completion(&kproc->shutdown_complete);
>> +
>>  	ret = k3_rproc_of_get_memories(pdev, kproc);
>>  	if (ret)
>>  		return ret;
>> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> index 04f23295ffc10..8748dc6089cc2 100644
>> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> @@ -533,6 +533,10 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>>  	struct k3_r5_cluster *cluster = core->cluster;
>>  	int ret;
>>  
>> +	ret = notify_shutdown_rproc(kproc);
>> +	if (ret)
>> +		return ret;
>> +
>>  	/* halt all applicable cores */
>>  	if (cluster->mode == CLUSTER_MODE_LOCKSTEP) {
>>  		list_for_each_entry(core, &cluster->cores, elem) {
>> @@ -1129,6 +1133,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>>  			goto out;
>>  		}
>>  
>> +		init_completion(&kproc->shutdown_complete);
>>  init_rmem:
>>  		k3_r5_adjust_tcm_sizes(kproc);
>>  
>> -- 
>> 2.34.1
>>
