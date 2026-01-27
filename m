Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CAB15530C;
	Tue, 27 Jan 2026 17:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769536132; cv=fail; b=vFtG86+Pi9089RY3J4D+cvn9EMKSbN/t2wohlL1GjKGCcT6gUlYfHta8ChApxQwSPM1VSOQDKTKzdWU4rfikcp98fQckbd4D1nmrT0KMqEQCk9oN7BSM6PxX8hp4totg/878Drm3fBm9O+wUh13ml60Ij4OTWH4Kr6O0sQtevyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769536132; c=relaxed/simple;
	bh=XobYkkJBOSaLw3QIZEoaLIg5aKxb6Pj0nRhP2unNZQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DXaoZ4Not0BOKIoD0qcISGJZrdF9fkDP0cexCkaWiZ5h20Qd5oCI66YSy21C3/awGmg9ObeS1BYsMcDWdln85xSFsJnqI5JwaAr2UqZlC0t67A5KmaQIXOGqyGRigHf0oUzRTbJ3VjQP+AJKgqt0elXkfcZ0AWdYIgvm+UhbX5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=CkYykRiQ; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="CkYykRiQ"
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RHjkeM1626368;
	Tue, 27 Jan 2026 18:48:31 +0100
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11012029.outbound.protection.outlook.com [52.101.66.29])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bvq5yb3pe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 18:48:30 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QUJByLa2UsIt3st+l+fhA0BMWi+VLFsKb/n/vCrVYg2b3kPKh1jgjJ51p06qisQ8/ocRFOYI2XEn/xtbhZSJr/sq3rrlYYv//JyrLux2GztU7F75M7i9MY7wrG50IJPYvSwv4QAMf6ichDSE6VuxBgkZxVm7wmyWIH0OnGWId97gcLMvToQUBnXy416/rJt1jmHqxDxyCjhd7cHnzwbWPXiKws8xLwR7cNSWrIbDd+/xoLipOAaqMvtXCoXVBPXe9r2yrGs6XAZEPGW7L1FHPwsCEmEV1ty+c3SWMaBDuG+kjbkj2SIYf4HE2YavsEaUlgb/uYaUnRNiZy5KzNADDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4N0uHfWo6DZ6V/H5+KTzKAcMKzGmbd48px+IeIUEQlU=;
 b=pXfbtMML/pwbvwsaisHr+uXLh+PL/1Fr7iQy4xtJK/tdHvzYVMU2VC1gwW7Vpq9qKn71C+GzIN723cnKetkyyrMctz5ssIIwNCyCYAK2/QQsa56UDxUHp7IsKgeaTk4DGBsUH8Bd6VlbZ49oTdzIetMn42ez3M41ae0cvoZbv50+/+QzdFlHVCJCWJ9wTO5n1fxfBsR8RYJBhmmtm8K5SrZM9pljbjogo4JlP3vtJjCrXtsv5yKVDQRzXU3sApFEx+84mkaK5MFlyYJZqJ2+D138kwfFbuMJaRkExrelFSCmZycke5XjSiRpCS+IOyrUxBnUXxuEDTnodF/EExrBbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4N0uHfWo6DZ6V/H5+KTzKAcMKzGmbd48px+IeIUEQlU=;
 b=CkYykRiQeZBBG1P+KZc3bDUnYmEuaR6+ljs+HGsMO4fkyI9KlbJHsFJGfBX+ngXMYFj6GmOMB5akXCFNy7TQA4Bn9DyTxJ7QW8iwxuN1cA/V7/dZp4/6dakHiz/J1jw39D9qj74eWeIelyw0zlDEWmIxbzjgA4S1hjKetP+AMbxXOSrgK9ywh8UujeqQHH7sqOY4gB002JW04JBHblGfz2RxgaH2VcyA1sMkjspoWlWDHdYbySsKFgK96lj3nh5g/W7Hca45atAHOfgA01ZYzAD0SnbKoay0Hn3iq6K6h80mKwEOKjsngVWLjqW0krQuWpRogzV//CyT0zWJzV4ukA==
