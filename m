Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6FD21B9DE;
	Mon, 22 Sep 2025 08:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758531487; cv=fail; b=XSna0fjubFeqUHdqvFznw275obku2ouQtb/5yKnA51U0mFctzuDTegryEXc2OIDX1A837jNS7k0sJLXMgALkX1CEZIbs/diWUt5MUBGUmgwPhIWcAz2aVXb5cWQqykDrr/yYdvB1Bu7vsHCsdGOUCfg5a8YusDkB/gdjsMR7n24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758531487; c=relaxed/simple;
	bh=jhtcU9BRkEv8uHQCn4GsFmU0c/UUxfKTbFLI8E6ICMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PTG5agR35ppUhvp0sVZ2YPcqJ+AJW2pDg04uq4TEPaITKlgYQjXWJj37QLxAhk3pfe8crIYnz08nbKt7BlcsyHvLRw9yQJWKijXxkmpsCeSWLZ1gBVf2ympT8ijZ1RjmtXGR24Gt9QfOaY25NBbdTnWAkeYKCFQ7xFmqZgrddH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=XiEZEEFJ; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="XiEZEEFJ"
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M8jNdD007683;
	Mon, 22 Sep 2025 10:57:42 +0200
Received: from am0pr83cu005.outbound.protection.outlook.com (mail-westeuropeazon11010018.outbound.protection.outlook.com [52.101.69.18])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 499kkxy79q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Sep 2025 10:57:41 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uXsSbLGaoOgJvmgRtrNOEQ2lifu3HiAAfstNzCMSYnxX1FaKask7rjxKwkRMbbDCH3GXzkjKfZiL3wM5NZJ/lSwJs2VfECNAalLNWoEQ2BjxEWuWqWBde5BlIr5gOwIUx4VG0aj1IMv0sUROJsy9v+UNceIBV/NxNXjMD96OAObmwAyKRJqEHkoE4vR3YCP0CyqQidsSwltCxcKjVSG7308Z1pv4zpta8XMDwpgCMvtd0Hj/+N8igV23ffQfD2SxwlBslCk6caK6xEqgxOeDdowksVMH0sF6MOcAEo7kcUDC9USUK/2TeAMEr+yFs1at0eoAvgItqy4EL9uygQK0Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PHuDAdMrMfv2Qu/khaBy+zlUCVq7NsYfNYHCBxeMw3Y=;
 b=od8b1nNfkpjktE0dEukUP9FMXpylbgWvjQ4cSyWixuWtOjFz5/z+fdQQPxjf5lOVXo6Fj07qLGayy5aYA9Fxzf+Ka+o+b9eTTOluw/ykUu+54MRDLr4WQvfn7MSiJiRZ7Lx5xc0u46ADmlOXleYyMhBy7YsdKiXV+fmuwql66Q7fchNYI0hSvDWZcipfv7PR4ETf1larsdHtJL38azPpHTXs4M2VVa0F1gJNI9Cs8nC3KVCqNgzj7UoG7cpg1rhilBK3B42mnTaNxwW0scbqmPN0bleZ+h6P5KOrKWGUvBDFIO9htqHwULXCD1dwDK9+kDih7lWlWv66QKq3QjMC1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PHuDAdMrMfv2Qu/khaBy+zlUCVq7NsYfNYHCBxeMw3Y=;
 b=XiEZEEFJ+tI0mT+e/UOP6vz/IBzkGNeHMvkzdraBEbJJJIXcoP9yw8zjissKn75sF8xAoNoLydYrJj71cURyqhAG2unhUjKA2KkqT8y8gnVUxGkP6PlGtG1FIyyA9EiIKIEYQQAmvOIBcA0mabtdAiSEO/rZ6uKUsrkikmKJ5735CqfzBAIO76hiA9ZqvJGabNccAL2DpBwQDN7/HgEL7JQordgU7ciwTbr6gCq0wE+1chyoXQLzs+A3FS8e8Hiq1fQwTyGaFjfE4ymsuGIeY+kvqMXWk5J+GclcvI6zamyuBZdDVCKqbwyDmqTqnPc8Xc1NpFTlaOJWrl8BUQTy7g==
