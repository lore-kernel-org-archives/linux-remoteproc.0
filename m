Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D92A2D3724;
	Thu,  2 Oct 2025 07:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759390238; cv=fail; b=cBqSvOp+bR/03ZFJ3FAHFyn88BwpVhNZpmuPcIiYyLvTAW0VUA3M3ddsdM+acy9VzMB2OSu16mrvoSV4mwlq61zycyYS5Fu/6u3FMEQJjQ1GJGm+WdfqEpRfNq4Y0KffEwfUOLeqFCHOh4Br+SYi/H9n3uvRbBk5iuWSVWWlkoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759390238; c=relaxed/simple;
	bh=hacdOnIxJQCJZuTo4zLIesroG3wk9YnnBME6nkLKEqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JStTvRiJl1B4LlSJK1H3BC2XHOHBWIES5EF0PqoA1SR4VjP9K0kmkgl4eOTKcyxuN2BSq85fcxCjC2ylZhmpstCKnDBjrnKHobaB0lYYaGTLSY6Gb1dgYRF+xjk1M8uv+K3kYlIvU/D/ZLeckE3bgAeQCsWI/xyqIr5LJZB9eUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=TdeZUIZl; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="TdeZUIZl"
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5927D7J1022208;
	Thu, 2 Oct 2025 09:30:13 +0200
Received: from osppr02cu001.outbound.protection.outlook.com (mail-norwayeastazon11013051.outbound.protection.outlook.com [40.107.159.51])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49etvjhce6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Oct 2025 09:30:13 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=crG6qhZbUnDA1XuRyqJONUw/W3Ao+p5N/HzYRouJs+tirkCpb1hRKxNhcRbDZr3LuwpT0nPLZ2Z/G2XbG1vSgcL4Ks64aR4w3Avxac018P6W1wLaQnLwQbe5fgAC9OSpy9+bgarF8s3tNGAug8OcdjgDOaE1bwMP4ZE9PZFE8QnRZB9o2X7zW8Dom89tiRkSkwyeq67JrydfRNkNQqp0ElATnenLCxYcid9Tc9VsNziMgmDoMZ6aibNdIic5WU6fgrpG4AeaqKTmkoMwX01yVoaG5IX8GV6XcFmzn/EUozKLnR7UtR0MRTntHrE0LvfavY6Rb7ARdRpdstradyyl4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hacdOnIxJQCJZuTo4zLIesroG3wk9YnnBME6nkLKEqc=;
 b=gak9J+o0AXIoViFLxdVqXlF28xg/m+sBF3kcoNjrlqxieJqdETXTcpNVPQx8ztDFTtCI8M/q2ieOyZ9yMWaCpnofeYn01Aw63AOJ9hQmXCQsaHS4bXBmCHvAQG/1yXvcWkxSUfV/awDSMWWBinhe5mch+INEbCw5rPlek/f3SmGnHVIZTwY6X6rSmSdAZcg0HznbYWCWW5sjIrxIga0AuOF0+R8ywTqqnk72nahp9o3caJJHJ9SQhYtPLuhyO0ueTccq1SnAqCjxk/fLEvy9n4j9aJJFM63XJy/r/lnd2RId10cC68QN6BLtUNx31x8rOx8uid7MX+2cpEbyTMNp0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hacdOnIxJQCJZuTo4zLIesroG3wk9YnnBME6nkLKEqc=;
 b=TdeZUIZl+ji+RmTuhJKWjfU+LeZauK/Gh/YYZKKs2gPR+M9xlgLHfqXT7K5ClqnGGWQIUua73mtYsGLWOGz+Ac6GueSAHIiHFFjrqbwbZGuXrLvNQP+iASsGNvKysGWQhd9ETn5Ynm3H6pEpSNLICmZABCV0IOjrZET5iXoVziAUKfTF21s4uUjyD799eBoXH9HAl6YVGW/PJXulOsWmFIOlNNX2Mq/sAm/vrpBEGY9YTqFBCH7HkRl9ZBFZbQvzdO76LpdyNPRU3qiWQRYaXW0y6u/9CAibmgZE7ECdpmjnJ0IJqtAK2QM1GR2ewwnCfGWUIDGyM5Juz5V+JPXMcw==
Received: from AM0PR06CA0097.eurprd06.prod.outlook.com (2603:10a6:208:fa::38)
 by VI1PR10MB8256.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1d6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Thu, 2 Oct
 2025 07:30:09 +0000
