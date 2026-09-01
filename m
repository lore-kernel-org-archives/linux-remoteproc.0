Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011031.outbound.protection.outlook.com [40.107.130.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC8239A054;
	Tue,  1 Sep 2026 12:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788267391; cv=fail; b=q+PCS8uoqYS4WoVyo3Z/aJZzM9NFeI5Um6Ikanlk2Cotv4ug+QlP2R80yw4cpmzOMfTW201HBmdJpBMWfImtX7OORUmA6AwScEuyWZbSM33OoPSAYhjIM3vMVleu92wrtkIPIuXe1OrjBwAAA/9W1jZIUnCqhFKX0kNbhivm2Q0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788267391; c=relaxed/simple;
	bh=2Qt0pBUKEbDrKfMpagUrfIRja1B8hB5x6RUQZY++bk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ofWVo0XEpT7HMF3t9OwFYwH+of63V4ThGm5zpF5TczqTJjsyoofyq8hYK3ZOtsLnL2o3pfdWv03xZ2RJY2QsUuI/aJQAt5z+5N9Wfk/zFBucDUCbOMholKWF+vvBrLlTiIVviu0mpsw2GlSDhI4WQ+oSFwCULvbmYYPOeKa5tyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=e4lxCHnf; arc=fail smtp.client-ip=40.107.130.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="e4lxCHnf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r8KJKW715kVUjZ0mOqrc7b8ntsC2l+7FjteGVtv81SgP2JDtslb9IFf8UIzNqWDY6+ogExn19wGoQjjQHXVh4pEd3kSHl9phR2NbaFU3sP4ERqYi4ZpcVNcx2FAV83RoJLhuzjjQLpWaYsxzGVgBimkSu297eEHn1szRHqSGnH4E/ETy0Of2BK6GytlCAKXzN6gLZpHtG0lDYZemoONI68UYnbViCdzzFq/eCHzXBJBhHL+hfBn2aNbXSG/WaW+heXLPmrbtZoRv+jwM8TllScw1jmFGobtPrRXXk8BqkYQD8puLSXQmMLJqO+RAYjjFWGdRt3KPDzEC9ZactqNM9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMb3+FTdFImZh12e4/E1rZ9zJYp5rNMswF29E4cAvTg=;
 b=IdO/YrmoyM+2ONa75SoeXlLD2/EETNxWFGFHrCrt+LeDESrB6C8F2sDhEwdKjbdZ76JPpjKxFV3U/b61xn8VtvCG940eHhBrWuSHvW/JguebtEkiKtFDTQsoNAs9hcWHvdQaWqCp1oZxeWI1QwRNcVKWvmX/dup9gjpyJW9nkkoSMn1zl8sgWhiFcFVqxHum1AUzqiRq6hf5bhA//ps8XCIC8WixqVxrhTmFUENYTxMNjCOV2BZYqJrrrf/SSzt6R+5Kr9iZDoWpk8f7fZM/GMQ353o0NHX/72MQmVXeYbeBosB/0eLmoS1XZqye58S/zyPnU+yzX3lXyH3lIicZcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.87) smtp.rcpttodomain=amd.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMb3+FTdFImZh12e4/E1rZ9zJYp5rNMswF29E4cAvTg=;
 b=e4lxCHnfhW1jpQMtesgwweEtsjP2vwV90WvqCVOvsHmEFRsium46lnCaFJYzZj/Ki6+LGa5dmtC5XIo+sI1UxQY6hfa2PM2TEuSS2I4zyTweCSGVeNPTD6xbyPgKtnrwUCPPrSXPXe0NikjskvXKs6GA0PgVTRX5RdAlHYvuuMzkcF6o4jo9/YyzgikEF4m0mu4YduINmqQaEW33FNs07loRs90xRpl4qKfAQVulFTQPcCX+Bp5jsNjDE100rP9Q976Q4smm/Pmsbtm2j7q1XjgyyJBgERhmVi1SaFIJ77BNOJOJhgAF7niFmHGOFf1TZq9BUkcoUWXOyJzAKwNyrw==
Received: from AS8PR04CA0040.eurprd04.prod.outlook.com (2603:10a6:20b:312::15)
 by DU0PR10MB6388.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:40b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 12:56:25 +0000
Received: from AMS0EPF000001B1.eurprd05.prod.outlook.com
 (2603:10a6:20b:312:cafe::3) by AS8PR04CA0040.outlook.office365.com
 (2603:10a6:20b:312::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Tue, 1
 Sep 2026 12:56:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.87)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.87 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.87; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.87) by
 AMS0EPF000001B1.mail.protection.outlook.com (10.167.16.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Tue, 1 Sep 2026 12:56:24 +0000
Received: from ENXDAG1NODE4.st.com (10.75.129.197) by smtpo365.st.com
 (10.250.44.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 1 Sep
 2026 14:58:21 +0200
Received: from [10.48.87.127] (10.48.87.127) by ENXDAG1NODE4.st.com
 (10.75.129.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 1 Sep
 2026 14:56:23 +0200
Message-ID: <720d36e8-df57-41fc-9764-ce66addc066e@foss.st.com>
Date: Tue, 1 Sep 2026 14:56:21 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] docs: rpmsg: add virtio config space details
To: Tanmay Shah <tanmay.shah@amd.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260828145853.2843486-1-tanmay.shah@amd.com>
 <20260828145853.2843486-5-tanmay.shah@amd.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <20260828145853.2843486-5-tanmay.shah@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To ENXDAG1NODE4.st.com
 (10.75.129.197)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B1:EE_|DU0PR10MB6388:EE_
X-MS-Office365-Filtering-Correlation-Id: b1ecbb75-76be-4a2f-ab58-08df08286de9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|3023799007|11063799006|10067099003|4143699003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Ai0Hnd30PxOeUE83ieRstqWrjMVk7IYW23yxAIxl3igLCJefBx01vbZndlznLh1/sUhPTlqx88AlF3qQtjxwXlrVAG+B1gGahRV4ZoBaTElIvp3kV224forb0x4K2QQ1VSF4r6lSdEl2XktQ0Lcx1aikwbPeiLE6fImgND8eJoi4Q2Q5UkK6XDsenmlRyEtnucl+DQssIeGtPlgLtBLbsQVbuMiXi6LIj78e9mt9R+RfsSsCpPY5t8d+K/E8i+aBZHEd39kd5ZXT6i7kCgu6Buc4ulcPVxNSFCQrUjXib+pvFF0AxdswCSESatesaJ3LhwGFG3Xgbe7G1aheC8ARL6M5cv8rzTlsmumGsEpMF6X0G62+grLdY49Xz4N0hIzK0gIwgwKyScbU2xRrofkzCkgSjLTL0jfElEdhO2d2zIxT4gSx5YH2jkksVc2zZnTXdrxhFn921O56NmuFJNHx2II+KtX0uBp4X63km7j+vxnlJOvNOnWkpMNBn7nYD7fCTlnOlQ2WpDGMA9EzYssxpstkV4/qDDGM/5yV6MAtts+pET9Yi4JEbwfgF5FL3MsKQTO9oDexNFfRqi0hmMEsTg/9bjnAtmjz9W6M608NnBOWn037NFjL3AxV0Q50QoezvNVsDG/OnlzIyx/J53oewlgMa9BIhhBUGcdEx8M79D4crfQ1XABdC6W0hWfLighibYYS9F5CSeIdQXVF+7Im/A==
X-Forefront-Antispam-Report:
	CIP:164.130.1.87;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(3023799007)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	50A8Lr3pX2jhAYZm3C7I58Kh5NM5UHiFTIU7czvtuzla2y4hyqq+iJoZrqCJhKouN6em+jlal6bkA1T91LeyuncLcsSpsm8WpHo9mWH+FPkpTG91ac8emeGsinT2fKpVyNFH4y/T3SCppFYwv4zIm+0JBrbAKy0jFPtLXgZw+26kC23l+on0rsI01+Zgs1xYQshZkkqNxTHXXEEsOY3rp0Rct3+mLRJgnq0VbG7ux5hYysiPS29lQuXLdaRSaWWupspTnfMse7H61Ch1P1paFbAZiab2Pm4k70lNwaP64vd9ZHmP4wp/smGzMoo8QzHq3W08+48rOkNgqcM3LyfKWGzbtFs0fEB2Yx8MI6adQPwvdQ2qjUZjtxMHBXpOjfXx4NPkwxPYbpwG+GbQ57KG86BermUughMfofU6fFirh0kBZ6M5AUdK5Mta8drXLN4q
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 12:56:24.4788
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1ecbb75-76be-4a2f-ab58-08df08286de9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.87];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6388



On 8/28/26 16:58, Tanmay Shah wrote:
> The virtio config space can provide single rpmsg buffer size in each
> direction. Document details of the configurable buffer size via virtio
> config space.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
> 
> Changes in v8:
>    - "%s/or differnt RX and TX sizes)/or different RX and TX queue sizes)/"
> 
> Changes in v6:
>    - rpmsg.rst: modify alignment related documentation
> 
> Changes in v5:
>    - fix documentation of buffer alignment
> 
>   Documentation/staging/rpmsg.rst | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/staging/rpmsg.rst b/Documentation/staging/rpmsg.rst
> index 63612b7ee120..d711d1643bab 100644
> --- a/Documentation/staging/rpmsg.rst
> +++ b/Documentation/staging/rpmsg.rst
> @@ -299,3 +299,20 @@ by the bus, and can then start sending messages to the remote service.
>   
>   The plan is also to add static creation of rpmsg channels via the virtio
>   config space, but it's not implemented yet.
> +
> +Configurable buffer sizes
> +=========================
> +
> +By default each rpmsg buffer is 512 bytes, and the same size is used for both
> +the receive and transmit directions. Remote processors that need a different
> +size (for example a larger MTU, or different RX and TX queue sizes) can
> +advertise it through the virtio device config space by setting the
> +VIRTIO_RPMSG_F_BUFSZ feature bit.
> +
> +When this feature is negotiated, the driver reads struct virtio_rpmsg_config
> +from the config space. This structure provides the size of a single buffer for
> +each direction (TX and RX). The device should advertise TX/RX buffer sizes
> +that already satisfy its own alignment constraints.

Nitpicking: following sentence seems to me more explicit as the alignment
concerns the buffer address. It is only a suggestion

The device should advertise TX/RX buffer sizes that already satisfy the
alignment constraints of its buffers.

Thanks,
Arnaud

> +
> +If the feature is not negotiated, the default 512-byte buffers are used for
> +both directions.

