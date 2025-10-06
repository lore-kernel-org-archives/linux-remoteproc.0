Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71751F2BB5;
	Mon,  6 Oct 2025 09:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759744419; cv=fail; b=ibtpGxRVppqZgvEOwV4D7O13QZiQ3aZvxoG8ItxNoX4texmQ9FpV+dcU9kVL7yb5TL6k2C3Inpn0q4UISj9KjdPF6w9qSp4r4NYL59gghL0wJo/0ZKDrHm8c0MSjErhnNdPccRrFNxutdiicOBoFHr/HI3j+zTqxdaxN08JJ2iQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759744419; c=relaxed/simple;
	bh=27LA3nKxpyhIqNDfkf98LioJUHAGESK9D0UDKm6TgLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aNLQvIIINFw0uS8cW3z9VlHsPKHPJgK4yU6TSNTXCYqy8Lxp4xSd1x+1Aifi34xkTH9sQ+AFT1Xd8HwkElmFyBoDukdZBuybI2K/unPAtNNrbc9GPOinZKNr6syqBmFjRHF9ZaxogiMpoR3eoZAVrVKXtP2bBNozsKocxKlO78E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=i1UQH3zR; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="i1UQH3zR"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5969gqXH029081;
	Mon, 6 Oct 2025 11:52:58 +0200
Received: from mrwpr03cu001.outbound.protection.outlook.com (mail-francesouthazon11011056.outbound.protection.outlook.com [40.107.130.56])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49m8tprum6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Oct 2025 11:52:57 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kfSUb1fijAAqtv4ojyYTo/dwHJTTaPC3+fzNj+4Fomkh6vcl+l7Ew3Z/GKquLAYxWtVAhvLu0mvBAzlkBNh3+4J7GJV8AUN5qYZG6i3AHwzni/IwEJPwcugRogYYBizp03H/fS7tnTpUDnsRHadsycjX1+ed4nSneVPCQtJoHCIxXCKmLQ/lU6gVu1r0v521IdmqDJunOBWPBLuKAat+6rSCFlPuyyEHcNw1t7KQvqMam+Jf+vYHP0DV2rZmvYgqCFMR4eNOFAWLr+GhQX4fBXKoiQsDTJBDp6RiKW+hpSLpQZbaxgSYWJbrXAwwfBPB99W3HVrKArsoJ6AYXou4Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYxpqBWdAsTcpCfiN/crnzqJ4OiF1EJDF3d6viRDBsg=;
 b=WK2tnpLalaHpaDH9B4vAifOVCKz+I4HG+tIdt5sbCAswfU7Va5m6bF/kFmJ6GzmycP5kTEipF2F7K0rbyOtf7mPfQeMDRO1VWl2MgsEqhDikDUPXAhipiHNTaEilHBIboWw3qY36XbjzIyWIB+GiKvYTbC3b9vZ3Aee9vGOZk4W1V5ZMS27Byf/K9UVYHviJeI0ngSsDleetrc2p+dcyYHaQEA79rN43/TJ6N9Jqke9orUbZuBzTgqNWCGzH5mbT5qeg5Yk+nX5ctGjh9rac7f+tfqqqA/nMcRYlz9veWkRQPh5yx2u7YBsBxq7yeBhq/ESFBaKjR3xbUC39PJXNlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=nxp.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYxpqBWdAsTcpCfiN/crnzqJ4OiF1EJDF3d6viRDBsg=;
 b=i1UQH3zRweRYBuayBPbhsD62Ie4PA9Vu4f+QTwgidv/mODEnFZ+trc3QHv4mHCnL7o3MN35elOd+G4CUL3p/XvFMHHH6BJn//OeiFWclYN0kg5nZHF+Vus79DZes1khzmc9bDEHHcUA2pfA0dTt9wHg8ezMRIOq9CXB1SOb+GI4D9ZVS9Gp3SpSa5xoRDGfhU59HSj0O6q7oiB4pihTRZCLA8HxUI3v6+V3N1eELpVZkNecL9PdOP0ZspLb3TB0PQcuF9uqoGX/YhqzaNjKSZSRklpPHYtGPXJhXywScym29ms/w6QHS8o0ZIKjxa25y1rOxvWbawuL9yJ/gmw8EbA==
