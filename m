Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9A72E11C6;
	Tue,  7 Oct 2025 13:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759845076; cv=fail; b=WIDliP1LOMjDf/MfEGC2EAHX24AynHDmQj19R/Q9hG/bYdw7GBqEbqQUuWOKySt7fkhTkjbg89sJK+1dtLfzMd0TwGplETha1X5zQYcugdeuL13y73ymPm3F6Di4Bgmj0utjMpVvolBbXXftHU8dO2Fqebq6GgPWS9an+yq1Qxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759845076; c=relaxed/simple;
	bh=63HNKoF+9U38V7OsZ3n4TqIh2Rc0nhpAYzv7red0t00=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=LEvSI9xpr4w/8bog9Lpuvs/YRFM8rgU6JiTYDNMgNqIh/UEem6rto5pcz03L7hD68QbSIyIgZvCTmHTDpezX/wkO0CY9NFZDhhUnm3/OezAQV4WID/9NG0/XxtXrC8OdENs8gpkjsmzFweGH13llmYJ/1uAnvcF5r6J4h9sUFy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=nt/Q98Pa; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="nt/Q98Pa"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597CcLjx002022;
	Tue, 7 Oct 2025 15:50:43 +0200
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11013057.outbound.protection.outlook.com [52.101.83.57])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49myucs53h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Oct 2025 15:50:43 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xy6FX0m3iYCYP1Zg/DGg5VlA/4qnUGN15Xkyoe4qpc76lmGn5s7QSvdVmAj2rqDbQvmoYnqNJNET9/ojVnZis4Rx9zfOnrEZ+3GZsIgdLdehDRDSxI+6GBL6rMm2g9yhzwfbpM4ECCOB6bl4QS4SeKxDD6U4SSfOVBzymw2amILu2cAFAvvjVnDXQuZD+VDGlSB6jWsR+BDbT0FhGs+eZWlHPiTJeEeBbcW1tqyaCq0X52VqEl0Iqcy/7E9KqL4B+M48RGQomtHKzFK1qGEgrAuHwoq8gtHc/VQrDRH9a2QfcVr4WQvJNngnko853wg7JI8LuxQERCofKZZDQ0srDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+kscynjedeA0dHNyctVoMd/GafjnM6r98Zw2CBukFZQ=;
 b=xh88gJdhS+ApOSE8hjm+/qBI1GRsg1Jw2FYuEKAZdaKJshGQjRsOQF/4OyeOFqC2xhKj8B77pJoQiEY/bCGSlQWwcVp6pBmrGLoj/d/94UFkcIJD6Mcxd7z5IJhLFvY1exdl0/lCXRdA0L5g9Q5qUPdNW4LJRnhUIO8EiH/Hke7jw9jqaJ7vgCVq37GNldM/j9maJ2s74eBEoabF1s0bwRMsUxZeeFfV0idTyphPkk+/9PCgnfCMAKqn6gybfFF+CoBtxaigZ3slEPxQO6BpIOc6nwU6OZ3/jb7X60ZHPhwGsp8lY7vLT0IMqiCEeGVRNxvRec8yif1W5IrF/3JTWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+kscynjedeA0dHNyctVoMd/GafjnM6r98Zw2CBukFZQ=;
 b=nt/Q98PagjcLPMpzH1/C2sjnv1T4lu/bCcc92n3OremHvJycTIbl1F+/f6AxYc9M+RlZa8HQHouMf2S+8+z3wktm3k8qqRSaMIuxDbWQrVj5jHxvenjrsFmMjXpPC6FiV+tjOgmO8YOSSUhyeNNaUIPL298a3fdyQxCCx1sMa5/PC0/Erfky6EaMdbJzHaMzt2GcBTV37HG9aQ170vKivSIpBQsLR/ZofN+fHNQawt9rq1QfNSQtgdonR0ohAum55i1MmE7HTIUq+QM02my16yjlw3xOY4OLl/k/3TBEW4vDpt343tjmB5hIlGc59mSh6YLXwVMQ59EW7nhkKSR+yg==
