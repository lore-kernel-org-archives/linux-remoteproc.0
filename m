Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EC2168BD;
	Fri,  3 Oct 2025 07:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759477261; cv=fail; b=VrvJTk1eLxDxffd4DJBxE6FBzxesMhsrRwa0GmuK7rxFnYnTnD4Pb7fJxuLGhzhcH0tChkIYadmMyRH0eW28KeXnSEm3PtTsy68L0AKbIK4PeMc56HOPzeUD+xPe40jU2fnHlbhZ/3tydrX1uZPg6ybQSOJCyQeEql10fJq8b10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759477261; c=relaxed/simple;
	bh=sMQIWLqL5TsiD2XzwMzMa/r8WUwV2dsXEjM2n+3xqsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oG3TjpHBDqwWk1bWhVWH/eq0qxiHBCJocpFXS+NOF42tBXVmYKzSRahIUR7ua3mC5F/d4TBQ+BGDq36W2o5vQ6cwq+ii4uFy0zHrzHH64svU3ifixeVoTA7zoijv4NppBZIto9p64kCJcB/Yk2OTGIbAHPDFF1Soypw0pi5Ypn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=L4kdThQr; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="L4kdThQr"
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5933g8n8007031;
	Fri, 3 Oct 2025 09:40:18 +0200
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11011004.outbound.protection.outlook.com [52.101.65.4])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49e5bfh6fg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Oct 2025 09:40:18 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JuT9wdqpq/1PD8IW5hbxnw5BGQIrW/GsyZbu1/XVTbhb9l4h9WlaYSx24iuVSk+s+Egj94h/ObdxV0mXkWkAJCbUF9YniJYzTzpBoWitA2rYtfdBGVqvRcjKcuc3ENtPr3NmhKxqegJUr29Qb4R5PnCxvPg8+1naI2hfZ+65z0f9dh9AitGuKe8XOZbxLQzee+7/bYl8jSi37qq11FVpj9UpQ6MJUibgBJ9IcuF09yUEejPjBCUY09n8y1o+FcYvXAQUvyeKh4i/To6w2qgBM6QncahlGeZqCWtgmuL7dedPniQxPIBvQc5azWZW0GE6HOP2jiZQ484NRVVhrg+Xbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wvvJbjo3ujivUv27zsr0LlqWGK653skRHKZFPCJEjLY=;
 b=sCRLLuR7UqhLA6d8vkmSWXWEFi9CeZmrsZYiWFg7TgPjsgIgebKc7uUDl25CLpEbI33yzpsR4tsymhjlynF79dtFjfU4T62oP/luSYCkLvMsroM9Gbv+V5hykmZuxrg3Q6CU9V+ZCQBc5BhXUpkbG8EGpgzTcUjY5sVD6ZlPNthPR0F3htVaAKJzlG+NY+OydYV9UqVYfvYTxEDFCKHPxUBeF+g1un9PB8+ijQCMsDGfkWWW+WALMDWwHZGKVUa0rHkESP2G4z53SSKQCUPZx08UjHjqYTpofIgy/5cjq/yE9yK9NllOKlxS9Ku/XpcSbQWK1McMr2xlNlyUnONqrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=nxp.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wvvJbjo3ujivUv27zsr0LlqWGK653skRHKZFPCJEjLY=;
 b=L4kdThQrZHoO2OYJWaR7sGF6ldGzKWzpFV71ixo4vGxX+ZUHnJrCb1jPI0uFOE1Jr8/opZhZ/JWkZmT+hpMJt7zFNABwhbc7bJ6fglaLMvIqH9XCCWdGggcFHxIflSlSozkDtUl6T0RXaKsu7VWDjgP+fJAnvq+DJYXo0O0QjpImYUmMf/A4BEOHB6YHOsGftnVOhFG5lJQydB8jRHq4+Zmodr23eVeEg/QCunT+EatNSVYZC68FvDdIe6dihDCa1sWMLbnDcN0slSl1gip9N0aeOG52IciV0GHzmU1F7zX2wdy5pWOZW0LchTDjlXaXQUfkVBT5bzQJ8evajRl+NQ==
Received: from AS4P192CA0029.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::14)
 by DB9PR10MB7170.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:452::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 07:40:11 +0000
