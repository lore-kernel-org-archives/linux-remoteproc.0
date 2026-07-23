Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011028.outbound.protection.outlook.com [52.101.70.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9554A3630B5;
	Thu, 23 Jul 2026 17:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784827648; cv=fail; b=ivbZgpB+aIMFTIF12kWFtRf7FtZWSnhYIl6fnGLDcY3j3wZAAEp77D/AVf8mzA4VX8lo12sCogeR28robtdUFK1RKY8Zgh0PMEdya5sRyVXqdb64t2quVuf1k5mr6sjVn8TgSDN214MAhfDJWiKoVCECQPepfmXkc65rj0FmCCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784827648; c=relaxed/simple;
	bh=5W1zBjeod7dirjfrV0oeYUIAWvF0aOkKhxuUu8UAHIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cZxHRaschxsIiNbK5PvpvHHhzYVGKdc9n9SSvkXlL3qEzyyKeSj2wc2gpE0Vj2Q0x5GSGwqQAa0SWHFW2W6fZ1ruCydOp9s4n1gAhOtzYSWaqB/G3pj8vOBNEGfNqHME3yCZyWkrF5ai0vA0DsTPNHdz2nYqyL8jPz3deDHPu2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=SNaPvAtc; arc=fail smtp.client-ip=52.101.70.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="SNaPvAtc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OwQk6faY4J0FZXgUR81rRGc9u2NEhyjZ4cjTXF4I8sYn4EyeX9ZJ7Ajk4fk/eH7JvqdabhVxIY3qK4bS5z9+HEhZknHDinNzFoxUpckQZKWq+0kDeDw3ncommSnM5nwBM8Sdods/dMyOTYo3rgo9hvYrMN7uSLD84o2EbpXvPNINPf6pvi0fi4OriPcWGOm688GmY7dLcB1SeA0ff2BMs9cjUVLmjSjXM/dAKDJWP7rAeS6B46GDS0ZlMoFjqwoD0IZcGWMrt8O1ahcR/P1wH+tqE40kUFRKcBzLHbhLQCKffKlCDmtrJSfS2pz9TzEyvHC3im3g8CiuUM9cTuWE2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osv1tVPSj3tb4WfhDfMiB4PiC2NFmi06oHFHvz7Az+4=;
 b=OCqOrODwGNcGoGZqengNzG9Zj5Y4p7iMCqbIqa+wATpE/tjo5uS+wofBvbbbMPZ5e05/3ueMjFVl0hFLdGQiHSf8uM4gTH4GDpk74hN9oBC05w4t8n2NwiNJeqU8CyRI3qdq3aGfjtrpw7IpyePY6SAY/YwxbwZRvkOoUm3oyVbt7ufjG53Sux9YQdmsgpoQiRCl3NIpCY7yRRYX51BtDWevtqCQSb0HodrcKPv4D7uh7hf6Gw50IE2hBIZFf7NSQ28DxvljuVrQkvrPF2C0l8gzA1a3BYZqTLWn/dpe3MAK/avw0HMOYdKw+u/DDBruk2PHYj/zP43657nndM5Rlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=osv1tVPSj3tb4WfhDfMiB4PiC2NFmi06oHFHvz7Az+4=;
 b=SNaPvAtcx4dAtN5D04CyPUVYZov4iHHgZoV4Ex6aqPhRX2QvlhsJ5rAuHG1a3YfoTmrB5gRjDkCJ2v3KVMxm3bjJmkfT/BOeP6nGKRu+pEhs2BbeEPzQo+98hg++iTxWGHj5wHtqR7+7RdwjZK88Ec20khJg9mK+mfpKlWZlqB2+M8HM+HjGkMWIQdPWHh/nHM1ECPVb7O3bOtjEn1jHSuu1dBvdV7lA0KZLEfutrkePwOgOgMIBJ1ulMgnrKh8gPo019o9BgsTYZqscHC7Vaex8fjRZJDglOtOHAQ4QGcip2LnHRfZWCMO/FDYVyLlEkFtKFKg/lnIPHJ7e8wcc0g==
Received: from DU2P250CA0030.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::35)
 by AMBPR10MB9705.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:763::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 17:27:20 +0000
