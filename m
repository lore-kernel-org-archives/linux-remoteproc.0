Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013064.outbound.protection.outlook.com [40.107.159.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E433A6B8D;
	Tue,  1 Sep 2026 13:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788267818; cv=fail; b=WDoaxK7A2HX239sMU+hWKn/gwEbTZ7ZwP0nOmAeG+bu3ULd/fzDjuI0pZHvmLoLZrliZ0/a8U5UxcwTrUwERdjXyaMsUhVNWSXj0Ag69KVo5zDCJ6+LtMeGN2C5KAJdoyCwienjl4eaZHqyZK4ATjl0M7qY0iDDJE2oz3Cpz88Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788267818; c=relaxed/simple;
	bh=/odFoAbKXlo0vGER9d71k3LJkSnESCkUymyvsJ4RCaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BjYL8JicKyw71XrA5auGsn768bH71NAvpN1W2mplHEoobMxnkqhRtcfd8aGgb9eWIlRYRgSh/bjMVoNGJKs+b77UNQJKcTBifpHOYi0WbWfGavrsOsljwneMRmtcNZ9BzdZ/0iL+tDDhFRFtjFShKrMXWJ7zhBZAiPQ34OST3uE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Rn5aC0ER; arc=fail smtp.client-ip=40.107.159.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Rn5aC0ER"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M9umZPK18x46fqH8f6xODmg98Acc7FaOYxDYVtGDgm7nikUYfva1bsL3dMZnr6L0BbZV5EN1GRTm0pzVdXe8MV/3aM4K+2nF5Ea0z+94/N84fOMyoztSLHdeWPAvbCpmdSRo2JEO/9RxDQo0i1uTSnbMavpQwAj8L3mIBG6qHBqZx6LArjf1C2DdWPDAXAOY4wDWBYYzqKfu0OEzTNXj+0oYAMeTW8V3DZmVe4olLNNvEsbymM/QuZvcYMLClu6mOX7p3SlfNP54X2IFNuotNhrrhvcDStwGenX9iCWK8w50y5XAGcoaC0PhK8Fpj2ICRacWcu4zelSE7w19Hxg8FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nb7XhoaewZgRe0r/Knb3p8gswQoQ0P+0bdTiDO9K+yE=;
 b=WK8aILvxzPHWqQq8pGlWGxTqf2cCW4UO1vMNo62kfhY3gzLZvoC8tK6O0iHzZTP38xgwUaLdDVbzEb0xdy5/YuPELcXa+4VVVvHsu3JXkjQPc9KACJLplsEULdVaSBFhIKuWl794GFLDd7ZFGTYAJfz9LV8puzufuNjuxutdzgzJl8BWGoT+JLCH1KA8kb3WxNhuH5xzsm0FjBlAnAlx0/wcrjuvKRBh2GTcgE9PxrxCYQP4/Gdbs865aZu/Ly+F6LQonY0bKKsZ4kob9XEnebjzwaFfMWAVMwfybQ0xxnjbKDO91VKwgQPSVUND7G4LPysZhhHCTGfeokdWhYQfFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.88) smtp.rcpttodomain=amd.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nb7XhoaewZgRe0r/Knb3p8gswQoQ0P+0bdTiDO9K+yE=;
 b=Rn5aC0ERaL1n2fSmyclzYc1SRBefFg4xweZTUhMGBQitgtA6pn82+UrJ97WyqoYlwvQk+50LkcVuBcVjqoS5pONi6b6ZkF2hCarKnkRAA4oVtRP1jBmGBDzHe42Od5F9m9YTsm58vGCHzDEZYDl9e+xuN+iPEFFw0khX3Fbvw+m5LvRfrB/DtHd1hX+iC6qIcZKOGuWkzif4+Pj1+JiJ3abCippYK0CnOpGPjhBFG0lCq3S1UEVOca2n48fubgdcRE2Rv1tkPOLM2/iOakuU6vnS7YgHswrevTVTVDIdb4CgcPBaEnjr98rF4AooX8Xq0gFLiGKVAPFLv2LTSe304w==
Received: from AM0PR02CA0112.eurprd02.prod.outlook.com (2603:10a6:20b:28c::9)
 by AS8PR10MB6843.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 13:03:32 +0000
