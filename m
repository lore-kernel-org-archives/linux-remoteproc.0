Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DF7266B40;
	Tue, 16 Sep 2025 13:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758029232; cv=fail; b=oteg95KCDVrxfN2j6votRoNgPkM4mwgY9+caQbU6BeEcVD5EEgv6JSUHhzX4WEVzOSXHa8gSWA2hJNbqFnyyHRebyUhjQhF5vFHUVByOHnHEFCyRYsvJNcs36zIXIl6qmHij85RtFRKaNIa3ZkgG1MiPu3K0Iue1cUwUrX6rJb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758029232; c=relaxed/simple;
	bh=2TsWxektvBhoz3LahQLvRiEdjeEgKjXCHTgwU+61APM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KeUwkVBOqC3yPvkkkJ7P/w7Fwo7BBuT9wvgHzwJEby70eHXViUiHH/LJSGZyQrUwftsqEGdYgqTOa+Wj2g5Uov9Nr/aHXJC6YYliw69swr77PZL24xtDCl1hqsr0wEpUIQhrb8+sfYQZvfQN9qURaAgRMBZio4Iq/JRsw7CaV2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=cdQzwsB/; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="cdQzwsB/"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GC9HFZ013028;
	Tue, 16 Sep 2025 15:26:55 +0200
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11013058.outbound.protection.outlook.com [52.101.83.58])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 494wr9urvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 15:26:55 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AiXYdYqgTJpZmaw3lLA92basBUT/xIvt+nU5+wBXATrsy1P4bfnMed6Pol2BcvTbdt4tFYVNU1tDNWFl3MWCx1YEOPCsv0CVcZHDYTXBSuDiwOlQYr60L4j7xns9XF9UrzN5GB9psUy8whxtTzKUy/oXUSKEfnIpHOzSpklctk0CT3G5utT1LGuFTc0H41N+Yg1vZ0OvCBNxuIXCc045Ly3jGCKgbgHczJTYsSPo1aAIkwIxdME1iMlVg61BoUXIPWBSgn+wHvTcyNymaXB5loKLQ2qNM6eFmC/XwMfLy8JN16vq4D7i3Li+8zCzxrbtj/JFfgvM2KjYi2ISl/JTvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJvFsulW4qiB/NBOBng5vfuW02X0pla+/tATnDTKSyk=;
 b=xuMj5jzTFOB6BsrBknWUGTexpLC1vAeRxyXPsHRpnz1SO0FTpyxuoE5Yt6wdH4QzGHH2YdITTimsAiHpivYXsTl314Lr43AS1HbqJ04YIoqW29EI4EPWH2zBFcRqz6VALRiMi5tdylnPvjUYeTwHso2h2FLEt9xXnkYCv/PHbiITEEychL37uWgwbg8Lx4d+NQeIbAk7z78O2SpYB1HtEE8X3bvMK+cg5pz3BklJIQOPQvWm9xtn2g33UxAMTAmcpBOUv2fqWtg0FvA5At8d8UINSP+3w52rTX4kPaj0AcHmartUzJno39uxhb5GPL0nFlZY7MIn8Gbc1egKnP+yiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJvFsulW4qiB/NBOBng5vfuW02X0pla+/tATnDTKSyk=;
 b=cdQzwsB/wyEn1kiegDe8aD2rEbZLkDgUaT0NxRW/VrSZCAZHwLb/ldzfYdbNL6J2O6g52DRiPi7zL45sAE6LoH0CqorE1XBgWBaOKnI5l+Wtq4bYqlj3Vh9vFrcruUCocCrN28UpFNZWDu+Z7SuvX6ZvAT720mNC+hWEIbOxPidKWM5Hk4NZLRUQS1XDjp1rZ4NliRb79zVRXckiFC8zJ2m49Pa/qSwZn46a21zDxQ2S1F/XWjQzVQsC70LJsbY4OOcIUkKKBSwXBgNqM+jq22PTV+rbBg1ozNo15EvfzV5/P84Xg5Z8llYFSOjWBIXK3Hb4YQ9kgL1wPauQDmTL2w==
