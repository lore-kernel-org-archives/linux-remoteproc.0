Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013027.outbound.protection.outlook.com [40.107.162.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2864134A3B1;
	Thu, 30 Oct 2025 11:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761822760; cv=fail; b=rZ/nsoEwfD8DnYTYYZZ1rZTDv7CbI/VvIT5o4VgK5wkyid+i+P1bEWVDspWegD1mT5XstqsApnSbaA29TuQcY4xzN/LdBYuddLofxelF40Z8Xp3uCXdxwS0aw4J80/8X3AhceeIPRWr0eUb2FGmuaTHOV+1tLIbISHKZkyPmTD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761822760; c=relaxed/simple;
	bh=I4Kf3pblbMeMuF4DPEKAXs9D8tie/FsgZeDMZekwAWg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EfKS/oROztDvcTRQbf2tYOXT0TATvFfSgiwAjP9JJ16qlknz9FTVb7y/Rolq4ycqxwlarofutsBgFDbWCmVs74qOYp1z6tofkCo0qxKJmqbGIRJbSMBu++SGga67k5ITvtL1rConyB+qVFYsoKZl8/eWSW/QaRHzz//DCMljWrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jqTc2g7m; arc=fail smtp.client-ip=40.107.162.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jqTc2g7m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e7EYbIAifSS1bj2olYST3ucQ9UiL4VYijESyJXzARTL4wOOnBRbwlxjg8RRfGlHXO1zVZKEN4biVoOTjLlJQJeSFMf8TcJNHUutFYWAOS2/ix/i146uwjs+UZsFqdie846Ffb6X8YrYz5Y0xEZ/rp3/7e8kud/lGjBL24tPvZ6U0MbCrvrDViWOrpOyQbza0+G6w1KQX2ChkqTbfdy6ppVL/9J4zN6pXajvXr35oLfLd25rbj2H3m5ebbMZW1PRVrLePwmkRm18b760JRfMESrDWyFuEGFUNZlZgGy1Ri+29dcCTAK1VJJiwAieVfLXVcNQpN91SSWFecY0OT/8wMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4Kf3pblbMeMuF4DPEKAXs9D8tie/FsgZeDMZekwAWg=;
 b=mG+npWpb+OCStjd4qAu3+sLyy46Yli+jzT8f+Dzia1l0Hn8noIjomaIQmDyXjUJkHn5OM6hM+EbtRUaUt19a7kF6tYJBLkvkKtXxL5x5iaZdoLZxR8wNy5M9msraABklOZyx27voVEnTH5NTB3kGyQ3kLp1t/L+/egvQYIhLkUQB5XjqnXMXKKsivsK1sSQLiFCnCi1ZxKRv2KfaA0I+oVl1pLj7IQamqWQKtG3O4b58lyVRkfVpYkwmhXpXWdG75/z4J1ybjxSYZcXjU4GzQhHCHqhLGGDXFW8YFIIo7tvka9WbkObzIvffXE3e4//1/GLL2qCGrdc9C3c5OG+F1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4Kf3pblbMeMuF4DPEKAXs9D8tie/FsgZeDMZekwAWg=;
 b=jqTc2g7mFEF/XCJ6G0MuB98emlZkwuLxMycTrOMMrsU0otuKsBVGCAc6vBcYvadcVZWX/FGQ5kuYu6Cuj5onksShTr4/ZMCIlgMapaowlpIVWIogLRBxQLr0DRLwZAiljxyXGg9MsFyL+Ob3Oq9AYD6JV8oFn/BxTpiQy4InAJGsUnYWGGUZbSBy0mxE+OpjAXwBGDom6rDcovEqna9EWgN1LCHndGlv2pgevn406G0Y1knCR6RE6RL+RQkfy6flmeBfAgtNOxirJyqkoJSr/F6970nexKYePYHKxeksUacvPEM5MAtKDdlNazxJLiLkhkEUuus67L/uGje4JTC64w==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10048.eurprd04.prod.outlook.com (2603:10a6:150:118::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 11:12:33 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 11:12:33 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
CC: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <frank.li@nxp.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/4] remoteproc: imx_rproc: Add runtime ops copy to
 support dynamic behavior
Thread-Topic: [PATCH 2/4] remoteproc: imx_rproc: Add runtime ops copy to
 support dynamic behavior
Thread-Index: AQHcR+N4vGOAeB1GqE2KKpk2/9aGRbTY3sOAgAGtOcA=
Date: Thu, 30 Oct 2025 11:12:33 +0000
Message-ID:
 <PAXPR04MB84596BBD914686B0F0B4DC3288FBA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20251028-imx95-rproc-2025-10-28-v1-0-ce9e7db9edcb@nxp.com>
 <20251028-imx95-rproc-2025-10-28-v1-2-ce9e7db9edcb@nxp.com>
 <CAEnQRZD=ynKyJXGneQMwX6NbHaOPNr4jxnP_90Ed860kpKUN3Q@mail.gmail.com>
In-Reply-To:
 <CAEnQRZD=ynKyJXGneQMwX6NbHaOPNr4jxnP_90Ed860kpKUN3Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|GVXPR04MB10048:EE_
x-ms-office365-filtering-correlation-id: 707f122b-d8d0-4aed-ab6a-08de17a5396a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?MnNSZEI2OUdSalI4YTBIaFRuN1FHaVJkWkVjU0dXVHViUzJUdnB1cVU3Mkps?=
 =?utf-8?B?cjVPZkZ6WVM4YVU3SldEQUtvNTBmeW9ZUmhncERPQmRFV3dhcGhIdThyUTl6?=
 =?utf-8?B?UzZVdG1sNkwyL1VMZW0vSHJGMnYwc1pic0FLNjE4Yk5hMUpQK04yeWtrWlNa?=
 =?utf-8?B?dkFPWTc2Qi8wMTRIaTNWdUVNdlBhdHBjTURWQ2VVS09BYUlLU1Nad0x6L0pT?=
 =?utf-8?B?WW9nTVJtSW4xWWV0TmwxaGM4NGNQUDlNY1l2R2hkVmxYVVBNZ3BpNHhqUnZT?=
 =?utf-8?B?NVlJSmxqeTJzRFZSclIycEp0UGl0UDdUQWxCNkltVEJxcmVSaGg0TmQzampO?=
 =?utf-8?B?OEJ2TUhmSUN5MVVXeWFvdTE4TUpHNEpZaFBILzJLdXJHVE1MWUw0OWwwRSs1?=
 =?utf-8?B?Qkp3RDJEYXJXM0tMUDdBUWxXQURnZ2o5cGxuOWpVNVhDVjVNTk1OK3pPUGtD?=
 =?utf-8?B?ZUErTHpRQ0JPNUYzT3JQUzd4QUsxRFdmd1lWLy9TelU5bk1uUHZ3SWFBUHpT?=
 =?utf-8?B?VjJtQUl0RU5iT1ZWZEtVcnJaa0JtTWtBNEdxa0o1SzFwTWNUNTFLS2xFbFVY?=
 =?utf-8?B?QkVaMEZGSjFxRFRXS2JzVXRrR09LT1RYM3FkT3JETGtSZWx0N2VrMkZPMnRv?=
 =?utf-8?B?RFdlbkJEMW8yazFqanQwV1htRlRYblNaV3BwOU1DdEVYNlMwd0FCODhleHlT?=
 =?utf-8?B?S24xdTYzdWc2cXlZYklXZE9NM1VhckMxZ2o3UFdVM0ZDdW1GZlhJZEhXVVM2?=
 =?utf-8?B?SkpuZkFtYVdTSkJRN3R3Y0hVVURhSlhLYlZPM09KUGJQdlEvN1dNd3FaRk8w?=
 =?utf-8?B?NkRQMnl0NHhhNjlOeVFLK2s4ekxRYzU3SVZ6K3Q4WDFXVURoYkRtbmpSYlFa?=
 =?utf-8?B?dEMvaU9sbXFSMkVLLzhST0xHVDhwR29YdWx0R3NqYVBFekJyRGloS2hNUkFr?=
 =?utf-8?B?WldsazA2bkFqa0x1ekloVXJtZXJwL2tBSWNiSHFDcDdTT3hTRDlpUzI2OHpz?=
 =?utf-8?B?KzA3Y1JnZ0VGVmJJbktFdHhyUnZ1MWJIRVpFOVQwUHVkbE5zSGNnZEJXM0c2?=
 =?utf-8?B?WVdtalpvNnpIbHg3Um1pTitUK0dmcjFxRW13SGduS3AyOHVpRWc5dWxPQXdk?=
 =?utf-8?B?elduNnR5YmNjaTNtSEo3eURTK1FVUkpXT29TbmdZLzhGTW1JZkZWWjdzSW1z?=
 =?utf-8?B?T0FyS1VwblZuT2VlYWdLS0hlazkycm8xbWpBbE5HOTdCbVRqZktJWFNKK3Rj?=
 =?utf-8?B?ZFUwL1RmeDl1LzFNVmFicWNlVkx5dTl2a3B5azVMY3BwSUU2M1pvc2JLKzk4?=
 =?utf-8?B?MWp5L3lHZzlLVWIxSEJEaUw1YVJMZjYvZ3M2WTZGckNHeDRGMFNmZU9mTS8y?=
 =?utf-8?B?c09ROUJmSVNia3lxNnBBVGdSMEprM3RMSXRkZVdLekplY0V6OGNheSt6cHcw?=
 =?utf-8?B?Z1pjb3pMRDR2NWdwcU1yN2pFL1k4SEFQc1J3Z2ovRFE0UVRqTHFpbjRIOWUr?=
 =?utf-8?B?N0Q2clYwTU1mOTRtMTl6QzRWYkxmNDVJa0hIVkVjcVd6ck54b1ZWaEZXV2Uz?=
 =?utf-8?B?bmFKTXo4dDY5TlMvU3lka1I5d2t4THY0QVR5SEppWkxHUFduWkxwK3U1Ukcw?=
 =?utf-8?B?d1R5Z3lFRUxHbzhUa2JCUlJPaWNHT2J6Vzh3Tk1oZWEzTVcwZEdwTkJTWU9l?=
 =?utf-8?B?Z1FIYVFnc1pqQ2xPbTk4UnIzY0ZzaHFiRXZrRldwNmRiQ2JwOW5BQmsvTGZI?=
 =?utf-8?B?TU1RektpK0JaOFpaY0tjR1hSN3ZDM0VXQnpSK2lzaDczY2wrV3dpN2g1RlU2?=
 =?utf-8?B?V0RLamloQ0JvQXRTZWQ2UHRManlPdm5KWnIzQXNWTEswVmlaNGNRVlUxMVNE?=
 =?utf-8?B?Q0lLaWt6bWY1VkFmblFaR3dJaVduS0RBR1dBeFp5emIzQzZXUWxUTFBJTTNa?=
 =?utf-8?B?M2RpYnc1cUtxc3lWVldaZDRiSzB2UmFUY042eEdCcVd2WUlldWZsMFRYY05M?=
 =?utf-8?B?Qld1TXYwNTIzYUNydUxXTit1YjBiR05qNFlSOEF3SlVKMHdtVDZDTGgwYkdL?=
 =?utf-8?Q?SgiyN7?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZkpvdU9tWldGM0RidUQ2dmJFR053SzRiYm5ESWcvSEdCeUVhZ0NQWEVORVYx?=
 =?utf-8?B?OFp0VklLSThRc0tXVWJHRUQ3YWwwTHlHOHc3UVA1eVV0elFURlBZR2IwU2dR?=
 =?utf-8?B?clM3cG9YdzFOYUpZTjVhMEp2bmJkdHFFTDc2WC92NHFiYUpOKzdRMC9FYmpa?=
 =?utf-8?B?ZndDSDdreFl4S0lRUDdhZnhiS1BmbnF1ODJRc0JGMStEZXM5TDBjRkRXdEhB?=
 =?utf-8?B?VW1Vdk56cGpYTUlpSVJiL2I5ZlpXVWU0RGdvd0NuQytXcEZWSkVXVkxOeE5v?=
 =?utf-8?B?ZHVEdVhuL2NRWU0xeCtHbWlMRzBZdkhWK2tCZWo1OTdWODdmRXRoUjRBcU1v?=
 =?utf-8?B?YVZKcWNsejlJekhzbVhXTlZVWXNYem1KK1dEZWw2QXdpYU9rU3FKWGhiMDVw?=
 =?utf-8?B?cmd0RytIbFNRbGRwVUNJMmtxSnJzMTYrWFdsVTFvSlB4Wi9vZDAyMmxMYWEy?=
 =?utf-8?B?QjF5ZU1PWHBkMTJaU2tPSFV5V0ZXdyt5Zk43Ym1ITVhNeHYxdUZVOUVrdW1O?=
 =?utf-8?B?Uk9ITERKdGRic21LaEhCRm5PRWNOMlVhV0ZBaVM5bGRKM2VrMWpVdzJXOGhZ?=
 =?utf-8?B?czZtNW5lMmRMaWJ1MnJFWVpteFhOZmx0QThvU0t0UHVEZDhYNzdaZXJHdkQ2?=
 =?utf-8?B?ZHMrQWNYUzVqU3YrTEJKTXVSM1Nvc0xkcC8yeUcxKyt4dkFyelRKWGFwVWow?=
 =?utf-8?B?WlB6U0toaDR0eVNRUXdTL2dseGxCSFM3K0RodVZrTUk2cGwxbHNOdDB0a3BE?=
 =?utf-8?B?OHJDNDVWYTFDVGhVbFNhaDRCWW1tYk14bVlPWVltYTB5cng5UGtRQUJrRnlQ?=
 =?utf-8?B?VG9lQVo4dmN2K0pCRUV2SnZNWVJlSmptYmpwWHVLWkpSMndnNnJtR3cxVzF2?=
 =?utf-8?B?OWJqbTlQaHozNzQxd3o2QmZjSys5dWlyOFh1WlUzd3plYW5mS056dnUraWxM?=
 =?utf-8?B?WExNZ21SMFBVMFFnVWRJdmE3K1VTeFNvTEYxVkcrVzBYYW43alRSNEJ1UW81?=
 =?utf-8?B?NUExK2xKbzRRVmhsc2diOTlLWXR4U3lKbi9ZWVVOSHRUUVhXT29BRU9UcFVG?=
 =?utf-8?B?bllxUkVmS0U4M0lDajZVWWMwU3Y3N0RPY1ZOSTg3bCsrcjM5N2dSeXVpeHMy?=
 =?utf-8?B?SmlYbUVCVmx0ZjkzYWI3N0lORk5qQlkwSDNNYjBTMnlqK2d5bWhRSFZjZnRa?=
 =?utf-8?B?S25qU2VVQTBPUlpuTkdoTmNhOXdYRkpkbGVrNGRaS1NWK0tWM1pRQUlnejBV?=
 =?utf-8?B?eDV0cjVvUzNNNnlMbTdLQ3ZKS0c1WHgwVkliOWZLSnp4d2l0TUNEYXFHU0g0?=
 =?utf-8?B?YW53RGlVMWRFZ1p2cEU4Wmx5SGxLRWJjVHZkYUI2SWVBY3IzYm16cTZqRGFK?=
 =?utf-8?B?N2thRVRJZkwrMW9VQ2l5QzlNZGFNbExXYU1VKzNjQWpBQ1phRk1Wb1VEcXBa?=
 =?utf-8?B?WGNUbHZkYllzN0k4SmNUejdMbHBORktVdStCa1lxdlVNVThVOS9jSEdIU3B0?=
 =?utf-8?B?ekdYeHhYblM0Uk9UdmJZeGhuMy9VTU5sVmd0UTZscCtwYmNNd29aTEtWWUR2?=
 =?utf-8?B?NXFKb2h6TXJ3aEJxS2dhczZmVWFXVlByT3I3b1NWaVJuWno4MjNOTU9QN0JN?=
 =?utf-8?B?WlZNSnhwZURzTXZHUHYzaEtyMVNpYVRxZmhNKy9kWEpDc3A4cWdvVWVXUERE?=
 =?utf-8?B?QnFhbFIvR1RreUJoL0hIWXF1UGlsb2RETFB5N3dKQzAzbVRXNnpIRmdmQUR2?=
 =?utf-8?B?L1hzanBTVVJPNWIwZFJFZ2J5a1NSeUZwWlV3N3FscmtDYkdQTkJ6c29aTkxP?=
 =?utf-8?B?VUhRb0J0VUlJaWNkNW4xL1J2NVJscmVyR29kekxxTXQ0dHcwLzlOZXpENE85?=
 =?utf-8?B?aHFUTU9EVkJOOHFvbUg0bThVaStveVc2SXdteFhSRVM3SzJWQTVaWHhQRmxB?=
 =?utf-8?B?SlFXYmhVczFUUmp6OGgzYzYzNUhBaUR6TWJLU0RCYlBGVWYxaGJNRFJGblVQ?=
 =?utf-8?B?M1M0NkVVKzBXSW1LSUFyVExVNjZpekxCTlJqVGg1LzVjZEVGSDRHWHh0RTZo?=
 =?utf-8?B?US9xNHVXQVpLRGhPMmFmcU1mKzhDUGF0alFFUFFXZm1LMy8zODNaeTNhR1pa?=
 =?utf-8?Q?TSX8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 707f122b-d8d0-4aed-ab6a-08de17a5396a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 11:12:33.3058
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0gclADrzU1coR6+0zHE55ySz3By5Joo9lcK8FeBr//caFUSnwaafXR/3rHRdrKlH8p2QANiw7IEQw8jRMcQuTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10048

SGkgRGFuaWVsLA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi80XSByZW1vdGVwcm9jOiBpbXhf
cnByb2M6IEFkZCBydW50aW1lIG9wcw0KPiBjb3B5IHRvIHN1cHBvcnQgZHluYW1pYyBiZWhhdmlv
cg0KPiANCj4gSGkgUGVuZywNCj4gDQo+IE9uZSBjb21tZW50Lg0KPiANCj4gDQo+ID4gQEAgLTEx
Niw2ICsxMTYsNyBAQCBzdHJ1Y3QgaW14X3Jwcm9jIHsNCj4gPiAgICAgICAgIHUzMiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZW50cnk7ICAgICAgICAgIC8qIGNwdSBzdGFydCBhZGRyZXNz
ICovDQo+ID4gICAgICAgICB1MzIgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvcmVfaW5k
ZXg7DQo+ID4gICAgICAgICBzdHJ1Y3QgZGV2X3BtX2RvbWFpbl9saXN0ICAgICAgICpwZF9saXN0
Ow0KPiA+ICsgICAgICAgc3RydWN0IGlteF9ycHJvY19wbGF0X29wcyAgICAgICBvcHM7DQo+ID4g
IH07DQo+IA0KPiBIZXJlIGRvIHlvdSBwbGFuIHRvIGNoYW5nZSBhIG1lbWJlciBvZiB0aGUgb3Bz
IHRhYmxlIGF0IHJ1bnRpbWU/DQo+IExpa2UgZS5nIHJlcGxhY2UganVzdCB0aGUgc3RhcnQgb3Bz
PyBPciB0aGUgZW50aXJlIHRhYmxlLg0KPiANCj4gQmVjYXVzZSBpdCB3b3VsZCBiZSBiZXR0ZXIg
dG8gYWRkIHNvbWV0aGluZyBsaWtlIHRoaXM6DQoNCk5lZWQgdG8gY2hhbmdlIHN0YXJ0L3N0b3Av
cHJlcGFyZSwgbm8gbmVlZCBjaGFuZ2UgZGV0ZWN0X21vZGUuDQpCdXQgaXQgc2hvdWxkIGJlIG9r
IHRvIGNoYW5nZSB0byBjb25zdCBwb2ludGVyIHBlciB5b3VyIHN1Z2dlc3Rpb24uDQoNCkkgd2ls
bCBmb2xsb3cgdGhpcyBpbiBuZXh0IHZlcnNpb24uDQoNClRoYW5rcywNClBlbmcuDQoNCj4gDQo+
IC0tLSBhL2RyaXZlcnMvcmVtb3RlcHJvYy9pbXhfcnByb2MuYw0KPiArKysgYi9kcml2ZXJzL3Jl
bW90ZXByb2MvaW14X3Jwcm9jLmMNCj4gQEAgLTExNiw3ICsxMTYsNyBAQCBzdHJ1Y3QgaW14X3Jw
cm9jIHsNCj4gICAgICAgICB1MzIgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVudHJ5OyAg
ICAgICAgICAvKiBjcHUgc3RhcnQgYWRkcmVzcyAqLw0KPiAgICAgICAgIHUzMiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY29yZV9pbmRleDsNCj4gICAgICAgICBzdHJ1Y3QgZGV2X3BtX2Rv
bWFpbl9saXN0ICAgICAgICpwZF9saXN0Ow0KPiAtICAgICAgIHN0cnVjdCBpbXhfcnByb2NfcGxh
dF9vcHMgICAgICAgb3BzOw0KPiArICAgICAgIGNvbnN0IHN0cnVjdCBpbXhfcnByb2NfcGxhdF9v
cHMgICAgICAgKm9wczsNCj4gIH07DQo=
