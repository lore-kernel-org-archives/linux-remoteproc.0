Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E46F4DA553;
	Thu, 17 Sep 2026 12:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647595; cv=fail; b=GCh/j5OnFmsLqqTNHOLzweiuC6b2LLMuMIVzsFUYZvdaFY4yxPjFvzt3TydUBcfXsPYsIviLJQd3o2hfjUONpJoB37rEQ5JDdQB2552NORvZN/bN8bDkwOIXDLjuLmBRzpR5zaXjLHNjgQA3ruvPCsKYI6GRZNt84lkh7BOfnkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647595; c=relaxed/simple;
	bh=6/GRyxzUqriSDTv+yNucFK4HZUphRwgYwVNKaGoQ54g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=K547E59rVLvWk/88m05TdZoYjhyQEND+7ssmaf9wpleABFSfuuzHl0uynXL+t4OfEg7yFhJ1bY/y1qNi9872BrsEJnpxOLdRWWgcIYdMm8l/xxVQjxia70d/aGdLrmrosNfjyPvHppZ3kXWzkL1wA/sFBLBltxTHc3fdkRCz5Mg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=CkEWvvVf; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=f7yvCk51; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="CkEWvvVf";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="f7yvCk51"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68H9aYQR2703413;
	Thu, 17 Sep 2026 07:19:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=D4QHWh1UiEOQ/2qGHyNuPRoYnlRDeJJAwGiGg4PYc
	wA=; b=CkEWvvVfaINnTJh3ztxmQtZurQCfm8msjMAGq04GKZf946SVAXTD8DfQm
	FcqT/DjOYD9WhpU9cgYogzrWqql7YuOlWPnGilmc54QAhEJlUM/Zsg0SYLz24HVL
	pySMNRHPumu2B9Qr3uLT2JEoqCXO0Kaj9qRmfT85G4kjOXdCOPLl/qcKSBC5raA5
	wgjV861FLbzMlBH9fTFokc/jgIMc5IQMDqsp1Z1mExsiQBldi7HoKAee+tdpbQVk
	b1aMhGlJlHANrtU5y/dvZS8vOZF2nfK2WF43lwhrDEGexMwx90ze9Rbrly4llziY
	oo9G83CUDyYroJ1CJKee2rvLAmh4g==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011008.outbound.protection.outlook.com [52.101.57.8])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gqxfpeuc1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 17 Sep 2026 07:19:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SAoo+Atnywow+rU/6yanldejZx0EIb4XRVkCsL7jXHE7jdYzRRlxqpThdJ/UVcL+Draa4ZrCTODdLtDF/KWyeRCaSBbksE9bm0YWJ1Rl+AlDPnfte/tb/uItLdF8/wHN0iX2ctSE13ex4NtvUyZN0d+JaEi+WMquhgl2TgyQxvsTbS73HVJnCbLv6VyI+6GOWkswzn9yzJky8JVlkGgoRgGLiRWx4uYLfFmKbH50qZwlZzG0JceKAlLIjgKYud48YSKIj2SXd4xVwZBspIyoSDVbrAqMFEkQ+KPJdoaXO6ds1srHYdVbdoQc6QCmIfxM1GZx65tp3HeWQvTtSMV3dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4QHWh1UiEOQ/2qGHyNuPRoYnlRDeJJAwGiGg4PYcwA=;
 b=rOIOF1EazmaJzlO3lYGjJpzwtof+kKjY8hGuTEkhGMRvG76tiP1AjfJQCjf1+0vOz+RHzP5sDt8RK0wDQ+vXmpu/ywvyvfWdCsTUVBeCcN3+Fid59ToHvk1ik+eDXbPmFsIanoeKYGZG7bJPGTR7IFkGEebBYggzofwSahrmcGPcsOfGsvc2JOtSTodlIH31Xca+1Yo//STli2WZBJcQG9cTbrfLEFSmP7Xp9nEAA7cTUCzKt1WtJnZhEDtbrMVoQ79MLbciHULewZZP7fm/V6D1rqventeVr7wEB38wjPzXOs0isn3vdNtGJmO/FiY9KLgWzdEIZCVVnTnBoOvqQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4QHWh1UiEOQ/2qGHyNuPRoYnlRDeJJAwGiGg4PYcwA=;
 b=f7yvCk51hwPhhcxJ3LFX/BaQt//rvT3mebD1Y9okuRAFWokltu6b2PV8/qZQyaIAqwvSXtL54aHLKFvfRzcDdlwY2GZoJf533YxPhLtuSGDOn+uQNN9bG6DTD+6oSQhx16nKBFGajNTfy7OzTo9yt8Ejan20FSzngNolkw+BAI8=
