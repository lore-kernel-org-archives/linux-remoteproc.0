Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9522E274B5D;
	Fri, 10 Oct 2025 10:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760090738; cv=fail; b=ovTfeF5x4amHCIFfq+aXskKwYiPhKJQ+0D3v8rdNuM9PTjFBIPp7g1ch+iwDhXmEMhxGJkfcNl0Hcr2NoHpAhIKJ16OlhidRlMPt5A6rE8IrRA+PjVfx0uhS4ReOHwHuPpf8o14TZBc1NupPeFombfMnM483X+mSXEbkXyEqjnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760090738; c=relaxed/simple;
	bh=x1HzQ/Vm0Vr741qY5sMradSMZ36Nq171RoPfH6IQdaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hPvinpO80aeFtBAlfUuX6a0swz8ilU5wVCa2Dg2RoThpJHHGb64a1y730IkFGEy7w7hE5HySQl7GXORy6KHjwQ/jkkmB+qp8joSUkDhfi2rOTgU5bs6RYQ2tzpfWmEmcY5cmadW0BGR9rVigU1foAF1YHw8n48zS+w5l41EjWIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=F43YNP3P; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="F43YNP3P"
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59AA1vUP013650;
	Fri, 10 Oct 2025 12:04:45 +0200
Received: from db3pr0202cu003.outbound.protection.outlook.com (mail-northeuropeazon11010013.outbound.protection.outlook.com [52.101.84.13])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49nv6h8m3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Oct 2025 12:04:45 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/CnQcIaY0ykHZg3wJSBZ9MQ2UI24sT7qR5z95IMRdpZUoGYpfifOsUMaui0YwaLkPowxwfpKy3u7NxTYPPCtPYfXfwxU0PB75PNv6JRoebOkfeEyPvZyQqxymaczhcKfrVcrr8Wof3eZkXQG7NBR8cwhJrsaYBENNsgSes7voV4lX+p4MPbaR9m1y5N5b6J735a/qeHCY/UYVJSH0qpjVZ7f0lzmOPWkJrJ+UC/j8b6DV6PBVD4mLjWrm+z8jUnBYPVjFA97e543VASqGw2pPpoKbQC8OlxER3y40IUEi0BdSUCjTGrTTPLs/PleN102PbelijrDuV0fr5rv3uVPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5tjTn5h3gR2id1zB5hDZEyMjw9wASUIwlH6nqUF8z6A=;
 b=f5q7jaxP6DoYPi5CJC2dUgqQVyK0yyRBjgJwb3DSos1EsRqjyN8R5iazheXfTzVc2TPQdCMGKm84JMEg/4WtDtaLG0cpmdduRPNr1d+sZkFYOA8Im0IG5ypP9TNjwATKzn9BqE2yk9DRwoa8aniqREONCaklY150lB1UdDCjdCKGCufMPV8CAgB2EI6i7QfPQ6gVqFXWLlzZuiWIvoU3EdTqt6IbQ6BXMdpe5dSrSScM+GwuDlUpao6wuSRadzRGqBtp3Vsw/6SpPPErNIzvBr7haUgh50zDEcUtz/nXhCInvhcgnDaWUye+369qJ58sgRXbBjRbsuYEPXUXKGYg9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tjTn5h3gR2id1zB5hDZEyMjw9wASUIwlH6nqUF8z6A=;
 b=F43YNP3P0P0Eh+kXQ/fYrz0JwRMcjkhawxB59ZZ5uD9T6IOwt6K3BXhdFhWzjjIkLTGGqeyvhN7O5qm5ZOo/uykIIBG1AH4+deDbZqyugXS1IDYtg6vcrB8yv1xVk/Lp2WrT3/+19t3Dbgpsc72W+7sWKPVD+wXqUY382thZ708vDhEhhyMcmFLVugd2hFqwJ+26TwIMcWBJ8Rv0NceGRWr3/0D8jvk8lI2cV09PIU1uBK7arlWEs1HJF3j0zQZ+XNyDxVf0+ZmFbdOP4N0KwbHo6QHErHTEIX+bfM4SV0WxCV+wQAgO11WRC8YTpoIIRqFH0qZsybMCgVzu0Qsi7g==
