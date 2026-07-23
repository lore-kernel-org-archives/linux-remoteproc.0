Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013049.outbound.protection.outlook.com [52.101.83.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5AD3EDE77;
	Thu, 23 Jul 2026 09:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784797866; cv=fail; b=ZgeL4vW8922Od8xz0CcjtHTtzJlBQrIx8zYuDJ6CwHN8f41nyMRLKrNn/LyE1/eLGPdxLDFl3a85VZvkFyjBfFQvRM+vL/E0lmohTF3jXMK3Ft20LSoNeNOm1jBZsZccrMW3TAfYdMTDEZ1BXrGJMQvPsgEMF5ob4/17jkXtCCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784797866; c=relaxed/simple;
	bh=jQkRh7oooEc5wJ2RVvLAoQX8rjRnsag894NW/A+K2Js=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KeETni5wGYdNxKJ0J6t90gz/iLmXsVriXMuyMw0gImnZvKiNHHj6ulzUn4sVNlt9H3sYCuxr7ABxRR7tW4OU/jF5Cgygkr4dmSDcy5hkxk9C1ODz+IaHizw0LqCHesrn/bhBOvKcqVKa2cz9zYvUsujPww7a/BnKLBTvJxMRJd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=a5VqpfVL; arc=fail smtp.client-ip=52.101.83.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="a5VqpfVL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hr3uidjaGYlb8K4uKvgJbJsH5wiD/IZyFEL4p8qCryOjndDIZpJHXziuKQx6hUkbFu8mO/e1AHyCucZ23bo22Crxe7rMCTfA0bf65H4CNb+5fUxRV5z6eZG/ShrAgECBZUnk5QaC/YonVSQ0JNW9aKt/rL1HG2FR/w6fTc4Rxvmyw1zdietDEN5olV1QJA1MX0jQXc3KamuAzBJ8bMWg8GxyN5tOzriQGQwb6Rs5qV4aD+9IwsAGeRje3y9uRUWoNWZn/LbPI2Uu0InwR9Azd7QfLsDxw7AnhyFzez6QaFl75PJonJGQnH87Gpr1u8ITpj8I1NWr2lQe/oqwOjIlhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3Y9fR2GPYG7OGtnF7givQljRIKF6E0OZ8S06RnFkaI=;
 b=mxalebjZTJi7fLr8hJUVhWeLAMYESKzfqHXYnHrU5gE7OHTVODASnt0l02K12NSBGKjpmH/8fUqh2KLn53XW7T6QxiCYCSOlYsbY4/P5+bGTwtQyobhL4kzGbWNiRR3KAFSX+bUGIJT6VxLkWNgi1sfyvU+2dObtjGyNqb+z/xw1adh2Ze/aoAgXmtQAZ+fwXVNUz9HSsHSU/I9oKFtOc0l5DonPBfnCq2iOG3r+fFgd8TbJEemRzi75zpbSCXuAa2VQwN511EuFRyLi97JhvRsjI/VZsQwBSKd/Mw1IfW018I6OrCG1paFRoKzQoJGJ0PJtjcZNYs1VAFAguxpssw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3Y9fR2GPYG7OGtnF7givQljRIKF6E0OZ8S06RnFkaI=;
 b=a5VqpfVLfTXBStPXPJqHcAQYR5CfESTBup/qJzhh7vgvIGJZ5hp6j4JPr8uOh+1WBXw68nQ/ZVXjRT4+C8XUirsma6tIBmsqUYWlrXlZFKkKKO9/DAzCSX5aAqt/USxalJtBWO3IirXGbAImxNbFnWDgnboKdgqza9yWOdpL9cdvlu67GLvQPQ8nhLudRiiVkbAZST7b0fco3d/YlJQMTPhu6O7LFu+bwk4JsgN8z5l5h4XtKLWnMqqN2sSvfdPLiLIM1FqhHio+ZpB5R1Otd5RhkxLwXRIeA8ZyILzGPNulSlkoOLlhRxEN9U0viLVd6s6GONFK/5wi89o9Lnji4w==
Received: from DUZPR01CA0036.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::14) by AS4PR10MB5173.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:4c1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 09:10:54 +0000
Received: from DU6PEPF0000B61B.eurprd02.prod.outlook.com
 (2603:10a6:10:468:cafe::81) by DUZPR01CA0036.outlook.office365.com
 (2603:10a6:10:468::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Thu,
 23 Jul 2026 09:10:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000B61B.mail.protection.outlook.com (10.167.8.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 09:10:53 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 23 Jul
 2026 11:16:06 +0200
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 23 Jul
 2026 11:10:52 +0200
Message-ID: <c1d24c44-8daf-48bc-9785-7ab394353356@foss.st.com>
Date: Thu, 23 Jul 2026 11:10:52 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <amDYiyTFFLkkTv5K@p14s>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61B:EE_|AS4PR10MB5173:EE_
X-MS-Office365-Filtering-Correlation-Id: b1c42438-9cc9-4d66-b13f-08dee89a4c88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|30052699003|23010399003|376014|4143699003|56012099006|11063799006|3023799007|10067099003|13003099007|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	1pUltMofgMhC5KdE5ymcPDi1eFONSodkBL+upA3Ch9j91hYHGQtpsxghmDOF4+qlHdVowwYzPXJSmnjyNFT973IdEVhZngr4FENGaadhHg2BP7bY8SGBMW62OUgKRr25lrW91sXdVClHOPsVQ2582O1rfiksqCf0tgnI5fginmYI20dbqO2+loKyhzQQ0FGg5aCAyHViNV8J/Qfh/f9rqkac+a7eaBkqwzdZXOWYiMlJ5c9BA7UwXNNaanieSBF1x8EBId7GprJcmN2s5fKyGSvcV+ifJum9OXins6ZDvAqB6hcJ60QcwUTwnXQ0Rw6G1HiOT0cBlTJ9NqqMmp3fAgAwFFoIAQV4AEPY9Jl+L2xUIDtnXR47Rz8Ebt4DoSRpJaE2QrquFvLPCyV8HR1qgYNMGSIuLt5jols8ylNQ/RLQarS0Zbbts9cDqYdVhDHf6zLzETRI5z6UwwS0YPVeEPG9pkRds0X0z+CyMFc8drnGeDidMrKxcS2WYVZsszw0rWKRasaZRnvj/U23qm33Fas1PpIng4hryDf9fRnUdSNil0Qg9aOLVcsTDoLXIIofau53z/RkD98OU5JN+UPgQ/GMt4VQS2iXhe11577gsOfwRMEzYGC3VvAo+8SCoyLZRjJDaPyr26Mn9GUTy2mAzrnednmtIcT3hYEzRd16N3g=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(30052699003)(23010399003)(376014)(4143699003)(56012099006)(11063799006)(3023799007)(10067099003)(13003099007)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	b0amxnzLciIZ/Ve2Q8/uRY5CeNWS+QumEuYUGfJMJCSRQhff8OGVlguHlxwB0flmFPifyRV47vXh19pqvG+3DFt/24hoxV95zForL3hu18oMm3v/LmDlHVPFxT86s1F/wkZLleiMDrSkwQlOVtpdiHm+M5e0FYHUqA3FFnCI+Ux6xDVNufS/L0OHaG6mlYVhh+AgElYUGwynurjfnGiZhK2QEJ4nITCZZod1xzxVIwj0xsDHCVRJ8D5Ssashx/gwOnWFoWdM8wLmVsD5TKXouCWcgfx/zrFGAiAfaLzlJrgN+f+CJGsNXxs3dOyDX6QKN3puPNGnZSZjwpPKsKrs7Vjcy+OVvY4HokTePbXjfwlTWJf31aj/tAPOBCAxyAAOVhO4rnCm01zBDSKlXR7JPBqdl+Zfs/LPaPzmxgwtjUz2mfMso+dtK9Wd0S0gwkJN
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 09:10:53.8613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c42438-9cc9-4d66-b13f-08dee89a4c88
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5173

Hello Mathieu,

On 7/22/26 16:49, Mathieu Poirier wrote:
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
>>>>>>>>    - fix documentation about alignment of the buffer size
>>>>>>>>    - change version field from u16 to u8
>>>>>>>>    - remove buffer alignment check
>>>>>>>>    - Separate buffer alignment vs MTU of a single buffer
>>>>>>>>    - Use buffer alignment only to get next buffer address at alignment
>>>>>>>>      boundary
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

Did you get a chance to look to my previous reply [1]?

 From my understanding, due to the Virtio specification, we cannot 
guarantee that
the buffer size will not be updated by the main processor. Having an 
alignment
field ensures that the main processor takes the remote processor’s 
constraints
into account if it updates the RPMsg buffer size.

That said, if we decide to remove the alignment field, we must clearly
document the constraints for the RPMsg Virtio config space:

- virtio_rpmsg_config cannot be changed by the Virtio driver.
- the sizes must respect the device and driver alignment constraint.

This is not my preferred solution,because that means that the remote 
processor has
to know the alignment constraints of the main processor.

[1]https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2643398.html

Regards,

Arnaud
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
> 

