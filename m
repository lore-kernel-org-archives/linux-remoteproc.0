Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012001.outbound.protection.outlook.com [40.93.195.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB455221DAE;
	Fri, 24 Jul 2026 00:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784852917; cv=fail; b=gNVwtvrHIWe3aloA/GFeGYhHvDw2Z/n1F1+nbsYUgMAxQh0v42RmiL2f7kZ6q7eipK3NBrgJnOOFLjrdOrzXmabfk9uf/E5fe3643ir1zTwZyQzhQ6vaI6LmWjZnaNwlOvdwluju7Zh9BHnorHBf3pVNNBusfBFoZTq1PoTQI0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784852917; c=relaxed/simple;
	bh=+OsmHbBpZyhavkqbVpXnzOFBHjorUTtwsNg9XvY3wp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LqTat+dKntV/M0Rfa4wzVEmceivHeauji6DkjfrjVhxKHftjQX3pNJgjaHmzfdwniPpL/3dOvzSb61gOj0KUL6njBqd5Olua8a7aCMD1qZfbBeAP0aDRu4zMxx0PvPE6SfyWtKrjhQ0WqDkaTZWNVCztGEqId6KcVYRPScCXI20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lkGZpyjK; arc=fail smtp.client-ip=40.93.195.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lkGZpyjK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b7nQtoZ8Q+7Xmh4HgxIJG8HSKnFVZRfmwJMbkMjbrsa4K2bx6oNbMczXF68RwlcSQCgbFXwjCayqIDODJy/whp3UK0r9a9Yfn5kF8Ff0kSnkQLEJPTryNfRArHwEFEqdbjgKbVJ566+llRzqGCEiM2MpT7lV/ALKq3xLeu13eN+OCkh+WGxgg+RxnmMg9KO4KYfkpqNtTxIICgXsdKeKK6z5JiubQNVVNcys2amQ+vwcULga03clc1Cg9UI0QTEFKd3jwCxK2dglSbujhrKp+hIpFCEQgTjpuTFNq5hdtivlNzdcFHGaUs3v6LNIwUR5T3/iSEqF1GxZOxzHu/o4tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPhs4GDbFthaciZnZ+8cphTYDFKikujXSUoDNFv/KiE=;
 b=OUnYnKmMrYkkzBuFOizCGe4udVoqL9gOaprzQNREkszDV0WxOZDsheUPFEM6k2vmsLyA9yV0N33rgpfZsxeRDtk8kL6poijXBMf9JAhVwtKpepMymA6Coads4yQMSujv80aQzcNsZHVJUfjRlRCPdBmJQleudAFyCUW6W/bcCDjcdEAcZ7fwvfW8nspZhNpmMOG694rMVpJ63KMXw4qXBEV4s7IedZLd82Tl8j4P5hbWnhxUDVHAqTUL8jO2gat4ogFhiZ0fBTEMCOEwQdVMTavkrjcj5swQR1xOpOkFzBAyK2UYYc8GE56rpQR5eutlKEJG0BaA1O1MsEaC4bJJpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=foss.st.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPhs4GDbFthaciZnZ+8cphTYDFKikujXSUoDNFv/KiE=;
 b=lkGZpyjKwWc70ORHXfJuIQk/acrD+cPCBhsidGBkystzK8CyKcZj/DbkJuKwncwqA3rhKef7pfvOwX9tU7UDPShRKJ9w7138wYCAOF4FmerMp0UN6rEFF7y11zYflbOJWxPP2bEWZ9PZdA/AghKvLLcqOHrwrpqZv50Mn21ntBs=
Received: from SJ0PR03CA0057.namprd03.prod.outlook.com (2603:10b6:a03:33e::32)
 by CY8PR12MB8194.namprd12.prod.outlook.com (2603:10b6:930:76::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 00:28:29 +0000
Received: from SJ5PEPF0000020A.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::59) by SJ0PR03CA0057.outlook.office365.com
 (2603:10b6:a03:33e::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 00:28:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF0000020A.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 00:28:28 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 23 Jul
 2026 19:28:27 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 23 Jul
 2026 19:28:27 -0500
Received: from [172.31.11.149] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 23 Jul 2026 19:28:27 -0500
Message-ID: <db46a271-147b-4b3d-a8c4-209344b0d969@amd.com>
Date: Thu, 23 Jul 2026 19:28:27 -0500
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
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <tanmay.shah@amd.com>, <andersson@kernel.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260710192831.3440427-1-tanmay.shah@amd.com>
 <20260710192831.3440427-4-tanmay.shah@amd.com> <ale0KIu6hXNvN0q9@p14s>
 <66e4a85c-be14-4bd8-8328-bf17d2437994@amd.com>
 <CANLsYkyL8_YSb39QqbC0Z+udahMtCV1e+OeoKGvmGSxQ6h3_qA@mail.gmail.com>
 <c8f62152-fb7b-4771-87d7-9420c7e3f452@amd.com> <al-VRUCcl6NWzQkY@p14s>
 <a37bb772-2b27-44fa-9bf1-30707c419141@amd.com> <amDYiyTFFLkkTv5K@p14s>
 <c1d24c44-8daf-48bc-9785-7ab394353356@foss.st.com>
 <CANLsYkzCKpNG-2W24EA1FEjEEr1J+w6VvM=sPwr8wMRDNqm9jg@mail.gmail.com>
 <c6826750-03b3-4ad6-9f88-394b0234ec27@foss.st.com>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <c6826750-03b3-4ad6-9f88-394b0234ec27@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF0000020A:EE_|CY8PR12MB8194:EE_
X-MS-Office365-Filtering-Correlation-Id: 0301ea70-fe30-42bb-0032-08dee91a7ba8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|13003099007|6133799003|56012099006|11063799006|10067099003|4143699003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	QAul+vW+zJSTFCh0ernly7AQZGZaVuMDK8c+XqkDG9zCRjO6Zrg66cujSSaGO6qIW2p6mRy1zSVpBp19hYNHoV5WEuKMDYRoD9JDFa3bQyTMYWVISdI1ysIy7o9n0Yndsi7nLIF8zRFFZSPdIRLqsz5N3wZZXcyOIT134+2EvL+SwmmiLZ9Q7nMtFI82PIx6UORGRokcDWlmERmPwDmljMJVwMV2ax/aiH9ihgAiS+yQ2xd6CdKII5bCTFEjxx02nShzNS4XxrKrgaC7c2LITPsCdkf5ykeLCaDguHYq9go98N/G3S+6KSGRFq51eCXZYClFKME+bPbGbEmSmpfRgx0ekAapMAvN4fSmdStC2bJvqX+hbaHMU6uWNm0F3T3rh2cCAGbpg0v+WUCEIVYdCqF6pmIAC8t4AZdobEPC0l930WbusnmkxA0b/UwNhsYWACyhxGfj/GNtaGqR24GnPjIBnQaYlesk0pTmwFvFbb5WO/kIVgZ9aCPFbwy8hFLY2dyJsdnJ1XPkIaRlEF1kR+EYPoPZLSzSeVmIUedh1ZqWGP2RUA521emGdfzPxpf2f2uUmiSArWYJy+yxcBmtzu0G6ZhXKIEe7Fp7DCJXeVmSUW0H+4fiiqkB+GfO4TQ0jACnzBlQglF2ug9US4vJR7PPnTv/osR9mqFluUuCXjo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(13003099007)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NuHEXX+RLL458oR2owYU7qq7yqgCAdeUJS8Pu4kZlgc3eMnrE5DkeYw69debOl4DUjdG+lA6PP1StTo7OnzalmYzyvNwEZyip1V/KjeSahdK83MR7pqlnzt1ZfP38wrgFsopFoJpv2tukis6TCBSRTz7Wgh3JGqvVdviDtiK+FgOEnb9h0u7bQ9xJL9iOxHso2Mg3jo7G+vmJA9WkPcQzbg6TmT5y0/15kllnYTVut0yrECdMZ5xwn1oO+e+iwZXHUbWy9fqTSdWoAQiE4KFsKNdRPIRbIShQuuxDYUTj2DcOvq7CnrSxcqROJkqAPXi/eEh3k+jaRvXmrpdYUPWukidQ4EHzrDfAdW/4orNqGkV0rxr26drDGAmy42xeYw2L3VECObQYwzfrzQ5uLAaGnGsS2ZZMStx7TJYY2un1T+cJwvIOnNmpXiPhDJT2pcV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 00:28:28.4960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0301ea70-fe30-42bb-0032-08dee91a7ba8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF0000020A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8194



On 7/23/2026 12:27 PM, Arnaud POULIQUEN wrote:
> 
> 
> On 7/23/26 16:13, Mathieu Poirier wrote:
>> On Thu, 23 Jul 2026 at 03:11, Arnaud POULIQUEN
>> <arnaud.pouliquen@foss.st.com> wrote:
>>>
>>> Hello Mathieu,
>>>
>>> On 7/22/26 16:49, Mathieu Poirier wrote:
>>>> On Tue, Jul 21, 2026 at 11:02:13AM -0500, Shah, Tanmay wrote:
>>>>>
>>>>>
>>>>> On 7/21/2026 10:50 AM, Mathieu Poirier wrote:
>>>>>> On Thu, Jul 16, 2026 at 11:12:55AM -0500, Shah, Tanmay wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 7/16/2026 10:48 AM, Mathieu Poirier wrote:
>>>>>>>> On Wed, 15 Jul 2026 at 11:28, Shah, Tanmay <tanmays@amd.com> wrote:
>>>>>>>>>
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> Please find my response below:
>>>>>>>>>
>>>>>>>>> On 7/15/2026 11:24 AM, Mathieu Poirier wrote:
>>>>>>>>>> On Fri, Jul 10, 2026 at 12:28:29PM -0700, Tanmay Shah wrote:
>>>>>>>>>>> 512 bytes isn't always suitable for all case, let firmware
>>>>>>>>>>> maker decide the best value from resource table.
>>>>>>>>>>> enable by VIRTIO_RPMSG_F_BUFSZ feature bit.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>>>>>>>>>> ---
>>>>>>>>>>> Changes in v5:
>>>>>>>>>>>
>>>>>>>>>>>     - fix documentation about alignment of the buffer size
>>>>>>>>>>>     - change version field from u16 to u8
>>>>>>>>>>>     - remove buffer alignment check
>>>>>>>>>>>     - Separate buffer alignment vs MTU of a single buffer
>>>>>>>>>>>     - Use buffer alignment only to get next buffer address at
>>>>>>>>>>> alignment
>>>>>>>>>>>       boundary
>>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> [...]
>>>>>>>>>
>>>>>>>>>>> +#ifndef _LINUX_VIRTIO_RPMSG_H
>>>>>>>>>>> +#define _LINUX_VIRTIO_RPMSG_H
>>>>>>>>>>> +
>>>>>>>>>>> +#include <linux/types.h>
>>>>>>>>>>> +#include <linux/virtio_types.h>
>>>>>>>>>>> +
>>>>>>>>>>> +/* The feature bitmap for virtio rpmsg */
>>>>>>>>>>> +#define VIRTIO_RPMSG_F_NS   0 /* RP supports name service
>>>>>>>>>>> notifications */
>>>>>>>>>>> +#define VIRTIO_RPMSG_F_BUFSZ        1 /* RP get buffer size
>>>>>>>>>>> from config space */
>>>>>>>>>>> +
>>>>>>>>>>> +/* Version of struct virtio_rpmsg_config understood by this
>>>>>>>>>>> driver */
>>>>>>>>>>> +#define RPMSG_VDEV_CONFIG_V1        1
>>>>>>>>>>> +
>>>>>>>>>>> +/**
>>>>>>>>>>> + * struct virtio_rpmsg_config - config space for rpmsg
>>>>>>>>>>> virtio device
>>>>>>>>>>> + *
>>>>>>>>>>> + * @version:        version of this structure, currently
>>>>>>>>>>> %RPMSG_VDEV_CONFIG_V1.
>>>>>>>>>>> + * @size:   size of this structure in bytes.
>>>>>>>>>>> + * @rpmsg_buf_align: alignment in bytes for each buffer.
>>>>>>>>>>> Must be a power of
>>>>>>>>>>> + *               two. If 0 then no alignment will be done.
>>>>>>>>>>> This alignment
>>>>>>>>>>> + *               will not decide actual size of the buffer
>>>>>>>>>>> but will be
>>>>>>>>>>> + *               used to decided the start address of the
>>>>>>>>>>> buffer. The
>>>>>>>>>>> + *               actual size of the buffer can be different
>>>>>>>>>>> than the
>>>>>>>>>>> + *               aligned size of the buffer.
>>>>>>>>>>
>>>>>>>>>> Is there really a need to have a buffer size different from
>>>>>>>>>> its alignment?  It's
>>>>>>>>>> not like the (small) delta between the buffer size and its
>>>>>>>>>> alignment will be
>>>>>>>>>> used for something else.  I'm fine with a buffer alignment
>>>>>>>>>> requirement but in
>>>>>>>>>> those cases, the firmware should set the size of the buffer in
>>>>>>>>>> accordance with
>>>>>>>>>> its alignment requirement.  Otherwise, the complexity needed
>>>>>>>>>> to manage the
>>>>>>>>>> discrpancy between the two yields a driver that is hard to
>>>>>>>>>> maintain and prone to
>>>>>>>>>> bugs.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> I had the same concern before. However, following example
>>>>>>>>> changed my mind:
>>>>>>>>>
>>>>>>>>> So, a single buffer size is the MTU size of a packet for the
>>>>>>>>> protocol
>>>>>>>>> supported by the firmware. Now that can be different than the
>>>>>>>>> aligned
>>>>>>>>> size of the buffer.
>>>>>>>>>
>>>>>>>>> For example, the higher level protocol (not rpmsg) has 430
>>>>>>>>> bytes as the
>>>>>>>>> max size of a payload. However, cache line alignment is 64-
>>>>>>>>> bytes. Then
>>>>>>>>> in that case, the aligned buffer size is 448 bytes. But, that
>>>>>>>>> doesn't
>>>>>>>>> mean we can say protocol's MTU size is 448 bytes. If user end up
>>>>>>>>> treating MTU size 448 bytes and use space beyond 430 bytes,
>>>>>>>>> then the
>>>>>>>>> higher level apps might discard that data and communication may
>>>>>>>>> fail.
>>>>>>>>>
>>>>>>>>
>>>>>>>> How is that scenario different from today's 512 byte buffer size?
>>>>>>>> Most users don't use all 512 bytes and we don't run in the problem
>>>>>>>> described above?
>>>>>>>>
>>>>>>>
>>>>>>> 512 buffer size is hardcoded, so it is enforced on the protocol
>>>>>>> by the
>>>>>>> framework. But by allowing the configuration of the buffer size
>>>>>>> we are
>>>>>>> allowing the protocol to decide what the buffer size should be.
>>>>>>> So, when
>>>>>>> user request the buffer via rpmsg_get_mtu() API, then that should
>>>>>>> be the
>>>>>>> original buffer size which is expected by the protocol, which may
>>>>>>> not be
>>>>>>> same as the aligned buffer size.
>>>>>>
>>>>>> Regardless of the buffer size, whether it is set to 512 byte or
>>>>>> some arbitrary
>>>>>> value by the remote processsor's firmware, there is a possibility
>>>>>> of a
>>>>>> discrepancy with what is expected by the protocol.  Right now
>>>>>> rpmsg_get_mtu()
>>>>>> returns 512 regardless of what a protocol uses.  The only thing
>>>>>> that should be
>>>>>> important to the protocol is not to exceed that limit.
>>>>>>
>>>>>
>>>>> I think I am missing something. Are you saying that buffer size can
>>>>> not
>>>>> be configured greater than 512 bytes?
>>>>
>>>> I am not.
>>>>
>>>> What I am saying is that if alignment is important to a remote
>>>> processor, it
>>>> should choose the buffer size accordingly.  rpmsg_get_mtu() should
>>>> return the
>>>> value of the buffer size, exactly the way it is today.
>>>
>>> Did you get a chance to look to my previous reply [1]?
>>>
>>
>> Unfortunately I haven't had the opportunity to reach that point in my
>> Inbox.
>>
>>>   From my understanding, due to the Virtio specification, we cannot
>>> guarantee that
>>> the buffer size will not be updated by the main processor. Having an
>>> alignment
>>> field ensures that the main processor takes the remote processor’s
>>> constraints
>>> into account if it updates the RPMsg buffer size.
>>>
>>
>> Where does the main processor change the buffer size?
> 
> Linux does not, but any main processor may do so, consistent with the
> Virtio specification. If requested in OpenAMP with a valid usecase, no
> reason to reject if it is not specified that it is not possible.
> 
> What we define here will probably become the reference for all RPMsg
> implementations...
> 
>>
>>> That said, if we decide to remove the alignment field, we must clearly
>>> document the constraints for the RPMsg Virtio config space:
>>>
>>> - virtio_rpmsg_config cannot be changed by the Virtio driver.
>>> - the sizes must respect the device and driver alignment constraint.
>>>
>>
>> If the size chosen by the device isn't compatible with what the driver
>> can accommodate, then initialization simply fails.
>>
>>> This is not my preferred solution,because that means that the remote
>>> processor has
>>> to know the alignment constraints of the main processor.
>>>
>>
>> It would have to anyway wouldn't it? 
> 
> I think I was wrong about this last argument. Since the main processor
> allocates the buffers, it can apply its own alignment constraints,so the
> remote processor does not need to know them.
> 
> That makes the option without an alignment field acceptable to me,
> if restrictions are documented.
> 
> Here are the constraints that I would like to see documented (not
> necessary using the exact terms) in Linux and OpenAMP to make the usage
> clear for the RPMsg virtio config space:
> - The virtio driver must not update the config space.

Ack.

> - The virtio driver can allocate a memory area equal to or greater than
>   the RX/TX message size specified by the device. The effective RX/TX size
>   remains the one requested by the device.

Here I have a question. Currently we do not have any mechanism (such as
dt property) that allows the driver (linux) side alignment. In such case
why even mention it in the documentation? Or if we do, then we also need
to make it clear that Linux provides no such mechanism today.

> The effective RX/TX size remains the one requested by the device.

IIUC, does this mean rpmsg_get_mtu() API should return an aligned buffer
size from device not from the driver ?

> - The virtio device should specify sizes that respect its own alignment
>   constraints.

Ack. This means, we don't need extra alignment field at all in the
config space. The firmware directly mention aligned size only in the
txbuf_size and rxbuf_size fields.

Please let me know if my understanding is missing something. I am okay
to document above points.

Thanks.

> 
> Does this would be acceptable to you?
> Regards,
> Arnaud
> 
>>
>>   And as I said from the beginning, this is not something that has come
>> up in the 20 years this subsystem existed.  There is no point in
>> adding all this complexity for a something that _may_ happen.
>>
>>> [1]https://www.mail-archive.com/linux-kernel@vger.kernel.org/
>>> msg2643398.html
>>>
>>> Regards,
>>>
>>> Arnaud
>>>>
>>>>>
>>>>> If the higher level protocol (not RPMsg) wants to use 4030 bytes for
>>>>> single packet payload then that is what the MTU size should be. And so
>>>>> the firmware will configure 4030 bytes as single buffer size in the
>>>>> vdev
>>>>> config space. That is why alignment should be treated separately.
>>>>> Because it is not equal to payload size needed by higher level
>>>>> protocol.
>>>>
>>>> In that case and assuming alignment is required, the buffer size
>>>> should be 4096
>>>> and rpmsg_get_mtu() should also return 4096.  How a higher protocol
>>>> uses the
>>>> buffer space is none of our concern.
>>>>
>>>> Currently, the buffer size is set to 512 and users don't always fill
>>>> the entire
>>>> buffer.  I don't see why things should be different with a
>>>> configurable buffer
>>>> size.
>>>>
>>>>>
>>>>>>>
>>>>>>> If for internal management we want to treat buffer size = aligned
>>>>>>> buffer
>>>>>>> size, I am okay. But rpmsg_get_mtu() must give unaligned buffer size
>>>>>>> which is expected by the protocol.
>>>>>>
>>>>>> I agree with the first sentence but not the second.  The only
>>>>>> thing protocols
>>>>>> should care about is the start address of a buffer and that its
>>>>>> size is
>>>>>> sufficient for what it needs.
>>>>>>
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Tanmay
>>>>>>>
>>>>>>>>> The alignment field is used only to decide where the next
>>>>>>>>> buffer start
>>>>>>>>> address is to ease cache operations.
>>>>>>>>>
>>>>>>>>> Sure, we need to maintain this complexity, but I think it's
>>>>>>>>> worth it.
>>>>>>>>>
>>>>>>>>
>>>>>>>> The same as in my previous email to Arnaud applies here - is
>>>>>>>> this an
>>>>>>>> immediate requirement of something we think may be happening in the
>>>>>>>> future?
>>>>>>>>
>>>>>>>
>>>>>>> IMHO, vendors will use it if the feature is available, otherwise the
>>>>>>> need to optimize alignment is not easily encountered.
>>>>>>>
>>>>>>>>
>>>>>>>>> Thanks,
>>>>>>>>> Tanmay
>>>>>>>>>
>>>>>>>>>>> + * @txbuf_size:     Tx buf size from remote's view. For
>>>>>>>>>>> Linux this is rx buf size.
>>>>>>>>>>> + * @rxbuf_size:     Rx buf size from remote's view. For
>>>>>>>>>>> Linux this is tx buf size.
>>>>>>>>>>> + *
>>>>>>>>>>> + * This is the configuration structure shared by the device
>>>>>>>>>>> and the driver,
>>>>>>>>>>> + * read when %VIRTIO_RPMSG_F_BUFSZ is negotiated. The fields
>>>>>>>>>>> are laid out so
>>>>>>>>>>> + * the structure is naturally 32-bit aligned.
>>>>>>>>>>> + */
>>>>>>>>>>> +struct virtio_rpmsg_config {
>>>>>>>>>>> +    u8 version;
>>>>>>>>>>> +    __virtio16 size;
>>>>>>>>>>> +    __virtio16 rpmsg_buf_align;
>>>>>>>>>>> +    /* The tx/rx individual buffer size (if
>>>>>>>>>>> VIRTIO_RPMSG_F_BUFSZ) */
>>>>>>>>>>> +    __virtio32 txbuf_size;
>>>>>>>>>>> +    __virtio32 rxbuf_size;
>>>>>>>>>>> +} __packed;
>>>>>>>>>>> +
>>>>>>>>>>> +#endif /* _LINUX_VIRTIO_RPMSG_H */
>>>>>>>>>>> -- 
>>>>>>>>>>> 2.34.1
>>>>>>>>>>>
>>>>>>>>>
>>>>>>>
>>>>>
>>>>
>>>
> 