Received: from DUZPR01CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::11) by AS2PR10MB7082.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5ea::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 09:52:49 +0000
Received: from DB1PEPF000509F0.eurprd03.prod.outlook.com
 (2603:10a6:10:46b:cafe::50) by DUZPR01CA0024.outlook.office365.com
 (2603:10a6:10:46b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Mon,
 6 Oct 2025 09:52:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DB1PEPF000509F0.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Mon, 6 Oct 2025 09:52:48 +0000
Received: from EQNCAS1NODE4.st.com (10.75.129.82) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 6 Oct
 2025 11:45:36 +0200
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNCAS1NODE4.st.com
 (10.75.129.82) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 6 Oct
 2025 11:52:47 +0200
Received: from [10.48.87.127] (10.48.87.127) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 6 Oct
 2025 11:52:46 +0200
Message-ID: <5624965c-8d00-431b-92b4-cda4bf7cbd5b@foss.st.com>
Date: Mon, 6 Oct 2025 11:52:45 +0200
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
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <PAXPR04MB9185924ED129E87C77F34DCC89E4A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F0:EE_|AS2PR10MB7082:EE_
X-MS-Office365-Filtering-Correlation-Id: f1b8bf0d-801a-4a27-7319-08de04be1b7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014|921020|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEQ0dWVnZE9TZ2pyVDlTcXgzcUdWQ1hHa055TmNLdzhFRjRFam1sMmxURDhO?=
 =?utf-8?B?bG5PWFFZMzVsbzZoVnpUTFFZNVNROHFsYzZmbDh0N04zVk5QS3F5YjhITWRP?=
 =?utf-8?B?N0c2SXdKdXllLytJc3RlRTUwZzhYRk9XT3VuNTBFeDUrYnllZEhxdUdxK3Yy?=
 =?utf-8?B?cmFIU3JUNHN3NTdDRXhBWkxYQU5GSVd5L0o2SUJMZWVTaFFzWWFGb0dYQVB3?=
 =?utf-8?B?R0pkaDM5ODFEQVlXbWZDOUwvcTRVWkdEUkpMNjNLMG96TzhtQ2JWUno0Y2NB?=
 =?utf-8?B?RktQYjRRUjlpcEtiOVN4S01RemZsU2VLRFpHMWJ5YXF1a3dTOFlQVlV2TFg5?=
 =?utf-8?B?SnVkMFlaWWdaNDFJWXFJdGtyZ0VJRUMrMjZrbFE5ZEIxdEZwRVlhZEJoNzdo?=
 =?utf-8?B?WklzT0ZJc1BKakgvcVQwOTRWQURKeG9iWGk5eGN3TXp0VVRQQTE1WjViblVI?=
 =?utf-8?B?WjhZMHZiaTV3Zmt0dFdlZldFQmpYTGFmano0UUgySHRvTEp0YjNxUnEvUjhn?=
 =?utf-8?B?di84cy9mZzd6UXlxVC9RSXVxSWdyb1hzSUtLM1p2ODBORTRqSVpIU2Q3dy9O?=
 =?utf-8?B?THRscGwzOW5OZUU1UEFSdm4vUFh3cXJ4Z05sY0xzRHhUQXN5dUVFbkVpSEEz?=
 =?utf-8?B?SFVYaStjN0w1eTV6ZXowbW5SNzUzOWtVcUFQUGkwWXpYUkg0a0FrS1Z2UDlB?=
 =?utf-8?B?Kzk1S05FNCtnbEt6bE5aTXkzUDRpcVNGV1FtNlF1Q2dDcVV5bWcyVTV2cWUv?=
 =?utf-8?B?ZDZRNUt1R3VscDVSbytSWUl3SVhIdmlzeTZubUpEV0hFc1ZzT1J2KytnR2M1?=
 =?utf-8?B?cTFTQ0JoS3VsYUFlclEwaWZFdjhoM1ljYUtHZ1p0c052a3hmSFpLVm13ZjRT?=
 =?utf-8?B?RjZFeWN4NlUvSkE2MGZKclVhSU9QNkZaZlhyUHhaSFRNdzMrT0hMMjZHWHVZ?=
 =?utf-8?B?Q1JoZkZwU0ZEa21jYlo5RnZwYmttN2tZeVdxSFk0ODc4bk51UU1ha0ZPalJz?=
 =?utf-8?B?Ry9HVUZwb0ROVDN0WDliVW9WelhQOWtTUVNmSmZWVG9rSEM5ZWJZZ2xQMk9K?=
 =?utf-8?B?NzhjS0xEV0tjYkZHdjlMcFd2YXlXYVVNdzB1a0EveEl0QkVNR1FWbEt5T04w?=
 =?utf-8?B?MmxOMEFxU1EvR0hpQkFRenVlaVBIcTlDWTJBdjZ2UW5pY1YyUE5IcEpQdE9y?=
 =?utf-8?B?Q0UzSHpmSEhGY09pVnA2VDRKWm0vTUFGUkNEckFieWc0UUVqVEhRaEgzMFVv?=
 =?utf-8?B?U2dReVk0a3FkV0U2Y1pDNXlVZU4rTGt1TnZKQWtzd3FzNmNYclNrNXdIb1BT?=
 =?utf-8?B?bDhEdis5czFjUXFiMEI0SFl1LzQ4VGs5TjFRMXhzRjZWTEk1V1JOK2ViVVFl?=
 =?utf-8?B?VWIrNGZBN215T25vZGxaZmp2dkYvMTJ3ZmsxYUpHYUFhWWJSUmZSVXowN3du?=
 =?utf-8?B?YUtmRExzOU9ROXU5RnZoczBrdkF0N0RFZGNkaWRmTWJTNmZhZE80cGRDMVBG?=
 =?utf-8?B?NXEzbVNxeUNWSVZtU09peXp0RFRzVlNDZzVKdG9FK3N6cm96Z29nZVNld2tF?=
 =?utf-8?B?SFR4czVvamNmeXlXRGdYMXNYb3Q4dUMxSGxVeWZWSWdRWHUzVXlFd09rMjd0?=
 =?utf-8?B?VUxwYXJRd2dWRVQ2amFoTGgxS2lCQXR1ZFFqZi9QQkR0QjhoYWUyQ1VpWWM1?=
 =?utf-8?B?QUxMcFU2QXhodjl4VnI3Uy91QzE3Q0d2anMzTDhlczJEK0xYOU5wc1VZbmx2?=
 =?utf-8?B?TzVvRmhvOE41cmk5VXdsT2tyekczQXdPV1ZUN21tWlgzQ2h5Y1FWalAxaXVB?=
 =?utf-8?B?NUJNL0JCSE5wdjJDMGYyTkQrU2Y1NEV1aHlTVUZibVRsS3F0WlE5ajgrY0Vk?=
 =?utf-8?B?dENBMGJBTWF2eFVIaDdORmhSSUtOOVQ4NWNCMHpOWUJuMndFS0dQNUh3Qm5r?=
 =?utf-8?B?M3FTQ2UySi9SbTVud3lQV1NoQ0taRVc5V1NTaVZGMFFnRzQwTHZQTFU3SEFN?=
 =?utf-8?B?U1BOVGwzWXJEUi84MlRtRm9vUEVQcU4zOGNaSU5INDAwNEl5NTFxMk5VOUxo?=
 =?utf-8?Q?1m/7Iw?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.44;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014)(921020)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 09:52:48.3076
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b8bf0d-801a-4a27-7319-08de04be1b7a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.44];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7082
X-Authority-Analysis: v=2.4 cv=IemKmGqa c=1 sm=1 tr=0 ts=68e3917a cx=c_pps
 a=2do2WffBaarl803hjV/8Ow==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FOPVHIcnkjUA:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=m3SwsGHHAAAA:8
 a=8b9GpE9nAAAA:8 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=pGLkceISAAAA:8 a=TQXiUGyOF9kvmjcPXrwA:9 a=QEXdDO2ut3YA:10
 a=DYp5SbFa_7kaZNq9V1Ac:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=ST-jHhOKWsTCqRlWije3:22
 a=cvBusfyB2V15izCimMoJ:22 a=nl4s5V0KI7Kw-pW0DWrs:22 a=poXaRoVlC6wW9_mwW8W4:22
 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=SsAZrZ5W_gNWK9tOzrEV:22
