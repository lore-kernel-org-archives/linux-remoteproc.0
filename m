Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010058.outbound.protection.outlook.com [52.101.85.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13A42D9ECA;
	Sat, 11 Apr 2026 14:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775918856; cv=fail; b=Z57dBsywktOLMAkPqqTVufEnaBM42jyMB/B9ViiJA5jKY2/JyxUhVDYfBLGuSrHovkU/mD+WFv3PeSV7qcMJCrO1oRx+3jkBqqEVJprsxqxYs2Ln6sgA5rosncRAYAorGUX6cBz5ONDgmPRbqxscuk/uVfGtPw/eSTI9pwZwMNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775918856; c=relaxed/simple;
	bh=IHwf90yxDCNv8nX2Jm3ezNG99N/YKdaiFjA1+6OZy2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hS+cGEnDjqD53oNU12T4fnDqPNxyjJcYRPCVIrMTzhWiTGjf+RocAMZM+QY38eHADWkjCSHbWt5h82GrJT95YnMcAdHYBP4BnpJs9A1xyht8OGAjflcbNLpEO3ExuIp/Gc8rChbR5ZqEpj1MPlOBPbSoLDBaUmPOLqxO6nuUyyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Ufm8hsXW; arc=fail smtp.client-ip=52.101.85.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Ufm8hsXW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KD518OnW+olEairZBnZzhhAqwQqOIVBVYHL8BiuTiUoqr60oY3ZN+FBsEZOg2bPCQKc7tyujDvmRhJPro229Uu2/hCcA82mCjcGs4swe5W6ee5uiZlilp2vRGPs7fHJxg/QyxXqnlUXaxQJciaLrDLooJq+QSCEJgDcMkxQKt0Olh+z14kyJbKV5RzLoB4ksxz7Vy0cUTTU1ee+AJ/Nc6suPCZhTojyKEg0JVEjRuuv3g3ga/rGRQtB0e/ME82XdN5hsQUBeM5Rcc0x0/1mQc+dU57axKIB3x6ouSIfZFnZLE91KbWLam4aVkn+ZRSJdbHDw59Yn/cnHdIT67z8I1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRv+06m6nCgZMMCvLTj5KeyJDpLXM4NE+i0qYATy50g=;
 b=pIIrB4Zdr0Bf7i185/BvGIel3NiJG4ud711xdnd9AHQs5iCkm9PRHSSZ8ma/INBQuq0WwdYrYGmQpuJVCy3Gs0pDl/Dxo4U2Llk/0Xh3IMthCocxwdWQZlPFxny/9EkDTj4y9dw/7LjnvEzIn5FwmtaHMAkryxlOMmr7nhpcBXGoADUBv96ijQ1TPts+83reDRaXeBq3ccDHMmwH0Gm+LJtrQwMCLaiSTzIgPqcGnqHUysL4smzxDDExsnvyMeEUJkdn0m4bujVfjUnuSyxyIvp0QGyfSWiFpuTJGnpd4zcCF3gz/3F8PyZEVvPuVkIuPlla+/niADNnhdmRKlLypQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRv+06m6nCgZMMCvLTj5KeyJDpLXM4NE+i0qYATy50g=;
 b=Ufm8hsXW2MlKFqet9ROqxijhbLIU0Dt4SnxVHv/gizlslLrThNwHL7Cuf/C7sIG2aHG1H5NxEQwn2KQOWAi7aKyCOQL2quenKAqtsrP5VzyqzgymKT1+Mhu2qR/M/OxErFwKwbww7m0TBi+g6qh4T1Jj2Kcuoed4SF8dLKBeax0=
Received: from DS7PR03CA0059.namprd03.prod.outlook.com (2603:10b6:5:3b5::34)
 by CH2PR10MB4357.namprd10.prod.outlook.com (2603:10b6:610:a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.45; Sat, 11 Apr
 2026 14:47:31 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:5:3b5:cafe::2a) by DS7PR03CA0059.outlook.office365.com
 (2603:10b6:5:3b5::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.43 via Frontend Transport; Sat,
 11 Apr 2026 14:47:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Sat, 11 Apr 2026 14:47:29 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 11 Apr
 2026 09:47:28 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 11 Apr
 2026 09:47:28 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sat, 11 Apr 2026 09:47:28 -0500
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63BElNk41983236;
	Sat, 11 Apr 2026 09:47:24 -0500
Message-ID: <c35fea4e-dc22-4314-9c5c-bfa5b880864d@ti.com>
Date: Sat, 11 Apr 2026 20:17:22 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] arm64: dts: ti: k3-am62a7-sk: Split r5f memory
 region
To: Markus Schneider-Pargmann <msp@baylibre.com>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>, Nishanth Menon
	<nm@ti.com>, Tero Kristo <kristo@kernel.org>
CC: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>,
	Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, "Kendall
 Willis" <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
 <20260318-topic-am62a-ioddr-dt-v6-19-v3-4-c41473cb23c3@baylibre.com>
 <8673745d-aad2-49d3-b3af-556de7037b69@ti.com>
 <DHPIOTXA81M3.AHBN8M49ENG5@baylibre.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <DHPIOTXA81M3.AHBN8M49ENG5@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|CH2PR10MB4357:EE_
X-MS-Office365-Filtering-Correlation-Id: 558823d5-0f14-4159-5d1a-08de97d94168
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|7416014|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ffCNlIvO0PeRE0M4xXjCpGd7wTwBDEPY+HZzLmLcUufwEy4kY34FVXmO/oyUx31g7PXm5Dr57nAargFywoFxTKEOImw0zIvmn9eeR1bV/wUtMf0iJrzTCn1IY6+qeeJJnLHmqg1uZDd6J1CBLZ25VQWe1VuvCnZ+UPWWzWJEYR7ysMKAVC8sj7dTR7avR1D45Kyh0WebxGlVYlDGL/LrLvVTmK//60sFlBq2XrnPMPAiAO6m5RxKZIZt2xekpPzeo/WA83Hpt/0am/rKy5iR5giZke8M6tecajKrQqxfgJSKaTuNrsJgMVncqVWH3IC5cRQKyIsXfA+LrCPUL4f76iBtyeg5FpgI+U9pjKvCFTWa7CoE3VuthIUdNbng3CiUShdA9+rtCJb/wzQtRSNglkKdSz0hv2TKgMYL/VT9hsFGMe2DDbQfWiGnDBVzwYuDkduK3qOC8/io5AcULjVNW/6TgNndOIPwLtnoT28vtTxG1WOOvTGFQK4dpFpalEWRTr1r4WykOyA4gqiC3aCXi76SAosjTQY4/5ERdaNPr6IJSKP3WvShukm2KI1cqBibQZ6skHXHmysBoG2IGCXHadAvg3p5t2Y54Ubxg+97uZkGqdJQhXIcygHah6dlfnVS0dDHXcRpsZYby29/loUELIMCgPWxCynrYRRmCpn3qZOSBl80/BK9tt91W9C5FntZknLCjWk6xHmmV/j2h6aREejQb0Y4vHMGaviBVkc1UQPcZlxgxLro4QBy9E7WVijBrjXHqZtIrqU5BenkYku1Ag==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(7416014)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TNXJjl19mROgg4yd+fgxY/4cGIbWm1xh+jABt4ocNuD86Q9GXOUW95WFkIyTM5Ys+w9xgGUeNYx6GRv0ui/TD83TtL2YHuCqH1W8CeUkVoE+2Ud8nSf6I4qCgYqBBBzeLVcLfo7yQ1QoxXunrIHjn7KSL5mB34+YYxdmrwr5pJLDrMBOmK3ovWKWprla6DODbxI84xFXY9fHs6PcAbCxvDRqXcwniKZ09FahKPoFErBz2jUoq9pAeHk/H8R4yGsZ+e8qWTeBJM7taZwDunnbVUHv9VDY7SofzNsqo9QSrjeAfyARle052OUoXz2aG1BnKJhoPDzSgUNAM+A7dlY8xwJu/2vmYlKQJt4lFIYmDSDnG+4dGHdyFzaVcuDR/TQn0IJPaaN62SNXBGsbOgc2Dj8EMtyy+EiWMvOX8k1wq1zY5uz4JkfKCwrrcFg+BHkq
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 14:47:29.3336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 558823d5-0f14-4159-5d1a-08de97d94168
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4357



On 10/04/26 19:12, Markus Schneider-Pargmann wrote:
> Hi Vignesh,
> 
> On Fri Apr 10, 2026 at 6:30 AM CEST, Vignesh Raghavendra wrote:
>> Hi Markus
>>
>> On 18/03/26 20:43, Markus Schneider-Pargmann (TI) wrote:
>>> Split the firmware memory region in more specific parts so it is better
>>> described where to find which information. Specifically the LPM metadata
>>> region is important as bootloader software like U-Boot has to know where
>>> that data is to be able to read that data.
>>>
>>> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
>>> ---
>>>  arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 40 +++++++++++++++++++++++++++++++--
>>>  1 file changed, 38 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>>> index e99bdbc2e0cbdf858f1631096f9c2a086191bab3..c381cc33064ec427751a9ac5bcdff745a9559a89 100644
>>> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>>> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>>> @@ -59,9 +59,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
>>>  			no-map;
>>>  		};
>>>  
>>> -		wkup_r5fss0_core0_memory_region: memory@9c900000 {
>>> +		wkup_r5fss0_core0_ipc_region: memory@9c900000 {
>>
>> There are still references to wkup_r5fss0_core0_memory_region in
>> k3-am62a-ti-ipc-firmware.dtsi (same comment applies to next 2 patches as
>> well)
>>
>> Dont those need to be updated too?
> 
> I only updated the sk boards as these are the only ones that have IO+DDR
> support that I know works and need the new memory region layout. But
> thinking about this, updating the memory region structure shouldn't be a
> problem for the other boards either, of course I can't tell if IO+DDR
> would work on them, but the new memory region layout shouldn't break
> anything.

I am not talking about updating other boards, but specifically about
k3-am62*-ti-ipc-firmware.dtsi which have a phandle reference to
wkup_r5fss0_core0_memory_region. Therefore any dts trying to include
this dtsi would fail to compile post this series.

Please if these dtsi files

> 
> I can respin the series or do a followup series with modifications for
> all boards if you like.
> 
> Best
> Markus

-- 
Regards
Vignesh
https://ti.com/opensource