Received: from CH0PR03CA0077.namprd03.prod.outlook.com (2603:10b6:610:cc::22)
 by CO6PR10MB5538.namprd10.prod.outlook.com (2603:10b6:303:135::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.7; Thu, 17 Sep
 2026 12:19:19 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:610:cc:cafe::15) by CH0PR03CA0077.outlook.office365.com
 (2603:10b6:610:cc::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.12 via Frontend Transport; Thu,
 17 Sep 2026 12:19:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.0 via Frontend Transport; Thu, 17 Sep 2026 12:19:15 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 17 Sep
 2026 07:19:15 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 17 Sep
 2026 07:19:15 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 17 Sep 2026 07:19:15 -0500
Received: from [10.24.50.162] (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68HCJDwV3905387;
	Thu, 17 Sep 2026 07:19:13 -0500
Message-ID: <5431c713-22b8-41bc-94da-70d5a1ec6623@ti.com>
Date: Thu, 17 Sep 2026 17:49:12 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: remoteproc_virtio: add acknowledged vdev
 reset
To: Mathieu Poirier <mathieu.poirier@linaro.org>, <tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20260902214453.634339-2-tanmay.shah@amd.com>
 <aqBNoaF7m_JEiVYY@p14s> <281ad636-7963-43ad-b88a-8a196eab217b@amd.com>
 <aqQW7eOsFE7jRTXT@p14s> <935f29ea-adf0-45c2-84fc-0df40b6f591b@amd.com>
 <CANLsYkzWXRbQiystuX101POObnkhSAyyP-6sOf9Fb+X5H_5y3A@mail.gmail.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <CANLsYkzWXRbQiystuX101POObnkhSAyyP-6sOf9Fb+X5H_5y3A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|CO6PR10MB5538:EE_
X-MS-Office365-Filtering-Correlation-Id: be4513e4-44fb-428e-4a61-08df14b5e43d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|13003099007|4143699003|6133799003|3023799007|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	U73Dfblf4rC1tj/erHhlkFS5oyXZmlzBZv1uBKTfnhDqminwTQxyRNBmw0UcM7luAU6cVrC2BxcAIViefprOZOngfZS55FvCmrNSIbqDQy3WBqgszfjI0wd0M5rRwA+fTdlyxSeEgn9QhXULhu1J4LtU++E8/J+PSEi6bSODXSeeax5rihhBpZU31AzNNmb1d/Lo53kWUnjHgOSr0icIEUIypKKAEuyu6f2AhH4cdBa3eMWDAW52+P02tRA/azguBDCEheDhC6xXlRT3L6QPRjJcFz5syfs82ZvauVQ4EXbOAtBDWc5B+WO8O0Qcili5AI1Y80VKclrwLtvnFtt8fMvfD9UJ8vSRmxyXoXrhbytaaPnbno6YpMNyLmvuG18ZefUX60xAA8iby97t4k4bFoE0uVZA2JbkKSysQWTQluJ+QS4CyKpmq1Uv3hcACa2uEnb2ZMxaHm9M5bDhAMrGeFVH3LqNLMNWzecqg7w1yKKgPs9og2sC4ZjiVIlfBfNnEM/wSgKua9FjEGFVCWwY+tHCFXooqsEzLZCfM0Xp7KES3SquX6my1aIrOlXiLtQ9tXIRdkv99EKMOZUcaYIn02Yljt8rf4HByXTk514yG593MCeKNyASBKXWRpDwduIFIcn2RuYP+ViAv2xoKAgfnQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(13003099007)(4143699003)(6133799003)(3023799007)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eG5evZn4QyydkwzEIlspiP7uy+h/ArCgE+R1WlDKxwNG5T09yLcnbRZWFBQ/qZ4XOd3uCugKjJ7qIMG46lZRu6lyhL/qw97pj2XwWIkByCf0+DrwTqwUEJfY+bgzBjkXENc+kpdVNc75NQXn29ZIknS8KUi22DSYNFJgzI4EUBWpMJ7IHenZ+fTKzm4she/GkHs1tB0bppDmE9ZurehvrBboSdIPidw3oTTlNTIABO5hMa3kV3IOBfBizuIesNbIp8kDPwNnlOJmmjiM8Uzgy5fOTcQMpWDLe4KkDiSF+K/42rWDvQh3mzDU5cYwBlckzxLVwWQQrF44F/TE+1BWYrvM7b3FlyRrxOn05afBNbpCavuzNipbtzxZXdZeUSuM2+MlrhtBuxMFEd9icEjt9vhETN2bLvG0F2DHenKmj2u3MFU6Y8NmLgVi6q7tmuhL
X-Exchange-RoutingPolicyChecked:
	iCigXTYg15gMP1l2+WqoN+O5Ugrr7MhsH0RYyQ0JorrNsQxR7tYKuYO4Xrk2+RFQWyNLlZNPFdHc/Qi7iuXjXzN2ZaWQBqaWVO22uogZYpgaz+NG22+Tc+9cMZw07OV874VYQeZEwz1msX2fy/SxC2pYbriaggLk9bNkggcCIZXF+89DJk41R4z3DBgCig9TWzbV+3iFy2tqVhNzFCdoWLX3+UG9Q8FJ3pCRSB69srlyixi8WYvR8KWH8HStU3M1rQ2Bxpv3nlIbJ6zTCHhn+NoSCIcQ2Q2s1h2gKMce2R5A3mTtRLrfQl+1Y4ZtbyXZGstDVo69XNcR/n2rRranvQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 12:19:15.9672
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be4513e4-44fb-428e-4a61-08df14b5e43d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5538
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3MSBTYWx0ZWRfXyybQL6vvZTDj
 xpglRFFgNCbDAQI9S7hwYOl/TWYvFS0uT3kFZkc468IRp2YIHV5CA1uGcm3eqkqCzFPcw5qV/36
 wJQuTZncy7ye6l7KpJzNXytWRlZlJI4=
X-Authority-Analysis: v=2.4 cv=HaWB3SE8 c=1 sm=1 tr=0 ts=6aabdad0 cx=c_pps
 a=zYHeo5UF1QI7fA+G+QDVSw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8
 a=zd2uoN0lAAAA:8 a=tTYLrvd-AAAA:8 a=xwUcYib1dGGCQL5aXN4A:9 a=QEXdDO2ut3YA:10
 a=Kp3Hu5l1xlEECLySyoGM:22
X-Proofpoint-GUID: nxEcY7OYfVOShlmI12bJgGHuGA9MvGYj
X-Proofpoint-ORIG-GUID: nxEcY7OYfVOShlmI12bJgGHuGA9MvGYj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3MSBTYWx0ZWRfX6MRViGA6ETYe
 eI5upJuRPxuuChHWGjf/iJtjcR5IgBujJB+HJ4gtcrFfZBf9DV3H6VIR8Hvo7xo299ckA9Qjuh0
 hS6OjgcmNKgVEuSUk9DM/RVWH1Jt2IcxiXNolearkjh6nt3MQA1iMJjG9wZoNTV6+hNDcm6L29x
 RLmfKGXtunUqSBa8N7Sxto5tpD8hx34nlONLJIMWeccgI6PuULs0RU0oLgUgXkMqcxLVbwg6UhT
 cTV6tMu55twZUbQyDS+2WX2IwooYXHkhWlJahP9ReC9UNRjbyUKZS7NVQuHIwbCH6+4Bl4g2n2S
 4tpDJyB1SL+ehOjMS2cp3i/Jdig+ULDdUNR0dbFE3NgrjTo35IAw6z61eMGaG73B73UZIvmL7YK
 kRaEkIYN9e4AN7SD93OqkcUYTGv6K29T6+i3j1UF98axbR25Sj9+WRksTNlA4AbV/aruqdTEQCH
 4fnOz4erF1n9Sj0qfiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170171

Hello!

On 14/09/26 22:17, Mathieu Poirier wrote:
> On Fri, 11 Sept 2026 at 12:03, Shah, Tanmay <tanmays@amd.com> wrote:
>>
>>
>> On 9/11/2026 9:57 AM, Mathieu Poirier wrote:
>>> On Tue, Sep 08, 2026 at 02:21:53PM -0500, Shah, Tanmay wrote:
>>>> Hello,
>>>>
>>>> Thank you for the reviews.
>>>>
>>>> On 9/8/2026 1:02 PM, Mathieu Poirier wrote:
>>>>> Good day,
>>>>>
>>>>> On Wed, Sep 02, 2026 at 02:44:54PM -0700, Tanmay Shah wrote:
>>>>>> The existing remoteproc virtio reset path clears the vdev status locally
>>>>>> without notifying the remote processor. As a result, the host cannot tell
>>>>>> whether the remote side has observed the reset request or completed its
>>>>>> cleanup.
>>>>>>
>>>>>> Add a new resource type, RSC_VDEV_V2, for virtio vdevs that support an
>>>>>> acknowledged reset protocol. For these resources, encode a reset request
>>>>>> in the virtio status byte, kick the remote processor using the vdev notify
>>>>>> ID, and wait for the remote side to clear the status back to 0.
>>>>>>
>>>>>> Keep the existing RSC_VDEV behavior for backwards compatibility by
>>>>>> clearing the status locally. Also reset remoteproc-created virtio
>>>>>> devices before unregistering them, and expose RSC_VDEV_V2 reset state
>>>>>> in debugfs.
>>>>>>
>>>>>> Assisted-by: Codex:GPT-5
>>>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>>>>> ---
>>>>>>  drivers/remoteproc/remoteproc_core.c     |  3 +-
>>>>>>  drivers/remoteproc/remoteproc_debugfs.c  | 29 +++++++++++++++-
>>>>>>  drivers/remoteproc/remoteproc_internal.h | 21 +++++++++++
>>>>>>  drivers/remoteproc/remoteproc_virtio.c   | 44 ++++++++++++++++++++++--
>>>>>>  include/linux/rsc_table.h                |  5 ++-
>>>>>>  5 files changed, 97 insertions(+), 5 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>>>>>> index 1ed406714849..31d79684977c 100644
>>>>>> --- a/drivers/remoteproc/remoteproc_core.c
>>>>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>>>>> @@ -471,6 +471,7 @@ void rproc_remove_rvdev(struct rproc_vdev *rvdev)
>>>>>>  static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>>>>>>                         int offset, int avail)
>>>>>>  {
>>>>>> +  struct fw_rsc_hdr *hdr = ptr - sizeof(*hdr);
>>>>> Spurious change.
>>>>>
>>>> Ack will remove it.
>>>>
>>>>>>    struct fw_rsc_vdev *rsc = ptr;
>>>>>>    struct device *dev = &rproc->dev;
>>>>>>    struct rproc_vdev *rvdev;
>>>>>> @@ -485,7 +486,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>>>>>>            return -EINVAL;
>>>>>>    }
>>>>>>
>>>>>> -  /* make sure reserved bytes are zeroes */
>>>>> Same
>>>> Ack, will be removed.
>>>>
>>>>>>    if (rsc->reserved[0] || rsc->reserved[1]) {
>>>>>>            dev_err(dev, "vdev rsc has non zero reserved bytes\n");
>>>>>>            return -EINVAL;
>>>>>> @@ -1009,6 +1009,7 @@ static rproc_handle_resource_t rproc_loading_handlers[RSC_LAST] = {
>>>>>>    [RSC_DEVMEM] = rproc_handle_devmem,
>>>>>>    [RSC_TRACE] = rproc_handle_trace,
>>>>>>    [RSC_VDEV] = rproc_handle_vdev,
>>>>>> +  [RSC_VDEV_V2] = rproc_handle_vdev,
>>>>>>  };
>>>>>>
>>>>>>  struct rproc_rsc_cb_data {
>>>>>> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
>>>>>> index b86c1d09c70c..1fe99749f5b4 100644
>>>>>> --- a/drivers/remoteproc/remoteproc_debugfs.c
>>>>>> +++ b/drivers/remoteproc/remoteproc_debugfs.c
>>>>>> @@ -274,7 +274,7 @@ static const struct file_operations rproc_crash_ops = {
>>>>>>  /* Expose resource table content via debugfs */
>>>>>>  static int rproc_rsc_table_show(struct seq_file *seq, void *p)
>>>>>>  {
>>>>>> -  static const char * const types[] = {"carveout", "devmem", "trace", "vdev"};
>>>>>> +  static const char * const types[] = {"carveout", "devmem", "trace", "vdev", "vdev_v2"};
>>>>>>    struct rproc *rproc = seq->private;
>>>>>>    struct resource_table *table = rproc->table_ptr;
>>>>>>    struct fw_rsc_carveout *c;
>>>>>> @@ -336,6 +336,33 @@ static int rproc_rsc_table_show(struct seq_file *seq, void *p)
>>>>>>                    seq_printf(seq, "  Reserved (should be zero) [%d][%d]\n\n",
>>>>>>                               v->reserved[0], v->reserved[1]);
>>>>>>
>>>>>> +                  for (j = 0; j < v->num_of_vrings; j++) {
>>>>>> +                          seq_printf(seq, "  Vring %d\n", j);
>>>>>> +                          seq_printf(seq, "    Device Address 0x%x\n", v->vring[j].da);
>>>>>> +                          seq_printf(seq, "    Alignment %d\n", v->vring[j].align);
>>>>>> +                          seq_printf(seq, "    Number of buffers %d\n", v->vring[j].num);
>>>>>> +                          seq_printf(seq, "    Notify ID %d\n", v->vring[j].notifyid);
>>>>>> +                          seq_printf(seq, "    Physical Address 0x%x\n\n",
>>>>>> +                                     v->vring[j].pa);
>>>>>> +                  }
>>>>>> +                  break;
>>>>>> +          case RSC_VDEV_V2:
>>>>>> +                  v = rsc;
>>>>>> +                  seq_printf(seq, "Entry %d is of type %s\n", i, types[hdr->type]);
>>>>>> +
>>>>>> +                  seq_printf(seq, "  ID %d\n", v->id);
>>>>>> +                  seq_printf(seq, "  Notify ID %d\n", v->notifyid);
>>>>>> +                  seq_printf(seq, "  Device features 0x%x\n", v->dfeatures);
>>>>>> +                  seq_printf(seq, "  Guest features 0x%x\n", v->gfeatures);
>>>>>> +                  seq_printf(seq, "  Config length 0x%x\n", v->config_len);
>>>>>> +                  seq_printf(seq, "  Status 0x%x\n", v->status);
>>>>>> +                  seq_printf(seq, "  Number of vrings %d\n", v->num_of_vrings);
>>>>>> +                  seq_printf(seq, "  Reset request pending %s\n",
>>>>>> +                             rproc_rsc_vdev_reset_requested(v->status) ?
>>>>>> +                             "yes" : "no");
>>>>>> +                  seq_printf(seq, "  Reserved (should be zero) [%d][%d]\n\n",
>>>>>> +                             v->reserved[0], v->reserved[1]);
>>>>>> +
>>>>>>                    for (j = 0; j < v->num_of_vrings; j++) {
>>>>>>                            seq_printf(seq, "  Vring %d\n", j);
>>>>>>                            seq_printf(seq, "    Device Address 0x%x\n", v->vring[j].da);
>>>>>> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
>>>>>> index 3a742ef6ef60..f07a96ff82a4 100644
>>>>>> --- a/drivers/remoteproc/remoteproc_internal.h
>>>>>> +++ b/drivers/remoteproc/remoteproc_internal.h
>>>>>> @@ -14,6 +14,7 @@
>>>>>>
>>>>>>  #include <linux/irqreturn.h>
>>>>>>  #include <linux/firmware.h>
>>>>>> +#include <linux/virtio_config.h>
>>>>>>  #ifdef CONFIG_HAS_IOMEM
>>>>>>  #include <linux/io.h>
>>>>>>  #endif
>>>>>> @@ -42,6 +43,26 @@ struct rproc_vdev_data {
>>>>>>    struct fw_rsc_vdev *rsc;
>>>>>>  };
>>>>>>
>>>>>> +/*
>>>>>> + * RSC_VDEV_V2 requests an acknowledged reset by writing an otherwise
>>>>>> + * impossible virtio status pattern: DRIVER and FAILED set while
>>>>>> + * ACKNOWLEDGE is clear. Other status bits are left unchanged.
>>>>>> + */
>>>>>> +static inline u8 rproc_rsc_vdev_reset_status(u8 status)
>>>>>> +{
>>>>>> +  status |= VIRTIO_CONFIG_S_DRIVER | VIRTIO_CONFIG_S_FAILED;
>>>>>> +  status &= ~VIRTIO_CONFIG_S_ACKNOWLEDGE;
>>>>>> +
>>>>>> +  return status;
>>>>>> +}
>>>>>> +
>>>>>> +static inline bool rproc_rsc_vdev_reset_requested(u8 status)
>>>>>> +{
>>>>>> +  return !(status & VIRTIO_CONFIG_S_ACKNOWLEDGE) &&
>>>>>> +         (status & VIRTIO_CONFIG_S_DRIVER) &&
>>>>>> +         (status & VIRTIO_CONFIG_S_FAILED);
>>>>>> +}
>>>>>> +
>>>>>>  static inline bool rproc_has_feature(struct rproc *rproc, unsigned int feature)
>>>>>>  {
>>>>>>    return test_bit(feature, rproc->features);
>>>>>> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
>>>>>> index d5e9ff045a28..e682caa546b2 100644
>>>>>> --- a/drivers/remoteproc/remoteproc_virtio.c
>>>>>> +++ b/drivers/remoteproc/remoteproc_virtio.c
>>>>>> @@ -13,6 +13,7 @@
>>>>>>  #include <linux/dma-map-ops.h>
>>>>>>  #include <linux/dma-mapping.h>
>>>>>>  #include <linux/export.h>
>>>>>> +#include <linux/iopoll.h>
>>>>>>  #include <linux/of_reserved_mem.h>
>>>>>>  #include <linux/platform_device.h>
>>>>>>  #include <linux/remoteproc.h>
>>>>>> @@ -234,12 +235,48 @@ static void rproc_virtio_set_status(struct virtio_device *vdev, u8 status)
>>>>>>  static void rproc_virtio_reset(struct virtio_device *vdev)
>>>>>>  {
>>>>>>    struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
>>>>>> +  struct rproc *rproc = rvdev->rproc;
>>>>>>    struct fw_rsc_vdev *rsc;
>>>>>> +  struct fw_rsc_hdr *hdr;
>>>>>> +  int ret;
>>>>>> +  u8 val;
>>>>>> +
>>>>>> +  /*
>>>>>> +   * During crash recovery, vdev can be stopped. But the driver can't reset
>>>>>> +   * the device, as device is already crashed. In this case, reset becomes
>>>>>> +   * no op.
>>>>>> +   */
>>>>>> +  if (rproc->state == RPROC_CRASHED)
>>>>>> +          return;
>>>>>>
>>>>>>    rsc = (void *)rvdev->rproc->table_ptr + rvdev->rsc_offset;
>>>>>> +  hdr = (void *)rsc - sizeof(*hdr);
>>>>>> +
>>>>>> +  if (hdr->type == RSC_VDEV_V2) {
>>>>>> +          /*
>>>>>> +           * RSC_VDEV_V2 encodes an acknowledged reset request in the
>>>>>> +           * status byte. The remote is expected to complete the reset
>>>>>> +           * and then clear status back to 0.
>>>>>> +           */
>>>>>> +          rsc->status = rproc_rsc_vdev_reset_status(rsc->status);
>>>>>> +
>>>>>> +          /* after setting reset request, kick the device */
>>>>>> +          rproc->ops->kick(rproc, rsc->notifyid);
>>>>>>
>>>>>> -  rsc->status = 0;
>>>>>> -  dev_dbg(&vdev->dev, "reset !\n");
>>>>>> +          /*
>>>>>> +           * When device completes reset, it is expected to set status
>>>>>> +           * to 0.
>>>>>> +           */
>>>>>> +          ret = readb_poll_timeout(&rsc->status, val, val == 0,
>>>>>> +                                   1000,      /* 1ms between reads */
>>>>>> +                                   3000000);  /* 3s total timeout */
>>>>>> +          if (ret)
>>>>>> +                  dev_warn(&vdev->dev, "vdev reset timed out\n");
>>>>> The problem here is that we are introducing behavior that is not compliant with
>>>>> the virtio specifications.  One way to acheive the same behavior could be for
>>>>> the remote processor to check rsc->status before sending a interrupt of using
>>>>> the virtqueues.
>>>>>
>>>> That is what remote is supposed to do. But what if remote do not
>>>> respond? If remote is deadlocked for some reason, then the Linux will
>>>> hang at this point too. That is why we need some kind of timeout.
>>> If the remote is dead then a watchdog timer should fire at some point.
>>> Moreover, that situation won't be different from other circumstances where a
>>> remote processor locks up.
>>>
>> There are few concerns:
>>
>> 1) Heterogeneous system where Linux is handling many remotes, the
>> watchdog might not be available to all the remotes or watchdog mechanism
>> is not implemented at all on the remote side.
> If a watchdog is not available adding a timeout upon resetting
> rsc-status won't help.
>
>> 2) Let's say watchdog is configured for 10s, or so then for that long
>> Linux will be stuck too. I am trying to avoid this case where Linux gets
>> stuck for long time.
> Same resoning as above - if the remote processor dies and a watchdog
> timeout is set for 10 seconds, adding a shorter timeout when
> rsc->status is modified will do very little.
>
>>> Looking at your patch, sending a kick() won't do anything for a dead remote
>>> processor.  If the remote processor is alive, it should monitor rsc->status and
>>> take action when it is set to '0' by the host.  If it is locked-up, the normal
>>> lockup procedure should apply.
>>>
>> Notifying virtio device on the status change is standard virtio
>> mechanism. In the virtio statck it's done via virtqueue_notify


I don't think virtio stack issues a notify on any status change[0][1],
it's the virtio_rpmsg_bus that notifies[2] while starting up the
remoteproc.

[0]: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/tree/drivers/virtio/virtio.c?h=for-next#n573
[1]: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/tree/drivers/virtio/virtio.c?h=for-next#n280
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/tree/drivers/rpmsg/virtio_rpmsg_bus.c?h=for-next#n1000

>>  so I am
>> trying to do the same. 


I see the point in trying to keep operations symmetric (on start and
stop), but I have to ask: Why just virtio? Shouldn't all the layers
notify of their respective teardown? (rpmsg channels, remoteproc
platform teardown?)

>> It also helps remote to avoid polling on status.
>>
> Can you point me to that code?  Having the same mental picture will help.
>
>>> I'm not sure what problem this patch is trying to address.
>>>
>> Some platforms allow Linux and Remote boot independently.
>>
>> Let's say Linux reboots without reseting the remote then during next
>> boot Linux will find virtio status is not in the reset state.
>>
> That should be handled via the attach()/detach() state machine.
>
>> In such case, linux need to issue virtio device reset, and wait until
>> RPU completes the reset and start the device again. The virtio framework
>> already issues the reset during boot here:
>> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/tree/drivers/virtio/virtio.c?h=for-next#n570
>>
>> However, the virtio_reset implementation for remoteproc_virtio simply
>> set the status to 0, and doesn't wait for the remote to complete the
>> reset. Due to this, attach operation becomes successfull, but the rpmsg
>> channels are not created on the linux side.
>>
> I think this situation should be handled in driver code rather than
> the remoteproc framework.


I agree.

>   We can consider adding this to the
> remoteproc framework if/when several platforms implement the same
> logic.  Otherwise I fear we'll bloat the framework with something that
> isn't generic.


If and when we come back to this, I'd maybe try to make this
teardown notification uniform across the layers and fix the
existing implementation than introducing a new resource type.

Thanks,
Beleswar

>
>> This patch solves this issue. It changes the reset mechanism while
>> maintaining the backward compatibility for old way of reseting the device.
>>
>> I had sent a different patch regarding this before:
>> https://lore.kernel.org/linux-remoteproc/20260317201251.3920841-1-tanmay.shah@amd.com/
>>
>> Old patch was rejected because we decided to modify the reset mechanism
>> instead:
>> https://lists.openampproject.org/archives/list/openamp-rp@lists.openampproject.org/thread/DDIFUMGQQ2R7CQZJHK7EB6UDO3ISAAVU/
>>
>> Thank You,
>> Tanmay
>>
>>
>>>> I think timeout mechanism is better for AMP systems over waiting forever
>>>> for remote to clear the status.
>>>>
>>>> Thanks,
>>>> Tanmay
>>>>
>>>>
>>>>>> +  } else {
>>>>>> +          /* back compatible for RSC_VDEV type of rsc vdev */
>>>>>> +          rsc->status = 0;
>>>>>> +  }
>>>>>> +  dev_info(&vdev->dev, "reset !\n");
>>>>>>  }
>>>>>>
>>>>>>  /* provide the vdev features as retrieved from the firmware */
>>>>>> @@ -469,6 +506,9 @@ static int rproc_remove_virtio_dev(struct device *dev, void *data)
>>>>>>  {
>>>>>>    struct virtio_device *vdev = dev_to_virtio(dev);
>>>>>>
>>>>>> +  /* reset virtio device before unregister */
>>>>>> +  virtio_reset_device(vdev);
>>>>>> +
>>>>> Regardless of this feature, I think it is wise to reset the device before
>>>>> unregistering with the virtio subsystem.
>>>>>
>>>> Agreed. I intend to keep this.
>>>>
>>>>> Thanks,
>>>>> Mathieu
>>>>>
>>>>>>    unregister_virtio_device(vdev);
>>>>>>    return 0;
>>>>>>  }
>>>>>> diff --git a/include/linux/rsc_table.h b/include/linux/rsc_table.h
>>>>>> index 71b60125310e..2398a6d7033e 100644
>>>>>> --- a/include/linux/rsc_table.h
>>>>>> +++ b/include/linux/rsc_table.h
>>>>>> @@ -66,6 +66,8 @@ struct fw_rsc_hdr {
>>>>>>   *                    the remote processor will be writing logs.
>>>>>>   * @RSC_VDEV:       declare support for a virtio device, and serve as its
>>>>>>   *                    virtio header.
>>>>>> + * @RSC_VDEV_V2:    declare support for a virtio device whose reset request is
>>>>>> + *                    encoded in the virtio status byte.
>>>>>>   * @RSC_LAST:       just keep this one at the end of standard resources
>>>>>>   * @RSC_VENDOR_START:     start of the vendor specific resource types range
>>>>>>   * @RSC_VENDOR_END:       end of the vendor specific resource types range
>>>>>> @@ -83,7 +85,8 @@ enum fw_resource_type {
>>>>>>    RSC_DEVMEM              = 1,
>>>>>>    RSC_TRACE               = 2,
>>>>>>    RSC_VDEV                = 3,
>>>>>> -  RSC_LAST                = 4,
>>>>>> +  RSC_VDEV_V2             = 4,
>>>>>> +  RSC_LAST                = 5,
>>>>>>    RSC_VENDOR_START        = 128,
>>>>>>    RSC_VENDOR_END          = 512,
>>>>>>  };
>>>>>>
>>>>>> base-commit: d4d61a4b0a52e8f3cdb3e1578602850a3452ec3e
>>>>>> --
>>>>>> 2.43.0
>>>>>>
