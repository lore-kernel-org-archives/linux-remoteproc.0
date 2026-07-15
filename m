Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011018.outbound.protection.outlook.com [40.107.208.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E9E48BD5D;
	Wed, 15 Jul 2026 17:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784136519; cv=fail; b=VfFzZtoaiy5Ee2hxAB8RvBYTyMS/SCrYNNkl9yDcaYLAJeIZXFsjwABxcezbMxDtgHnx9spIt+4ro4Ik4T19oOtNiCDqC5xT4EjkCb4U8L+06RU8/u2lpJrxqhniDJrgmX5UOftj/8oGmeC67DPw4UQuwHtNxB1jzOau4avm4KI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784136519; c=relaxed/simple;
	bh=vAOQ7cwcxN02HCa6Xjcfhkbci04d5vCip+aQj8mZYS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pevkZr5ayUB9T6WyhHKEDrzXOrWgICdicQ2CI0vQiYu/OLtbfxINWn0Edvov2ZmMmXiEgUw+mjPmwf5W566Z1hhanUnTDPusYG5noegIgKCiEguPVhYmyvAS7UySk4xeDLhg0niJLSLF+3nP0V/2Wwjzlw9rsJldO57nbMBtSwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5r0m8iBf; arc=fail smtp.client-ip=40.107.208.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5r0m8iBf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tbxshSkBDNGfBYVTgdPUQfMd7JMypz7ldacUfpzgXB6idNmFAUZvsOwh7UAxtei4op8Z6MbI+KPQEG5DqtagT8WNUhrPECiW//5gmFFFQWUjS6YDBipFGSv1RgdI83ZMDkbyvT2E2XtX2vB6+ya11b5w2SQRyBnG3b8IOADA1Gz7VLi745EuBPhvKRhRl9EBXBK9LsRsd6308ri2B+fFvcEzT3axbamR8p2/pMuAD0T6lPXbjig9KvpE1v61DYrrm6SXTkhNPbDnRRLHR6qO69pvFiDO12euhLrH/LYaXawT1uDqq2oMm6QEjEllGQfaK3APn2Jfzij0VIYMJSmO0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVaFHwhdCuBeBKBDMXO+SEsHIMT3F5/DPiiCkevaolg=;
 b=FSlKE1szVOz8RmmBnR71FkId2g2RPeuM1yD9Cs7xuUdBeLwjKLTuO6Ci7oXEHbZP/Z8lnaQpFSrLVo00X+uOuwTP/4QXYwSA0DdxoqkeEBZ5rv9SPrF6iiaofz9cCYddJjuag6lgGf8zD/4sylZwa3KLyCoGdA9wsCA16d6+qDUDCbomhh2pC/f/cglEDcDWx2Y4kOnBYwBEEMf50wzLoiDytE28j0Lb27VEId033Lyw4W2wn6YZZUZQxXhTMv7qf043r9Cot/Rzk4WfynQWPQIOmNTZerSgX0eXytInEjuwyyGhjmBhWWfj6QjMuMMWThcKvTi7VJ7QXluuyaAy+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVaFHwhdCuBeBKBDMXO+SEsHIMT3F5/DPiiCkevaolg=;
 b=5r0m8iBfZbT9/GVGgyiAGz/NOyRwXClYR3/UWNILbJ60PCibIhrWkaZ30prmCjGyk3tcm1ICOjF4ef1P1nYTkrNNfhNEDskE4KkfHV6qgPTTshx6FNjDnXmP1r64Xp7ZMgaLk+SUKJOL6p4fjms5RdxaclRy0MyWhQYQe7SzsiA=
Received: from BN0PR10CA0008.namprd10.prod.outlook.com (2603:10b6:408:143::27)
 by SA0PR12MB4463.namprd12.prod.outlook.com (2603:10b6:806:92::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Wed, 15 Jul
 2026 17:28:28 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:143:cafe::86) by BN0PR10CA0008.outlook.office365.com
 (2603:10b6:408:143::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Wed,
 15 Jul 2026 17:28:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Wed, 15 Jul 2026 17:28:28 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 15 Jul
 2026 12:28:27 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 15 Jul
 2026 12:28:27 -0500
Received: from [172.31.134.241] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 15 Jul 2026 12:28:26 -0500
Message-ID: <66e4a85c-be14-4bd8-8328-bf17d2437994@amd.com>
Date: Wed, 15 Jul 2026 12:28:26 -0500
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
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Tanmay Shah
	<tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260710192831.3440427-1-tanmay.shah@amd.com>
 <20260710192831.3440427-4-tanmay.shah@amd.com> <ale0KIu6hXNvN0q9@p14s>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <ale0KIu6hXNvN0q9@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|SA0PR12MB4463:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cf93e98-fade-4695-0595-08dee2967bd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|82310400026|376014|3023799007|6133799003|10067099003|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	QU+WKY6qymaa47Fk7tT4Xra+cyWQtiTVxnEIxRLYOKnsRAtFINDlMPPx8kAVd7yT/D7hT/ytKZROGQ75tVYZcJdoY2jc/AJK+qg7YC0W1tvMz54GQW2DLyvlWUyMHgqmnw43EEgl9o0UgMKxM81alg+FPJJeLDWjZ2NvCQXL5fE55jCqn9QBCPu+CQFuWmeuXV4lQ1/f9x8dAc7UHc9KloCK3xTZQqxMqW+4Lo/SpFMtgUQeAKbrrXNyVOIxP5HkHY2PMCuBHvOZ4eLmzpQVhFmUnBWl24mUbFIB7B5LegmpErCwtwo53bAEKYcBvm7kb4xLvBH15b1Z5T/N7Z8aPLhbDP1KQJy2jQfMjAbXCsB9fcS39Q3AEQrAHgWTAknCWRZ/0hXWpFEPMU66Xg5MAy1R1i9ZaFkPn3FXBjXf59xUqyLxOQv1rN5lxApOYgQ3OvLQiEYW3u/4M5Z0Uj5qb8DfI9vb5OQHpcgK0kZ9mqk1pO1gAGIll6LnaEMB3tYWoDEvIQnzvLSCXrCA4EAoMDOPP7UTy8oCV3TkU8iAHh2VhN/zup4dD8Hy4Jpzigfyy3kYP0igxmZyaU/pbnI5BajUpzI15OFnCkHqaEKvItLopOiKicqlHqjC7vORN068rqwgO3hFJkXFqB3tdQfxu8BVG+3z7Ld1/g3EFMYZkjpJ6g836SSUTeDQtrv5xtpuleiNrB2nPBf867CwgkF6/A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(376014)(3023799007)(6133799003)(10067099003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cW84UIiHow+JCfey4XUlJogMBcsh3Z8OyBVoBOHbLQeWLUImuP8BIGe7Qc0MO+W8W7oqR6+wY7F9CxoxsqHEOC/yXO3IMGEmwwsYwWvZDSCT/Dry8IenrtfORnTjfMofCAgth7gIv0qfOFitR7evouSRxOdxha1Z0CpeiXw8FVBA8Xd7vkYF3WxtacRKjInI6voV/PavCZ0iYPk4RX087KheILfWDDLksaRGd2vTCNPpPDY+e11yu20tnBOhaI2PpeCsstZ58J+HMON10ZWD5Mw9TSwE+KXmSm4IFvaD4YCSJhoKzUeJasJMfnuw5dIEM9fkltFUUzhzUQuAwdrd8GenUr5RET87XxoB5rW2LH1Bn2wPXuxfoE+YbS1N7gQpJwKicNm5qejNCibbDbHHloER0H7jNW1BUq+6zAdNCztcoaSmXoKmCiOYmNi3xBde
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 17:28:28.3211
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf93e98-fade-4695-0595-08dee2967bd4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4463

Hi,

Please find my response below:

On 7/15/2026 11:24 AM, Mathieu Poirier wrote:
> On Fri, Jul 10, 2026 at 12:28:29PM -0700, Tanmay Shah wrote:
>> 512 bytes isn't always suitable for all case, let firmware
>> maker decide the best value from resource table.
>> enable by VIRTIO_RPMSG_F_BUFSZ feature bit.
>>
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>> Changes in v5:
>>
>>   - fix documentation about alignment of the buffer size
>>   - change version field from u16 to u8
>>   - remove buffer alignment check
>>   - Separate buffer alignment vs MTU of a single buffer
>>   - Use buffer alignment only to get next buffer address at alignment
>>     boundary
>>

[...]

>> +#ifndef _LINUX_VIRTIO_RPMSG_H
>> +#define _LINUX_VIRTIO_RPMSG_H
>> +
>> +#include <linux/types.h>
>> +#include <linux/virtio_types.h>
>> +
>> +/* The feature bitmap for virtio rpmsg */
>> +#define VIRTIO_RPMSG_F_NS	0 /* RP supports name service notifications */
>> +#define VIRTIO_RPMSG_F_BUFSZ	1 /* RP get buffer size from config space */
>> +
>> +/* Version of struct virtio_rpmsg_config understood by this driver */
>> +#define RPMSG_VDEV_CONFIG_V1	1
>> +
>> +/**
>> + * struct virtio_rpmsg_config - config space for rpmsg virtio device
>> + *
>> + * @version:	version of this structure, currently %RPMSG_VDEV_CONFIG_V1.
>> + * @size:	size of this structure in bytes.
>> + * @rpmsg_buf_align: alignment in bytes for each buffer. Must be a power of
>> + *		     two. If 0 then no alignment will be done. This alignment
>> + *		     will not decide actual size of the buffer but will be
>> + *		     used to decided the start address of the buffer. The
>> + *		     actual size of the buffer can be different than the
>> + *		     aligned size of the buffer.
> 
> Is there really a need to have a buffer size different from its alignment?  It's
> not like the (small) delta between the buffer size and its alignment will be
> used for something else.  I'm fine with a buffer alignment requirement but in
> those cases, the firmware should set the size of the buffer in accordance with
> its alignment requirement.  Otherwise, the complexity needed to manage the
> discrpancy between the two yields a driver that is hard to maintain and prone to
> bugs.
> 

I had the same concern before. However, following example changed my mind:

So, a single buffer size is the MTU size of a packet for the protocol
supported by the firmware. Now that can be different than the aligned
size of the buffer.

For example, the higher level protocol (not rpmsg) has 430 bytes as the
max size of a payload. However, cache line alignment is 64-bytes. Then
in that case, the aligned buffer size is 448 bytes. But, that doesn't
mean we can say protocol's MTU size is 448 bytes. If user end up
treating MTU size 448 bytes and use space beyond 430 bytes, then the
higher level apps might discard that data and communication may fail.

The alignment field is used only to decide where the next buffer start
address is to ease cache operations.

Sure, we need to maintain this complexity, but I think it's worth it.

Thanks,
Tanmay

>> + * @txbuf_size:	Tx buf size from remote's view. For Linux this is rx buf size.
>> + * @rxbuf_size:	Rx buf size from remote's view. For Linux this is tx buf size.
>> + *
>> + * This is the configuration structure shared by the device and the driver,
>> + * read when %VIRTIO_RPMSG_F_BUFSZ is negotiated. The fields are laid out so
>> + * the structure is naturally 32-bit aligned.
>> + */
>> +struct virtio_rpmsg_config {
>> +	u8 version;
>> +	__virtio16 size;
>> +	__virtio16 rpmsg_buf_align;
>> +	/* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
>> +	__virtio32 txbuf_size;
>> +	__virtio32 rxbuf_size;
>> +} __packed;
>> +
>> +#endif /* _LINUX_VIRTIO_RPMSG_H */
>> -- 
>> 2.34.1
>>