Received: from DUZPR01CA0262.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::24) by DU4PR10MB8856.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:569::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 10:04:43 +0000
Received: from DU6PEPF00009529.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::f5) by DUZPR01CA0262.outlook.office365.com
 (2603:10a6:10:4b9::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.10 via Frontend Transport; Fri,
 10 Oct 2025 10:04:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DU6PEPF00009529.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Fri, 10 Oct 2025 10:04:43 +0000
Received: from EQNCAS1NODE3.st.com (10.75.129.80) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 10 Oct
 2025 11:57:34 +0200
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNCAS1NODE3.st.com
 (10.75.129.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 10 Oct
 2025 12:04:41 +0200
Received: from [10.48.87.127] (10.48.87.127) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 10 Oct
 2025 12:04:40 +0200
Message-ID: <929ce1f6-818f-4bb9-abf9-24d511bd2bf3@foss.st.com>
Date: Fri, 10 Oct 2025 12:04:40 +0200
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
References: <20250625094028.758016-1-arnaud.pouliquen@foss.st.com>
 <20250625094028.758016-5-arnaud.pouliquen@foss.st.com>
 <aMkqifHSdlCs4VjA@sumit-X1>
 <62bdb238-7440-451b-84ef-79f846b10ba0@foss.st.com>
 <aMqIhFdIqp5auH22@sumit-X1>
 <8d385f2e-6470-4d66-be0b-a2a448a81fa4@foss.st.com>
 <aMz8XuHzIomNhmra@sumit-X1>
 <0e5a44df-f60a-4523-a791-6318b3c81425@foss.st.com>
 <f5b0e106-a731-461b-b401-1aa1f9892465@foss.st.com>
 <aOidN1N3GIOcsXd1@sumit-X1>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <aOidN1N3GIOcsXd1@sumit-X1>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009529:EE_|DU4PR10MB8856:EE_
X-MS-Office365-Filtering-Correlation-Id: 3773ab44-14c1-4e19-553e-08de07e46f22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RklGT0lBUXNvSVFOQU42dmdZbDVTTjMzUDlaSm01OUlnSCtDWEEwM1BUb3Qw?=
 =?utf-8?B?dHljS3RzWjg1ZEpOSnRSR0JUb0F4ZENJZWtaV2I0cFNxcWIxeWZKU1lDZy83?=
 =?utf-8?B?Rzd6UGc4Mkt1VW52ZlpNMG1OWVV4Ly8zcS9XRFJ1NWNVdWdMdnZsUlJiRzRx?=
 =?utf-8?B?WXhKSFd2RXg4akdiclFPY3UwMEgxcVhpaGdvWmdyNnVDZ0czUUQ1QnY1ZVdl?=
 =?utf-8?B?RER2bVRIUEVub2prMGFlRWdub1BXWXo1cFJ6Y2hhUTVjTnloVjlGMU5kdVpF?=
 =?utf-8?B?dFhidlBFenIvYzQyTU43ZUNzclh2cXJCRWdWM2RIazlrOUZFNHg0Q3NXckdS?=
 =?utf-8?B?L3FsUTNnR2YvRzNFUUpNM0VRbUVlV1NhYmFXaGRVV3llenNJV2RhRkZKWk9F?=
 =?utf-8?B?Nll3T0R6TURablZuSFlDNzZnWVA4cGQ1QVkzazFLSEo5ZzN1SnBhdW9VcEZ3?=
 =?utf-8?B?amdpNG54ZWJzckxPdVB3amxVUWlPVk5hdUVtZUVyK3IyTDFuQnZDZXVHSkRB?=
 =?utf-8?B?a1N3QnhkQlVSR2pTV05kSmxka2MxVlRMUWYwY0ZER3NCNXo3MkRCRE10R2Ft?=
 =?utf-8?B?ZXphbFFMWkVTR1RYZVNZMXpHYkhUOEJUM2xMN3FZajhKbjIxNUNVUmV6c291?=
 =?utf-8?B?cGNISFpIOGxDTFZWM2RMWXBubXRqQ05HTjlLZ3JOZjdNUmxjM093VTJab3NM?=
 =?utf-8?B?QUdWaThTcUxKbUtYVld5S0tPbXpmbmJPYndNYmRCMDNxZjdvclduUzNZd3BE?=
 =?utf-8?B?c3RmQk5LNVc4anlQejZJMmkyYy9Hbm0wZEdiNkZKNm9aa2VOQXZnKzA2dngw?=
 =?utf-8?B?UUo1MmFWNmJNZ1lCL3h6Vkg1aDY1b2tJMGFmMXgxbGVMZGxTWiszenZOaWVO?=
 =?utf-8?B?eWFRWDB3MlBqQlFINUZNcW1sTnpNVmpQM25MbS9ueFJySUcralZrUlRjZEZY?=
 =?utf-8?B?UEZnbEYyZmZ3ZlFOQjRGcnFYTWxqUHpScTBMRVc5azkzTzE3dThDR1dUSlNt?=
 =?utf-8?B?Ni94ZmFTYWhQSDhCTlAva0llbDQ1Zlh3aTNLZjBVWTZ2ZnpURU1hZXBYVDJi?=
 =?utf-8?B?bGROYW96M1Z6ZGdFZ3U3d2VPbVVJZnFTNGhnTkNrRVFyZDZYQnBrWGQzK0Vq?=
 =?utf-8?B?ZEFqR2RYejZRTWpXbVZXY3M1MTJBMWc4cytTcGdMM1Bhd1ZMMzJSbk9vYXNS?=
 =?utf-8?B?WWRWb2FnVG1sR09ZUC9JS29qRVBvZGtjN3ZQMW1TdEdoV0t6cnNTZWFpckpO?=
 =?utf-8?B?QzhxQURGY3ljNnpuU0RGeThDY1MvY0hHUC91b2FFZ0FZM1puS2tjRmNsMld6?=
 =?utf-8?B?SjZxVldZWnQrdzU5Z1lFQytYRkZKU3Fqcm5TTldHRUkydDVZZUdmaU5hR2Z4?=
 =?utf-8?B?Z0dNOUF6OUdYV3VJQVpvQXNpOHNRaTVtcnBHV2JyV2hsek1BWStXTG95MWwx?=
 =?utf-8?B?SldQbFpBSjhPL2VNVEdhdkpjdWlKMXBtdjl4SWJiVlBRbmpDODZGUVJScE9w?=
 =?utf-8?B?QUg3S3NycmdPai9JNmp3a0JPeHQ0dENYdWh0SjdLM3pJSzJ4Q1dORDFLL2V6?=
 =?utf-8?B?aGRXTGcyZk5RakVNWVNYZ3VINmNPbEdRWGoxbUduUE8welBWdW4xSWNVakRm?=
 =?utf-8?B?a3hrTXJnYktUSEJMekZXRzE5eGNFQmN2d2dZN1RoWXlhMkUzajVJa1pKRHpy?=
 =?utf-8?B?SzlYN1p5VDlQRmxlL3FuR1hmNlYyeHEwc1lwdlpkcys3RUtWZXVIUXYzK3Jj?=
 =?utf-8?B?SmxPQ0dDbGNvSlYzOWJ3V3llNTdrdG5wWG12RTlKMWM0a2lTanBVcDl3RXk4?=
 =?utf-8?B?RmdIaEY5VEFhb2NLems2VXVLTytoNTBncFpJZ2ZucnNSL3pVamwrK1dacWpM?=
 =?utf-8?B?RVQrc0JxSUc3UWlBSUFTYjlIbVdteXl4SjNsRndLa2FLTWNJVkswdmVXdnlm?=
 =?utf-8?B?QlFNSVNFQVFyTFE5R0Q1aWE4MHlqSFpETGZOYVVGZ2JhOXI4V0hIYkhzYVg1?=
 =?utf-8?B?U2FlV3RYWHh2OFF5dHM5VzBiZTlTM2tSenRIeStOQzJhdUpWY3pXeHVGak43?=
 =?utf-8?B?bjdKMFJLeUpKd0w2VHZ0K28zUGl6U3hOOTdZRC9Lb0lpM0hnakNiSFRkdTRw?=
 =?utf-8?Q?gCis=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.44;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 10:04:43.0289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3773ab44-14c1-4e19-553e-08de07e46f22
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.44];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009529.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8856
X-Authority-Analysis: v=2.4 cv=S+/UAYsP c=1 sm=1 tr=0 ts=68e8da3d cx=c_pps
 a=1qKRAtnyhAzLZZNyb1hmZA==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FOPVHIcnkjUA:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=P-IC7800AAAA:8
 a=NEAV23lmAAAA:8 a=xqpGJbyLU_09492EXfAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=d3PnA9EDa4IxuAV0gXij:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX/3o6LZj1CbPM
 3/9C/YHODjSpy2RaAFDtPNutTzWvbi5H7URvp6ZbHhzyeMQDCHqVvpXnPPJaNK2a/kvD/JKhkYX
 YhwGcdP3S3eI6lad5af4XUBJxo6MgVfZPm2CBL3cJm4Hc20f+9gZWqm1CtCZauVJesigfEsYjMY
 YU72cGDNRCJZdk97xhLyCEBFAw1ZxutnEhrYhF5znsNyIX5Ve/1cWGExiFmiF1oaSQX3Rg17VXW
 OjLSYPg3oDlCRbuF/tOnQiJPIDCVcz6jC7SGeXfYpgHUy78sg9Quwzpdpsbhum3Rl2z+36/vDDW
 jA6FUXmNlvKBMDv3a5IbcvY7Pd4+J1056nwXCIvzNrkcDJDgpwNzLIYLy3px2E/Jj7RTWvBehaJ
 0efLIh35GqvpqsdFuE9d9VTt1IrtxQ==
X-Proofpoint-ORIG-GUID: tEO45UAiokMZt6ePmiXi_UnyZfl6K5br
X-Proofpoint-GUID: tEO45UAiokMZt6ePmiXi_UnyZfl6K5br
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

Hi Sumit,

On 10/10/25 07:44, Sumit Garg wrote:
> Hi Arnaud,
> 
> It's been some holidays followed by business travel leading to delay in
> my response here.
> 
> On Tue, Oct 07, 2025 at 03:50:32PM +0200, Arnaud POULIQUEN wrote:
>> Hello Bjorn, Mathieu, Sumit,
>>
>> On 9/22/25 10:57, Arnaud POULIQUEN wrote:
>>>
>>>
>>> On 9/19/25 08:46, Sumit Garg wrote:
>>>> On Wed, Sep 17, 2025 at 03:47:40PM +0200, Arnaud POULIQUEN wrote:
>>>>>
>>>>> On 9/17/25 12:08, Sumit Garg wrote:
>>>>>> On Tue, Sep 16, 2025 at 03:26:47PM +0200, Arnaud POULIQUEN wrote:
>>>>>>> Hello Sumit,
>>>>>>>
>>>>>>> On 9/16/25 11:14, Sumit Garg wrote:
>>>>>>>> Hi Arnaud,
>>>>>>>>
>>>>>>>> First of all apologies for such a late review comment as previously I
>>>>>>>> wasn't CCed or involved in the review of this
>>>>>>>> patch-set. In case any of
>>>>>>>> my following comments have been discussed in the
>>>>>>>> past then feel free to
>>>>>>>> point me at relevant discussions.
>>>>>>> No worries, there are too many versions of this series
>>>>>>> to follow all the
>>>>>>> past discussions. I sometimes have difficulty remembering all the
>>>>>>> discussions myself :)
>>>>>>>
>>>>>>>> On Wed, Jun 25, 2025 at 11:40:26AM +0200, Arnaud Pouliquen wrote:
>>>>>>>>> The "st,stm32mp1-m4-tee" compatible is utilized
>>>>>>>>> in a system configuration
>>>>>>>>> where the Cortex-M4 firmware is loaded by the
>>>>>>>>> Trusted Execution Environment
>>>>>>>>> (TEE).
>>>>>>>> Having a DT based compatible for a TEE service to me
>>>>>>>> just feels like it
>>>>>>>> is redundant here. I can see you have also used a
>>>>>>>> TEE bus based device
>>>>>>>> too but that is not being properly used. I know subsystems like
>>>>>>>> remoteproc, SCMI and others heavily rely on DT to
>>>>>>>> hardcode properties of
>>>>>>>> system firmware which are rather better to be discovered dynamically.
>>>>>>>>
>>>>>>>> So I have an open question for you and the remoteproc subsystem
>>>>>>>> maintainers being:
>>>>>>>>
>>>>>>>> Is it feasible to rather leverage the benefits of a
>>>>>>>> fully discoverable
>>>>>>>> TEE bus rather than relying on platform bus/ DT to hardcode firmware
>>>>>>>> properties?
>>>>>>> The discoverable TEE bus does not works if the remoteproc is probed
>>>>>>> before the OP-TEE bus, in such case  no possibility to know if the TEE
>>>>>>> TA is not yet available or not available at all.
>>>>>>> This point is mentioned in a comment in rproc_tee_register().
>>>>> For the discussion, it’s probably better if I provide more
>>>>> details on the
>>>>> current OP-TEE implementation and the stm32mp processors.
>>>>>
>>>>> 1) STM32MP topology:
>>>>>     - STM32MP1: only a Cortex-M4 remote processor
>>>>>     -  STM32MP2x: a Cortex-M33 and a Cortex-M0 remote processors
>>>>>     At this stage, only the STM32MP15 is upstreamed; the
>>>>> STM32MP25 is waiting
>>>>>     for this series to be merged.
>>>>>
>>>>> 2) OP-TEE architecture:
>>>>> - A platform-agnostic Trusted Application (TA) handles the bus
>>>>> service.[1]
>>>>>     This TA supports managing multiple remote processors. It can
>>>>> be embedded
>>>>>     regardless of the number of remote processors managed in OP-TEE.
>>>>>     The decision to embed this service is made at build time based on the
>>>>>     presence of the remoteproc driver, so it is not device tree
>>>>> dependent.
>>>>>     - STM32MP15: TA activated only if the remoteproc OP-TEE
>>>>> driver is probed
>>>>>     - STM32MP2x: TA always activated as the OP-TEE remoteproc
>>>>> driver is always
>>>>> probed
>>>>>
>>>>> - A pseudo Trusted Application implements the platform porting[2],
>>>>>     relying on registered remoteproc platform drivers.
>>>>>
>>>>> - Platform driver(s) manage the remote processors.[3][4]
>>>>>     - If remoteproc is managed by OP-TEE: manages the remoteproc
>>>>> lifecycle
>>>>>     - If remoteproc is managed by Linux: provides access rights
>>>>> to Linux to
>>>>> manage
>>>>>       the remoteproc
>>>>>
>>>>>     - STM32MP15: driver probed only if the remoteproc is managed
>>>>> in OP-TEE
>>>>>     - STM32MP2x: driver probed in both cases for the Cortex-M33
>>>>>       For the STM32MP25, the TA is always present and queries the
>>>>> driver to
>>>>> check
>>>>>       if it supports secure loading.
>>>>>
>>>>>
>>>>> [1] https://elixir.bootlin.com/op-tee/4.7.0/source/ta/remoteproc
>>>>> [2]
>>>>> https://elixir.bootlin.com/op-tee/4.7.0/source/core/pta/stm32mp/
>>>>> remoteproc_pta.c
>>>>> [3]https://elixir.bootlin.com/op-tee/4.7.0/source/core/drivers/
>>>>> remoteproc/stm32_remoteproc.c
>>>>> [4]https://github.com/STMicroelectronics/optee_os/blob/4.0.0-stm32mp/
>>>>> core/drivers/remoteproc/stm32_remoteproc.c
>>>> Thanks for the background here.
>>>>
>>>>>> The reason here is that you are mixing platform and TEE bus
>>>>>> for remoteproc
>>>>>> driver. For probe, you rely on platform bus and then try to migrate to
>>>>>> TEE bus via rproc_tee_register() is the problem here.
>>>>>> Instead you should
>>>>>> rather probe remoteproc device on TEE bus from the beginning.
>>>>> The approach is interesting, but how can we rely on Device Tree (DT) for
>>>>> hardware configuration in this case?
>>>>> At a minimum, I need to define memory regions and mailboxes.
>>>> The hardware configuration in DT should be consumed by OP-TEE and the
>>>> kernel probes remoteproc properties from OP-TEE since it's an OP-TEE
>>>> mediated remoteproc service you are adding here.
>>>>>   From my perspective, I would still need a driver probed by DT
>>>>> that registers
>>>>> a driver on the TEE bus. Therefore, I still need a mechanism to decide
>>>>> whether the remote firmware is managed by the secure or
>>>>> non-secure context.
>>>> As I mentioned below, this should be achievable using the secure-status
>>>> property without introducing the new compatible:
>>>>
>>>> Kernel managed remoteproc:
>>>>      status = "okay"; secure-status = "disabled";     /* NS-only */
>>>>
>>>> OP-TEE managed remoteproc:
>>>>      status = "disabled"; secure-status = "okay";     /* S-only */
>>>>
>>>>> Another issue would be to be able to share the remoteproc TEE service
>>>>> between
>>>>> several platform remoteproc drivers, in case of multi remote processor
>>>>> support.
>>>> Making the TEE based remoteproc service independent of DT will surely
>>>> make it more scalable to other platforms too. Have a look at how OP-TEE
>>>> based HWRNG service scales across platforms.
>>>
>>> Another important service is SCMI, which drivers use to manage clocks
>>> and resets.
>>> These clocks and resets are declared in the Device Tree (DT). It seems
>>> to me that
>>> in this case, we are closer to SCMI than to the RNG service.
>>>
>>> I propose we discuss this based on a concrete example with the STM32MP25.
>>> Although not yet upstreamed, our plan is to manage signed firmware for the
>>> Cortex-M33 and Cortex-M0.
>>>
>>> Please find below my view of the DT resources to address.
>>>
>>> STM32MP25  Cortex-M33 and Cortex-M0 nodes:
>>>
>>> m33_rproc {
>>>     /* M33 watchdog interrupt */
>>>     interrupt-parent = <&intc>;
>>>     interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
>>>     /* power domain management */
>>>     power-domains = <&cluster_pd>, <&ret_pd>;
>>>     power-domain-names = "default", "sleep";
>>>     /* RPMsg mailboxes + M33 graceful shutdown request */
>>>     mboxes = <&ipcc1 0x0>, <&ipcc1 0x1>, <&ipcc1 2>;
>>>     mbox-names = "vq0", "vq1", "shutdown";
>>>     memory-region = <&vdev0vring0>, <&vdev0vring1>, <&vdev0buffer>;
>>>     status = "okay";
>>> };
>>>
>>> m0_rproc {
>>>     /* mailbox for graceful shutdown */
>>>     mboxes = <&ipcc2 2>;
>>>     mbox-names = "shutdown";
>>>     /* M0 watchdog */
>>>    interrupt-parent = <&intc>;
>>>    interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
>>>    /* M0 peripheral clocking (not accessible by the M0) */
>>>    clocks = <&scmi_clk CK_SCMI_GPIOZ_AM>,
>>>    <&scmi_clk CK_SCMI_GPIOZ>,
>>>    <&scmi_clk CK_SCMI_IPCC2>,
>>>    <&scmi_clk CK_SCMI_IPCC2_AM>,
>>>    <&rcc CK_LPTIM3_AM>,
>>>    <&rcc CK_LPUART1_AM>,
>>>    <&rcc CK_CPU3_AM>,
>>>    <&rcc CK_CPU3>,
>>>    <&rcc CK_LPUART1_C3>,
>>>    <&rcc CK_GPIOZ_C3>,
>>>    <&rcc CK_LPTIM3_C3>,
>>>    <&rcc CK_KER_LPUART1>,
>>>    <&rcc CK_KER_LPTIM3>,
>>>    <&scmi_clk CK_SCMI_GPIOZ>,
>>>    <&scmi_clk CK_SCMI_IPCC2>;
>>>    status = "okay";
>>> };
>>>
>>> If we want to remove the DT, we need to consider:
>>>
>>> - Mechanism to differentiate Cortex-M33 and Cortex-M0:
>>>     Similar to SCMI, the remoteproc OP-TEE service should support
>>>    multiprocessor setups without instantiating multiple services.
>>>
>>> - Mailboxes:
>>>
>>>     A phandle is needed because the mailbox driver is managed by the
>>>     Linux mailbox driver. STM32MP2 has two mailboxes.
>>>     Moving towards your proposal would imply creating a mailbox service
>>>     in TEE to manage non-secure mailboxes for non-secure IPC. This might
>>>     not be efficient for inter-processor communication. Hardware-wise, it
>>>     would require the IRQ to be handled by the secure context.
>>>
>>> - Memory regions:
>>>    - Hardware limitation: OP-TEE is limited in the number of memory regions
>>>      it can declare due to Firewall configuration. Moving IPC memory regions
>>>      reaches this limit. Currently, OP-TEE defines a single region with
>>> shareable
>>>      access rights, which Linux splits into at least three memory regions
>>> for RPMsg.
>>>    - Memory mapping: Memory regions still need to be declared in Linux to
>>> prevent
>>>      Linux from using them.
>>>    - Virtio/RPMsg: Memory region names are fixed (e.g., dev<X>vring<Y>),
>>> so OP-TEE
>>>     must declare memory regions in its DT according to Linux naming
>>> conventions.
>>>
>>> - Clock and reset:
>>>      Some clocks and resets are managed via SCMI, others are not. This
>>> would require
>>>     managing all clocks and resets through SCMI, with possible side
>>> effect on the
>>>     "unused" clock mechanism in Linux ( to be confirmed)
>>>
>>> - Power domain:
>>>     Information is needed at the Linux level to determine the low power
>>> mode.
>>>
>>> - Watchdog interrupt:
>>>     Should be managed by OP-TEE, which requires the hardware to have an
>>> associated
>>>     secure IRQ.
>>>
>>> - Miscellaneous vendor DT properties:
>>>      How to be sure that these can be addressed through TEE services?
>>>
>>> Regarding the existing DT needs, it seems to me that removing the DT
>>> would require
>>> moving all node resource management into TEE ( if really possible). This
>>> would
>>> increase TEE complexity and footprint, reduce system efficiency, and
>>> make supporting
>>> other platforms less scalable.
> 
> I can see your arguments regarding some DT properties which are hard to
> discover via OP-TEE service and I have been trying to think of how to
> handle it in a proper manner for a device on discoverable TEE bus. One
> of my fellow kernel maintainers pointed out that other discoverable
> buses in the kernel like PCI etc. already solved this DT dependencies
> via having device specific bindings. You can have a look at a one
> particular example of PCI device binding here [1]. In case of OP-TEE,
> you can have a similar device binding with UUID under the OP-TEE
> firmware DT node.
> 
> The current approach you are taking via probing device on platform bus
> and then trying to move onto TEE bus isn't at all the compatible with
> the driver model, it simply sets a bad example for the driver model.
> 
> [1] Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
> 