Received: from AMS0EPF00000197.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::a) by AS4P192CA0029.outlook.office365.com
 (2603:10a6:20b:5e1::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.16 via Frontend Transport; Fri,
 3 Oct 2025 07:40:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AMS0EPF00000197.mail.protection.outlook.com (10.167.16.219) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Fri, 3 Oct 2025 07:40:10 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 3 Oct
 2025 09:32:56 +0200
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 3 Oct
 2025 09:40:08 +0200
Received: from [10.48.87.127] (10.48.87.127) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 3 Oct
 2025 09:40:07 +0200
Message-ID: <86bf1252-9b2b-4001-830d-2746403539e6@foss.st.com>
Date: Fri, 3 Oct 2025 09:40:07 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>,
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
 Golaszewski" <brgl@bgdev.pl>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam
	<festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-imx@nxp.com>,
        <openamp-rp@lists.openampproject.org>
References: <20250922200413.309707-1-shenwei.wang@nxp.com>
 <20250922200413.309707-4-shenwei.wang@nxp.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <20250922200413.309707-4-shenwei.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000197:EE_|DB9PR10MB7170:EE_
X-MS-Office365-Filtering-Correlation-Id: 0220a96d-2436-46ef-ba1e-08de025014c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aXR5M3lBb3ZKRW9kUFR3QmtORDJlbnZqTDBZZDNOektCSGZ3ZGI2QS84Zi9V?=
 =?utf-8?B?OEtvaEVTRVVxdDBzUEFjRWlMWTNLVFMzaDVrWXQ3OWtYMG8xZjAxUlRkOEZ0?=
 =?utf-8?B?V0RuWkdpemNDSUZUL1RBUVF0dkNURDFFUlNlVWZlZVlXcS83a01YWElCRlVU?=
 =?utf-8?B?K3NRa3pBOFF4em1jajNPRWtEcm9ONFFYYXFkVVBhZENGek5weVRIMStnbmhq?=
 =?utf-8?B?OFA3SHdWY0xVaWxyL1VkejhsMWpCelp3ZVMzUndaZ0UwM3Y0K0h3RkEyaU0z?=
 =?utf-8?B?cXJNcXN1Vm5IU1I0eWswVFZ3WVczZSt6T1NGZTdNUjZLNW9KRmduNzQ4T1FB?=
 =?utf-8?B?bVJDRldvZlF4TTAxcFE5cVJKK0NTOFJLUEw3ZU1VSGt0Q2YweEtsY2tBWTE5?=
 =?utf-8?B?NWt5VkZKd3Z2RWF5bWpPQlJvek5VQllXSklRVGFOWVVRWXZPY2QvWFE4NHl1?=
 =?utf-8?B?VC9vbTFGOTJ2UHc5cGtPbDV0MGJNZThuZXkwRXZyWWZuKzdsL1Q1SGlZaTg1?=
 =?utf-8?B?V3pjT1hLeHVqUlplRlRoRytFZnR0YVk5K3JXTDVSeXRuYW4vR1dLMzA4Tlg2?=
 =?utf-8?B?S2IxUDZTOHB4aGwwZzZkTVFWQlQrSlpZQWRFRFVETllRVTZUaktKWXhOMmFW?=
 =?utf-8?B?K2NGTUlYTi8xQ2tCVngvdFR3RzRaWU5sVURaR3dEWXB4U3Y5Rnk2NU53OE5C?=
 =?utf-8?B?ZFluSWF3b0hHajBpSFd1VlNXdlVFQWh6UUNDUXI3VU1CUzBzWERvUFlNSWNE?=
 =?utf-8?B?UnppY1J6RzA2S21yQWl4dXpQaWpMUFNmSThEdkFaY0hVZDYwZXlYTmhLUW5C?=
 =?utf-8?B?ZW9NblRTK0lnckxwMTFFWjd6YUFjN09UT1J2czljZ2JYV1M2UkYrZklpekRt?=
 =?utf-8?B?US9LODJqV3VJM1h5S3lVS3AxUFVQR21NOUpuSmd0aXRLNTREaUlFQkxuQTE5?=
 =?utf-8?B?M3ExY0FlQjRQNHg3WWVKREFuaXdqb0gvYklFdWl2NUJ3ejVMWUpDRTZBVnEr?=
 =?utf-8?B?M2I5U3Bpd1RFZ0tnY2FkWlc3OTZqNkRSYjNZZUpwbForLzEvbjhiZDZ3SkRJ?=
 =?utf-8?B?MEhMR3dsNmpweEJ1QlhNNWxPeWxlWTkzV3hxNGdXazZoR293RlZCWlNCbmVY?=
 =?utf-8?B?d25sWlpQUU1tYVhDa2l3cnphRWx4WjNraWFyazVxejh1cTlFSUVCNEErUzZZ?=
 =?utf-8?B?blhRanRGUDZSVkdOWUN4Mi9oS09pVTZDTFl3YVloejc1b2QxbGVRUFhSMmVY?=
 =?utf-8?B?V2FtQk81eDRXRkxXcDhyTDIxUWp0eHVIMDgxemNKQ1Nwd1U2R1Q2d3g5MHRL?=
 =?utf-8?B?am8rWjBCTDVUdFpWeG90QTh1Mm9sOGFYbzdWRmZKVWxDZjh5TlBxQlJVZGZK?=
 =?utf-8?B?NWQzQUxCZ3doZlcrZHcrNVYxdUZsUVQzNXM3Vk80UUR2cm02VmZLSmpsSGxy?=
 =?utf-8?B?blF3Wk1jVVpGaEd2VytRN2ZlZ3N3MlB4MmVYSDhIK3VQKzllZEpaMVpySXlT?=
 =?utf-8?B?aVRZTEoyY1BBT09zRFVNYysvMjRqK1R0b3g4ZTFyUUQwcVgxYTB1TE8xMlpP?=
 =?utf-8?B?bUR5dUd3Qlg2VWU3cUIvMUxkWTArMk9vU3J6QzgwKzlFQkJmMWtmemlGRW1H?=
 =?utf-8?B?ZVhJd1BudkRvRjhPTndkYVZGTHk1MnpSNXpkVHo4dkx0V2FiaFRMQ2pkV09m?=
 =?utf-8?B?dThnaW94eGJGa2hQYkp6Z3dxbGptTzZHN0RRS2RsbUJLTUxQY3NVRHU4dWNi?=
 =?utf-8?B?enordVJTZ201NlB3LzlkcEUwNFBHc0VtZHM2ZWZHQmNwMzBxTDJqU3ZOdEt0?=
 =?utf-8?B?cHg0VTQzMjdvcGJKYml6ZHM4dlhXTFdtc2g5NDVZbDQ0dWxJQUR2MFN1N2Jq?=
 =?utf-8?B?YUg0dldtUDJOUDBWUXU3WjFQQzhiL05CRitINGVCYlptS2lWTzBWTUZocXpJ?=
 =?utf-8?B?b2t4bEZoak9NM3o5M0xPMFRvV056QWlHZmQvKzFhUVJQUkVldW5oTENBbkZi?=
 =?utf-8?B?VjZlR2FPZlBpWGE5MVRNS2VTTldiaG9QRmRrVEc0K3VDMmZxTXNidjJrdFBW?=
 =?utf-8?B?RVF6cGVZK1F0VlM2QStqZ1ZKM1cwRkNxZXVESGwyTm05RXNBeGl2aHNEMk8z?=
 =?utf-8?Q?eXdDg5CdVhAqdBieN6vRGFYcU?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.44;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026)(7053199007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 07:40:10.1599
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0220a96d-2436-46ef-ba1e-08de025014c7
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.44];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7170
X-Authority-Analysis: v=2.4 cv=L80QguT8 c=1 sm=1 tr=0 ts=68df7de2 cx=c_pps a=kUaKQbrk1EUcZEUbdnmukQ==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FOPVHIcnkjUA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10
 a=KrXZwBdWH7kA:10 a=NEAV23lmAAAA:8 a=8AirrxEcAAAA:8 a=DFuZZjthz0NyGPoCtLcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-ORIG-GUID: lZB8GegBQz8Rac_q2DNVdDvcIVFRIMDn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX5CO/Moq+zWT4 Eu85Eypm4ZEU3h2F3uMi6fAeRwA2hEpCi5CNP9oR/VUcGnqls9ZW5y3iv1U+ChAqHPbqkHaNcw9 eFVDkPRXPaN/UrOosWr8pyw30qqVN/wGDI1G8UScQFs0z+Wxczc7hVBEXW3TJYT3cu+7d5565XI
 8CFKbMOdSk/SKn6OrbJcUL1itRaqQJ+XVazjVZJL6J+eQxNEaHokCJImfCJ6iCbtOTCfmO1bvcv H6y0L3RHBGN1LteVEzOcInEfBtgDXY7kMpla742e1RKQD0F90ZKht+NxT4l7Dni5e7RMv3NgRUn 9s38mcTCxV2mIce5/+tLuDRPHSHKOGpTdK095WhvvvN3tYEsf46qTX9jEpbqhx1umIkcplmuwWB
 mKh0prkQHeAMM1k1XlJ3Z419C8aRig==
