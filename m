Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012034.outbound.protection.outlook.com [52.101.53.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD6F46D56B;
	Tue, 21 Jul 2026 16:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784649930; cv=fail; b=d+1GiZbRYpYv8Qne26RzE/5zSR8WIrI7CjFmjNOC1gcHmoNAIr48AqDaQqT4qjMJDy26eO+Vmb4Lm92CR9VEU+ExTpripn4F7iTqsxxm4khNtkgH7t3tuxGjrtAysIv38LeIFm5DwZGUDIbB3uCXCFfghsTJX8l1Ntfc1cIAgX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784649930; c=relaxed/simple;
	bh=oDfmfYOjrDmGiXRpZ0Xx2oV5r0ioASGFEerVjiljlTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=smVb3hZ06r65K7ObUxyu9WhBH15Vj8UhIlYpPZYbs1/6uN3dGQ8DKmTSp6b9ROsEuD5BBO2LjCHsOfEOJRyKdnq6XRB4n+EyYUqIgRx9IGKRBazJ27VIXEI6lKejykum26LmJAXW9LksIshwNNCAXC0d5mAjXdNtPrTDhgdGmz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=epPgJ66s; arc=fail smtp.client-ip=52.101.53.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="epPgJ66s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nAsszuUA/YM8JQvuIA6ts73l4WljFtqBsB2PQuAMkXGwtyBYqZdGPcQpHTILc8EH3psvvoCEO0HamRMlrKGAfXoB/VLvQcbDNm4ymInhtJvEoBxjVpeAbkfvs5w4Tnj29SK9a/3xMad7DA5UYXDUkA5cJoCz1w/XAR4o+zIdfJWcasE5Vt9ahav3L7JwpQzXUktXRsxUUNmDsCyTtFF33eTgSF7x25Y8ERJao5IVcHxrpre7A8m7uGTp2LdrCN+oAAbg01nyDCyGFvsdMkkGzW97vKf/00MAH/PIDFhapxyaxSbHLQcJan8fcWpANRwsGsSGSUpJ4N4t0T1Nn2dCZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ZkAVrGZ8fm/FJ/NHaCQiM6uDGWBlWsg8eVFbRsjTfQ=;
 b=QyI6bUEzZNHV5yf+oGiu3xSzuY34hAwjAfvKEeJZJcfWZkFuus9D6xLRjFH/GvKAANJVJnb9OxsGjsvUcEnDqclpx7MqJ9LOkXi/QuXjF6kdk/htMSHdfvdDKek0Inxnx8EEO1RwtGG+5WMkTJQvWav0iFRDBE3BcGyUoJo9NJFiW22uTUl+xm1W7KZZll5o3u+dmUHY+MuGvzqoykbqKKoqMRSWFhZSmaHI0skGhqd0GxBUxG5DEZxzeFP0HozQQeIX64npqPrr57jI0v2lSIcF8wc2xtN58HzP+xh5V4ISPFN2OOKtCH2+RCTb7gSgqny6+9m/MyyYfzmsLuEzmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZkAVrGZ8fm/FJ/NHaCQiM6uDGWBlWsg8eVFbRsjTfQ=;
 b=epPgJ66sJwLgPGBCKUqHJZQ6Nm/O+qnGXGDgS8p/ZRwBDgDIUBpmk43mx4wRxjZktrlu3yXXfDmk03dae+CMprPwiTtJTJly0vdNYko22fLRIpSKv4tJ/l8u2eUmb1AORuVQY4y+2GX8/j3i1C0xiIcmL6yKDbKdAlPvtR/UUrM=
Received: from PH5P222CA0001.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:34b::12)
 by CH1PR12MB9648.namprd12.prod.outlook.com (2603:10b6:610:2b0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Tue, 21 Jul
 2026 16:05:22 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:510:34b:cafe::9e) by PH5P222CA0001.outlook.office365.com
 (2603:10b6:510:34b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 16:05:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 16:05:21 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 21 Jul
 2026 11:05:21 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 21 Jul
 2026 11:02:19 -0500
Received: from [172.31.134.241] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 21 Jul 2026 11:02:18 -0500
Message-ID: <a37bb772-2b27-44fa-9bf1-30707c419141@amd.com>
Date: Tue, 21 Jul 2026 11:02:13 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH v5 3/5] rpmsg: virtio_rpmsg_bus: get buffer size from
 config space