Thank you for your feedback. I am not very familiar with PCIe, so I need 
to take a deeper look at the implementation.

To help me better understand your expectations, could you please confirm 
if your proposal is close to what I have described below?


1) Device tree:
Notice that an intermediate ahb bus is used on ST platform for address 
conversion between remote processor address and local physical address
I will probably need to find a solution for that.


firmware {
    remoteproc_tee {
	compatible = "remoteproc-tee";
	mlahb: ahb {
	    compatible = "st,mlahb", "simple-bus";
	    #address-cells = <1>;
	    #size-cells = <1>;
	    ranges;
	    dma-ranges = <>;
	    m33_rproc@0 {
       		compatible = "st,stm32mp1-m33";
      		/* M33 watchdog interrupt */
      		interrupt-parent = <&intc>;
		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
		/* power domain management */
		power-domains = <&cluster_pd>, <&ret_pd>;
		power-domain-names = "default", "sleep";
		/* RPMsg mailboxes + M33 graceful shutdown request */
		mboxes = <&ipcc1 0x0>, <&ipcc1 0x1>, <&ipcc1 2>;
		mbox-names = "vq0", "vq1", "shutdown";
		memory-region = <&vdev0vring0>, <&vdev0vring1>,
				<&vdev0buffer>;
		status = "okay";
	    };
         };

	ahbsr: ahb@2 {
	   compatible = "st,mlahb", "simple-bus";
	   #address-cells = <1>;
	   #size-cells = <1>;
	   ranges = <>;
	   dma-ranges = <>;
	   m0_rproc@1 {
       		compatible = "st,stm32mp1-m0";
		mboxes = <&ipcc2 2>;
		mbox-names = "shutdown";
		interrupt-parent = <&intc>;
		interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
		/* M0 peripheral clocking (not accessible by the M0) */
		clocks = <>, <>;
     		status = "okay";
	   };
        };
     };
};

