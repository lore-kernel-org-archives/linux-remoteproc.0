Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4201946AA;
	Mon, 13 Oct 2025 10:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760351009; cv=fail; b=LLdk4uQpLPB4EF/+m4otNiV2two4+cOBovaNJEnMkh08Q6VwQ5Q/zSFvO9K/0uyuL3Kt4S1nNffPkzGRAqGt/A47iAOkYRecoUYokdxNyHxz8kqZeelaqtzNI85ZLgnJRZ5ar9NnsPbywBzR269vaRjTxSysr3SyWSJVoLHsQzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760351009; c=relaxed/simple;
	bh=8IsvLUkKnIXODZs4fSqOt+bldgz/fxwSwv3Np+XtjVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EDlw1COdmeXwxVv++BDUTdNZZvfdpQU6LabjJJ3GgQC+prhpKIaKwMQAurPPynRzEgMJre6k/YlMIEvkf12K8R/uM2DtQVfNkjp1wrZihnXd0ad3mLm2fe9/CEqdcT2pDLCcMezOnqIQMaUmKWO1TUlAkzongejiZhsENEn0FpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=GbF/rzSV; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="GbF/rzSV"
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D5nxhk016003;
	Mon, 13 Oct 2025 11:46:34 +0200
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11013067.outbound.protection.outlook.com [52.101.83.67])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49r26hv32k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 11:46:34 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbG7dgU6yZgcJXS3FxyKWp+vjBAUEgTvdXS+kv5sMUm6IoYcn5y12ws5Zl7Q8BYIXy12qkjgpsqPb82Gml/a3jbQHLHOd8TM73g5GoZAI2TVfN5C5u/VWtdl5u0wFzZiMiDtcuAvgzB8wKzTRy3y/ybAncYX6QFfSSYNrKcsAs5FUijpfFqoqDCE+QncvQYJGsI3cI4ybLSWFwgBjnjKK3WF28CT8sgKTcga16pUans1nXu/BICHWh7uCWdzAz6hq5QNsmv1EvfQhldMBFJUUzMm9Cfx9HN8FBOwuhsZRL0JtedR8pmpMbkbjZP4DvgOTZ3CuLudVH1kQT5jvvrvzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4b37kVQATipVe3hclkUbSe9sHaN0EqerZE1VXPijvoM=;
 b=ADsGjst3gS9mFemRWgVC/PGDs6EIesxYQhfFXEFzjyR4zmKeiPXQTylXm2ISVaylNEoA5eyhmy3H/JersaxVGAp5rESlrCgZEhsdhv+idhJadgIqTk+s2E3EdRCsI0g7XqeRVhxwm1NwcOfqbtNz2oE917qiZhKtHhPmrGYQzcO9JEcG8rr1pwgGOeD9rlUsNjHFhSEzG3WkDrjfwxDvWlKds35J3WRalTqvTVuLfcKzUdyBVM/ke14KrNTXVp1pfuBa/liMws03ENX4POtgbKmzsZNTerIT5g9mmy6e4brTUUHeoZG8d0kgi/s++rtjopPO6xWIFyZID6VhPnwxhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4b37kVQATipVe3hclkUbSe9sHaN0EqerZE1VXPijvoM=;
 b=GbF/rzSVOD4XpUUW0Tjyy5KsXcsKPwV8xsxz1Cz465ek7yfrB32kTb9YDwh2HzZ88r4HL4Nxs0azzKyUl5+T6YqZE33IXDfMfDPty2AOMJY7Ho+V9+jNM4puPh9Gpc7tpYwv0Ed2hXh1PERjxM6zPaX9d71QuXUrLIyXehiQb5AdBHYm5STOyUoKQ/bOBBK88cCC01JLomkCOwdAPHuMTd83AplTRTkntSgIA8pDLkHLKRAOWtPknV5e7Og9QkXacFywRVxARYrAcEyEcbBiOOs+bwGWowIyml0r/mfXyKJwgpYE9bOqkuNSqIKTcZe31IXAnzok/tM4X0lcE4uODA==
Received: from DU2PR04CA0335.eurprd04.prod.outlook.com (2603:10a6:10:2b4::11)
 by GVXPR10MB5984.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:16::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 09:46:28 +0000
