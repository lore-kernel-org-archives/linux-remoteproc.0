Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011029.outbound.protection.outlook.com [52.101.62.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F241A681E;
	Thu,  7 May 2026 15:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778169437; cv=fail; b=pxaTv9EI+xAv8mHWB9wljg+cpDRXRr8LyKxxBNfM2q1s7UJdHovhElKLQ04yjCAT86BdYpiyLww16hNbx/+LbYOTWPZhbtD54hjtma4ut0EZ5IqZ7dzUTCd8WXcXd9WNZyLNdPfzZtxQgEfQ35ao+xhMnMKt7si/c4U04BP8M+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778169437; c=relaxed/simple;
	bh=ps9u9k6DsbZJ1pOfNOuoNdSiQeNg3yiPs4cXx3ggN10=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nwOuUuIk1arqWIJizv8RURqtTQEeOTm8F9+sO5XW5qcNltewMpPd87gGQRmgiIkxZ3XrKIHErph/Boolmx5QRdupDvI0z3yBlZ/mS0dL8Mbdt4u4ktH4WIJ+YOiSZQNAtOzV4HNMCkpH/L7o5jKJn+wu6m3rp7Y8wZZf/kVTTyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=iXq9FF1J; arc=fail smtp.client-ip=52.101.62.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="iXq9FF1J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HIc1lQkqWiCYILt1ln6UlH5a7g1AiHKLJ4AHcK2JS+ijNtVJA4z95BHIBccoPur5eskU04BLGsfLV8yLvKRtxYnW1+SyKkXf/XxUHtYDJ+Em5/AZ4WGJ7gGonLAr0w9vzR2rcU/Bs0RxQRmm7chqh0JUgtGCOO9CBOScD+QVAPnbICcG+UIW+19D/GiQEIW6HzB1e3PCoAJWCAT4+wTvVrHdnoSJB3tnfx+TDWSn3F1z25sGzncYK4L8KdXC/MJLZ9cQtiGmaqYDxWRae91YVrOqYmrFV8IKpMvktKjEqI81Edzp1X/5fzZl9k/rydVtUwtjhaTTqvR2G3N70kwD4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFueIRg8EdjLYpRhCKi8UPsT8Gv4kSjtO04cZyD+nng=;
 b=ofK1fiyRb5yIY0n9nufQb+9rOJ9c89X4w7BvaKUMenMGCMN/t032Hrdg5o6UjG6wU7hXz7XyTpRIKzarKX34w3KrWS0cAH+tSr9/sGIMMP+J7fHufJw6pHOLikaQ1gtd3sLsfJdTLDirRNYM/KZsKJsQOWUdhZjhJplD0qrS1f76aZwhwjMtZn5dqXo9CTTXTyfAf8VjG9oR4GXTyPl6HoUeIJdRmw429+a8Utn/nnw2hzSRWJlofvjdXf5jb+c9dqQWqNARXU5xz/Jw0RxKcCXlsWQjTcjbYl4Cs7XOBZ3nBW+g99YDmpqAyvHMBxpyhsQlQO2WhrCvog9sOPTtbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFueIRg8EdjLYpRhCKi8UPsT8Gv4kSjtO04cZyD+nng=;
 b=iXq9FF1JTdftJcD/9Tgk2UJ4oXLWCE4Tsgf/JVnnzbinOkhY1FLi564ihOfaA7l3VmltOhkRlslfdJePVUxltycI91f1Pj+4D6bNaRlbrAGm8GfUb569jYnSeLlnU6KZhroHEbYeUQK+h00RtlQleH5bbnQ8qGwhIwGPlNGG61E=
Received: from CY5PR19CA0117.namprd19.prod.outlook.com (2603:10b6:930:64::18)
 by SA2PR10MB4810.namprd10.prod.outlook.com (2603:10b6:806:11c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 15:57:13 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:930:64:cafe::34) by CY5PR19CA0117.outlook.office365.com
 (2603:10b6:930:64::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.18 via Frontend Transport; Thu,
 7 May 2026 15:57:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Thu, 7 May 2026 15:57:12 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 7 May
 2026 10:57:11 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 7 May
 2026 10:57:10 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 7 May 2026 10:57:10 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 647FvANC3961383;
	Thu, 7 May 2026 10:57:10 -0500
Date: Thu, 7 May 2026 10:57:10 -0500
From: Nishanth Menon <nm@ti.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>
CC: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Suman
 Anna" <s-anna@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo
	<kristo@kernel.org>, Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman
	<khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, Sebin Francis
	<sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, Akashdeep Kaur
	<a-kaur@ti.com>, <linux-remoteproc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 1/4] arm64: dts: ti: k3-am62a7-sk: Split r5f memory
 region
Message-ID: <20260507155710.5zch4ghhzrj7hnlh@immovably>
References: <20260429-topic-am62a-ioddr-dt-v6-19-v4-0-fc27d6ac753c@baylibre.com>
 <20260429-topic-am62a-ioddr-dt-v6-19-v4-1-fc27d6ac753c@baylibre.com>
 <20260505124121.hffywentvo5pusfx@glowing>
 <DICGZTCMDWHK.HMQMCB8M32ZV@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DICGZTCMDWHK.HMQMCB8M32ZV@baylibre.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|SA2PR10MB4810:EE_
X-MS-Office365-Filtering-Correlation-Id: 30f98e54-a9ba-4362-fb33-08deac514da4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|1800799024|56012099003|22082099003|3023799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zHbVq9W50LxyDyPWacf12gk3SdV3kmeAZdSWmr2Gpdh/0YbcbsXOxZaZXu4c+F55d1hv2iagH9T2QwEq/jiGzA0Fv8w8s6+TR6PCALnMuOg4kFtxgn6Fj4nuO+Sk6UILumS7kFb+1JZl/UDggANNegkocblwVqfVW5wUy4xpviTGWYN0B7vJf2/A1+4XkpxQZo73d0RgP/OsYTyo3bsiaS7c65n2XSMG24oy5sQpShS+WIlswfi1MrXrd+tovmh08o/ySG9/Bpnlsd0PpaMvDKOBaSVarctmpux2+8lu4bhHM5J9JglyDlZcsgoiJ2P7Xe9vUDizi2ugd4AhPWKaroh968cJeuj7j3kwmaOplfGgDs9QnnkVyAKh1+8ykNhCyfoy/VCACHakGYiRH3DyduN2GF6HQbvia9x2vx0PrpQ7DtQptgTdfjvIlGYQ/ucEuTWJy/PPvKOZqvnPQ71b97fFUeSDP0Et/rEzmOXJI4m/R25Pb0JpjRJai/b7+0n9Ryr6ZNnRczWeZJRfMNf1Gt9lVHvEuFH+Kf3fTKd6SG3/9HT+WZh63ADF/17GtXZUr4id6u5cqJ8P7mz242JTlbcLm1IeFwaOwfPcYfyjU5nxtNtz+l5NbMuTYYqnR4nK0exC2k+YhQwPu3EgMgtVnJLXMW4K1Q74xedhznHpPL/FNPTwc98aEOFKRWmETc/IxzJ0196zuASl01Q13k7GngTvboFDCn7NpX182nDkthw=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(1800799024)(56012099003)(22082099003)(3023799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uyXBFPO9c+TDYI1sasWeKRPRWqfRKt2dP7sJwNfJlrq3CyvoZKoxrJruTNZIwtSX4RxnnrBbmTrvEcJDh4PhT5s4EJXE6fepcTCTL4pFNVVuiZ4XDAfxujeRFUJTIzjjEVZu7JhJx36a9FX44iiY8DUqGqNJz8k8qOYmMdL//LeN5lnExQtHc40lAdzuAWI7a/M9zHCZ4MNjzNddgUNo8LOog1UWyd5NaalBwN5ikvgrA43BLPCNFhNjhLWM61n6KghvnKq3YjQyGNKrqVJtpWdXFYyyi/Cxp4wdXXpNx6O1yqk+AtuyMn9/2eRf7NZFzFUi+VgWp64EF6okjNgxh0hA858+hTC6mVlyYNb+POb+153CuFoLykMOrPpcP2Ml2J4Xyu4Rw1Ce61as6vkUFj/kY2FPjVlk2gFr5UGAEbT6QrNKBzaq8mdmNBOH/AnT
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 15:57:12.7352
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f98e54-a9ba-4362-fb33-08deac514da4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4810

On 15:14-20260507, Markus Schneider-Pargmann wrote:
> >
> > So we go ahead an override the definitions of ipc-firmware.dtsi for
> > wkup_r5fss0_core0 here - explaining why the build does'nt fail. I am
> > confused why the ipc firmware dtsi was'nt updated instead? is this
> > something different firmware dtsi now? if so, we should split the
> > ipc-firmware.dtsi accordingly. Commit message does'nt mention the same
> > either. This right solution is to make up our minds if ipc-firmware.dtsi
> > is meant for LPM mode support or not. if not, split the dtsi, if yes, do
> > the mods in the ipc.dtsi
> 
> We can update the firmware definitions as well. I currently only did
> this for am62a and am62p as these require the new format so IO+DDR
> works. But if you prefer I can make the changes to firmware.dtsi
> instead.

That was the entire purpose of splitting ipc-firmware.dtsi out -
if the default firmware carveouts have changed, do the change in
ipc-firmware.dtsi. That way some other firmware people will have could
potentially have their own dtsi files and handle things appropriately
there, even if they are using the same evm OR if they use the exact
ipc-firmware on different boards, that will appropriately introduce
the change there as well. BUT, do check first.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
