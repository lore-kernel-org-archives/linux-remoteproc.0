Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793271236;
	b=qUjPPmbL0g9LkFlRaBjSljCYJfgtbgm8qEt4KQkthZhUoSQsF7c79CJSmyRSpJy5natD
	 YZCyk56j9G0hKRU7Q8i2ut5Hqv36nuCDNwsgA0g/Y/Wk+52KKcYoGUcacCyiBrnLykbF7
	 8UUeZ31B/5pEzYcDNKs1KNld3Qvtsqp2+MqCWHsFZ7piwjTbOs6ZjIzntHPurHIDWjL1U
	 SNqG7ICaFhRTQZmv0w9dHqkx3q7Y6i8qn1jwtsMHPhqm8ZnSrvQeSqCq3H7W7+81ve0UT
	 NJCJ+2+Q1+iIV8C1TCrwlz/yn2ElDr7q9HnCSegAGJY1r+9x7uAsTO2OfE5f8TthCZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271236;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:CC:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4036HqxdFQbDUDNe4vol+f7UXAmOT2w9cQpHslNyjpQ=;
	b=HFVlmXoFM9iiijgTkm7mxMxuSw9A8QFuxArnvhX4wOwfFf9wtOiFDqkh9wk2Vgsld+g4
	 KtCn+DeOhDZg8MPf2npjM0yo5BV/0fUR6Ewxv/H/z40GC1w07mqo9pJ9Y2n1/RCCvAJoJ
	 ZPZZhaP5cxy54Vv1hgo5Acs527JGJdE741WIy3FXSYSJj0H89MGwna6knDhppqjN7o2Q1
	 kYbknpeNzFk2tTtdry/5P6sTs93C9WLpWXvzYWP2tdN4Qce7xmGnaxHIXUyN3sqWqO0XC
	 /2FI9Sv8GY43HuQxmTFKkpKGGqmGDGpva3cTH8mfKVE80gVGjqclT5TtZJOAlYBOFxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b="QfU/rZBU";
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=awLSuHs+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43A8606A31D;
	Thu, 29 Oct 2026 10:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B43A8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=QfU/rZBU;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=awLSuHs+
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69T8vnou2165980;
	Thu, 29 Oct 2026 05:53:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=4036HqxdFQbDUDNe4vol+f7UXAmOT2w9cQpHslNyj
	pQ=; b=QfU/rZBUD0Swfz7ZK6ea+K4IlYiL8EobFXxqnpyttCzYA1P8JFI2oMTqG
	VfycPGzPTpzzZBIFjZIXNtfR7p8YuDH+h3ONRfi1/DC4PRKd1TfRiHjpQ4dClF7L
	GMwdcCFPdhC2EAwfxVtSHlJpRSvGKk44IeiWohrSz/eVTAWw3ZeihIHlp96uwIHT
	wDiVXUypKZUVlObyAPPlDZXFXdzRjboOYN/RIui6tDKwSKKRSl0jVxVHWP66y41O
	KssiGtkwADLo/u4JdmnnXQ1zqJOsJwusjYaQFjA19Girgp8vbVxDA0ZmujxI1KQh
	rce2fKeofzTcFuhPDTApeVwngyFTQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013011.outbound.protection.outlook.com [40.93.201.11])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hkurv3pm1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2026 05:53:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wc103/PnwiNM/AlhM6h9+wOZaTifEBA0R/BkvG1b9Cu6EWwV52s2gVG1eJcWWn1Yn5LhO7glZ1/3GjgR3Org+6aOj3sJimHC423Y/UjWk19N9fMq34Nl/Y/tS2yLdGxzVMXmy2+F0vOjxBXH/+e81GzUkGr0qunhyA4DRcN2rUAG8uYNmIh4cVP3BsRUfZvlH1LHNgMBNz7lfHEZBOqWDSm5nzdmQcuT113/VReXLuNnvHEYltAXhSk8iTjYxEW6YFhjh9FUtFJctOwHxJpYpIZkscyTIEPOskkkkarJf1Vx1qweR+jnoJQBA3yNKsJMbbrrYcZ+8e6GLHFUlc5vTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4036HqxdFQbDUDNe4vol+f7UXAmOT2w9cQpHslNyjpQ=;
 b=Cc77YQIR/Q8RP7GnaUSuDh+a7i5dYtgHw5HdRizj19CUlaPk2MBUUjg2lrLLCXFx3WWaMqAN4ykrugs9NCnWoI3vxFtiIxWmrNxRpKRhRgxGVYYLzaGIUHjCK704f9YZtuvItJ/KvPYXvKJ5VFWFY3WYsdPWjc4/c4/7/+dueF8IrFHXX89jb/D0J7torrGvOjFUlC6B1YLO4WFyQWnmnJr5Ui8eO7LGL3ebC65c7k+qVoRGYrvRmIIrse6AbXNXB4NmPIApviw5MoitOq6KbQR1LunCQq47hocbeKCtY4valabyuoWbqvMH6g+p5L5veM3NDW+fNJVZVXm2a73F7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4036HqxdFQbDUDNe4vol+f7UXAmOT2w9cQpHslNyjpQ=;
 b=awLSuHs+lQbf+zip+sGgMkxa8mxSqHB1nXyE/XIdwNd64mJP7lzMAmKnCfJDtgWHt4cSw0lpKWMGA5nxY7TIMrmn1EkevZhFmz9t8l5m0lyASa1FVVNNk3sCuWjZsWWu1XFnV0eGGQNmxjxnSJOvwqnWGA/HwO3RhAK6yw8781E=