Received: from DU2PEPF00028D06.eurprd03.prod.outlook.com
 (2603:10a6:10:2b4:cafe::b7) by DU2PR04CA0335.outlook.office365.com
 (2603:10a6:10:2b4::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 09:46:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DU2PEPF00028D06.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 09:46:28 +0000
Received: from SHFDAG1NODE3.st.com (10.75.129.71) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 13 Oct
 2025 11:39:22 +0200
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 13 Oct
 2025 11:46:27 +0200
Received: from [10.48.87.127] (10.48.87.127) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 13 Oct
 2025 11:46:26 +0200
Message-ID: <19f7d931-9334-4764-aab8-b896c96e4402@foss.st.com>
Date: Mon, 13 Oct 2025 11:46:27 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-stm32] [PATCH v19 4/6] dt-bindings: remoteproc: Add
 compatibility for TEE support
To: Sumit Garg <sumit.garg@kernel.org>
CC: <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        "Mathieu
 Poirier" <mathieu.poirier@linaro.org>,
        <op-tee@lists.trustedfirmware.org>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250625094028.758016-5-arnaud.pouliquen@foss.st.com>
 <aMkqifHSdlCs4VjA@sumit-X1>
 <62bdb238-7440-451b-84ef-79f846b10ba0@foss.st.com>
 <aMqIhFdIqp5auH22@sumit-X1>
 <8d385f2e-6470-4d66-be0b-a2a448a81fa4@foss.st.com>
 <aMz8XuHzIomNhmra@sumit-X1>
 <0e5a44df-f60a-4523-a791-6318b3c81425@foss.st.com>
 <f5b0e106-a731-461b-b401-1aa1f9892465@foss.st.com>
 <aOidN1N3GIOcsXd1@sumit-X1>
 <929ce1f6-818f-4bb9-abf9-24d511bd2bf3@foss.st.com>
 <aOrfDH1HnPSILtFE@sumit-X1>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <aOrfDH1HnPSILtFE@sumit-X1>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D06:EE_|GVXPR10MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: 307fe82a-25a2-44ae-1c27-08de0a3d61c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R1NTUnd6YmRnd3N4cEVnekRhZzBNYXk4dDRmelZQYndXNW9SdE9xYWJDZkFQ?=
 =?utf-8?B?RGR4a2traGFndnpETTBlYXlocTlkV0pCZW9pQmR3RVpVWjN6cTVONVdIc2N1?=
 =?utf-8?B?N3dxbi9IYk8wV3lyYmZjeU5YQTJBMjlQZkNpazRHRll6Q1pJdHI1U0I2MlMz?=
 =?utf-8?B?bWxnTHdCUDlXdHlwSHZselkvejByQUVRYXZWNzR1Ry9tMzlBT2F0N3Z4VHlK?=
 =?utf-8?B?SmszcjE1V0s4K2Z1d0FiV2g4V0xYckVvYWh0ditHU1JnMTNvYlpyWXRtOVpN?=
 =?utf-8?B?eGNqbEVvU2ZaZUdIRW1rRFIvbDhhWWE2Y1N5Tlpmb001WFo4aU9DVWhMS0hr?=
 =?utf-8?B?S1Bvcm40RFFLNEdLZm5iVENqamYrR0pjQnlzSWhFOXZQaFpMblV6dTR0UDZD?=
 =?utf-8?B?YU5ERDgvYUh3TWlFUGk1SmlRSW01OUNhQWc5eUFNbkpXMGZhNVA0MFZOQWpM?=
 =?utf-8?B?Z2RtUTJDN3Q1U0tzelpUdG51VElSZ1ZLeUs2eVMyak9qaitkcU5rVTVHMEkw?=
 =?utf-8?B?RytvZ05JMHBIYTdjdlFYQWlrUkFaV29BL0lQVVRJaWRESlE0SUUvT1p6Q3pE?=
 =?utf-8?B?VE1hdFhKV2F3U29TZWJyUGxWYWZHTzFFZzA1U0pETjlxd29UbGVoTzIzZFVx?=
 =?utf-8?B?aGcxUXl5cVJCZ0F5S0ZTck8xRXREUSt2UlFuUkhHcVdSQnlBekZEd0ovem9m?=
 =?utf-8?B?WGxZa2tlUmQvN0VGVFpFcnlaR1k2T29mc3YvU0pERitlNUZJTmRmZnlEWkF1?=
 =?utf-8?B?NXJkWm1nMXJKeCtZdnpjeWpURkpOdWdHYWc1ZGdpV2lIVUlacVZ6bFRwMG5L?=
 =?utf-8?B?cVFGOERXRWRQQ2NKY1MwaFl0SWwwQWFXUlZqMlFpTjMrdnQ4a0ZDeXF1dkU0?=
 =?utf-8?B?elp1b3JQRmZZWktTYnFGaXozZUU3MkV5SWtsd3R4WWdUYVo4dnZDRDVtS2h6?=
 =?utf-8?B?WHRuTGl6YkdZVkFZckVabzJzTS9zYU1MempibTNKNWJoN0FNelFSOFRENFZw?=
 =?utf-8?B?OEpMLzQ0VEs5M1BKdmlrL292VTJkOTR0MW8wTG5ScGhVUzFMVTNMVGFWK3BS?=
 =?utf-8?B?cDBNbVZyZVFvNEFJTFlPOG1QTFFtVzRWUGxSeGNFaGs1Q3BPUnhXMDdEMGhJ?=
 =?utf-8?B?eFVvUzJ2bDJZWkhkUzFJamRWVTJ1djN5Y3phK0VSS2ZVQlR6ODBVRkRwRVdi?=
 =?utf-8?B?K3J4SUtTMVRkM0ZCMEhzNmhqNHAyckozWjFlOFdOZzRNZFg1S1V3Ukhiemdj?=
 =?utf-8?B?aXdZQi9KNWZQelg2MHdKT1NRbGlLblRlRzhsZjdETE9GM1JZcGNONkd1SXl1?=
 =?utf-8?B?TURJNy9uZVowNS9GdnF3em5sdmZiMW9GeTE3TFVrWTVXS0pTMzE4NmIvcDQy?=
 =?utf-8?B?MVFNdjE3QjBjWk1SeXF3N3RBeEowUUdKelY2NHBMYzc0cnUxL3VVam9TVk1R?=
 =?utf-8?B?NGY3T2pIcW9Ld3Yza1ViS1drbU16bW54SFhES0lpUEpEYU8xSjE3VVpQQ2tW?=
 =?utf-8?B?MC9GcFhZRXVHZjlCTnIxTEpETTV6VVBrYzA2NzFYZnE1VkVodW1PMWIxZXlm?=
 =?utf-8?B?Q2lVQ1NmZWJSU21lVzBFWjlnRFV3M0ticm9lNVZ6RHgrSWdvRm5XcXF3UENE?=
 =?utf-8?B?TDQ5eTlFVzR2M1ZBV0V5OXh3bVh5QXQraU4yMXB1RjVHZGpLT3o3K1VuYUhm?=
 =?utf-8?B?NFNRNG12L0FyQ0ZPUW9oSzk1dEtnc3dqRS9mVW9nY1NTSXhsNkpYM0VTbjc3?=
 =?utf-8?B?UitudlJaZlNicHI2M0ppTTFrYTBsd0JhaWoxUDFNaWRrMVhUYWNkNld1ZTd6?=
 =?utf-8?B?R2c0NG5ocWE4b0RxYitlTTNubDFrcXhsSHVPSEFYNWZSb3dXekJyQUR0S0Mr?=
 =?utf-8?B?SExhYloxc2JjKzgwWmxBY2doR3pLUXJsMUZJZjE5OFFpVFY0QXF2aUxubVRq?=
 =?utf-8?B?NlI5WkFwRHZqK2VvdVBZaUR1NVdobHVkMmRPaEFLS243ZWVkTDR6eEJ6Z3hT?=
 =?utf-8?B?Qi96ZitKQ29oQjJKKzFhMHJwZ25LeUNsOWZkVjlPcnFsbXRZcWFiUE9KaE1x?=
 =?utf-8?Q?TpTJr0?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.44;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 09:46:28.1313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 307fe82a-25a2-44ae-1c27-08de0a3d61c4
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.44];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D06.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB5984
X-Proofpoint-ORIG-GUID: Md5hJpxpggt-UottvefQPc_-xy4mPYMs
X-Proofpoint-GUID: Md5hJpxpggt-UottvefQPc_-xy4mPYMs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEyMDAwMiBTYWx0ZWRfXz/lTJIid+bRx
 r1t9tK3MGqC1cdyV+VOPvjae7g1UeE2Ja2E9pHeYnG5lOo3iP1zWDQxZdyyfgqyMRWqVbDAdtIr
 r2uWHQbKlJkRQ6JaNNJ1YmQXiNjdop/kcNhbpoWYI+2YsS6fbmK+06G8m+s61HWmYw5j+egAvqv
 U2oBGBP1J2yqPNyjHTCxzXggIrLTMauoZYQHs7MC7y/VRvO519oVYSzAp5vuYgR7NRaQo0jA26Z
 OmjUXjx6l16kgP2VKZbFCbKvkdQ2fOMq2o5lEAwj3BqS/nCj7hxjy33Xv4NCEvY+PooHYJB1Pcd
 zf15kxOA0X8kVelPNgQK4i+7SpFzP2BW+qQ1uZwO2EM2GqCdnp+pb5jLfIItIKvVTAvmum2E8OX
 bRtwqXdXFQXknzmshuH7hLqF2TQqAQ==