Received: from DU7P250CA0027.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::22)
 by VI1PR10MB7690.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1c8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 08:57:38 +0000
Received: from DU6PEPF0000A7DD.eurprd02.prod.outlook.com
 (2603:10a6:10:54f:cafe::90) by DU7P250CA0027.outlook.office365.com
 (2603:10a6:10:54f::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.15 via Frontend Transport; Mon,
 22 Sep 2025 08:57:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DU6PEPF0000A7DD.mail.protection.outlook.com (10.167.8.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Mon, 22 Sep 2025 08:57:38 +0000
Received: from SHFCAS1NODE2.st.com (10.75.129.73) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 22 Sep
 2025 10:55:23 +0200
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by SHFCAS1NODE2.st.com
 (10.75.129.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 22 Sep
 2025 10:57:37 +0200
Received: from [10.48.87.127] (10.48.87.127) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 22 Sep
 2025 10:57:36 +0200
Message-ID: <0e5a44df-f60a-4523-a791-6318b3c81425@foss.st.com>
Date: Mon, 22 Sep 2025 10:57:35 +0200
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
 <8d385f2e-6470-4d66-be0b-a2a448a81fa4@foss.st.com>
 <aMz8XuHzIomNhmra@sumit-X1>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <aMz8XuHzIomNhmra@sumit-X1>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7DD:EE_|VI1PR10MB7690:EE_
X-MS-Office365-Filtering-Correlation-Id: 86d2ea69-3559-4d03-68a5-08ddf9b614b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ck8reGN6Z0ZWQ3NNbmE0ZXJIRHZIZU9RNXRHOW40UTNMeWFrM3pYQzZ1RDBw?=
 =?utf-8?B?WVJRRjllYVRwanFsNk5hZTM3QWVaL1Y0T2lnWEVjcjFaMmwzMzNDYW9BdWkr?=
 =?utf-8?B?RG5TYS9HUzUyTDZMZzByQzRmNW12VlY3OWlYUWtuaGRKTVZzNGRoajdWUEdT?=
 =?utf-8?B?V0J3bkhLQVRsQ1Mzcko4OHozSHpmYWJSQVdIL3l3cWp5ZktDNDdOcHhJWXFN?=
 =?utf-8?B?UWs3bjdGSERuWkRob2g3V29GU0ZrNGxoUW9yMjFYWWVta1V2OWVDdElsdEE2?=
 =?utf-8?B?YXg4VVNjeE5nS1VKaUxHYWdYa3ZoVHhsQnc3R0pHNlZpNSsrQjBhQTZRSVk1?=
 =?utf-8?B?TXdvbm1KYVA2dmpLNlQzbVU5N2IrUThvMGVra29PS2Y0TkdhNlU2NWxTOG5t?=
 =?utf-8?B?Q3VnelRVNlVlY0tIb1MwQzVSZEwrRWJFVE5WYjZrd1NLalpwVzZwYVg5WXVy?=
 =?utf-8?B?UHlxZ1RkVDNnWjFjZU1iMHpVZmhienFjVmdXa2dZZHd4QXhHTmVtaGJOYTVh?=
 =?utf-8?B?U2U3dVgydFc4cVBPektjK2ptRVZEcDhhU3gyZ1hEM2lLakF4bnB6SytMK1F5?=
 =?utf-8?B?OVNYSUxRZDQ1RFQveWRJWHVBTklKc0VjeGl5MEcyVytkcXcyQnhocnNhQkM0?=
 =?utf-8?B?dlhNNlhySkV1SzEvdThUUTlyNWxVbDFEQXRHM2o2dTMxNXE0d2p1cXMvQTF5?=
 =?utf-8?B?Mjl0OTVEckw3U2h1MU15SG1rMGdYc0RXcE1mVVRCVWpwVFhUK3VpWXBQMHFV?=
 =?utf-8?B?WUxMeTFPTWVVMGFqRHhpeUN4K2ttN0l2NytMdUd6bjBFSW9CNUVkdU12WHVQ?=
 =?utf-8?B?KzQvU0NPeWdwSTVkMm5IQ0RMN0VFNUZ2MU4zUXdNWENHb1ZaK2V3d0dIV0Fj?=
 =?utf-8?B?SHBERFhkUlFLTDhkSm1qUWk4dEpyS3creE5kdW1scDhNQzAxZDMrc2VCaUFS?=
 =?utf-8?B?WUR6dWhrK1c5ZkIxUTBBTm1iMFJsV3ZWZjZoSmJmZmRJYWFtWDlEdmJWU0Z2?=
 =?utf-8?B?eTJlUGplbjRnK0FYNkdrYkVRUmNBNzhGV3hGdERIZStwd1U1RTYrOWM4OUx3?=
 =?utf-8?B?V01PNlRZeFJuQXcyQ1doSUR0YTRSR2tNVVlBVUwyYUJRRjBwMVhYK2NwZExG?=
 =?utf-8?B?eVJJS2RVdlpmZXh4bklYT0pRbythTzlsWkdMN21YSHdjYndoTEhsTWdhMHlK?=
 =?utf-8?B?NnBmV2NTZkNscEcwZDVpdmFEOUh1MUYxQnA1TmhWU3hjd0VTMXpuNjE5a1Ru?=
 =?utf-8?B?WWVHVUkwMFRyUlRnV0o2V3oycWRpL1NQdGRwS3pyOVRPWTVQcW1aeW1qUVUr?=
 =?utf-8?B?SE9BMXZ5ZUlaRkQzeHR3WXd1dW5kR0l5OGl3aXBKT1lLeEY4Ym1vRXJ5d1VH?=
 =?utf-8?B?RzZqL2VFTXJrL1E4TDcvK3pzUEpwS3ZsdE9FbE5rdkRIREJFblQyaVkzQmhY?=
 =?utf-8?B?djltWG0yckt4ZnNHZGhVYlRLRGVCS29pdlRHSy9ZbVBZQlFLZWxDMVhYWjZT?=
 =?utf-8?B?bW9rMjZVYTVJaGlENDdGZmVZNDI4ek11cExSQzJ6bmRDVjZKYlcreVdKZTRT?=
 =?utf-8?B?NlRhdVdVOFFWR3Q0SlF2TmxIVEUrcDNSVmZ0a3ZWbjJJSVlxRHREWUtZZzgx?=
 =?utf-8?B?S05aT1ExNlJvc051cnVlWDVNS24vQ1RqaTYzaWhWckRXZXNDdU1sR1hhYVM5?=
 =?utf-8?B?QkwrT1BQcDZRRDNNbk0zRTM1UmpVNlkzbkVvZ1JnYlo4YVNDUThYU3BHNDZk?=
 =?utf-8?B?THpTRE9IYjR5VGhOZ2pGNVppQXhQTlJTTHFzcXBUNTN5STJvcHZXMUdjYmJJ?=
 =?utf-8?B?ZHFlaFZ5ZklHaWNwZjdhWmM0cG9kaWIxdzZTQ3lwT3ZnaW9PbmxVbWp4bUhL?=
 =?utf-8?B?VXJyRERFdHpnU095MzhLMUo1VjdtbnkwTldPajFMOXFFMmdyKzY1RmcvQUlJ?=
 =?utf-8?B?QTJ6eDA4WEs3TExQdE9vUXZndVdCa3JJU0o0Y0d3cUhubmhEYWUyRWY3SmIr?=
 =?utf-8?B?aUs1bDJrc0VBPT0=?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.43;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 08:57:38.1537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86d2ea69-3559-4d03-68a5-08ddf9b614b0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.43];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB7690
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyMiBTYWx0ZWRfX/l9p4/S8kSO2 dwReLxwVZ+KdTqhJ83oxiRrf+Tld1FZB+wtb6JAXKhImGN/Y5jyDuyh1Gr0swtixyezlqy+PXCn tnJDHlWGbHxzWDe6yESILSWyjCqQ6rMZVNL39CILrbhj2HsqpcC3Kzs+mnT79RJnGTdUXp1xNGy
 pZZkH46/dqJOkkP7VOrSJiBfu9iMZiugZqBaSK+Ylpqgn0cssTCsJtwfyL+M/tEoDKUhLtRGtYx 6RgompdTjoLKAEMsvAxOxbazIlcm+ioh4FyS688k36yFpivKvR1fnR0pmJY21Z5HYj3gNHe8slZ PPN+iP1X0Bpzyfe9ZUa7A2B0GjP5kjiV278BSLyuTM7OIxHL/lSI8Vf7xb8J75eAMAEE/JzEQKq f1hnxY2w
X-Proofpoint-GUID: CBi_9ipY8Aru4nQYYxzaTOsZ-zlMZHRS
X-Proofpoint-ORIG-GUID: CBi_9ipY8Aru4nQYYxzaTOsZ-zlMZHRS
X-Authority-Analysis: v=2.4 cv=dY2A3WXe c=1 sm=1 tr=0 ts=68d10f86 cx=c_pps a=4dgOkCfxDmvKyApMK2ikSA==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=FOPVHIcnkjUA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=P-IC7800AAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8 a=AzqJA3m1utYFupu1NB4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=d3PnA9EDa4IxuAV0gXij:22 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200022



On 9/19/25 08:46, Sumit Garg wrote:
> On Wed, Sep 17, 2025 at 03:47:40PM +0200, Arnaud POULIQUEN wrote:
>>
>> On 9/17/25 12:08, Sumit Garg wrote:
>>> On Tue, Sep 16, 2025 at 03:26:47PM +0200, Arnaud POULIQUEN wrote:
>>>> Hello Sumit,
>>>>
>>>> On 9/16/25 11:14, Sumit Garg wrote:
>>>>> Hi Arnaud,
>>>>>
>>>>> First of all apologies for such a late review comment as previously I
>>>>> wasn't CCed or involved in the review of this patch-set. In case any of
>>>>> my following comments have been discussed in the past then feel free to
>>>>> point me at relevant discussions.
>>>> No worries, there are too many versions of this series to follow all the
>>>> past discussions. I sometimes have difficulty remembering all the
>>>> discussions myself :)
>>>>
>>>>> On Wed, Jun 25, 2025 at 11:40:26AM +0200, Arnaud Pouliquen wrote:
>>>>>> The "st,stm32mp1-m4-tee" compatible is utilized in a system configuration
>>>>>> where the Cortex-M4 firmware is loaded by the Trusted Execution Environment
>>>>>> (TEE).
>>>>> Having a DT based compatible for a TEE service to me just feels like it
>>>>> is redundant here. I can see you have also used a TEE bus based device
>>>>> too but that is not being properly used. I know subsystems like
>>>>> remoteproc, SCMI and others heavily rely on DT to hardcode properties of
>>>>> system firmware which are rather better to be discovered dynamically.
>>>>>
>>>>> So I have an open question for you and the remoteproc subsystem
>>>>> maintainers being:
>>>>>
>>>>> Is it feasible to rather leverage the benefits of a fully discoverable
>>>>> TEE bus rather than relying on platform bus/ DT to hardcode firmware
>>>>> properties?
>>>> The discoverable TEE bus does not works if the remoteproc is probed
>>>> before the OP-TEE bus, in such case  no possibility to know if the TEE
>>>> TA is not yet available or not available at all.
>>>> This point is mentioned in a comment in rproc_tee_register().
>> For the discussion, it’s probably better if I provide more details on the
>> current OP-TEE implementation and the stm32mp processors.
>>
>> 1) STM32MP topology:
>>    - STM32MP1: only a Cortex-M4 remote processor
>>    -  STM32MP2x: a Cortex-M33 and a Cortex-M0 remote processors
>>    At this stage, only the STM32MP15 is upstreamed; the STM32MP25 is waiting
>>    for this series to be merged.
>>
>> 2) OP-TEE architecture:
>> - A platform-agnostic Trusted Application (TA) handles the bus service.[1]
>>    This TA supports managing multiple remote processors. It can be embedded
>>    regardless of the number of remote processors managed in OP-TEE.
>>    The decision to embed this service is made at build time based on the
>>    presence of the remoteproc driver, so it is not device tree dependent.
>>    - STM32MP15: TA activated only if the remoteproc OP-TEE driver is probed
>>    - STM32MP2x: TA always activated as the OP-TEE remoteproc driver is always
>> probed
>>
>> - A pseudo Trusted Application implements the platform porting[2],
>>    relying on registered remoteproc platform drivers.
>>
>> - Platform driver(s) manage the remote processors.[3][4]
>>    - If remoteproc is managed by OP-TEE: manages the remoteproc lifecycle
>>    - If remoteproc is managed by Linux: provides access rights to Linux to
>> manage
>>      the remoteproc
>>
>>    - STM32MP15: driver probed only if the remoteproc is managed in OP-TEE
>>    - STM32MP2x: driver probed in both cases for the Cortex-M33
>>      For the STM32MP25, the TA is always present and queries the driver to
>> check
>>      if it supports secure loading.
>>
>>
>> [1] https://elixir.bootlin.com/op-tee/4.7.0/source/ta/remoteproc
>> [2] https://elixir.bootlin.com/op-tee/4.7.0/source/core/pta/stm32mp/remoteproc_pta.c
>> [3]https://elixir.bootlin.com/op-tee/4.7.0/source/core/drivers/remoteproc/stm32_remoteproc.c
>> [4]https://github.com/STMicroelectronics/optee_os/blob/4.0.0-stm32mp/core/drivers/remoteproc/stm32_remoteproc.c
> Thanks for the background here.
>
>>> The reason here is that you are mixing platform and TEE bus for remoteproc
>>> driver. For probe, you rely on platform bus and then try to migrate to
>>> TEE bus via rproc_tee_register() is the problem here. Instead you should
>>> rather probe remoteproc device on TEE bus from the beginning.
>> The approach is interesting, but how can we rely on Device Tree (DT) for
>> hardware configuration in this case?
>> At a minimum, I need to define memory regions and mailboxes.
> The hardware configuration in DT should be consumed by OP-TEE and the
> kernel probes remoteproc properties from OP-TEE since it's an OP-TEE
> mediated remoteproc service you are adding here.
>>  From my perspective, I would still need a driver probed by DT that registers
>> a driver on the TEE bus. Therefore, I still need a mechanism to decide
>> whether the remote firmware is managed by the secure or non-secure context.
> As I mentioned below, this should be achievable using the secure-status
> property without introducing the new compatible:
>
> Kernel managed remoteproc:
>     status = "okay"; secure-status = "disabled";     /* NS-only */
>
> OP-TEE managed remoteproc:
>     status = "disabled"; secure-status = "okay";     /* S-only */
>
>> Another issue would be to be able to share the remoteproc TEE service
>> between
>> several platform remoteproc drivers, in case of multi remote processor
>> support.
> Making the TEE based remoteproc service independent of DT will surely
> make it more scalable to other platforms too. Have a look at how OP-TEE
> based HWRNG service scales across platforms.