Received: from PAZP264CA0166.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:236::6)
 by VI0PR10MB8953.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:216::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 13:50:35 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:102:236:cafe::7d) by PAZP264CA0166.outlook.office365.com
 (2603:10a6:102:236::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.17 via Frontend Transport; Tue,
 7 Oct 2025 13:50:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.3 via Frontend Transport; Tue, 7 Oct 2025 13:50:34 +0000
Received: from EQNCAS1NODE3.st.com (10.75.129.80) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 7 Oct
 2025 15:48:14 +0200
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNCAS1NODE3.st.com
 (10.75.129.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 7 Oct
 2025 15:50:34 +0200
Received: from [10.252.28.134] (10.252.28.134) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 7 Oct
 2025 15:50:33 +0200
Message-ID: <f5b0e106-a731-461b-b401-1aa1f9892465@foss.st.com>
Date: Tue, 7 Oct 2025 15:50:32 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-stm32] [PATCH v19 4/6] dt-bindings: remoteproc: Add
 compatibility for TEE support
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
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
Content-Language: en-US
In-Reply-To: <0e5a44df-f60a-4523-a791-6318b3c81425@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F95:EE_|VI0PR10MB8953:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e1dec7e-cac1-4411-a6a3-08de05a87d76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ektyM3E0Q1QzQnI4bGFZKyt0dVB0UFlSNEZxaGhkMGM3YktvWXhFayt4djhR?=
 =?utf-8?B?OEQ3WExhZENkaTNRWnpkUWpkMlllZzhYUmtnRU9VQ3p3aEx6K21kejZiOVpR?=
 =?utf-8?B?bzkrQ0lyUEswd2hIclVzVStWMTNvNG01elRqRzJKSkxORmc0WnAwTDJFVm9O?=
 =?utf-8?B?ek8wQnZxaWR1NWdLdlluNkxSRzhrZUNnMFZNRm84dHB1L25haUpsTXRSbWY5?=
 =?utf-8?B?bXRpNm5nTVFxNjF2SE1ac0NoY2FFK083T3RXd3hLeitlZFFyRkd2c3RzTmYr?=
 =?utf-8?B?Ym9VOWxmMzVaU3pDVjRYbTMyc3NoZGdoMEk3SXZzV2xEYTBsU0NublA1Y3pi?=
 =?utf-8?B?bG1aY3NTY0VYVko2VU9tV1crZWdob1duWnFYZGU4SlcxSHJJV2Y4NlZEVTZ5?=
 =?utf-8?B?elk2UWlxMUFCZFZJeTQ4Sm1QeU11aEpVTkY4TVVudVNUa2s4RmdMZm94TERQ?=
 =?utf-8?B?c3VrNlk5R09mWVQzdDBURE0vUVEwV2FZRGV1SWI2bFVJcFF5NnErbEZQMSt1?=
 =?utf-8?B?OVJCbXdCQ04yQUhpVFY4L0V3cUV0S01lL0FleVpidCs3cTc1Znh4eVJkMmR3?=
 =?utf-8?B?T1FyQ2gzeEdrdHlWNVVta1pUdzZOdU9IMFdycjl0TFkxYjFoenNYZUNFMHlZ?=
 =?utf-8?B?NGJHdzU1NWxQZi81TkIxR2tRa0VZdm9WOWNDR1U4Qjh6cVUxcXBYaUV5Tzdu?=
 =?utf-8?B?MHlHWUFVeWNvcmtKTVR5L2NXRy9VMnVrazJzdWdJU3NmSnJlVlVvVUhYWlU0?=
 =?utf-8?B?aUZtRHBDVGhiQnVhVVVJc0J2YytkdWNpSitTYXpBNk5IaWw4ZHhkTWN3VzU4?=
 =?utf-8?B?YlVBUGVpejA3UFR2cE9UbjJiU3hzODZUR29PVjFEamUramthQzNYbVpGT1FW?=
 =?utf-8?B?UnYwd1JSUGd1QnVwZ3FHUFR0YTBoTFUrenBzT1RWUmI0RnR0MEMzR2hTTEJJ?=
 =?utf-8?B?ZXh4dndTTXh0UFRLdUMybWxuWk1NWG5zbUxZdldYV2w4WVljRUw0RkRDOFph?=
 =?utf-8?B?NlBGaC8wcnlvQWtZdDlSbzZMek1TQnZkTXp4bUdLSlVHc3pWNDhZUVZpMXAx?=
 =?utf-8?B?b2YzNHMyVTN6elJiWTVMaXJtTHI0YTdtQWZlUVRONEcrODIzbWYxQmlrVFdK?=
 =?utf-8?B?TlBHeFNrK3plcWl6OTcwa0hTdGdNVWlRdlFUUlpmaFdXa1FLYkRzNHBmNVc4?=
 =?utf-8?B?NkJsTjhvcmVPb1VwS2hpNXN6V0ZoNm9ST1kxNWpUR2FaUTRJUnJGS0VydUpU?=
 =?utf-8?B?VThOU1dLQStuQVpLQ0tLOVJ4bVZ6NnVMWDdrZkd1ZDREMG55MnhqSzZtOUJX?=
 =?utf-8?B?bGt5R0pWSStFYW05QWpmSkI4NkRlTUlWNjV5WE5WQ01FTEw3N1hudFBxeGJk?=
 =?utf-8?B?b0NYc1BFVndST2NpazJPVWp3U1JPK3d2L3VjUy9xbjFGMXFOWE1sbmpWeTA2?=
 =?utf-8?B?MDYvV0NZQmlBVFZ1elRzNVV3RnhOSHVEQzA1dEx1TUF4eXRHSnNFV3dnL09I?=
 =?utf-8?B?bGkvVkVCbnFTSDlCbmFBVFdoOTVHSkpkck5JZ1pKUmRoTHhsdUNVcTFZQVZ1?=
 =?utf-8?B?RGdoV0NhTDBKWXIwVEpRNTkxK1VIZTBRVHFTMzB5Zk11a2Z6OExiRXV2SFJh?=
 =?utf-8?B?M2VtbkhKY0s1MitYNlpqSjFGaU0rSmdaTWcxbjdrOEdBK3hrQWxkQmFGb3pv?=
 =?utf-8?B?eU8zMDVzQm52MytYdGxlYTdHa09wNVZuTFhidFZxcWZJR3RCODlJbGIwcVdq?=
 =?utf-8?B?YVpnMmo3UWtFK2NsTDRKRE9hek9OVE5jK2EwYmtTWEJ0bnliek1oRjNLck5l?=
 =?utf-8?B?MEFKWmZPTnpHM3IvUVFpR0ZraFJBZEZYRCtmdEJPdmQzb3AyczFZdXlHK1c0?=
 =?utf-8?B?eit0UHkvc3ZQYmxGcVlvQXFXMEJVRGM2Uy9KZnNEVk8wSHlmM1hycFM2eko5?=
 =?utf-8?B?MXVHVjFlSlJobkdLU1c1Rjd4eWtHS2Fqb0YxWHE5WVFtd29vRnZaUFpMeWpn?=
 =?utf-8?B?dm5qQzZlNmtHcGVTelA3cDV0UmJtZFg2aTVlNG9vNVRJL092U3RMTXIvUXli?=
 =?utf-8?Q?gOrBcV?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.43;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 13:50:34.9569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e1dec7e-cac1-4411-a6a3-08de05a87d76
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.43];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8953
X-Proofpoint-GUID: ME3Umm13hN8F5kY-kKM97F2ahdG3T_YJ
X-Authority-Analysis: v=2.4 cv=KrxAGGWN c=1 sm=1 tr=0 ts=68e51ab3 cx=c_pps
 a=j9DvOQ6BGrSku+OOwBPc6Q==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=ESwrQ9yjESUA:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=P-IC7800AAAA:8
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8 a=phlkwaE_AAAA:8
 a=ZNfEsUQXn-wfoG2fjfkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=d3PnA9EDa4IxuAV0gXij:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=uKTQOUHymn4LaG7oTSIC:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: ME3Umm13hN8F5kY-kKM97F2ahdG3T_YJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDA3MSBTYWx0ZWRfX03lwOTmGHI0g
 E9QkJiBKmEgbsEeU4GRijXA3GaLphqsdzVKHPutuysP4peYze8CxRNZ84W1q/CG5KIzmwVljIRT
 2EjxobuA1zhKWUWq9zbJyOR54d1GPyS49w1G3cI9Klw/RrigF+fVE7APbxTPNyNnbRXX2fjIeQC
 UdGJUMGN834KBOnJhMCP4sEhVxVls+3ujcYODa/LDVRftTtuR5P5PM+y4UqE+33G28lZv88l0bt
 H2HYgkf8rIbUJf5/uLH4Yl26nDkKDadf3lzvkD5sLyI0p4/fet7AFBM4chln7vXeXGNE6EsQC2/
 NfAR9ZpKIP/BLLINh2zLzQcBpUCqhspC6z/HxDSgBOB3NjwqYVVi3ZIdHMB3kBSQYAPfmYOSvnx
 DJd8HXWL1cZfgW/EmrgO/tK42mihiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510070071

