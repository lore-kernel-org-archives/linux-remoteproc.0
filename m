Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668EF2882DE;
	Tue,  7 Oct 2025 09:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759828640; cv=fail; b=sOMmTz1ny3FMWojjqRnkbRehZz6u8Ujr94+wNxfU+jSkSjO54Q2XtyM11VKpb30nEtp4E1TqcwjWYhIWQ9OL03uCpcI42jPhEwUhrWQmxYYYWFDSZfmZy/zP7dov/2wsEE3LN8ijFxi9+jvvwvmARDnXwSMsiGNLYviHesao9PA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759828640; c=relaxed/simple;
	bh=5OiO//DLxVKGGrJX+yhV+X0XJz0nJfvbJAmHI/Mh7VY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ro2Q3uML1pkz6AL/JLkPMsXKaSUuP3KpKO/VD3MgMFr4dld+yCjYac3VJRPUtAEn2kdYM6AzNBrBO51xrdXgHftJ4Rz4SgC3g/LXhosYUAI1g9NpL2rWGy4GAqJxye6NKtRLtifkd9VF2LZ1dmN5G76Wqy9He+y9mUNhKa9zsxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=GMFa+SxX; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="GMFa+SxX"
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5979FghQ028736;
	Tue, 7 Oct 2025 11:16:39 +0200
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11012054.outbound.protection.outlook.com [52.101.66.54])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49m8tfwd5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Oct 2025 11:16:39 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GLUSVNoDFd9Itq6MxOiNQU40tMwTWtTTdbfSESC8a8cVM9DLdqp75aVyPeYVgynSmbVTDsIzuAoIIr6Xkbgq3/+pVNKIMV2V4XK8uWZaKuyzQIjLTk8MghZITc7YemmnMGnk/9kAFtPMK4Tiv+mN2Fn4zHA8c6COc2mbzUPKQwpcdcwxmz9EVr8QH9nFJS1nlvH4C9F5Chi34QF73Q/9R2K/qsRk2BC7+41kBFroCs6/OqVEEEhiX2HDyHd70/pdOQU3fgQQ75OA9/cVnlOZ+rH1maCq4wIVd77tsUaw0MTqclApHIohQGrwUblIRbpPOTXOxWvqGf+Z8c6V/yATtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rz8rFEWE3S1ILP8GTJ3gYLvn/TIHe+W46b/G0WcWo4s=;
 b=miyKT66NlGOkhpHPdoNZQgRrOveMa4cIPUF1yrN/BWE3Qk27pqlRr4Yie7+WCBFdu2FjCYjpoJZRwLJg6bA2OHLe6K0UhtOWVslfOnCEXg6y6SpkLEX0eKgKi2q7dJr0Q8I/VAySveAWR8+26Lf8kD/0UFf+3wX+rHyI1v3tdAcRnZPZSUL4Kzf7/qhxpecaMeb9QrBSPbzKGii218EYBLVuoYGOz9ywLQMPF+z6snbwoz9JGtKOWWFOaRvEdoReoDV91TIAfeBxDa5M0NHd7gFjCq19cxmJusq7qqZmxZIKnVup6h20dSagsdrvrxH/wbPu074nB6CwVY/meUWRQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=nxp.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rz8rFEWE3S1ILP8GTJ3gYLvn/TIHe+W46b/G0WcWo4s=;
 b=GMFa+SxXefLgNaOxHzrO/4HfmfhQ2LX9FhSJXAZ30wRAuSzdOu+TT0+tYv6cSN5WRzUrZhpl7KjngZ+w7RBLXNNO8crwD3o54WKNpEFjJpjs7/7iKm1ak3jrZDpHi34gA94MHuDGh9nHaoU00FH34SZIfGkufr4/cmdfvdvKGsooB6K0nXx+6nU2iVVsG/IswU02FTZPRtNLIJXX1Ky08TpaYjgm3Wz0O0TU+9E8q7V3qG20A1LcVzd/KIgIJoU/NqVVOdumouVerjNw8AQEcw90GeDHUpgdYhMn+VXeH7dZQvTt9mbqO93mEL2l1AljFifL0hmiO62h+ZpsxMTzGw==
Received: from CWLP265CA0431.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d7::7)
 by DB9PR10MB5188.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:33f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 09:16:30 +0000