X-Authority-Analysis: v=2.4 cv=X5Vf6WTe c=1 sm=1 tr=0 ts=68ecca7a cx=c_pps
 a=enNDcQTCg2EgXhRigf7JEA==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FOPVHIcnkjUA:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=P-IC7800AAAA:8
 a=NEAV23lmAAAA:8 a=53NKPV70PwC0GSqg62sA:9 a=hPmjQc4IUQ38NvP5:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510120002



On 10/12/25 00:49, Sumit Garg wrote:
> On Fri, Oct 10, 2025 at 12:04:40PM +0200, Arnaud POULIQUEN wrote:
>> Hi Sumit,
>>
>> On 10/10/25 07:44, Sumit Garg wrote:
>>> Hi Arnaud,
>>>
>>> It's been some holidays followed by business travel leading to delay in
>>> my response here.
>>>
>>> On Tue, Oct 07, 2025 at 03:50:32PM +0200, Arnaud POULIQUEN wrote:
>>>> Hello Bjorn, Mathieu, Sumit,
>>>>
>>>> On 9/22/25 10:57, Arnaud POULIQUEN wrote:
>>>>>
>>>>>
>>>>> On 9/19/25 08:46, Sumit Garg wrote:
>>>>>> On Wed, Sep 17, 2025 at 03:47:40PM +0200, Arnaud POULIQUEN wrote:
>>>>>>>
>>>>>>> On 9/17/25 12:08, Sumit Garg wrote:
>>>>>>>> On Tue, Sep 16, 2025 at 03:26:47PM +0200, Arnaud POULIQUEN wrote:
>>>>>>>>> Hello Sumit,
>>>>>>>>>
>>>>>>>>> On 9/16/25 11:14, Sumit Garg wrote:
>>>>>>>>>> Hi Arnaud,
>>>>>>>>>>
>>>>>>>>>> First of all apologies for such a late review comment as previously I
>>>>>>>>>> wasn't CCed or involved in the review of this
>>>>>>>>>> patch-set. In case any of
>>>>>>>>>> my following comments have been discussed in the
>>>>>>>>>> past then feel free to
>>>>>>>>>> point me at relevant discussions.
>>>>>>>>> No worries, there are too many versions of this series
>>>>>>>>> to follow all the
>>>>>>>>> past discussions. I sometimes have difficulty remembering all the
>>>>>>>>> discussions myself :)
>>>>>>>>>
>>>>>>>>>> On Wed, Jun 25, 2025 at 11:40:26AM +0200, Arnaud Pouliquen wrote:
>>>>>>>>>>> The "st,stm32mp1-m4-tee" compatible is utilized
>>>>>>>>>>> in a system configuration
>>>>>>>>>>> where the Cortex-M4 firmware is loaded by the
>>>>>>>>>>> Trusted Execution Environment
>>>>>>>>>>> (TEE).
>>>>>>>>>> Having a DT based compatible for a TEE service to me
>>>>>>>>>> just feels like it
>>>>>>>>>> is redundant here. I can see you have also used a
>>>>>>>>>> TEE bus based device
>>>>>>>>>> too but that is not being properly used. I know subsystems like
>>>>>>>>>> remoteproc, SCMI and others heavily rely on DT to
>>>>>>>>>> hardcode properties of
>>>>>>>>>> system firmware which are rather better to be discovered dynamically.
>>>>>>>>>>
>>>>>>>>>> So I have an open question for you and the remoteproc subsystem
>>>>>>>>>> maintainers being:
>>>>>>>>>>
>>>>>>>>>> Is it feasible to rather leverage the benefits of a
>>>>>>>>>> fully discoverable
>>>>>>>>>> TEE bus rather than relying on platform bus/ DT to hardcode firmware
>>>>>>>>>> properties?
>>>>>>>>> The discoverable TEE bus does not works if the remoteproc is probed
>>>>>>>>> before the OP-TEE bus, in such case  no possibility to know if the TEE
>>>>>>>>> TA is not yet available or not available at all.
>>>>>>>>> This point is mentioned in a comment in rproc_tee_register().
>>>>>>> For the discussion, it’s probably better if I provide more
>>>>>>> details on the
>>>>>>> current OP-TEE implementation and the stm32mp processors.
>>>>>>>
>>>>>>> 1) STM32MP topology:
>>>>>>>      - STM32MP1: only a Cortex-M4 remote processor
>>>>>>>      -  STM32MP2x: a Cortex-M33 and a Cortex-M0 remote processors
>>>>>>>      At this stage, only the STM32MP15 is upstreamed; the
>>>>>>> STM32MP25 is waiting
>>>>>>>      for this series to be merged.
>>>>>>>
>>>>>>> 2) OP-TEE architecture:
>>>>>>> - A platform-agnostic Trusted Application (TA) handles the bus
>>>>>>> service.[1]
>>>>>>>      This TA supports managing multiple remote processors. It can
>>>>>>> be embedded
>>>>>>>      regardless of the number of remote processors managed in OP-TEE.
>>>>>>>      The decision to embed this service is made at build time based on the
>>>>>>>      presence of the remoteproc driver, so it is not device tree
>>>>>>> dependent.
>>>>>>>      - STM32MP15: TA activated only if the remoteproc OP-TEE
>>>>>>> driver is probed
>>>>>>>      - STM32MP2x: TA always activated as the OP-TEE remoteproc
>>>>>>> driver is always
>>>>>>> probed
>>>>>>>
>>>>>>> - A pseudo Trusted Application implements the platform porting[2],
>>>>>>>      relying on registered remoteproc platform drivers.
>>>>>>>
>>>>>>> - Platform driver(s) manage the remote processors.[3][4]
>>>>>>>      - If remoteproc is managed by OP-TEE: manages the remoteproc
>>>>>>> lifecycle
>>>>>>>      - If remoteproc is managed by Linux: provides access rights
>>>>>>> to Linux to
>>>>>>> manage
>>>>>>>        the remoteproc
>>>>>>>
>>>>>>>      - STM32MP15: driver probed only if the remoteproc is managed
>>>>>>> in OP-TEE
>>>>>>>      - STM32MP2x: driver probed in both cases for the Cortex-M33
>>>>>>>        For the STM32MP25, the TA is always present and queries the
>>>>>>> driver to
>>>>>>> check
>>>>>>>        if it supports secure loading.
>>>>>>>
>>>>>>>
>>>>>>> [1] https://elixir.bootlin.com/op-tee/4.7.0/source/ta/remoteproc
>>>>>>> [2]
>>>>>>> https://elixir.bootlin.com/op-tee/4.7.0/source/core/pta/stm32mp/
>>>>>>> remoteproc_pta.c
>>>>>>> [3]https://elixir.bootlin.com/op-tee/4.7.0/source/core/drivers/
>>>>>>> remoteproc/stm32_remoteproc.c
>>>>>>> [4]https://github.com/STMicroelectronics/optee_os/blob/4.0.0-stm32mp/
>>>>>>> core/drivers/remoteproc/stm32_remoteproc.c
>>>>>> Thanks for the background here.
>>>>>>
>>>>>>>> The reason here is that you are mixing platform and TEE bus
>>>>>>>> for remoteproc
>>>>>>>> driver. For probe, you rely on platform bus and then try to migrate to
>>>>>>>> TEE bus via rproc_tee_register() is the problem here.
>>>>>>>> Instead you should
>>>>>>>> rather probe remoteproc device on TEE bus from the beginning.
>>>>>>> The approach is interesting, but how can we rely on Device Tree (DT) for
>>>>>>> hardware configuration in this case?
>>>>>>> At a minimum, I need to define memory regions and mailboxes.
>>>>>> The hardware configuration in DT should be consumed by OP-TEE and the
>>>>>> kernel probes remoteproc properties from OP-TEE since it's an OP-TEE
>>>>>> mediated remoteproc service you are adding here.
>>>>>>>    From my perspective, I would still need a driver probed by DT
>>>>>>> that registers
>>>>>>> a driver on the TEE bus. Therefore, I still need a mechanism to decide
>>>>>>> whether the remote firmware is managed by the secure or
>>>>>>> non-secure context.
>>>>>> As I mentioned below, this should be achievable using the secure-status
>>>>>> property without introducing the new compatible:
>>>>>>
>>>>>> Kernel managed remoteproc:
>>>>>>       status = "okay"; secure-status = "disabled";     /* NS-only */
>>>>>>
>>>>>> OP-TEE managed remoteproc:
>>>>>>       status = "disabled"; secure-status = "okay";     /* S-only */
>>>>>>
>>>>>>> Another issue would be to be able to share the remoteproc TEE service
>>>>>>> between
>>>>>>> several platform remoteproc drivers, in case of multi remote processor
>>>>>>> support.
>>>>>> Making the TEE based remoteproc service independent of DT will surely
>>>>>> make it more scalable to other platforms too. Have a look at how OP-TEE
>>>>>> based HWRNG service scales across platforms.
>>>>>
>>>>> Another important service is SCMI, which drivers use to manage clocks
>>>>> and resets.
>>>>> These clocks and resets are declared in the Device Tree (DT). It seems
>>>>> to me that
>>>>> in this case, we are closer to SCMI than to the RNG service.
>>>>>
>>>>> I propose we discuss this based on a concrete example with the STM32MP25.
>>>>> Although not yet upstreamed, our plan is to manage signed firmware for the
>>>>> Cortex-M33 and Cortex-M0.
>>>>>
>>>>> Please find below my view of the DT resources to address.
>>>>>
>>>>> STM32MP25  Cortex-M33 and Cortex-M0 nodes:
>>>>>
>>>>> m33_rproc {
>>>>>      /* M33 watchdog interrupt */
>>>>>      interrupt-parent = <&intc>;
>>>>>      interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
>>>>>      /* power domain management */
>>>>>      power-domains = <&cluster_pd>, <&ret_pd>;
>>>>>      power-domain-names = "default", "sleep";
>>>>>      /* RPMsg mailboxes + M33 graceful shutdown request */
>>>>>      mboxes = <&ipcc1 0x0>, <&ipcc1 0x1>, <&ipcc1 2>;
>>>>>      mbox-names = "vq0", "vq1", "shutdown";
>>>>>      memory-region = <&vdev0vring0>, <&vdev0vring1>, <&vdev0buffer>;
>>>>>      status = "okay";
>>>>> };
>>>>>
>>>>> m0_rproc {
>>>>>      /* mailbox for graceful shutdown */
>>>>>      mboxes = <&ipcc2 2>;
>>>>>      mbox-names = "shutdown";
>>>>>      /* M0 watchdog */
>>>>>     interrupt-parent = <&intc>;
>>>>>     interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
>>>>>     /* M0 peripheral clocking (not accessible by the M0) */
>>>>>     clocks = <&scmi_clk CK_SCMI_GPIOZ_AM>,
>>>>>     <&scmi_clk CK_SCMI_GPIOZ>,
>>>>>     <&scmi_clk CK_SCMI_IPCC2>,
>>>>>     <&scmi_clk CK_SCMI_IPCC2_AM>,
>>>>>     <&rcc CK_LPTIM3_AM>,
>>>>>     <&rcc CK_LPUART1_AM>,
>>>>>     <&rcc CK_CPU3_AM>,
>>>>>     <&rcc CK_CPU3>,
>>>>>     <&rcc CK_LPUART1_C3>,
>>>>>     <&rcc CK_GPIOZ_C3>,
>>>>>     <&rcc CK_LPTIM3_C3>,
>>>>>     <&rcc CK_KER_LPUART1>,
>>>>>     <&rcc CK_KER_LPTIM3>,
>>>>>     <&scmi_clk CK_SCMI_GPIOZ>,
>>>>>     <&scmi_clk CK_SCMI_IPCC2>;
>>>>>     status = "okay";
>>>>> };
>>>>>
>>>>> If we want to remove the DT, we need to consider:
>>>>>
>>>>> - Mechanism to differentiate Cortex-M33 and Cortex-M0:
>>>>>      Similar to SCMI, the remoteproc OP-TEE service should support
>>>>>     multiprocessor setups without instantiating multiple services.
>>>>>
>>>>> - Mailboxes:
>>>>>
>>>>>      A phandle is needed because the mailbox driver is managed by the
>>>>>      Linux mailbox driver. STM32MP2 has two mailboxes.
>>>>>      Moving towards your proposal would imply creating a mailbox service
>>>>>      in TEE to manage non-secure mailboxes for non-secure IPC. This might
>>>>>      not be efficient for inter-processor communication. Hardware-wise, it
>>>>>      would require the IRQ to be handled by the secure context.
>>>>>
>>>>> - Memory regions:
>>>>>     - Hardware limitation: OP-TEE is limited in the number of memory regions
>>>>>       it can declare due to Firewall configuration. Moving IPC memory regions
>>>>>       reaches this limit. Currently, OP-TEE defines a single region with
>>>>> shareable
>>>>>       access rights, which Linux splits into at least three memory regions
>>>>> for RPMsg.
>>>>>     - Memory mapping: Memory regions still need to be declared in Linux to
>>>>> prevent
>>>>>       Linux from using them.
>>>>>     - Virtio/RPMsg: Memory region names are fixed (e.g., dev<X>vring<Y>),
>>>>> so OP-TEE
>>>>>      must declare memory regions in its DT according to Linux naming
>>>>> conventions.
>>>>>
>>>>> - Clock and reset:
>>>>>       Some clocks and resets are managed via SCMI, others are not. This
>>>>> would require
>>>>>      managing all clocks and resets through SCMI, with possible side
>>>>> effect on the
>>>>>      "unused" clock mechanism in Linux ( to be confirmed)
>>>>>
>>>>> - Power domain:
>>>>>      Information is needed at the Linux level to determine the low power
>>>>> mode.
>>>>>
>>>>> - Watchdog interrupt:
>>>>>      Should be managed by OP-TEE, which requires the hardware to have an
>>>>> associated
>>>>>      secure IRQ.
>>>>>
>>>>> - Miscellaneous vendor DT properties:
>>>>>       How to be sure that these can be addressed through TEE services?
>>>>>
>>>>> Regarding the existing DT needs, it seems to me that removing the DT
>>>>> would require
>>>>> moving all node resource management into TEE ( if really possible). This
>>>>> would
>>>>> increase TEE complexity and footprint, reduce system efficiency, and
>>>>> make supporting
>>>>> other platforms less scalable.
>>>
>>> I can see your arguments regarding some DT properties which are hard to
>>> discover via OP-TEE service and I have been trying to think of how to
>>> handle it in a proper manner for a device on discoverable TEE bus. One
>>> of my fellow kernel maintainers pointed out that other discoverable
>>> buses in the kernel like PCI etc. already solved this DT dependencies
>>> via having device specific bindings. You can have a look at a one
>>> particular example of PCI device binding here [1]. In case of OP-TEE,
>>> you can have a similar device binding with UUID under the OP-TEE
>>> firmware DT node.
>>>
>>> The current approach you are taking via probing device on platform bus
>>> and then trying to move onto TEE bus isn't at all the compatible with
>>> the driver model, it simply sets a bad example for the driver model.
>>>
>>> [1] Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
>>>
>>
>> Thank you for your feedback. I am not very familiar with PCIe, so I need to
>> take a deeper look at the implementation.
> 
> I would suggest you take a look at how device specific DT bindings are
> used for other discoverable buses like PCIe etc. We need to do the same
> for the device/service discoverable on TEE bus.
> 
>>
>> To help me better understand your expectations, could you please confirm if
>> your proposal is close to what I have described below?
>>
> 
> No, what you describe below still rely on probing over platform bus
> (unique compatible). Here you really need to probe remoteproc driver on
> TEE bus and then discover DT properties using device specific DT
> bindings something like below:
> 
> firmware  {
>      optee  {
>          compatible = "linaro,optee-tz";
>          method = "smc";
> 
>          rproc-service@0 {
> 	    compatible = "<rproc-service-UUID>";
> 
>              m0_rproc {
> 	        ...
> 	    };
> 
>              m33_rproc {
> 	        ...
> 	    };
> 	};
>      };
> };
> 
> Note here that you only describe those DT properties which can't be
> discovered from rproc OP-TEE service.