2) remoteproc_driver:
   - platform driver that registers a TEE driver with specified UUID
   - on TEE driver probing it parses sub device (reg property replacing
     st, proc_id property)
   - tries to open associated TEE session and in case of success
     probes associated rproc driver.

3) st,remoteproc drivers
   -  unique DT compatible, no secure-status use (legacy compatibility)
   -  need to add a mechanism to detect probing
      by the TEE bus, or directly probed by the ahb bus.


Thanks,
Arnaud

>>>
>>> That said, it probably also depends on the TEE implementation.
>>> And  we should support both. This could be done by introducing a second
>>> UUID.
>>> but in this case should it be the same driver?
>>
>> I am unsure how to move forward here. It seems to me that addressing Sumit's
>> request for a TEE without a device tree is not compatible with the current
>> OP-TEE implementation, at least for the STM32MP platforms.
>>
>> Perhaps the simplest approach is to abandon the effort to make this generic
>> and instead rename tee_remoteproc.c to stm32_tee_remoteproc.c, making it
>> platform-dependent. Then, if another platform wants to reuse it with OP-TEE
>> FFA or another TEE, the file can be renamed.
>>
>> Does this proposal would make sense to you?
> 
> No, we should try to avoid a vendor specific TEE driver especially if it's based
> on similar OP-TEE based service which should be able to abstract out the vendor
> implementation for the kernel.
> 
> -Sumit

