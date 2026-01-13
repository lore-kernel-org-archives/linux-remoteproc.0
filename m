Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazhn15012017.outbound.protection.outlook.com [52.102.137.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8D034DCFD;
	Tue, 13 Jan 2026 16:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.137.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323163; cv=fail; b=m2QAq6ioqcCmxfaGPV0MTOKHW6ahC8QUOUQZZn7dKzDPHWJMYHCUn7gCHxcZstgrbT0vbx5e/iJ7cVuvLVrT6hgxWW8Dify2yJixpffmq510U24Q40zxTokA47WENdwnz5H92cKveGcby6iL7JDJ5AdZeZGOUCRwAwZuHUow7hQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323163; c=relaxed/simple;
	bh=w0kPxX+Lokp3LoE6xiYD+l5yt3/xPS59uI75jXPx0Yo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=C8Vw48joiYex00/aX1TPDl60buFGFY4hAOv4F/MzundcFra67xnhzde5+AaBSjKn52ZpFX2I1GHMDXQno2ZY3CbEOaZBQfrGFgYAA+vsAkR8ZGKCTK4s1TWpVHaNwMO1CYmo1pcYWYBaoggsZJZ7XQDaCkaaz5xU/ArJwfEm1F0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xOCTWlMH; arc=fail smtp.client-ip=52.102.137.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xOCTWlMH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y0zeHnCaOCJVkHj0hGuClGXDkS4UTbmILLNyCd2c9faRi+8KXKo92SgPeB6NPKCQTu5fyf4qWc8lFXsGB0WyLWI0oVfEPucAwjWNTTH96mf5jd84z4Zfl2eJ4FwTdZPo6sQ1Z09y0QJLgJr8bIw7x8O9oDdgzS9EzpA8/dyLtoj+wx+L6F6CdokEhuKlLH/Hq4Yt+l8u3CY7exhwFUDL8FF0L4DDsFNCq7vSJS2I9+ZLG6yqKOVL0eu2LAGMUXBx97daEr82XWMFckAAtYCNPik+D06lGAxX2ZQziB0/mvlDyIMwdeR+Wun6j9/wWq+bi5OqnxFj7ohT6yc4hWFzbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XsDuRk+E/BiOs3E53oVpsQipzdzJ/DeVnzInmwTpQ1s=;
 b=fFejRyIuMcfMveVkN8hMkSnMpaBSJ2gwMOPkaGPGDfzorXQ7JG3CdN66WD3mIaYe9QgC9rFGt4K26+KI8+UtO/i/F4wzuJ4QQSJyrHi3Twm96MGVWn8MSXJe8sXLcxkMGzWs5MWxcOBlNcjB9zXq66xQOzsX5qO51Kf0LRJVjvkCplxom57Zk9Cp8cIL69QEruZw/iMheu7JS1UNANR+IWOArIOddqPfiEXgptiS8bI+9OY+EDTRx9Tu8wjCDAlpC2itxp4kU4kcjxGjdlHNZH3zB+K0FRJC9sMRDbP/fHTV2u+eHv/Q3AIlTWzICGnlIiNoplXOoXZRzL0ljTb55g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsDuRk+E/BiOs3E53oVpsQipzdzJ/DeVnzInmwTpQ1s=;
 b=xOCTWlMHWPZo8S4532Iqmgl48p8iXKgYekxYcQocA+FBigmJgAC5CfeD36YuFDLvW0kgan/fhxvT3yYGKoXZi7FO7PqFvn9CPo6ZUImvBZoqdjyx1OkWsi4eJ4hjKy2fPCPp0EWPT1WM5w453ajbN+C0bXs3GPc4qrSuJGNxe0E=
Received: from SA1P222CA0077.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2c1::24)
 by CH3PR10MB7210.namprd10.prod.outlook.com (2603:10b6:610:129::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 16:52:31 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:806:2c1:cafe::c5) by SA1P222CA0077.outlook.office365.com
 (2603:10b6:806:2c1::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Tue,
 13 Jan 2026 16:52:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 16:52:28 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 10:52:28 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 10:52:28 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 13 Jan 2026 10:52:28 -0600
Received: from [172.24.234.212] (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60DGqNG82584200;
	Tue, 13 Jan 2026 10:52:24 -0600
Message-ID: <57e72076-7c76-460c-98d9-36bbd8f8b5e0@ti.com>
Date: Tue, 13 Jan 2026 22:22:23 +0530
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
CC: Patrick Oppenlander <patrick.oppenlander@gmail.com>,
	<andersson@kernel.org>, <richard.genoud@bootlin.com>, <afd@ti.com>,
	<hnagalla@ti.com>, <jm@ti.com>, <u-kumar1@ti.com>, <jan.kiszka@siemens.com>,
	<christophe.jaillet@wanadoo.fr>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20251125083746.2605721-1-b-padhi@ti.com>
 <CAEg67G=VWsupb53B=a5cyF2RbN58Bqfy8OJ+vpK3_dzCQnvd+Q@mail.gmail.com>
 <e917f964-85d9-4c33-a79a-d7f7474a6afb@ti.com> <aWEydI7ES2yKjpcG@p14s>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <aWEydI7ES2yKjpcG@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|CH3PR10MB7210:EE_
X-MS-Office365-Filtering-Correlation-Id: 474ccb16-8e07-41c5-7bc8-08de52c422f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|34020700016|36860700013|376014|12100799066;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RjhYRmFoSCtlME5XbVhTMDJOTm03UDBZc2diTlQ4WFRtaC9JQXhlZ2FWRXNS?=
 =?utf-8?B?WVpFdDVIWXo1RVNLNUp6QkZVTmdyV01vbU9HcG5XTzNpZ1hYazdlMGJBV0Fl?=
 =?utf-8?B?TzIxdEVBbnYrcDBPbVVmamJOUXN4L1dSRXFFVWZCMmFkRkd1Q3NtVmdzdTUz?=
 =?utf-8?B?R2ljZFU3Y3dQQzYvcWdiSmZkRjg3UC9NaWxoQlB4bFZzeE9nV0xZZ2ZCUmh2?=
 =?utf-8?B?T1Z4V1R6Y2NMWURPdXdDK29WdDVuNkQyRTgrMnZCcFkwQWFoWjIwOE5RaVFP?=
 =?utf-8?B?WUhLYjBZOG8rTHJjeVdwQUR0bXVDbjFKbFFPSHR4MkdOYUViY3U5S24rZjRC?=
 =?utf-8?B?d2ZQLzJYd3R2dno2SVZZWUJ0QysxSnVleUo1dGQyOXZRMHFrQkk3UWxNSi9P?=
 =?utf-8?B?cGlhS3dieVphNzhvOStqdFlFZnRZL1NjVVg0RG40bXBVQkFjQ2lpaVZqU08w?=
 =?utf-8?B?R2laSUpqODQ0NzNsYUlzQitRbk1UTDRERVFzTlpNYXoxcUtxMTRjSEQ5NEhS?=
 =?utf-8?B?cjJjVWRZaUpyTmJPMTMzSjlGSW9BeElxR2tHdVhpeXQ0OFZGRGtpa1d5VndI?=
 =?utf-8?B?d0RuZU1PQ2VkV2ZFbmczL0xuNnRPNFBPa256YnhvTkxvU1pxTld4dHFtMXE5?=
 =?utf-8?B?Qkh6ZFFjTVB4UWVHUms1K0ZFbjFUOTgrWGNJbWMzSmhyeW44VjZJTmFRcEFa?=
 =?utf-8?B?aVBFejhBRDd0TWZCUnhGTmJGeVVLdzREbU8zamRCMHU1SUNydnQvYWc3bzVT?=
 =?utf-8?B?MkMvaWlxSDUrSFJORE4wVXBGaGNKTUFNMVMxRzFULzRsTXF1MnZtVGs1bEU1?=
 =?utf-8?B?cDNiSlhNNGdTa2VVM1A3dFZQeUdjbkNjY3pqZS9mNUtVdDJVMnRYZ0F3cU8y?=
 =?utf-8?B?cFd5S2NPM25KemxKUWRxR3NOaWpuN1BGOU1VUkEvQnZRTngxL3FqcE00VnlT?=
 =?utf-8?B?OUZBNFFWQ2pNWEFYcXQ5dlBWNnJtOE9JNXQ1bTVUREFTQU5hUkxRYkNaZUNv?=
 =?utf-8?B?OFpvaUZsS1BjYk12SHVqYkhwc3dNN2ZNUzFYZHdtUit1cmlTUHBERHU4MmhT?=
 =?utf-8?B?UHY3UEUzSkg1WWlLQkZLTCtRbDJzKzZtKzBaaHB1RkZoenZTVW5YWFREZ3hp?=
 =?utf-8?B?TE5KOTlFODNvWEFLYk9id3NTUlNVM3RYVlBHOVRKOWJOZ3FHL2FLVTJIanJ3?=
 =?utf-8?B?TVRlOHRYbnlWOWVuR2R1S0x6L2V6ejRwUG5URkdnTlpGUWNpMHFaNTFlY3Zh?=
 =?utf-8?B?czBxM2g1cXlOS3NBbnJld3dGRWtXZkx5b2l3WUFlaUJSSjBkU3pxbzMrVURu?=
 =?utf-8?B?Q3RIamsxdXFTQ1VHYSs4R2dMNkp5dm0vVlpRZndFMSswVW5ZcE1YU3p6Y3Z5?=
 =?utf-8?B?KzdxRG42QjcwbEFCUWY1c1diRkg3YjU3Y05sVElyejdJSnRsOVdxSUJZaUo5?=
 =?utf-8?B?cHM2M2pnQ1JNU1VEcndlTGRQbWJRQWw5cnhEMWowTkZ5RmwxRUNubDhsbm11?=
 =?utf-8?B?aUJBVVRKbG1IY3BCZURiQm9mM3NsMDIrVEs5U0FsYUdheWVXV2Y4Z2pkTkF3?=
 =?utf-8?B?b1FIRUpkWDNrNzF5bXBHY2tFV1hpeC9TUHI4dTBMbjl3QTRibHJjblRONnpF?=
 =?utf-8?B?ZEkzSms2Z3JLdnNzWmNXR0M0VDVIL0tSZjlwTTlYektkYTlDM3c1UG1acXRM?=
 =?utf-8?B?L0VlYmhOdHBUWWM2WGZlODhmMjZLNzMwRExXTndZMTFtRHR3ang2ZjVjZldJ?=
 =?utf-8?B?U2VSbnlFL21OOTZIdEtGUVhjQzgxWUlEU0pub0F0U0dOUjcyTWlqb0xsWDZB?=
 =?utf-8?B?OGl6YktGenM5VnFYODhyOUlVM2NRYUFrc24vcFJSc055REpJZy9vRDZRU2Q0?=
 =?utf-8?B?aU44a1pYWVFOWjVaU085RFhPd2hubHBTSWZxcm02SllBK2VjQk54NW1zOFpk?=
 =?utf-8?B?THNsbjFTd2RlSkhhTllOQ3NIZ3hBZlMzaTZheGVvUjhUVGRyTnErRWN0YjFF?=
 =?utf-8?B?ZUFsalo5QjZRM2hLbmsvS2FsRUdNYThRU2xkcmZWNkRaZVMwT01TYlVnemo0?=
 =?utf-8?B?cHA4aTJpUG41dW5ZYkhpdW85MlVFOXNySE9LbXhjaTk4L1F4djlzYUtqSVBy?=
 =?utf-8?Q?+H9c=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(34020700016)(36860700013)(376014)(12100799066);DIR:OUT;SFP:1501;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 16:52:28.6208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 474ccb16-8e07-41c5-7bc8-08de52c422f7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7210


On 09/01/26 22:23, Mathieu Poirier wrote:
> On Thu, Nov 27, 2025 at 04:03:40PM +0530, Beleswar Prasad Padhi wrote:
>> Hi Patrick, Mathieu,
>>
>> On 27/11/25 02:11, Patrick Oppenlander wrote:
>>> On Tue, 25 Nov 2025 at 19:39, Beleswar Padhi <b-padhi@ti.com> wrote:
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
>>> What happens if the remote core is unable to action the shutdown
>>> request 
>>
>> We abort the shutdown sequence if the remoteproc does not respond with
>> an ACK within the timeout assuming rproc is busy doing some work.
>>
>>> (maybe it has crashed).
>>
>> remoteproc core has the infra to handle rproc crash. It initiates a
>> recovery mechanism by stopping and starting the rproc with the same
>> firmware.
>>
>> Are you suggesting that we check if rproc_stop() is invoked from a
>> recovery context, and forcefully reset the rproc without sending/waiting
>> for SHUTDOWN msg as a crashed core can't respond to mbox irqs?
> I think that is a fair ask.


Would need to pass on the `bool crashed` parameter to the
stop() rproc_ops from rproc_stop(). Will address in v3...

>
>>> Is there a way to cleanup resources which the remote core allocated
>>> without rebooting the whole system?
>> For SW resources (like mem, vdev): Yes
>> However, I feel this is currently missing in rproc core. We should be
>> making a call to rproc_resource_cleanup() in rproc_boot_recovery()'s
>> error paths and in rproc_crash_handler_work() in case of subsequent
>> crashes.
>>
>> ^^ Mathieu, thoughts about the above?
> So far a crash has been treated like a rproc_stop()/rproc_start() operation.
> Doing resource cleanup as part of a crash recovery would akin to a
> rproc_shutdown()/rproc_boot() operation, introducing a lot of churn and backward
> compatibility issues.


Makes sense to me. We're better off.

Thanks,
Beleswar

>
>> For HW resources: No
>> In TI Device Manager (DM) firmware, only the entity which requested a
>> resource can relinquish it, no other host can do that cleanup on behalf
>> of that entity. So, we can't do much here.
>>
>> Thanks,
>> Beleswar
>>
>>> Patrick
>>>
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
>>>>         RP_MBOX_SUSPEND_SYSTEM  = 0xFFFFFF11,
>>>>         RP_MBOX_SUSPEND_ACK     = 0xFFFFFF12,
>>>>         RP_MBOX_SUSPEND_CANCEL  = 0xFFFFFF13,
>>>> -       RP_MBOX_END_MSG         = 0xFFFFFF14,
>>>> +       RP_MBOX_SHUTDOWN        = 0xFFFFFF14,
>>>> +       RP_MBOX_SHUTDOWN_ACK    = 0xFFFFFF15,
>>>> +       RP_MBOX_END_MSG         = 0xFFFFFF16,
>>>>  };
>>>>
>>>>  #endif /* _OMAP_RPMSG_H */
>>>> diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
>>>> index 56b71652e449f..5d469f65115c3 100644
>>>> --- a/drivers/remoteproc/ti_k3_common.c
>>>> +++ b/drivers/remoteproc/ti_k3_common.c
>>>> @@ -18,7 +18,9 @@
>>>>   *     Hari Nagalla <hnagalla@ti.com>
>>>>   */
>>>>
>>>> +#include <linux/delay.h>
>>>>  #include <linux/io.h>
>>>> +#include <linux/iopoll.h>
>>>>  #include <linux/mailbox_client.h>
>>>>  #include <linux/module.h>
>>>>  #include <linux/of_address.h>
>>>> @@ -69,6 +71,10 @@ void k3_rproc_mbox_callback(struct mbox_client *client, void *data)
>>>>         case RP_MBOX_ECHO_REPLY:
>>>>                 dev_info(dev, "received echo reply from %s\n", rproc->name);
>>>>                 break;
>>>> +       case RP_MBOX_SHUTDOWN_ACK:
>>>> +               dev_dbg(dev, "received shutdown_ack from %s\n", rproc->name);
>>>> +               complete(&kproc->shutdown_complete);
>>>> +               break;
>>>>         default:
>>>>                 /* silently handle all other valid messages */
>>>>                 if (msg >= RP_MBOX_READY && msg < RP_MBOX_END_MSG)
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
>>>> +       int ret;
>>>> +       u64 boot_vec;
>>>> +       u32 cfg, ctrl, stat;
>>>> +
>>>> +       ret = ti_sci_proc_get_status(kproc->tsp, &boot_vec, &cfg, &ctrl, &stat);
>>>> +       if (ret)
>>>> +               return false;
>>>> +
>>>> +       return (bool)(stat & PROC_BOOT_STATUS_FLAG_CPU_WFI);
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
>>>> +       bool wfi_status = false;
>>>> +       int ret;
>>>> +
>>>> +       reinit_completion(&kproc->shutdown_complete);
>>>> +
>>>> +       ret = mbox_send_message(kproc->mbox, (void *)(uintptr_t)RP_MBOX_SHUTDOWN);
>>>> +       if (ret < 0) {
>>>> +               dev_err(kproc->dev, "PM mbox_send_message failed: %d\n", ret);
>>>> +               return ret;
>>>> +       }
>>>> +
>>>> +       ret = wait_for_completion_timeout(&kproc->shutdown_complete,
>>>> +                                         msecs_to_jiffies(5000));
>>>> +       if (ret == 0) {
>>>> +               dev_err(kproc->dev, "%s: timeout waiting for rproc completion event\n",
>>>> +                       __func__);
>>>> +               return -EBUSY;
>>>> +       }
>>>> +
>>>> +       ret = readx_poll_timeout(is_core_in_wfi, kproc, wfi_status, wfi_status,
>>>> +                                200, 2000);
>>>> +       if (ret)
>>>> +               return ret;
>>>> +
>>>> +       return 0;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(notify_shutdown_rproc);
>>>> +
>>>>  /*
>>>>   * The K3 DSP and M4 cores have a local reset that affects only the CPU, and a
>>>>   * generic module reset that powers on the device and allows the internal
>>>> @@ -288,6 +355,11 @@ EXPORT_SYMBOL_GPL(k3_rproc_start);
>>>>  int k3_rproc_stop(struct rproc *rproc)
>>>>  {
>>>>         struct k3_rproc *kproc = rproc->priv;
>>>> +       int ret;
>>>> +
>>>> +       ret = notify_shutdown_rproc(kproc);
>>>> +       if (ret)
>>>> +               return ret;
>>>>
>>>>         return k3_rproc_reset(kproc);
>>>>  }
>>>> diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
>>>> index aee3c28dbe510..2a025f4894b82 100644
>>>> --- a/drivers/remoteproc/ti_k3_common.h
>>>> +++ b/drivers/remoteproc/ti_k3_common.h
>>>> @@ -22,6 +22,7 @@
>>>>  #define REMOTEPROC_TI_K3_COMMON_H
>>>>
>>>>  #define KEYSTONE_RPROC_LOCAL_ADDRESS_MASK      (SZ_16M - 1)
>>>> +#define PROC_BOOT_STATUS_FLAG_CPU_WFI          0x00000002
>>>>
>>>>  /**
>>>>   * struct k3_rproc_mem - internal memory structure
>>>> @@ -92,6 +93,7 @@ struct k3_rproc {
>>>>         u32 ti_sci_id;
>>>>         struct mbox_chan *mbox;
>>>>         struct mbox_client client;
>>>> +       struct completion shutdown_complete;
>>>>         void *priv;
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
>>>>         if (ret)
>>>>                 return ret;
>>>>
>>>> +       init_completion(&kproc->shutdown_complete);
>>>> +
>>>>         ret = k3_rproc_of_get_memories(pdev, kproc);
>>>>         if (ret)
>>>>                 return ret;
>>>> diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
>>>> index 3a11fd24eb52b..64d99071279b0 100644
>>>> --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
>>>> +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
>>>> @@ -90,6 +90,8 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
>>>>         if (ret)
>>>>                 return ret;
>>>>
>>>> +       init_completion(&kproc->shutdown_complete);
>>>> +
>>>>         ret = k3_rproc_of_get_memories(pdev, kproc);
>>>>         if (ret)
>>>>                 return ret;
>>>> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>>>> index 04f23295ffc10..8748dc6089cc2 100644
>>>> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
>>>> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>>>> @@ -533,6 +533,10 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>>>>         struct k3_r5_cluster *cluster = core->cluster;
>>>>         int ret;
>>>>
>>>> +       ret = notify_shutdown_rproc(kproc);
>>>> +       if (ret)
>>>> +               return ret;
>>>> +
>>>>         /* halt all applicable cores */
>>>>         if (cluster->mode == CLUSTER_MODE_LOCKSTEP) {
>>>>                 list_for_each_entry(core, &cluster->cores, elem) {
>>>> @@ -1129,6 +1133,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>>>>                         goto out;
>>>>                 }
>>>>
>>>> +               init_completion(&kproc->shutdown_complete);
>>>>  init_rmem:
>>>>                 k3_r5_adjust_tcm_sizes(kproc);
>>>>
>>>> --
>>>> 2.34.1
>>>>
>>>>
