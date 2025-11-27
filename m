Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011014.outbound.protection.outlook.com [40.93.194.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217B8329E74;
	Thu, 27 Nov 2025 10:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764239649; cv=fail; b=T+Q3BFeslXg03v+7dwkxwr9CLE9soLbPMBcZyPDZx+C1/yX8Uhz5P6LyVp+UqWHQuMh7lkY+rdBcSETrYS0s3LMd7tPxEPTi7H1fkpcZ/wrEjaMuhxPKpovVhh11QJR3x389XfhnmlfYD86WimWm08KSyXr6DkOVQTvdrXOPjb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764239649; c=relaxed/simple;
	bh=LBqdlA05AYFcKKIiXoVltf3+uS79FBx9efMvSkkgxn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NMzqOKUb1xRbRx7hWSaAuXIEkdNdo47qaXZ/hwLEyNkvPqI85uuN5mJAaRmrIQAFtLMUtAYNYusctkOyobCyO/ZsF+um3e6otrXLOPVrnsr85xxDEbVOteemYZ5VLQYUYCfA2URZnN3w7IwTVI2dWmc9PUGUFrlFGPgMYdd/HB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=da+SZtVD; arc=fail smtp.client-ip=40.93.194.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="da+SZtVD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hBqsmDo1r+zswQxsalRt3h5teneCBmtSs6KwIBnn1P5NZmkruCuAaSruWZF6Exr0vPyayR25jKp73qhxNRMReAzMq+pl4a8Bg0eOB1LsyUuzBXK69pHRr7R6fXJwOUT/vtMk1dLdduwIRTISK1W3Gi9IcJ5uqTMAU7NM1Hg0DZ31RKe2ZKj+3mibMdnQEmokme4eKqJDqM4PH6paRSxmbp5gpbnoY1uKL0RpBy82BUZe03hjBA7/JS1AJHnh6zdwSH2vgtiMamfCyxgoVp+2q/BclsHIz9b7gtIBK+nl7UUaI4Qnsv7iAfH7kccmy+D5a0k+jq4MLDG3EY4kxYqmPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=owTDiT/xWAnFeLtydSChawk8tJyYLLkiqQQ9HhJDqss=;
 b=L2ET9OHOSnASvNG7cf4e1rdRT9jGR9mKGP6Kw6M1IFNlSt46aMiV76QrS+RakphYccoKQ8f5AA/NwvQSQ6ueYw/CA3VHaH1KdTFYmbnevYh0J+WDJmFa9vxIKD9UATYPtlSm2N5O+lx8xX5zEIc6IFDVHuAjFYI0lZpHQH4Vlv4P5iRmEoFg8L0MyUAOpeqFc9t6DW9VFQzys83TUdybdORcdovxii/H1wY3gRLuGBYe/MQs9qTj2M/VBjBKce8mrZ6BXTWkzwO5fWGc5hpjri1PUiBKZICBJUeWvrEDfnH8MO3A9deB+0COGb+PZMDcazq0svqvjlrYZgXH1ygOZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=owTDiT/xWAnFeLtydSChawk8tJyYLLkiqQQ9HhJDqss=;
 b=da+SZtVDW6zg6ZUuteXhBlhgjfUa/5W61DluBuUm0eEWo7tbtD949Rejvfw7fjDGwhRWvSL7TBjiCAdwkDacGdYgVCDfa5HCQYwf0PYOhf0PTBLBbDRpLJJNm5zCjrGGj9we7eoXErcar4Pg6unEiHQFJpH31VQ3OYKrIEdlh6Q=
Received: from BL1PR13CA0280.namprd13.prod.outlook.com (2603:10b6:208:2bc::15)
 by BN0PR10MB5112.namprd10.prod.outlook.com (2603:10b6:408:12c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.15; Thu, 27 Nov
 2025 10:33:54 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:208:2bc:cafe::d0) by BL1PR13CA0280.outlook.office365.com
 (2603:10b6:208:2bc::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.4 via Frontend Transport; Thu,
 27 Nov 2025 10:33:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Thu, 27 Nov 2025 10:33:53 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 27 Nov
 2025 04:33:45 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 27 Nov
 2025 04:33:45 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 27 Nov 2025 04:33:45 -0600
Received: from [172.24.234.212] (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ARAXflm2810843;
	Thu, 27 Nov 2025 04:33:42 -0600
Message-ID: <e917f964-85d9-4c33-a79a-d7f7474a6afb@ti.com>
Date: Thu, 27 Nov 2025 16:03:40 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] remoteproc: k3: support for graceful shutdown of
 remote cores
To: Patrick Oppenlander <patrick.oppenlander@gmail.com>
CC: <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<richard.genoud@bootlin.com>, <afd@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
	<u-kumar1@ti.com>, <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
	<linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20251125083746.2605721-1-b-padhi@ti.com>
 <CAEg67G=VWsupb53B=a5cyF2RbN58Bqfy8OJ+vpK3_dzCQnvd+Q@mail.gmail.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <CAEg67G=VWsupb53B=a5cyF2RbN58Bqfy8OJ+vpK3_dzCQnvd+Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|BN0PR10MB5112:EE_
X-MS-Office365-Filtering-Correlation-Id: c543d186-02fa-4270-6666-08de2da0766e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qk5YKzZpNkg5aW1WbXZpOFMwTCs4S1kvTmo3Skc3bFFZT1h5ekZzcEMrOXhV?=
 =?utf-8?B?LytaVERLMUxQZHpvcER4SGZVRUpMSGl4WUtiSFdoWURoWldCTWlwVmdmZW90?=
 =?utf-8?B?YkZxUkVhNXlwL0J0VVUvSC81UENPN3JadVd0SGdKbU02MDV0dlNqNm02RWh0?=
 =?utf-8?B?MXJ3TW5SeGJmQ25jLzA2WnRjVHV0Nm9ENnhtaVA3U0hsTStaTlN4b2RCenly?=
 =?utf-8?B?bi8rSXc1a0d5YVptQTNETGsyUG94NWZEWkp0bGpzME9lVWdCUU8yN2hxMjBt?=
 =?utf-8?B?WkRmaWR4Yk1VYzdTRUdhV0UzNFVSTzdFWXdmUjRkZGVhS0ozT3ZMWXJEMFp5?=
 =?utf-8?B?N0dxMVA0WWU1ZnBJaHRzcldyeEVUZWU1L256cFZFeFIzUkIrUjF0cFBVU3hh?=
 =?utf-8?B?dU5waUlxQWZBb2R0SXJQVENDZmpoSGhlaWRzVFlJQ1orRXpOckJEUFBDdUFH?=
 =?utf-8?B?NytTeS9hZ3lnTmY3cUptZ21SeHgxYTVCUC85bjJ0Q3AwOXlUcjlwbjV2dDBp?=
 =?utf-8?B?WWJ2a2k2UFhuNy9vbmxUMnpyZEhoM3dHWFlqbXI3RUlnSW4wYW84OUgrVUNi?=
 =?utf-8?B?cVVuSkRyNUFjdU9KZy9vUUhZM0YxN3pGQzJtVFRqem1MdGc2SmxWNHpxN2FE?=
 =?utf-8?B?blpEVVZJSVMyNmxaVytJQ3oxQzZrY1dtYlU4MllSQmN3V3NYbEFYQUxGaVEv?=
 =?utf-8?B?Q0xPZGVadng5KzNCaDRQZ2JOL1M0dTB2KytFeFpOTGNlMm5ObGxiaHVvNWRW?=
 =?utf-8?B?c05KRHk3eTU2bE1nam85UW1hMHhjK1U4Ykh5WHlYdVQvbXVCTCtDZFhNRjNI?=
 =?utf-8?B?WE1DN0ZxUkVsc21uYXdDcTUzNkVxeHN6cWpjTURzcVp6S2pRUEhaMUNOQVdK?=
 =?utf-8?B?V0xUejRvMzJSUEdHNjJYcGo0OHQza2RQL3FTZXZUcCsrNjlVT0h3ODM0Zjhw?=
 =?utf-8?B?dmVJYy8wMUU3Vmd3ZkpuTCt0R05ZK0J6SU8rL3lCWW9qbmZib3A3RTJ3dHB0?=
 =?utf-8?B?bzBjQjVjT0tBSGt2cDIrUTBKdUxRWG41N1dUWkp1M0xPUjNWdXlWb21PL2ky?=
 =?utf-8?B?cnJ3VXI4bFRTaWd2Njd4NFZnTVVmZ2p6bGd1alVsblFhT044L1JDNGpyY0xE?=
 =?utf-8?B?RUdGSlZoazEwMVpaSjg3QmEwME5jSEJEVEZuRjJpR1lwalA0eTkwREFsSXBS?=
 =?utf-8?B?Nll4ODFsZVIzaWZXTUlpUkx3Rit2c2hkbEhLbi9QejJVYkN1ZnBUU3FBWUJ2?=
 =?utf-8?B?YWJBUlNTZTBOS2RxMGQvK05zSDluRkoyRmdmMVBBRW40RHFqQ3FuOUFvMUUr?=
 =?utf-8?B?WGdGQzFaVnhQNGdPVGJlanplSnBqSjVLYkhaS3NiTHJ6bkc0dlpIMTJGNkZ1?=
 =?utf-8?B?TXBSUG5qMWRuS3NWTVZlRVlhdG9WNEJ2SHJXNjQ3WXBMK2ltejQzUmtoTGEw?=
 =?utf-8?B?TUNSZ0p6Q3dxQ1oyWVJqdHFBQjM5U0pYekRhdjhzNFo1ZEZsdkZabjBJc2hJ?=
 =?utf-8?B?Y1FQY1BXcXhjK0UzNXBOWG02ek5YOXFNTm1sUnFncmNZTHQ1ZGNJcTRsSG16?=
 =?utf-8?B?aUtDUHN0NWNlc1FaelREODY0UUtsZ1JQQ2VmSkt3c3I1QVpGajFQZUFUTmFW?=
 =?utf-8?B?M0IyYzhlSnMyNjZjRG1jcjlOaXA5MFgyTjhyWWFWdWlWT0lJdWYrMlg2NGpH?=
 =?utf-8?B?WTdaRERKNnN4NTY5Zlp0SlRVMzZVSmFOUnY0U29VNlUzY0lSTGo0YzdXeUY0?=
 =?utf-8?B?ODMxajg4OWkwTFhYVDNCeVpoZm9uMk1LTWcvOExyVFU5NlN2ZnNNZnI2aVQ1?=
 =?utf-8?B?czRma2ROeUZlSHFVZzF5Z2dWT285VTNBTVViQjBSeGJPdHB4Uk5vVk9oaFhG?=
 =?utf-8?B?YnU5WnBKTHlFUTVXekZ4QjJRU1YvV2xkelNwS2FNcHpOYW5QZjAxT0ExNTZp?=
 =?utf-8?B?TVZmSjBnemF5M0xIN1FleGpWMEZ1cUJCUThTNW0zZ3YwKzA5b29aSjE2L0Uw?=
 =?utf-8?B?WFBpdXFGeVcxZ1J1VW1FVGV1SXRKQzJ0bGV5T1FxRzNoWG5OeVYzWU55ZDBX?=
 =?utf-8?B?RldvT2xVQWk5akZoL2d3R0hoWU5jaXc4ZXZSNzhsNXpsK3Z6b3ZuakVuMk4r?=
 =?utf-8?Q?ghsc=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 10:33:53.7110
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c543d186-02fa-4270-6666-08de2da0766e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5112

Hi Patrick, Mathieu,

On 27/11/25 02:11, Patrick Oppenlander wrote:
> On Tue, 25 Nov 2025 at 19:39, Beleswar Padhi <b-padhi@ti.com> wrote:
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
> What happens if the remote core is unable to action the shutdown
> request 


We abort the shutdown sequence if the remoteproc does not respond with
an ACK within the timeout assuming rproc is busy doing some work.

> (maybe it has crashed).


remoteproc core has the infra to handle rproc crash. It initiates a
recovery mechanism by stopping and starting the rproc with the same
firmware.

Are you suggesting that we check if rproc_stop() is invoked from a
recovery context, and forcefully reset the rproc without sending/waiting
for SHUTDOWN msg as a crashed core can't respond to mbox irqs?

>
> Is there a way to cleanup resources which the remote core allocated
> without rebooting the whole system?

For SW resources (like mem, vdev): Yes
However, I feel this is currently missing in rproc core. We should be
making a call to rproc_resource_cleanup() in rproc_boot_recovery()'s
error paths and in rproc_crash_handler_work() in case of subsequent
crashes.

^^ Mathieu, thoughts about the above?

For HW resources: No
In TI Device Manager (DM) firmware, only the entity which requested a
resource can relinquish it, no other host can do that cleanup on behalf
of that entity. So, we can't do much here.

Thanks,
Beleswar

>
> Patrick
>
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
>>         RP_MBOX_SUSPEND_SYSTEM  = 0xFFFFFF11,
>>         RP_MBOX_SUSPEND_ACK     = 0xFFFFFF12,
>>         RP_MBOX_SUSPEND_CANCEL  = 0xFFFFFF13,
>> -       RP_MBOX_END_MSG         = 0xFFFFFF14,
>> +       RP_MBOX_SHUTDOWN        = 0xFFFFFF14,
>> +       RP_MBOX_SHUTDOWN_ACK    = 0xFFFFFF15,
>> +       RP_MBOX_END_MSG         = 0xFFFFFF16,
>>  };
>>
>>  #endif /* _OMAP_RPMSG_H */
>> diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
>> index 56b71652e449f..5d469f65115c3 100644
>> --- a/drivers/remoteproc/ti_k3_common.c
>> +++ b/drivers/remoteproc/ti_k3_common.c
>> @@ -18,7 +18,9 @@
>>   *     Hari Nagalla <hnagalla@ti.com>
>>   */
>>
>> +#include <linux/delay.h>
>>  #include <linux/io.h>
>> +#include <linux/iopoll.h>
>>  #include <linux/mailbox_client.h>
>>  #include <linux/module.h>
>>  #include <linux/of_address.h>
>> @@ -69,6 +71,10 @@ void k3_rproc_mbox_callback(struct mbox_client *client, void *data)
>>         case RP_MBOX_ECHO_REPLY:
>>                 dev_info(dev, "received echo reply from %s\n", rproc->name);
>>                 break;
>> +       case RP_MBOX_SHUTDOWN_ACK:
>> +               dev_dbg(dev, "received shutdown_ack from %s\n", rproc->name);
>> +               complete(&kproc->shutdown_complete);
>> +               break;
>>         default:
>>                 /* silently handle all other valid messages */
>>                 if (msg >= RP_MBOX_READY && msg < RP_MBOX_END_MSG)
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
>> +       int ret;
>> +       u64 boot_vec;
>> +       u32 cfg, ctrl, stat;
>> +
>> +       ret = ti_sci_proc_get_status(kproc->tsp, &boot_vec, &cfg, &ctrl, &stat);
>> +       if (ret)
>> +               return false;
>> +
>> +       return (bool)(stat & PROC_BOOT_STATUS_FLAG_CPU_WFI);
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
>> +       bool wfi_status = false;
>> +       int ret;
>> +
>> +       reinit_completion(&kproc->shutdown_complete);
>> +
>> +       ret = mbox_send_message(kproc->mbox, (void *)(uintptr_t)RP_MBOX_SHUTDOWN);
>> +       if (ret < 0) {
>> +               dev_err(kproc->dev, "PM mbox_send_message failed: %d\n", ret);
>> +               return ret;
>> +       }
>> +
>> +       ret = wait_for_completion_timeout(&kproc->shutdown_complete,
>> +                                         msecs_to_jiffies(5000));
>> +       if (ret == 0) {
>> +               dev_err(kproc->dev, "%s: timeout waiting for rproc completion event\n",
>> +                       __func__);
>> +               return -EBUSY;
>> +       }
>> +
>> +       ret = readx_poll_timeout(is_core_in_wfi, kproc, wfi_status, wfi_status,
>> +                                200, 2000);
>> +       if (ret)
>> +               return ret;
>> +
>> +       return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(notify_shutdown_rproc);
>> +
>>  /*
>>   * The K3 DSP and M4 cores have a local reset that affects only the CPU, and a
>>   * generic module reset that powers on the device and allows the internal
>> @@ -288,6 +355,11 @@ EXPORT_SYMBOL_GPL(k3_rproc_start);
>>  int k3_rproc_stop(struct rproc *rproc)
>>  {
>>         struct k3_rproc *kproc = rproc->priv;
>> +       int ret;
>> +
>> +       ret = notify_shutdown_rproc(kproc);
>> +       if (ret)
>> +               return ret;
>>
>>         return k3_rproc_reset(kproc);
>>  }
>> diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
>> index aee3c28dbe510..2a025f4894b82 100644
>> --- a/drivers/remoteproc/ti_k3_common.h
>> +++ b/drivers/remoteproc/ti_k3_common.h
>> @@ -22,6 +22,7 @@
>>  #define REMOTEPROC_TI_K3_COMMON_H
>>
>>  #define KEYSTONE_RPROC_LOCAL_ADDRESS_MASK      (SZ_16M - 1)
>> +#define PROC_BOOT_STATUS_FLAG_CPU_WFI          0x00000002
>>
>>  /**
>>   * struct k3_rproc_mem - internal memory structure
>> @@ -92,6 +93,7 @@ struct k3_rproc {
>>         u32 ti_sci_id;
>>         struct mbox_chan *mbox;
>>         struct mbox_client client;
>> +       struct completion shutdown_complete;
>>         void *priv;
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
>>         if (ret)
>>                 return ret;
>>
>> +       init_completion(&kproc->shutdown_complete);
>> +
>>         ret = k3_rproc_of_get_memories(pdev, kproc);
>>         if (ret)
>>                 return ret;
>> diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
>> index 3a11fd24eb52b..64d99071279b0 100644
>> --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
>> +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
>> @@ -90,6 +90,8 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
>>         if (ret)
>>                 return ret;
>>
>> +       init_completion(&kproc->shutdown_complete);
>> +
>>         ret = k3_rproc_of_get_memories(pdev, kproc);
>>         if (ret)
>>                 return ret;
>> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> index 04f23295ffc10..8748dc6089cc2 100644
>> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> @@ -533,6 +533,10 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>>         struct k3_r5_cluster *cluster = core->cluster;
>>         int ret;
>>
>> +       ret = notify_shutdown_rproc(kproc);
>> +       if (ret)
>> +               return ret;
>> +
>>         /* halt all applicable cores */
>>         if (cluster->mode == CLUSTER_MODE_LOCKSTEP) {
>>                 list_for_each_entry(core, &cluster->cores, elem) {
>> @@ -1129,6 +1133,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>>                         goto out;
>>                 }
>>
>> +               init_completion(&kproc->shutdown_complete);
>>  init_rmem:
>>                 k3_r5_adjust_tcm_sizes(kproc);
>>
>> --
>> 2.34.1
>>
>>