Received: from PH8P221CA0058.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:349::7)
 by SA2PR10MB4618.namprd10.prod.outlook.com (2603:10b6:806:11f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 10:53:40 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:510:349:cafe::63) by PH8P221CA0058.outlook.office365.com
 (2603:10b6:510:349::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.8 via Frontend Transport; Thu, 29
 Oct 2026 10:53:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 10:53:38 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 05:52:59 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 05:52:58 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 29 Oct 2026 05:52:58 -0500
Received: from [10.24.50.162] (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69TAqums2760297;
	Thu, 29 Oct 2026 05:52:57 -0500
Message-ID: <6e57e9fd-91d7-41eb-85a3-76583238aac1@ti.com>
Date: Thu, 29 Oct 2026 16:22:56 +0530
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
Subject: Re: [PATCH v2 1/2] remoteproc: Add ti_sci_dev_ops abstraction
To: Siddharth Karanam <sid9.karanam@gmail.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
References: <20261014103241.3847-1-sid9.karanam@gmail.com>
 <20261014103241.3847-2-sid9.karanam@gmail.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <20261014103241.3847-2-sid9.karanam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|SA2PR10MB4618:EE_
X-MS-Office365-Filtering-Correlation-Id: dbd4d9b9-833f-42b9-608b-08df35aae38a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|10067099003|6133799003|56012099006|4143699003|3023799007|22082099003|18002099003|261009223027099003|13003099007|261021121427099003|261022113327099003|261022105027099003|261022075727099003|261028144727099003|261026140227099003|261021123027099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	S6KoZVSccsJEMPVwXy84Xqd4VWXUzq71Qrlq8wbraLIfY6e97imnICRJxEE+hfSp4Kn1hpirn+pVWmEN4t3c8jEHQIif5gO/MQcVc6RxgZvZxd+4sDveUkulp3hVIwJbmn9x1jZ/17XmE7Wlo7eX7rrhoLl+qDBI4vwNnVEJx6essokzBkNoignIrp9TpWmIqiWX8s1dFS7L88zf3/lYHBBJsLoLNr/SX+/1eySmmViniyuRNJgbWttLa1RBkOTVyIiSHMI9hIZyMyMdGrUgIi4l86l+aYBMhu7uha5PyFCv02SJ2OBQJwa6WTkWid3ebIf+KgC5bltNekZwQVZ0LhDfsj/ACaQu9v+ka5gp5WlG483iNrqfUQrMQACebySsNIiNwngIm70eNEL3nhf4Fu6HhstnU8XsYsBYjY0UBBrVCDfgDpwEoWRr/FoHww9vlHccWOiliAOCHKn5+zloxcp4qioY/IZeKCF8jBF4NYPqzYTleI/dn5fpmxr2wdOeuIeKc9qUtR91dXvzEJBhvFBa4DtCTZ5lPD8zmTyVJG0O3Sb/YKdCvVhGsHVlihWUDI1bnPdrVvnhnfJ7iGUqYlER/9BLDlzuM7rhZCtX4QIeapr5MWK6elBD8xyC/Df98iVoYhaLBgtjsSpr5PkyBQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(10067099003)(6133799003)(56012099006)(4143699003)(3023799007)(22082099003)(18002099003)(261009223027099003)(13003099007)(261021121427099003)(261022113327099003)(261022105027099003)(261022075727099003)(261028144727099003)(261026140227099003)(261021123027099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5EF81ix3mAG0PGm1BzGu2McuOhZVKDoRLRAtSuP0nD/M65DKIcpd22787Hymli3pZyUnqWOTqtpiWEohc5xQBCMldx+QdkzvwL3qcfAlpTL7ZDIVf8HAr9JfUwvCfDS4GqDR1t96N+bHOYkPTt86j1rwODJncnfMIqhK7QqvUei7A6i7xExVg+uXRyEjfiRDVrwYQ+d5gBKWfkplY2Fi17V10VctVwdkVTMqYcZuSPRmUrNTza88pvuJzW7Ib/IEwkfrbXRzNkSgIWGKGQmkmUNJb2SZcJe2uxfrEi7gTGzCiPhlR/5Oaoqd4BkKHaEO1U+fIBPHFT6G8k5GDYHifrirJxRR6p68zPB3mhKZNoSMAqGCRFKfc4UX6QBs9L62QhhXJ6sikG7lR/m1323uD1IGvEB2ZnmjZ2TuMJCemN5xibhWKL6Cqvl8IdYqukMF
X-Exchange-RoutingPolicyChecked:
	sxZzD61qwjSKX2m2awcHabtmaBLqDDPuBX0Ef3GIaijG4HZbCqejanztxQOhQz8oKRQQEae8m65cCoNXID7RHaAWiMGqZ2WA16WgrAlu5i51gs+YZHkoUvucguBlhV+73X2I3WLSlkETmKgyqquu4p/qYyP8AiP7sUdnVC0GGp5Qa4oAjpjjQ2APVVcnz4bhhza0Jabcf2dr0jw3UStKIKpn+qKv/jYThCjftiSykSSBTUm3pa0n8xJ5h1VOzaqDarIMev09gDJYhpP5kRW3hZwOjSSkcJXk0P5bNE3OlRFwEwWXRDkKDGpw1hFI0Badzcpnd1Hs9PB3thI2CDWt5A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 10:53:38.6793
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbd4d9b9-833f-42b9-608b-08df35aae38a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4618
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0MiBTYWx0ZWRfXwGXaS4AM9u4c
 BBNz4MCqrN2uCny7gZIS06SQRzgh+wrtmUqyZCedWhU9xkj7H29SgHKOAu5UG6Rirrt5SVs58eH
 ZGopTo2oefI3nSZHMvfyZclAINKmdNx95oy2FC9cePQIcStxcdFi53Wxp5F0QFzxm1li5CN7aym
 lu5J4zgasq8y1ubpoFyrX3+LXosflNtrDI6/ANuRQYF1tnvtvd396ZELOc73cBWqWMB+GtB18GG
 cqRejYD9f9nWBGzt8NEYEh0gzoZpUVNBzz1eAQ/38SS22GR1ffhNv0sjkFcWX0m2URMdASl7tlK
 NBvPsU6sOHXfd20dldKxDG7/5p8IPwMQ4G3K/iDOHpDxoHKVAvSfARZQIZ/dOuLsy1GeLboP+5F
 NudiPaw34AWUWJ/sqnzVR0J/MWSR/WvpXDPv5s6spRM7GyyS4lUB1oe8Z2npkWjdaNK6NVSVzef
 Dsfn2gjKQIU/EgWzlZg==
X-Proofpoint-ORIG-GUID: 0DeIdjdmaxbLM807Jc0HNK-0YfzVOT56
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0MiBTYWx0ZWRfX71S7FkWIzEO2
 bMHexjfw7RcN3o+ewK4u56bkw9MtGfsbpl3JaTngxXXUdupjwXkLTQFR4qbJR36leo10QSd74WL
 ZykoFmP6yUn8Jn98dMNrGcE0Epu5yfo=
X-Proofpoint-GUID: 0DeIdjdmaxbLM807Jc0HNK-0YfzVOT56
X-Authority-Analysis: v=2.4 cv=epNKXYpX c=1 sm=1 tr=0 ts=6ae325b9 cx=c_pps
 a=NzAOMTrFL2nmaFUJOsdohw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8
 a=9xkm5mRPVq_RN2qXlsEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290042

Also, in both the patches, please add k3 prefix in $Subject-line.

Something like: "remoteproc: k3: Add ti_sci_dev_ops abstraction"

Thanks,
Beleswar

On 14/10/26 16:02, Siddharth Karanam wrote:
> Instead of invoking ti_sci_handle's ti_sci_dev_ops member directly
> in the driver code, this abstracts the property read of
> "ti,sci-dev-id" and the function pointers supported by
> ti_sci_dev_ops such as is_on, get_device and put_device.
>
> The goal of the patch is to maintain a single source
> of origin for all ti_sci_dev_ops call sites. Any stray calls
> to any dev_ops function pointer members in driver code should
> eventually be abstracted through this header.
>
> Signed-off-by: Siddharth Karanam <sid9.karanam@gmail.com>
> ---
>  drivers/remoteproc/ti_k3_common.c         | 16 ++---
>  drivers/remoteproc/ti_k3_common.h         |  4 +-
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c | 14 ++--
>  drivers/remoteproc/ti_k3_m4_remoteproc.c  | 13 ++--
>  drivers/remoteproc/ti_k3_r5_remoteproc.c  | 40 +++++------
>  drivers/remoteproc/ti_sci_dev.h           | 82 +++++++++++++++++++++++
>  6 files changed, 120 insertions(+), 49 deletions(-)
>  create mode 100644 drivers/remoteproc/ti_sci_dev.h
>
> diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
> index 3cb8ae5d72f6..befa9a9bea3a 100644
> --- a/drivers/remoteproc/ti_k3_common.c
> +++ b/drivers/remoteproc/ti_k3_common.c
> @@ -32,6 +32,7 @@
>  
>  #include "omap_remoteproc.h"
>  #include "remoteproc_internal.h"
> +#include "ti_sci_dev.h"
>  #include "ti_sci_proc.h"
>  #include "ti_k3_common.h"
>  
> @@ -120,8 +121,7 @@ int k3_rproc_reset(struct k3_rproc *kproc)
>  		if (ret)
>  			dev_err(dev, "local-reset assert failed (%pe)\n", ERR_PTR(ret));
>  	} else {
> -		ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
> -							    kproc->ti_sci_id);
> +		ret = ti_sci_dev_put_device(kproc->tsd);
>  		if (ret)
>  			dev_err(dev, "module-reset assert failed (%pe)\n", ERR_PTR(ret));
>  	}
> @@ -140,13 +140,11 @@ int k3_rproc_release(struct k3_rproc *kproc)
>  		ret = reset_control_deassert(kproc->reset);
>  		if (ret) {
>  			dev_err(dev, "local-reset deassert failed, (%pe)\n", ERR_PTR(ret));
> -			if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
> -								  kproc->ti_sci_id))
> +			if (ti_sci_dev_put_device(kproc->tsd))
>  				dev_warn(dev, "module-reset assert back failed\n");
>  		}
>  	} else {
> -		ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
> -							    kproc->ti_sci_id);
> +		ret = ti_sci_dev_get_device(kproc->tsd);
>  		if (ret)
>  			dev_err(dev, "module-reset deassert failed (%pe)\n", ERR_PTR(ret));
>  	}
> @@ -223,8 +221,7 @@ int k3_rproc_prepare(struct rproc *rproc)
>  		}
>  	}
>  
> -	ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
> -						    kproc->ti_sci_id);
> +	ret = ti_sci_dev_get_device(kproc->tsd);
>  	if (ret) {
>  		dev_err(dev, "could not deassert module-reset for internal RAM loading\n");
>  		return ret;
> @@ -253,8 +250,7 @@ int k3_rproc_unprepare(struct rproc *rproc)
>  	if (rproc->state == RPROC_DETACHED)
>  		return 0;
>  
> -	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
> -						    kproc->ti_sci_id);
> +	ret = ti_sci_dev_put_device(kproc->tsd);
>  	if (ret) {
>  		dev_err(dev, "module-reset assert failed\n");
>  		return ret;
> diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
> index aee3c28dbe51..7ba0903ebe0a 100644
> --- a/drivers/remoteproc/ti_k3_common.h
> +++ b/drivers/remoteproc/ti_k3_common.h
> @@ -72,8 +72,8 @@ struct k3_rproc_dev_data {
>   * @reset: reset control handle
>   * @data: pointer to DSP-specific device data
>   * @tsp: TI-SCI processor control handle
> + * @tsd: TI-SCI device control handle
>   * @ti_sci: TI-SCI handle
> - * @ti_sci_id: TI-SCI device identifier
>   * @mbox: mailbox channel handle
>   * @client: mailbox client to request the mailbox channel
>   * @priv: void pointer to carry any private data
> @@ -88,8 +88,8 @@ struct k3_rproc {
>  	struct reset_control *reset;
>  	const struct k3_rproc_dev_data *data;
>  	struct ti_sci_proc *tsp;
> +	struct ti_sci_dev *tsd;
>  	const struct ti_sci_handle *ti_sci;
> -	u32 ti_sci_id;
>  	struct mbox_chan *mbox;
>  	struct mbox_client client;
>  	void *priv;
> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> index d6ceea6dc920..b6042fe7bae7 100644
> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> @@ -19,6 +19,7 @@
>  
>  #include "omap_remoteproc.h"
>  #include "remoteproc_internal.h"
> +#include "ti_sci_dev.h"
>  #include "ti_sci_proc.h"
>  #include "ti_k3_common.h"
>  
> @@ -69,7 +70,6 @@ static const struct rproc_ops k3_dsp_rproc_ops = {
>  static int k3_dsp_rproc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	struct device_node *np = dev->of_node;
>  	const struct k3_rproc_dev_data *data;
>  	struct k3_rproc *kproc;
>  	struct rproc *rproc;
> @@ -110,10 +110,6 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(kproc->ti_sci),
>  				     "failed to get ti-sci handle\n");
>  
> -	ret = of_property_read_u32(np, "ti,sci-dev-id", &kproc->ti_sci_id);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "missing 'ti,sci-dev-id' property\n");
> -
>  	kproc->reset = devm_reset_control_get_exclusive(dev, NULL);
>  	if (IS_ERR(kproc->reset))
>  		return dev_err_probe(dev, PTR_ERR(kproc->reset),
> @@ -124,6 +120,11 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(kproc->tsp),
>  				     "failed to construct ti-sci proc control\n");
>  
> +	kproc->tsd = ti_sci_dev_of_get_tsd(dev, kproc->ti_sci);
> +	if (IS_ERR(kproc->tsd))
> +		return dev_err_probe(dev, PTR_ERR(kproc->tsd),
> +				     "failed to construct ti-sci dev control\n");
> +
>  	ret = ti_sci_proc_request(kproc->tsp);
>  	if (ret < 0) {
>  		dev_err_probe(dev, ret, "ti_sci_proc_request failed\n");
> @@ -141,8 +142,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "reserved memory init failed\n");
>  
> -	ret = kproc->ti_sci->ops.dev_ops.is_on(kproc->ti_sci, kproc->ti_sci_id,
> -					       NULL, &p_state);
> +	ret = ti_sci_dev_is_on(kproc->tsd, NULL, &p_state);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to get initial state, mode cannot be determined\n");
>  
> diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> index 3a11fd24eb52..ddf8cb9974ca 100644
> --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> @@ -18,6 +18,7 @@
>  
>  #include "omap_remoteproc.h"
>  #include "remoteproc_internal.h"
> +#include "ti_sci_dev.h"
>  #include "ti_sci_proc.h"
>  #include "ti_k3_common.h"
>  
> @@ -70,10 +71,6 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(kproc->ti_sci),
>  				     "failed to get ti-sci handle\n");
>  
> -	ret = of_property_read_u32(dev->of_node, "ti,sci-dev-id", &kproc->ti_sci_id);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "missing 'ti,sci-dev-id' property\n");
> -
>  	kproc->reset = devm_reset_control_get_exclusive(dev, NULL);
>  	if (IS_ERR(kproc->reset))
>  		return dev_err_probe(dev, PTR_ERR(kproc->reset), "failed to get reset\n");
> @@ -83,6 +80,11 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(kproc->tsp),
>  				     "failed to construct ti-sci proc control\n");
>  
> +	kproc->tsd = ti_sci_dev_of_get_tsd(dev, kproc->ti_sci);
> +	if (IS_ERR(kproc->tsd))
> +		return dev_err_probe(dev, PTR_ERR(kproc->tsd),
> +				     "failed to construct ti-sci dev control\n");
> +
>  	ret = ti_sci_proc_request(kproc->tsp);
>  	if (ret < 0)
>  		return dev_err_probe(dev, ret, "ti_sci_proc_request failed\n");
> @@ -98,8 +100,7 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "reserved memory init failed\n");
>  
> -	ret = kproc->ti_sci->ops.dev_ops.is_on(kproc->ti_sci, kproc->ti_sci_id,
> -					       &r_state, &p_state);
> +	ret = ti_sci_dev_is_on(kproc->tsd, &r_state, &p_state);
>  	if (ret)
>  		return dev_err_probe(dev, ret,
>  				     "failed to get initial state, mode cannot be determined\n");
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index b1d04d082e44..a387848ac400 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -25,6 +25,7 @@
>  
>  #include "omap_remoteproc.h"
>  #include "remoteproc_internal.h"
> +#include "ti_sci_dev.h"
>  #include "ti_sci_proc.h"
>  #include "ti_k3_common.h"
>  
> @@ -140,8 +141,7 @@ static int k3_r5_split_reset(struct k3_rproc *kproc)
>  		return ret;
>  	}
>  
> -	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
> -						    kproc->ti_sci_id);
> +	ret = ti_sci_dev_put_device(kproc->tsd);
>  	if (ret) {
>  		dev_err(kproc->dev, "module-reset assert failed, ret = %d\n",
>  			ret);
> @@ -156,8 +156,7 @@ static int k3_r5_split_release(struct k3_rproc *kproc)
>  {
>  	int ret;
>  
> -	ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
> -						    kproc->ti_sci_id);
> +	ret = ti_sci_dev_get_device(kproc->tsd);
>  	if (ret) {
>  		dev_err(kproc->dev, "module-reset deassert failed, ret = %d\n",
>  			ret);
> @@ -168,8 +167,7 @@ static int k3_r5_split_release(struct k3_rproc *kproc)
>  	if (ret) {
>  		dev_err(kproc->dev, "local-reset deassert failed, ret = %d\n",
>  			ret);
> -		if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
> -							  kproc->ti_sci_id))
> +		if (ti_sci_dev_put_device(kproc->tsd))
>  			dev_warn(kproc->dev, "module-reset assert back failed\n");
>  	}
>  
> @@ -196,8 +194,7 @@ static int k3_r5_lockstep_reset(struct k3_r5_cluster *cluster)
>  	/* disable PSC modules on all applicable cores */
>  	list_for_each_entry(core, &cluster->cores, elem) {
>  		kproc = core->kproc;
> -		ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
> -							    kproc->ti_sci_id);
> +		ret = ti_sci_dev_put_device(kproc->tsd);
>  		if (ret) {
>  			dev_err(core->dev, "module-reset assert failed, ret = %d\n",
>  				ret);
> @@ -210,8 +207,7 @@ static int k3_r5_lockstep_reset(struct k3_r5_cluster *cluster)
>  unroll_module_reset:
>  	list_for_each_entry_continue_reverse(core, &cluster->cores, elem) {
>  		kproc = core->kproc;
> -		if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
> -							  kproc->ti_sci_id))
> +		if (ti_sci_dev_put_device(kproc->tsd))
>  			dev_warn(core->dev, "module-reset assert back failed\n");
>  	}
>  	core = list_last_entry(&cluster->cores, struct k3_r5_core, elem);
> @@ -233,8 +229,7 @@ static int k3_r5_lockstep_release(struct k3_r5_cluster *cluster)
>  	/* enable PSC modules on all applicable cores */
>  	list_for_each_entry_reverse(core, &cluster->cores, elem) {
>  		kproc = core->kproc;
> -		ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
> -							    kproc->ti_sci_id);
> +		ret = ti_sci_dev_get_device(kproc->tsd);
>  		if (ret) {
>  			dev_err(core->dev, "module-reset deassert failed, ret = %d\n",
>  				ret);
> @@ -264,8 +259,7 @@ static int k3_r5_lockstep_release(struct k3_r5_cluster *cluster)
>  unroll_module_reset:
>  	list_for_each_entry_from(core, &cluster->cores, elem) {
>  		kproc = core->kproc;
> -		if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
> -							  kproc->ti_sci_id))
> +		if (ti_sci_dev_put_device(kproc->tsd))
>  			dev_warn(core->dev, "module-reset assert back failed\n");
>  	}
>  
> @@ -827,8 +821,7 @@ static int k3_r5_rproc_configure_mode(struct k3_rproc *kproc)
>  
>  	core0 = list_first_entry(&cluster->cores, struct k3_r5_core, elem);
>  
> -	ret = kproc->ti_sci->ops.dev_ops.is_on(kproc->ti_sci, kproc->ti_sci_id,
> -					       &r_state, &c_state);
> +	ret = ti_sci_dev_is_on(kproc->tsd, &r_state, &c_state);
>  	if (ret) {
>  		dev_err(cdev, "failed to get initial state, mode cannot be determined, ret = %d\n",
>  			ret);
> @@ -1023,7 +1016,6 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct k3_rproc *kproc;
>  	struct k3_r5_core *core, *core1;
> -	struct device_node *np;
>  	struct device *cdev;
>  	const char *fw_name;
>  	struct rproc *rproc;
> @@ -1032,7 +1024,6 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>  	core1 = list_last_entry(&cluster->cores, struct k3_r5_core, elem);
>  	list_for_each_entry(core, &cluster->cores, elem) {
>  		cdev = core->dev;
> -		np = dev_of_node(cdev);
>  		ret = rproc_of_parse_firmware(cdev, 0, &fw_name);
>  		if (ret) {
>  			dev_err(dev, "failed to parse firmware-name property, ret = %d\n",
> @@ -1067,12 +1058,6 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>  			goto out;
>  		}
>  
> -		ret = of_property_read_u32(np, "ti,sci-dev-id", &kproc->ti_sci_id);
> -		if (ret) {
> -			dev_err(cdev, "missing 'ti,sci-dev-id' property\n");
> -			goto out;
> -		}
> -
>  		kproc->reset = devm_reset_control_get_exclusive(cdev, NULL);
>  		if (IS_ERR(kproc->reset)) {
>  			ret = dev_err_probe(cdev, PTR_ERR(kproc->reset),
> @@ -1087,6 +1072,13 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>  			goto out;
>  		}
>  
> +		kproc->tsd = ti_sci_dev_of_get_tsd(cdev, kproc->ti_sci);
> +		if (IS_ERR(kproc->tsd)) {
> +			ret = dev_err_probe(cdev, PTR_ERR(kproc->tsd),
> +					    "failed to construct ti-sci dev control\n");
> +			goto out;
> +		}
> +
>  		ret = k3_r5_core_of_get_internal_memories(to_platform_device(cdev), kproc);
>  		if (ret) {
>  			dev_err(cdev, "failed to get internal memories, ret = %d\n",
> diff --git a/drivers/remoteproc/ti_sci_dev.h b/drivers/remoteproc/ti_sci_dev.h
> new file mode 100644
> index 000000000000..897998a97d7f
> --- /dev/null
> +++ b/drivers/remoteproc/ti_sci_dev.h
> @@ -0,0 +1,82 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Texas Instruments TI-SCI Device Controller Helper Functions
> + *
> + * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
> + */
> +
> +#ifndef REMOTEPROC_TI_SCI_DEV_H
> +#define REMOTEPROC_TI_SCI_DEV_H
> +
> +#include <linux/soc/ti/ti_sci_protocol.h>
> +#include <linux/pm_runtime.h>
> +
> +/**
> + * struct ti_sci_dev - structure representing a device control client
> + * @sci: cached TI-SCI protocol handle
> + * @ops: cached TI-SCI device ops
> + * @dev: cached client device pointer
> + * @dev_id: TI-SCI device id for the consumer remoteproc device
> + */
> +struct ti_sci_dev {
> +	const struct ti_sci_handle *sci;
> +	const struct ti_sci_dev_ops *ops;
> +	struct device *dev;
> +	u32 dev_id;
> +};
> +
> +static inline
> +struct ti_sci_dev *ti_sci_dev_of_get_tsd(struct device *dev,
> +					 const struct ti_sci_handle *sci)
> +{
> +	struct ti_sci_dev *tsd;
> +	int ret;
> +
> +	tsd = devm_kzalloc(dev, sizeof(*tsd), GFP_KERNEL);
> +	if (!tsd)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret = of_property_read_u32(dev_of_node(dev), "ti,sci-dev-id",
> +				   &tsd->dev_id);
> +	if (ret < 0)
> +		return ERR_PTR(ret);
> +
> +	tsd->dev = dev;
> +	tsd->sci = sci;
> +	tsd->ops = &sci->ops.dev_ops;
> +
> +	return tsd;
> +}
> +
> +static inline int ti_sci_dev_is_on(struct ti_sci_dev *tsd, bool *r_state,
> +				   bool *c_state)
> +{
> +	int ret;
> +
> +	ret = tsd->ops->is_on(tsd->sci, tsd->dev_id, r_state, c_state);
> +	if (ret)
> +		dev_err(tsd->dev, "ti-sci device is_on failed: %d\n", ret);
> +	return ret;
> +}
> +
> +static inline int ti_sci_dev_get_device(struct ti_sci_dev *tsd)
> +{
> +	int ret;
> +
> +	ret = tsd->ops->get_device(tsd->sci, tsd->dev_id);
> +	if (ret)
> +		dev_err(tsd->dev, "ti-sci device get failed: %d\n", ret);
> +	return ret;
> +}
> +
> +static inline int ti_sci_dev_put_device(struct ti_sci_dev *tsd)
> +{
> +	int ret;
> +
> +	ret = tsd->ops->put_device(tsd->sci, tsd->dev_id);
> +	if (ret)
> +		dev_err(tsd->dev, "ti-sci device put failed: %d\n", ret);
> +	return ret;
> +}
> +
> +#endif /* REMOTEPROC_TI_SCI_DEV_H */