X-Proofpoint-GUID: lZB8GegBQz8Rac_q2DNVdDvcIVFRIMDn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_02,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2509150000 definitions=main-2509270001

Hello Shenwei,

On 9/22/25 22:04, Shenwei Wang wrote:
> On i.MX SoCs, the system may include two processors:
> 	- An MCU running an RTOS
> 	- An MPU running Linux
>
> These processors communicate via the RPMSG protocol.
> The driver implements the standard GPIO interface, allowing
> the Linux side to control GPIO controllers which reside in
> the remote processor via RPMSG protocol.

What about my request in previous version to make this driver generic?

In ST we have similar driver in downstream, we would be interested in
reusing it if generic. Indeed we need some rpmsg mechanism for
gpio-interrupt. Today we have a downstream rpmsg driver [1][2] that could
migrate on a generic rpmsg-gpio driver.

[1]Documentation/devicetree/bindings/interrupt-controller/rpmsg,intc.yaml
[2]https://github.com/STMicroelectronics/linux/blob/v6.6-stm32mp/drivers/irqchip/irq-rpmsg.c

My comment below is based on the assumption that it would become generic.

> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>   drivers/gpio/Kconfig          |  17 ++
>   drivers/gpio/Makefile         |   1 +
>   drivers/gpio/gpio-imx-rpmsg.c | 488 ++++++++++++++++++++++++++++++++++
>   3 files changed, 506 insertions(+)
>   create mode 100644 drivers/gpio/gpio-imx-rpmsg.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index a437fe652dbc..97eda94b0ba1 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1847,6 +1847,23 @@ config GPIO_SODAVILLE
>   
>   endmenu
>   
> +menu "RPMSG GPIO drivers"
> +	depends on RPMSG
> +
> +config GPIO_IMX_RPMSG
> +	tristate "NXP i.MX SoC RPMSG GPIO support"
> +	depends on IMX_REMOTEPROC
> +	select GPIOLIB_IRQCHIP
> +	default IMX_REMOTEPROC
> +	help
> +	  Say yes here to support the RPMSG GPIO functions on i.MX SoC based
> +	  platform.  Currently supported devices: i.MX7ULP, i.MX8ULP, i.MX8x,
> +	  and i.MX9x.
> +
> +	  If unsure, say N.
> +
> +endmenu
> +
>   menu "SPI GPIO expanders"
>   	depends on SPI_MASTER
>   
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 379f55e9ed1e..e01465c03431 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -83,6 +83,7 @@ obj-$(CONFIG_GPIO_I8255)		+= gpio-i8255.o
>   obj-$(CONFIG_GPIO_ICH)			+= gpio-ich.o
>   obj-$(CONFIG_GPIO_IDIO_16)		+= gpio-idio-16.o
>   obj-$(CONFIG_GPIO_IDT3243X)		+= gpio-idt3243x.o
> +obj-$(CONFIG_GPIO_IMX_RPMSG)		+= gpio-imx-rpmsg.o
>   obj-$(CONFIG_GPIO_IMX_SCU)		+= gpio-imx-scu.o
>   obj-$(CONFIG_GPIO_IT87)			+= gpio-it87.o
>   obj-$(CONFIG_GPIO_IXP4XX)		+= gpio-ixp4xx.o
> diff --git a/drivers/gpio/gpio-imx-rpmsg.c b/drivers/gpio/gpio-imx-rpmsg.c
> new file mode 100644
> index 000000000000..46b1b6b798c8
> --- /dev/null
> +++ b/drivers/gpio/gpio-imx-rpmsg.c
> @@ -0,0 +1,488 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright 2025 NXP
> + *
> + * The driver exports a standard gpiochip interface to control
> + * the GPIO controllers via RPMSG on a remote processor.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/rpmsg/imx_rpmsg.h>
> +#include <linux/init.h>
> +#include <linux/irqdomain.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/rpmsg.h>
> +
> +#define IMX_RPMSG_GPIO_PER_PORT	32
> +#define RPMSG_TIMEOUT	1000
> +
> +enum gpio_input_trigger_type {
> +	GPIO_RPMSG_TRI_IGNORE,
> +	GPIO_RPMSG_TRI_RISING,
> +	GPIO_RPMSG_TRI_FALLING,
> +	GPIO_RPMSG_TRI_BOTH_EDGE,
> +	GPIO_RPMSG_TRI_LOW_LEVEL,
> +	GPIO_RPMSG_TRI_HIGH_LEVEL,
> +};
What about taking inspiration from the|IRQ_TYPE|bitfield defined in|irq.h|?
For instance:
GPIO_RPMSG_TRI_BOTH_EDGE = GPIO_RPMSG_TRI_FALLING | GPIO_RPMSG_TRI_RISING,
> +
> +enum gpio_rpmsg_header_type {
> +	GPIO_RPMSG_SETUP,
> +	GPIO_RPMSG_REPLY,
> +	GPIO_RPMSG_NOTIFY,
> +};
> +
> +enum gpio_rpmsg_header_cmd {
> +	GPIO_RPMSG_INPUT_INIT,
> +	GPIO_RPMSG_OUTPUT_INIT,
> +	GPIO_RPMSG_INPUT_GET,
> +};
> +
> +struct gpio_rpmsg_data {
> +	struct imx_rpmsg_head header;
> +	u8 pin_idx;
> +	u8 port_idx;
> +	union {
> +		u8 event;
> +		u8 retcode;
> +		u8 value;
> +	} out;
> +	union {
> +		u8 wakeup;
> +		u8 value;
nitpicking put "value" field out of union as common
> +	} in;
> +} __packed __aligned(8);