Received: from AS9PR06CA0697.eurprd06.prod.outlook.com (2603:10a6:20b:49f::25)
 by DU0PR10MB6725.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:403::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 13:26:50 +0000
Received: from AM3PEPF0000A799.eurprd04.prod.outlook.com
 (2603:10a6:20b:49f:cafe::be) by AS9PR06CA0697.outlook.office365.com
 (2603:10a6:20b:49f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.22 via Frontend Transport; Tue,
 16 Sep 2025 13:26:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM3PEPF0000A799.mail.protection.outlook.com (10.167.16.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 16 Sep 2025 13:26:49 +0000
Received: from SHFDAG1NODE2.st.com (10.75.129.70) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 16 Sep
 2025 15:24:25 +0200
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 16 Sep
 2025 15:26:49 +0200
Received: from [10.48.87.127] (10.48.87.127) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 16 Sep
 2025 15:26:48 +0200
Message-ID: <62bdb238-7440-451b-84ef-79f846b10ba0@foss.st.com>
Date: Tue, 16 Sep 2025 15:26:47 +0200
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
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <aMkqifHSdlCs4VjA@sumit-X1>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A799:EE_|DU0PR10MB6725:EE_
X-MS-Office365-Filtering-Correlation-Id: d4008bba-16e7-4b31-0453-08ddf524b14e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QVg4WWxXdDhWNFdlR2JBMmd4RFR6dTZseFFGTGZJT1o1dVVPbFlBVWQzSm43?=
 =?utf-8?B?VjIrT1VaclFRZnhJbWJzTEdrZFJnUFJzdTY1SGExWmNsMXZyNWFSOUVJK0F0?=
 =?utf-8?B?VE8xZ3RNZU00dmxWOWtFR3dTQlEvWUlrU3AwbXlBN2s2QWovUm5pVzRweTBT?=
 =?utf-8?B?VWZpWnRVdkNwR2RqOE5YK3VqNnNVUzhMbmYvam4rSlliczZMS3dDcWNvb0dC?=
 =?utf-8?B?QmxFei9DQ0FIRzBZK3h1QWs0bVFQUE1zTHgwNnFxZXA3YzZIT29XVnZMbHBP?=
 =?utf-8?B?NHNtV09QR0F5bTVSSzA3TDl4TzV3K2FoTWpzUmNETWhmZmxlRFp2RHJlYmhT?=
 =?utf-8?B?Q1FiaXVWbUplVHhEV2Nja2RMRlhSQmlJTUxLTVQwOWR4YUF2dHRqZEpXc0R3?=
 =?utf-8?B?WXBwWHE5TjhRVWZUNXJwR2xVaHpmNXJ2MzRzTnRIMUoxeXVNYVl5a2NRQ1Y2?=
 =?utf-8?B?MmpUUnF6Q3VYSGIwekIvVG82WGtBdjhIZUVaeXdjckFBaTRVcmhkL2k5ek5Z?=
 =?utf-8?B?MmxrbVRqRzkzc0lhUzh1cGgxUms1bWxMSzlRcVpuTkh2UUtrMTVRS0NLY0xq?=
 =?utf-8?B?NjBRSk4yK3VBRm1lbXpmajhlakZoeGQyQjJvMnc4QTNXckR1QytWV2prQ2gy?=
 =?utf-8?B?dE5CQjNPZWZGai8zem56ekVYaUVGcnlnaVYxRWdJYUJjVDRFS1BGTVZOYXhv?=
 =?utf-8?B?ZzhlV291UnQ4U1pjNXo3R0VZUU1ydTd3NEdpUmY4ejF1TjlwdVVHaWI1YWFO?=
 =?utf-8?B?b1pjMGFBVWQwdXVjS3drTDNnU20xNkIrblBEeFpyTjZncG90NFZYL0FxMXhS?=
 =?utf-8?B?V1AwQmw3d3lJWTZaRDRJVk1mbXY4aUV4NWZvOUt3bTFsRkp4R0ZpaVdsbklF?=
 =?utf-8?B?ODVZQXU4Mm94V3FLZkhhdDBpRGdzNTVzMXNFbk1yeFJmTktnUkF2cjV2eEZS?=
 =?utf-8?B?Yys2dUNkQitBNjZUb2d5dkpaTERHQkllcjRITWFzUXpvdm9Kb21Hb2x2Y0Mx?=
 =?utf-8?B?dGgvK2h2RmJrdzZqUkdPaE9VUUdKamZKMndOQUN2WXlNZXMwVGZCdFBzNE5U?=
 =?utf-8?B?SGF2SWpwZmNnUG51ek9KQkRRUXVGa1IyYjlwZFYrZ1E1Qm8zbU4xQTRhN3Fy?=
 =?utf-8?B?NENnTE5KUGZYR0dXSVNvMmtzN1FPNUtBdkdnNE5vaWE5a2g1ZGQxdFVpWUdp?=
 =?utf-8?B?TkJmaTJBc1pua0d5amhobFh3bzNaV3FzZ09Ic0Rockdtd0p2Zkx4SHp0ekww?=
 =?utf-8?B?eFFtQ3ZadXdjTHFkR1FIWU9OY0cvMWJZQm9pbytXem9sRWdWT0pKUk9LSlla?=
 =?utf-8?B?dlVraCswTTZUNVFhZ2R2bW8wZEN2UkRYOE11M1pmOGxaakFJWGpmUWxlUER6?=
 =?utf-8?B?K3NSbkVLbVJDanZoYzlGN2hZQXJvSGNGNUcyLzY3VENpaWtyQiswUDdBSWhD?=
 =?utf-8?B?YkgvbGh0THAwVTVvNHQybHJXdkQxZElBMysyN3h0amRmRlA0Z0l6YTNDL0xt?=
 =?utf-8?B?QjJCVHRGZW5pbmFxbFVvUE14NXA1V0NVNXFpZ2IrYnFza0RXUG96QjJqOHN5?=
 =?utf-8?B?ckVFTVR4U1BMZFlrUXZ2QThrTEk3RDVUbm82VENFZ2hxOGlySCs3L0VBZDNw?=
 =?utf-8?B?N0xqQ0NHV3ZJMXkrSHhscTVuUGlhcHJKRnBPSlYwbFZCYjBnNkFneXNGdnZL?=
 =?utf-8?B?ZzZPWWZwQ3RwMHhEb3lySEZqNTJuUzVoSS9rSmszV0Y4YXl0Z2RBcUI5V1li?=
 =?utf-8?B?Sm9tNXc1UU9yMTBWbnpNa0dhclk2aS9RUW1GeUt0UDNQUDRxUE1kbTY2Rks3?=
 =?utf-8?B?dVJNT2lCd0IxT1BqMmlEUmRFaWhGODVobGJjMnd5Z25MS3cremZHTFBOUS9V?=
 =?utf-8?B?ZlhVRG4xek5nNzNSV3pjaXJoKzV1Mkp4NEN6WnB3emxRSWxXNmlsWDhJREJH?=
 =?utf-8?B?YUV5ZWdBaXpDWUJUcERHZmxBM043UE8yaTF4NmlLNm11cm1hWGxzVVE1RlFs?=
 =?utf-8?B?OWs4WVpnM043M0g3aDVaSkY2ckNNaUwydVV2cWMzYmhZOUdiV2wzOHhRTEZt?=
 =?utf-8?Q?d4265W?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.43;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 13:26:49.7775
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4008bba-16e7-4b31-0453-08ddf524b14e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.43];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6725
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDIyMyBTYWx0ZWRfXzTNoaxMTTf64 0MEkTTFUFTuwiQ5rE+gi8rhRssmDADBXb+zyGdAqGcdrw4YEzJ0JQrE50FhB+zurWXloZooZNDG AxqvrwXI2czdPIf1ZykAECC0QKf4WVhTKlOTEXpu+2qs3obrJPm9SMP4qXxjNCnpmkjfRzKlVkk
 uRDqkSCr3NgLjOZLYFI2W2kd/OlHE2TGr7Fxjfr2xKAcbpzEQ/m2vLYdCQj1fPBKrBdY7M0hwtP AN71NjYkHop6KNihn5NN2Gxb3aYr5fB6fBXe9W8OcjMnCr91OUZbBQTHfufVGfuKUykMATu4Sg9 pFXpucOp7HdHdzYSXjs8zv2fPq5IR8354MTL9Zl+nA8go/I8DZRbMUhQwPEb/ktyYUDl19y4esc UvPBkfDr
X-Proofpoint-GUID: UzLhKG6J0Q0IjCkoOL6EFs0_grlEc8IQ
X-Authority-Analysis: v=2.4 cv=HpN2G1TS c=1 sm=1 tr=0 ts=68c9659f cx=c_pps a=xFT3qlHD+1xS+TaMy1FbcQ==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=FOPVHIcnkjUA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=8b9GpE9nAAAA:8 a=VwQbUJbxAAAA:8 a=nnNgWeZtcpC2q1cG_EoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: UzLhKG6J0Q0IjCkoOL6EFs0_grlEc8IQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011 suspectscore=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509120223

Hello Sumit,

On 9/16/25 11:14, Sumit Garg wrote:
> Hi Arnaud,
>
> First of all apologies for such a late review comment as previously I
> wasn't CCed or involved in the review of this patch-set. In case any of
> my following comments have been discussed in the past then feel free to
> point me at relevant discussions.

No worries, there are too many versions of this series to follow all the
past discussions. I sometimes have difficulty remembering all the
discussions myself :)