X-Proofpoint-GUID: VpHFyfgbuxWxwJXTEZHntCTN5zHtAMCJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDA1MiBTYWx0ZWRfX7seEJuft3afP
 O/z1vmZhYng4J/yzaGEMvlXPiXVhtZloT6gpA5mk/YxEuJUsejWYZM2Mc4b5B0g0nrvIrg+VfCp
 i4HguQR2pJlDkiPY2kgMpHBc8p9mgLFihqEZD/3weYoXpIcUvagF3qghrV9FyL/tP9VJQaws4qh
 GsLLuKCJQDwvbavZUPq9GJELlDp4plSRilcco9YKw2GJtxL0KuV2CB3/4zVGCnWPEbTqTeIZ1T6
 5Cr/qxJLPfg1N1T8hkpi8K1jDlfIE1vLJ+o23lJixnbCyiyNQf88W2v7BxTv4YSFk43whyuz8hm
 Xvs4PuIK27z/JYJjZKfE4YoV/z5+Yu6NjeJr6yHdAxIyl/D156ffHBBBz2u9TaLQpBLDo8JfyrB
 ydkDv0o8I8J9/NCeKjY9oxMD9F+xHQ==
X-Proofpoint-ORIG-GUID: VpHFyfgbuxWxwJXTEZHntCTN5zHtAMCJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 spamscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060052



