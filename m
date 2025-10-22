Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8EA2FE05E;
	Wed, 22 Oct 2025 07:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761119926; cv=fail; b=QkxlbCNLd+rTB3SwsFDsNWusi52w/zIbBaatkpKthaUyPbb6x//UHlfFTFIE3xiZQgprmLcPf6lm0tGYDgV3wQ28JmyrUyW8gX6oscLtScIbWP2yXYvqbGu1A9rEj7fONAIjJrmDHOBQ7+sNejnnKN5vSELCCQGZe5OygV2Q6R0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761119926; c=relaxed/simple;
	bh=SPKiHmNRy/9KtdGx22X9ZdopzEAig43KsRhsgYQUvzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lv/EUIHHP1ylXFnTbtiELiW0sZDSYX5Pmf+LLbAfVlOItEJR5YKkHC6+mzjlI530vwrl2PljB54NEZkSzm55g50EWIadog/i/KhslLPVfB8ZIVVp5GE8FgNYaUy1zh5tr0kO31+hMJBPaZwxxiQR9HLVHPmfuZBJiQQAoqncgQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Mzg6JbiJ; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Mzg6JbiJ"
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M7iESI022220;
	Wed, 22 Oct 2025 09:58:25 +0200
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11011034.outbound.protection.outlook.com [52.101.65.34])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49vnumeg12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Oct 2025 09:58:24 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LStjffznGk/h7wFj7FxjQkFV8KvvU6SvGB9TbHQHk4T/A5rORvD4e831Sf+y4WYxNHsS5V1ty/vbLh6L58zPWN9TUhd3j9H51LOpBTEXz3WEGM7M3nt/4QxRxa0C8NafuZvdtElK3a4FwG+opedfKErJdkwtjIzsdmCHGwpS9tw3P7yhsHSXWo8D1DMXUM4HWvxJzbA3pC2MzcKbgAxGBJAgw4grLOo+R0/srbme4XD/oeF1f/eMOombO0XvSae2WNxZwWX1YQbT+eAYLurkOEDA3sB/HnxRGsvU7O/xfpEzeTX5t8/aK6pzbfFqDfMIDVy3qgn7lAnGbseyEmt8eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KYDWLcxcyhFBW+EkuV169Uc33mwlOCDm9y2kPU+XFI0=;
 b=vl6TyvUYBADHNrcyaSFRF27AFPtUsirU+Z89G3RCg7m9nqve5c4bWhWwbwbxAhyWV3fBrqqqCET9xhxVydsn1W3A/LrmXxCSbbfuTYUz47RsQHg3+JV+Q+sFYigj/3k2ZmqLX8+FwpmYNxa8B/Az6Afa6lUmvluhN8Qrdxah3UOJdKDwRc/ik35y3azgd3lAaybBLUxxXcTlsn1Qlf4uieG7aGnmpZeJzvIMunz5yRtrt92+iy7IaNWUF9Z+EEpYF7yIhdfH1fJiHV93cNda0w5NXDBUxOWu/O6z3BrzQtnrC0WoEixaDyAdcq5AGzAMIKHkG7WwLtc+AMbv/UNUNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYDWLcxcyhFBW+EkuV169Uc33mwlOCDm9y2kPU+XFI0=;
 b=Mzg6JbiJPI2CfcZSpyvdXM6ReoBbbUMisupk7HVOTnExExhDl0yx2pw8rvMbEwPIP+7jb/gk83OLwrQdNztQJ0HXKPnbNzB4u2oL7hnNFOipldAhv+tpYrQ9LZjXAqF9Gy174lCLUNU0IGwcd0XX7jKrdH6/CmgrovfwSKHJBMLUqn9vP2NcyZQqNXYvWjpL0+r0FP4gwL8/2AfFqlrOHf8LLZCeOltEpZx2ga0jrZY4C5sXFbCZnHSgJpcX+s1Kxv0WyWc6uS3RpR5buDQI+B3/a5ZNFeJ0m+OJcUaBbrBGOCZYrxQ2uKM5ZQ8/s3ukmSGJhoc6TdT1r7OOFo7F1w==
Received: from AS4PR09CA0013.eurprd09.prod.outlook.com (2603:10a6:20b:5e0::19)
 by DU2PR10MB7786.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:46e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 07:58:22 +0000
Received: from AMS0EPF0000019E.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e0:cafe::13) by AS4PR09CA0013.outlook.office365.com
 (2603:10a6:20b:5e0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.12 via Frontend Transport; Wed,
 22 Oct 2025 07:58:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AMS0EPF0000019E.mail.protection.outlook.com (10.167.16.250) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Wed, 22 Oct 2025 07:58:21 +0000
Received: from EQNCAS1NODE4.st.com (10.75.129.82) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 22 Oct
 2025 09:55:56 +0200
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNCAS1NODE4.st.com
 (10.75.129.82) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 22 Oct
 2025 09:58:20 +0200
Received: from [10.48.87.127] (10.48.87.127) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 22 Oct
 2025 09:58:20 +0200
Message-ID: <d28d2c51-1b73-4d72-822a-3778a81a7434@foss.st.com>
Date: Wed, 22 Oct 2025 09:58:20 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v3 1/4] dt-bindings: remoteproc: imx_rproc: Add
 "rpmsg" subnode support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer
	<s.hauer@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Bartosz
 Golaszewski" <brgl@bgdev.pl>,
        Shenwei Wang <shenwei.wang@nxp.com>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam
	<festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-imx@nxp.com>