Received: from AM2PEPF0001C70A.eurprd05.prod.outlook.com
 (2603:10a6:208:fa:cafe::87) by AM0PR06CA0097.outlook.office365.com
 (2603:10a6:208:fa::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.14 via Frontend Transport; Thu,
 2 Oct 2025 07:30:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM2PEPF0001C70A.mail.protection.outlook.com (10.167.16.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Thu, 2 Oct 2025 07:30:08 +0000
Received: from EQNCAS1NODE3.st.com (10.75.129.80) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 2 Oct
 2025 09:26:35 +0200
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNCAS1NODE3.st.com
 (10.75.129.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 2 Oct
 2025 09:28:52 +0200
Received: from [10.48.87.127] (10.48.87.127) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 2 Oct
 2025 09:28:51 +0200
Message-ID: <adc18aee-02bd-40e9-9b8b-10ceb2122460@foss.st.com>
Date: Thu, 2 Oct 2025 09:28:51 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
To: Linus Walleij <linus.walleij@linaro.org>,
        Shenwei Wang
	<shenwei.wang@nxp.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, "Shawn
 Guo" <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "Bartosz
 Golaszewski" <brgl@bgdev.pl>,
        Pengutronix Kernel Team
	<kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Peng Fan
	<peng.fan@nxp.com>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-imx@nxp.com>,
        <openamp-rp@lists.openampproject.org>
References: <20250922200413.309707-1-shenwei.wang@nxp.com>
 <20250922200413.309707-4-shenwei.wang@nxp.com>
 <CACRpkdbB+DfhqUE-fsz_RQ1U02+nMEhNsXrKB4bd6dvLDLjWUQ@mail.gmail.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <CACRpkdbB+DfhqUE-fsz_RQ1U02+nMEhNsXrKB4bd6dvLDLjWUQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70A:EE_|VI1PR10MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: 57d43777-9646-46ea-220f-08de01858397
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bDBNYXhqY0lJbzYwTnhIa2FrTllJUXcyK2xKN3FRZG9scGlMSnVwNnFLcFFh?=
 =?utf-8?B?a3VHdHdiT0o5ZHZZS256MDBXRmlZUkNIQXVKU3BtSVB6Rkd4R1RzSThOTWYv?=
 =?utf-8?B?clNDT1lFTHhJN2JKc1FKTEVVKzZwNFJWM1ZCNHNXdHkrYkl0cWd0eDZqQ1Rj?=
 =?utf-8?B?eTlEWHl1d0RIelR6NFFHVm10ZUljcjFBS0x1V3NSMHRZYm9vdDRSYy9SdVZn?=
 =?utf-8?B?WnMrYkM1UXhySWF0QnZoa0FJN1FQdVJTRDVpbjR3aGR5akpSR0hFVGdyOEo4?=
 =?utf-8?B?bWZrR1dlQit6ZE5MZWczUGRHWGVWVlVJS3FJcy81Ynk5UERNbW8yTWc2aTJV?=
 =?utf-8?B?VWJMVllzejI2VU5Fa2w0b1RJQUNtdkZZYllpQnJ3MVA2YkFYWjlOTjlNd0g1?=
 =?utf-8?B?dCsvWngrbzZXTlFsZFVRMkdYd0pQN3BUNE4vYk1WV0NYcUF3V2JZaktlMUdL?=
 =?utf-8?B?dm81VHo5SS9mU2pSZWh2Q0dudUd1L1RGaXZ4aEFFNUV1WmU3TWRXUXR4Q3pv?=
 =?utf-8?B?cURES3JWV1BEckdRMWVDdjYwSTJqUWNpcVEvd0lmdHdiRU84V0RvK2xlTVBM?=
 =?utf-8?B?SWxvOGVSSGFsbVRtSnZmL0lSNTY4dHFHWCtTbVZLSU14ekpGdmp2bjVuaWRr?=
 =?utf-8?B?a1Jac2xtMDFoUHhRL3VpbTc4NDN6QkJRQm14blVxZVd0cFFIRlM4TzMwbGJk?=
 =?utf-8?B?TjN1dVdpVHJXc2hvb3NPQ1dTSWduN2xvYktTbVpMZVZsSSsyajJKWEdnd1FG?=
 =?utf-8?B?VmNpLzZOSENLK3IwRHhBN2FKbU9ZZTJHNHZhdDBOMzlScWw0alRhNC9oUzNV?=
 =?utf-8?B?UWhzWkdnM0tXL0VxT1VNRGFjUklsdHFtM0JhSWpMZ1pUNnNyRkRNTTczRTZz?=
 =?utf-8?B?R1ZzNkhTZFBUdVZaWFhhcGJJV0Z6THE3NGlINFFCZnpmRjcrRmlTakhPMDBS?=
 =?utf-8?B?M0VtYXBIWXdkVWpPZllpOUl5U0Z3WUl3dE5kUzk4R0dWNTBvN3FEWS9IaTZ0?=
 =?utf-8?B?QkR0M2hZQlJoeHcrUHBORHkzWGpKZllGdytQRmtoKzU1Z05jQ2tCcFFhNmJi?=
 =?utf-8?B?ZWdpdmtlY0FWOGQwUVFIYU9MSndIZjBnT09Na2JiQW5QVlVUNzJRdVlMQkEz?=
 =?utf-8?B?ay9DSTZyaWFZUWVhUTFSUHBVdTdydjFtWlN2dHA2M0w0MElCVnFWSVlWb1BX?=
 =?utf-8?B?TmhiWnQraktZVFVuV3lCdzFyR0NJenZRREFqeS9LV2gxbFJ5YjhIMmJpVGF1?=
 =?utf-8?B?cjFWeTBGUjBydXd1MytmeEN3MnVxbE9zZ1VvTWZKMHRxeVZHbmRwTkJFdjJr?=
 =?utf-8?B?d1lHd29mN0VQY1Nsc2I5TUxWTnMwek1LVFlaRmFuR1lZUkNNblc3MFdubko0?=
 =?utf-8?B?aFJDMzBaNWhzZWZLMHdTR3ZqcjhSaE82M25kd3NtZ3dWL0JKeHFzRGV6V0Y5?=
 =?utf-8?B?M090dnRIVWRuek9iVi8xNm9oL2NIMXhVVGlyNzVwQ1RPU2VkY2ttLzNGSnNr?=
 =?utf-8?B?ZzhNeCtjU3A3b0hJSjdmaitacmlrdjJ5Z2RYZitOVjVQdC9lMFVIM1ArTFBj?=
 =?utf-8?B?MVdodm5ZZDZhWFdqak05VFh5K3V3bXVsMUtESFYvVGxHMk5OMGVVNFk3c2pO?=
 =?utf-8?B?MEZMWUV2Z2QwYmU5bE9FOTdSRzFPQ0dkdjYrWTRTK1lZOG9Za2kzOU9GSFc3?=
 =?utf-8?B?dEpXc2ZRaXdUUnlCNFpvM09oRXB6SG55LzZ1UVN0ZGRCSldubGEyZVhNTDZV?=
 =?utf-8?B?QkJid2hhLzJUaE5pOC9Rd1p3bS93VklsRVc4OGk3SndTOWQ2M2pzUXcwVGtQ?=
 =?utf-8?B?OHZHVHZyTkdKandCMjF0Ylh3a3dBdHRTQ3BiaFJ0eDNZNE9EcFVLNmhlYXo0?=
 =?utf-8?B?SGg2VDRiczBoanlsZUtXOThxSEYvUUlUSFRVQkJtQjBCUFVCdnc3RGxZOHNL?=
 =?utf-8?B?aXlEQ0F2UklqSjFMdFJ5bHo1WXVURm5SUUtPUW85SUNSZlVGSHhTdGVYYitk?=
 =?utf-8?B?d0hBTzArWU9mc0kxbkN2RWFwNTUvOVdTR0ZGU1hrQVhiRDF0YWZlbmhPRW5V?=
 =?utf-8?B?V2hwNldNQVpUUXBJU3h2Z2VvQUh5TENZemFVeEI5dEYwMkJGMkdFYnNWdGNs?=
 =?utf-8?Q?HYIk=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.43;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 07:30:08.2111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d43777-9646-46ea-220f-08de01858397
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.43];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C70A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB8256
X-Authority-Analysis: v=2.4 cv=OvpCCi/t c=1 sm=1 tr=0 ts=68de2a05 cx=c_pps a=caHvpjIXtg0psX5ICJsGNA==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FOPVHIcnkjUA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10
 a=KrXZwBdWH7kA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=rO7Un4uusEew-VTSQGsA:9 a=QEXdDO2ut3YA:10 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-ORIG-GUID: QTmOjJMu5JsCOXLUYRkehwcWfGn18aSE
X-Proofpoint-GUID: QTmOjJMu5JsCOXLUYRkehwcWfGn18aSE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI4MDAwNSBTYWx0ZWRfX8cZrWTf2VG9e DyA8g9RXXL55g7BLJSg26rnY9PZF6aySCrrTQjolzZ4Vg1VPhGug2OLNCP/DOizV6FI/bP6C2v6 GbgzIVVvuO8De3d/5NPNvveRheMlm5mswzOQjmCQePabfRnuWCG4tOMz7Azj9ONYwYO8cKIUBsX
 toy1cRsXN33A6TVyp1dU7K/dXPZOMva0lycTuwcetEjAji77Wvlbqf+7E69UKU1plsQ8+AChmqR xZBoXI/2mykFB2PdI5L9m2c8Gvn/SINtO85kfpl9IWDB37lOclVYdyTYKwZLPCYYmycHcr2BCHW crzvDI80MnbDcsiqp8VVnGSw6vXfKrivn+K38gcUkqDSpbtf9quIv6b1xRogz0TtjEcr8A4iPqG
 8bLA3WBRXXuLjJsTcJKVkfTjJAn7Bw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_03,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1011 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2509150000 definitions=main-2509280005

Hello Linus


On 10/1/25 08:57, Linus Walleij wrote:
> Hi Shenwei,
>
> thanks for your patch!
>
> This patch was not sent to the linux-gpio@vger.kernel.org
> mailing list, please include that or we can't merge the driver.
>
> I think the OpenAMP project should show interest in this
> patch series so I created an issue in their github:
> https://github.com/OpenAMP/website/issues/122

Thanks for pointing it out , i will do a review of this new version

Regards,
Arnaud
>
> After fixing the issues pointed out by Peng the driver
> looks good to me.
>
> Yours,
> Linus Walleij
>

