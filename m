Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795457804;
	b=h3dnyGHXXWXjfYRbw0icvREbHCqT81hQUIgsvylv7MfIM7t3dLHiTjz0Qb1Vqy8NKP5A
	 gNug37D08CTex9uk7zdJJYQ9blUQOPe/4kLWpDhIbUiC/P/4gCAoSp6jqPiCDze6xicHU
	 nNBY+mdt2tC3BF2cxgBzSCaVK6lGMD+OHgGhysQV02hCe+5gOxJ+9l4InX6qCq8AEM4wl
	 dYNFjPnKeiCGabR2n6de+mYVpvo4i8cZNdPaUF4qtWq4yQwEaD8+Hw7/P5+bzJd5YSZHj
	 EaS3pl38+nY8gSiYRmd/hG9ylWpXlRfwcMxCtAsxJ7t0fxYTWxuDw4fft5d+XmvurmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457804;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=9uGgK8NzYvXtfeVuJcCGKElIDL6vsqxiFYGxJrLxNqg=;
	b=3NE9eCTwVMQBQnBxSyTjp3Fb+UNwQjUww7kMzvMO9GMvf46v4RGtZIqSHgQYE+I0YIVG
	 WC+GXaJHAtbJ9oZStXXs60JhRglyd56KXdDBWrao4+bwhmQGC+piM0eSWdg4PHi3MEpZc
	 Iv4U99IWIHPNDEqA5WZAxJnCSZLvkHPrNnCg7OMB0pHOS0ynKtp3rvIbvVAvGJKkauz5x
	 lgiNcJHkiDjJW0SF1iaolVzd5i1gMw/2jg3r+guXtxecCnpOHwZ5U0Xfssj968F4jTDei
	 ouOF1DaCv1pSuVvkqeQ6N/xhswa4wLxZe6EcEEfGj4ob3oeFc0oXGMLjBnr+fMW67+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=nVj10bW7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.13
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013013.outbound.protection.outlook.com [52.101.83.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF8B606A31A;
	Mon, 23 Nov 2026 18:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BF8B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=nVj10bW7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fL3ofrzJCgItYay/9fqRE0vJloInneLa16cDC1PYT5Zm3LMjNTrnD9hpgi1EbRPZye/LKgFmFvuQXSzn9Vw5Ar5py1QxEfFtIee8Ha7jLx+eF+izm5MUgHCcRT1p2cdDY90fiUkzPmLR5+CJXB4vANoTyAG5uKz9fBLT/W+qk0/l5qCXNB6/d3Hd4wkDv1rLBTFGUyDH9Rgu2HjTJoCCKR0012OIHEVwTtTjGglhp2u0kSdjHoqiZ+opFdc336GPj7BdTiHekPibvXQN/xdPsZlalVi2KKLxQ1gsJy6NWKCzOBI3ud+WkjSSptOwkWwJ73DaE+fgUtoNcSTgvZElMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9uGgK8NzYvXtfeVuJcCGKElIDL6vsqxiFYGxJrLxNqg=;
 b=zHA3pZkNW9u1R2NxCjxTPfdFkS3eUlawGhQlodLbkP1osxKDPbXR+QvdHfPhXxtUo8sDoJ5t8r7CmyB8nNxwkMeisGjKha3epAoSo8RR5i8ibCVEjGc1iP5NZXUwPiDFM1sg1T6YnJGpxVtX7tMQE4xIih9fM9w3sbQIe3Cy1qaS5K2C4Yqs94ckTVWEpB6oznUAKNgrtL3snMR7qk3gyXiqQoLp5XBiCAoTDAha52bfhqYoyLJAJl830rIo/yRWm8IV0pMk8Q7H+EXs0nHRJjliHekhph5LQBDq+jcCDx7jzkBUj4khtphqgmK7pnFtB7Rw18nYgK4mCpACIngO+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9uGgK8NzYvXtfeVuJcCGKElIDL6vsqxiFYGxJrLxNqg=;
 b=nVj10bW7RkXRUrNc02krdgZaK+y3OXxJn9WgTDv9dyzcJTsHf4ZddEDPq+WVpu7jHJIqBKLBg16tOcii1fi/zS2XXhhli8YoeVowe5MAhWgt6w4xqL+i+ao4EXApPhgUwJ7rCZA9VYpKyv8fTXALdmhU10hD6oJwcN5Sw+UKsUEB/T49CpviZbsNNLjWfuaQUb6DQpOhyXRFRpq92DPgNB6QSHHrT9iW/LikR8KxqkCYyz/Vb+NboIfmy9TcshdcBGveWVe1zOqC/V3+usJYtUK45f+Cr8Zxs3YrE9f5HOaQHE34zgAi+MeJEmV3zhjcJjT3N9VTT2586NWwutw8vw==
Received: from DUZPR01CA0157.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::21) by DB8PR10MB3705.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:132::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.3; Mon, 23 Nov
 2026 18:16:39 +0000