Another important service is SCMI, which drivers use to manage clocks 
and resets.
These clocks and resets are declared in the Device Tree (DT). It seems 
to me that
in this case, we are closer to SCMI than to the RNG service.

I propose we discuss this based on a concrete example with the STM32MP25.
Although not yet upstreamed, our plan is to manage signed firmware for the
Cortex-M33 and Cortex-M0.

Please find below my view of the DT resources to address.

STM32MP25  Cortex-M33 and Cortex-M0 nodes:

m33_rproc {
   /* M33 watchdog interrupt */
   interrupt-parent = <&intc>;
   interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
   /* power domain management */
   power-domains = <&cluster_pd>, <&ret_pd>;
   power-domain-names = "default", "sleep";
   /* RPMsg mailboxes + M33 graceful shutdown request */
   mboxes = <&ipcc1 0x0>, <&ipcc1 0x1>, <&ipcc1 2>;
   mbox-names = "vq0", "vq1", "shutdown";
   memory-region = <&vdev0vring0>, <&vdev0vring1>, <&vdev0buffer>;
   status = "okay";
};

m0_rproc {
   /* mailbox for graceful shutdown */
   mboxes = <&ipcc2 2>;
   mbox-names = "shutdown";
   /* M0 watchdog */
  interrupt-parent = <&intc>;
  interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
  /* M0 peripheral clocking (not accessible by the M0) */
  clocks = <&scmi_clk CK_SCMI_GPIOZ_AM>,
  <&scmi_clk CK_SCMI_GPIOZ>,
  <&scmi_clk CK_SCMI_IPCC2>,
  <&scmi_clk CK_SCMI_IPCC2_AM>,
  <&rcc CK_LPTIM3_AM>,
  <&rcc CK_LPUART1_AM>,
  <&rcc CK_CPU3_AM>,
  <&rcc CK_CPU3>,
  <&rcc CK_LPUART1_C3>,
  <&rcc CK_GPIOZ_C3>,
  <&rcc CK_LPTIM3_C3>,
  <&rcc CK_KER_LPUART1>,
  <&rcc CK_KER_LPTIM3>,
  <&scmi_clk CK_SCMI_GPIOZ>,
  <&scmi_clk CK_SCMI_IPCC2>;
  status = "okay";
};