Received: from AMS0EPF0000056B.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c:cafe::18) by AM0PR02CA0112.outlook.office365.com
 (2603:10a6:20b:28c::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Tue, 1
 Sep 2026 13:03:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.88)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.88 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.88; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.88) by
 AMS0EPF0000056B.mail.protection.outlook.com (10.167.242.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Tue, 1 Sep 2026 13:03:29 +0000
Received: from ENXDAG1NODE4.st.com (10.75.129.197) by smtpo365.st.com
 (10.250.44.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 1 Sep
 2026 15:00:48 +0200
Received: from [10.48.87.127] (10.48.87.127) by ENXDAG1NODE4.st.com
 (10.75.129.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 1 Sep
 2026 15:03:28 +0200
Message-ID: <4f8cc4b4-8c44-4d2d-befd-63911afe27a5@foss.st.com>
Date: Tue, 1 Sep 2026 15:03:27 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] Enhance RPMsg buffer management
To: Tanmay Shah <tanmay.shah@amd.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260828145853.2843486-1-tanmay.shah@amd.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <20260828145853.2843486-1-tanmay.shah@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To ENXDAG1NODE4.st.com
 (10.75.129.197)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000056B:EE_|AS8PR10MB6843:EE_
X-MS-Office365-Filtering-Correlation-Id: 74be840d-328b-4ee7-1f22-08df08296b81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|11063799006|10067099003|56012099006|22082099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	uF3A97ZUi7P7Ua8XauRPVRo5G6s2+uEjCsb2mQKTsNHIaEcY/4hepoCzdTPiI4M1W6K9COjLa3hUApTc8f4Fq+aVz+kvnkJZaoRfOpvuSlB+0gNQNhV1HvsY+/0B2BgF4HMWgILv/x77HU9CmLkrl7N8FjEW3BdpQvDbQCLTUZnQquSnKIsgGQ6MC9nyYm9qmJuoDEfOq2Ai8Dw4ps30ZOH6uyhQ6e6henW4exmCcUVoH3SToVPh/1dUwIz+bD5TsTOmTtaurXSzYYUi6KiCP3vksMrY+dQ3UPSd/mdV0c1Aai757wQ2uTEdzDbfn7uNkX5oZ0zogp8axWLq49eps8UJ0Nq6bB0i1gnwd7DQTmCj+l6iUEANq/sDJSyQi8k901Pf73uma2DVK0alEEYexJgYuZsEwlkdbG4X8gcPFobm0bUYSdcQomnI2gsnZZdGhT+qGO0lz8bYfQMOAclxFHKnkPvRqLaBXRnsrW8JfdExbSrlTJLu/OPSTlmC5AqQXR6HqM/xH/FMaELbMr8uPLnAjm88a4y6TXFH/zkmkOunDlD1B7nzvtul2Od1GvLmua9oHRiCX7Npmx32vHcTzSidyCAdXLkDpxS38k2UvgXGtNJS7KmPQv7Y16dmd43vYAVBlUu3XqpkiQ5Ot5ij2eM/fRwlCHTC6Nj4M/+D31XfZVNZOgfU2mOBFvb/twtsE/1jZvjkZi4C//GvxHgbwA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.88;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(11063799006)(10067099003)(56012099006)(22082099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	O/9ccA6S15IdaXL3x3fEyPBROPsZ/4SFP2N16vowGLV8eC4A9IDWBFsfCuX5qm0gW+BV7E3va5jaMeoBHWDdQOD29btHHY1i5FcChXkedGO0582e2s+YaKgojXox3wGM1sV/+AlN8W5iYeiX9axhGVR9I/mBWZUKyeKogEXWhnL6lO8CtsBp/DCfxiiuL7H7x/GlOGxaNO8ozzQQtFBiq+iAXVyy9CsZiTR1DHCrkah7f6Pdxg7pF4ubbKUDDsiJf4fFnJhiybUrw27HvhU1y+YoyHM/jGHwE1YA1axexeFrV5HlCotuaYkuBwpeOUkIIKLhnVxwBLhBbrbFV4G/E0XvnCh86nubJIZsgIJyGvdIWTEVjt6jV3WO4mQlGExesbX8PbCA0mnahToJ7L3hxHZ9YXKdANOXY1KqP9bNvxMHHlRL/xeCAreBsS6Wip9F
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 13:03:29.9323
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74be840d-328b-4ee7-1f22-08df08296b81
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.88];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000056B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6843



On 8/28/26 16:58, Tanmay Shah wrote:
> Current design uses fixed (512 bytes) rpmsg buffer size in both rx and
> tx directions. This design is not suitable if the payload is larger than
> 512 bytes or the payload is very small and doesn't need that much
> memory. Instead introduce new virtio feature to retrieve rpmsg tx buf
> size and rx buf size from the virtio config space in the resource table.

This version seems good to me, with or without my suggestion in patch 4/5

Acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

Thanks!

Arnaud

> 
> Changes in v8:
>    - fix commit message of 3/5, "%s/enable/Enabled"
>    - introduce new function to get buffer size for the vdev device
>    - fix description of VIRTIO_RPMSG_F_BUFSZ define
>    - "%s/or differnt RX and TX sizes)/or different RX and TX queue sizes)/"
> 
> Changes in v7:
>    - Fix 5/5 commit text, and move change log out of commit text
> 
> Changes in v6:
>    - remove buffer alignment from config space
>    - rpmsg.rst: modify alignment related documentation
> 
> Changes in v5:
>    - fix documentation about alignment of the buffer size
>    - change version field from u16 to u8
>    - remove buffer alignment check
>    - Separate buffer alignment vs MTU of a single buffer
>    - Use buffer alignment only to get next buffer address at alignment
>      boundary
> 
> Changes in v4:
>    - Introduce new patch to modify rpmsg.rst documentation
>    - check version is always 1.
>    - check size field is same as size of struct virtio_rpmsg_config
>    - introduce alignment field
>    - check alignment field is power of 2
>    - check tx and rx buf size is aligned with alignment passed in the
>      structure
>    - check msg size is < MTU size
> 
> Changes in v3:
>    - new patch [1/4] that renames variables with clear names.
>    - %s/rbufs/rx_bufs/
>    - %s/sbufs/tx_bufs/
>    - %s/last_sbuf/last_tx_buf/
>    - add num_rx_buf and num_tx_buf in the documentation
>    - change version field from u16 to u8
>    - introduce size field in the rpmsg_virtio_config structure
>    - check version field is set to any non-zero value.
>    - check size field is not 0.
>    - Remove field for private config, as not needed for now.
>    - add documentation of rpmsg_virtio_config structure
>    - Check for error when retrieving MTU size in the sample driver
>    - %s/mtu/MTU/
> 
> Changes in v2:
>    - Change author
>    - fix commit message with better explanation
>    - %s/sbuf/tx_buf
>    - %s/rbuf/rx_buf
>    - %s/num_rbuf/num_rx_buf/
>    - %s/num_sbuf/num_tx_buf/
>    - %s/sbuf_size/tx_buf_size/
>    - %s/rbuf_size/rx_buf_size/
>    - fix typo
>    - do not use ALIGN on buf size, rely on allocator
>    - make err msg more explicit, %s/vdev config:/bad vdev config/
>    - fix license and add AMD copyrights in the header virtio_rpmsg.h
>    - Assign bit 1 to VIRTIO_RPMSG_F_BUFSZ feature
>    - use __virtio32 over __u32
>    - add version field to virtio rpmsg config structure
>    - Introduce new patch to print rpmsg mtu size in the sample rpmsg driver
>    - move linux/virtio_rpmsg.h to linux/rpmsg/virtio_rpmsg.h
> 
> 
> Tanmay Shah (5):
>    rpmsg: virtio_rpmsg_bus: rename rbufs and sbufs
>    rpmsg: virtio_rpmsg_bus: allow different size of tx and rx bufs
>    rpmsg: virtio_rpmsg_bus: get buffer size from config space
>    docs: rpmsg: add virtio config space details
>    samples: rpmsg: add MTU size info
> 
>   Documentation/staging/rpmsg.rst     |  17 +++
>   drivers/rpmsg/virtio_rpmsg_bus.c    | 156 +++++++++++++++++++---------
>   include/linux/rpmsg/virtio_rpmsg.h  |  41 ++++++++
>   samples/rpmsg/rpmsg_client_sample.c |  20 +++-
>   4 files changed, 186 insertions(+), 48 deletions(-)
>   create mode 100644 include/linux/rpmsg/virtio_rpmsg.h
> 
> 
> base-commit: d4d61a4b0a52e8f3cdb3e1578602850a3452ec3e

