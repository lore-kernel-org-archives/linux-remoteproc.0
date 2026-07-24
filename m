Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012013.outbound.protection.outlook.com [52.101.48.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6194A0C;
	Fri, 24 Jul 2026 00:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784852094; cv=fail; b=hyT2c4ZCEGITDw1D4ohyhJZetkK6ySjcqET6X5zFcwGEkf2ut5WycCKGfDyA5eCh9JkYbYxS2t7FaaQujTZxDTVyoJgozBEgvkqwIRsTizdMk/IMLmCEFODeq9Q9LiWQzbYrTjUQIslAMq2mkRmIHU2bArvwuWfRd5qO/f6nVZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784852094; c=relaxed/simple;
	bh=/IwCLT1uJgwZXiywKmMV/1laAw6hHkjSApulga9LvWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sA6tJI32+h2JjBpuWqH6O5bkAJNEADn2z4lDoeEJENOiydELy/04a7T9eAFewlFHQf+w3+HuuPGucd4SVXEYwJwDaem/bI3YnGSPP6hak2rETCj+RkIJMPfsY6Kl9XZCpvLyNvGcsVz6AgoKGz8EpH6JqqZQTwpFvDzNpkksR88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=U13rLNiG; arc=fail smtp.client-ip=52.101.48.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="U13rLNiG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YI7QvqP9vvsW3qvsaveRmJg0rwEFu1nneMUVQ4cLdNzBzUMGpLBO60lkdjOkckTRcOBBwf/Bs0V+6+8lcXE9zjgmOyo2GcU7rYw6V1r0sRXLhNQh9VoA71a8lhwKjBS0jVEpxnkBzYaezQkfQ1ra5oMvHaxtztWx6IoLXx70AR68KubuSUdKJSgOcGtOdvm1KhibyssLFDJwHAQN6OU0Eae6UybYDzsp3K4TmlUdr5PmhpWhNQGLnaQg4UMtNKtS7iCivAdx4OWlz4OoCosoqViSVK7xiUqACDHBjys/2Gbo2PGms7QZAZw2SDwrV1dPdx9Y4IYYNJqJmfQtfAEMcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zyoFXGIGXrZ4GfBnwodD8wTxVLzcjO5QYsSUXWvV64=;
 b=txrNmkUiRTocCCOXqxr8sLRrxWkWkp7khl3wyEhVnHEFMvWCAlHvMRKNZLZtoAmiv+a5iykXUQMszo142nn54qSb8gqiKecC3VfFre1nC6nhNArIxbV4HbzFyHPQGU7JhJ/YJKmgrcdKHB8gPMR9n9k14VLWyqtTiyndVu8HropvXo4swvrIeWh8aY7vytkq5dasiVBD36BMg3RLCV7CGRujAqTQxPtsrxQR21yK0Yx4X4ZbVqrPVwhueHOpN5nJsmXtlJXpp/NauazvpOuEt+B6TQnnNzQaecoXVWRmaq4s4Pk86szout6PXP8N9XD0y9AGEmWjlo0YdeenH7NMTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zyoFXGIGXrZ4GfBnwodD8wTxVLzcjO5QYsSUXWvV64=;
 b=U13rLNiGK2WerXBwmHbkliuiAFwS19/HZyIJ6pOMmrU5Ofz+xZqzuCEBvCCMy8R6nhH7KSCS0+lRBeXXKKJ4ep3hMAs0OH+OmAMKaNAvZhJHXwNjl/X4qEVcvYEQhLfS4v9/4vRU7HHTQWg+jzkkhv29nR/L5iVSn2Eb1FS39Fk=
Received: from SJ0PR13CA0190.namprd13.prod.outlook.com (2603:10b6:a03:2c3::15)
 by DS7PR12MB5791.namprd12.prod.outlook.com (2603:10b6:8:76::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 00:14:48 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::4f) by SJ0PR13CA0190.outlook.office365.com
 (2603:10b6:a03:2c3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.4 via Frontend Transport; Fri, 24
 Jul 2026 00:14:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 00:14:48 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 23 Jul
 2026 19:14:47 -0500
Received: from [172.31.11.149] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 23 Jul 2026 19:14:47 -0500
Message-ID: <97276f27-132d-48f8-81e4-4c3aa56e3cc2@amd.com>
Date: Thu, 23 Jul 2026 19:14:47 -0500
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
 <a37bb772-2b27-44fa-9bf1-30707c419141@amd.com> <amDYiyTFFLkkTv5K@p14s>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <amDYiyTFFLkkTv5K@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|DS7PR12MB5791:EE_
X-MS-Office365-Filtering-Correlation-Id: 97e9ee69-a13d-4de2-0dcd-08dee91892c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|376014|82310400026|4143699003|56012099006|10067099003|3023799007|11063799006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	2dR9n1ghvGkQbPGpx+5TULr5o2y6vWXcbVf4hhx/NlUPbnsvhUsiJmWYvf9eKFUzVd9GbIuN+g5lGG3BJmUlXIwNQVDvqYjjICSI6U9E64C9dSPBQsipSrgLzMntM/Gk7LHGDtmkw0HZVsymwhU1Ij9AoktoR2FBqTVwmFJhiW8zeqxbNgXH7/KGNG2BTca7IFmBOMd0EWt3zjD/OwkixDii738/CoE9QHN3BtA+PjarfhLd2fADfmAY4yB/v5P2uuxZyHjZm2BqbDRtiquzyCMKn/LJdYllaUsOzoryTsJVQxQtpk/ZGRPzOtrdKJgGrhMwPKkg6OQIhxH8V9o9CqhOGf14LC8KPtxliS9iv8ZPVO+qUCwj4uKlcNGcqa/eWzJY7ECcsB43Yi91hlf7Jbcd2osA1K1AqsT8KIgX3un4M35lHGlGeaR7cDfPcp/UMeyTFcvei4eQE9zraPAp2hBdAhfVrvi3rTvWXXbsB3hpRzHaAzct3rRwKIQfXyuDMTH/wj0nitcE3tpjQTxnBn01qylrtD0n6sbbLL70EkKQiw6c3jv0HIK451qyxt0Evzdr/2hbMuGeVaK5utNxDvaVo7EVQNAg7ilimxJUVZf/D24L4jAxadI1ngTogD538V4izLyjoPn1hMkxp2gueH1i46+iBROz+WjmZCvjIjAQ3s4WAmkFAdAPTfKBpp50pKJhz71ptvbYV9R8cppcqQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(376014)(82310400026)(4143699003)(56012099006)(10067099003)(3023799007)(11063799006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9QRMVuCZOxZehVnrNWg8HprYgXssWTfaCUbYgYh0VCmZSGbxS/L3LhnpbXyq4d1EqPN/Xu+pYiA8PauD/ML4t2P2NUpC2WAS7zG3b3UpMXfMQ91U+JddwXD5MSi7oBVPAiW17igmVJwQNPLIZI8mCUXIh5sup6enCdHB2/TQqUHuJQs1zORS8ijR6isDjI/EBjUdgSzf2i+1in39lRabsR9kCAhiGUzrvLi+iN1ddcMTRRZfSVUK54a9QEX5khAjvPLqhe4KFPh4iO61LucdSJRDt2oLDKkys5/g4e2/SFjqaGiuiVRi6JIRhjZiunbnVD35U691EDKKG0DnSERsYAoVQCAvCmq1YRRkKYweir1JMGrRLAqVVbE1G3d9xM8RhMtxOEXSzL5BucWQyszhtq9gmiCaJZPy9zkP7bDhAK/e3juamibU2ZTtw7VXOZYI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 00:14:48.2590
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97e9ee69-a13d-4de2-0dcd-08dee91892c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5791



On 7/22/2026 9:49 AM, Mathieu Poirier wrote:
> On Tue, Jul 21, 2026 at 11:02:13AM -0500, Shah, Tanmay wrote:
>>
>>
>> On 7/21/2026 10:50 AM, Mathieu Poirier wrote:
>>> On Thu, Jul 16, 2026 at 11:12:55AM -0500, Shah, Tanmay wrote:
>>>>
>>>>
>>>> On 7/16/2026 10:48 AM, Mathieu Poirier wrote:
>>>>> On Wed, 15 Jul 2026 at 11:28, Shah, Tanmay <tanmays@amd.com> wrote:
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> Please find my response below:
>>>>>>
>>>>>> On 7/15/2026 11:24 AM, Mathieu Poirier wrote:
>>>>>>> On Fri, Jul 10, 2026 at 12:28:29PM -0700, Tanmay Shah wrote:
>>>>>>>> 512 bytes isn't always suitable for all case, let firmware
>>>>>>>> maker decide the best value from resource table.
>>>>>>>> enable by VIRTIO_RPMSG_F_BUFSZ feature bit.
>>>>>>>>
>>>>>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>>>>>>> ---
>>>>>>>> Changes in v5:
>>>>>>>>
>>>>>>>>   - fix documentation about alignment of the buffer size
>>>>>>>>   - change version field from u16 to u8
>>>>>>>>   - remove buffer alignment check
>>>>>>>>   - Separate buffer alignment vs MTU of a single buffer
>>>>>>>>   - Use buffer alignment only to get next buffer address at alignment
>>>>>>>>     boundary
>>>>>>>>
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>>> +#ifndef _LINUX_VIRTIO_RPMSG_H
>>>>>>>> +#define _LINUX_VIRTIO_RPMSG_H
>>>>>>>> +
>>>>>>>> +#include <linux/types.h>
>>>>>>>> +#include <linux/virtio_types.h>
>>>>>>>> +
>>>>>>>> +/* The feature bitmap for virtio rpmsg */
>>>>>>>> +#define VIRTIO_RPMSG_F_NS   0 /* RP supports name service notifications */
>>>>>>>> +#define VIRTIO_RPMSG_F_BUFSZ        1 /* RP get buffer size from config space */
>>>>>>>> +
>>>>>>>> +/* Version of struct virtio_rpmsg_config understood by this driver */
>>>>>>>> +#define RPMSG_VDEV_CONFIG_V1        1
>>>>>>>> +
>>>>>>>> +/**
>>>>>>>> + * struct virtio_rpmsg_config - config space for rpmsg virtio device
>>>>>>>> + *
>>>>>>>> + * @version:        version of this structure, currently %RPMSG_VDEV_CONFIG_V1.
>>>>>>>> + * @size:   size of this structure in bytes.
>>>>>>>> + * @rpmsg_buf_align: alignment in bytes for each buffer. Must be a power of
>>>>>>>> + *               two. If 0 then no alignment will be done. This alignment
>>>>>>>> + *               will not decide actual size of the buffer but will be
>>>>>>>> + *               used to decided the start address of the buffer. The
>>>>>>>> + *               actual size of the buffer can be different than the
>>>>>>>> + *               aligned size of the buffer.
>>>>>>>
>>>>>>> Is there really a need to have a buffer size different from its alignment?  It's
>>>>>>> not like the (small) delta between the buffer size and its alignment will be
>>>>>>> used for something else.  I'm fine with a buffer alignment requirement but in
>>>>>>> those cases, the firmware should set the size of the buffer in accordance with
>>>>>>> its alignment requirement.  Otherwise, the complexity needed to manage the
>>>>>>> discrpancy between the two yields a driver that is hard to maintain and prone to
>>>>>>> bugs.
>>>>>>>
>>>>>>
>>>>>> I had the same concern before. However, following example changed my mind:
>>>>>>
>>>>>> So, a single buffer size is the MTU size of a packet for the protocol
>>>>>> supported by the firmware. Now that can be different than the aligned
>>>>>> size of the buffer.
>>>>>>
>>>>>> For example, the higher level protocol (not rpmsg) has 430 bytes as the
>>>>>> max size of a payload. However, cache line alignment is 64-bytes. Then
>>>>>> in that case, the aligned buffer size is 448 bytes. But, that doesn't
>>>>>> mean we can say protocol's MTU size is 448 bytes. If user end up
>>>>>> treating MTU size 448 bytes and use space beyond 430 bytes, then the
>>>>>> higher level apps might discard that data and communication may fail.
>>>>>>
>>>>>
>>>>> How is that scenario different from today's 512 byte buffer size?
>>>>> Most users don't use all 512 bytes and we don't run in the problem
>>>>> described above?
>>>>>
>>>>
>>>> 512 buffer size is hardcoded, so it is enforced on the protocol by the
>>>> framework. But by allowing the configuration of the buffer size we are
>>>> allowing the protocol to decide what the buffer size should be. So, when
>>>> user request the buffer via rpmsg_get_mtu() API, then that should be the
>>>> original buffer size which is expected by the protocol, which may not be
>>>> same as the aligned buffer size.
>>>
>>> Regardless of the buffer size, whether it is set to 512 byte or some arbitrary
>>> value by the remote processsor's firmware, there is a possibility of a
>>> discrepancy with what is expected by the protocol.  Right now rpmsg_get_mtu()
>>> returns 512 regardless of what a protocol uses.  The only thing that should be
>>> important to the protocol is not to exceed that limit.
>>>
>>
>> I think I am missing something. Are you saying that buffer size can not
>> be configured greater than 512 bytes?
> 
> I am not.
> 
> What I am saying is that if alignment is important to a remote processor, it
> should choose the buffer size accordingly.  rpmsg_get_mtu() should return the
> value of the buffer size, exactly the way it is today. 
> 
>>
>> If the higher level protocol (not RPMsg) wants to use 4030 bytes for
>> single packet payload then that is what the MTU size should be. And so
>> the firmware will configure 4030 bytes as single buffer size in the vdev
>> config space. That is why alignment should be treated separately.
>> Because it is not equal to payload size needed by higher level protocol.
> 
> In that case and assuming alignment is required, the buffer size should be 4096
> and rpmsg_get_mtu() should also return 4096.  How a higher protocol uses the
> buffer space is none of our concern.
> 
> Currently, the buffer size is set to 512 and users don't always fill the entire
> buffer.  I don't see why things should be different with a configurable buffer
> size.   
> 
>>
>>>>
>>>> If for internal management we want to treat buffer size = aligned buffer
>>>> size, I am okay. But rpmsg_get_mtu() must give unaligned buffer size
>>>> which is expected by the protocol.
>>>
>>> I agree with the first sentence but not the second.  The only thing protocols
>>> should care about is the start address of a buffer and that its size is
>>> sufficient for what it needs.
>>>

Ack. I am convinced. If we don't see any functional failure then no
point in keeping the complexity. At best, some space will be unused but
that should be okay.

Thanks.

>>>>
>>>> Thanks,
>>>> Tanmay
>>>>
>>>>>> The alignment field is used only to decide where the next buffer start
>>>>>> address is to ease cache operations.
>>>>>>
>>>>>> Sure, we need to maintain this complexity, but I think it's worth it.
>>>>>>
>>>>>
>>>>> The same as in my previous email to Arnaud applies here - is this an
>>>>> immediate requirement of something we think may be happening in the
>>>>> future?
>>>>>
>>>>
>>>> IMHO, vendors will use it if the feature is available, otherwise the
>>>> need to optimize alignment is not easily encountered.
>>>>
>>>>>
>>>>>> Thanks,
>>>>>> Tanmay
>>>>>>
>>>>>>>> + * @txbuf_size:     Tx buf size from remote's view. For Linux this is rx buf size.
>>>>>>>> + * @rxbuf_size:     Rx buf size from remote's view. For Linux this is tx buf size.
>>>>>>>> + *
>>>>>>>> + * This is the configuration structure shared by the device and the driver,
>>>>>>>> + * read when %VIRTIO_RPMSG_F_BUFSZ is negotiated. The fields are laid out so
>>>>>>>> + * the structure is naturally 32-bit aligned.
>>>>>>>> + */
>>>>>>>> +struct virtio_rpmsg_config {
>>>>>>>> +    u8 version;
>>>>>>>> +    __virtio16 size;
>>>>>>>> +    __virtio16 rpmsg_buf_align;
>>>>>>>> +    /* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
>>>>>>>> +    __virtio32 txbuf_size;
>>>>>>>> +    __virtio32 rxbuf_size;
>>>>>>>> +} __packed;
>>>>>>>> +
>>>>>>>> +#endif /* _LINUX_VIRTIO_RPMSG_H */
>>>>>>>> --
>>>>>>>> 2.34.1
>>>>>>>>
>>>>>>
>>>>
>>

