Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011055.outbound.protection.outlook.com [40.93.194.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6383371868;
	Thu, 16 Jul 2026 16:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784218385; cv=fail; b=D7TuzjKpU2I6LLW8fm93Xpwr7EJGb3PLvhMaw7Pd5RWaz/IqkfdnkILoNpQKABmHA3zRip6O4K1eT9aedfLCG8dXaKWd61BDJladBaz/bNJxO3gJuuP7ijTMAZHTcV/TljewUrZzlaqrwBwQGBfuE6HKbKjGejPUjZzxGgLmXrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784218385; c=relaxed/simple;
	bh=3BCStsLUZ6xYAF9CpxUHI+cHcBsF96QALImTGLenk4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nLjBKMDRZD7hl+mzeKhjVJi1RyG1q3joADazCL2QeY5r8wRNiUJa1fSjxiI9lNfLdakgkWcXzNqvNATJ40OAqkvsfL213j8UKt1gPfTwpYvbKnnhM0GUTVc8B1Fs8p73iQjZTDnPyvTLWttsJCcbMQSYIcKw678qKmqCpd1Ch5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JtJyTkLa; arc=fail smtp.client-ip=40.93.194.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JtJyTkLa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vSHg1Aa9i8NcDLK7L5eSxeoNYv71tww8oCa2Lr8CCDl5DASCquMHoav3YnINUeor0lByFoSBKJXOoBxeGclGwvF3GbWaEwUNMOr5fD2Vum7ag0GIAez7jubWlphKbTPABhLIet2SAuaL2ieifmGyEV7gfBmI2fyujpcyj8Pojzgb/y2ITUebHAsmOTadMGoTFWT2rWlXj0dVtGfMZEnY4E5fT4lF94Z1UxH/Ouyo0fNySwTEw2SFJT7w7pm8I7PQkmMz8G8t3Upd5Pdz4uz5wTr/14T3kzRQDiU8OMWJUteI7LOIKAZP+jy9PYVj/zZT9gNV4as93Kfh/Nl0ufuLiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sCjGMVL5nS3yWxmnUujLSO5BXf4UrBrnFZKxW1T5sEg=;
 b=RNrVKMGUJp7ZQIaYm2F831SiB+LSMKdg4ZGkNeB9ev9JgqHj7zPGhd+kY231pDau+jaq3oA/+I7vDGtKKvF11SZGES4uxOSUTjF+YUfDE4oB/LQa6cIsBv3ysMrAut0RKg93QKHeTgJsICOZn9jvIF87cdLwv+4Go7kVYMHop9kNSwLBjVvU23x/8SFtvuARuUFwEgz1Et8MCSO+iff7jRjoURyHvpmx6N7mkDZgamdrQtXIsl/bn//487InSys574UK3Ukdy2s+TL6taCwx8vfHAn7Yk8RTyKD0y+NtktoQBenZ63Jq04cLLCcxJIn7blttieznQadnEf7ufEuoyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sCjGMVL5nS3yWxmnUujLSO5BXf4UrBrnFZKxW1T5sEg=;
 b=JtJyTkLaQkf32xTM1K1V7tkid8NBIeIQ41V/F4LtxHKkjXCcKD7osIgU/Cm+/WGBZpEvPUA7/ZSm8VTiAVqQtXK25ovjXWNfGVwnpit/iwPL66WE578hliLkLa8VGlWUvymEJxJreZfn+RcpSnY8b/D7PAQIOnnVkcTsTa/2OXg=
Received: from CH2PR03CA0006.namprd03.prod.outlook.com (2603:10b6:610:59::16)
 by CY5PR12MB6180.namprd12.prod.outlook.com (2603:10b6:930:23::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 16:12:56 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::3) by CH2PR03CA0006.outlook.office365.com
 (2603:10b6:610:59::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Thu,
 16 Jul 2026 16:12:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Thu, 16 Jul 2026 16:12:56 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 16 Jul
 2026 11:12:56 -0500
Received: from [172.31.134.241] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 16 Jul 2026 11:12:55 -0500
Message-ID: <c8f62152-fb7b-4771-87d7-9420c7e3f452@amd.com>
Date: Thu, 16 Jul 2026 11:12:55 -0500
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
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <CANLsYkyL8_YSb39QqbC0Z+udahMtCV1e+OeoKGvmGSxQ6h3_qA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|CY5PR12MB6180:EE_
X-MS-Office365-Filtering-Correlation-Id: 4effd54a-fef0-468c-fa8c-08dee355192d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|10067099003|6133799003|11063799006|4143699003|56012099006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mHpl4gzB6vU988AoDWrmNMciq9gnSWzNWFiusXFsrrCD8TqIdcu5OyxfwqisK6PKtHOW/Dx0cvVm9iTrfhxzxCjbuWSTpMZUq5ORsFz1crTKPyL1zQVXISTZ6T5mzT8WJ0BMMBzXKEjM1Q2qWDT5E4apuZavkkkuEfUpj63sPu9LSmRRYpu9ch4E9fdS8u49nmAuZfhsLsv/MBoMkHMqmVywkYnlRxkaiv2ljsA4nfgeQqZHyrAtyqx+zy1sJkEYfpTt4SRqBzw/1EjbAIoSbfqcTUJ2iU9EmsCKOeqo1mUzPgaTE8yWGBc67KEhojwkbGhB8S7VhU7yCYfqRzNHE7PLCCPJOmF81WJ+u7/QPqRG+fxNDAATbXaahaPAe0PtieXM/s/53T3egoiSI5E9+D92XV6sXabgZ+wJJO75USxAPBq+3U9HqRL6NAhvs0+IvYe1QMbtW5Lg2gXQzkS6akeUL0ruPJH2YyOHw1mxZTCnA8zbqJfNxeC8jUPybqZmi9xh/CYrfupD9sd9HQNKz2pCHqmfLfbsP6eTjI+X0tR3T4JjENwf8f/tOS85JHsB8f/3v6oCo1JTzDrfX8tR1u6O4n3t9cTnVg+ZwxiVtQHIlSM4Ux9vJ4Bup/vpePd5vZ/idPjl4Q47nXr9KWlIziHVYY77xF+OqZT5fx0crSBzg5GXOElBsrlUAkEyyoIbtA4pJO5bGOMXy+D11XJBgg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(10067099003)(6133799003)(11063799006)(4143699003)(56012099006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	C6625GZKq7cgKInUtIIjB2jBx10vqM8pRYQ/6VnbsPQAi5b8L2Tgi4gZby/PnQM2sHhCoPowAW0i/1P6RmjTEk83pZ1NdouVmBGFkgcgVTS4N4vRrf60JIPe69URV859nKPu7nwbtJKnaY8Pe2yjO6p9ayJ2DawfHUVyeeX0+24ScoBUcsLd3r7m4/u3DWfIBJThC0sulbRQkhOPXC+T2DcJL1fnqFtD1czowrduVlM/qDaHfM8au5vqzoTG4OJS3/vygpzixE970OcQGlBTfolDcUdtxq4a/N3CR/cwWNf3i2EyCBsAdj+QY5HminO92RWAb3Di9kb7ixpiPaIBtwv4S/+ZQ8F0PI+vVPMAfOh6e8CAfWAtm4cKGzJD1vRjWZ4kC87xLKa7Kd9kKke2LIEwch4eFL14b/NFj2BkvUyKCsjqWuoEsEA4XQQxihH4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 16:12:56.6826
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4effd54a-fef0-468c-fa8c-08dee355192d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6180



On 7/16/2026 10:48 AM, Mathieu Poirier wrote:
> On Wed, 15 Jul 2026 at 11:28, Shah, Tanmay <tanmays@amd.com> wrote:
>>
>> Hi,
>>
>> Please find my response below:
>>
>> On 7/15/2026 11:24 AM, Mathieu Poirier wrote:
>>> On Fri, Jul 10, 2026 at 12:28:29PM -0700, Tanmay Shah wrote:
>>>> 512 bytes isn't always suitable for all case, let firmware
>>>> maker decide the best value from resource table.
>>>> enable by VIRTIO_RPMSG_F_BUFSZ feature bit.
>>>>
>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>>> ---
>>>> Changes in v5:
>>>>
>>>>   - fix documentation about alignment of the buffer size
>>>>   - change version field from u16 to u8
>>>>   - remove buffer alignment check
>>>>   - Separate buffer alignment vs MTU of a single buffer
>>>>   - Use buffer alignment only to get next buffer address at alignment
>>>>     boundary
>>>>
>>
>> [...]
>>
>>>> +#ifndef _LINUX_VIRTIO_RPMSG_H
>>>> +#define _LINUX_VIRTIO_RPMSG_H
>>>> +
>>>> +#include <linux/types.h>
>>>> +#include <linux/virtio_types.h>
>>>> +
>>>> +/* The feature bitmap for virtio rpmsg */
>>>> +#define VIRTIO_RPMSG_F_NS   0 /* RP supports name service notifications */
>>>> +#define VIRTIO_RPMSG_F_BUFSZ        1 /* RP get buffer size from config space */
>>>> +
>>>> +/* Version of struct virtio_rpmsg_config understood by this driver */
>>>> +#define RPMSG_VDEV_CONFIG_V1        1
>>>> +
>>>> +/**
>>>> + * struct virtio_rpmsg_config - config space for rpmsg virtio device
>>>> + *
>>>> + * @version:        version of this structure, currently %RPMSG_VDEV_CONFIG_V1.
>>>> + * @size:   size of this structure in bytes.
>>>> + * @rpmsg_buf_align: alignment in bytes for each buffer. Must be a power of
>>>> + *               two. If 0 then no alignment will be done. This alignment
>>>> + *               will not decide actual size of the buffer but will be
>>>> + *               used to decided the start address of the buffer. The
>>>> + *               actual size of the buffer can be different than the
>>>> + *               aligned size of the buffer.
>>>
>>> Is there really a need to have a buffer size different from its alignment?  It's
>>> not like the (small) delta between the buffer size and its alignment will be
>>> used for something else.  I'm fine with a buffer alignment requirement but in
>>> those cases, the firmware should set the size of the buffer in accordance with
>>> its alignment requirement.  Otherwise, the complexity needed to manage the
>>> discrpancy between the two yields a driver that is hard to maintain and prone to
>>> bugs.
>>>
>>
>> I had the same concern before. However, following example changed my mind:
>>
>> So, a single buffer size is the MTU size of a packet for the protocol
>> supported by the firmware. Now that can be different than the aligned
>> size of the buffer.
>>
>> For example, the higher level protocol (not rpmsg) has 430 bytes as the
>> max size of a payload. However, cache line alignment is 64-bytes. Then
>> in that case, the aligned buffer size is 448 bytes. But, that doesn't
>> mean we can say protocol's MTU size is 448 bytes. If user end up
>> treating MTU size 448 bytes and use space beyond 430 bytes, then the
>> higher level apps might discard that data and communication may fail.
>>
> 
> How is that scenario different from today's 512 byte buffer size?
> Most users don't use all 512 bytes and we don't run in the problem
> described above?
> 

512 buffer size is hardcoded, so it is enforced on the protocol by the
framework. But by allowing the configuration of the buffer size we are
allowing the protocol to decide what the buffer size should be. So, when
user request the buffer via rpmsg_get_mtu() API, then that should be the
original buffer size which is expected by the protocol, which may not be
same as the aligned buffer size.

If for internal management we want to treat buffer size = aligned buffer
size, I am okay. But rpmsg_get_mtu() must give unaligned buffer size
which is expected by the protocol.

Thanks,
Tanmay

>> The alignment field is used only to decide where the next buffer start
>> address is to ease cache operations.
>>
>> Sure, we need to maintain this complexity, but I think it's worth it.
>>
> 
> The same as in my previous email to Arnaud applies here - is this an
> immediate requirement of something we think may be happening in the
> future?
> 

IMHO, vendors will use it if the feature is available, otherwise the
need to optimize alignment is not easily encountered.

> 
>> Thanks,
>> Tanmay
>>
>>>> + * @txbuf_size:     Tx buf size from remote's view. For Linux this is rx buf size.
>>>> + * @rxbuf_size:     Rx buf size from remote's view. For Linux this is tx buf size.
>>>> + *
>>>> + * This is the configuration structure shared by the device and the driver,
>>>> + * read when %VIRTIO_RPMSG_F_BUFSZ is negotiated. The fields are laid out so
>>>> + * the structure is naturally 32-bit aligned.
>>>> + */
>>>> +struct virtio_rpmsg_config {
>>>> +    u8 version;
>>>> +    __virtio16 size;
>>>> +    __virtio16 rpmsg_buf_align;
>>>> +    /* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
>>>> +    __virtio32 txbuf_size;
>>>> +    __virtio32 rxbuf_size;
>>>> +} __packed;
>>>> +
>>>> +#endif /* _LINUX_VIRTIO_RPMSG_H */
>>>> --
>>>> 2.34.1
>>>>
>>