Thanks for the advice.
FYI, due to some other activities in parallel,I will probably not be able
to address this with a new version before mid-November.Thanks,
Arnaud


> 
> -Sumit
> 
>>
>> 1) Device tree:
>> Notice that an intermediate ahb bus is used on ST platform for address
>> conversion between remote processor address and local physical address
>> I will probably need to find a solution for that.
>>
>>
>> firmware {
>>     remoteproc_tee {
>> 	compatible = "remoteproc-tee";
>> 	mlahb: ahb {
>> 	    compatible = "st,mlahb", "simple-bus";
>> 	    #address-cells = <1>;
>> 	    #size-cells = <1>;
>> 	    ranges;
>> 	    dma-ranges = <>;
>> 	    m33_rproc@0 {
>>        		compatible = "st,stm32mp1-m33";
>>       		/* M33 watchdog interrupt */
>>       		interrupt-parent = <&intc>;
>> 		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
>> 		/* power domain management */
>> 		power-domains = <&cluster_pd>, <&ret_pd>;
>> 		power-domain-names = "default", "sleep";
>> 		/* RPMsg mailboxes + M33 graceful shutdown request */
>> 		mboxes = <&ipcc1 0x0>, <&ipcc1 0x1>, <&ipcc1 2>;
>> 		mbox-names = "vq0", "vq1", "shutdown";
>> 		memory-region = <&vdev0vring0>, <&vdev0vring1>,
>> 				<&vdev0buffer>;
>> 		status = "okay";
>> 	    };
>>          };
>>
>> 	ahbsr: ahb@2 {
>> 	   compatible = "st,mlahb", "simple-bus";
>> 	   #address-cells = <1>;
>> 	   #size-cells = <1>;
>> 	   ranges = <>;
>> 	   dma-ranges = <>;
>> 	   m0_rproc@1 {
>>        		compatible = "st,stm32mp1-m0";
>> 		mboxes = <&ipcc2 2>;
>> 		mbox-names = "shutdown";
>> 		interrupt-parent = <&intc>;
>> 		interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
>> 		/* M0 peripheral clocking (not accessible by the M0) */
>> 		clocks = <>, <>;
>>      		status = "okay";
>> 	   };
>>         };
>>      };
>> };
>>
>> 2) remoteproc_driver:
>>    - platform driver that registers a TEE driver with specified UUID
>>    - on TEE driver probing it parses sub device (reg property replacing
>>      st, proc_id property)
>>    - tries to open associated TEE session and in case of success
>>      probes associated rproc driver.
>>
>> 3) st,remoteproc drivers
>>    -  unique DT compatible, no secure-status use (legacy compatibility)
>>    -  need to add a mechanism to detect probing
>>       by the TEE bus, or directly probed by the ahb bus.
>>
>>
>> Thanks,
>> Arnaud