On 10/3/25 20:41, Shenwei Wang wrote:
> Hi Arnaud,
>
>> -----Original Message-----
>> From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
>> Sent: Friday, October 3, 2025 2:40 AM
>> To: Shenwei Wang <shenwei.wang@nxp.com>; Bjorn Andersson
>> <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Rob
>> Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor
>> Dooley <conor+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Sascha
>> Hauer <s.hauer@pengutronix.de>; Linus Walleij <linus.walleij@linaro.org>;
>> Bartosz Golaszewski <brgl@bgdev.pl>
>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>; linux-
>> remoteproc@vger.kernel.org; devicetree@vger.kernel.org; imx@lists.linux.dev;
>>> These processors communicate via the RPMSG protocol.
>>> The driver implements the standard GPIO interface, allowing the Linux
>>> side to control GPIO controllers which reside in the remote processor
>>> via RPMSG protocol.
>> What about my request in previous version to make this driver generic?
>>
> The only platform-dependent part of this driver is the layout of the message packet, which defines the
> communication protocol between the host and the remote processor. It would be challenging to require
> other vendors to follow our protocol and conform to the expected behavior.
>
>> In ST we have similar driver in downstream, we would be interested in reusing it if
>> generic. Indeed we need some rpmsg mechanism for gpio-interrupt. Today we
>> have a downstream rpmsg driver [1][2] that could migrate on a generic rpmsg-
>> gpio driver.
>>
>>> +
>>> +#include <linux/err.h>
>>> +#include <linux/gpio/driver.h>
>>> +#include <linux/rpmsg/imx_rpmsg.h>
>>> +#include <linux/init.h>
>>> +#include <linux/irqdomain.h>
>>> +#include <linux/of.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/rpmsg.h>
>>> +
>>> +#define IMX_RPMSG_GPIO_PER_PORT      32
>>> +#define RPMSG_TIMEOUT        1000
>>> +
>>> +enum gpio_input_trigger_type {
>>> +     GPIO_RPMSG_TRI_IGNORE,
>>> +     GPIO_RPMSG_TRI_RISING,
>>> +     GPIO_RPMSG_TRI_FALLING,
>>> +     GPIO_RPMSG_TRI_BOTH_EDGE,
>>> +     GPIO_RPMSG_TRI_LOW_LEVEL,
>>> +     GPIO_RPMSG_TRI_HIGH_LEVEL,
>>> +};
>> What about taking inspiration from the|IRQ_TYPE|bitfield defined in|irq.h|?
>> For instance:
>> GPIO_RPMSG_TRI_BOTH_EDGE = GPIO_RPMSG_TRI_FALLING |
>> GPIO_RPMSG_TRI_RISING,
> Yes, the suggestion is better.
>
>>> +
>>> +enum gpio_rpmsg_header_type {
>>> +     GPIO_RPMSG_SETUP,
>>> +     GPIO_RPMSG_REPLY,
>>> +     GPIO_RPMSG_NOTIFY,
>>> +};
>>> +
>>> +enum gpio_rpmsg_header_cmd {
>>> +     GPIO_RPMSG_INPUT_INIT,
>>> +     GPIO_RPMSG_OUTPUT_INIT,
>>> +     GPIO_RPMSG_INPUT_GET,
>>> +};
>>> +
>>> +struct gpio_rpmsg_data {
>>> +     struct imx_rpmsg_head header;
>>> +     u8 pin_idx;
>>> +     u8 port_idx;
>>> +     union {
>>> +             u8 event;
>>> +             u8 retcode;
>>> +             u8 value;
>>> +     } out;
>>> +     union {
>>> +             u8 wakeup;
>>> +             u8 value;
>> nitpicking put "value" field out of union as common
> I'm afraid we can't make it common, as the two 'value' fields serve different purposes-one is used for outgoing messages and
> the other for incoming messages-and they are located in different parts of the packet.
>
>>> +     } in;
>>> +} __packed __aligned(8);
>> Any reason to pack it an align it?
>> This structure will be copied in the RPMSg payload, right?
>>
> Yes. The message will then be transmitted via the MU hardware to the remote processor, so proper alignment is required.
>
>> I also wonder if that definition should not be in a header file with double licensing
>> that the DT. Indeed this need to be common with the remote side
>> implementation  that can be non GPL implementation.
>>
>>> +
>>> +struct imx_rpmsg_gpio_pin {
>>> +     u8 irq_shutdown;
>>> +     u8 irq_unmask;
>>> +     u8 irq_mask;
>>> +     u32 irq_wake_enable;
>>> +     u32 irq_type;
>>> +     struct gpio_rpmsg_data msg;
>>> +};
>>> +
>>> +struct imx_gpio_rpmsg_info {
>>> +     struct rpmsg_device *rpdev;
>>> +     struct gpio_rpmsg_data *notify_msg;
>>> +     struct gpio_rpmsg_data *reply_msg;
>>> +     struct completion cmd_complete;
>>> +     struct mutex lock;
>>> +     msg->pin_idx = gpio;
>>> +     msg->port_idx = port->idx;
>>> +
>>> +     ret = gpio_send_message(port, msg, true);
>>> +     if (!ret)
>>> +             ret = !!port->gpio_pins[gpio].msg.in.value;
>> Does this code is save?  !! return a boolean right?
>> why not force to 1 if  greater that 1?
>>
> This approach is intended to simplify the implementation. Forcing  to 1 would introduce an additional condition check.
> I'm open to changing it if that's considered standard practice.
>
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static int imx_rpmsg_gpio_direction_input(struct gpio_chip *gc,
>>> +                                       unsigned int gpio) {
>>> +     struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
>>> +     struct gpio_rpmsg_data *msg = NULL;
>>> +
>>> +     guard(mutex)(&port->info.lock);
>>> +
>>> +     msg = gpio_get_pin_msg(port, gpio);
>>> +     msg->header.cate = IMX_RPMSG_GPIO;
>> Do you use a single rpmsg channel for several feature?
>> Any reason to not use one rpmsg channel per feature category?
>>
> The current implementation on the remote side uses a single channel to handle all GPIO controllers.
> However, this driver itself does not have that limitation.
>
>>> +     msg->header.major = IMX_RMPSG_MAJOR;
>>> +     msg->header.minor = IMX_RMPSG_MINOR;
>>> +     msg->header.type = GPIO_RPMSG_SETUP;
>>> +     msg->header.cmd = GPIO_RPMSG_INPUT_INIT;
>>> +     msg->pin_idx = gpio;
>>> +     msg->port_idx = port->idx;
>>> +
>>> +     msg->out.event = GPIO_RPMSG_TRI_IGNORE;
>>> +     msg->in.wakeup = 0;
>>> +
>>> +     return gpio_send_message(port, msg, true); }
>>> +
>>> +static inline void imx_rpmsg_gpio_direction_output_init(struct gpio_chip *gc,
>>> +             unsigned int gpio, int val, struct gpio_rpmsg_data *msg)
>>> +
>>> +static struct platform_driver imx_rpmsg_gpio_driver = {
>>> +     .driver = {
>>> +             .name = "gpio-imx-rpmsg",
>>> +             .of_match_table = imx_rpmsg_gpio_dt_ids,
>>> +     },
>>> +     .probe = imx_rpmsg_gpio_probe,
>>> +};
>>> +
>>> +module_platform_driver(imx_rpmsg_gpio_driver);
>> This implementation seems strange to me.
>> You have a platform driver, but your RPMsg driver appears split between this
>> driver and the remoteproc driver, especially regarding the
>> imx_rpmsg_endpoint_probe() function.
>>
> See my reply below.
>
>>   From my point of view, this driver should declare both a platform_driver and an
>> rpmsg_driver structures.
>>
>> Your imx_rpmsg_gpio_driver platform driver should be probed by your
>> remoteproc platform.
>> This platform driver would be responsible for:
>> - Parsing the device tree node
>> - Registering the RPMsg driver
>>
>> Then, the RPMsg device should be probed either by the remote processor using
>> the name service announcement mechanism or if not possible by your
>> remoteproc driver.
>>
> The idea is to probe the GPIO driver successfully only after the remote processor is online and has sent the name service announcement.
> Until then, the GPIO driver will remain in a deferred state, ensuring that all consumers of the associated GPIOs are also deferred.
> The implementation you provided below does not guarantee that the related consumers will be properly deferred. This is the most
> important behavior for a GPIO/I2C controllers.


As long as you keep the GPIO/I2C device as a child of the remote 
processor node,
you should not have deferred probe issues. 
The|of_platform_populate()|function ensures
that the I2C/GPIO devices are probed when the remote processor is started.
Calling|devm_gpiochip_add_data|in the RPMsg driver probe should also 
prevent such issues.

Regards,
Arnaud

>
> Thanks,
> Shenwei
>
>> To better understand my proposal you can have a look to [1]and [2].
>> Here is another example for an rpmsg_i2c( ST downstream implementation):
>> https://github.co/
>> m%2FSTMicroelectronics%2Flinux%2Fblob%2Fv6.6-
>> stm32mp%2Fdrivers%2Fi2c%2Fbusses%2Fi2c-
>> rpmsg.c&data=05%7C02%7Cshenwei.wang%40nxp.com%7C22a9c88be60b474e
>> 391008de02502ec7%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63
>> 8950740622597592%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRyd
>> WUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%
>> 3D%7C0%7C%7C%7C&sdata=6lCk20Qhb%2F0MTw0NFtto7tj7EFYwZ%2BlOR1F3
>> Qk7kQn8%3D&reserved=0
>> https://github.co/
>> m%2FSTMicroelectronics%2Flinux%2Fblob%2Fv6.6-
>> stm32mp%2FDocumentation%2Fdevicetree%2Fbindings%2Fi2c%2Fi2c-
>> rpmsg.yaml&data=05%7C02%7Cshenwei.wang%40nxp.com%7C22a9c88be60b4
>> 74e391008de02502ec7%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7
>> C638950740622612512%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnR
>> ydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D
>> %3D%7C0%7C%7C%7C&sdata=4Gva%2FpqP2u8T57XDxSDaoHhvDeJ%2Fo5HtAB
>> L9TY5gbDI%3D&reserved=0
>>
>> Thanks and Regards,
>> Arnaud
>>
>>> +
>>> +MODULE_AUTHOR("NXP Semiconductor");
>>> +MODULE_DESCRIPTION("NXP i.MX SoC rpmsg gpio driver");
>>> +MODULE_LICENSE("GPL");

