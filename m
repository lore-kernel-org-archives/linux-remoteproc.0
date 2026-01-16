Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azhn15012023.outbound.protection.outlook.com [52.102.149.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810A3346A13;
	Fri, 16 Jan 2026 05:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.149.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768543112; cv=fail; b=BURdZdA4UiuLa5klNMUFpvcwx8ej1YeInhRqNpHZJgTCizBjkfTbkDTPMN7riSlZK++1H65LR/dzXucSUNccPIMPvSIPxQCVuVlBx5mzYuNKxrKjsTDYzcBw/VfsC8Jlk961yza3rD1GTfMbZIuL9sG2JGaZyYIXhcSd1Dd1HP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768543112; c=relaxed/simple;
	bh=sU22qt64vZjvsxA0btx+av4fOO2oXYHha4yWKW5lbqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FxX1AU9UYDzizj4Fmjqm1hZEXCwphUv2tIdLF6N7hkN3Ou5Ndq3BVZRt67y1oj3kcY48sft3DIkekedpkwrweDJuPX5PThBRHrV9tnHyPq4Ot5IGsAkKFirYZ+Idt73yXxqJOh9HW2MVS0uuH8d4pXONuUZhn7yampG/jvU7vJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=qW4E2auP; arc=fail smtp.client-ip=52.102.149.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qW4E2auP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IuaSyhsh6G9belM/QxyxTqo948VFSMinbvtKa+Pchecc9DQ3qccw3QyJubjNt2oNBlFtv3zzCaDczjXKGFjssJOkR5sU5XyDdHb1NKQ0hxk9AZM4ob7xkDdTDj6pATpE8Yr33lBcitEPWwAf7Ar9FAJHjvGYzOfU9u7zWK1umjdICt9qpvTYANnjNU15D4JZ0YtoLJPhdwavk0t547CaaXlfKCVJPdqZXNJrIEQy88jvR8lDQ9/plW3RfK9Ya86q7WbpMG5yykRqeJwBSx0FjdRNpfgiIEuF3j4nVESqwB5XzXOJHsHswjoC6e5wdtGNpG/5tjIxX2aORxaT1VU9sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q5GQhj+zJ8vmr5TwYti0MFpsZxsJNv/gGqRJXYtbd+8=;
 b=OXA8t40uvrkU3Te4me8W37X0oGYkBjugx4dMVMeXRl1p2gRvHtMl0fxqjzkmCbTuGTeZ2FizVVvYGEmYUUtSwVN27qa49xxxzEwL6kYnEoG0B03ZfX+MBKe9shv9XsWbuCAhAmYDNEjkCPVSFVhpbsxeT5BkNpgBHHriszHU2mUWvyVjFkIxBxRovpb+jIs8euEmmTL68vy4DMMDkWvvNGQ1YCd/GvxR8+3IOV1HWgfuridcXXNEVHlGgZewv9P9GAfRqxoI5gZxPARzXBATAa5fpyhD92pO/3UxJG7vkGb+T7VifEUqlNHWsjkXQybDaE1iPaMFKivyIMNvl+Mhyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5GQhj+zJ8vmr5TwYti0MFpsZxsJNv/gGqRJXYtbd+8=;
 b=qW4E2auPZ00+X73f0PJhRjpU/lV1tMSpXGP17faOJ2Rq/TEcPFt4YL+xy5/xo/EcOy8tgxf3jl3k66tWS//ruVVJ2KP4aFEmwmpzrYpezVIWRueTiR6CyD4oNIVTxfZ1r0mkUmCdAr6F6WfvPtkzKooUSNUqPOIl1T5OExY0r9M=
Received: from BYAPR05CA0005.namprd05.prod.outlook.com (2603:10b6:a03:c0::18)
 by DM4PR10MB6767.namprd10.prod.outlook.com (2603:10b6:8:10d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 05:58:27 +0000
Received: from SJ1PEPF00002325.namprd03.prod.outlook.com
 (2603:10b6:a03:c0:cafe::b3) by BYAPR05CA0005.outlook.office365.com
 (2603:10b6:a03:c0::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.2 via Frontend Transport; Fri,
 16 Jan 2026 05:58:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002325.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 05:58:25 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 23:58:12 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 23:58:12 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 15 Jan 2026 23:58:12 -0600
Received: from [172.24.234.212] (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60G5w7rT2658836;
	Thu, 15 Jan 2026 23:58:08 -0600
Message-ID: <502592db-504c-4337-aa2c-c5ee3fdd3605@ti.com>
Date: Fri, 16 Jan 2026 11:28:07 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] remoteproc: k3: support for graceful shutdown of
 remote cores
To: Patrick Oppenlander <patrick.oppenlander@gmail.com>, Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <andersson@kernel.org>, <richard.genoud@bootlin.com>, <afd@ti.com>,
	<hnagalla@ti.com>, <jm@ti.com>, <u-kumar1@ti.com>, <jan.kiszka@siemens.com>,
	<christophe.jaillet@wanadoo.fr>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20251125083746.2605721-1-b-padhi@ti.com> <aUHb_ax7rn3K_QeW@p14s>
 <096432b0-ce65-42df-b821-4cee40a6ff62@ti.com>
 <CANLsYkyctYQd36MekWw-Sw_v-3KNZw0Z6=s_ezy67dX13CAPyg@mail.gmail.com>
 <CAEg67G=iWg7yh5=aU1cCC2+XreagpvFVpaCV2VC0=GAEPfuKUA@mail.gmail.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <CAEg67G=iWg7yh5=aU1cCC2+XreagpvFVpaCV2VC0=GAEPfuKUA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002325:EE_|DM4PR10MB6767:EE_
X-MS-Office365-Filtering-Correlation-Id: 08c766dc-a0ad-4d62-cd90-08de54c443ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|36860700013|376014|1800799024|82310400026|12100799066;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TzArT0phMU9vTFdmb0RuY21MelZyTS9IQTlCdlU5Z01UMFllT0pxaWlQRnZT?=
 =?utf-8?B?WThRNlJON1czRUpIRHJEMFhQOHp2T1prZk1YSkpCdWY1R2x6QmhhSHpRVXFx?=
 =?utf-8?B?dTZNZGpkZEJad3ZvL3JaU3NpaCtsd08vQnFuZ2h0NyttdGFZNnduOVRra0pn?=
 =?utf-8?B?Rllvbnl3YUh1cURoNjhYTGs5aEF2Y2VZa25INkpLZFRnWUdVTHRhdjQ1WktC?=
 =?utf-8?B?b2RJWnJ3ZWFoZ0QwQzBIMURGbklESTVRM3dJcVdLK3p4REZmWDdHNTYyeGox?=
 =?utf-8?B?TkFkd3htSlpzSXBmb0VRclJvREZXYSt1ZlhiSzBGZExzQ3BxdFJxRllDbFhO?=
 =?utf-8?B?NzUvZVFBTFNwcFgxRjllYTNTRTlHdUl1YzY3aTFQQzA1UDhlU3l4N1hrak43?=
 =?utf-8?B?c3lRZU82UjF2L3dtaS9MSEg5Mk9qOTJkekRnRmQwUENzOXN1VEdOenB5N3Fu?=
 =?utf-8?B?ZEUrdkRHMXoxdk5tWGd2WGdRT1V1YVVBblNtVkpXeEliejRWVXNOVzVXKzFM?=
 =?utf-8?B?cUQ5MWtYNzlkeDBvSXhVeUVnR0xDdk5qRWo5NUNJM0o3L2hRQnNPeEtwcy93?=
 =?utf-8?B?ejZlR1lUNFdyVXUva003OHNDemtXQmI0ZnZRSkZrWW53TTIwUEQxR3lRT1pv?=
 =?utf-8?B?UkpEVHhHMnJRMExNN1lIR3lmMk8rOVVPMFprRXp4R1J6Ujd6dXl6YnZxME9s?=
 =?utf-8?B?NGJ2UzM4UHEzODI2TnR1OERram8rTFM3L242eFhpaHlzSWtRcjhZbHYvQ1Q3?=
 =?utf-8?B?bktPb3NDK1ZDZWh1VFZGUlg0cFVrUXIzOFVxaFBmSS9mODRYa3ZxSVRnb1hI?=
 =?utf-8?B?WTNVNUdQRFh3eXN4dG9XUDB0VlFFdXFpMldUcWh4Q0hQcUlFaTZhUGVHbklE?=
 =?utf-8?B?VFpNTHdkWnRyK09LZ0szeFV6Zi9BZWdzaVdNSmREOW9xbFJoS3ZNamRkeXYx?=
 =?utf-8?B?OWpIREw2d2hFM05vQWFrK1h6Yld5OXdUSHZBdmI1alBkNCtDVG5IZ3RmaFpS?=
 =?utf-8?B?TGVtdmkwekYrL3lKKzRiWHRVeU9vbmcvS3gzTWZGTEs5OVgyQ05Gbmx4TXJM?=
 =?utf-8?B?MFRvSzkyemtKS3hNby9VQkhhbUN5Mmp2c2x2eGpBQTRlSW5PaWZsZ0JROCt4?=
 =?utf-8?B?M0h4dXIrVVV6eXF6Q2VueWlDclRjYWY2dWtJSGFGMDgyai9lZG96VHZVUm9t?=
 =?utf-8?B?VWdHSk45UGQyRVBpbzVCTm9QTW1RNFFoQU9PRFBpY3plM2F1OWJ6cGtKbURH?=
 =?utf-8?B?eTFXQ21VQmpvZm1RQVlTT2NNSDkwK09KQlYwZ2FxVmIxNFJhV0RiQ0RySExo?=
 =?utf-8?B?MVVpaHRrR1NrSmVhaXJSeGFCYThxZU1kdS9pa29WTU5WQTlJQytVYytQaFZa?=
 =?utf-8?B?QUV2T2ZsUytkZVh1aFlMOWk1WGpkUWhsVjIwTHNpSXFTZC9SdERkek5XWlZ5?=
 =?utf-8?B?NWM5NlF5ZnJtS080c3ZCY0hwUUUvcDNHWDJsM1hHR3M5SUo2N3dJNGR4MFRB?=
 =?utf-8?B?a3NNU1hrZXFsZHU3TG9ydGxMRnNXOGhxSlY2UFhMVlZqNEw1RlJjVkRhUVg5?=
 =?utf-8?B?QXd4aWVWbkdLOURhUWVxZFdKb1lwUHJzTEU5TlVHWS9raSttOVQ3SENId0Zl?=
 =?utf-8?B?Q0VPMFpGT2hrbFVCSWpBZVVpY2xFS1ZTdkd6QzdNU2hCZWp5eXRWTVZHb251?=
 =?utf-8?B?NERleThoSGJMTWR4RWFzSUNFb1UwVWZVdVFmRUJTSW9zcDFSc3k3Um5qQy80?=
 =?utf-8?B?NGh3T0NwaFltUHV5T29ncmtPSXBoWUh5RW1kS2JWU2Y2V3R0YWxPWUhVWDdO?=
 =?utf-8?B?ejdoNkR4VGZjZ2NOZ2pnMDYvOFBSL0JlVWg0eVc3S3krcDlSZ0FYajNyU1g5?=
 =?utf-8?B?ajg4YXJOc2ZaM3Q0SXdpYWxpN0t6VDBXY2lsaWx6R2luRWQxMUcrY2h5c3Yw?=
 =?utf-8?B?VVlOU3RWNk9UZ3dObnpma0NqMFUranNaNmVLR0EwRkhpL2cvZ3JzRDFJeTBH?=
 =?utf-8?B?WXkwcUZtOHRiV3ZmNlhzSkZUWGZoanNFOWlNL3lSSkdBUDF5M3MzVC9SMXlV?=
 =?utf-8?B?YXdvdXNYNUs0c3d0S3dWRFY1dnYvOVZBclVKSkNCT2RtWTFZNlBsbGgzZVNE?=
 =?utf-8?B?TW1xWEF1R3p4MDJZTng5U2lFbWJIVmNHeWUxcm1sMUtoVlpBOFZCdWV6d1ZP?=
 =?utf-8?B?Wjhsczc1WStCVm42YmFybTcrWVV6TnNZelhqdjQ4SWFIdnZVRTczYXlYNlJh?=
 =?utf-8?B?MENNRmFpSmZ0UHNrWUo1THZkSGl3PT0=?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34020700016)(36860700013)(376014)(1800799024)(82310400026)(12100799066);DIR:OUT;SFP:1501;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 05:58:25.7581
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08c766dc-a0ad-4d62-cd90-08de54c443ac
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002325.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6767


On 15/01/26 03:57, Patrick Oppenlander wrote:
> On Thu, 15 Jan 2026 at 03:36, Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
>> On Tue, 13 Jan 2026 at 09:37, Beleswar Prasad Padhi <b-padhi@ti.com> wrote:
>>> Hi Mathieu,
>>>
>>> Sorry for the delay in response here. Somehow all the messages
>>> in this thread ended up in spam. Didn't realize there were new
>>> msgs until I looked up on lore.
>>>
>> I've been getting weird automated email replies from TI.
>>
>>> On 17/12/25 03:53, Mathieu Poirier wrote:
>>>> Hi Beleswar,
>>>>
>>>> On Tue, Nov 25, 2025 at 02:07:46PM +0530, Beleswar Padhi wrote:
>>>>> From: Richard Genoud <richard.genoud@bootlin.com>
>>>>>
>>>>> Introduce software IPC handshake between the host running Linux and the
>>>>> remote processors to gracefully stop/reset the remote core.
>>>>>
>>>>> Upon a stop request, remoteproc driver sends a RP_MBOX_SHUTDOWN mailbox
>>>>> message to the remotecore.
>>>>> The remote core is expected to:
>>>>> - relinquish all the resources acquired through Device Manager (DM)
>>>>> - disable its interrupts
>>>>> - send back a mailbox acknowledgment RP_MBOX_SHUDOWN_ACK
>>>>> - enter WFI state.
>>>>>
>>>>> Meanwhile, the K3 remoteproc driver does:
>>>>> - wait for the RP_MBOX_SHUTDOWN_ACK from the remote core
>>>>> - wait for the remoteproc to enter WFI state
>>>>> - reset the remote core through device manager
>>>>>
>>>>> Based on work from: Hari Nagalla <hnagalla@ti.com>
>>>>>
>>>>> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
>>>>> [b-padhi@ti.com: Extend support to all rprocs]
>>>>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>>>>> ---
>>>>> v2: Changelog:
>>>>> 1. Extend graceful shutdown support for all rprocs (R5, DSP, M4)
>>>>> 2. Halt core only if SHUTDOWN_ACK is received from rproc and it has
>>>>> entered WFI state.
>>>>> 3. Convert return type of is_core_in_wfi() to bool. Works better with
>>>>> readx_poll_timeout() condition.
>>>>> 4. Cast RP_MBOX_SHUTDOWN to uintptr_t to suppress compiler warnings
>>>>> when void* is 64 bit.
>>>>> 5. Wrapped Graceful shutdown code in the form of notify_shutdown_rproc
>>>>> function.
>>>>> 6. Updated commit message to fix minor typos and such.
>>>>>
>>>>> Link to v1:
>>>>> https://lore.kernel.org/all/20240621150058.319524-5-richard.genoud@bootlin.com/
>>>>>
>>>>> Testing done:
>>>>> 1. Tested Boot across all TI K3 EVM/SK boards.
>>>>> 2. Tested IPC on all TI K3 J7* EVM/SK boards (& AM62x SK).
>>>>> 4. Tested R5 rprocs can now be shutdown and powered back on
>>>>> from userspace.
>>>>> 3. Tested that each patch in the series generates no new
>>>>> warnings/errors.
>>>>>
>>>>>  drivers/remoteproc/omap_remoteproc.h      |  9 ++-
>>>>>  drivers/remoteproc/ti_k3_common.c         | 72 +++++++++++++++++++++++
>>>>>  drivers/remoteproc/ti_k3_common.h         |  4 ++
>>>>>  drivers/remoteproc/ti_k3_dsp_remoteproc.c |  2 +
>>>>>  drivers/remoteproc/ti_k3_m4_remoteproc.c  |  2 +
>>>>>  drivers/remoteproc/ti_k3_r5_remoteproc.c  |  5 ++
>>>>>  6 files changed, 93 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/remoteproc/omap_remoteproc.h b/drivers/remoteproc/omap_remoteproc.h
>>>>> index 828e13256c023..c008f11fa2a43 100644
>>>>> --- a/drivers/remoteproc/omap_remoteproc.h
>>>>> +++ b/drivers/remoteproc/omap_remoteproc.h
>>>>> @@ -42,6 +42,11 @@
>>>>>   * @RP_MBOX_SUSPEND_CANCEL: a cancel suspend response from a remote processor
>>>>>   * on a suspend request
>>>>>   *
>>>>> + * @RP_MBOX_SHUTDOWN: shutdown request for the remote processor
>>>>> + *
>>>>> + * @RP_MBOX_SHUTDOWN_ACK: successful response from remote processor for a
>>>>> + * shutdown request. The remote processor should be in WFI state short after.
>>>>> + *
>>>>>   * Introduce new message definitions if any here.
>>>>>   *
>>>>>   * @RP_MBOX_END_MSG: Indicates end of known/defined messages from remote core
>>>>> @@ -59,7 +64,9 @@ enum omap_rp_mbox_messages {
>>>>>      RP_MBOX_SUSPEND_SYSTEM  = 0xFFFFFF11,
>>>>>      RP_MBOX_SUSPEND_ACK     = 0xFFFFFF12,
>>>>>      RP_MBOX_SUSPEND_CANCEL  = 0xFFFFFF13,
>>>>> -    RP_MBOX_END_MSG         = 0xFFFFFF14,
>>>>> +    RP_MBOX_SHUTDOWN        = 0xFFFFFF14,
>>>>> +    RP_MBOX_SHUTDOWN_ACK    = 0xFFFFFF15,
>>>>> +    RP_MBOX_END_MSG         = 0xFFFFFF16,
>>>>>  };
>>>>>
>>>>>  #endif /* _OMAP_RPMSG_H */
>>>>> diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
>>>>> index 56b71652e449f..5d469f65115c3 100644
>>>>> --- a/drivers/remoteproc/ti_k3_common.c
>>>>> +++ b/drivers/remoteproc/ti_k3_common.c
>>>>> @@ -18,7 +18,9 @@
>>>>>   *  Hari Nagalla <hnagalla@ti.com>
>>>>>   */
>>>>>
>>>>> +#include <linux/delay.h>
>>>>>  #include <linux/io.h>
>>>>> +#include <linux/iopoll.h>
>>>>>  #include <linux/mailbox_client.h>
>>>>>  #include <linux/module.h>
>>>>>  #include <linux/of_address.h>
>>>>> @@ -69,6 +71,10 @@ void k3_rproc_mbox_callback(struct mbox_client *client, void *data)
>>>>>      case RP_MBOX_ECHO_REPLY:
>>>>>              dev_info(dev, "received echo reply from %s\n", rproc->name);
>>>>>              break;
>>>>> +    case RP_MBOX_SHUTDOWN_ACK:
>>>>> +            dev_dbg(dev, "received shutdown_ack from %s\n", rproc->name);
>>>>> +            complete(&kproc->shutdown_complete);
>>>>> +            break;
>>>>>      default:
>>>>>              /* silently handle all other valid messages */
>>>>>              if (msg >= RP_MBOX_READY && msg < RP_MBOX_END_MSG)
>>>>> @@ -188,6 +194,67 @@ int k3_rproc_request_mbox(struct rproc *rproc)
>>>>>  }
>>>>>  EXPORT_SYMBOL_GPL(k3_rproc_request_mbox);
>>>>>
>>>>> +/**
>>>>> + * is_core_in_wfi - Utility function to check core status
>>>>> + * @kproc: remote core pointer used for checking core status
>>>>> + *
>>>>> + * This utility function is invoked by the shutdown sequence to ensure
>>>>> + * the remote core is in wfi, before asserting a reset.
>>>>> + */
>>>>> +bool is_core_in_wfi(struct k3_rproc *kproc)
>>>>> +{
>>>>> +    int ret;
>>>>> +    u64 boot_vec;
>>>>> +    u32 cfg, ctrl, stat;
>>>>> +
>>>>> +    ret = ti_sci_proc_get_status(kproc->tsp, &boot_vec, &cfg, &ctrl, &stat);
>>>>> +    if (ret)
>>>>> +            return false;
>>>>> +
>>>>> +    return (bool)(stat & PROC_BOOT_STATUS_FLAG_CPU_WFI);
>>>>> +}
>>>>> +EXPORT_SYMBOL_GPL(is_core_in_wfi);
>>>>> +
>>>>> +/**
>>>>> + * notify_shutdown_rproc - Prepare the remoteproc for a shutdown
>>>>> + * @kproc: remote core pointer used for sending mbox msg
>>>>> + *
>>>>> + * This function sends the shutdown prepare message to remote processor and
>>>>> + * waits for an ACK. Further, it checks if the remote processor has entered
>>>>> + * into WFI mode. It is invoked in shutdown sequence to ensure the rproc
>>>>> + * has relinquished its resources before asserting a reset, so the shutdown
>>>>> + * happens cleanly.
>>>>> + */
>>>>> +int notify_shutdown_rproc(struct k3_rproc *kproc)
>>>>> +{
>>>>> +    bool wfi_status = false;
>>>>> +    int ret;
>>>>> +
>>>>> +    reinit_completion(&kproc->shutdown_complete);
>>>>> +
>>>>> +    ret = mbox_send_message(kproc->mbox, (void *)(uintptr_t)RP_MBOX_SHUTDOWN);
>>>>> +    if (ret < 0) {
>>>>> +            dev_err(kproc->dev, "PM mbox_send_message failed: %d\n", ret);
>>>>> +            return ret;
>>>>> +    }
>>>>> +
>>>>> +    ret = wait_for_completion_timeout(&kproc->shutdown_complete,
>>>>> +                                      msecs_to_jiffies(5000));
>>>>> +    if (ret == 0) {
>>>>> +            dev_err(kproc->dev, "%s: timeout waiting for rproc completion event\n",
>>>>> +                    __func__);
>>>>> +            return -EBUSY;
>>>>> +    }
>>>>> +
>>>> Won't that create an issue on systems with an older FW that doesn't send a
>>>> RP_MBOX_SHUDOWN_ACK message?  Unless I'm missing something, this kind of feature
>>>> needs to be backward compatible.
>>>
>>> I feel it would be unsafe to just abruptly power off a core without some
>>> handshake.. The core could be executing something, there could be
>>> pending bus transactions leading to system hangs etc.. We start the
>>> IPC mechanism with a handshake, so we should end it with a
>>> handshake too.. And for firmwares that don't support this handshake,
>>> IMO its better to reject the shutdown request. What do you think?
>>>
>> We can't affect the behavior of systems where old FW is coupled with a
>> new kernel.  If people want to address the bugs you referred to, they
>> can update their FW as they see fit.  As such things need to be
>> backward compatible.  NXP has recently implemented a handshake
>> mechanism such as this, but to assert the readiness of a booting
>> remote processor. They used the vendor specific resource table to
>> store a flag that enables the handshake - I suggest using the same
>> heuristic to implement this feature.
> A flag in a resource table enabling the new behaviour could work, but
> we would probably need another way to do the new thing, maybe with a
> devicetree flag. 


That's hacky. Device tree is for hardware description only. We
should not be putting SW required quirks in DT. It should be
rightly placed in the vendor specific resource table.

> Why? Because people are running TI's kernel, which
> has had this feature since Feb 2025, and may want to migrate to a
> mainline kernel. Those firmwares already use the handshake.


Why should Upstream Linux care about the mess-ups in the
vendor specific kernel? It should be the other way around,
the feature should have been a part of the upstream kernel
first, otherwise such a rework is expected.

>
> If we want to be nice to existing users, we should provide a way to be
> compatible with existing firmwares which don't support
> RP_MBOX_SHUTDOWN, and with existing firmwares which do.


Existing users of *TI Kernel*, not *Upstream Kernel*. This is
a miss from TI side not to have worked the feature
upstream first, and for the same reason upstream need not
care about maintaining backward compat with vendor
specific features.

Thanks,
Beleswar

>
> That said, restarting remote processors on k3 was quite broken without
> the shutdown handshake, often leading to hangs/crashes requiring a
> full system reboot to recover. This is why I previously asked about
> recovery if the remoteproc crashes or is unable to handle the shutdown
> request.
>
> I suspect that most real world users who are actually restarting
> remoteprocs on k3 are already using the handshake with TI's kernel.
>
> IMHO it's probably fine to just send RP_MBOX_SHUTDOWN to firmwares
> which don't support it, and handle old firmwares via the same recovery
> path as new firmwares which have crashed. This would mean that
> upgrading a system with an old firmware to a new kernel will have an
> additional delay when shutting down a remoteproc, but realistically,
> this shutdown path was broken anyway.
>
> Patrick
>
>>> For older TI firmwares also, doing rproc_stop() resulted in those
>>> intermittent bugs as mentioned above. So we never really supported
>>> the stop() feature until now.
>>>
>>> Thanks,
>>> Beleswar
>>>
>>>> Thanks,
>>>> Mathieu
>>>>
>>>>> +    ret = readx_poll_timeout(is_core_in_wfi, kproc, wfi_status, wfi_status,
>>>>> +                             200, 2000);
>>>>> +    if (ret)
>>>>> +            return ret;
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +EXPORT_SYMBOL_GPL(notify_shutdown_rproc);
>>>>> +
>>>>>  /*
>>>>>   * The K3 DSP and M4 cores have a local reset that affects only the CPU, and a
>>>>>   * generic module reset that powers on the device and allows the internal
>>>>> @@ -288,6 +355,11 @@ EXPORT_SYMBOL_GPL(k3_rproc_start);
>>>>>  int k3_rproc_stop(struct rproc *rproc)
>>>>>  {
>>>>>      struct k3_rproc *kproc = rproc->priv;
>>>>> +    int ret;
>>>>> +
>>>>> +    ret = notify_shutdown_rproc(kproc);
>>>>> +    if (ret)
>>>>> +            return ret;
>>>>>
>>>>>      return k3_rproc_reset(kproc);
>>>>>  }
>>>>> diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
>>>>> index aee3c28dbe510..2a025f4894b82 100644
>>>>> --- a/drivers/remoteproc/ti_k3_common.h
>>>>> +++ b/drivers/remoteproc/ti_k3_common.h
>>>>> @@ -22,6 +22,7 @@
>>>>>  #define REMOTEPROC_TI_K3_COMMON_H
>>>>>
>>>>>  #define KEYSTONE_RPROC_LOCAL_ADDRESS_MASK   (SZ_16M - 1)
>>>>> +#define PROC_BOOT_STATUS_FLAG_CPU_WFI               0x00000002
>>>>>
>>>>>  /**
>>>>>   * struct k3_rproc_mem - internal memory structure
>>>>> @@ -92,6 +93,7 @@ struct k3_rproc {
>>>>>      u32 ti_sci_id;
>>>>>      struct mbox_chan *mbox;
>>>>>      struct mbox_client client;
>>>>> +    struct completion shutdown_complete;
>>>>>      void *priv;
>>>>>  };
>>>>>
>>>>> @@ -115,4 +117,6 @@ int k3_rproc_of_get_memories(struct platform_device *pdev,
>>>>>  void k3_mem_release(void *data);
>>>>>  int k3_reserved_mem_init(struct k3_rproc *kproc);
>>>>>  void k3_release_tsp(void *data);
>>>>> +bool is_core_in_wfi(struct k3_rproc *kproc);
>>>>> +int notify_shutdown_rproc(struct k3_rproc *kproc);
>>>>>  #endif /* REMOTEPROC_TI_K3_COMMON_H */
>>>>> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
>>>>> index d6ceea6dc920e..156ae09d8ee25 100644
>>>>> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
>>>>> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
>>>>> @@ -133,6 +133,8 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
>>>>>      if (ret)
>>>>>              return ret;
>>>>>
>>>>> +    init_completion(&kproc->shutdown_complete);
>>>>> +
>>>>>      ret = k3_rproc_of_get_memories(pdev, kproc);
>>>>>      if (ret)
>>>>>              return ret;
>>>>> diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
>>>>> index 3a11fd24eb52b..64d99071279b0 100644
>>>>> --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
>>>>> +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
>>>>> @@ -90,6 +90,8 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
>>>>>      if (ret)
>>>>>              return ret;
>>>>>
>>>>> +    init_completion(&kproc->shutdown_complete);
>>>>> +
>>>>>      ret = k3_rproc_of_get_memories(pdev, kproc);
>>>>>      if (ret)
>>>>>              return ret;
>>>>> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>>>>> index 04f23295ffc10..8748dc6089cc2 100644
>>>>> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
>>>>> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>>>>> @@ -533,6 +533,10 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>>>>>      struct k3_r5_cluster *cluster = core->cluster;
>>>>>      int ret;
>>>>>
>>>>> +    ret = notify_shutdown_rproc(kproc);
>>>>> +    if (ret)
>>>>> +            return ret;
>>>>> +
>>>>>      /* halt all applicable cores */
>>>>>      if (cluster->mode == CLUSTER_MODE_LOCKSTEP) {
>>>>>              list_for_each_entry(core, &cluster->cores, elem) {
>>>>> @@ -1129,6 +1133,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>>>>>                      goto out;
>>>>>              }
>>>>>
>>>>> +            init_completion(&kproc->shutdown_complete);
>>>>>  init_rmem:
>>>>>              k3_r5_adjust_tcm_sizes(kproc);
>>>>>
>>>>> --
>>>>> 2.34.1
>>>>>