Hello Bjorn, Mathieu, Sumit,

On 9/22/25 10:57, Arnaud POULIQUEN wrote:
> 
> 
> On 9/19/25 08:46, Sumit Garg wrote:
>> On Wed, Sep 17, 2025 at 03:47:40PM +0200, Arnaud POULIQUEN wrote:
>>>
>>> On 9/17/25 12:08, Sumit Garg wrote:
>>>> On Tue, Sep 16, 2025 at 03:26:47PM +0200, Arnaud POULIQUEN wrote:
>>>>> Hello Sumit,
>>>>>
>>>>> On 9/16/25 11:14, Sumit Garg wrote:
>>>>>> Hi Arnaud,
>>>>>>
>>>>>> First of all apologies for such a late review comment as previously I
>>>>>> wasn't CCed or involved in the review of this patch-set. In case 
>>>>>> any of
>>>>>> my following comments have been discussed in the past then feel 
>>>>>> free to
>>>>>> point me at relevant discussions.
>>>>> No worries, there are too many versions of this series to follow 
>>>>> all the
>>>>> past discussions. I sometimes have difficulty remembering all the
>>>>> discussions myself :)
>>>>>
>>>>>> On Wed, Jun 25, 2025 at 11:40:26AM +0200, Arnaud Pouliquen wrote:
>>>>>>> The "st,stm32mp1-m4-tee" compatible is utilized in a system 
>>>>>>> configuration
>>>>>>> where the Cortex-M4 firmware is loaded by the Trusted Execution 
>>>>>>> Environment
>>>>>>> (TEE).
>>>>>> Having a DT based compatible for a TEE service to me just feels 
>>>>>> like it
>>>>>> is redundant here. I can see you have also used a TEE bus based 
>>>>>> device
>>>>>> too but that is not being properly used. I know subsystems like
>>>>>> remoteproc, SCMI and others heavily rely on DT to hardcode 
>>>>>> properties of
>>>>>> system firmware which are rather better to be discovered dynamically.
>>>>>>
>>>>>> So I have an open question for you and the remoteproc subsystem
>>>>>> maintainers being:
>>>>>>
>>>>>> Is it feasible to rather leverage the benefits of a fully 
>>>>>> discoverable
>>>>>> TEE bus rather than relying on platform bus/ DT to hardcode firmware
>>>>>> properties?
>>>>> The discoverable TEE bus does not works if the remoteproc is probed
>>>>> before the OP-TEE bus, in such case  no possibility to know if the TEE
>>>>> TA is not yet available or not available at all.
>>>>> This point is mentioned in a comment in rproc_tee_register().
>>> For the discussion, it’s probably better if I provide more details on 
>>> the
>>> current OP-TEE implementation and the stm32mp processors.
>>>
>>> 1) STM32MP topology:
>>>    - STM32MP1: only a Cortex-M4 remote processor
>>>    -  STM32MP2x: a Cortex-M33 and a Cortex-M0 remote processors
>>>    At this stage, only the STM32MP15 is upstreamed; the STM32MP25 is 
>>> waiting
>>>    for this series to be merged.
>>>
>>> 2) OP-TEE architecture:
>>> - A platform-agnostic Trusted Application (TA) handles the bus 
>>> service.[1]
>>>    This TA supports managing multiple remote processors. It can be 
>>> embedded
>>>    regardless of the number of remote processors managed in OP-TEE.
>>>    The decision to embed this service is made at build time based on the
>>>    presence of the remoteproc driver, so it is not device tree 
>>> dependent.
>>>    - STM32MP15: TA activated only if the remoteproc OP-TEE driver is 
>>> probed
>>>    - STM32MP2x: TA always activated as the OP-TEE remoteproc driver 
>>> is always
>>> probed
>>>
>>> - A pseudo Trusted Application implements the platform porting[2],
>>>    relying on registered remoteproc platform drivers.
>>>
>>> - Platform driver(s) manage the remote processors.[3][4]
>>>    - If remoteproc is managed by OP-TEE: manages the remoteproc 
>>> lifecycle
>>>    - If remoteproc is managed by Linux: provides access rights to 
>>> Linux to
>>> manage
>>>      the remoteproc
>>>
>>>    - STM32MP15: driver probed only if the remoteproc is managed in 
>>> OP-TEE
>>>    - STM32MP2x: driver probed in both cases for the Cortex-M33
>>>      For the STM32MP25, the TA is always present and queries the 
>>> driver to
>>> check
>>>      if it supports secure loading.
>>>
>>>
>>> [1] https://elixir.bootlin.com/op-tee/4.7.0/source/ta/remoteproc
>>> [2] https://elixir.bootlin.com/op-tee/4.7.0/source/core/pta/stm32mp/ 
>>> remoteproc_pta.c
>>> [3]https://elixir.bootlin.com/op-tee/4.7.0/source/core/drivers/ 
>>> remoteproc/stm32_remoteproc.c
>>> [4]https://github.com/STMicroelectronics/optee_os/blob/4.0.0-stm32mp/ 
>>> core/drivers/remoteproc/stm32_remoteproc.c
>> Thanks for the background here.
>>
>>>> The reason here is that you are mixing platform and TEE bus for 
>>>> remoteproc
>>>> driver. For probe, you rely on platform bus and then try to migrate to
>>>> TEE bus via rproc_tee_register() is the problem here. Instead you 
>>>> should
>>>> rather probe remoteproc device on TEE bus from the beginning.
>>> The approach is interesting, but how can we rely on Device Tree (DT) for
>>> hardware configuration in this case?
>>> At a minimum, I need to define memory regions and mailboxes.
>> The hardware configuration in DT should be consumed by OP-TEE and the
>> kernel probes remoteproc properties from OP-TEE since it's an OP-TEE
>> mediated remoteproc service you are adding here.
>>>  From my perspective, I would still need a driver probed by DT that 
>>> registers
>>> a driver on the TEE bus. Therefore, I still need a mechanism to decide
>>> whether the remote firmware is managed by the secure or non-secure 
>>> context.
>> As I mentioned below, this should be achievable using the secure-status
>> property without introducing the new compatible:
>>
>> Kernel managed remoteproc:
>>     status = "okay"; secure-status = "disabled";     /* NS-only */
>>
>> OP-TEE managed remoteproc:
>>     status = "disabled"; secure-status = "okay";     /* S-only */
>>
>>> Another issue would be to be able to share the remoteproc TEE service
>>> between
>>> several platform remoteproc drivers, in case of multi remote processor
>>> support.
>> Making the TEE based remoteproc service independent of DT will surely
>> make it more scalable to other platforms too. Have a look at how OP-TEE
>> based HWRNG service scales across platforms.
> 
> Another important service is SCMI, which drivers use to manage clocks 
> and resets.
> These clocks and resets are declared in the Device Tree (DT). It seems 
> to me that
> in this case, we are closer to SCMI than to the RNG service.
> 
> I propose we discuss this based on a concrete example with the STM32MP25.
> Although not yet upstreamed, our plan is to manage signed firmware for the
> Cortex-M33 and Cortex-M0.
> 
> Please find below my view of the DT resources to address.
> 
> STM32MP25  Cortex-M33 and Cortex-M0 nodes:
> 
> m33_rproc {
>    /* M33 watchdog interrupt */
>    interrupt-parent = <&intc>;
>    interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
>    /* power domain management */
>    power-domains = <&cluster_pd>, <&ret_pd>;
>    power-domain-names = "default", "sleep";
>    /* RPMsg mailboxes + M33 graceful shutdown request */
>    mboxes = <&ipcc1 0x0>, <&ipcc1 0x1>, <&ipcc1 2>;
>    mbox-names = "vq0", "vq1", "shutdown";
>    memory-region = <&vdev0vring0>, <&vdev0vring1>, <&vdev0buffer>;
>    status = "okay";
> };
> 
> m0_rproc {
>    /* mailbox for graceful shutdown */
>    mboxes = <&ipcc2 2>;
>    mbox-names = "shutdown";
>    /* M0 watchdog */
>   interrupt-parent = <&intc>;
>   interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
>   /* M0 peripheral clocking (not accessible by the M0) */
>   clocks = <&scmi_clk CK_SCMI_GPIOZ_AM>,
>   <&scmi_clk CK_SCMI_GPIOZ>,
>   <&scmi_clk CK_SCMI_IPCC2>,
>   <&scmi_clk CK_SCMI_IPCC2_AM>,
>   <&rcc CK_LPTIM3_AM>,
>   <&rcc CK_LPUART1_AM>,
>   <&rcc CK_CPU3_AM>,
>   <&rcc CK_CPU3>,
>   <&rcc CK_LPUART1_C3>,
>   <&rcc CK_GPIOZ_C3>,
>   <&rcc CK_LPTIM3_C3>,
>   <&rcc CK_KER_LPUART1>,
>   <&rcc CK_KER_LPTIM3>,
>   <&scmi_clk CK_SCMI_GPIOZ>,
>   <&scmi_clk CK_SCMI_IPCC2>;
>   status = "okay";
> };
> 
> If we want to remove the DT, we need to consider:
> 
> - Mechanism to differentiate Cortex-M33 and Cortex-M0:
>    Similar to SCMI, the remoteproc OP-TEE service should support
>   multiprocessor setups without instantiating multiple services.
> 
> - Mailboxes:
> 
>    A phandle is needed because the mailbox driver is managed by the
>    Linux mailbox driver. STM32MP2 has two mailboxes.
>    Moving towards your proposal would imply creating a mailbox service
>    in TEE to manage non-secure mailboxes for non-secure IPC. This might
>    not be efficient for inter-processor communication. Hardware-wise, it
>    would require the IRQ to be handled by the secure context.
> 
> - Memory regions:
>   - Hardware limitation: OP-TEE is limited in the number of memory regions
>     it can declare due to Firewall configuration. Moving IPC memory regions
>     reaches this limit. Currently, OP-TEE defines a single region with 
> shareable
>     access rights, which Linux splits into at least three memory regions 
> for RPMsg.
>   - Memory mapping: Memory regions still need to be declared in Linux to 
> prevent
>     Linux from using them.
>   - Virtio/RPMsg: Memory region names are fixed (e.g., dev<X>vring<Y>), 
> so OP-TEE
>    must declare memory regions in its DT according to Linux naming 
> conventions.
> 
> - Clock and reset:
>     Some clocks and resets are managed via SCMI, others are not. This 
> would require
>    managing all clocks and resets through SCMI, with possible side 
> effect on the
>    "unused" clock mechanism in Linux ( to be confirmed)
> 
> - Power domain:
>    Information is needed at the Linux level to determine the low power 
> mode.
> 
> - Watchdog interrupt:
>    Should be managed by OP-TEE, which requires the hardware to have an 
> associated
>    secure IRQ.
> 
> - Miscellaneous vendor DT properties:
>     How to be sure that these can be addressed through TEE services?
> 
> Regarding the existing DT needs, it seems to me that removing the DT 
> would require
> moving all node resource management into TEE ( if really possible). This 
> would
> increase TEE complexity and footprint, reduce system efficiency, and 
> make supporting
> other platforms less scalable.
> 
> That said, it probably also depends on the TEE implementation.
> And  we should support both. This could be done by introducing a second 
> UUID.
> but in this case should it be the same driver?