Any reason to pack it an align it?
This structure will be copied in the RPMSg payload, right?

I also wonder if that definition should not be in a header file
with double licensing that the DT. Indeed this need to be
common with the remote side implementation  that can
be non GPL implementation.

> +
> +struct imx_rpmsg_gpio_pin {
> +	u8 irq_shutdown;
> +	u8 irq_unmask;
> +	u8 irq_mask;
> +	u32 irq_wake_enable;
> +	u32 irq_type;
> +	struct gpio_rpmsg_data msg;
> +};
> +
> +struct imx_gpio_rpmsg_info {
> +	struct rpmsg_device *rpdev;
> +	struct gpio_rpmsg_data *notify_msg;
> +	struct gpio_rpmsg_data *reply_msg;
> +	struct completion cmd_complete;
> +	struct mutex lock;
> +	void **port_store;
> +};
> +
> +struct imx_rpmsg_gpio_port {
> +	struct gpio_chip gc;
> +	struct imx_rpmsg_gpio_pin gpio_pins[IMX_RPMSG_GPIO_PER_PORT];
> +	struct imx_gpio_rpmsg_info info;
> +	int idx;
> +};
> +
> +static int gpio_send_message(struct imx_rpmsg_gpio_port *port,
> +			     struct gpio_rpmsg_data *msg,
> +			     bool sync)
> +{
> +	struct imx_gpio_rpmsg_info *info = &port->info;
> +	int err;
> +
> +	if (!info->rpdev) {
> +		dev_dbg(&info->rpdev->dev,
> +			"rpmsg channel not ready, m4 image ready?\n");
> +		return -EINVAL;
> +	}
> +
> +	reinit_completion(&info->cmd_complete);
> +	err = rpmsg_send(info->rpdev->ept, (void *)msg,
> +			 sizeof(struct gpio_rpmsg_data));
> +	if (err) {
> +		dev_err(&info->rpdev->dev, "rpmsg_send failed: %d\n", err);
> +		return err;
> +	}
> +
> +	if (sync) {
> +		err = wait_for_completion_timeout(&info->cmd_complete,
> +						  msecs_to_jiffies(RPMSG_TIMEOUT));
> +		if (!err) {
> +			dev_err(&info->rpdev->dev, "rpmsg_send timeout!\n");
> +			return -ETIMEDOUT;
> +		}
> +
> +		if (info->reply_msg->out.retcode != 0) {
> +			dev_err(&info->rpdev->dev, "rpmsg not ack %d!\n",
> +				info->reply_msg->out.retcode);
> +			return -EINVAL;
> +		}
> +
> +		/* copy the reply message */
> +		memcpy(&port->gpio_pins[info->reply_msg->pin_idx].msg,
> +		       info->reply_msg, sizeof(*info->reply_msg));
> +	}
> +
> +	return 0;
> +}
> +
> +static struct gpio_rpmsg_data *gpio_get_pin_msg(struct imx_rpmsg_gpio_port *port,
> +						unsigned int offset)
> +{
> +	struct gpio_rpmsg_data *msg = &port->gpio_pins[offset].msg;
> +
> +	memset(msg, 0, sizeof(struct gpio_rpmsg_data));
> +
> +	return msg;
> +};
> +
> +static int imx_rpmsg_gpio_get(struct gpio_chip *gc, unsigned int gpio)
> +{
> +	struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
> +	struct gpio_rpmsg_data *msg = NULL;
> +	int ret;
> +
> +	guard(mutex)(&port->info.lock);
> +
> +	msg = gpio_get_pin_msg(port, gpio);
> +	msg->header.cate = IMX_RPMSG_GPIO;
> +	msg->header.major = IMX_RMPSG_MAJOR;
> +	msg->header.minor = IMX_RMPSG_MINOR;
> +	msg->header.type = GPIO_RPMSG_SETUP;
> +	msg->header.cmd = GPIO_RPMSG_INPUT_GET;
> +	msg->pin_idx = gpio;
> +	msg->port_idx = port->idx;
> +
> +	ret = gpio_send_message(port, msg, true);
> +	if (!ret)
> +		ret = !!port->gpio_pins[gpio].msg.in.value;
Does this code is save?  !! return a boolean right?
why not force to 1 if  greater that 1?

> +
> +	return ret;
> +}
> +
> +static int imx_rpmsg_gpio_direction_input(struct gpio_chip *gc,
> +					  unsigned int gpio)
> +{
> +	struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
> +	struct gpio_rpmsg_data *msg = NULL;
> +
> +	guard(mutex)(&port->info.lock);
> +
> +	msg = gpio_get_pin_msg(port, gpio);
> +	msg->header.cate = IMX_RPMSG_GPIO;
Do you use a single rpmsg channel for several feature?
Any reason to not use one rpmsg channel per feature category?

> +	msg->header.major = IMX_RMPSG_MAJOR;
> +	msg->header.minor = IMX_RMPSG_MINOR;
> +	msg->header.type = GPIO_RPMSG_SETUP;
> +	msg->header.cmd = GPIO_RPMSG_INPUT_INIT;
> +	msg->pin_idx = gpio;
> +	msg->port_idx = port->idx;
> +
> +	msg->out.event = GPIO_RPMSG_TRI_IGNORE;
> +	msg->in.wakeup = 0;
> +
> +	return gpio_send_message(port, msg, true);
> +}
> +
> +static inline void imx_rpmsg_gpio_direction_output_init(struct gpio_chip *gc,
> +		unsigned int gpio, int val, struct gpio_rpmsg_data *msg)
> +{
> +	struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
> +
> +	msg->header.cate = IMX_RPMSG_GPIO;
> +	msg->header.major = IMX_RMPSG_MAJOR;
> +	msg->header.minor = IMX_RMPSG_MINOR;
> +	msg->header.type = GPIO_RPMSG_SETUP;
> +	msg->header.cmd = GPIO_RPMSG_OUTPUT_INIT;
> +	msg->pin_idx = gpio;
> +	msg->port_idx = port->idx;
> +	msg->out.value = val;
> +}
> +
> +static int imx_rpmsg_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
> +{
> +	struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
> +	struct gpio_rpmsg_data *msg = NULL;
> +
> +	guard(mutex)(&port->info.lock);
> +
> +	msg = gpio_get_pin_msg(port, gpio);
> +	imx_rpmsg_gpio_direction_output_init(gc, gpio, val, msg);
> +
> +	return gpio_send_message(port, msg, true);
> +}
> +
> +static int imx_rpmsg_gpio_direction_output(struct gpio_chip *gc,
> +					unsigned int gpio, int val)
> +{
> +	struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
> +	struct gpio_rpmsg_data *msg = NULL;
> +
> +	guard(mutex)(&port->info.lock);
> +
> +	msg = gpio_get_pin_msg(port, gpio);
> +	imx_rpmsg_gpio_direction_output_init(gc, gpio, val, msg);
> +
> +	return gpio_send_message(port, msg, true);
> +}
> +
> +static int imx_rpmsg_irq_set_type(struct irq_data *d, u32 type)
> +{
> +	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 gpio_idx = d->hwirq;
> +	int edge = 0;
> +	int ret = 0;
> +
> +	switch (type) {
> +	case IRQ_TYPE_EDGE_RISING:
> +		edge = GPIO_RPMSG_TRI_RISING;
> +		break;
> +	case IRQ_TYPE_EDGE_FALLING:
> +		edge = GPIO_RPMSG_TRI_FALLING;
> +		break;
> +	case IRQ_TYPE_EDGE_BOTH:
> +		edge = GPIO_RPMSG_TRI_BOTH_EDGE;
> +		break;
> +	case IRQ_TYPE_LEVEL_LOW:
> +		edge = GPIO_RPMSG_TRI_LOW_LEVEL;
> +		break;
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		edge = GPIO_RPMSG_TRI_HIGH_LEVEL;
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	port->gpio_pins[gpio_idx].irq_type = edge;
> +
> +	return ret;
> +}
> +
> +static int imx_rpmsg_irq_set_wake(struct irq_data *d, u32 enable)
> +{
> +	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 gpio_idx = d->hwirq;
> +
> +	port->gpio_pins[gpio_idx].irq_wake_enable = enable;
> +
> +	return 0;
> +}
> +
> +/*
> + * This function will be called at:
> + *  - one interrupt setup.
> + *  - the end of one interrupt happened
> + * The gpio over rpmsg driver will not write the real register, so save
> + * all infos before this function and then send all infos to M core in this
> + * step.
> + */
> +static void imx_rpmsg_unmask_irq(struct irq_data *d)
> +{
> +	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 gpio_idx = d->hwirq;
> +
> +	port->gpio_pins[gpio_idx].irq_unmask = 1;
> +}
> +
> +static void imx_rpmsg_mask_irq(struct irq_data *d)
> +{
> +	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 gpio_idx = d->hwirq;
> +	/*
> +	 * No need to implement the callback at A core side.
> +	 * M core will mask interrupt after a interrupt occurred, and then
> +	 * sends a notify to A core.
> +	 * After A core dealt with the notify, A core will send a rpmsg to
> +	 * M core to unmask this interrupt again.
> +	 */
> +	port->gpio_pins[gpio_idx].irq_mask = 1;
> +}
> +
> +static void imx_rpmsg_irq_shutdown(struct irq_data *d)
> +{
> +	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 gpio_idx = d->hwirq;
> +
> +	port->gpio_pins[gpio_idx].irq_shutdown = 1;
> +}
> +
> +static void imx_rpmsg_irq_bus_lock(struct irq_data *d)
> +{
> +	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +
> +	mutex_lock(&port->info.lock);
> +}
> +
> +static void imx_rpmsg_irq_bus_sync_unlock(struct irq_data *d)
> +{
> +	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	struct gpio_rpmsg_data *msg = NULL;
> +	u32 gpio_idx = d->hwirq;
> +
> +	if (port == NULL) {
> +		mutex_unlock(&port->info.lock);
> +		return;
> +	}
> +
> +	/*
> +	 * For mask irq, do nothing here.
> +	 * M core will mask interrupt after a interrupt occurred, and then
> +	 * sends a notify to A core.
> +	 * After A core dealt with the notify, A core will send a rpmsg to
> +	 * M core to unmask this interrupt again.
> +	 */
> +
> +	if (port->gpio_pins[gpio_idx].irq_mask && !port->gpio_pins[gpio_idx].irq_unmask) {
> +		port->gpio_pins[gpio_idx].irq_mask = 0;
> +		mutex_unlock(&port->info.lock);
> +		return;
> +	}
> +
> +	msg = gpio_get_pin_msg(port, gpio_idx);
> +	msg->header.cate = IMX_RPMSG_GPIO;
> +	msg->header.major = IMX_RMPSG_MAJOR;
> +	msg->header.minor = IMX_RMPSG_MINOR;
> +	msg->header.type = GPIO_RPMSG_SETUP;
> +	msg->header.cmd = GPIO_RPMSG_INPUT_INIT;
> +	msg->pin_idx = gpio_idx;
> +	msg->port_idx = port->idx;
> +
> +	if (port->gpio_pins[gpio_idx].irq_shutdown) {
> +		msg->out.event = GPIO_RPMSG_TRI_IGNORE;
> +		msg->in.wakeup = 0;
> +		port->gpio_pins[gpio_idx].irq_shutdown = 0;
> +	} else {
> +		 /* if not set irq type, then use low level as trigger type */
> +		msg->out.event = port->gpio_pins[gpio_idx].irq_type;
> +		if (!msg->out.event)
> +			msg->out.event = GPIO_RPMSG_TRI_LOW_LEVEL;
> +		if (port->gpio_pins[gpio_idx].irq_unmask) {
> +			msg->in.wakeup = 0;
> +			port->gpio_pins[gpio_idx].irq_unmask = 0;
> +		} else /* irq set wake */
> +			msg->in.wakeup = port->gpio_pins[gpio_idx].irq_wake_enable;
> +	}
> +
> +	gpio_send_message(port, msg, false);
> +	mutex_unlock(&port->info.lock);
> +}
> +
> +static const struct irq_chip imx_rpmsg_irq_chip = {
> +	.irq_mask = imx_rpmsg_mask_irq,
> +	.irq_unmask = imx_rpmsg_unmask_irq,
> +	.irq_set_wake = imx_rpmsg_irq_set_wake,
> +	.irq_set_type = imx_rpmsg_irq_set_type,
> +	.irq_shutdown = imx_rpmsg_irq_shutdown,
> +	.irq_bus_lock = imx_rpmsg_irq_bus_lock,
> +	.irq_bus_sync_unlock = imx_rpmsg_irq_bus_sync_unlock,
> +	.flags = IRQCHIP_IMMUTABLE,
> +};
> +
> +static int imx_rpmsg_gpio_callback(struct rpmsg_device *rpdev,
> +	void *data, int len, void *priv, u32 src)
> +{
> +	struct gpio_rpmsg_data *msg = (struct gpio_rpmsg_data *)data;
> +	struct imx_rpmsg_gpio_port *port = NULL;
> +	struct imx_rpmsg_driver_data *drvdata;
> +	unsigned long flags;
> +
> +	drvdata = dev_get_drvdata(&rpdev->dev);
> +	if (msg)
> +		port = drvdata->channel_devices[msg->port_idx];
> +
> +	if (!port)
> +		return -ENODEV;
> +
> +	if (msg->header.type == GPIO_RPMSG_REPLY) {
> +		port->info.reply_msg = msg;
> +		complete(&port->info.cmd_complete);
> +	} else if (msg->header.type == GPIO_RPMSG_NOTIFY) {
> +		port->info.notify_msg = msg;
> +		local_irq_save(flags);
> +		generic_handle_domain_irq(port->gc.irq.domain, msg->pin_idx);
> +		local_irq_restore(flags);
> +	} else
> +		dev_err(&rpdev->dev, "wrong command type!\n");
> +
> +	return 0;
> +}
> +
> +static void imx_rpmsg_gpio_remove_action(void *data)
> +{
> +	struct imx_rpmsg_gpio_port *port = data;
> +
> +	port->info.port_store[port->idx] = 0;
> +}
> +
> +static int imx_rpmsg_gpio_probe(struct platform_device *pdev)
> +{
> +	struct imx_rpmsg_driver_data *pltdata = pdev->dev.platform_data;
> +	struct device_node *np = pdev->dev.of_node;
> +	struct imx_rpmsg_gpio_port *port;
> +	struct gpio_irq_chip *girq;
> +	struct gpio_chip *gc;
> +	int ret;
> +
> +	if (!pltdata)
> +		return -EPROBE_DEFER;
> +
> +	port = devm_kzalloc(&pdev->dev, sizeof(*port), GFP_KERNEL);
> +	if (!port)
> +		return -ENOMEM;
> +
> +	ret = of_property_read_u32(np, "reg", &port->idx);
> +	if (ret)
> +		return ret;
> +
> +	if (port->idx > MAX_DEV_PER_CHANNEL)
> +		return -EINVAL;
> +
> +	mutex_init(&port->info.lock);
> +	init_completion(&port->info.cmd_complete);
> +	port->info.rpdev = pltdata->rpdev;
> +	port->info.port_store = pltdata->channel_devices;
> +	port->info.port_store[port->idx] = port;
> +	if (!pltdata->rx_callback)
> +		pltdata->rx_callback = imx_rpmsg_gpio_callback;
> +
> +	gc = &port->gc;
> +	gc->owner = THIS_MODULE;
> +	gc->parent = &pltdata->rpdev->dev;
> +	gc->label = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-gpio%d",
> +				   pltdata->rproc_name, port->idx);
> +	gc->ngpio = IMX_RPMSG_GPIO_PER_PORT;
> +	gc->base = -1;
> +
> +	gc->direction_input = imx_rpmsg_gpio_direction_input;
> +	gc->direction_output = imx_rpmsg_gpio_direction_output;
> +	gc->get = imx_rpmsg_gpio_get;
> +	gc->set = imx_rpmsg_gpio_set;
> +
> +	platform_set_drvdata(pdev, port);
> +	girq = &gc->irq;
> +	gpio_irq_chip_set_chip(girq, &imx_rpmsg_irq_chip);
> +	girq->parent_handler = NULL;
> +	girq->num_parents = 0;
> +	girq->parents = NULL;
> +	girq->chip->name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-gpio%d",
> +				 pltdata->rproc_name, port->idx);
> +
> +	devm_add_action_or_reset(&pdev->dev, imx_rpmsg_gpio_remove_action, port);
> +
> +	return devm_gpiochip_add_data(&pdev->dev, gc, port);
> +}
> +
> +static const struct of_device_id imx_rpmsg_gpio_dt_ids[] = {
> +	{ .compatible = "fsl,imx-rpmsg-gpio" },
> +	{ /* sentinel */ }
> +};
> +
> +static struct platform_driver imx_rpmsg_gpio_driver = {
> +	.driver	= {
> +		.name = "gpio-imx-rpmsg",
> +		.of_match_table = imx_rpmsg_gpio_dt_ids,
> +	},
> +	.probe = imx_rpmsg_gpio_probe,
> +};
> +
> +module_platform_driver(imx_rpmsg_gpio_driver);
This implementation seems strange to me.
You have a platform driver, but your RPMsg driver appears split between 
this driver
and the remoteproc driver, especially regarding the 
imx_rpmsg_endpoint_probe() function.

 From my point of view, this driver should declare both a 
platform_driver and an
rpmsg_driver structures.

Your imx_rpmsg_gpio_driver platform driver should be probed by your 
remoteproc platform.
This platform driver would be responsible for:
- Parsing the device tree node
- Registering the RPMsg driver

Then, the RPMsg device should be probed either by the remote processor 
using the name service
announcement mechanism or if not possible by your remoteproc driver.

To better understand my proposal you can have a look to [1]and [2].
Here is another example for an rpmsg_i2c( ST downstream implementation):
https://github.com/STMicroelectronics/linux/blob/v6.6-stm32mp/drivers/i2c/busses/i2c-rpmsg.c
https://github.com/STMicroelectronics/linux/blob/v6.6-stm32mp/Documentation/devicetree/bindings/i2c/i2c-rpmsg.yaml

Thanks and Regards,
Arnaud

> +
> +MODULE_AUTHOR("NXP Semiconductor");
> +MODULE_DESCRIPTION("NXP i.MX SoC rpmsg gpio driver");
> +MODULE_LICENSE("GPL");