>
> On Wed, Jun 25, 2025 at 11:40:26AM +0200, Arnaud Pouliquen wrote:
>> The "st,stm32mp1-m4-tee" compatible is utilized in a system configuration
>> where the Cortex-M4 firmware is loaded by the Trusted Execution Environment
>> (TEE).
> Having a DT based compatible for a TEE service to me just feels like it
> is redundant here. I can see you have also used a TEE bus based device
> too but that is not being properly used. I know subsystems like
> remoteproc, SCMI and others heavily rely on DT to hardcode properties of
> system firmware which are rather better to be discovered dynamically.
>
> So I have an open question for you and the remoteproc subsystem
> maintainers being:
>
> Is it feasible to rather leverage the benefits of a fully discoverable
> TEE bus rather than relying on platform bus/ DT to hardcode firmware
> properties?

The discoverable TEE bus does not works if the remoteproc is probed
before the OP-TEE bus, in such case  no possibility to know if the TEE
TA is not yet available or not available at all.
This point is mentioned in a comment in rproc_tee_register().

Then, it is not only a firmware property in our case. Depending on the
compatible string, we manage the hardware differently. The same compatibles
are used in both OP-TEE and Linux. Based on the compatible, we can assign
memories, clocks, and resets to either the secure or non-secure context.
This approach is implemented on the STM32MP15 and STM32MP2x platforms.

