Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E91387562;
	Tue, 13 Jan 2026 09:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296083; cv=fail; b=lc12wTmcZ65fn/SqpNqy+X5mRJ6cd7CLZf1EFvgYSToCV+RIANXIuyl8Vl82Xxe4HQiZID7t64tOKvyQljoOWR3kpI8ZcjHsvoGMfLj18mv7lAAvS9/jtG+Grjy4cYD6T/QRgA5sAUV5twU7J9HUwKEnZHWP1bxfapfxqlKj9JA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296083; c=relaxed/simple;
	bh=wi180W7oaE9/WX6y4LzgdEVvR0+JRP63zs/SV/UKBJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lIAWLP42VFoEfEmZnbYctG5J5fGF26eruRMJ31ORVbvNLIQfp0AB57a2IR2ImlkgxWPVqUd7Jp5Ej1UW4+A3o2pB4oruu6fAGkXlDqm0jAy2ko57BtHck6OaWWdqK2F15PTmZLLm6UrbvOxvZhH0YOQmgu9P1YVi0ytzZUAn7Fo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=kMHLlA99; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="kMHLlA99"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D9BIUx1650996;
	Tue, 13 Jan 2026 10:20:40 +0100
Received: from db3pr0202cu003.outbound.protection.outlook.com (mail-northeuropeazon11010029.outbound.protection.outlook.com [52.101.84.29])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bkcs89b24-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 13 Jan 2026 10:20:39 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tdEbPwYAmbw5QhyIPKpCzheV1yCQehaSXV3AGvOi509kgR9n6aPjRDDg+tN+SXNjyYNI/ZDPY46jMbEkw13UYidYKNwSUIqDhIBSXHtZIXIDM8pZYL/HvKl4SGE1Ry2zyYhmbILo0g8kZLcMxthpyZuCRZL4swUDIQUZUahBIGPsGVatm4qok5Cst0pwIXVuZWBIQ1BGVXmpMedVIbgRdWjBta0/WqIY/FLH0UqliLdZuLAxJ5knky4M7ICLIwVsdVBuVkuolid3RqlX7mzElTIbhRJs1uAr5HNZOewuzTj/jKXi315t0eTSag+Ws4qIkJl3krGb1r4nMiHvcKbU/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86jfJbC1ywkJLlYaHLbSBCBZAT+By/i5iEejptSElVM=;
 b=r5sfN+IrmCCxdV6zc/5W59BQ68UOFdi6A1XO2ErostqchwV3E2/bz+zkQxfgOSmReqLvX/0R+tu4p1S4pY/HM2azcQOds9+knh1XWlefXLE76Kp69oGb6w9dMC1L5KVs/dJRRqlvOA8830IHGo+dCEbVv/YY4C+BHliOIz1+r4X3a02AFCquB9OIiyPgaSNvapSJe/X2BrW7n1lNQCL74gFGqefQy7ndqkgnMYGfDiZ52WZgNVBulTKCk84pV1Jl53fLtha2BoTvAoiwk+SYsDNOh8KDX1pbwZdDLY+gxfksX1fZm1Ml9uEw8ZRoVicsPjwIUxb5st+T1U6WcuZ8aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86jfJbC1ywkJLlYaHLbSBCBZAT+By/i5iEejptSElVM=;
 b=kMHLlA99LOkLSPj10FHSkaCBwf+SD91nOo9sR5RJhMwbqE9/ftlykwHiFKbJkWR6+ukqmQssWwo46E83wL4Il5sAo6p2sCCP6M7vCEdQ3NAYLxAKi2XZHroEQ2ZX5avO0wUBRtOsU0Zcyps/+rbP41YAwMQrSWQLAtKe9TNhNLYAKFQnXIVaRqxklSSvJkutFfuHswSVbmWRnbh4QjRTMzWN79W0DZQCjGPFh6ZkZTueM8pscQgaHEfAoWjdHFV8Kp6SJAdVAzX6g13jFZdICf+4+yKEU+dY00diStT3vruEzFyRwYgpbQAM+V0zCEloELaB+Tga5z//51AHJSW1YA==