I am unsure how to move forward here. It seems to me that addressing Sumit's
request for a TEE without a device tree is not compatible with the current
OP-TEE implementation, at least for the STM32MP platforms.

Perhaps the simplest approach is to abandon the effort to make this generic
and instead rename tee_remoteproc.c to stm32_tee_remoteproc.c, making it
platform-dependent. Then, if another platform wants to reuse it with OP-TEE
FFA or another TEE, the file can be renamed.

Does this proposal would make sense to you?

Thanks and Regards,
Arnaud

> 
>>
>>>>> Then, it is not only a firmware property in our case. Depending on the
>>>>> compatible string, we manage the hardware differently. The same 
>>>>> compatibles
>>>>> are used in both OP-TEE and Linux. Based on the compatible, we can 
>>>>> assign
>>>>> memories, clocks, and resets to either the secure or non-secure 
>>>>> context.
>>>>> This approach is implemented on the STM32MP15 and STM32MP2x platforms.
>>>> You should have rather used the DT property "secure-status" [1] to say
>>>> the remoteproc device is being managed by OP-TEE instead of Linux. Then
>>>> the Linux driver will solely rely on TEE bus to have OP-TEE mediated
>>>> remoteproc device.
>>>>
>>>> [1] https://github.com/devicetree-org/dt-schema/ 
>>>> blob/4b28bc79fdc552f3e0b870ef1362bb711925f4f3/dtschema/schemas/dt- 
>>>> core.yaml#L52
>>> My issue with this property is that this would break the 
>>> compatibility with
>>> legacy DT that only support loading by Linux
>> No, it's not a DT ABI break at all. It is always possible for a
>> hardware to be re-configured to change assignment of peripherals among
>> OP-TEE and Linux kernel.
>>
>>> As specified in [5] :If "secure-status" is not specified it defaults 
>>> to the
>>> same value as "status"; [5]
>>> https://www.kernel.org/doc/Documentation/devicetree/bindings/arm/ 
>>> secure.txt
>> This is mostly meant for peripherals that can be probed by both OP-TEE
>> and Linux kernel via DT. But here in case of remoteproc, there needs to
>> exclusive access control for either via Linux kernel or OP-TEE. Hence, 
>> the
>> "status" and "secure-status" properties should be updated accordingly.
>>
>>>>> More details are available in the ST WIKI:
>>>>> https://wiki.st.com/stm32mpu/wiki/OP- 
>>>>> TEE_remoteproc_framework_overview#Device_tree_configuration
>>>>> https://wiki.st.com/stm32mpu/wiki/ 
>>>>> Linux_remoteproc_framework_overview#Device_tree_configuration
>>>>>
>>>>>>> For instance, this compatible is used in both the Linux and OP- 
>>>>>>> TEE device
>>>>>>> trees:
>>>>>>> - In OP-TEE, a node is defined in the device tree with the
>>>>>>>      "st,stm32mp1-m4-tee" compatible to support signed remoteproc 
>>>>>>> firmware.
>>>>>>>      Based on DT properties, the OP-TEE remoteproc framework is 
>>>>>>> initiated to
>>>>>>>      expose a trusted application service to authenticate and 
>>>>>>> load the remote
>>>>>>>      processor firmware provided by the Linux remoteproc 
>>>>>>> framework, as well
>>>>>>>      as to start and stop the remote processor.
>>>>>>> - In Linux, when the compatibility is set, the Cortex-M resets 
>>>>>>> should not
>>>>>>>      be declared in the device tree. In such a configuration, the 
>>>>>>> reset is
>>>>>>>      managed by the OP-TEE remoteproc driver and is no longer 
>>>>>>> accessible from
>>>>>>>      the Linux kernel.
>>>>>>>
>>>>>>> Associated with this new compatible, add the "st,proc-id" 
>>>>>>> property to
>>>>>>> identify the remote processor. This ID is used to define a unique 
>>>>>>> ID,
>>>>>>> common between Linux, U-Boot, and OP-TEE, to identify a coprocessor.
>>>>>> This "st,proc-id" is just one such property which can rather be 
>>>>>> directly
>>>>>> probed from the TEE/OP-TEE service rather than hardcoding it in DT 
>>>>>> here.
>>>>> Do you mean a topology discovery mechanism through the TEE remoteproc
>>>>> service?
>>>>>
>>>>> For the STM32MP15, it could work since we have only one remote 
>>>>> processor.
>>>>> However, this is not the case for the STM32MP25, which embeds both a
>>>>> Cortex-M33 and a Cortex-M0.
>>>> I rather mean here whichever properties you can currently dicovering 
>>>> via
>>>> DT can rather be discovered by invoke command taking property name 
>>>> as input
>>>> and value as output.
>>> That would means services to get system resources such as memory region
>>> mailbox, right?
>> Yeah.
>>
>>>>> Could you please elaborate on how you see the support of multiple 
>>>>> remote
>>>>> processors without using an hardcoded identifier?
>>>> By multiple remote processors, do you mean there can be multiple
>>>> combinations of which remote processor gets managed via OP-TEE or not?
>>> On stm32mp25 we have 2 remote processors a cortex-M33 and a cortex-M0
>>> We should be able to manage them using the proc_idAnother point is 
>>> that We
>>> should allow an other Secure OS could implement the TEE remoteproc 
>>> service
>>> managing the remote processors with different proc_id values, to 
>>> avoid to
>>> specify somewhere an unique proc ID per remote processor.
>> Okay I see, so you can add unique proc ID to DT which gets consumed by
>> OP-TEE and Linux discovers the same via the TEE service.
> Yes the Linux passes the proc ID as argument of the 
> tee_client_open_session().
> In OP-TEE, the TEE service checks the match with the proc ID registered 
> by the
> OP-TEE remote proc drivers.
> 
> Regards,
> Arnaud
> 
>>
>>>>>> I think the same will apply to other properties as well.
>>>>> Could you details the other properties you have in mind?
>>>> I think the memory regions including the resource table can also be
>>>> probed directly from the TEE service too. Is there any other DT 
>>>> property
>>>> you rely upon when remoteproc is managed via OP-TEE?
>>> The memory regions that include the resource table are already declared
>>> in OP-TEE. The memory regions defined in the Linux device tree are for
>>> RPMsg (IPC). These memories are registered by the Linux remoteproc 
>>> driver
>>> in the Linux rproc core.
>>>
>> Sure, so they can also be discovered by TEE service.
>>
>> -Sumit
> 
> _______________________________________________
> Linux-stm32 mailing list
> Linux-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