To: Mathieu Poirier <mathieu.poirier@linaro.org>, <tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260710192831.3440427-1-tanmay.shah@amd.com>
 <20260710192831.3440427-4-tanmay.shah@amd.com> <ale0KIu6hXNvN0q9@p14s>
 <66e4a85c-be14-4bd8-8328-bf17d2437994@amd.com>
 <CANLsYkyL8_YSb39QqbC0Z+udahMtCV1e+OeoKGvmGSxQ6h3_qA@mail.gmail.com>
 <c8f62152-fb7b-4771-87d7-9420c7e3f452@amd.com> <al-VRUCcl6NWzQkY@p14s>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <al-VRUCcl6NWzQkY@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|CH1PR12MB9648:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c9db08f-aca3-491d-82d6-08dee741de20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|11063799006|4143699003|22082099003|56012099006|18002099003|3023799007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	tLKL1kzBAwF701dHelBb/RtYEisACDqaD3HN7x5ulrLRXj4JhkvkBAnISuEJZyUuVFtIne5DHQvaRI8Vjj9pnuQX1jZChvuYr8HFYxk4mSvHruDL1Fq2wwFwfV2Mupapg+oEVHQ5zMoD99DJBof/os/Kl7IefBpd/SfoWyXTcF73OPW+ukj5Eu/M/uSY1luzHgVKu2yViOVOJnQcTGAtthvpYbGgYFoV+pQN50QH4dwpWavzMvR12LoXCXn46cMshxgB4SwLsjX6vzXx3/f89MGd71nXPtvRmkWNjYbLSVIn5Vd+ATI2FPIXudiYdKiNkc8O3apjbuCF72JzRm+Fa/ik7rpvEZT7I186QEi4BLirsbk4ewzFpzfOogmq3YvRu1/+JxFjTXgsKnS7FuEv9UgIo8vMKe7qVXLZ3mJ9eVSQcVH9iZ+0IWeO3V4tzU3TAQj1X7ID+ZW0iVV02qlOxp+XKLabVuIH+9smw7NumbBpnW1GSy44fq/MDwQktTP3OsvFrflqCW5mgpqObHozxraOlJ9u/zERBwPLnI6fepe2J6wTsMd0ksNXhushp7VRqxzh9lpaxlcuMG8sWKatzt6ghl5Lua9NhmMzbM5DrE3SS51BN+2esE43ql28tBMPT2ZFh7hDVD3kEgp1XXDWuyU6yDdpMwZILd+pJsJPxEUOnsqRm6RZBfJ3Ruci3sa7n7K/vNDmvYPygjPclFpykQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(11063799006)(4143699003)(22082099003)(56012099006)(18002099003)(3023799007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	p2pwyctQmRiMJj2CVwhQW3roNokkWxP6ahIuof8flBDO/wICPb1V1rnT0olIirvm0WCxj8467VMlT5w76dkKmDJUQV7FYh/3ZrieE53mkEJ00Sw57jiipQgkCvvg4iJyn0WytknNBgh5vWug9Ci8hTkO4Iu7Nsv3A1sN0jIc9vkW0hblaiUXh+v1wWY3HjRCgH7cAfYYkEvNTD5+1x9kverYMot5fIslNcEj+QAMqIf1A+bC2Pcup8I0S9gTXQAJGI6+aUYQ3b/KgesxhgzNCjT5EnLCKZon++xzamrwIATBhuvtkC1e7OnFQD/pMBm7s8uC6x7oKUFW2I3vXI8umiG/REkQ5Ugt+xuCrmbspkBtlkE7yAiwMijGPYzKCHy24Tukp+RRGpQ9zBq+xUSv6pzr6NlLgxvr9XELbJLsjpZoyk2Qc1uSCznlV2oOBlgq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 16:05:21.7875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c9db08f-aca3-491d-82d6-08dee741de20
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9648



On 7/21/2026 10:50 AM, Mathieu Poirier wrote:
> On Thu, Jul 16, 2026 at 11:12:55AM -0500, Shah, Tanmay wrote:
>>
>>
>> On 7/16/2026 10:48 AM, Mathieu Poirier wrote:
>>> On Wed, 15 Jul 2026 at 11:28, Shah, Tanmay <tanmays@amd.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> Please find my response below:
>>>>
>>>> On 7/15/2026 11:24 AM, Mathieu Poirier wrote:
>>>>> On Fri, Jul 10, 2026 at 12:28:29PM -0700, Tanmay Shah wrote:
>>>>>> 512 bytes isn't always suitable for all case, let firmware
>>>>>> maker decide the best value from resource table.
>>>>>> enable by VIRTIO_RPMSG_F_BUFSZ feature bit.
>>>>>>
>>>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>>>>> ---
>>>>>> Changes in v5:
>>>>>>
>>>>>>   - fix documentation about alignment of the buffer size
>>>>>>   - change version field from u16 to u8
>>>>>>   - remove buffer alignment check
>>>>>>   - Separate buffer alignment vs MTU of a single buffer
>>>>>>   - Use buffer alignment only to get next buffer address at alignment
>>>>>>     boundary
>>>>>>
>>>>
>>>> [...]
>>>>
>>>>>> +#ifndef _LINUX_VIRTIO_RPMSG_H
>>>>>> +#define _LINUX_VIRTIO_RPMSG_H
>>>>>> +
>>>>>> +#include <linux/types.h>
>>>>>> +#include <linux/virtio_types.h>
>>>>>> +
>>>>>> +/* The feature bitmap for virtio rpmsg */
>>>>>> +#define VIRTIO_RPMSG_F_NS   0 /* RP supports name service notifications */
>>>>>> +#define VIRTIO_RPMSG_F_BUFSZ        1 /* RP get buffer size from config space */
>>>>>> +
>>>>>> +/* Version of struct virtio_rpmsg_config understood by this driver */
>>>>>> +#define RPMSG_VDEV_CONFIG_V1        1
>>>>>> +
>>>>>> +/**
>>>>>> + * struct virtio_rpmsg_config - config space for rpmsg virtio device
>>>>>> + *
>>>>>> + * @version:        version of this structure, currently %RPMSG_VDEV_CONFIG_V1.
>>>>>> + * @size:   size of this structure in bytes.
>>>>>> + * @rpmsg_buf_align: alignment in bytes for each buffer. Must be a power of
>>>>>> + *               two. If 0 then no alignment will be done. This alignment
>>>>>> + *               will not decide actual size of the buffer but will be
>>>>>> + *               used to decided the start address of the buffer. The
>>>>>> + *               actual size of the buffer can be different than the
>>>>>> + *               aligned size of the buffer.
>>>>>
>>>>> Is there really a need to have a buffer size different from its alignment?  It's
>>>>> not like the (small) delta between the buffer size and its alignment will be
>>>>> used for something else.  I'm fine with a buffer alignment requirement but in
>>>>> those cases, the firmware should set the size of the buffer in accordance with
>>>>> its alignment requirement.  Otherwise, the complexity needed to manage the
>>>>> discrpancy between the two yields a driver that is hard to maintain and prone to
>>>>> bugs.
>>>>>
>>>>
>>>> I had the same concern before. However, following example changed my mind:
>>>>
>>>> So, a single buffer size is the MTU size of a packet for the protocol
>>>> supported by the firmware. Now that can be different than the aligned
>>>> size of the buffer.
>>>>
>>>> For example, the higher level protocol (not rpmsg) has 430 bytes as the
>>>> max size of a payload. However, cache line alignment is 64-bytes. Then
>>>> in that case, the aligned buffer size is 448 bytes. But, that doesn't
>>>> mean we can say protocol's MTU size is 448 bytes. If user end up
>>>> treating MTU size 448 bytes and use space beyond 430 bytes, then the
>>>> higher level apps might discard that data and communication may fail.
>>>>
>>>
>>> How is that scenario different from today's 512 byte buffer size?
>>> Most users don't use all 512 bytes and we don't run in the problem
>>> described above?
>>>
>>
>> 512 buffer size is hardcoded, so it is enforced on the protocol by the
>> framework. But by allowing the configuration of the buffer size we are
>> allowing the protocol to decide what the buffer size should be. So, when
>> user request the buffer via rpmsg_get_mtu() API, then that should be the
>> original buffer size which is expected by the protocol, which may not be
>> same as the aligned buffer size.
> 
> Regardless of the buffer size, whether it is set to 512 byte or some arbitrary
> value by the remote processsor's firmware, there is a possibility of a
> discrepancy with what is expected by the protocol.  Right now rpmsg_get_mtu()
> returns 512 regardless of what a protocol uses.  The only thing that should be
> important to the protocol is not to exceed that limit.
> 

I think I am missing something. Are you saying that buffer size can not
be configured greater than 512 bytes?

If the higher level protocol (not RPMsg) wants to use 4030 bytes for
single packet payload then that is what the MTU size should be. And so
the firmware will configure 4030 bytes as single buffer size in the vdev
config space. That is why alignment should be treated separately.
Because it is not equal to payload size needed by higher level protocol.

>>
>> If for internal management we want to treat buffer size = aligned buffer
>> size, I am okay. But rpmsg_get_mtu() must give unaligned buffer size
>> which is expected by the protocol.
> 
> I agree with the first sentence but not the second.  The only thing protocols
> should care about is the start address of a buffer and that its size is
> sufficient for what it needs.
> 
>>
>> Thanks,
>> Tanmay
>>
>>>> The alignment field is used only to decide where the next buffer start
>>>> address is to ease cache operations.
>>>>
>>>> Sure, we need to maintain this complexity, but I think it's worth it.
>>>>
>>>
>>> The same as in my previous email to Arnaud applies here - is this an
>>> immediate requirement of something we think may be happening in the
>>> future?
>>>
>>
>> IMHO, vendors will use it if the feature is available, otherwise the
>> need to optimize alignment is not easily encountered.
>>
>>>
>>>> Thanks,
>>>> Tanmay
>>>>
>>>>>> + * @txbuf_size:     Tx buf size from remote's view. For Linux this is rx buf size.
>>>>>> + * @rxbuf_size:     Rx buf size from remote's view. For Linux this is tx buf size.
>>>>>> + *
>>>>>> + * This is the configuration structure shared by the device and the driver,
>>>>>> + * read when %VIRTIO_RPMSG_F_BUFSZ is negotiated. The fields are laid out so
>>>>>> + * the structure is naturally 32-bit aligned.
>>>>>> + */
>>>>>> +struct virtio_rpmsg_config {
>>>>>> +    u8 version;
>>>>>> +    __virtio16 size;
>>>>>> +    __virtio16 rpmsg_buf_align;
>>>>>> +    /* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
>>>>>> +    __virtio32 txbuf_size;
>>>>>> +    __virtio32 rxbuf_size;
>>>>>> +} __packed;
>>>>>> +
>>>>>> +#endif /* _LINUX_VIRTIO_RPMSG_H */
>>>>>> --
>>>>>> 2.34.1
>>>>>>
>>>>
>>

