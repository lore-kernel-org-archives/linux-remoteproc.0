Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2610328984;
	Wed, 17 Sep 2025 13:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758116926; cv=fail; b=gELXWDaW4t0bQYwaufnIEi9nLpdiF0YKS8cfELCTM8joLuR4Xl4jDdCTBvpCs56DO/Z61t2bwwysIHns/Iq8LIf7Z+K/bAtTt05i15H5VDe43sJNKA39yI0bovwuu4FQP3vjlribiQlEbl7x9SKlxcIRj5vtzUDw/tiWymGELy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758116926; c=relaxed/simple;
	bh=9KbqDb6JiT02zWiniWmcj2NOXyRD8DC6lvfKIXhQJ+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FOB4/cXYrCe5eQiIlDmOdguLB/Rjzu2rOUZQLHgrffMh/KZ6ytLw7wJqNkqVkUmSr9p8dEmM/jfY7WMYLN66TqxWlDPqQyU/Xfi8UaY20ASGhYbJf19eAX2gSIZhOBm3VUQp6zfWQUQ4wrvO2S73SZUgBPVLLaTolZMm14ZpJJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Oeg1blQt; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Oeg1blQt"
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HB7AXr022993;
	Wed, 17 Sep 2025 15:48:15 +0200
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11012026.outbound.protection.outlook.com [52.101.66.26])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 497fxuv2ts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 15:48:15 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VbHTUIaFkoXoDaT58eKhiHJhvYkaJhhm/NEEfDx3qxbgy/KF+BboZ6ThI0UmoOKhbmHSn/wJVeAWwMU2hYfq9NZRkL45UOjysc2GqjaNb5254EfpdKA0q9ahmq7F5sfSoAJfijUCgeVnuyvbLA73dOWdXkOkETZi9Z/pQVOLQJJwj0NuPLQaQuQhmzyQQkYPOc0Ni8RmGKFm3TmNT1/q22zI6NYouzzuKzn581QLm+yukuAcEOviBhRmCiCz4x1DcxxnvtEEYyFuk2YFyKRJUA/33HyLIqs859rlUdRo69a2NQTZ0s8fvS7uGMm8X5Sjizzeo/UQWZbJAnWlSiMr9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7QlJx5YkaYf4BSoOsr67PuqI+N1OPJZr4jBrjlAJhU=;
 b=rUOeY7F86Vbt1kSve2gGgcS5WKezDwWFalUe24OWEM6Rp8ZB5LTPRBha0pkLvjcsppSVssA5lUSWFldSYO537RZIRAz34T38tdsV1YQg4EHaGEpFxNZrg41L01ZUYWZlULMdtisUglzspTkqDL4D7gLu0AOVjfG67hRLkHh5CiizNhxQr9sOSGcHr+ioWIZfMyTCWsBv+KuOLxspeZHQMNRoPi6K/F7cL529ClZiPuRrputqf1nD9ikwqDlz8VuBzr48rNjoIzngFVaXg2PY6CtpnqQg7QTdiYh9IAB9JRNftDXk4otSM6Drk5EqUN6vIZi1Oj/VKrHK86Go/ZE4vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7QlJx5YkaYf4BSoOsr67PuqI+N1OPJZr4jBrjlAJhU=;
 b=Oeg1blQtEuD4v/Sx7j+b18PYNtXeHa25YoLCDDOxU7E+Ttx8rRb/IKd+aPWf3v5M1yNX4b7QDw3XE+uJPqNR1mUW9J3w/Px1MOM6TZrKdkAFGHWmRxDZR9Nu11K+gRqQ1SZwDLaZSOlgWjvIYfXx/FXW1BOO8AYCSu4u4EUtyDEiFUb7PvVuewMJ5tqlwsQ89WP2Pspi+OgO+0S8VwPJBlwWX067oBSVsQbmA1VSNpjpeX5Sfp//7p+ctQCNYOVA8OGnknSPLq7ec6xzIBPp9E8rnF0z1FUZM4uLEXVQn2lVICdNJQvdghI23K42vF38C4Tgr1g61EKhSaf0I12xkQ==
Received: from DB9PR05CA0019.eurprd05.prod.outlook.com (2603:10a6:10:1da::24)
 by GV1PR10MB5914.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:59::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 13:48:04 +0000