Received: from AMS0EPF000001A2.eurprd05.prod.outlook.com
 (2603:10a6:400:1d7:cafe::a6) by CWLP265CA0431.outlook.office365.com
 (2603:10a6:400:1d7::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Tue,
 7 Oct 2025 09:16:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AMS0EPF000001A2.mail.protection.outlook.com (10.167.16.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Tue, 7 Oct 2025 09:16:29 +0000
Received: from SHFDAG1NODE2.st.com (10.75.129.70) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 7 Oct
 2025 11:09:19 +0200
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 7 Oct
 2025 11:16:29 +0200
Received: from [10.252.28.134] (10.252.28.134) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 7 Oct
 2025 11:16:28 +0200
Message-ID: <2407526e-0c6a-43fb-8158-f3e5cbbcdd3d@foss.st.com>
Date: Tue, 7 Oct 2025 11:16:26 +0200
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
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "openamp-rp@lists.openampproject.org" <openamp-rp@lists.openampproject.org>
References: <20250922200413.309707-1-shenwei.wang@nxp.com>
 <20250922200413.309707-4-shenwei.wang@nxp.com>
 <86bf1252-9b2b-4001-830d-2746403539e6@foss.st.com>
 <PAXPR04MB9185924ED129E87C77F34DCC89E4A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <5624965c-8d00-431b-92b4-cda4bf7cbd5b@foss.st.com>
 <PAXPR04MB91857A02029EB7F923C5767F89E3A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <PAXPR04MB91857A02029EB7F923C5767F89E3A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A2:EE_|DB9PR10MB5188:EE_
X-MS-Office365-Filtering-Correlation-Id: 117bc186-d106-4884-351d-08de0582336f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S2dxdjlCSmhHSXlUdXV2d3hqR1gwMjBoNVhIRTdFcStnMXRyOC9VYUdrcElq?=
 =?utf-8?B?VGtXcFNWU3lqREV4c0l1VVU0a3MxK3NUNzQ4bVRwWEtDMnlQUWJ3Z1l0Um1I?=
 =?utf-8?B?Rm9sd3VWanZMNXZWRUJ5ZE4zOUJ1YW1GbFQ4VFl6ckNjWHVLbDZ2SDNQN0da?=
 =?utf-8?B?MkVjcjJKdzkzVGR3NXJDZmh1VnFPeDFQRlNhQ1pNbkJDQ0FJc0toUEcwQXdT?=
 =?utf-8?B?MGZYRTNIU2xzUkZySlpLRTBHaUl6SHI4V0ZwZ0tBQ2ZDb1RyZmNuUmFWa1hH?=
 =?utf-8?B?eS80RzJtdm1IZHhVakhPLzZienJvdzRWQVREMzZjNjlaVFJhUHdscThTdGFp?=
 =?utf-8?B?TkE0NWtRRXIyR2QxWVNKNEc4bUFPZEhpTzdZQk04V3RDU0pSdlNmNEJOTjRo?=
 =?utf-8?B?WFBSRmdnTnU1UzlBRWNONnZnOU5IbWhzM1ZXajRXWlZvY0hBOFZvOGJaeG9Y?=
 =?utf-8?B?T0NqL3llRkV6ck5Ccm1jOTBERld5SU1NeEZZV2FpclVNTnl2WkZrRjB2WGlC?=
 =?utf-8?B?cmNiSmd3MVNtakJReWVJZ1ZJR1NXNHlzSFh4c1dwYmZyMUVxbXV4anViOEFr?=
 =?utf-8?B?d0M3M1NMK1h5UGFOUXNUU0JyZUZkVVA2T2R4WjYwb3FQM1Vld29wT1h0U3dh?=
 =?utf-8?B?T2ZkY2J2bDkrbjFVM1hhSjBNemJpYU1pT1NQTzl6QXVFNFZaeGxoYThDUnVJ?=
 =?utf-8?B?SERUa2dYSW1pR3luMnNRSVpSNndCZEZtd3ZzRWxLbEEwNlVQWGFoaS9CLzZV?=
 =?utf-8?B?anp3SVE3N29XaVlzZ0lMWCtFNWgxMEpCeDJlWVpGY2djb1pVODFWa1hVWWJI?=
 =?utf-8?B?eVc1cytqd0M2Q0VaNko5OWVIU1hlWmdNWFpENi9pV3lnV1VvdS9NcEhvUDlU?=
 =?utf-8?B?WXhLb04ycTVQY0hGVmpGL2F4T1BocDk0OXIrK0pWeFM2RHdTVGdGYklyVFVP?=
 =?utf-8?B?K3pLQU9IU3F2Ri8vVEZMd1Blcks3djY2aTFaaFZuWGlzVDcyV2xuaEpMZzhE?=
 =?utf-8?B?YTVWUVNZbkdtdUM5MlNoUEI4ZjdXd3BoVmlHcXovZ3pqV0wzdDFteTdpeDZY?=
 =?utf-8?B?UCs3WXllQ2ZreFBhRUlFTHN4UWVSQUllR0FvQ1VYVUR5enY5T0ZvOWFhT0hm?=
 =?utf-8?B?RmlJaHNoRFVXUFBSKyswZmdsWkw3cDNIYlNyRTlIS2grY1NubmhRY3F5NW9t?=
 =?utf-8?B?VFpBQlkzb2hMZWMrZEN2dEdXUlpCS3h6SGhZYzZabVdreWRZc2pQMS9WN1oz?=
 =?utf-8?B?OUxDUXZPVE0vcFczeEg0b3hTZU5TZFVRdFk3cEs1aW4wUmljbTU3VEtuTmo4?=
 =?utf-8?B?WS9LelhxNUZnS3QyQnExNGJESDI5dzJWWGlLZzhjemdqc3BiRUEyWFR0a3NG?=
 =?utf-8?B?V2hqa3FMUWRScCtMK0xIdnFrblo0MElpanFNYzlyZmdiOTBQTnRmWTFzR2pV?=
 =?utf-8?B?MStyQzBEMytxNFpQY1lMY2xtaWxGa2NPaXdEWThRSU04QkFVRDRmR3pyaHl5?=
 =?utf-8?B?UFpaZ0RETUkvMWdzRUtLQ2dBTEJwS1BpYko5bGhRL1RHVjNCQnJnVCtPYVBG?=
 =?utf-8?B?MklicVVTTmR3Mk1wcVk4WE03QWN4MURTRzFVb2Q4bCtWY2tEeHIzL0lqRy9G?=
 =?utf-8?B?dHZpUHR6SHI5OExtaldEend1NzJ1NHY3RDJRbndnY0RkTlhKcnBGd2hWSFdj?=
 =?utf-8?B?NGt1RzhvaW5pQ2tnaWpJWlNaWndrTXdMbGFKU09GdVZhUkV5dXB4dlF5cXZP?=
 =?utf-8?B?eFY0TlVlMTdBS2VFQUpQREd2clVtUi82ejhNRUxWRmpLaW1nTGNVSHVEUFVY?=
 =?utf-8?B?VE1pTWRJaGpaTkpiOXRHYUZzak1EMHFTTDVpaEFCK2pQcXViTHMrYjIrWGxv?=
 =?utf-8?B?SkpaT2NieWk3V3FFOVhvT0JCdFgxc052WUlvZ3lrZStmQ3gzWStyUEh6VGkv?=
 =?utf-8?B?QVlRMmJLRHZDYmg2REVYRDk0N2RKekNYYkFwZU1SYnV4NVpCSktScmpjSG9Z?=
 =?utf-8?B?a2xIenl1RkxJMkZDQTJyWFgwV2tWY0M3SjJRQkZUbmd5TDZVVmkvSHNFMEFI?=
 =?utf-8?B?ZmN2VnBWMzVhU3dDM21UVmtJZWtVdlJjZGdxY2kxN2ozRitnZUR5YWNpYTZH?=
 =?utf-8?Q?Tcno4aj4fY6J8fUjSabPdwh63?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.44;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026)(7053199007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 09:16:29.8790
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 117bc186-d106-4884-351d-08de0582336f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.44];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5188
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDA1MiBTYWx0ZWRfX13sNT8RVDshv
 AJaN+CksBroaq24ec8teMKQ5pUWQmTIZFiTKOM1OCDuFYkS4iGzfFUIA6VnWCBpGPO9RWvmTY5T
 sBvknxekkO8wr1ddhULSDyjEZOT0CGt0upu96cIK7IcDvNubL45SWaopwJs9Zm0AS7EqQsKai43
 LjgMxU1MoVvs1dQSsBlUxf5n/7CtPwdJyPtkImG+PH6kBzKuv99QcBgHI7PnYou4FWlB1E8xHG/
 ts8Ck5MEhkDS6FmXa0sn9Eo55dyGL4DcikyjKUJmxJE8IXvtknoBZ1tb098oIMEX+GBa8ONENY/
 5SSS0UIa9EbNbjM0HzR36lChY3zgMy/fiUVlRsIxmmuEBhAtQw0dz8iYFxMQ6wwxiNTdNP9hYCn
 Nkrm1oDx2490Hqqs8rPFwn+z8fY51g==
X-Proofpoint-GUID: YyIlyi0-pyi1LVGdPVHuHYpTYzeRHVe1
X-Authority-Analysis: v=2.4 cv=SradKfO0 c=1 sm=1 tr=0 ts=68e4da77 cx=c_pps
 a=TPI4aLKDjCd1EbHbt8/hbw==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=ESwrQ9yjESUA:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=UqCG9HQmAAAA:8
 a=8b9GpE9nAAAA:8 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=pGLkceISAAAA:8 a=JfrnYn6hAAAA:8 a=tTYLrvd-AAAA:8 a=tfbBaiPEkL9PUVf-EVUA:9
 a=QEXdDO2ut3YA:10 a=A-dFT-Y9hpcA:10 a=T3LWEMljR5ZiDmsYVIUa:22
 a=ST-jHhOKWsTCqRlWije3:22 a=cvBusfyB2V15izCimMoJ:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=Kp3Hu5l1xlEECLySyoGM:22 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22
 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-ORIG-GUID: YyIlyi0-pyi1LVGdPVHuHYpTYzeRHVe1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060052

Hello Shenwei,

On 10/6/25 16:33, Shenwei Wang wrote:
> 
> Hi Arnaud,
> 
>> -----Original Message-----
>> From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
>> Sent: Monday, October 6, 2025 4:53 AM
>> To: Shenwei Wang <shenwei.wang@nxp.com>; Bjorn Andersson
>> <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Rob
>> Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor
>> Dooley <conor+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Sascha
>> Hauer <s.hauer@pengutronix.de>; Linus Walleij <linus.walleij@linaro.org>;
>> Bartosz Golaszewski <brgl@bgdev.pl>
>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>; linux-
>> remoteproc@vger.kernel.org; devicetree@vger.kernel.org; imx@lists.linux.dev;
>> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; dl-linux-imx
>> <linux-imx@nxp.com>; openamp-rp@lists.openampproject.org
>> Subject: [EXT] Re: [PATCH v2 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
>>>> Then, the RPMsg device should be probed either by the remote
>>>> processor using the name service announcement mechanism or if not
>>>> possible by your remoteproc driver.
>>>>
>>> The idea is to probe the GPIO driver successfully only after the remote
>> processor is online and has sent the name service announcement.
>>> Until then, the GPIO driver will remain in a deferred state, ensuring that all
>> consumers of the associated GPIOs are also deferred.
>>> The implementation you provided below does not guarantee that the
>>> related consumers will be properly deferred. This is the most important
>> behavior for a GPIO/I2C controllers.
>>
>>
>> As long as you keep the GPIO/I2C device as a child of the remote processor node,
>> you should not have deferred probe issues.
>> The|of_platform_populate()|function ensures
>> that the I2C/GPIO devices are probed when the remote processor is started.
>> Calling|devm_gpiochip_add_data|in the RPMsg driver probe should also
>> prevent such issues.
>>
> 
> Here, deferred probing is not an issue -it's an intentional feature. We need to ensure that all consumers of the GPIO/I2C controllers remain
> in the deferred state until the remote processor is fully online.
> 
> For instance, consider a regulator node that references a GPIO line from the RPMSG GPIO controller. The regulator will stay in the deferred state
> until the remote processor comes online and its services are announced and received.

I think there is a misunderstanding. My intention was just to mention
that in my proposal, the deferred mechanism should also work as
expected. This is the case for the rpmsg_i2c I mentioned as an example.
Anyway the main point here is to break the dependency between your 
remoteproc driver and the rpmsg GPIO driver. In your remoteproc
driver, you should just call of_platform_populate, and let's the 
compatible mechanism find the associated independent driver defined
in the rpmsg_gpio.c


 From my perspective the sequence should be
1) the remoteproc driver starts the remote processor
2) the remoteproc driver parses the child node with of_platform_populate
3) the rpmsg_gpio platform driver is probed by the of_platform_populate
     - parse the DT node and store configuration in data structure
     - register an rpmsg_gpio driver
4) the rpmsg gpio driver is probed (by the rpmsg bus).
     - register the GPIO and irq chips

Until step 4, the users should be automatically deferred

That said, regarding your implementation, the fact that you have created 
a single rpmsg endpoint for several rpmsg services complexify this 
approach , creating a dependency not only between rpmsg and remoteproc 
but also among rpmsg devices. Having a single rpmsg endpoint associated 
with a single rpmsg service would simplify things.

Of course, I am just sharing my opinion and expectations here. For the 
next steps, I will let the maintainers, Mathieu and Bjorn, provide their 
advice and guidance.

Thanks,
Arnaud

> 
> Thanks,
> Shenwei
> 
>> Regards,
>> Arnaud
>>
>>>
>>> Thanks,
>>> Shenwei
>>>
>>>> To better understand my proposal you can have a look to [1]and [2].
>>>> Here is another example for an rpmsg_i2c( ST downstream implementation):
>>>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit

