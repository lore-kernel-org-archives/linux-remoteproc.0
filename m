Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795421574;
	b=JmteVwj1GrCHm5MMC4eFfrSeNH0EtGXU3S49CQs46Dq7JSeHvyuomGHndaavnMj+0ssn
	 PNIKgFaMbbznnQuZAdD33vWJIodWTOgEK1K8vl9AAAPfhbE9vy+BOOvaPyqEeB647og6l
	 vHl9k7c0eOhkmQcPyggjzgVztbTEyb4aB655P2wvNC1p0SRVJ35NmGpx7KL0I9UqrIg7g
	 HRiiGlFQnh9ei31vs+Sceys8l49IxlGMDNQvQ8kfWvWqp4YvdYOr3fHhvXzdK6FCfj6m2
	 mdFMu0u6zDR+xBBOM1m9Iq9S4qjEix1fmxXKD2GEYxgYf6RVgApo4tuvQ90TRi2iF6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421574;
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
	bh=AIcmSFzvPJpIMu92Ru/mgleRylwSSs+lE0uOvjiad54=;
	b=lUjo1uif8PThMnE3a/Y/9J5WJybrNs/Uh3XltPYh53rpXWojFAY4e/0J+QT2Luop7j1l
	 Sh8seBETJVL/7+270xq7PGIbIzU5/RSYQIn8KvSWQcLwzUnozVw/9Z5EJuw5uV+SEcdfY
	 Pbt8g1heJqQHTnk6sKfj7DcYXqE6A+D1DFUrGdiOmjj4m23L7QGvS0+QL2tMPPgtTEry5
	 p8aiwQDjlbSLWH1ovVLSPrFSmTD0/FEIuUL8rJPf23q9DzRAel0FiLxvvFb1N7PRzNx3C
	 6d1FIjyiNMPit1jvY26C/Els8U8fLZSAygD+1JDLmu96P58Mq11fcKV48FLPG8JoEcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b="Bl4/qTrO";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.57
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011057.outbound.protection.outlook.com [40.107.130.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52111606A332;
	Mon, 23 Nov 2026 08:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52111606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Bl4/qTrO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u60pHGGAW2e73uSwnsMqdTd4tguT2sM9K10Hg5oAdr8yEi6q9y01Z4jbunCU+VYpGor5etmeMjiJNS9BQHMdQPsl8sAJb0HDjiAbjOKnKrgPLYxMFFMQc5w7NcsWn+W8AA9Yp6ZLwdHVRQRgmj2ljS3XmywRSJcqQAulK8ol33gZmGkys1Pf/Zh7d+t2niRUSuIaLMe82Bkv3SpaX46O7UI3HotNdmRSDyKF/lRLdEJXr7KYSzAa06VG0oToJVUNDyHa+St7cRmcd7jkBTbg7Qxyr6Yn6Oc2Ir/J8SB24SUtO0LYnBm0lT9Yxl1Ej5few1Sjb7V57S5x/rLTp7TsHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIcmSFzvPJpIMu92Ru/mgleRylwSSs+lE0uOvjiad54=;
 b=m45SDCjUDyauW3WJizrshTPnlcf3NRPPJm28bEdDWwavQ2BTnqV0k16aqwSRPHv9nwwMECzNEEk1PZgzb6Qqgo+FMiQc6e+iDoW0KzpVyxGdQA052LblrmRjQ/t25jiDBov84fiqDLvGXVK7Fd8zBMFzl3vGLzEKbjRBm8x5f6V/kg5tzzKCY2cmwg37Nz8jb0oo0ZJ+PZN6xIHY2eFcezQa4L6/ZpPB42HlzXGNMM3Ale+2E3Don3LU1/meiOgYTYD+isG0+sU1JtF4NpsGKRYm9mUOT3Kj3IsjB8jcbRvyvRxAefIopwbHJF8Yj7hzUFkaGcFVyAxG+wVOtgsKNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=valla.it smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIcmSFzvPJpIMu92Ru/mgleRylwSSs+lE0uOvjiad54=;
 b=Bl4/qTrO+G6MH3g5cYpHDLaxGrqQ/W1m+UB2TRFV2ptwC1vUJAhhtJuQURrJtqYcYFdgxpHn4crZtvg/bvJaiBBJXg+V3oY0ofzWKa3RdrnUyL2RClHwB6sGChZ95Pg6R6tD5GBrKpTW7hGGj38A6IEv+FMt/aqlpyIdyYgiLrXlgswd96jV8DxUR0Up9JPnKdQRb0taDlP8Wz8uKtXC7KOVMb7TC3LV4bLig/G9a+e35m0Eh4lCGjk6bKnaWXujaRxmvrtKFH/CU5YXB45BZMMpUK0uzdJZkrq2cO+9AJEsorAByg0uFwotIwHN5cQ45ZhVdOEOCsKLpuJgm1Tirg==
Received: from AS9PR06CA0347.eurprd06.prod.outlook.com (2603:10a6:20b:466::33)
 by GV2PR10MB7536.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:d4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.3; Mon, 23 Nov
 2026 08:12:46 +0000
Received: from AMS1EPF0000008E.eurprd05.prod.outlook.com
 (2603:10a6:20b:466:cafe::68) by AS9PR06CA0347.outlook.office365.com
 (2603:10a6:20b:466::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 08:12:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF0000008E.mail.protection.outlook.com (10.167.242.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 08:12:46 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 23 Nov
 2026 09:13:50 +0100
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 23 Nov
 2026 09:12:45 +0100
Message-ID: <26795897-ccdb-42db-9433-2ecc341fb311@foss.st.com>
Date: Mon, 23 Nov 2026 09:12:43 +0100
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
To: Francesco Valla <francesco@valla.it>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, "Tanmay
 Shah" <tanmay.shah@amd.com>, <openamp-rp@lists.openampproject.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261121-rpmsg-config-size-v2-1-d2fd698b6f76@valla.it>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <20261121-rpmsg-config-size-v2-1-d2fd698b6f76@valla.it>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000008E:EE_|GV2PR10MB7536:EE_
X-MS-Office365-Filtering-Correlation-Id: 5450e89f-be5e-420b-fbfd-08df49398e78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|261026121527099003|261102123227099003|261022075727099003|261021123027099003|261021121427099003|11063799006|56012099006|10067099003|260925022911599003|260925021911599003|260925021311599003|261009223027099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	mCVbPexJKuX07k29ktCy+wbwgdpkA2NU7Kew5ClZV/lqoZHU5qeGePzjmnAnMi/XZjaVi3HxGEdLdxc3zlHLTkj9ZGtuU8RUT2o3MiVjfuVqeNt7WWdlcw/CICXltE/OZ5yKR3sAJ69P1u7svvZ/grkR+xrWSG04PHBdWtATUhBkPIGu70Xx26zsSpGbHBp1Jp68+9YR0ToawURByr9Rx7k7drmSxwItqhdKRRuo2lOW4u8Ktk8QZyAR198tq6OfWTK7kggO/X9t1rVJ89cCzYWNtW7uvLdPT7/fYzlaN+XZg8Zh54C+xajgXF6WHz3nywDWM6sxq322bMJrTqYPECSzBAZ1FUxFW+Ol5LKkaOTInjVUWugX4vHZHTwKtfdZD6s9Vovy0uzniP5gCTxAuUk9APw/TICN0zYUreMef3BctMUoD4ayL062CS1MZS5guo4QFKjMp08VKCETNWHYzDTO7dl1jKoNAKNSKQOQcc3X2khpYIQQ5RuhF/BABt+kAzBqqxNyZ3RN7NUxzTYAPQVvlB9bjvAaJCttjFs3A1YIQvdG68fDxH+XKfBwn3kg5HdK6TQkx2PtHboaJwsGAEJPXyBo1lAxOnpDfYrkuew1RxvwFJ8YTiComb3dxOhqI6OG4HuSO8h5GynpoFP3AA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(261026121527099003)(261102123227099003)(261022075727099003)(261021123027099003)(261021121427099003)(11063799006)(56012099006)(10067099003)(260925022911599003)(260925021911599003)(260925021311599003)(261009223027099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tUXlDVsZZmiWumo1r2CghOba6xzeZ0Z3Rk1QFd4L8WpLDJTqcnmq+DwePHcbOEIIwAXNyn8xa24bW8SbUPqAqCKt8+nJD7XxmoOdCsROhDeZIcUWAUNpZBUAT/+BxkmT7iIHoGWdNkWPj4jDr/rZYepjiJHQVsXdAiEhzEiTbRVsR4uADgnnIcmSIcLxDo0YTZe0suh6fg0EiCtEs02JtdWbo8FtafPSaFg6kPoFzwx3RS3LhLodxJBEoIKVNTMIbxCyirsxuao3DAwUZs9buGueAeylG5SGE4gZxpOZhi8Fb9iGBxDW8D2lU635LYvcxvivyWBk9jNR9cEx3EysloIoSlllxQm5FNywHjV9zGZb9sW7sJAcFzMFU6KxnNDibH8g3TwacNmgFrUqptuiavEa+3pi3dqSMsKLIIlCk6faV9cmykpyTF0CPXv8yLbr
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 08:12:46.1328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5450e89f-be5e-420b-fbfd-08df49398e78
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000008E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB7536



On 11/21/26 00:01, Francesco Valla wrote:
> The comment for virtio_rpmsg_config says that this structure is
> naturally aligned to 32 bits, and this is desirable by some
> architectures that don't get along with unaligned accesses.
> The content of the structure itself however isn't aligned, and the
> __packed attribute prevent the compiler to add this alignment.
> 
> Fix this by extending the version field to 16 bits.
> 
> Fixes: ca96ea25e51a ("rpmsg: virtio_rpmsg_bus: Get buffer size from config space")
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
> Changes in v2:
> - version field extended to 16 bits instead of adding a reserved byte.
> - Rebased on current master.
> - Link to v1: https://patch.msgid.link/20261101-rpmsg-config-size-v1-1-65686b445b22@valla.it
> ---
>   drivers/rpmsg/virtio_rpmsg_bus.c   | 2 +-
>   include/linux/rpmsg/virtio_rpmsg.h | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 23ff6c8b7a20..27282475a732 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -815,7 +815,7 @@ static void rpmsg_virtio_del_ctrl_dev(struct rpmsg_device *rpdev_ctrl)
>   static int rpmsg_virtio_get_buf_size(struct virtproc_info *vrp)
>   {
>   	struct virtio_device *vdev;
> -	u8 version;
> +	u16 version;
>   	u16 size;
>   
>   	vdev = vrp->vdev;
> diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/virtio_rpmsg.h
> index 0872cbca4593..57f48d537de9 100644
> --- a/include/linux/rpmsg/virtio_rpmsg.h
> +++ b/include/linux/rpmsg/virtio_rpmsg.h
> @@ -31,7 +31,7 @@
>    * the structure is naturally 32-bit aligned.
>    */
>   struct virtio_rpmsg_config {
> -	u8 version;
> +	__virtio16 version;
>   	__virtio16 size;
>   	/* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
>   	__virtio32 txbuf_size;


Acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

Thanks,

Arnaud

> 
> ---
> base-commit: 5f22fb20497f4983094131f00a734362300d22d2
> change-id: 20261101-rpmsg-config-size-0dbe9ea63c6d
> 
> Best regards,
> --
> Francesco Valla <francesco@valla.it>
> 