If we want to remove the DT, we need to consider:

- Mechanism to differentiate Cortex-M33 and Cortex-M0:
   Similar to SCMI, the remoteproc OP-TEE service should support
  multiprocessor setups without instantiating multiple services.

- Mailboxes:

   A phandle is needed because the mailbox driver is managed by the
   Linux mailbox driver. STM32MP2 has two mailboxes.
   Moving towards your proposal would imply creating a mailbox service
   in TEE to manage non-secure mailboxes for non-secure IPC. This might
   not be efficient for inter-processor communication. Hardware-wise, it
   would require the IRQ to be handled by the secure context.

- Memory regions:
  - Hardware limitation: OP-TEE is limited in the number of memory regions
    it can declare due to Firewall configuration. Moving IPC memory regions
    reaches this limit. Currently, OP-TEE defines a single region with 
shareable
    access rights, which Linux splits into at least three memory regions 
for RPMsg.
  - Memory mapping: Memory regions still need to be declared in Linux to 
prevent
    Linux from using them.
  - Virtio/RPMsg: Memory region names are fixed (e.g., dev<X>vring<Y>), 
so OP-TEE
   must declare memory regions in its DT according to Linux naming 
conventions.

- Clock and reset:
    Some clocks and resets are managed via SCMI, others are not. This 