More details are available in the ST WIKI:
https://wiki.st.com/stm32mpu/wiki/OP-TEE_remoteproc_framework_overview#Device_tree_configuration
https://wiki.st.com/stm32mpu/wiki/Linux_remoteproc_framework_overview#Device_tree_configuration

>
>> For instance, this compatible is used in both the Linux and OP-TEE device
>> trees:
>> - In OP-TEE, a node is defined in the device tree with the
>>    "st,stm32mp1-m4-tee" compatible to support signed remoteproc firmware.
>>    Based on DT properties, the OP-TEE remoteproc framework is initiated to
>>    expose a trusted application service to authenticate and load the remote
>>    processor firmware provided by the Linux remoteproc framework, as well
>>    as to start and stop the remote processor.
>> - In Linux, when the compatibility is set, the Cortex-M resets should not
>>    be declared in the device tree. In such a configuration, the reset is
>>    managed by the OP-TEE remoteproc driver and is no longer accessible from
>>    the Linux kernel.
>>
>> Associated with this new compatible, add the "st,proc-id" property to
>> identify the remote processor. This ID is used to define a unique ID,
>> common between Linux, U-Boot, and OP-TEE, to identify a coprocessor.
> This "st,proc-id" is just one such property which can rather be directly
> probed from the TEE/OP-TEE service rather than hardcoding it in DT here.
Do you mean a topology discovery mechanism through the TEE remoteproc
service?