Received: from DB1PEPF00039234.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::88) by DU2P250CA0030.outlook.office365.com
 (2603:10a6:10:231::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Thu,
 23 Jul 2026 17:27:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF00039234.mail.protection.outlook.com (10.167.8.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Thu, 23 Jul 2026 17:27:20 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 23 Jul
 2026 19:31:57 +0200
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 23 Jul
 2026 19:27:19 +0200
Message-ID: <c6826750-03b3-4ad6-9f88-394b0234ec27@foss.st.com>
Date: Thu, 23 Jul 2026 19:27:17 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] rpmsg: virtio_rpmsg_bus: get buffer size from
 config space
To: Mathieu Poirier <mathieu.poirier@linaro.org>
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
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <CANLsYkzCKpNG-2W24EA1FEjEEr1J+w6VvM=sPwr8wMRDNqm9jg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00039234:EE_|AMBPR10MB9705:EE_
X-MS-Office365-Filtering-Correlation-Id: d3e12aa3-be31-4fda-0ab9-08dee8dfa691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|56012099006|10067099003|11063799006|4143699003|6133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DjokdZCj19rp0f8s3y2h0vIPHBSWSQ0m/VTXcPkr/rHQJ8rE3iF1TffD0KDUuX5nXNuRKJnfenTG3Y8b5hPHfVAMLlrrxP6F//Up/WVjZz2l2RKa11ii0gRVGNtiu2NJ809VotvaRDmC3eBXXbV31yyAdIKjViiEGTh9lwDKjJzSQ6NkwayF8hxZLRxces2Gzs5oAbRNL78buNZE368QxhZ8kzUDd4H3VpOlVzuTzhLXj0LSxY0/rOW690uOD623R0jJSBqDMqZAfZnSrBZjqBjl43Ac/yjx8a3KQBWsRQ0Tv84PpLqKjoaSkiTgfOgWP2WTqyV9lkb81KyEO8soDh1P58Tc73Uw9w1C0kf5OdRrKsOtDtkRs+lbuDIiH65+DjHaYBRjcTueEwlE9g8hh1Xcp1CtDFl8xhP71L9iEy0Gy1Fuatqttymzcy9nZikjK6Usj3MxYf05qLxM5tojC7G53kLZ3jTSvsr0wkloH3J81zAbyHGsiyGXl2GNWnLpjQR101U5Yk0mdc7uktLonTqEaqFcgrVeFRbpx5Qf+z9kQnGhxrY8vO1uDEn/7m6j2c9d0wcgtcMNbekeMnCiKnEgDXpNz/H38GArKR0VBo6QQRZTYCufXMGlx/I4Knjj9jTTF8YbMICxgObMTkeLCQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(56012099006)(10067099003)(11063799006)(4143699003)(6133799003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ueidhQ8Bqx2f1u1AX52+B/LeqzLAt51Naqg9t1Hd23UEQ2TbQD6ODlW2mHYFcu0iGTHgbpkOFJaS+p6eBqk3R6xJS+X0yu/HOvlbVa1Y7a4xzR84/CdBL900hdiZCgzgADefTuXamS2hgv/qDJwHN4r/SEqoZj/7y4DBZgG9mTxFm4s+rxv7P0Qq+fhMPMAsRKHQQheJGRSQwMjN7rUijiQqV0JMS6Xo/9IQcYtomfdfoQz3AZ+czsIosiWsvKRkvXssE3HEf1UVkGq4Sl437HiWO/aqzycJixMGm8n170yusrFBBEglfe9r0AlIG1bw9NW02Oc4mEEVCQvo620ejjFKn7/e6K9wPBasMdc51ofFGpzl9/tKSQYyMk+Zmhp0xu6SRV658jU8w10wVdHUsyXWiMEUceytpOr2ruIukadNU13W1GHWRn57b+Valy/b
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 17:27:20.1935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3e12aa3-be31-4fda-0ab9-08dee8dfa691
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039234.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR10MB9705



On 7/23/26 16:13, Mathieu Poirier wrote:
> On Thu, 23 Jul 2026 at 03:11, Arnaud POULIQUEN
> <arnaud.pouliquen@foss.st.com> wrote:
>>
>> Hello Mathieu,
>>
>> On 7/22/26 16:49, Mathieu Poirier wrote:
>>> On Tue, Jul 21, 2026 at 11:02:13AM -0500, Shah, Tanmay wrote:
>>>>
>>>>
>>>> On 7/21/2026 10:50 AM, Mathieu Poirier wrote:
>>>>> On Thu, Jul 16, 2026 at 11:12:55AM -0500, Shah, Tanmay wrote:
>>>>>>
>>>>>>
>>>>>> On 7/16/2026 10:48 AM, Mathieu Poirier wrote:
>>>>>>> On Wed, 15 Jul 2026 at 11:28, Shah, Tanmay <tanmays@amd.com> wrote:
>>>>>>>>
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> Please find my response below:
>>>>>>>>
>>>>>>>> On 7/15/2026 11:24 AM, Mathieu Poirier wrote:
>>>>>>>>> On Fri, Jul 10, 2026 at 12:28:29PM -0700, Tanmay Shah wrote:
>>>>>>>>>> 512 bytes isn't always suitable for all case, let firmware
>>>>>>>>>> maker decide the best value from resource table.
>>>>>>>>>> enable by VIRTIO_RPMSG_F_BUFSZ feature bit.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>>>>>>>>> ---
>>>>>>>>>> Changes in v5:
>>>>>>>>>>
>>>>>>>>>>     - fix documentation about alignment of the buffer size
>>>>>>>>>>     - change version field from u16 to u8
>>>>>>>>>>     - remove buffer alignment check
>>>>>>>>>>     - Separate buffer alignment vs MTU of a single buffer
>>>>>>>>>>     - Use buffer alignment only to get next buffer address at alignment
>>>>>>>>>>       boundary
>>>>>>>>>>
>>>>>>>>
>>>>>>>> [...]
>>>>>>>>
>>>>>>>>>> +#ifndef _LINUX_VIRTIO_RPMSG_H
>>>>>>>>>> +#define _LINUX_VIRTIO_RPMSG_H
>>>>>>>>>> +
>>>>>>>>>> +#include <linux/types.h>
>>>>>>>>>> +#include <linux/virtio_types.h>
>>>>>>>>>> +
>>>>>>>>>> +/* The feature bitmap for virtio rpmsg */
>>>>>>>>>> +#define VIRTIO_RPMSG_F_NS   0 /* RP supports name service notifications */
>>>>>>>>>> +#define VIRTIO_RPMSG_F_BUFSZ        1 /* RP get buffer size from config space */
>>>>>>>>>> +
>>>>>>>>>> +/* Version of struct virtio_rpmsg_config understood by this driver */
>>>>>>>>>> +#define RPMSG_VDEV_CONFIG_V1        1
>>>>>>>>>> +
>>>>>>>>>> +/**
>>>>>>>>>> + * struct virtio_rpmsg_config - config space for rpmsg virtio device
>>>>>>>>>> + *
>>>>>>>>>> + * @version:        version of this structure, currently %RPMSG_VDEV_CONFIG_V1.
>>>>>>>>>> + * @size:   size of this structure in bytes.
>>>>>>>>>> + * @rpmsg_buf_align: alignment in bytes for each buffer. Must be a power of
>>>>>>>>>> + *               two. If 0 then no alignment will be done. This alignment
>>>>>>>>>> + *               will not decide actual size of the buffer but will be
>>>>>>>>>> + *               used to decided the start address of the buffer. The
>>>>>>>>>> + *               actual size of the buffer can be different than the
>>>>>>>>>> + *               aligned size of the buffer.
>>>>>>>>>
>>>>>>>>> Is there really a need to have a buffer size different from its alignment?  It's
>>>>>>>>> not like the (small) delta between the buffer size and its alignment will be
>>>>>>>>> used for something else.  I'm fine with a buffer alignment requirement but in
>>>>>>>>> those cases, the firmware should set the size of the buffer in accordance with
>>>>>>>>> its alignment requirement.  Otherwise, the complexity needed to manage the
>>>>>>>>> discrpancy between the two yields a driver that is hard to maintain and prone to
>>>>>>>>> bugs.
>>>>>>>>>
>>>>>>>>
>>>>>>>> I had the same concern before. However, following example changed my mind:
>>>>>>>>
>>>>>>>> So, a single buffer size is the MTU size of a packet for the protocol
>>>>>>>> supported by the firmware. Now that can be different than the aligned
>>>>>>>> size of the buffer.
>>>>>>>>
>>>>>>>> For example, the higher level protocol (not rpmsg) has 430 bytes as the
>>>>>>>> max size of a payload. However, cache line alignment is 64-bytes. Then
>>>>>>>> in that case, the aligned buffer size is 448 bytes. But, that doesn't
>>>>>>>> mean we can say protocol's MTU size is 448 bytes. If user end up
>>>>>>>> treating MTU size 448 bytes and use space beyond 430 bytes, then the
>>>>>>>> higher level apps might discard that data and communication may fail.
>>>>>>>>
>>>>>>>
>>>>>>> How is that scenario different from today's 512 byte buffer size?
>>>>>>> Most users don't use all 512 bytes and we don't run in the problem
>>>>>>> described above?
>>>>>>>
>>>>>>
>>>>>> 512 buffer size is hardcoded, so it is enforced on the protocol by the
>>>>>> framework. But by allowing the configuration of the buffer size we are
>>>>>> allowing the protocol to decide what the buffer size should be. So, when
>>>>>> user request the buffer via rpmsg_get_mtu() API, then that should be the
>>>>>> original buffer size which is expected by the protocol, which may not be
>>>>>> same as the aligned buffer size.
>>>>>
>>>>> Regardless of the buffer size, whether it is set to 512 byte or some arbitrary
>>>>> value by the remote processsor's firmware, there is a possibility of a
>>>>> discrepancy with what is expected by the protocol.  Right now rpmsg_get_mtu()
>>>>> returns 512 regardless of what a protocol uses.  The only thing that should be
>>>>> important to the protocol is not to exceed that limit.
>>>>>
>>>>
>>>> I think I am missing something. Are you saying that buffer size can not
>>>> be configured greater than 512 bytes?
>>>
>>> I am not.
>>>
>>> What I am saying is that if alignment is important to a remote processor, it
>>> should choose the buffer size accordingly.  rpmsg_get_mtu() should return the
>>> value of the buffer size, exactly the way it is today.
>>
>> Did you get a chance to look to my previous reply [1]?
>>
> 
> Unfortunately I haven't had the opportunity to reach that point in my Inbox.
> 
>>   From my understanding, due to the Virtio specification, we cannot
>> guarantee that
>> the buffer size will not be updated by the main processor. Having an
>> alignment
>> field ensures that the main processor takes the remote processor’s
>> constraints
>> into account if it updates the RPMsg buffer size.
>>
> 
> Where does the main processor change the buffer size?

Linux does not, but any main processor may do so, consistent with the
Virtio specification. If requested in OpenAMP with a valid usecase, no
reason to reject if it is not specified that it is not possible.

What we define here will probably become the reference for all RPMsg 
implementations...

> 
>> That said, if we decide to remove the alignment field, we must clearly
>> document the constraints for the RPMsg Virtio config space:
>>
>> - virtio_rpmsg_config cannot be changed by the Virtio driver.
>> - the sizes must respect the device and driver alignment constraint.
>>
> 
> If the size chosen by the device isn't compatible with what the driver
> can accommodate, then initialization simply fails.
> 
>> This is not my preferred solution,because that means that the remote
>> processor has
>> to know the alignment constraints of the main processor.
>>
> 
> It would have to anyway wouldn't it? 

I think I was wrong about this last argument. Since the main processor
allocates the buffers, it can apply its own alignment constraints,so the 
remote processor does not need to know them.

That makes the option without an alignment field acceptable to me,
if restrictions are documented.

Here are the constraints that I would like to see documented (not
necessary using the exact terms) in Linux and OpenAMP to make the usage
clear for the RPMsg virtio config space:
- The virtio driver must not update the config space.
- The virtio driver can allocate a memory area equal to or greater than
   the RX/TX message size specified by the device. The effective RX/TX size
   remains the one requested by the device.
- The virtio device should specify sizes that respect its own alignment
   constraints.

Does this would be acceptable to you?
Regards,
Arnaud

> 
>   And as I said from the beginning, this is not something that has come
> up in the 20 years this subsystem existed.  There is no point in
> adding all this complexity for a something that _may_ happen.
> 
>> [1]https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2643398.html
>>
>> Regards,
>>
>> Arnaud
>>>
>>>>
>>>> If the higher level protocol (not RPMsg) wants to use 4030 bytes for
>>>> single packet payload then that is what the MTU size should be. And so
>>>> the firmware will configure 4030 bytes as single buffer size in the vdev
>>>> config space. That is why alignment should be treated separately.
>>>> Because it is not equal to payload size needed by higher level protocol.
>>>
>>> In that case and assuming alignment is required, the buffer size should be 4096
>>> and rpmsg_get_mtu() should also return 4096.  How a higher protocol uses the
>>> buffer space is none of our concern.
>>>
>>> Currently, the buffer size is set to 512 and users don't always fill the entire
>>> buffer.  I don't see why things should be different with a configurable buffer
>>> size.
>>>
>>>>
>>>>>>
>>>>>> If for internal management we want to treat buffer size = aligned buffer
>>>>>> size, I am okay. But rpmsg_get_mtu() must give unaligned buffer size
>>>>>> which is expected by the protocol.
>>>>>
>>>>> I agree with the first sentence but not the second.  The only thing protocols
>>>>> should care about is the start address of a buffer and that its size is
>>>>> sufficient for what it needs.
>>>>>
>>>>>>
>>>>>> Thanks,
>>>>>> Tanmay
>>>>>>
>>>>>>>> The alignment field is used only to decide where the next buffer start
>>>>>>>> address is to ease cache operations.
>>>>>>>>
>>>>>>>> Sure, we need to maintain this complexity, but I think it's worth it.
>>>>>>>>
>>>>>>>
>>>>>>> The same as in my previous email to Arnaud applies here - is this an
>>>>>>> immediate requirement of something we think may be happening in the
>>>>>>> future?
>>>>>>>
>>>>>>
>>>>>> IMHO, vendors will use it if the feature is available, otherwise the
>>>>>> need to optimize alignment is not easily encountered.
>>>>>>
>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Tanmay
>>>>>>>>
>>>>>>>>>> + * @txbuf_size:     Tx buf size from remote's view. For Linux this is rx buf size.
>>>>>>>>>> + * @rxbuf_size:     Rx buf size from remote's view. For Linux this is tx buf size.
>>>>>>>>>> + *
>>>>>>>>>> + * This is the configuration structure shared by the device and the driver,
>>>>>>>>>> + * read when %VIRTIO_RPMSG_F_BUFSZ is negotiated. The fields are laid out so
>>>>>>>>>> + * the structure is naturally 32-bit aligned.
>>>>>>>>>> + */
>>>>>>>>>> +struct virtio_rpmsg_config {
>>>>>>>>>> +    u8 version;
>>>>>>>>>> +    __virtio16 size;
>>>>>>>>>> +    __virtio16 rpmsg_buf_align;
>>>>>>>>>> +    /* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
>>>>>>>>>> +    __virtio32 txbuf_size;
>>>>>>>>>> +    __virtio32 rxbuf_size;
>>>>>>>>>> +} __packed;
>>>>>>>>>> +
>>>>>>>>>> +#endif /* _LINUX_VIRTIO_RPMSG_H */
>>>>>>>>>> --
>>>>>>>>>> 2.34.1
>>>>>>>>>>
>>>>>>>>
>>>>>>
>>>>
>>>
>>

