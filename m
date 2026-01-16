Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010071.outbound.protection.outlook.com [52.101.85.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CDB2F5485;
	Fri, 16 Jan 2026 05:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768542109; cv=fail; b=m5JZ4ubJRj3z+P9qhq5P7yt5BZjdS5uhvKFZ/BmfnOzzHjDBiC030CILnHFFOoZ/6ZZQ/U2EbYdg9Vt8v9GDzV+OE7zQKqiVuBXAaZvjttdJCont9uq9e0//TTiL3lpKF10MVspWTluNJsJVB9dlALnH6qEMNxbZensL0kuhgUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768542109; c=relaxed/simple;
	bh=+OBeBPw9Y/o7Pi1AGvXki4oEvw4727fouBGHVnWRGYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=h7cQseDcbT6S7r+zmg2rbyCHpwzB+m3XeNOkT7sU0bOsxPN5cw1ooxrpdjuhEKvOtf4UUXi5WPcz70xM4ThMu/Q39KMbqFXcebv8XoSkZQsD2tyL66YgEHxdFyYq2B7aolsTk2r+4p/7tDh9naj10vRuMky1IgkMLG1vL8+W0jQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cDRejD/D; arc=fail smtp.client-ip=52.101.85.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cDRejD/D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RBvUszIP3+bnpigN9HR8Y8/J6GVKRL1Gdv1UzizrPViWUNEkzvaVjOpFLvNS8fkcyCvM/2Rrq38M5YhvKYe0w6SyXHsPTQuizeKTtOzBkqdFe58PiWoFQ1nC7RtHoEe+aKxH0WZS4RdJYbHdV+A3+OlEeJ7MR7Af4jQudIXVQ4Mni6JJiNR25UFlyLltHjbtZtYHVWIxKf2t6aTDZ0qMuLlRj7pAgF/8ZXTU9GWuN3BCKStkrOKH1bpYatqxqR0GH48qGrn5AfKycfG7pBilF/0HmfTs+cl5UY41MdIRraoNWg/gnGcqs9UcbEXoIb3jCjCr+NCxd2nqiM6hkR72zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bIBmEi5XyvkFqGKXm0mzQBGTy2ej0+lJM+W3yTO/0us=;
 b=lQ5xcYBYo0dCTV0n7jEec58OK5/HmhxeIKH58ToaZCNMvu+tqt+5qbfunf2F+kNawSZrY571GCg2xctZN20bfztZxSzRfn7N7T4L//r2iJshwnlfGRGPipE4mR8BCc4Go2BikdBhndurwOeU4EiqXDQnJPtosMmbQcAh2Xdk/YN+qPqEPeQX90E91HUZZHomDbVgcsDj9fy8nlNnsPR4sKHoAkoTu4HwHKCUNcZ2SwYs3UWPQdTl1ZAgqO+aufwnxagNoH1vZq1YMTtgQcr4F47muCiJ9RlCjPn+kP2v0BpGhF01JjlrA56t6e12hxLvss5oMk2LCizab28g8/X1Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bIBmEi5XyvkFqGKXm0mzQBGTy2ej0+lJM+W3yTO/0us=;
 b=cDRejD/D3Hp6pbPsJk8vKIbryZnoik6dWqdDdL2G5jX39pUiDwkZONyC69R3lzslHxeRvwcoS0Ktn88h1v/WMVjPo71V/Kn8781qV2NEuwUMwUSHBA37X1dyx30ukVcgTV8tYg0Y7Pk9FKBQPqbAG36wZ3DX4lrHp/fUFlP+6vU=
Received: from BY3PR10CA0005.namprd10.prod.outlook.com (2603:10b6:a03:255::10)
 by CH0PR10MB4876.namprd10.prod.outlook.com (2603:10b6:610:c9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Fri, 16 Jan
 2026 05:41:45 +0000
Received: from SJ1PEPF00002313.namprd03.prod.outlook.com
 (2603:10b6:a03:255:cafe::7f) by BY3PR10CA0005.outlook.office365.com
 (2603:10b6:a03:255::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Fri,
 16 Jan 2026 05:41:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00002313.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 05:41:44 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 23:41:42 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 23:41:42 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 15 Jan 2026 23:41:42 -0600
Received: from [172.24.234.212] (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60G5fcY82762505;
	Thu, 15 Jan 2026 23:41:39 -0600
Message-ID: <95b442ae-90f4-411a-aa7c-25f52c972469@ti.com>
Date: Fri, 16 Jan 2026 11:11:38 +0530
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
 <096432b0-ce65-42df-b821-4cee40a6ff62@ti.com>
 <CANLsYkyctYQd36MekWw-Sw_v-3KNZw0Z6=s_ezy67dX13CAPyg@mail.gmail.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <CANLsYkyctYQd36MekWw-Sw_v-3KNZw0Z6=s_ezy67dX13CAPyg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002313:EE_|CH0PR10MB4876:EE_
X-MS-Office365-Filtering-Correlation-Id: 75413e2b-dc81-44c1-c716-08de54c1eede
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|34020700016|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cktNRk96VUszQ3ZPZ0JjUTVKTHJWemlzZGR5MXY2M2FHMmhqcjVRL0RPNjJI?=
 =?utf-8?B?OC9KRE1OWnBKUWdBRjhWYytLNHJFNEVVZG1zVjAvQnJvcnQwVHVKbnJpK21z?=
 =?utf-8?B?aWJad1MwQVpFbklhSncxRmVlZmRlQy9QZWduK0V3Q1FKWk1pSjdFZTVCRjkx?=
 =?utf-8?B?YWZEcFJFTmlGTmllbnZ5MUZaN1QvRVVOdTBZSERlZDZlbC9WTmhqcDRiRHN4?=
 =?utf-8?B?Z0RlSEpXRTlnVElOSXFUaWlsVXh2RWltcSs1ckF3OE9kL2YxZUZEeTZsUE95?=
 =?utf-8?B?ODFkcW9HYVk0TEdDc0ZvWkR1Nk9MTWpQRkQ2T1pCYWVHL0t2K1R4cVo0N1Yx?=
 =?utf-8?B?M29JV3dJMW04OThJOENlNnRxOGpUelFQNVZGVE9tRnhEbFJWY2M3Wk1GYVNF?=
 =?utf-8?B?VFBiV0o3OVhuV0N5cTZDMmlYVWtiUWZwWVZYY2lvbGFURjZ5cHJLais1cmJx?=
 =?utf-8?B?UnkrMExCMFhrdk5DTktrR2EzckgzSlpYU3k5Nm5LZzB6MEN6MjRLWmQzNk1X?=
 =?utf-8?B?RHVYZ2dFU0IwdjllN25rOXB0SS9GM2pveDBjbHhUZEx0M3ExTWJ0MHgwSFVs?=
 =?utf-8?B?UlNnMzdPU21UZmxXaDZkcnl2K050QmZGWFFEZjI3d2JYOGJMUjhOekRhb1Ny?=
 =?utf-8?B?aTAwaEltaUkwbFUxMmNXVm5sa1VyT04xL0twcU0zZ0R2QkwvRHgvc01jNm5M?=
 =?utf-8?B?RFV3UlEwTjlLbmdCS2UxbHVyV1lDa2kwcDJQUFo0Y0hkTG14amtzcGY3a0Z3?=
 =?utf-8?B?U3NZMnRnT2lqQ2VqNDRZUE5tWmRYZFBXVTdQZFY4VUNkcjh4K1NybHR4eFhz?=
 =?utf-8?B?NEg1UjVKczJ4dVJXam5lNEhoMTdTcG9VS1drdlNwcEJXTWw3UEFlVTdzSHAy?=
 =?utf-8?B?ZTB1bjlHeUZwVTNEV1FaWVNHMTVrMlVwYmpob3g0Z003dVlNK2xGQ3NDT3pq?=
 =?utf-8?B?c09MQ0x0QmNrWlg3NVhUY29yRlZuQWgvZ2FzVWJ3bXdLc1NybU1uZDJQU0pv?=
 =?utf-8?B?Vld5L1NLWFdCd0ZrSWFhVnV2ZThIN2ZtaWxSdnBjZ292WWtCSFVCT3hzekc1?=
 =?utf-8?B?VXBwdkhGL21TYVpHZmY4dytPaVhvNVZmeDUxSUowVHRqTFQwSWI1aHdlL2Q3?=
 =?utf-8?B?NjVJMDltdU0rR2ZBQXhoSXlKVjNzYi9xV0lIcDQ5dEFTVlNPT3hOODYwalFV?=
 =?utf-8?B?dllMMHkvM1Z4OWMwNDJXanhjUExJUHh2YzRieEt4d2R1aWRsOVU5UFJRU0l5?=
 =?utf-8?B?dnltUGVWY2tvNnJGZThSVytUbjdyNzc4SzFDUWd4ekV3bGFROE43c3JYZngy?=
 =?utf-8?B?Z3lhSS9Mbi9pUURvakpOMDdIblZCZWZRcXNidy9vUHo1MkJIYnpaWUlBdDVV?=
 =?utf-8?B?bk1PUUQ5UXVWMm03dnhYTmRsU3dRQUtkMEkwazltdjJBeHgyRXZFTEJDNDQx?=
 =?utf-8?B?L0J1cDhLaEhma21DR1BLRmdqZ1U4YkttSWV6Qlo2aU5OQ3JNMjc3Y1U5T1dj?=
 =?utf-8?B?dlRqNkd2RDVnN0NsdXFST0FRQnBtWmpXNW9OanMvYmtjSHlpblNuSHVmRjZH?=
 =?utf-8?B?OHFqSEZXcGhqNzliNG0xYlNMY0p5OXVhL3M4dlNwWTFyNlRzWW5WYXhRdnND?=
 =?utf-8?B?czlkZGwyNzg2ZmV3aWFjaFptYmR4a3JMb3pUS21HaUFrT1FZbnc4SFhZb1Y3?=
 =?utf-8?B?NmVFc1h4NWZlQkd4TWh2UUNQNzAvNUYyZUdhRXJ2TE9IZ2tQTDVZbVlWRUNM?=
 =?utf-8?B?UXBMWE5DNGEyNHJzdHpTR2RVZzFWRUFMaTZ2bHlYMElwZXZyTVdhdHhYVjNN?=
 =?utf-8?B?Ykhlekc0amFSbGJ5SDR6c3dHSm93dllSNFppckx4cUFmb05SeURPSitqRUxi?=
 =?utf-8?B?aHg2K3BXR3dMOWF0Z2tyUlJnRWVRNDF5NmtZRThmVldxZFQvV1h0c1lZSE5P?=
 =?utf-8?B?YnJZZEFjSDRueWMyMmJkaTlwMlRzSXRvc2pJeVNzSEQ5RFJqayswOThQdFpl?=
 =?utf-8?B?QVBFMm1CV3ZBb1liQzZTMUU5d0E5VlpMMEZ5NER1cmZlaitTVGJDbEJUVWV0?=
 =?utf-8?B?dEhGTEdDNTFSbXFob1JlZjAzUzhLdHJvQmJhQUZPZlBpZ084VTRXaTZwa29P?=
 =?utf-8?B?a05WWVNnQjV1MFAwNTN0ZW84ZHc4U1dGb3VxUWkyU1NsL2Z6aGx0RzN1dnZ5?=
 =?utf-8?B?QWdmeGcveDlQWGEzRnptdEloVkxpRjNmQjVxZ2hERDdyS2ZoaTZ3Q2lEdmFH?=
 =?utf-8?B?UXkvc1QzQUZwUk5Wa01vbnZKa3ZnPT0=?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(34020700016)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 05:41:44.4824
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75413e2b-dc81-44c1-c716-08de54c1eede
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002313.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4876


On 14/01/26 22:06, Mathieu Poirier wrote:
> On Tue, 13 Jan 2026 at 09:37, Beleswar Prasad Padhi <b-padhi@ti.com> wrote:
>> Hi Mathieu,
>>
>> Sorry for the delay in response here. Somehow all the messages
>> in this thread ended up in spam. Didn't realize there were new
>> msgs until I looked up on lore.
>>
> I've been getting weird automated email replies from TI.
>
>> On 17/12/25 03:53, Mathieu Poirier wrote:
>>> Hi Beleswar,
>>>
>>> On Tue, Nov 25, 2025 at 02:07:46PM +0530, Beleswar Padhi wrote:
>>>> From: Richard Genoud <richard.genoud@bootlin.com>
>>>>
>>>> Introduce software IPC handshake between the host running Linux and the
>>>> remote processors to gracefully stop/reset the remote core.
>>>>
>>>> Upon a stop request, remoteproc driver sends a RP_MBOX_SHUTDOWN mailbox
>>>> message to the remotecore.
>>>> The remote core is expected to:
>>>> - relinquish all the resources acquired through Device Manager (DM)
>>>> - disable its interrupts
>>>> - send back a mailbox acknowledgment RP_MBOX_SHUDOWN_ACK
>>>> - enter WFI state.
>>>>
>>>> Meanwhile, the K3 remoteproc driver does:
>>>> - wait for the RP_MBOX_SHUTDOWN_ACK from the remote core
>>>> - wait for the remoteproc to enter WFI state
>>>> - reset the remote core through device manager
>>>>
>>>> Based on work from: Hari Nagalla <hnagalla@ti.com>
>>>>
>>>> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
>>>> [b-padhi@ti.com: Extend support to all rprocs]
>>>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>>>> ---
>>>> v2: Changelog:
>>>> 1. Extend graceful shutdown support for all rprocs (R5, DSP, M4)
>>>> 2. Halt core only if SHUTDOWN_ACK is received from rproc and it has
>>>> entered WFI state.
>>>> 3. Convert return type of is_core_in_wfi() to bool. Works better with
>>>> readx_poll_timeout() condition.
>>>> 4. Cast RP_MBOX_SHUTDOWN to uintptr_t to suppress compiler warnings
>>>> when void* is 64 bit.
>>>> 5. Wrapped Graceful shutdown code in the form of notify_shutdown_rproc
>>>> function.
>>>> 6. Updated commit message to fix minor typos and such.
>>>>
>>>> Link to v1:
>>>> https://lore.kernel.org/all/20240621150058.319524-5-richard.genoud@bootlin.com/
>>>>
>>>> Testing done:
>>>> 1. Tested Boot across all TI K3 EVM/SK boards.
>>>> 2. Tested IPC on all TI K3 J7* EVM/SK boards (& AM62x SK).
>>>> 4. Tested R5 rprocs can now be shutdown and powered back on
>>>> from userspace.
>>>> 3. Tested that each patch in the series generates no new
>>>> warnings/errors.
>>>>
>>>>  drivers/remoteproc/omap_remoteproc.h      |  9 ++-
>>>>  drivers/remoteproc/ti_k3_common.c         | 72 +++++++++++++++++++++++
>>>>  drivers/remoteproc/ti_k3_common.h         |  4 ++
>>>>  drivers/remoteproc/ti_k3_dsp_remoteproc.c |  2 +
>>>>  drivers/remoteproc/ti_k3_m4_remoteproc.c  |  2 +
>>>>  drivers/remoteproc/ti_k3_r5_remoteproc.c  |  5 ++
>>>>  6 files changed, 93 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/remoteproc/omap_remoteproc.h b/drivers/remoteproc/omap_remoteproc.h
>>>> index 828e13256c023..c008f11fa2a43 100644
>>>> --- a/drivers/remoteproc/omap_remoteproc.h
>>>> +++ b/drivers/remoteproc/omap_remoteproc.h
>>>> @@ -42,6 +42,11 @@
>>>>   * @RP_MBOX_SUSPEND_CANCEL: a cancel suspend response from a remote processor
>>>>   * on a suspend request
>>>>   *
>>>> + * @RP_MBOX_SHUTDOWN: shutdown request for the remote processor
>>>> + *
>>>> + * @RP_MBOX_SHUTDOWN_ACK: successful response from remote processor for a
>>>> + * shutdown request. The remote processor should be in WFI state short after.
>>>> + *
>>>>   * Introduce new message definitions if any here.
>>>>   *
>>>>   * @RP_MBOX_END_MSG: Indicates end of known/defined messages from remote core
>>>> @@ -59,7 +64,9 @@ enum omap_rp_mbox_messages {
>>>>      RP_MBOX_SUSPEND_SYSTEM  = 0xFFFFFF11,
>>>>      RP_MBOX_SUSPEND_ACK     = 0xFFFFFF12,
>>>>      RP_MBOX_SUSPEND_CANCEL  = 0xFFFFFF13,
>>>> -    RP_MBOX_END_MSG         = 0xFFFFFF14,
>>>> +    RP_MBOX_SHUTDOWN        = 0xFFFFFF14,
>>>> +    RP_MBOX_SHUTDOWN_ACK    = 0xFFFFFF15,
>>>> +    RP_MBOX_END_MSG         = 0xFFFFFF16,
>>>>  };
>>>>
>>>>  #endif /* _OMAP_RPMSG_H */
>>>> diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
>>>> index 56b71652e449f..5d469f65115c3 100644
>>>> --- a/drivers/remoteproc/ti_k3_common.c
>>>> +++ b/drivers/remoteproc/ti_k3_common.c
>>>> @@ -18,7 +18,9 @@
>>>>   *  Hari Nagalla <hnagalla@ti.com>
>>>>   */
>>>>
>>>> +#include <linux/delay.h>
>>>>  #include <linux/io.h>
>>>> +#include <linux/iopoll.h>
>>>>  #include <linux/mailbox_client.h>
>>>>  #include <linux/module.h>
>>>>  #include <linux/of_address.h>
>>>> @@ -69,6 +71,10 @@ void k3_rproc_mbox_callback(struct mbox_client *client, void *data)
>>>>      case RP_MBOX_ECHO_REPLY:
>>>>              dev_info(dev, "received echo reply from %s\n", rproc->name);
>>>>              break;
>>>> +    case RP_MBOX_SHUTDOWN_ACK:
>>>> +            dev_dbg(dev, "received shutdown_ack from %s\n", rproc->name);
>>>> +            complete(&kproc->shutdown_complete);
>>>> +            break;
>>>>      default:
>>>>              /* silently handle all other valid messages */
>>>>              if (msg >= RP_MBOX_READY && msg < RP_MBOX_END_MSG)
>>>> @@ -188,6 +194,67 @@ int k3_rproc_request_mbox(struct rproc *rproc)
>>>>  }
>>>>  EXPORT_SYMBOL_GPL(k3_rproc_request_mbox);
>>>>
>>>> +/**
>>>> + * is_core_in_wfi - Utility function to check core status
>>>> + * @kproc: remote core pointer used for checking core status
>>>> + *
>>>> + * This utility function is invoked by the shutdown sequence to ensure
>>>> + * the remote core is in wfi, before asserting a reset.
>>>> + */
>>>> +bool is_core_in_wfi(struct k3_rproc *kproc)
>>>> +{
>>>> +    int ret;
>>>> +    u64 boot_vec;
>>>> +    u32 cfg, ctrl, stat;
>>>> +
>>>> +    ret = ti_sci_proc_get_status(kproc->tsp, &boot_vec, &cfg, &ctrl, &stat);
>>>> +    if (ret)
>>>> +            return false;
>>>> +
>>>> +    return (bool)(stat & PROC_BOOT_STATUS_FLAG_CPU_WFI);
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(is_core_in_wfi);
>>>> +
>>>> +/**
>>>> + * notify_shutdown_rproc - Prepare the remoteproc for a shutdown
>>>> + * @kproc: remote core pointer used for sending mbox msg
>>>> + *
>>>> + * This function sends the shutdown prepare message to remote processor and
>>>> + * waits for an ACK. Further, it checks if the remote processor has entered
>>>> + * into WFI mode. It is invoked in shutdown sequence to ensure the rproc
>>>> + * has relinquished its resources before asserting a reset, so the shutdown
>>>> + * happens cleanly.
>>>> + */
>>>> +int notify_shutdown_rproc(struct k3_rproc *kproc)
>>>> +{
>>>> +    bool wfi_status = false;
>>>> +    int ret;
>>>> +
>>>> +    reinit_completion(&kproc->shutdown_complete);
>>>> +
>>>> +    ret = mbox_send_message(kproc->mbox, (void *)(uintptr_t)RP_MBOX_SHUTDOWN);
>>>> +    if (ret < 0) {
>>>> +            dev_err(kproc->dev, "PM mbox_send_message failed: %d\n", ret);
>>>> +            return ret;
>>>> +    }
>>>> +
>>>> +    ret = wait_for_completion_timeout(&kproc->shutdown_complete,
>>>> +                                      msecs_to_jiffies(5000));
>>>> +    if (ret == 0) {
>>>> +            dev_err(kproc->dev, "%s: timeout waiting for rproc completion event\n",
>>>> +                    __func__);
>>>> +            return -EBUSY;
>>>> +    }
>>>> +
>>> Won't that create an issue on systems with an older FW that doesn't send a
>>> RP_MBOX_SHUDOWN_ACK message?  Unless I'm missing something, this kind of feature
>>> needs to be backward compatible.
>>
>> I feel it would be unsafe to just abruptly power off a core without some
>> handshake.. The core could be executing something, there could be
>> pending bus transactions leading to system hangs etc.. We start the
>> IPC mechanism with a handshake, so we should end it with a
>> handshake too.. And for firmwares that don't support this handshake,
>> IMO its better to reject the shutdown request. What do you think?
>>
> We can't affect the behavior of systems where old FW is coupled with a
> new kernel.  If people want to address the bugs you referred to, they
> can update their FW as they see fit.  As such things need to be
> backward compatible.  NXP has recently implemented a handshake
> mechanism such as this, but to assert the readiness of a booting
> remote processor. They used the vendor specific resource table to
> store a flag that enables the handshake - I suggest using the same
> heuristic to implement this feature.


Fair... I have let the internal firmware teams know about this
requirement. Once we have a compatible firmware, I will
refresh v3 of this patch on Linux side.

Thanks,
Beleswar

>
>> For older TI firmwares also, doing rproc_stop() resulted in those
>> intermittent bugs as mentioned above. So we never really supported
>> the stop() feature until now.
>>
>> Thanks,
>> Beleswar
>>
>>> Thanks,
>>> Mathieu
>>>
>>>> +    ret = readx_poll_timeout(is_core_in_wfi, kproc, wfi_status, wfi_status,
>>>> +                             200, 2000);
>>>> +    if (ret)
>>>> +            return ret;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(notify_shutdown_rproc);
>>>> +
>>>>  /*
>>>>   * The K3 DSP and M4 cores have a local reset that affects only the CPU, and a
>>>>   * generic module reset that powers on the device and allows the internal
>>>> @@ -288,6 +355,11 @@ EXPORT_SYMBOL_GPL(k3_rproc_start);
>>>>  int k3_rproc_stop(struct rproc *rproc)
>>>>  {
>>>>      struct k3_rproc *kproc = rproc->priv;
>>>> +    int ret;
>>>> +
>>>> +    ret = notify_shutdown_rproc(kproc);
>>>> +    if (ret)
>>>> +            return ret;
>>>>
>>>>      return k3_rproc_reset(kproc);
>>>>  }
>>>> diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
>>>> index aee3c28dbe510..2a025f4894b82 100644
>>>> --- a/drivers/remoteproc/ti_k3_common.h
>>>> +++ b/drivers/remoteproc/ti_k3_common.h
>>>> @@ -22,6 +22,7 @@
>>>>  #define REMOTEPROC_TI_K3_COMMON_H
>>>>
>>>>  #define KEYSTONE_RPROC_LOCAL_ADDRESS_MASK   (SZ_16M - 1)
>>>> +#define PROC_BOOT_STATUS_FLAG_CPU_WFI               0x00000002
>>>>
>>>>  /**
>>>>   * struct k3_rproc_mem - internal memory structure
>>>> @@ -92,6 +93,7 @@ struct k3_rproc {
>>>>      u32 ti_sci_id;
>>>>      struct mbox_chan *mbox;
>>>>      struct mbox_client client;
>>>> +    struct completion shutdown_complete;
>>>>      void *priv;
>>>>  };
>>>>
>>>> @@ -115,4 +117,6 @@ int k3_rproc_of_get_memories(struct platform_device *pdev,
>>>>  void k3_mem_release(void *data);
>>>>  int k3_reserved_mem_init(struct k3_rproc *kproc);
>>>>  void k3_release_tsp(void *data);
>>>> +bool is_core_in_wfi(struct k3_rproc *kproc);
>>>> +int notify_shutdown_rproc(struct k3_rproc *kproc);
>>>>  #endif /* REMOTEPROC_TI_K3_COMMON_H */
>>>> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
>>>> index d6ceea6dc920e..156ae09d8ee25 100644
>>>> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
>>>> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
>>>> @@ -133,6 +133,8 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
>>>>      if (ret)
>>>>              return ret;
>>>>
>>>> +    init_completion(&kproc->shutdown_complete);
>>>> +
>>>>      ret = k3_rproc_of_get_memories(pdev, kproc);
>>>>      if (ret)
>>>>              return ret;
>>>> diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
>>>> index 3a11fd24eb52b..64d99071279b0 100644
>>>> --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
>>>> +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
>>>> @@ -90,6 +90,8 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
>>>>      if (ret)
>>>>              return ret;
>>>>
>>>> +    init_completion(&kproc->shutdown_complete);
>>>> +
>>>>      ret = k3_rproc_of_get_memories(pdev, kproc);
>>>>      if (ret)
>>>>              return ret;
>>>> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>>>> index 04f23295ffc10..8748dc6089cc2 100644
>>>> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
>>>> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>>>> @@ -533,6 +533,10 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>>>>      struct k3_r5_cluster *cluster = core->cluster;
>>>>      int ret;
>>>>
>>>> +    ret = notify_shutdown_rproc(kproc);
>>>> +    if (ret)
>>>> +            return ret;
>>>> +
>>>>      /* halt all applicable cores */
>>>>      if (cluster->mode == CLUSTER_MODE_LOCKSTEP) {
>>>>              list_for_each_entry(core, &cluster->cores, elem) {
>>>> @@ -1129,6 +1133,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>>>>                      goto out;
>>>>              }
>>>>
>>>> +            init_completion(&kproc->shutdown_complete);
>>>>  init_rmem:
>>>>              k3_r5_adjust_tcm_sizes(kproc);
>>>>
>>>> --
>>>> 2.34.1
>>>>
