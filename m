Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012020.outbound.protection.outlook.com [52.101.43.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3033321AA;
	Fri, 10 Apr 2026 04:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775795416; cv=fail; b=IsrjNGOsys/5AbaPkIcAOngEdss8elf3eHJ6m5DWJcpFaSXoAH/Om7UaQ+9UpCbK1GNuiE1MoeAcFbGecr/uISrAQZkjjRocRxZZpbL39wL87EB3jXm5lu4KL5fleiq+gH3bZBKJ/RMl2KYcYmame6tB1TCJDA94w3iXiJ+wQFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775795416; c=relaxed/simple;
	bh=pghxwpS8I3nfWqVd8BB5fZpUlUr09yeDG+igmykTQKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=grCf7/d1s+dwnHYEEArygwi/TYeZrIrsW821HpvkZj4/Wp7B23INdvf3pNI7tfJgkf/D3DU3PAAglGaYhtgcLHBza1xvIXU/PLyKVcIr9eCC55tLSzNRILvJyOj2EM5QhvP5N7aQIGHxuI53OR3HKUXang6IRJZ5DqpUmngokck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rUvMfuPj; arc=fail smtp.client-ip=52.101.43.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rUvMfuPj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JXPVdqsHendBYZ9sBr9x9kjkiZ4i9axtnPVxMQuNgayqYHVT5Y5Yq2leN5DdxbJZFgxfmCjjae5ap1gNsk4+BQJDB/WJ1MW/PHm0I3G79tXZ9JSDkVRsJNv9CunGDhM8QAQYA+CiKUUFrSy5cuaLSeU8tR/j+WwVzWnHeRhw0KxqykmhzzbI0iZr45YSk/Xh3DsaR60yhHMOfvpDWB9uGIu7vGpC+C9esX1yIaPrOKHK3Qe6PcbDlHvDRX0LecTDZPnqlg23Oxv78xMAok+NmDQrAPU1I90OHkgOfCzGA7bUUHj80WcSuWLj/nN9do08C7gMmX3vXEN/GGRdoOt21g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XfwdL1gcPEHwE4R1veCG7MtrgW43spPJFwfjHam+TE=;
 b=rhuNNQZsKBCSxbbput/uKDhU+X1uFyFQe/JqDoqjCKJ/GsZHYszlcZsXiEqLWXjnsVCpNvIdSnu06B2955oLkWC3gXZInBT4VpoFcqHEhO1nPPm1aFKO0edjXQzQMYJXLJtT87fZtZFJ2o3t944XeqjvQxJB+Ha5CgKbj8mvRIfR7DjmpLmueSyIroRg34iwN2LGcHBEZt+vPw+UFrHjgbp92UFJVbOj5mGpsPTAUTVERk0i3g+QbwZbE2zas5XnMQcEIF7Fs0U4CcCUjBuYE74n+JfL3ZiYNsqbggATY0QwPmOYPfAUHKnwOwhLljOK31WEUMTJnSgAo6I4Wz3imA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XfwdL1gcPEHwE4R1veCG7MtrgW43spPJFwfjHam+TE=;
 b=rUvMfuPj1MLVtRaP0et5+uXJMT81KgHbE5CbzjK82Lyw7c0U11Amt2vYBIF9fxcJy+J84MgmsAPTF8+BAL93NQGFFe6RLQkPa3Dlk/KP9d3DrKR91LRecdQleW7k+6LXScbNlCEm5FEzcjVp+ILW+mjFgFUFmBLp8mkN0q/zSGQ=
Received: from SJ0PR05CA0155.namprd05.prod.outlook.com (2603:10b6:a03:339::10)
 by CH5PR10MB997742.namprd10.prod.outlook.com (2603:10b6:610:2f2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 10 Apr
 2026 04:30:12 +0000
Received: from MWH0EPF000A6735.namprd04.prod.outlook.com
 (2603:10b6:a03:339:cafe::73) by SJ0PR05CA0155.outlook.office365.com
 (2603:10b6:a03:339::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Fri,
 10 Apr 2026 04:30:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000A6735.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 10 Apr 2026 04:30:11 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 23:30:10 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 23:30:10 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 23:30:10 -0500
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63A4U53q747103;
	Thu, 9 Apr 2026 23:30:06 -0500
Message-ID: <8673745d-aad2-49d3-b3af-556de7037b69@ti.com>
Date: Fri, 10 Apr 2026 10:00:04 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] arm64: dts: ti: k3-am62a7-sk: Split r5f memory
 region
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>, Bjorn Andersson
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
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20260318-topic-am62a-ioddr-dt-v6-19-v3-4-c41473cb23c3@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6735:EE_|CH5PR10MB997742:EE_
X-MS-Office365-Filtering-Correlation-Id: a122cf7f-0056-49ac-60da-08de96b9daaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700016|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wo/WFFlrpwCnm7sDwQbr9TuWrSKf/63OEGoZsd1EGYTwQ80pdWGV9rb+icbJsNMCq2/l7NPL49zWmmSXxkLzDAhj9KN7ddUqsJfMi07KE5WwFIuwe//wAPYAVeM5ZSUdHJDj2YF3ONHLqKYT72UAFQXoqgstFr21k9JFitRjlTJiTZ562M2fcl0FnyP3V8irNG5FrZf/fgC9g5JDGZ4opyTLP/A4KWjRMiOJQCaAYxBFvX9TzN4OcKaaHqr9BwHgRPCqehuIJP9MNwmi1vogdOp7InXaoxOklWYwTHj4QuJvdcU0lRRVji+v3J55PmC8WPuZFaK1AS1nc4fAtcxvJlViCJpVwgb+MpslTCD22WNiMpmuAx5ejQKRDHa2S6Bz3adSdjyLzhsnY1d/yrLjiv+6uuBcTz2SoXzKxZnedqHEouABpw7Tmy2BEjNX44PQn2VkaqvkISCdm4xZzOIZuDIfZM827ofJES8z8Jvw8AwFbgjySPDbDRhf3pumXXlr41N252FF0L3lfYrRqVPwYvy1vpOzbj4dJX4lrJjbnDaz/n3ptr2JyrlLGvXbU8+JgnkqIRKj++M7t88v+WBrJcZvs2ROqRUg8GqKAFTvTiX2ZNagvEorZJkNjDeS9eQ06wSRpHoR0vfkPA8HpFmmpoyzMQmMNbxwkYeH09dKB3upkNR6T3Fnrx1TKL1PTpMEunCyrzMOC0Rj5KJQYbiG3TI9hYpabtGaqp9LpaM9vFu32Zz38HojwkzW+BX4BE0iIDQYFG8R3cMVrsFwjgOBnw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700016)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	G5asIBmSOY+3KaoXyxvvQYCrumHYayncejpZ33vyU79yhIrB4byzOOli2qBrlswm4sPtfB9R+NUIAEJn+0KtsPRB7tEakmT+l0/GUEQzaN4sYUdV0LDKdzE6q0uECEp96h6isSk7CTYq1IHbRQV+IBK06pkAAJHtdjQEMEaqCF7EqDW6uKVLbRjlhU/TQdUBo3/rpGH4ygf0I7/DMXWvio7ma9L1McpvpdngzZV+R26++uTVQBy80SzyhNkVULov/F1iO0MI7Aj2DLNRBng/RQmTlqxRzbsVTo7No6q3qPpEo96Uox17Z4tI+QpYdQ8Xn0YrTNhkceRHT9OJr1SOM17eRjQxwgONpg2GVKMikPRaaDlCApVs1q1ODpsn5ewZKZEYNwuScbTIxurENo9U2RVQFhnHVOvAzoYE6TszMZviujauRO21AZikYQMUjsCf
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 04:30:11.3829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a122cf7f-0056-49ac-60da-08de96b9daaf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6735.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR10MB997742

Hi Markus

On 18/03/26 20:43, Markus Schneider-Pargmann (TI) wrote:
> Split the firmware memory region in more specific parts so it is better
> described where to find which information. Specifically the LPM metadata
> region is important as bootloader software like U-Boot has to know where
> that data is to be able to read that data.
> 
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 40 +++++++++++++++++++++++++++++++--
>  1 file changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> index e99bdbc2e0cbdf858f1631096f9c2a086191bab3..c381cc33064ec427751a9ac5bcdff745a9559a89 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> @@ -59,9 +59,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
>  			no-map;
>  		};
>  
> -		wkup_r5fss0_core0_memory_region: memory@9c900000 {
> +		wkup_r5fss0_core0_ipc_region: memory@9c900000 {

There are still references to wkup_r5fss0_core0_memory_region in
k3-am62a-ti-ipc-firmware.dtsi (same comment applies to next 2 patches as
well)

Dont those need to be updated too?

>  			compatible = "shared-dma-pool";
> -			reg = <0x00 0x9c900000 0x00 0xf00000>;
> +			reg = <0x00 0x9c900000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9ca00000 0x00 0x8000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9ca08000 0x00 0x1000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9ca09000 0x00 0x97000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_dm_region: memory@9caa0000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9caa0000 0x00 0xd60000>;
>  			no-map;
>  		};
>  
> @@ -922,3 +946,15 @@ &mcu_uart0 {
>  };
>  
>  #include "k3-am62a-ti-ipc-firmware.dtsi"
> +
> +&wkup_r5fss0_core0 {
> +	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
> +			<&wkup_r5fss0_core0_ipc_region>,
> +			<&wkup_r5fss0_core0_lpm_fs_stub_region>,
> +			<&wkup_r5fss0_core0_lpm_metadata_region>,
> +			<&wkup_r5fss0_core0_lpm_rest_region>,
> +			<&wkup_r5fss0_core0_dm_region>;
> +	memory-region-names = "dma", "ipc", "lpm-stub",
> +			      "lpm-metadata", "lpm-context",
> +			      "dm-firmware";
> +};
> 

-- 
Regards
Vignesh
https://ti.com/opensource