References: <20251009222716.394806-1-shenwei.wang@nxp.com>
 <20251009222716.394806-2-shenwei.wang@nxp.com>
 <176095488745.45867.896865155474758901.b4-ty@linaro.org>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <176095488745.45867.896865155474758901.b4-ty@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019E:EE_|DU2PR10MB7786:EE_
X-MS-Office365-Filtering-Correlation-Id: 26b4a1dd-1e93-40fd-0485-08de1140c532
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SFNPSnJkZWtLQ2pJdnJVRDVHcHhLRDlIdnFUNTcraW5qaUdHR0xsOGdsbk9y?=
 =?utf-8?B?cGJXUXBmaEp3Vms1WG50bnlvQjVPMlFFTmJWUG9HZjloRjdQWTV3dG9nUEJR?=
 =?utf-8?B?VkNHVTVyK1k4QkxGdmVST2RQRDExbkJuSnNFQWpiNWdnR1FCazE5S0l5WGNH?=
 =?utf-8?B?Nm16alhBOGpaK1RVZmpXNzZzWnQwenFMMW9KSlRJdjcwWlMrQ2FoWGJSNVlO?=
 =?utf-8?B?bmN3cXQ3c1JyMTRQOFM3V3NUaDUxTjB5alJadWhVeSthQStCZkJ4VkRMdEw3?=
 =?utf-8?B?UVQzSDZHQVJGdWhybEdMVjhzMmZUUzFkL1BWd0NjQUl4NjFJTUZ1OTN4VEZC?=
 =?utf-8?B?ZU96UHozWjFhQTBuaW4xdVpXMHVZMTlYTHFCNmRQdjUxWmk1WXhkcmVYeXlv?=
 =?utf-8?B?NVNYSjBaSlQ4ZXZYUGFNcGJXYlREQVRsWlY0cmlKdFdUakxuc2FqNUJsbGox?=
 =?utf-8?B?T3UyWjVDL291dTJ1NUdzZ1R1TmVVZjVjb0Y5VEIwTVlmam53NXMyWng5VVMy?=
 =?utf-8?B?NngzOURDakNuUWhzd0hwWnh5OE5iZXArZG9uc0JUcEpJTks2cWRBVHgzdVY3?=
 =?utf-8?B?Yi9YQXRQZWN0QVhoeVovcVlRdExBVG5uZDByWjdWQVJWWitnY29yVzlmMUpn?=
 =?utf-8?B?azBMRHNmSEZEd3ZDR1FVV01FalhPWFV6ZVNaTm9CKzlDME5SbndrbGtGY2tS?=
 =?utf-8?B?LzdTVUtLalY3OTZrOTkrbzFVWENIZktHZCtnZTBiUi9KdUVNd0lqRlRScE1B?=
 =?utf-8?B?eit6RHBzTHJSQy9HT04yVnZBU0N6TXRuZTJLRkdHdzRYVURVODhRYmxSR3dk?=
 =?utf-8?B?bmdYMkVxMDk4UVR6a3FYVElPUmphaDNHRjZ1d0d0V2VnSHQxRnRUUUxhYTN6?=
 =?utf-8?B?SE5XSWRUK0ZiM0FlVTRqaUlZcDFjMUZnQjJ0VzRQckg4c0c4bHViYmVPTTVI?=
 =?utf-8?B?ZTFWVUtqbXpNREVDRStQSUFHOW5PamdiVDlhT1lOamhQQmxZSC9GenJMRC9l?=
 =?utf-8?B?dzl2Z1Y2TXBMZTZvWTVxdHlQWUVCQTloR1MxSXJCTUVNSGR4RTdNcTFjT0ZY?=
 =?utf-8?B?ZEY1Yk1pYTVzMVNhUUdDMXd5ZmxLQmlVc1R6UHI5NVlrWkVTODMzSFBHUy84?=
 =?utf-8?B?U2xhMHR5WFc1N0RKejFmNlN5YUpNekNPMTFkV1hzRU1KVzRyMzhTL3R2Z2x2?=
 =?utf-8?B?VkNrUlhVMHNaNzNXbXkvSjJpczUyUWY5RkFlVmNxZmJ3RGJaWDNlVWt6a1Ev?=
 =?utf-8?B?eUpOTXBZRlp5L3FDTEhqMWJjNkhtcmU5dzFOK1Awd0IwR2RFU0dmL1ZaKzFO?=
 =?utf-8?B?Q0JSMGl6NVhWTm1iNCtJVUFkbUM1K2ZDbW1WdW0vT1NHdzFWbEJCQ1pWaktB?=
 =?utf-8?B?RG9rTUNvL3FlbnZUK2syN2k0MHErdmY3UUdTeFl4T1phUDQ3K2NIQW1UcmJC?=
 =?utf-8?B?UlB2MjJNbytvSHRaN2E4OVNrZ2pwdTgvWkw3Nm5zaDI4RnF6OStFWXpKM1hr?=
 =?utf-8?B?WHVWdjlXL2RISHREWjBJSjR2WVBqNHgwSi96ZlY4em0vQWs4YXh2cU1vV1Qy?=
 =?utf-8?B?TzEyTTBSYTYzdCtrWWUyV2Y0WXk3SHN3WWNXYmpzT3c4RXhRdHVYVXNGRS9L?=
 =?utf-8?B?d1NtRVhIRytrN2tEU1FtNUZELzJTNVVXMng3U0NRMllvT1pESlU3Q3NyN01j?=
 =?utf-8?B?ekJrbGkwVXFSaU05cUhweHN5RStKeTBqZDFFWi95OUtFVXJBa094L1pXY3Za?=
 =?utf-8?B?Uk9hMWkvSkVvd3FPOXRuT1JTY3VJK0YrSGxYSG5DN0pWUk1Ha3dvRWw2aXk4?=
 =?utf-8?B?ZjNVa0srY3hNQlV3Yk5USG1KVFoxNkhxTzJqa01ObXl3Q3JHYy9MVCsyT1Vl?=
 =?utf-8?B?OFFLanYyZmZzMERXVlM4OEN6anNwWXBzeE1ocFNIbG0vTFh5RWJQTEt0dStB?=
 =?utf-8?B?ZFFFLzFJYzRGZDVVNFkwUzB5RExXd2twbnFkaDNrZUxnbWUvUEp1dVRPWHoz?=
 =?utf-8?B?Nk1IbVBKTWVIM3hlMTh5WDFtWkVEWVkvL044M016MlpCbHVNUlBEU3M2eDFY?=
 =?utf-8?B?cnkxek9WUGtLUm1aamxEVVhyTnJGN2lYdGllSVcrOXFsWjVMMlBOazVKZ09M?=
 =?utf-8?Q?zUQh2yt/EoGBV2zXOWW0DJvzB?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.43;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 07:58:21.5939
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b4a1dd-1e93-40fd-0485-08de1140c532
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.43];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR10MB7786
X-Authority-Analysis: v=2.4 cv=Wt4m8Nfv c=1 sm=1 tr=0 ts=68f88ea1 cx=c_pps
 a=LJBxCQyVg3xmomCYv/4OGw==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FOPVHIcnkjUA:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=D19gQVrFAAAA:8 a=9Tk4aT_6JJQB9VmfOvwA:9
 a=QEXdDO2ut3YA:10 a=W4TVW4IDbPiebHqcZpNg:22 a=nl4s5V0KI7Kw-pW0DWrs:22
 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-GUID: T80p8zZy4-HD39F1QgdKUAOr5_8xU-vl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDAwNCBTYWx0ZWRfX/IcAzRo33mzy
 ewcZw054S40u/s0cWMj3vDHXDgh5uNEw8wSlLXhzeU5ibL6yd1oFZdaidZDralBIz9I1+OjGtOc
 POf2PTeKAxuSdgrMkit2iOUjkK4mSIWkMYpvleYzTJ3jl/WHgVE9/TaB1RzFV97QVFHdx//KCZe
 GMJZ/f2IIcKuGWS7jgvWXmALYujghF/AcaNuufvAjdMQAOwcooHK5xjCyven0mi0aXtHnd8nXLT
 hbAvbBRTnkeXqZQy/2FGZ6JN8TxXCTFFldo3elj3hDPEB7fUimLjj3CryGnvOhik5enJFGKxVzF
 e9GnYq7yB2XVpJgdWNziSWzIG7p5l7XVNEPDakgYYpHLeVDxp4joNPCYz9RvWGxl3PFcrYHu2NH
 is8SM/kIHdzVbItYDhim9QCt5+pJ+A==
X-Proofpoint-ORIG-GUID: T80p8zZy4-HD39F1QgdKUAOr5_8xU-vl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 impostorscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190004

Hello Krzysztof,

On 10/20/25 12:08, Krzysztof Kozlowski wrote:
> 
> On Thu, 09 Oct 2025 17:27:13 -0500, Shenwei Wang wrote:
>> Remote processors may announce multiple devices (e.g., I2C, GPIO) over
>> an RPMSG channel. These devices may require corresponding device tree
>> nodes, especially when acting as providers, to supply phandles for their
>> consumers.
>>
>> Define an RPMSG node to work as a container for a group of RPMSG channels
>> under the imx_rproc node.
>>
>> [...]
> 
> Applied, thanks!

For your information, there are requirements to make the rpmsg-gpio 
driver generic [1]. This could impact these bindings.

Best Regards,
Arnaud

[1] https://lkml.org/lkml/2025/10/13/790

> 
> [1/4] dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
>        (no commit info)
> 
> Best regards,