Received: from MA3PEPF00000406.eurprd04.prod.outlook.com
 (2603:10a6:10:4bd:cafe::2c) by DUZPR01CA0157.outlook.office365.com
 (2603:10a6:10:4bd::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 18:16:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MA3PEPF00000406.mail.protection.outlook.com (10.167.241.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 18:16:38 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 23 Nov
 2026 19:17:26 +0100
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 23 Nov
 2026 19:16:37 +0100
Message-ID: <49f11bcc-9a21-4181-929d-2a45448435a0@foss.st.com>
Date: Mon, 23 Nov 2026 19:16:36 +0100
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] virtio_rpmsg: Fix config space alignment
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Francesco Valla <francesco@valla.it>, Bjorn Andersson
	<andersson@kernel.org>, Tanmay Shah <tanmay.shah@amd.com>,
	<openamp-rp@lists.openampproject.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261121-rpmsg-config-size-v2-1-d2fd698b6f76@valla.it>
 <26795897-ccdb-42db-9433-2ecc341fb311@foss.st.com>
 <CANLsYkwG-C_CRDr401zZB912U07tQHJHNa+LWd2mgPM9YRgcNQ@mail.gmail.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <CANLsYkwG-C_CRDr401zZB912U07tQHJHNa+LWd2mgPM9YRgcNQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA3PEPF00000406:EE_|DB8PR10MB3705:EE_
X-MS-Office365-Filtering-Correlation-Id: d70bd11d-8803-40a7-e2ab-08df498deaca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|22082099003|18002099003|13003099007|260925021911599003|260925021311599003|56012099006|260925022911599003|4143699003|261028144727099003|261026140227099003|261022075727099003|261026121527099003|261021123027099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	jOcktZU+IjpicPP74YGRnABqHoSK6XvLQtTRchAJ6oH7pjDJzG5dieye4nfxk8+rhhGMcfJUnGbnhnZw0N3c28kZyhW5GpP1ElAdO54xaBYMzu3/VP2UMWCyCmHO406IHQGMU0rOVcE+m1E7Q0+KgMVVqK91tCGu9TbRx4pdY6tMw4YnEJ5+6YyQZkCXENy6pbXs+rM0meRR44KQ/S/VQTEOlrmwwqnUs4AvXtzVKV1IfHXx+6F3KwfUIi28Q2j0isWabkhpwWKz6vuDMLOP6R+REsK15BD+l8Vk//k00CTdIdI5jUEdiP+bqAACy+nMb+nijRYucyS994jhY83ZJtXzoloHvO5ryQOFJ7rSJMLGtYJ3D8p7rtmVJZwAh5t2u+/KVS4FVDxSkiJFI/QXQ6wbqXLvl4PEGCMEU6fqfUBxobNJvlvbr+NfWyQByy/kQcM1OwIG8B8Khnj2VLvrRyGDRgISx2Ayy8APQWneG9EYviDn/ILP91Uak1MXwYr2Mn4HVlA9sdTPYuU5wijcVnADcZ549WE4mMNggsz4yLWDtKMJc+VsHV7suiOZdoZz8kk+1+RgMAbKpJkYVQ5hpBEELN3sck7oBZSGrqlXlotwxLets7pvKApmusZEip5sIteva9yhJtuoKP56hmTUww==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(13003099007)(260925021911599003)(260925021311599003)(56012099006)(260925022911599003)(4143699003)(261028144727099003)(261026140227099003)(261022075727099003)(261026121527099003)(261021123027099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	W/ytHqVipwi6cCtrUbk147GVy9siDROGEsotI9YXW2c50VHfLgQHlScGUMH1hVsh5NsnG7HXN/StFZkT8B0iRN+obNqy+Dkh8gkwxgb17KMm5a+YnfgW+M+ypqA+nmP1HIU37OU8WShELW9Xt3hwKLIo3UyL2ybfrKZU6gl9hm/rn3olGtPBquO9B/yvsk2MtemMAvqyXVYhRF/uishqBAn5fwPzmDLjt7oNTsIbhCWQetu1DOdjBzRrn18cKGb6IUZSoXV6GLp/BOPKEMLxW6gnOvuQDAbfOep72dbO8YyABTfdr9ryTFS5MouREdN/oOAxgN7mx2fKu37c4oY78FFKQMcxu64eUJUA7GLXGexPQLMbXk1ffQcN6/SS8q8PGppAj/oFPoz96eF99arksOJ69z7EFGxt9GPPq81O9y3SLcZHEzM6n2AF9Z9I2+dq
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 18:16:38.7209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d70bd11d-8803-40a7-e2ab-08df498deaca
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MA3PEPF00000406.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3705

Hello Mathieu

On 11/23/26 15:12, Mathieu Poirier wrote:
> On Mon, 23 Nov 2026 at 02:12, Arnaud POULIQUEN
> <arnaud.pouliquen@foss.st.com> wrote:
>>
>>
>>
>> On 11/21/26 00:01, Francesco Valla wrote:
>>> The comment for virtio_rpmsg_config says that this structure is
>>> naturally aligned to 32 bits, and this is desirable by some
>>> architectures that don't get along with unaligned accesses.
>>> The content of the structure itself however isn't aligned, and the
>>> __packed attribute prevent the compiler to add this alignment.
>>>
>>> Fix this by extending the version field to 16 bits.
>>>
>>> Fixes: ca96ea25e51a ("rpmsg: virtio_rpmsg_bus: Get buffer size from config space")
>>> Signed-off-by: Francesco Valla <francesco@valla.it>
>>> ---
>>> Changes in v2:
>>> - version field extended to 16 bits instead of adding a reserved byte.
>>> - Rebased on current master.
>>> - Link to v1: https://patch.msgid.link/20261101-rpmsg-config-size-v1-1-65686b445b22@valla.it
>>> ---
>>>    drivers/rpmsg/virtio_rpmsg_bus.c   | 2 +-
>>>    include/linux/rpmsg/virtio_rpmsg.h | 2 +-
>>>    2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
>>> index 23ff6c8b7a20..27282475a732 100644
>>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>>> @@ -815,7 +815,7 @@ static void rpmsg_virtio_del_ctrl_dev(struct rpmsg_device *rpdev_ctrl)
>>>    static int rpmsg_virtio_get_buf_size(struct virtproc_info *vrp)
>>>    {
>>>        struct virtio_device *vdev;
>>> -     u8 version;
>>> +     u16 version;
>>>        u16 size;
>>>
>>>        vdev = vrp->vdev;
>>> diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/virtio_rpmsg.h
>>> index 0872cbca4593..57f48d537de9 100644
>>> --- a/include/linux/rpmsg/virtio_rpmsg.h
>>> +++ b/include/linux/rpmsg/virtio_rpmsg.h
>>> @@ -31,7 +31,7 @@
>>>     * the structure is naturally 32-bit aligned.
>>>     */
>>>    struct virtio_rpmsg_config {
>>> -     u8 version;
>>> +     __virtio16 version;
>>>        __virtio16 size;
>>>        /* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
>>>        __virtio32 txbuf_size;
>>
>>
>> Acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>
> 
> Applied.

Could you tell me whether this fix will be included in 7.4 or integrated
into 7.5?

Or perhaps both, if 7.4 becomes the LTS release?

I would need this information to manage the compatibility details
properly in OpenAMP.
Regards,
Arnaud

> 
> Thanks,
> Mathieu
> 
>> Thanks,
>>
>> Arnaud
>>
>>>
>>> ---
>>> base-commit: 5f22fb20497f4983094131f00a734362300d22d2
>>> change-id: 20261101-rpmsg-config-size-0dbe9ea63c6d
>>>
>>> Best regards,
>>> --
>>> Francesco Valla <francesco@valla.it>
>>>
>>