Received: from DU6P191CA0007.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::22)
 by GVXPR10MB5864.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 09:20:36 +0000
Received: from DB1PEPF00039231.eurprd03.prod.outlook.com
 (2603:10a6:10:540:cafe::d4) by DU6P191CA0007.outlook.office365.com
 (2603:10a6:10:540::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Tue,
 13 Jan 2026 09:20:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF00039231.mail.protection.outlook.com (10.167.8.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 09:20:35 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 13 Jan
 2026 10:21:51 +0100
Received: from [10.252.31.60] (10.252.31.60) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 13 Jan
 2026 10:20:33 +0100
Message-ID: <49f1808d-1e08-4f47-ac3a-5f2274086060@foss.st.com>
Date: Tue, 13 Jan 2026 10:20:33 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 1/6] dt-bindings: firmware: Add TEE remoteproc service
 binding
To: Sumit Garg <sumit.garg@kernel.org>, Rob Herring <robh@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <op-tee@lists.trustedfirmware.org>, <devicetree@vger.kernel.org>
References: <20251217153917.3998544-1-arnaud.pouliquen@foss.st.com>
 <20251217153917.3998544-2-arnaud.pouliquen@foss.st.com>
 <20251229232530.GA2753472-robh@kernel.org> <aVOzHWmlJ-eneS-2@sumit-xelite>
 <CAL_Jsq+_S8UY7s7WQg9jXuBXCYMBWVCy=kVDMdkKTx6RctqQJA@mail.gmail.com>
 <aVtqITUxy--E8HJt@sumit-xelite>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <aVtqITUxy--E8HJt@sumit-xelite>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00039231:EE_|GVXPR10MB5864:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c5ac73f-fd2f-462b-ff85-08de52850287
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RytMcTdVRVNnVW5wWGg2RkxBUmZsNk9PRWhVYUxSUDR4Yjg3bldsckRyRDJ3?=
 =?utf-8?B?S3kzRVJnSWh2VDBlZytwMEgzTU5LQW1nZFcwMS9WZ25nU1lSYndqS3BoVWl0?=
 =?utf-8?B?N0lyWFVVNDF0ZURzM3o0K3BVR1FkWE9xNVM1QmhIK0Uwak9oUmprV09zcmN4?=
 =?utf-8?B?UWVxWlFxTFFJM0NYZFVTZ0pIdmw3eGJTdWZldUIweE0ycTZESmhTcFQ0VHE5?=
 =?utf-8?B?Rk5jV2pPRWRSUFE5bG9TRlNmZ1ZvYWliSkxyUTBTQURUekRQUGJMbXVFRmxa?=
 =?utf-8?B?ODF1ZFNEM09hblJwbHdubkkrSHZsZVNyNk5KRFU1ZEVHdmNXb1RSYVpxWXBW?=
 =?utf-8?B?eCtwRVp1MnlOQWVPY3UwZUJuT0FYQlZ2Q3MzSW02WFlXZ3hLZ05reWVZSUF3?=
 =?utf-8?B?YWpNR240ZGJ1d3FlSnI0V0tuQ1puaGNMRXkveTdTblBabmRuNTIwa1kySzI1?=
 =?utf-8?B?TitqWFBCRFREYnV6bksxNEwyUUFiTUhRSzhzWlppUHNIOEtQbWxtYTBwemFh?=
 =?utf-8?B?UmRid0dyU2xzVzVzaXNJWkE1OXlidTEvMlFLb044S2hKZ0JWVmhobFNBZGJn?=
 =?utf-8?B?VFpWS0ZENTl3SkV2dmVXUythVnp1cjNpczVUdGE1ZHpaQ3BOOC9kYWx6NDJU?=
 =?utf-8?B?SUdSVys5SmFGSjFGcFNTaG1XMWZGVVlYYXF6T3pJWnRlZjZ3MVRtcG9VRWla?=
 =?utf-8?B?bmlWd2ZpVzg2UklRVTdKRkF4QVBuZjEvZitKNjkxNExXeUpnVnVIUUY3Uklv?=
 =?utf-8?B?aklJMGZwS2QyNTBsYkovU1RaaldXOXIrMURIc3lKZS9rQ3IzeDI5OEV3ZWRN?=
 =?utf-8?B?MXFZQUtUcWwxWm1QMDBIL1RFZkFHb0Q0M0ZaaG8wSkE4cHo5b282M3ZwanRh?=
 =?utf-8?B?cFZOMXg2Qko5YllSTnRJajExenBqYVFSYmxmV3VoNlpNZSt6SWV5eTBWVGt2?=
 =?utf-8?B?NlVUaE8yWVpodjJnVllXazdIbmNLc2xYMHV4dzQ4R2tFM0szeXB6d0RXeVo5?=
 =?utf-8?B?azZNay9wVVdBOTR0SjJ4cnhRd0M2a3pxOXhpQW1nRE91dHhXL0tYVFpSK1dh?=
 =?utf-8?B?TzFIZlVxNVU2ZUNyWmYrWWh0N3BLeVhKazlhYzV2ZWpkenJsVmJaL0t6ajdN?=
 =?utf-8?B?MWV0V2ZHU3pQK0lpUEh5YzhVNWE2VmxsTSsxMUpXK1FHMmJ3M05vTXBYQVdm?=
 =?utf-8?B?ZDJXeUFBNGJpTGpKNndrMXNVQkxXbDZVenVyMFZRVGlETXZxZmg5RHRnTjJp?=
 =?utf-8?B?V2cyUWJuZzFra25tYlFOaVB2M2NGVVpWc2laa2d3dWZkREhkcFB1eUhiUXFm?=
 =?utf-8?B?NGZuU2RJVGJxNUhCRVJHcDZlMzZ3S0dCZzlXTmZSRVl5eVd5OFdFUjA0dkFG?=
 =?utf-8?B?MXlwYUdPRmJUM0QxVlJQM2VIaEZXRVJEUGh0T0hqNW9TL0kvb015OUV5MUx2?=
 =?utf-8?B?ejdvVkJsRHVXWEtDamlVbFYyZnBJVkh6ZzljOTJIQXErNTNTR3F3endCNnRs?=
 =?utf-8?B?cFdaMGlpZTR6VFpySC9tMGdFcHNTeFVwVmNUSGtnTlpaRDM2WCtoL255TEpY?=
 =?utf-8?B?UXRjUmhlTWRVWjdpYUR4Um1tWWYrVEwvbGxlNURpQ2IrUDJmYXFFdjB2ZjFQ?=
 =?utf-8?B?TkowYzk3RkNlQ3Q0eURsK3VDelhoS09VNTBmRjVZSGltbUNyMCtTRjM0eHJJ?=
 =?utf-8?B?cUpwVFRGVlZ2QzNpNGU1TVQxMCtJZzBXMHdPaVo5L3BtV3lNQmt4QnhMY05X?=
 =?utf-8?B?VVpBOVZ2U084UlZEcHRqUTRYWVQ3MkNFeDg4YWxHSVB6WmJ5MzhDYUpYK3BJ?=
 =?utf-8?B?ZnBuaXNlbWwrN2dQdzgzc3RJM0pIU2lpeTFsRGRLNzJjRmJibFpqRXBwdTU0?=
 =?utf-8?B?aHlxQ2x0dE4reWV4UUVRM3pUWlJ5NDdCTUJFeG9EM3pQczY2NllzNytubHFx?=
 =?utf-8?B?T08zYUtMU3FvRUV4YU0vOW1UQjVmOE10bElmT1R2ZGI3RElxVjZFdmpGbEwz?=
 =?utf-8?B?TkZwQ2ZiODM1Mlp6cnJtalVRamtNcDRLYlBVczNsdThQbEcwUGZSS1VQZUN5?=
 =?utf-8?B?SzRaTGc0Rzk0bm8zL1FqS2NBcmhqSHgyV1E1Y2tudTJ4emJ6aUVNRnQwQmUr?=
 =?utf-8?Q?NpDw=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 09:20:35.8660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c5ac73f-fd2f-462b-ff85-08de52850287
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB5864
X-Authority-Analysis: v=2.4 cv=XfSEDY55 c=1 sm=1 tr=0 ts=69660e67 cx=c_pps
 a=zENiTB/zEOiFyifeSt50yg==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=i0FVImxyn9gA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P-IC7800AAAA:8 a=VwQbUJbxAAAA:8
 a=xsx64BSX4TkU_5fudAEA:9 a=Hj5wB2MbPpAxq7y1:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: 7PlfaP0p0NewNUEWHksE_lbTOhor3FXu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3NyBTYWx0ZWRfX91yrjRjOujAL
 BxwbbC8rmt4rL5vyKTAIhr4vHTYfsOviU+fm6WFisLglHG3I/7jklSIs4oRbe1vKl8xx5mVwpqJ
 t7nhpW3ux5X8naNPCAChxSTNsPBfXbmTOr1N0/BcZ7ussHjOIvpPq7D06XdfPDwsyyS0Dz5egxs
 vHTG0Q+bdvk05KHk/g94cnOlabhIxpD/YPLeDAuEPJwWXEAfmASrTu61MJcVmW8ejYUBOjbykK+
 dqJLuKDDRla0FiZzHy+azsnRC1PBucNo3oA4ZWIjSPcNziwrGEhdyJW60uctO7L34+gcC7P4nYx
 32MixUn0fyC2IKMhu3xMjb1EDNZJIxcyMmO2c8bPBEEIZxOvNc9VAFKFtAgqSeW1PJJwwDUR3in
 gG6Z4x0aVJB1JHRN1rkh61mYUs7PIx9qikEf+V0YtCG60lQDGVFTYhB6bURUu2dpJvB1ZsMHB+o
 J0XoZLK/l2TvNewPELg==
X-Proofpoint-ORIG-GUID: 7PlfaP0p0NewNUEWHksE_lbTOhor3FXu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130077

Hello,

On 1/5/26 08:37, Sumit Garg wrote:
> On Fri, Jan 02, 2026 at 04:17:27PM -0600, Rob Herring wrote:
>> On Tue, Dec 30, 2025 at 5:10 AM Sumit Garg <sumit.garg@kernel.org> wrote:
>>>
>>> On Mon, Dec 29, 2025 at 05:25:30PM -0600, Rob Herring wrote:
>>>> On Wed, Dec 17, 2025 at 04:39:12PM +0100, Arnaud Pouliquen wrote:
>>>>> Add a device tree binding for the TEE-based remote processor control
>>>>> service implemented as an OP-TEE Trusted Application identified by
>>>>> UUID 80a4c275-0a47-4905-8285-1486a9771a08.
>>>>>
>>>>> The TEE service node is a child of the "linaro,optee-tz" firmware node and
>>>>> acts as a container for remoteproc devices that are controlled via TEE.
>>>>
>>>> Is this generic for any remoteproc device or just ST's remoteproc. Looks
>>>> like the latter to me.
>>>
>>> That's true, the DT description of the remoteproc subnode is very
>>> specific to the vendor which in this case is ST.
>>>
>>>>
>>>>> In addition, the "linaro,optee-tz" binding is updated to specify the
>>>>> '#address-cells' and '#size-cells' values used for child TEE service
>>>>> nodes.
>>>>
>>>> I'm pretty sure I already rejected per service/app child nodes for
>>>> OP-TEE when its binding was submitted.
>>>
>>> That was the reason to have discoverable TEE bus in first place and I
>>> have been motivating people to dynamically discover firmware properties
>>> rather than hardcoding in the DT.
>>>
>>>> If we do need something in DT
>>>> to define some resources, then can't we have some sort of
>>>> standard/common communications channel? I don't care to see some sort of
>>>> free-for-all where we have every vendor doing their own thing. OP-TEE
>>>> needs to standarize this.
>>>
>>> I suppose this requires a wider scope work as you can see the DT resource
>>> dependence from here [1]. By standardize communication channel, do you
>>> mean to say if adding an alternative backend to fwnode for TEE in
>>> parallel to DT, ACPI or swnode is the way to go for discovering fw
>>> properties?
>>
>> No, not at all.
>>
>>> Or do you have any other suggestion here?
>>
>> What I mean is why doesn't the TEE define the communication channel
>> (mailbox+shmem and notification interrupt) rather than each TEE app?
> 
> The synchronous communication channel is already there for each TEE app
> based on (invoke commands + TEE shared memory). OP-TEE does support
> notification interrupts too but those haven't been exposed to TEE client
> drivers yet. I suppose this remoteproc use-case can be a good example to
> expose that as a generic TEE notification interface too.

In the STM32MP series, the mailboxes and shared RAM are used for RPMsg 
communication between Linux and the remote processor. My concern is that 
using notification in OP-TEE could impact performance by introducing 
latency. Additionally, this might require a DMA allocator in OP-TEE to 
manage the shared memory. One RPMsg virtio requires the declaration of 
at least three carveouts. Managing these as memory regions in OP-TEE 
would be complex (due to limited number of memory area declaration on 
STM32MP2).
> 
>>
>> More generally, is having TEE apps depending on random DT resources
>> really a box we want to open? Is the next thing going to be a TEE
>> clock/reset/gpio/power provider? Where do we draw the line?
> 
> This is really a hard line to draw since silicon/OEM vendors based on their
> hardware security architecture partition various resources among TEE and
> the Linux world. And one general principle we try to follow for the TEE
> is to keep it's Trusted Computing Base (TCB) to a minimal too.
> 
> IMHO, if the threat model is well understood then we should allow for
> this hetrogenous partitioning of system resources.

Here are some additional resources we need to manage the remote 
processor, which seem complex to handle without Device Tree (DT):

- Clocks: On STM32MP, we manage clocks through the OP-TEE SCMI service
   [1]. The SCMI OP-TEE clock/reset service already exists and should be
   reused.
- Power domains
- Remoteproc Watchdog interrupt: Cannot be caught by OP-TEE on
   stm32mp15.
- Graceful shutdown of the remote processor: This involves sending a
   mailbox notification to request shutdown and waiting up to 500 ms for
   the remoteproc to deinitialize its resources. Waiting this long in the
   secure context seems inefficient.
- compatibility with some coming IPC mechanisms: Such as rpmsg_I2C or
   virtio-msg might require remoteproc subnode descriptions in the
   future.

If the proposed topology does not gain consensus, what about an 
alternative approach that manages the remoteproc TEE similarly to SCMI, 
by introducing a remoteproc-backend with the proc ID as a parameter?


&firmware {
     optee: optee {
         compatible = "linaro,optee-tz";
         method = "smc";
         sproc: sproc {
             compatible = "80a4c275-0a47-4905-8285-1486a9771a08";
             #address-cells = <1>;
	    #size-cells = <0>;
         };
     };
};

rproc1: m33@0 {
   [...]

   remoteproc-backend = < &sproc 0>
};


rproc2: m0@0 {
   [...]

   remoteproc-backend = < &sproc 1>
};


[1]https://elixir.bootlin.com/linux/v6.18.4/source/drivers/clk/clk-scmi.c

Thanks,
Arnaud

> 
> -Sumit

