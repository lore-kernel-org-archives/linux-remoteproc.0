Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793110373;
	b=LPiMJzJidebJ7EEPKNTSanHjhAxCR9Tpaydr0whfp3YM28Fmho/59RxfESq4hnK+3GPh
	 vIzvelkZlcEZg7giuJ9YJH9aahHIky6nYlhfRluredxwz3xDGSkPy46QrJy7aFX1A0Pgq
	 TTNen2fLXf0rv7AZngasoUFZ5gwwqiBlxSI+TuXEprKMO9riskPPb+d7T+0RIA4gMQjI/
	 e6zbbOcYvRuI4drJAtHz18+hi7cUl4FAzDJlj6hhPkT5I+mxw1ShmHkhEqOf6qIQ8Azaf
	 3ZHWT54zFJvH4FVDNN+f7XnkUq/yR3pCc+Aij3c6SmOiJX512nwSYkcM1Q34sBWnSXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793110373;
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PcmsFZogpJwvcAe+Vl8xkr0GwtOsDVO029oxqfpFDwI=;
	b=rmp663nZXT2u/qJRYDzqWrk8oJAK/dvYBdNExLk58Pecyqs7wLbq3EUqHNGLhofJ5206
	 MqWQy6ECZQZ2Haxo9Zl54g7UeCGktrHT2nErxT/7CCZW0gwckZpG9TB+hHTEYLrUpKR+z
	 5y704EKzuCNXDb+2XMXAxqYv4XAeLcKtzkYw/6u9MLrnSRnpKV/12/dSBCm65k7V7DBHs
	 b3q8w9CC7PAJg4WAJd9BZJlZbnE0DemqhFuc11QgnHD/X+r2rH2e/RgUqFOxqVFKbEJl9
	 UNed3JMf0W51AjJz4+PTrF0HAOVpDyFo/C5CAeZB+hXnf0VmKSJ+4sawJgO3/5N6XyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=BbS1p7bF;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=IaSqQYTn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91F5606A31F;
	Tue, 27 Oct 2026 14:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C91F5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=BbS1p7bF;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=IaSqQYTn
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDmewT1461729;
	Tue, 27 Oct 2026 09:12:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=PcmsFZogpJwvcAe+Vl8xkr0GwtOsDVO029oxqfpFD
	wI=; b=BbS1p7bF5HPDV6FE9YPPogfSzG7w5sBAZPKKxPDy67WcLRP56kr6cnarY
	9TyEsnNL1+Q8WhYluLFg7XjyHPkOVAEXaizw21ys2WFU1yhihN7jCOPNSpipoh2z
	boe0Ckv4zSCDZCFsBLzKNnc+4HsnXvKYoq8HcsVZvRr+BuencAshix20emSIv3pv
	FNsfQnT9Zwa52gP7/Zhwu8uPAGJR1U/pooaKUmdPOYro9pTK4ZSwnuFl/dOdF2aR
	NxJ2HIt8T3m9OthjE8GH5xEBlEQfezh73dZGGayYyk5aO/CI7ooMF7SqH1p7OWPK
	giCa/RoXXF+Gt2ZQ11u17O4VWsW/Q==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012053.outbound.protection.outlook.com [52.101.43.53])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hjp2yjuuu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Oct 2026 09:12:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pv0cTv0Bq2VG3yXF/C3mVBQdBBIxAjfeyiBCgHEZs/bnf5yrqwQBneLNY53RTmlxixwTn9ZJXOWcOksLbCUNToZ1KLL3EkOTOp2z2o5tvOYPCiKs1TdFVMYRfnplM+9WO0CjAMZLvz8jR+JlG+/TqcgurS2cSSXukQWvPTn+896x0O5f5Uk+NRYvNQ6lLu32o24+7WyKd2gBCz37/5wkHif1QcJ1IdZ9Rz/n7mwXYPGEqeCRefJoQ+YZpipJcoXDlFJtWQwS+pLM3Wr3P3iI8bX+8yN+CxQvGuQy5WQYo/ghU9PF5Otx+hX4gbqgp6y1gD6P9Po40Eou+nJUgEAF4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PcmsFZogpJwvcAe+Vl8xkr0GwtOsDVO029oxqfpFDwI=;
 b=bm1QZoZTSXtHu3sRVf1FdNa2dNsByt6iU2/rLW+7edWr+jcaHrPgo180TZQxLaIF5ZN2ow05fwowi9Kt/jcTrFFAzoC1aSbhYaDtD66ohux3/2INrm6nEElyS8jiXI3i9w+qLHxUeReHyZBLcOyccVsIOPWSWbIbp0vjNH3fO9Or5w9V9jedE4Vcf1bcNsyiVjHnHP1EFG+2FSdpQUqnafry6bvTjWf/gwOu2Ir++4twxR/yglMatBfp5bTrVpTozMYGl/1EINth5KJsjVlB7duysktwva2rUDvC3SnuDA+n0rVv5FkeSva3qTiQO5BJAC0EPeVCGxJu6zupIuTmBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcmsFZogpJwvcAe+Vl8xkr0GwtOsDVO029oxqfpFDwI=;
 b=IaSqQYTnSr8JHNxWj9ZeOrEKE9y6w5mjKJRQXuYxjiXAfJm5cv0IbpT1knWLoPpY80RCoUoE3Jv0dwtBRdiWilKoSS6Dffx0q6HG3LeTUqksI800zOvLR9YryXNGJNLLFxTaKvrQMeyni+UZLPD/QN8x12hm8S7a9zOmVX6wxDA=