Received: from DB5PEPF00014B9E.eurprd02.prod.outlook.com
 (2603:10a6:10:1da:cafe::8d) by DB9PR05CA0019.outlook.office365.com
 (2603:10a6:10:1da::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.13 via Frontend Transport; Wed,
 17 Sep 2025 13:48:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DB5PEPF00014B9E.mail.protection.outlook.com (10.167.8.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Wed, 17 Sep 2025 13:48:03 +0000
Received: from SHFDAG1NODE2.st.com (10.75.129.70) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 17 Sep
 2025 15:45:18 +0200
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 17 Sep
 2025 15:47:42 +0200
Received: from [10.48.87.127] (10.48.87.127) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 17 Sep
 2025 15:47:41 +0200
Message-ID: <8d385f2e-6470-4d66-be0b-a2a448a81fa4@foss.st.com>
Date: Wed, 17 Sep 2025 15:47:40 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 4/6] dt-bindings: remoteproc: Add compatibility for
 TEE support
To: Sumit Garg <sumit.garg@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Rob
 Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <op-tee@lists.trustedfirmware.org>, <devicetree@vger.kernel.org>
References: <20250625094028.758016-1-arnaud.pouliquen@foss.st.com>
 <20250625094028.758016-5-arnaud.pouliquen@foss.st.com>
 <aMkqifHSdlCs4VjA@sumit-X1>
 <62bdb238-7440-451b-84ef-79f846b10ba0@foss.st.com>
 <aMqIhFdIqp5auH22@sumit-X1>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <aMqIhFdIqp5auH22@sumit-X1>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9E:EE_|GV1PR10MB5914:EE_
X-MS-Office365-Filtering-Correlation-Id: b473709f-9fb0-47d9-f832-08ddf5f0d2bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NkhFeW9ubVlIekJjdWVGSXFSdVhtU0ozNGorZzJXRTJMTjY4QTlqOWt1Rkla?=
 =?utf-8?B?VGpoZGQ4VVI1M2wzU3lCbXBEQ1NSNFZja0MvckQvSmovNzRVM3h1YnRaS1li?=
 =?utf-8?B?TVhQT0RqOHVJWklmK1FvMjZkZVF4S1V5TzgyT1pycHZUL1VMSU1KWktVM2cy?=
 =?utf-8?B?cVlwMTY1VDRLYXFaSld3Nnhrek42UFlmVHlOdUloTXdHZ3VSNlJseVMzcEpQ?=
 =?utf-8?B?QTY4VDNocEc0VE5vYmNDakJMQlBWRE1XYnZHVkM4dGhqa2ZTUWdxQlFmU1dN?=
 =?utf-8?B?RW1uNHVyeWczdDhtckttU2IzUHMxY3ptUnNVQlhIcVZEYkd0cjNDa2hhRGZP?=
 =?utf-8?B?bHVqRVYrUUhXRnlRSzRxRTgxUkdMWWludUpLUzV3K0wraWtzQjZWWmtzNGh4?=
 =?utf-8?B?ckZiQVpxZkppaTFOdGplMXpOTkJ3ZDBBRjlLU05scXNSeW1palRYYitwakJC?=
 =?utf-8?B?b1ZabXZCVVNwMFQ5N0NNdnJOV1ZacFVvdnBOR29zVzJWWHE3RU5pN0xyZzRU?=
 =?utf-8?B?WVk1Ylo3eS8yVklYR1FKdXdHUndGVU50RTE2bXFVZWZSempuVkxkRUcvaDVS?=
 =?utf-8?B?YUw1QlQyQ2lkQjA1ZWlwUVg4U3Z1c05VeTd4YnhsVDdvL2twb0NqZ2ZuSnEw?=
 =?utf-8?B?MEUxUmZoN3BmVDgrMTFTYjBFZFpoRWEwbnB0OWlSSXBtYTgrRzRGN3lFTGF6?=
 =?utf-8?B?WHg1bC82aW5iTk1qMVZOcTJuaEsxQUJvcFQ3WFkxZlBLeTZBSFpMT25XUHR4?=
 =?utf-8?B?cGNYUGFNNDVjTHBReTJjWmtFNm93NllrU2FnTE5pRjd6ZTdXdWJXWXFMcm1k?=
 =?utf-8?B?VC9WS0F0UG1BWjdNOEFkbXF6SGJpQU9oTXRSZTBtcHZOOHoyYkd2K1ZhN0V0?=
 =?utf-8?B?dDRuYVFIZ2tpWnk5MkpWK1Ezd29HN2tUb1phdDV1alNjeUtJZmxjOGx1eGVj?=
 =?utf-8?B?Nm5VL2swMWMxVE8xamhuekZ4YjZNckpDMEI1eVI4QmY5eHdBbjE1YjZ0Vm1W?=
 =?utf-8?B?b3BSZnRPN2NHRGo4c1Fwa0o3TGFDMzVJdXpoTkUwMU1pS3VmYjlkaXRLMnd1?=
 =?utf-8?B?aW5Xa01ieTVQcWhKcWJ3S2hsTllIQ0UvYWRDQjNoVmN1clVMUDA1aGRQZVBq?=
 =?utf-8?B?TzVVQmhhMlY3ZFJWaGN1RU53WFAzNVljempOUTF2bW52Z1JjV1NWMGVrY3RO?=
 =?utf-8?B?SUxnT2pzaFg2S093ejl5Und2Y3htdTU2UW5NOUh0ZHBVRmlZakNtNldzR2Fz?=
 =?utf-8?B?WThBR2xSU1ZVblFDNGlBVmo5VXRRT2NDVzZRZWErNm5NL2ZDL0hBdlRpNHdX?=
 =?utf-8?B?bWxzMExIeWJ2aWJxVklGaURlS3V4a3ZsL3ZBVHNxcFNuQW12dkFuaTQ0Y0NU?=
 =?utf-8?B?ejRGVHVlcUg1Q1Y5UFRXMUJkL2xmbVJmSGhWTG81RjVCdDdwK3h1eTI3QUZh?=
 =?utf-8?B?Nnhld1FtK2VvdGw1SEZNSTFocUltSFFaaW44dWI0MzNWOFAvS0ZmQ09PcUVO?=
 =?utf-8?B?cmpwMzF6aDdrd2FzamhZUzZVNTdGZUxuSHlKSWp6VlVmRysxeHZaTXV0YzVG?=
 =?utf-8?B?YVFSN0I1Sy9vMGxSa0V1OWQzNUVBY1Z4cWI4ejdzL205WWdtZlgzTE5mVkJk?=
 =?utf-8?B?cFJ6d3RRdEhKUkprN0JKcFpidlpHZTZhanBucW5rSkxLMHhnYlNGSlpJVkl1?=
 =?utf-8?B?Tm1xeWRjTVNEeUxyaGNLY3dMbWVPYmM2NjhTdWhrMVJ6dVRaMllvZ3A5c2lI?=
 =?utf-8?B?RDA0OTJsNDV3VTU3SjJGWjd3RVdyQitWRW1aaWF1MmhzOVIwUHUzV1lCbDFm?=
 =?utf-8?B?WVBzdWExcktwOW0yNFo4VlRnMTZtWHd1YVBlazZlaTJxaVpOa0FQZUJtRkZy?=
 =?utf-8?B?c0Fsajk2QktwQ0FuczZMdlViUTVaQzNQMkpBdkhrYVV4Mi9IY3U4SWJycVJC?=
 =?utf-8?B?NUxpVGNHUW16d3RkbWV3a0NvZ3ZLZk4xNHhOYWUxU1Y1bFFRZ09sa2tpbkp0?=
 =?utf-8?B?a1Nuam9td1lBPT0=?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.43;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 13:48:03.1819
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b473709f-9fb0-47d9-f832-08ddf5f0d2bd
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.43];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB5914
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXyBTHGch09Etv MAa1JAVo5K65Tfbbzqeo6hNM7rq5D9XbrKqcoFRaARzc+ptn3nkpADeATEZa77t5tRRRcmvlboX B8gUtaSrwN/oodfScda6wXwDJljYS9+p7NCqtY7VDaItZEn20KgjadFVWNlN/kzLZjVj5uxg5ai
 0stBY/4aWuayywUwRYIgYckUlZDRQTt8VW2rP5Dmi5buYQf+h4SOeBCSQezFbhnL3KraJh9rOQ7 iuMzuZ/SvTEqBmiLf9Ycmf2WhKAeXZP+7LrR7qXZpYsZrrGaex8TAUZR/ZWXFzfhmcmTWYXMsnK QfvKyfr8k9bt6wFE4QcaLs5+sb0EFGJABh5Xpwa7nWP3kwUnMTbYOVhmuMGcNZk+yymzZKImrAN pA/j+ng4