would require
   managing all clocks and resets through SCMI, with possible side 
effect on the
   "unused" clock mechanism in Linux ( to be confirmed)

- Power domain:
   Information is needed at the Linux level to determine the low power mode.

- Watchdog interrupt:
   Should be managed by OP-TEE, which requires the hardware to have an 
associated
   secure IRQ.

- Miscellaneous vendor DT properties:
    How to be sure that these can be addressed through TEE services?

Regarding the existing DT needs, it seems to me that removing the DT 
would require
moving all node resource management into TEE ( if really possible). This 
would
increase TEE complexity and footprint, reduce system efficiency, and 
make supporting
other platforms less scalable.

That said, it probably also depends on the TEE implementation.
And  we should support both. This could be done by introducing a second 
UUID.
but in this case should it be the same driver?

>
>>>> Then, it is not only a firmware property in our case. Depending on the
>>>> compatible string, we manage the hardware differently. The same compatibles
>>>> are used in both OP-TEE and Linux. Based on the compatible, we can assign
>>>> memories, clocks, and resets to either the secure or non-secure context.
>>>> This approach is implemented on the STM32MP15 and STM32MP2x platforms.
>>> You should have rather used the DT property "secure-status" [1] to say
>>> the remoteproc device is being managed by OP-TEE instead of Linux. Then
>>> the Linux driver will solely rely on TEE bus to have OP-TEE mediated
>>> remoteproc device.
>>>
>>> [1] https://github.com/devicetree-org/dt-schema/blob/4b28bc79fdc552f3e0b870ef1362bb711925f4f3/dtschema/schemas/dt-core.yaml#L52
>> My issue with this property is that this would break the compatibility with
>> legacy DT that only support loading by Linux
> No, it's not a DT ABI break at all. It is always possible for a
> hardware to be re-configured to change assignment of peripherals among
> OP-TEE and Linux kernel.
>
>> As specified in [5] :If "secure-status" is not specified it defaults to the
>> same value as "status"; [5]
>> https://www.kernel.org/doc/Documentation/devicetree/bindings/arm/secure.txt
> This is mostly meant for peripherals that can be probed by both OP-TEE
> and Linux kernel via DT. But here in case of remoteproc, there needs to
> exclusive access control for either via Linux kernel or OP-TEE. Hence, the
> "status" and "secure-status" properties should be updated accordingly.
>
>>>> More details are available in the ST WIKI:
>>>> https://wiki.st.com/stm32mpu/wiki/OP-TEE_remoteproc_framework_overview#Device_tree_configuration
>>>> https://wiki.st.com/stm32mpu/wiki/Linux_remoteproc_framework_overview#Device_tree_configuration
>>>>
>>>>>> For instance, this compatible is used in both the Linux and OP-TEE device
>>>>>> trees:
>>>>>> - In OP-TEE, a node is defined in the device tree with the
>>>>>>      "st,stm32mp1-m4-tee" compatible to support signed remoteproc firmware.
>>>>>>      Based on DT properties, the OP-TEE remoteproc framework is initiated to
>>>>>>      expose a trusted application service to authenticate and load the remote
>>>>>>      processor firmware provided by the Linux remoteproc framework, as well
>>>>>>      as to start and stop the remote processor.
>>>>>> - In Linux, when the compatibility is set, the Cortex-M resets should not
>>>>>>      be declared in the device tree. In such a configuration, the reset is
>>>>>>      managed by the OP-TEE remoteproc driver and is no longer accessible from
>>>>>>      the Linux kernel.
>>>>>>
>>>>>> Associated with this new compatible, add the "st,proc-id" property to
>>>>>> identify the remote processor. This ID is used to define a unique ID,
>>>>>> common between Linux, U-Boot, and OP-TEE, to identify a coprocessor.
>>>>> This "st,proc-id" is just one such property which can rather be directly
>>>>> probed from the TEE/OP-TEE service rather than hardcoding it in DT here.
>>>> Do you mean a topology discovery mechanism through the TEE remoteproc
>>>> service?
>>>>
>>>> For the STM32MP15, it could work since we have only one remote processor.
>>>> However, this is not the case for the STM32MP25, which embeds both a
>>>> Cortex-M33 and a Cortex-M0.
>>> I rather mean here whichever properties you can currently dicovering via
>>> DT can rather be discovered by invoke command taking property name as input
>>> and value as output.
>> That would means services to get system resources such as memory region
>> mailbox, right?
> Yeah.
>
>>>> Could you please elaborate on how you see the support of multiple remote
>>>> processors without using an hardcoded identifier?
>>> By multiple remote processors, do you mean there can be multiple
>>> combinations of which remote processor gets managed via OP-TEE or not?
>> On stm32mp25 we have 2 remote processors a cortex-M33 and a cortex-M0
>> We should be able to manage them using the proc_idAnother point is that We
>> should allow an other Secure OS could implement the TEE remoteproc service
>> managing the remote processors with different proc_id values, to avoid to
>> specify somewhere an unique proc ID per remote processor.
> Okay I see, so you can add unique proc ID to DT which gets consumed by
> OP-TEE and Linux discovers the same via the TEE service.
Yes the Linux passes the proc ID as argument of the 
tee_client_open_session().
In OP-TEE, the TEE service checks the match with the proc ID registered 
by the
OP-TEE remote proc drivers.

Regards,
Arnaud

>
>>>>> I think the same will apply to other properties as well.
>>>> Could you details the other properties you have in mind?
>>> I think the memory regions including the resource table can also be
>>> probed directly from the TEE service too. Is there any other DT property
>>> you rely upon when remoteproc is managed via OP-TEE?
>> The memory regions that include the resource table are already declared
>> in OP-TEE. The memory regions defined in the Linux device tree are for
>> RPMsg (IPC). These memories are registered by the Linux remoteproc driver
>> in the Linux rproc core.
>>
> Sure, so they can also be discovered by TEE service.
>
> -Sumit