Received: from BY1P220CA0045.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::14)
 by SABPR10MB997940.namprd10.prod.outlook.com (2603:10b6:806:4f0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 14:12:45 +0000
Received: from SJ1PEPF00002310.namprd03.prod.outlook.com
 (2603:10b6:a03:59e:cafe::70) by BY1P220CA0045.outlook.office365.com
 (2603:10b6:a03:59e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Tue,
 27 Oct 2026 14:12:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00002310.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Tue, 27 Oct 2026 14:12:44 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 27 Oct
 2026 09:11:47 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 27 Oct
 2026 09:11:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 27 Oct 2026 09:11:47 -0500
Received: from [10.249.144.74] ([10.249.144.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69REBjpm2045560;
	Tue, 27 Oct 2026 09:11:46 -0500
Message-ID: <11c794c1-6fb2-4a21-a127-4762c6f45699@ti.com>
Date: Tue, 27 Oct 2026 19:41:44 +0530
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
Subject: Re: [PATCH v2 0/2] remoteproc: Merge ti_sci_dev and ti_sci_proc
 abstraction
To: Siddharth Karanam <sid9.karanam@gmail.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
References: <20261014103241.3847-1-sid9.karanam@gmail.com>
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <20261014103241.3847-1-sid9.karanam@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002310:EE_|SABPR10MB997940:EE_
X-MS-Office365-Filtering-Correlation-Id: 24cea9ea-ea4a-45de-e574-08df34345ed8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|261026140227099003|56012099006|5023799004|261022105027099003|261009223027099003|261021123027099003|261021121427099003|10067099003|18002099003|261026121527099003|22082099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	p6kgIS1k+zFCRX9kpvLYa4RF7Ws0Pe+nPA3CWDXhZNmvPQiSdulQgloqrcvpx17kqmC4/35ntM6nhsyrVQKD4WkabxUFUb/P6RKH41kcasZWLVtgPUSx0hS9WLqFCezok47zmz3gUkaRIfCItxZD0kiIMrzUBi33qzGNpjkX7I7wKWm4TFFkZJRHBfgHXC5qIXohHO/RwdpjVM3V7ykBBbzqVM7rPdqZlZHh/vJZLXV4jWds3VqaFHLihGJjUogHAflfm9Q+Cf32g4rTfynpuyB09iqkULCuSvCYwQNv5uX3xExzQw/P6PHFHkNvpDTjoN2MQyn7VSdyr/TgXfWYs2XYa3sUhqowhDKIMA4Er7hc5xG/gdDckIP87tIP3pzq5GqBpwI2mhtj4Z3KmMEYaxTcxsCDNAWwax7+slDeQT6R25BvfATZYWwDrAzi4Tau+RZAc1oGxmf3ASUFOdezVaDjpkLOY3QUiIYCxTkxRyAnppeIRLypuepopOGoaFc2Oq4zUFXZNa+einH2TtIBttX2d8pkTejfb+EgCsxQtOk4SCNHtCTOaA/3pBZTIbzV39NfQsgfSN64snDWAEKQiLnFZwMIufUdIMYqAjn9kV0AcU//mhQRZ0KI6ayvkJA5cky2aYOnxDiJ71SjxwfZFCy4FOfnG3/+1yhQHf4pZo4=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(261026140227099003)(56012099006)(5023799004)(261022105027099003)(261009223027099003)(261021123027099003)(261021121427099003)(10067099003)(18002099003)(261026121527099003)(22082099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YJim8qOJkSqClzUWUA4CyWlWEKIl+JIcfjAaTiS2vHwXKW+gJQXnlxducbvgqiA3YZa2ujKu5FPJLjUcwTtssd+lR9BAjjP/AN3W6Ed2ZuiL4+Jv08EhkevWECADi0FdiJyUaJ45oFfUNaz3p8UGExC3Y3JfAdO9tvT1vOP0sPFjTBwYIdQVWTX6Y9BFeYlOgZR/p4hfoxsykAc3WlwBpG8/HE6XKwWDSaV1G6XPMXghE329ybFITWjUs5RS9q0wCUN5YhkACTADdwrA3fmCNS2Kpo41ocMynbz4nYf3jewhDUWbLy0xP90uU9JedZ9NyKH+olHpvVtU2zQCOu4kdt2DceeTO0oEOB5/b6V3QoXzYt6NBA/jombOSZCUSNJ/XOSR5CHqSbDs2N9QCoVgEJT0ueUbvaq7Jryy8SD0je14FP1i4YsTbrnpKtRTeJyi
X-Exchange-RoutingPolicyChecked:
	Y/mQ0jlE6A00d0TkY+VnoHpZX1W55ZndgfSnU4YJQExtQNad57p8jU6NswtqcIQ8KMLWH8EKQaTYBW3gVuSP5uLnm9zesW6DQ1QWp3iyk1xoEBfZwuAs8wlpNs0YM+gtyxJNVxb6H46HWa6zYB72HMvCImZHsrQWAfBZrHK6sOWCh2oHAnuZfiY5e4QlHvnsrDzruyL4G/fZZbOx/xfxxp6GIC3XJmKxobBtUrjz7pzGq6FafbiclguFPQelcklV+xRS7PQJmIR92JkN/m0bqSD88/Qx5J3EGrIoDlGrnfhCj0QXNqlnJqrYTDK3+Cn4ROtMvgP27rjWyenNeFzM0Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 14:12:44.2790
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24cea9ea-ea4a-45de-e574-08df34345ed8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002310.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SABPR10MB997940
X-Proofpoint-ORIG-GUID: AtJbUcSeZnkpYPiNe36EOJ9-mdu7Ca3o
X-Proofpoint-GUID: AtJbUcSeZnkpYPiNe36EOJ9-mdu7Ca3o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NiBTYWx0ZWRfX/8sMIb0xZWwc
 P/wmR4QLGiUUYruyRQ0edCeCL1IQvi1XBwMUKF9xnn89XoONu4czzFUvDlJDP7y0bBe3cjpd7vM
 WXp03NjsZ/rarx/VwgNddAPA3+IeLsKwx/zaVsL+nwv1Lob/+7rQIonBnUHw1u00Gt/bCv7Ec0M
 cb0CaX8ZWvwdZPnPGw3cKe0MWOhdWuKRo9GMfyG1s+w5JhT71ZIQmF+ZSbV8cFVwNqGWXbNS3YW
 PdRBQTBeyixa2+SiwtJ42MVlgRX4SKuXyAHSdQrx5z0jVwnS0wOv/Pkk3eKyhqoDz6pzmyPZrAl
 yJpPrAHqyM0HZoipcG+ZJF+m1UfFvjZjlEGwHmMliDckKi0X4rFwQElLRHjJiMHjv/wrzVTY2/Z
 q25X6k4CT64b+EM99dCFd/6aNBoK4X+mg/gT+pyGk87dgOd8IW/K87R/UJkSPShkOyacVCmKPfT
 MSpznel/CjT1wmXUe3A==
X-Authority-Analysis: v=2.4 cv=FbaiV5+6 c=1 sm=1 tr=0 ts=6ae0b160 cx=c_pps
 a=m4QPU8/Yf0DQKtM+qTkXOQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=sozttTNsAAAA:8
 a=7eEAJAygkgqZAMQLeUAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NiBTYWx0ZWRfX9ZBoVXhMryj3
 8WY0hZq7jfPYEqZvTPYhVbe6VLHkQYR1PlmU1DiuX0/rmYMKY0alFnotFIdy6h8hsoiOfD4DTTq
 8WvyCkSC61LUItptHuCbQv7qYC/2sGk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270056


On 10/14/2026 4:02 PM, Siddharth Karanam wrote:
> The previous version of the patch had a new header ti_sci_dev.h,
> that mirrors ti_sci_proc.h in terms of the struct decl and
> its helper function structure, with the goal of abstracting
> all ti_sci_handle's members like ti_sci_dev_ops from being
> invoked directly in the driver code.
>
> Lore link to the v1 patch:
> https://lore.kernel.org/all/20260922191453.324983-1-sid9.karanam@gmail.com/
>
> Upon discussing in the original patch thread, it seemed
> better to combine ti_sci_proc.h and ti_sci_dev.h's structs
> and merge all their helpers into a single header. That is
> what ti_sci_ctrl.h aims to do: It has the union of tsd
> (ti_sci_dev) and tsp (ti_sci_proc) and both their helper
> functions are prefixed with ti_sci_ctrl_dev and
> ti_sci_ctrl_proc respectively.
>
> The goal of the patch (v2) is to maintain a single source of origin
> for all ti_sci_dev/proc_ops call sites. Any stray calls
> to dev_ops/proc_ops function pointer members in driver code should
> eventually be abstracted through this header (ti_sci_ctrl.h).
>
> In the future we can try to abstract tsd's dev_ops even further
> through pm_runtime, but there are some roadblocks that
> I am unaware of, so that warranties a different patch.


You might be interested in this:

https://lore.kernel.org/all/20261027140751.2465743-1-b-padhi@ti.com/

Thanks,
Beleswar

>
> Siddharth Karanam (2):
>    remoteproc: Add ti_sci_dev_ops abstraction
>    remoteproc: Merge ti_sci_dev and ti_sci_proc abstraction
>
>   drivers/remoteproc/ti_k3_common.c         |  21 +--
>   drivers/remoteproc/ti_k3_common.h         |   6 +-
>   drivers/remoteproc/ti_k3_dsp_remoteproc.c |  26 ++--
>   drivers/remoteproc/ti_k3_m4_remoteproc.c  |  23 ++-
>   drivers/remoteproc/ti_k3_r5_remoteproc.c  |  66 +++-----
>   drivers/remoteproc/ti_sci_ctrl.h          | 177 ++++++++++++++++++++++
>   drivers/remoteproc/ti_sci_proc.h          | 130 ----------------
>   7 files changed, 231 insertions(+), 218 deletions(-)
>   create mode 100644 drivers/remoteproc/ti_sci_ctrl.h
>   delete mode 100644 drivers/remoteproc/ti_sci_proc.h
>