X-Authority-Analysis: v=2.4 cv=TtLmhCXh c=1 sm=1 tr=0 ts=68cabc1f cx=c_pps a=+fiFqpvOFuJZRCDDiTTDmA==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=FOPVHIcnkjUA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=P-IC7800AAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8 a=k1Nz3SOlCHzJLuWz7wEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=d3PnA9EDa4IxuAV0gXij:22 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: sVL-Eb20qOgTUsL_9fhgv9HuYCwjTAi9
X-Proofpoint-GUID: sVL-Eb20qOgTUsL_9fhgv9HuYCwjTAi9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 impostorscore=0
 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202



On 9/17/25 12:08, Sumit Garg wrote:
> On Tue, Sep 16, 2025 at 03:26:47PM +0200, Arnaud POULIQUEN wrote:
>> Hello Sumit,
>>
>> On 9/16/25 11:14, Sumit Garg wrote:
>>> Hi Arnaud,
>>>
>>> First of all apologies for such a late review comment as previously I
>>> wasn't CCed or involved in the review of this patch-set. In case any of
>>> my following comments have been discussed in the past then feel free to
>>> point me at relevant discussions.
>> No worries, there are too many versions of this series to follow all the
>> past discussions. I sometimes have difficulty remembering all the
>> discussions myself :)
>>
>>> On Wed, Jun 25, 2025 at 11:40:26AM +0200, Arnaud Pouliquen wrote:
>>>> The "st,stm32mp1-m4-tee" compatible is utilized in a system configuration
>>>> where the Cortex-M4 firmware is loaded by the Trusted Execution Environment
>>>> (TEE).
>>> Having a DT based compatible for a TEE service to me just feels like it
>>> is redundant here. I can see you have also used a TEE bus based device
>>> too but that is not being properly used. I know subsystems like
>>> remoteproc, SCMI and others heavily rely on DT to hardcode properties of
>>> system firmware which are rather better to be discovered dynamically.
>>>
>>> So I have an open question for you and the remoteproc subsystem
>>> maintainers being:
>>>
>>> Is it feasible to rather leverage the benefits of a fully discoverable
>>> TEE bus rather than relying on platform bus/ DT to hardcode firmware
>>> properties?
>> The discoverable TEE bus does not works if the remoteproc is probed
>> before the OP-TEE bus, in such case  no possibility to know if the TEE
>> TA is not yet available or not available at all.
>> This point is mentioned in a comment in rproc_tee_register().