Received: from AS4P250CA0024.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5e3::17)
 by AS2PR10MB7154.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:60e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 17:48:26 +0000
Received: from AM4PEPF00027A68.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e3:cafe::b5) by AS4P250CA0024.outlook.office365.com
 (2603:10a6:20b:5e3::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Tue,
 27 Jan 2026 17:48:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM4PEPF00027A68.mail.protection.outlook.com (10.167.16.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Tue, 27 Jan 2026 17:48:25 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 27 Jan
 2026 18:50:07 +0100
Received: from [10.252.13.36] (10.252.13.36) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 27 Jan
 2026 18:48:24 +0100
Message-ID: <d18f62e6-ab68-4947-bab4-9915cd9418fa@foss.st.com>
Date: Tue, 27 Jan 2026 18:48:23 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] remoteproc: core: support fixed device index from DT
 aliases
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20260127130555.3211411-1-arnaud.pouliquen@foss.st.com>
 <aXjyKzINfpwkv2Fi@p14s>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <aXjyKzINfpwkv2Fi@p14s>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A68:EE_|AS2PR10MB7154:EE_
X-MS-Office365-Filtering-Correlation-Id: 60e581a4-7ef7-420e-7b6d-08de5dcc45c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dW9HdnZoblI5ZEJEdmt2NVRFUkVRZzhCL0pZeUlqN1o2V2dBU0dwbUREcG11?=
 =?utf-8?B?RUZMWVVkM1Y3Q1hHWWxGeDV4Q2lzSzZFSTFDRkRsdVBUZEpnMzViRkpLNWl4?=
 =?utf-8?B?UkMxcGFWRUhHTW9yR0dFMld6OFlQYU9DMG5GY1FlRXRZZ3lUUExuMW1iVGlY?=
 =?utf-8?B?Sm9QcWVmVEpVSXV0NW1mMGMrZmFIdkpFR05EQW0zSDdhZzRVbUdRYkcyV25s?=
 =?utf-8?B?YTYzVG55dmhOQ2hmU01jcjdmbE9UV3Vyd0NxejkvMjEyRVpVUHlwSURkc2tu?=
 =?utf-8?B?WmZYM0RpVzN3cnQ2blZKaFhlK1ozYUJLelUvL203RUVsOFdBdEZveWpaVkdO?=
 =?utf-8?B?YTVUK1pYNFRqU21VS21mK2Zzc0JNWEx6RzlNUkNiTUd3L0UwdjBKcDdpdklx?=
 =?utf-8?B?L25pOVliS1ZyL2VKTS9UdTBmQk91bFV2SzJoR3BUNkRycENEbHgxN2pzTVow?=
 =?utf-8?B?aHB4Ynd0c2RaRm9RZWZDZ2RHMUNxWmVVS24xZ24vUnM4RjhzV1BOKy9WS0JE?=
 =?utf-8?B?ZmlkVnB2N0tacE9ScjViQmtDclhJUDdsWDZ2V1R0NVQrajFmUUNtaURKODFt?=
 =?utf-8?B?T2pnN1ZMcUdENm5POW5WTTFhOGh0bVFya3haamlTOXFRNFE0UnJBMXhMLzdI?=
 =?utf-8?B?RFNncXpNaWI0Q1A0YUlacXgwWmpnU3dyOXF3bm5XZjlyLzNKTVM2ZGxsSmF2?=
 =?utf-8?B?czVCVHdRTU1OSWVhZHBPYXZPSHBwU2g3d01LRkV6T0xMUmVYYjhGQkVmSUE2?=
 =?utf-8?B?NGNXUmVXZFFRamlFQzR6d29OT1BGSXJRSmxtTzJhTFhQUTV4dmRENXRWZ1dS?=
 =?utf-8?B?Z29ETlpMQkNScGdyR2RFZjlvSlJ4RmEzb3FSOWNvRUZZMGx5K3ZLNTdyQ3li?=
 =?utf-8?B?dGFMeXhBL3BqQVdLTXBGMFVlRC9hUExiVDgwTGYzN1pCOUl3aFNnNEZ0RGRW?=
 =?utf-8?B?TnlnNXVqOXF0YlhEdEVtKzRLQUZvb3NFdENWM2xzZTdRWDQ1eXdZaENHSVBM?=
 =?utf-8?B?Zis4NlhEaE5CWmpMQ1Z5MTR4SnF6TWFVK3lHOC95MnkzYVEwdGtuYi9nN0ZN?=
 =?utf-8?B?alY3d2xWOEx6endrSlBXM0k4OTJmZTdKcXBBZkZaUVk2dEtoWE5LL3RFUE9K?=
 =?utf-8?B?THJ4WDJEU0RaL250cVo3S2NXcW5ZaU1pWmpXSHE1ZXhva1Nja0lhdFduQTd5?=
 =?utf-8?B?QzVsSVNZUUcrSVNRZVBtd0RCZXUyTU11MWFQdldDVGw3WXVvQUJTZytRdlZQ?=
 =?utf-8?B?cGVWUEl0RnZXTC84YmgyWWJySGtRWkhCMlNZd1NZMGRhRjQ4dkJ5ejBXd1cy?=
 =?utf-8?B?VUYvTXBiNTQ0OENTbVhzMEcrSGRPSWlKZXJJRTNhdkI5WitVRFMxRWh0VHYr?=
 =?utf-8?B?MzNUMnZnanBhR1JRSWVDRXpLTjM0S2Q4VXZLODRNcUxNWFRhc0U4OUJaTEJY?=
 =?utf-8?B?WDZ4elo2TkFZZlIwTWRISE10NFpMdHZTcWZZNDlaOFYwUnpYUWlYUm5Hc3VX?=
 =?utf-8?B?YjczSm12SGxHTS9rdzljZTBVc21GenpDbU5UVmZUd3JGQjBHVnozc0kyaUtH?=
 =?utf-8?B?TUZpOUs4Q3pJTkhXSnQwTUhKajRqN0Y4RUplai83RGpzd0ZxZnhlcGxQbitV?=
 =?utf-8?B?VVJnbHdxbWd3T0g5NkdOdU84OXEwZlN1S24zT20zSlhYeE0zSndZa3JiRE9w?=
 =?utf-8?B?L1FhaXIxejJXWDZWUXdjTGFTQjFlN0xOaE9oT3d6QUhHSDF0VFJUQ2JGdm9l?=
 =?utf-8?B?V01UQUFXRzBnUG9vZm0xZEZzVjdtR0NReDVseG9PaDRuZm1adW9JT0RUOTlr?=
 =?utf-8?B?MHAvc2NIbkxXWVVTb1pncEtsRDR4WXRhaHhnYkoybmtCcENLZkcvTWF5VUc0?=
 =?utf-8?B?bnRHVnRNWWRyRWRJdEhlWTVoV0txb2VwenpSQ2NjK0FyVHZKU2pLYVlSRXFn?=
 =?utf-8?B?cWl4M2loZDVKMDF5RVBidGVkWWVOM2p3TTRmZ0VtRUtuVHBqV0NkcE0zRFVL?=
 =?utf-8?B?SUN3OTZ5WEtibFBNZVY0NHduaklKdnFKVkMwdGRrL1pjVHBmT0RSNyt1RDNG?=
 =?utf-8?B?U1M2cjJqSWFyNUNyT3h0WnJsVjhyNEY4bnBJZG9sRjZsWFlyNTQwcnRTbjJP?=
 =?utf-8?B?V3ZFbnh0M1ZSamVROS90Y0ROd3lHVWNsUk9BcEhOZkpQN2V4cFBsUjl1UGdJ?=
 =?utf-8?B?bVN1dXJic01LN0NyRmlVNXlRUlU3c0ZhV1FSTWZyKzkzdnJJYnBVK3g0dlF5?=
 =?utf-8?B?Z2gvYkFPNVZZYlh0WU9tNlRsL3lBPT0=?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 17:48:25.7750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60e581a4-7ef7-420e-7b6d-08de5dcc45c9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7154
X-Proofpoint-GUID: eYw_0aaOvjcl4ZA57GV4TShXOVkwp-uz
X-Proofpoint-ORIG-GUID: eYw_0aaOvjcl4ZA57GV4TShXOVkwp-uz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE0NCBTYWx0ZWRfX6cSuAvM6s49q
 fK+z0aM62oBBIB5x1/qFWNJuAM41yv2MgVm6tFNKhmGbD6hc1tSH26PYCThfxOHRYQlHX7gpmWQ
 2GExoi79X+Abxfq1Dggb1S1/bhLdloW2QO0V2mE4XVnXMeBrQf0tgqIbnY4DCbrV+zUcLjCrH6x
 P66yjslo+LQQJwlESPQWQTrY7dCThiF3ibMcY8wNKMij41hAhuy4jFhnZC/lcaSVaIHdrwZ9OoA
 N+OrhkirMKjea5OHe2NQQ7CT7+yy8dDEtwQJcbJIwbApsYehVuAeLxhBTYuYjP+/odVqnePtY2l
 P+fF2bTkXyqLI0g7tXxPf5gPJzMI3AkWAissfKfSZCFKT1tXKj+1iJgnHYc6R4auQOoExlOpdqh
 WFwPZHOgWgW5gYkzsCrxRJWJJbCIfn/EnbZuJvvdeHB6TWb8QM6HD9bn695aujtAvuoQVgpVLbU
 P+UHH7i7wlvPBaC4vaQ==
X-Authority-Analysis: v=2.4 cv=daaNHHXe c=1 sm=1 tr=0 ts=6978fa6e cx=c_pps
 a=oS5T+1yz5oFjPCja7KH8Cg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=ovqo7BHi4x0A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=JH4EZcnyosbx_a9_M8AA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270144

Hello Mathieu,

On 1/27/26 18:13, Mathieu Poirier wrote:
> Good morning,
> 
> On Tue, Jan 27, 2026 at 02:05:55PM +0100, Arnaud Pouliquen wrote:
>> On systems with multiple remote processors, the remoteproc device
>> enumeration is not stable as it depends on the probe ordering.
>> As a result, the /sys/class/remoteproc/remoteproc<x> entries do not
>> always refer to the same remote processor instance, which complicates
>> userspace applications.
>>
>> Inspired by the SPI implementation, this commit allows board-specific
>> numbering to be defined in device tree while still supporting dynamically
>> registered remote processors.
>>
>> For instance, on STM32MP25 Soc this can be used by defining:
>>
>>      aliases {
>>          remoteproc0 = &m33_rproc;
>>          remoteproc1 = &m0_rproc;
>>      };
>>
>> When a "remoteproc<x>" DT alias is present, use it to assign a fixed
>> "/sys/class/remoteproc/remoteproc<x>" entry.
>> If no remoteproc alias is defined, keep the legacy index allocation.
>> If only some remoteproc instances have an alias, allocate dynamic
>> index starting after the highest alias index declared.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>> Notes:
>>
>> - This patch is submitted as an RFC in this first version.
>>    The main reason is that support for the Cortex-M33 and Cortex-M0 on
>>    the STM32MP25 SoC is not yet upstream. The primary objective is to
>>    trigger discussion on the concept; if there is agreement, I can drop
>>    the RFC tag in a next version.
> 
> I think this is a good idea.
> 
>>
>> - The keystone_remoteproc driver also uses DT aliases. As it uses the
>>    "rproc" alias only to construct the firmware name, it should remain
>>    compatible with this change.
> 
> But we won't have "rproc" and "remoteproc" as aliases - it will have to be the
> former since TI is already using it.  I also suggest doing a #define in
> include/linux/remoteproc.h.  There is a possibility for backward compatibility
> issues but we'll have to let the feature in next long enough to find out.

That seems reasonable to me. Regarding the TI driver, we can expect that 
the only side effect is that the remoteproc device indexes will no 
longer be random.

I will add Andrew Davis in the copy of the next version to get his feedback.

> 
>> ---
>>   drivers/remoteproc/remoteproc_core.c | 25 +++++++++++++++++++++++--
>>   1 file changed, 23 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index aada2780b343..8da6c410870a 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -2461,6 +2461,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>>   			  const char *firmware, int len)
>>   {
>>   	struct rproc *rproc;
>> +	int index = -ENODEV;
>> +	int first_dynamic;
>>   
>>   	if (!dev || !name || !ops)
>>   		return NULL;
>> @@ -2481,8 +2483,27 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>>   	rproc->dev.driver_data = rproc;
>>   	idr_init(&rproc->notifyids);
>>   
>> -	/* Assign a unique device index and name */
>> -	rproc->index = ida_alloc(&rproc_dev_index, GFP_KERNEL);
> 
>          rproc->index = rproc_get_index(dev);
> 
>> +	/*
>> +	 * Assign a unique device index and name
>> +	 * Look for a static index coming from the "remoteproc" DT alias
>> +	 * (e.g. "remoteproc0"). If none is found, start allocating
>> +	 * dynamic IDs after the highest alias in use.
>> +	 */
>> +	if (dev->of_node)
>> +		index = of_alias_get_id(dev->of_node, "remoteproc");
>> +	if (index < 0) {
>> +		first_dynamic = of_alias_get_highest_id("remoteproc");
>> +		if (first_dynamic < 0)
>> +			first_dynamic = 0;
>> +		else
>> +			first_dynamic++;
>> +		rproc->index = ida_alloc_range(&rproc_dev_index, first_dynamic,
>> +					       ~0, GFP_KERNEL);
>> +	} else {
>> +		rproc->index = ida_alloc_range(&rproc_dev_index, index,
>> +					       index, GFP_KERNEL);
>> +	}
>> +
> 
> I find the above hard to read and even harder to maintain.  I suggest spinning
> off a new function as depicted here:
> 
> 
>>>>>>>>>>>>>>>>
> /*
>   * Assign a unique device index and name
>   * Look for a static index coming from the "rproc" DT alias
>   * (e.g. "rproc0"). If none is found, start allocating
>   * dynamic IDs after the highest alias in use.
>   */
> static int rproc_get_index(struct device *dev)
> {
>          int index;
> 
>          /* No DT to deal with */
>          if (!dev->of_node)
>                  goto legacy;
> 
>          /* See if an alias has been assigned to this remoteproc */
>          index = of_alias_get_id(dev->of_node, RPROC_ALIAS);
>          if (index >= 0)
>                  return index;
> 
>          /*
>           * No alias has been assigned to this remoteproc.  See if any
>           * "rproc" aliases have been assigned and start allocating after
>           * the highest one if it is the case.
>           */
>          index = of_alias_get_highest_id(RPROC_ALIAS);
>          if (index >= 0)
>                  return = ida_alloc_range(&rproc_dev_index, index + 1,
>                                           ~0, GFP_KERNEL);
> 
> legacy:
>          return ida_alloc(&rproc_dev_index, GFP_KERNEL);
> }
> <<<<<<<<<<<<<<<

Thanks you for this "turnkey" function.

Regards,
Arnaud

> 
> 
> 
>>   	if (rproc->index < 0) {
>>   		dev_err(dev, "ida_alloc failed: %d\n", rproc->index);
>>   		goto put_device;
>>
>> base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
>> -- 
>> 2.43.0
>>

