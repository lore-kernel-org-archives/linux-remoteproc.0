Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010017.outbound.protection.outlook.com [52.101.193.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFED1A275;
	Mon, 19 Jan 2026 04:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768798333; cv=fail; b=jBpFMOn0DeIH6FZpPqbVv9JZjSiduo6dSdyAiPabFV1a2idCNjkd5uWG1AyOjeGhcHscOy3v/jAqjC6tz+vY8oPajfFF5fOxtDAROp2BjvWvDjtCAimcFTxIZwBBkT89YW0fUkFPdntdFusnTSbvpOdMwWdKvbHi+EIhhFcT+Ls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768798333; c=relaxed/simple;
	bh=zw7icW/M2192yFfxzNNSCJub/z1a5QiwR+vn67NWX9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GtctwaI+TYNljD+tkqg4MxBXH36/nSvLQqRjNfI68yWA2XEglPNHHGfUMz0EOM7ewxm/Y3DBvAu2fKGu6PJy3zAZpsk3t85nvH95WnbUOZkZgpaAvQItSH8LanLMzEMEV+JYhtLphHWeXJFLs8TtqKJF8D6wWIs5T6kt70uaLco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=RipToPXV; arc=fail smtp.client-ip=52.101.193.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="RipToPXV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=COYDqidnnbdqvKtZ/4WtJ3+JGSRk8M/Kdk1WyGoCu5lV4NpnNk//pPFKk/NnTqsMAS73KRibxlcE7KAUuKq7AOT5NU59RQ5RmN+AyxrK/O91na3enxe+qESEFg4b2jtvMRpVLDX64TvH96JcvG/VOuVYQUkOCZ4kC3evhpY1GPITZ7f4BgqLVzEbtlR0aVkXxTL9qvg5PZN76zFBEV1cHZarSmLMilE8T8O6recDajQD5fA94CPl42GPAXXP6+MwrDLyrjc2HGN1tiR41sO9AU/f7gKkMLfDpOMlUxsZUeLKfk9oFrAWdAMlaH7C3naIsOPKsWC6MtP66sGmTOijhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A5K33LO2pIY6ic5zpvSmzSY8iqXQZV85GBjowEUWlgo=;
 b=BYYbo+L1ps9VDwjcWxBhuIDVJf2psyAl7MzEirm6tcAuLi2XAlpjIbYJwxQZJDcCH98rInhgAD9EflCik/RaSBrrQzySaNOH7rqaSieHntYysYZQM660Si1uTj6pg3K37bMRR2ZRBMjwEh2UDVDQ0UwX6OHR9+kgGMQKEXT6sXnda7ENxwoqvYgH03eipFUidzjY/MjxGtNM1VjvYil+qjWHI8lozHNBrWhpnKfL5RMYCPagE7mBaU6V/mg7XiV9kL7IGYq7sS6PRvbibnFdOb/e1tlG5Ry78wIsbF3MV5QlVNbXSYDehES83yByzdoF/X4h+9+/9dSw+gF5ykOHNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5K33LO2pIY6ic5zpvSmzSY8iqXQZV85GBjowEUWlgo=;
 b=RipToPXVJk7M2Iflr1wtPbqF9xuoyWl8HqVPBJ0DYKFplGprQpVvjYHQSloC82ABdxKAnhiyZMn2lW6VR//60gcCBJ+LENulxrKWBQ7XjyqH7dA1xmDoahWUxDz1sXobi9i2X2vwObp2QVQxT/wLOFIlSmcs+kScQWW/Fpjd2/o=
Received: from SJ0PR03CA0123.namprd03.prod.outlook.com (2603:10b6:a03:33c::8)
 by IA0PR10MB7302.namprd10.prod.outlook.com (2603:10b6:208:407::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 04:52:08 +0000
Received: from SJ1PEPF00002321.namprd03.prod.outlook.com
 (2603:10b6:a03:33c:cafe::65) by SJ0PR03CA0123.outlook.office365.com
 (2603:10b6:a03:33c::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.11 via Frontend Transport; Mon,
 19 Jan 2026 04:52:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00002321.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Mon, 19 Jan 2026 04:52:06 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 18 Jan
 2026 22:52:05 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 18 Jan
 2026 22:52:04 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 18 Jan 2026 22:52:04 -0600
Received: from [172.24.234.212] (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60J4pxsX2942315;
	Sun, 18 Jan 2026 22:52:00 -0600
Message-ID: <ba318271-79d1-4fbc-ac39-30d61191ec30@ti.com>
Date: Mon, 19 Jan 2026 10:21:58 +0530
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
CC: Mathieu Poirier <mathieu.poirier@linaro.org>, <andersson@kernel.org>,
	<richard.genoud@bootlin.com>, <afd@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
	<u-kumar1@ti.com>, <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
	<linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20251125083746.2605721-1-b-padhi@ti.com> <aUHb_ax7rn3K_QeW@p14s>
 <096432b0-ce65-42df-b821-4cee40a6ff62@ti.com>
 <CANLsYkyctYQd36MekWw-Sw_v-3KNZw0Z6=s_ezy67dX13CAPyg@mail.gmail.com>
 <CAEg67G=iWg7yh5=aU1cCC2+XreagpvFVpaCV2VC0=GAEPfuKUA@mail.gmail.com>
 <502592db-504c-4337-aa2c-c5ee3fdd3605@ti.com>
 <CAEg67GkN9uvFymXuWcxpsd83-x_kd8YrjTP02cYZWWSUYqPdbQ@mail.gmail.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <CAEg67GkN9uvFymXuWcxpsd83-x_kd8YrjTP02cYZWWSUYqPdbQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002321:EE_|IA0PR10MB7302:EE_
X-MS-Office365-Filtering-Correlation-Id: b8e16cb4-ff39-465a-670d-08de57167f1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SDI1UVBZQk5lbDZSTFUrSXZMK0MzZnYxUXp0S0haT1pxNit6VkdyamZSMlIx?=
 =?utf-8?B?MjdsMW9KSTA1dDc3OUdrUTlsN2tMSEI3RW1vUXk1NHFFYXRnVUpWczA4S2t1?=
 =?utf-8?B?ZnB5ZHU2RU9OeThCQUhXU0RXSjFKaXVxeW8yNnJHNWtMcWZzSkQ3OEtGejIx?=
 =?utf-8?B?NTVhSE5yNGg5bWZVZ3BZZjFLay9zU1libHlodUcxK2hqdksyR0hhS04veUlp?=
 =?utf-8?B?RDZjc0hoZE9yQWNpTzRydVd3NkZ0MDZWeDBXdHZWaCtSVmpmcEc0MWRIVjVW?=
 =?utf-8?B?Q0FaQnJhWEZDbnJZRXhNQnRTU3ZPLzZKN0JNRmZWS1BodUF3OHd4WjVNQTJQ?=
 =?utf-8?B?ZHZWZnJlQ0JrL042bEV4U1lIbnFndmFubnlJN1k5NlZDMyswLy9sakZyQ1J4?=
 =?utf-8?B?RytlL3YxZlM0Y2JEYnZ3NnRSa0ZtcFF1ZDJoTmhpdGZadlhHN29ZRVZhSnU4?=
 =?utf-8?B?MzhuQTVwcldHaWNQOHkwYnl5SmM1MkFDcG9ZaTlZd3M1Zkc3MzhId2E5d0hn?=
 =?utf-8?B?QWRjcnZqVDcvNXhMNVNMdlJQQkRTdEdQc3QwM3o5QWY0SGJTK2xiN1pHZWc0?=
 =?utf-8?B?ek05bE51dnNqZlBCK2pKNnIwbHpNd2FhK2ZjZ0RxZk43a2RJdnVVZUUrNEFw?=
 =?utf-8?B?QmtFcGRERlQyK1JMM2VPazRWdEE5VHY5M3cya2NyMklqVnJOblV0eDVGTnRO?=
 =?utf-8?B?cGRZOUFGczE5c2JVdThud0x1dEcrN01Ubmk5ZERVS2tCWmNKbWZMQzl4WFlD?=
 =?utf-8?B?a3hGSmltejZtb2U4THFxSUtQakI0eDA2NVNmdGhsc1NkM1g4TDk2UWdDZE5t?=
 =?utf-8?B?OTZJQndKRDIxS0x6NmVCajJQVXpWTzVhYWIvVDd0NFUxRUxWTjkzZ3hOU1Vj?=
 =?utf-8?B?VGF0Z2ZiMkxRSisvalJtcHIwRnpZTmxjNlRIeVkxTTBlbEFYTWNVWEhIaVZl?=
 =?utf-8?B?NGdqd3RHR1dMSTcvamJLN3RRR1N6MEVCczIwNFZPL0VJem11Qmw4bmdZUEFp?=
 =?utf-8?B?OE1rUWNlL2hjZ3BlVVdlb0FUV0xnYjh1UXlhVGRnN0RqWGx6UEU0eDl6eFNh?=
 =?utf-8?B?cmZhUTJsNDAvbnNEYU1COWUxT0NSdWYyNU1HMGFyRnZZZzcvQXl5SDJlckw3?=
 =?utf-8?B?VnV0L3cvRURTbldERHI3SktkeFVSMzJxc3RSWE9DTjZxQ2cxU3c4QWVkbFpk?=
 =?utf-8?B?cTB4TTVlaGk2K1I4OUZZUWRHcHgwcUtNY3kxKzZVMkZ4S3lzNGZLSWNTRDlW?=
 =?utf-8?B?UXlnc3Z5Zkt6T0QwbGRCT2VoajkzNE9qRFppVmFpcU5NSllzMEZRUU12N1ZC?=
 =?utf-8?B?RGVHQ0dQcDJpM1FhTEk5SE10NUg3eDFrd2hPa3gvSW81cEtCL0xObVlLdDJB?=
 =?utf-8?B?bHNuYUp5aHRkcmp5MXh1R2Evd2p5eStxMmExU2pGVklZM0dqTVZzL1U1ODFx?=
 =?utf-8?B?WDFzTUxXeG0yN3MzdHNpSUFYNHVnUHZqVWNHdTBlM3BWQnRVMUNOVVNDaWc1?=
 =?utf-8?B?NkoxcWRtMXVXNGV2Ymd6T1RYenp2c3MzUFlQbGVDQXRmT2RNZzFHOGUrYThQ?=
 =?utf-8?B?cDRwbkxxM2JUNTBRYnJDR29FSDFhNXR5TEU3YXZ6SFRJRkV6OFRkekNENUJ3?=
 =?utf-8?B?bWVwY3F4WWNXWHd3cTU5SkgxcERQM1FCaXBKYnE0NmthRzdvWnB3TVBUd0Rp?=
 =?utf-8?B?dy9Cd1BaR0N2aVB5YXlubzI3R1JxVk82TzhoUU01QnJDRGpmdlhpR2wrN0RK?=
 =?utf-8?B?R29EUUUyRThGUjRmKzYwOVRudnlFSjkxSWxmUEkydmZtOU1nRUE3WTZKUXpq?=
 =?utf-8?B?Uko5S1JCL1I1S1NjZU5CRHVUVFgrVjJZYkZvQXB1cGxKZlB0VXAxMmIxM2Zh?=
 =?utf-8?B?VjNaU0dHUG5HWEpVYUorMDkvT09ieEdDVWFDUmRqYVU1bkNLQ25UUDd5RHhE?=
 =?utf-8?B?Mmh5NGxIdUlkQzIwa0tHZlFlWmg1MXBCV2RncFpFb0xyb3F2bDg1RHJYeG9P?=
 =?utf-8?B?TkhQVkpmM3lXN2ltUUdFTnl6T2gybUhYWCtFNkxKcUplNUd1aDVxQU05bnJV?=
 =?utf-8?B?TDhnajEyUjFvWTg4VURkUGdnMHJEZ2JyOXZlc3FEZEF3VmpCSXU1NGdmamRk?=
 =?utf-8?B?OUY4eWRVdFZoWWZKYUV2VFJtSlJ1YUY0NllVcjNHQWlwY2ROaDcxV2d1SzFG?=
 =?utf-8?B?Y29lRjBqaFNrb2pELzJmTU5KczhZendUekZtcWlObkxXTm1DOEs5RCtEWWtF?=
 =?utf-8?B?SmtlYlcvZ0pLN25jakNZUGR2ZEFnPT0=?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 04:52:06.5391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8e16cb4-ff39-465a-670d-08de57167f1c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002321.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7302


On 16/01/26 13:57, Patrick Oppenlander wrote:
> On Fri, 16 Jan 2026 at 16:58, Beleswar Prasad Padhi <b-padhi@ti.com> wrote:
>>
>> On 15/01/26 03:57, Patrick Oppenlander wrote:


[...]

>>>>>>> [...]
>>>>>>> +
>>>>>>> +/**
>>>>>>> + * notify_shutdown_rproc - Prepare the remoteproc for a shutdown
>>>>>>> + * @kproc: remote core pointer used for sending mbox msg
>>>>>>> + *
>>>>>>> + * This function sends the shutdown prepare message to remote processor and
>>>>>>> + * waits for an ACK. Further, it checks if the remote processor has entered
>>>>>>> + * into WFI mode. It is invoked in shutdown sequence to ensure the rproc
>>>>>>> + * has relinquished its resources before asserting a reset, so the shutdown
>>>>>>> + * happens cleanly.
>>>>>>> + */
>>>>>>> +int notify_shutdown_rproc(struct k3_rproc *kproc)
>>>>>>> +{
>>>>>>> +    bool wfi_status = false;
>>>>>>> +    int ret;
>>>>>>> +
>>>>>>> +    reinit_completion(&kproc->shutdown_complete);
>>>>>>> +
>>>>>>> +    ret = mbox_send_message(kproc->mbox, (void *)(uintptr_t)RP_MBOX_SHUTDOWN);
>>>>>>> +    if (ret < 0) {
>>>>>>> +            dev_err(kproc->dev, "PM mbox_send_message failed: %d\n", ret);
>>>>>>> +            return ret;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    ret = wait_for_completion_timeout(&kproc->shutdown_complete,
>>>>>>> +                                      msecs_to_jiffies(5000));
>>>>>>> +    if (ret == 0) {
>>>>>>> +            dev_err(kproc->dev, "%s: timeout waiting for rproc completion event\n",
>>>>>>> +                    __func__);
>>>>>>> +            return -EBUSY;
>>>>>>> +    }
>>>>>>> +
>>>>>> Won't that create an issue on systems with an older FW that doesn't send a
>>>>>> RP_MBOX_SHUDOWN_ACK message?  Unless I'm missing something, this kind of feature
>>>>>> needs to be backward compatible.
>>>>> I feel it would be unsafe to just abruptly power off a core without some
>>>>> handshake.. The core could be executing something, there could be
>>>>> pending bus transactions leading to system hangs etc.. We start the
>>>>> IPC mechanism with a handshake, so we should end it with a
>>>>> handshake too.. And for firmwares that don't support this handshake,
>>>>> IMO its better to reject the shutdown request. What do you think?
>>>>>
>>>> We can't affect the behavior of systems where old FW is coupled with a
>>>> new kernel.  If people want to address the bugs you referred to, they
>>>> can update their FW as they see fit.  As such things need to be
>>>> backward compatible.  NXP has recently implemented a handshake
>>>> mechanism such as this, but to assert the readiness of a booting
>>>> remote processor. They used the vendor specific resource table to
>>>> store a flag that enables the handshake - I suggest using the same
>>>> heuristic to implement this feature.
>>> A flag in a resource table enabling the new behaviour could work, but
>>> we would probably need another way to do the new thing, maybe with a
>>> devicetree flag.
>>
>> That's hacky. Device tree is for hardware description only. We
>> should not be putting SW required quirks in DT. It should be
>> rightly placed in the vendor specific resource table.
> There's plenty of places in devicetree such things are already done
> (most stuff starting with "linux,", and plenty of others).


Yeah, but we should not keep repeating the same mistake :) DT is for
non-discoverable hardware. This sort of info can always be grabbed
from querying firmware at runtime or from the resource table at
build time. The Devicetree is not just used by Linux, but various
other projects (bootloaders like U-Boot to count) which might not
make use of those custom "Linux" properties we put here.

Thanks,
Beleswar

> [...]