For the discussion, it’s probably better if I provide more details on the
current OP-TEE implementation and the stm32mp processors.

1) STM32MP topology:
   - STM32MP1: only a Cortex-M4 remote processor
   -  STM32MP2x: a Cortex-M33 and a Cortex-M0 remote processors
   At this stage, only the STM32MP15 is upstreamed; the STM32MP25 is waiting
   for this series to be merged.

2) OP-TEE architecture:
- A platform-agnostic Trusted Application (TA) handles the bus service.[1]
   This TA supports managing multiple remote processors. It can be embedded
   regardless of the number of remote processors managed in OP-TEE.
   The decision to embed this service is made at build time based on the
   presence of the remoteproc driver, so it is not device tree dependent.
   - STM32MP15: TA activated only if the remoteproc OP-TEE driver is probed
   - STM32MP2x: TA always activated as the OP-TEE remoteproc driver is 
always probed

- A pseudo Trusted Application implements the platform porting[2],
   relying on registered remoteproc platform drivers.

- Platform driver(s) manage the remote processors.[3][4]
   - If remoteproc is managed by OP-TEE: manages the remoteproc lifecycle
   - If remoteproc is managed by Linux: provides access rights to Linux 
to manage
     the remoteproc

   - STM32MP15: driver probed only if the remoteproc is managed in OP-TEE
   - STM32MP2x: driver probed in both cases for the Cortex-M33
     For the STM32MP25, the TA is always present and queries the driver 
to check
     if it supports secure loading.


[1] https://elixir.bootlin.com/op-tee/4.7.0/source/ta/remoteproc
[2] 
https://elixir.bootlin.com/op-tee/4.7.0/source/core/pta/stm32mp/remoteproc_pta.c
[3]https://elixir.bootlin.com/op-tee/4.7.0/source/core/drivers/remoteproc/stm32_remoteproc.c
[4]https://github.com/STMicroelectronics/optee_os/blob/4.0.0-stm32mp/core/drivers/remoteproc/stm32_remoteproc.c 

> The reason here is that you are mixing platform and TEE bus for remoteproc
> driver. For probe, you rely on platform bus and then try to migrate to
> TEE bus via rproc_tee_register() is the problem here. Instead you should
> rather probe remoteproc device on TEE bus from the beginning.