For the STM32MP15, it could work since we have only one remote processor.
However, this is not the case for the STM32MP25, which embeds both a
Cortex-M33 and a Cortex-M0.

Could you please elaborate on how you see the support of multiple remote
processors without using an hardcoded identifier?

> I think the same will apply to other properties as well.
Could you details the other properties you have in mind?

Thanks,
Arnaud

>
> -Sumit
>
>> This ID will be used in requests to the OP-TEE remoteproc Trusted
>> Application to specify the remote processor.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> ---
>>   .../bindings/remoteproc/st,stm32-rproc.yaml   | 58 ++++++++++++++++---
>>   1 file changed, 50 insertions(+), 8 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
>> index 843679c557e7..58da07e536fc 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
>> @@ -16,7 +16,12 @@ maintainers:
>>   
>>   properties:
>>     compatible:
>> -    const: st,stm32mp1-m4
>> +    enum:
>> +      - st,stm32mp1-m4
>> +      - st,stm32mp1-m4-tee
>> +    description:
>> +      Use "st,stm32mp1-m4" for the Cortex-M4 coprocessor management by non-secure context
>> +      Use "st,stm32mp1-m4-tee" for the Cortex-M4 coprocessor management by secure context
>>   
>>     reg:
>>       description:
>> @@ -43,6 +48,10 @@ properties:
>>             - description: The offset of the hold boot setting register
>>             - description: The field mask of the hold boot
>>   
>> +  st,proc-id:
>> +    description: remote processor identifier
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +
>>     st,syscfg-tz:
>>       deprecated: true
>>       description:
>> @@ -146,21 +155,43 @@ properties:
>>   required:
>>     - compatible
>>     - reg
>> -  - resets
>>   
>>   allOf:
>>     - if:
>>         properties:
>> -        reset-names:
>> -          not:
>> -            contains:
>> -              const: hold_boot
>> +        compatible:
>> +          contains:
>> +            const: st,stm32mp1-m4
>>       then:
>> +      if:
>> +        properties:
>> +          reset-names:
>> +            not:
>> +              contains:
>> +                const: hold_boot
>> +      then:
>> +        required:
>> +          - st,syscfg-holdboot
>> +      else:
>> +        properties:
>> +          st,syscfg-holdboot: false
>> +        required:
>> +          - reset-names
>>         required:
>> -        - st,syscfg-holdboot
>> -    else:
>> +        - resets
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: st,stm32mp1-m4-tee
>> +    then:
>>         properties:
>>           st,syscfg-holdboot: false
>> +        reset-names: false
>> +        resets: false
>> +      required:
>> +        - st,proc-id
>>   
>>   additionalProperties: false
>>   
>> @@ -192,5 +223,16 @@ examples:
>>         st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
>>         st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
>>       };
>> +  - |
>> +    #include <dt-bindings/reset/stm32mp1-resets.h>
>> +    m4@10000000 {
>> +      compatible = "st,stm32mp1-m4-tee";
>> +      reg = <0x10000000 0x40000>,
>> +            <0x30000000 0x40000>,
>> +            <0x38000000 0x10000>;
>> +      st,proc-id = <0>;
>> +      st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
>> +      st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
>> +    };
>>   
>>   ...
>> -- 
>> 2.25.1
>>
>>