The approach is interesting, but how can we rely on Device Tree (DT) for
hardware configuration in this case?
At a minimum, I need to define memory regions and mailboxes.

 From my perspective, I would still need a driver probed by DT that 
registers
a driver on the TEE bus. Therefore, I still need a mechanism to decide
whether the remote firmware is managed by the secure or non-secure context.

Another issue would be to be able to share the remoteproc TEE service 
between
several platform remoteproc drivers, in case of multi remote processor 
support.

>
>> Then, it is not only a firmware property in our case. Depending on the
>> compatible string, we manage the hardware differently. The same compatibles
>> are used in both OP-TEE and Linux. Based on the compatible, we can assign
>> memories, clocks, and resets to either the secure or non-secure context.
>> This approach is implemented on the STM32MP15 and STM32MP2x platforms.
> You should have rather used the DT property "secure-status" [1] to say
> the remoteproc device is being managed by OP-TEE instead of Linux. Then
> the Linux driver will solely rely on TEE bus to have OP-TEE mediated
> remoteproc device.
>
> [1] https://github.com/devicetree-org/dt-schema/blob/4b28bc79fdc552f3e0b870ef1362bb711925f4f3/dtschema/schemas/dt-core.yaml#L52

My issue with this property is that this would break the compatibility with
legacy DT that only support loading by Linux
As specified in [5] :If "secure-status" is not specified it defaults to 
the same value as "status"; [5] 
https://www.kernel.org/doc/Documentation/devicetree/bindings/arm/secure.txt

>> More details are available in the ST WIKI:
>> https://wiki.st.com/stm32mpu/wiki/OP-TEE_remoteproc_framework_overview#Device_tree_configuration
>> https://wiki.st.com/stm32mpu/wiki/Linux_remoteproc_framework_overview#Device_tree_configuration
>>
>>>> For instance, this compatible is used in both the Linux and OP-TEE device
>>>> trees:
>>>> - In OP-TEE, a node is defined in the device tree with the
>>>>     "st,stm32mp1-m4-tee" compatible to support signed remoteproc firmware.
>>>>     Based on DT properties, the OP-TEE remoteproc framework is initiated to
>>>>     expose a trusted application service to authenticate and load the remote
>>>>     processor firmware provided by the Linux remoteproc framework, as well
>>>>     as to start and stop the remote processor.
>>>> - In Linux, when the compatibility is set, the Cortex-M resets should not
>>>>     be declared in the device tree. In such a configuration, the reset is
>>>>     managed by the OP-TEE remoteproc driver and is no longer accessible from
>>>>     the Linux kernel.
>>>>
>>>> Associated with this new compatible, add the "st,proc-id" property to
>>>> identify the remote processor. This ID is used to define a unique ID,
>>>> common between Linux, U-Boot, and OP-TEE, to identify a coprocessor.
>>> This "st,proc-id" is just one such property which can rather be directly
>>> probed from the TEE/OP-TEE service rather than hardcoding it in DT here.
>> Do you mean a topology discovery mechanism through the TEE remoteproc
>> service?
>>
>> For the STM32MP15, it could work since we have only one remote processor.
>> However, this is not the case for the STM32MP25, which embeds both a
>> Cortex-M33 and a Cortex-M0.
> I rather mean here whichever properties you can currently dicovering via
> DT can rather be discovered by invoke command taking property name as input
> and value as output.

That would means services to get system resources such as memory region
mailbox, right?

>
>> Could you please elaborate on how you see the support of multiple remote
>> processors without using an hardcoded identifier?
> By multiple remote processors, do you mean there can be multiple
> combinations of which remote processor gets managed via OP-TEE or not?

On stm32mp25 we have 2 remote processors a cortex-M33 and a cortex-M0
We should be able to manage them using the proc_idAnother point is that 
We should allow an other Secure OS could implement the TEE remoteproc 
service managing the remote processors with different proc_id values, to 
avoid to specify somewhere an unique proc ID per remote processor.

>>> I think the same will apply to other properties as well.
>> Could you details the other properties you have in mind?
> I think the memory regions including the resource table can also be
> probed directly from the TEE service too. Is there any other DT property
> you rely upon when remoteproc is managed via OP-TEE?

The memory regions that include the resource table are already declared
in OP-TEE. The memory regions defined in the Linux device tree are for
RPMsg (IPC). These memories are registered by the Linux remoteproc driver
in the Linux rproc core.

Thanks,
Arnaud

>
> -Sumit

