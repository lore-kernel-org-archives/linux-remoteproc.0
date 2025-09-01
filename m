Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010008.outbound.protection.outlook.com [52.101.84.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A916A23D7E0;
	Mon,  1 Sep 2025 17:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756747373; cv=fail; b=VG1hpohiPf1/KyZQW1632gZ5ohk50l78+j7Jc78rt9zSOlWsnEyj5h/8EQrXKr4O9JjItxq8B24pQdk9YieFODJRwVH8r7s3+hMc0bmQ+fgVtKKTDGeaK+lx04BYcHO8veMKt9ULHqNzaVzOdiOIGUfuzawXUk17mw/ubXlSuyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756747373; c=relaxed/simple;
	bh=N79i48bnv/s+jA+UEhkFfL9ag1uIOTv0Zugp+/JWcog=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ilVm8rOhxdJuNZiftNXOvRZMWo4Zqie9Z8x3CDIoWJfDYbjHb8UN7z5tRjdIzs/olYTKbfJzlvfbAsStpQcqDhHDpnKChXlxdh7xlPjkSNTpkRsIJHjH2p4IqkTLnaWa40SgqMYRQk3DNYimcv8La2pTDrZA1iz1n6sI8qNZ1Pc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=f3DMA6Ur; arc=fail smtp.client-ip=52.101.84.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="f3DMA6Ur"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lY513Qkn4w2sU7xFKWIEcVTTndIKG8pVFKkf7Su01w+cTD9dXNVhvggHA1cF11nuVWgGoFaLdK1TtVmfxl/4SOmQqEuj0onwOl72chHkzNCI0LbEap40GEd4zvaU23vey0pR4lbY2XCz4UzybqjEzwSYTMFeyqbJHYXhO0YaaSeNldJwfnhog8YiKjvA1R9ncDIo9LRNcoKPC58MmNsNURRMKgZNmXRWQN/5j0BYBoAEbRI1kb4aVLLRiPuo+E4AMCtquygjyf4N6Q2Sti5FwUzED+x2wA4KiGDsHj9vp0pBcKaRNbP9YS0LPVi35I0XvfB15iSuJCTdislkiaa4KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N79i48bnv/s+jA+UEhkFfL9ag1uIOTv0Zugp+/JWcog=;
 b=e/6S+PSDDSg7hph101KNrEfrbxzQlcBSqmBFZe4FM/+jwNSDy/QifLPzvMome4eQm6uILe0V1yEr14tJpOXw8Q2duuFqtQPu4WzUygb43i28ByWCfwElEZVC3IT3IxPtMHPqrnckW8IlQXJk2u3UwdQ24wA8qxLpwx1FIj2KlyvdeH/KdvAwOioHgLIUniPZEamipg2Rp0QXaQerEtVSJeMPmh4k8y7VomlKzaL++/ztiluwmvsAbWccVvuODWlFGziJ0jJ5k9PXcxFd0K94zj0cExeD739jxP2Eh0/Z7OQAMLz11q95vaDdphJvZh3GDtNpuBfpnarBf9240NYcTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N79i48bnv/s+jA+UEhkFfL9ag1uIOTv0Zugp+/JWcog=;
 b=f3DMA6UrsNZLWlRU9Y/ZJqESrw7euCyTd/ZiUXxSLqe7umhaM2aafz4+lx5xi3rs6bE34lf6yVcr3LFJLJM2sXOO27gCVXAn6eRzHCoCGTPSi9yBo5fdC0uC4vIPwNNSgvB/5NWRdBFWk7sURy0Fdarsv+Velh+8KeHDOISombLrRgp9JifWLTo1Ygovr1GuJcXCZlBKZTMYA4gYL/pO+kVoPWOhzVPC51tBPtHOn0T0cOlI1j0gPk803Nn9vcAUs4Y/bl0O7HDjRjYuz8LfeHCPo7omoKAg9CKgYirmXo1otCnjQ/I4G65+Mz6zOAkhItFtCCzzNogYuv4EhB9oqg==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DUZPR04MB10063.eurprd04.prod.outlook.com (2603:10a6:10:4af::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Mon, 1 Sep
 2025 17:22:47 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%7]) with mapi id 15.20.9094.015; Mon, 1 Sep 2025
 17:22:47 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Linus Walleij
	<linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, Mathieu
 Poirier <mathieu.poirier@linaro.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
Thread-Topic: [PATCH 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
Thread-Index: AQHcG2UJrx1ZCCitskGBfhqSUGARIw==
Date: Mon, 1 Sep 2025 17:22:47 +0000
Message-ID:
 <PAXPR04MB91859E0AACFBC1FC913019848907A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20250818204420.794554-1-shenwei.wang@nxp.com>
 <20250818204420.794554-4-shenwei.wang@nxp.com>
 <CACRpkdZq25n4gZSesV8z8zrBs6kqU1a8=vwVkPBwM+hFb9JKwg@mail.gmail.com>
 <bb5cb154-0f7a-4e21-afe3-453ff5ee9373@foss.st.com>
In-Reply-To: <bb5cb154-0f7a-4e21-afe3-453ff5ee9373@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|DUZPR04MB10063:EE_
x-ms-office365-filtering-correlation-id: 7160c5dc-597b-475e-2627-08dde97c2baf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?L2xYM0xuVTRaWnlkVUZFZFZIbGVvWDlkNzkrODJnSlBlMGtscTVubHJWeURF?=
 =?utf-8?B?ei96aGRiU2R4QmVaV0dFYW9xOFJOeDBNenV3R0JmRjUyUWx6aE5jTjRYc244?=
 =?utf-8?B?MExWSmdwY1FSMWtvblMzb3c0ZWY5eUhpd0E2TEp4LzBXTGhBK0Q2T29zdGtw?=
 =?utf-8?B?enQ5MTRvcmZrQUVkVzFUUXRJNXFEMS94L3U0cjYwZWpJNlJhU1pxVFE2Vkpw?=
 =?utf-8?B?NXhSOWRWTEltYm1TbitaZEhKZGltMGdiV1o3TVJsV05zU2h5TDdjQUhDbm5v?=
 =?utf-8?B?S01nbENhckhiR0M0Zm94TEc1c1RKdUJ5Y0ZRV2V6QXplWXV5Q3JRYkxzQnMr?=
 =?utf-8?B?cjFKeUdwYStQTVRySHNqMUh2Z2EyRVlVVW1NbG9WbGI4NThPdkZhYnFRT1lL?=
 =?utf-8?B?TzJJbFJ6K1FLTm5rdk9Jenl1NUVFN1dmN080alFJdWxvTitiNmdOdGdkUCtC?=
 =?utf-8?B?M1FMZFpXZlA1cVdTY1h1ZHhLb1FPcTloQlBFRURqQ1VoQldGVTdZaTZCcVlL?=
 =?utf-8?B?SHhHYkNBVGhIYWcrZTltcnFyekd0UTZnNUhYS1lHZmdhcjhubEZlYUpjekhC?=
 =?utf-8?B?cDExRy93RFdsbXZvY3BNb2VmS09IcVQvUjlMMFM4bTFseGs1bmpWOTRSTHdt?=
 =?utf-8?B?SGNvRlJtbDBPOWY0RW1DQUk1UFF3TW10UEZQZlBqK1hFVDk3dThSQ0lwRzdv?=
 =?utf-8?B?bnNyakkyR2wxajYra1RKZkdJYTJsZnlnVGdyUHBEYjIxMWp6M0xJbll6VzZG?=
 =?utf-8?B?Z0s4ODZnSTVoRVZuMW05Qm5qVWlEdTNiK2N5eUdBd3dXa1V4UEJkdVdWaDV2?=
 =?utf-8?B?d0duMTZEc1FYTTVRajFyNC94SXZhRGlVV1daSGp4TXhuWTRjeWx6dGFXSUk1?=
 =?utf-8?B?NlVMcVF4OEM0bVBEVlBIM2s3c20yWG1IYUxEbFZCN0E0ZHczZlJDWnRGazFs?=
 =?utf-8?B?YXRUb2lMRkZlRiszeXJRSGMxV1ZzVmQyMVZoRjRRMmdZUkdjNGUycnpSNnZY?=
 =?utf-8?B?WmJZUjNFMWxxTWZWWktQcFIyNms5bzc4QWJKaEc2TEhOWHM1dlI5OXlpUUdl?=
 =?utf-8?B?cmNBc3g4YnNSN1lZdWFPVlV2aUw1UXFxWDNDYk9HdmZQNDFvT1JqN1F2KzNn?=
 =?utf-8?B?emlmMWIwcDR5OVZVZnFuSzhIUHExTzRMMHRKMmpvODQvd0FFQnpZaTR4SlVE?=
 =?utf-8?B?N3EwbldRaytsNlhmZHdNTUt1ajJ0MHVjdk9hdFNHdjg0c0NQbGdoT1B1cjBq?=
 =?utf-8?B?SGtuTHQ4Y2xFUlFVbFAwTktDYnBPeVdNRVBsbEhkUkx0VzdmUVZUUnJvN0hN?=
 =?utf-8?B?OXFxWTFneUViZWZKMzd3R0l3TzE3eWo5K1FpV1BSWUkzeFp2c0FGbWJJcGpm?=
 =?utf-8?B?N2lLN1BIa21RQ0JzRzdId2xXTThpQUhVSytYY1hheDJnYS8rNTJjaWdkaDFw?=
 =?utf-8?B?VzNzZHU0b3RvOVU0M1FXVkJia3ZZenk3WmQwajRSWkNDRlRDdFJRNEI0MENX?=
 =?utf-8?B?d3JURnNDcWpaaFJuQ1ZPbTJZdlN6cUZGeTdmOHBsVTNhcVB2dFgzQm5ocXk3?=
 =?utf-8?B?aXBHVDRZMmFqRTFmWWxvU3pWeWlZeG91YjZ1Y05ESFg2VVQzTXJUaW9Bd0JJ?=
 =?utf-8?B?MlZZNWI5QmYzTER2dUFWQ2Y5RE95R05qTnc0ZWdXYW1TallRTFZwenY0Z3Ja?=
 =?utf-8?B?TlgxbS9Tb2JZUDNFVXJxWU92Yk5qUVpiRHl5WDY5T0tTSUdsZ09ZcjNLK2th?=
 =?utf-8?B?ODkwOXYvTlZTVi9pbUg3TGFTN04vRnNMZ2l4dDFmaUQyQ1ROVkFzdDlxZVhS?=
 =?utf-8?B?d2wrNlJ5T0JNK0Y5SGNONmxGbzZERHJpSzNhQ2hzMHhpaXJGQlN6QkdFdWZh?=
 =?utf-8?B?UzZsUVAyQkNmNTc2N0JOeGF6blVtOFhYSFFBOXZXUzc5b3I0eCtiMk9QN3Jt?=
 =?utf-8?B?dStVejVST3RvRUZIaVRwVE9jQ2tobU42RXl2ZEY4a3c4U3RtNVpnTXRNbVRk?=
 =?utf-8?B?UFFuMm0zVkxBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aGp5WmpWMkZJSXo4K3FmQ1hWUDMyaGFYZnRsc3lwMlRHeGoreEJEN09aTXhZ?=
 =?utf-8?B?Zng2ck4yS0laZDVxQkgxemFiK09pbjdHTVUxeDRYc3Q4MTQrZCtNT3dJeE9V?=
 =?utf-8?B?cUtkR1l3QTNQajl2NFZ5ek5JV2NGT1N1cXZpL045VXB2c05XSVBqTEFMMHh3?=
 =?utf-8?B?UkxBSTNpdnpnbVoreThRZFl0bVJaTHZxSXJhRnk5OEFPdW1tandDMzZIWmRL?=
 =?utf-8?B?a1FudytvSGtSdmhib2EwYVJudXBzMU9NaTU0ODcrUU12SUhnSnVBUEptcGlB?=
 =?utf-8?B?NGVibWExS0oxYVVvY0lFMldvYzNhNG5MVWhXNnhDdGhXUVM1aURwTkQ4SUNI?=
 =?utf-8?B?aEUzNWw2UksxdDV6VWFCaEh0Wkc1cDNPL2hZUDNJR3VyTncrK0V5WDRxVnhC?=
 =?utf-8?B?STAybVlVendQcnBQc3JKdHZtVjNrZTJPcEJIUGU2aWJmYmsvTTQxeGNZWFpl?=
 =?utf-8?B?SkpCRjFIalRzT1lHaGI1cjVDeW5laW5wTURNUEJrcXNJdkwwcFJBSUhYRUVM?=
 =?utf-8?B?Z0Frc2x1Y3pwRVJOM3ppczdleDJ1emo3Uk8zamt1UFBQeHV6NjNueDNjZEkx?=
 =?utf-8?B?c2pDb2pCSWdzQzgrVEVjZ2h6UEN4bFRCWW1pWjY0UlZOY0g1Qk42aWFGRVFk?=
 =?utf-8?B?YWIyRk5EMGY4K01ud0RMb2Erb25IM2V6RjJSRXZxWXY4NjJTZmpJL1J0MXND?=
 =?utf-8?B?YXlvZ1hydmpYZXgvMlR3NWs0M0krSFRGSFpSNU1IdnZvUi94M2RqVmZZWmwr?=
 =?utf-8?B?czR1Y0F0enlLWnc0S1dQOHBnSkFOdk01MEN3UEs0eloxUWlOTXV0VjhDTkVr?=
 =?utf-8?B?WWF0eS9jZklYcXkyUDQyajVvaytDOVVoRVRrVnlkUGMyRlVpQ0tkNmJFZ25j?=
 =?utf-8?B?a1hMSGZNbWpwc0RmeVhkQ01IenY5VUxVcWNXSlNwMU0vdnkvYng2bm1EdS81?=
 =?utf-8?B?eEkycUNzNlh2Lzh1T2d4SHdWWm5BN1BJSzRTSStTM1gxSk9uZXEwdEJZU2FB?=
 =?utf-8?B?Z0hseHVzWWY2aS9lOTg5MDNIbXJPMWJVcitJYStxSGlDbjR5MmJXSklRbEc0?=
 =?utf-8?B?RWIvUUg1Sys4anZrUU03RHd0NEVuR2JRdXNJdEFZSk5RZ0hTb0pQYXJndTdr?=
 =?utf-8?B?Q2VUQzhsOXd4dU1HZnVYRnhtT0x5L25TTXJxZmdzOEUycmI1aWI0aVlveGtI?=
 =?utf-8?B?U3RIWkpiYk1XZHppQWZMczZpclpzSFd1SFAvNzQ2cE5PRTdIR0ZoM2VJT3Nx?=
 =?utf-8?B?ZWxGa3JTUWxTY2c0YXZ6NUtqRi9FSGxiMUdxYmd2anNXVStTTC9FbW9ua2hs?=
 =?utf-8?B?WmRTL2YvQ01iRGdzVmJWZUY5ck40ZHliMWZ6YzRzZkZpaG9XSis4RjBHNGRJ?=
 =?utf-8?B?SW5tRHI1eDRwT2VMZmc1V3R6VDVBQzQ5cTVTelpyMGRvWGFtSWVDaDl0UzNz?=
 =?utf-8?B?RDYrcFA1aW5SeXE5UnlmakpUNUJMMldVMDNUb0g1d1JVcWtKODlOSkU3NE1Z?=
 =?utf-8?B?TUE1eWxuYzF3MVFzZmVpTCtXUnRIelcrbHRrL00yTlBZT245QXE0c2RwdUVa?=
 =?utf-8?B?aXFvOEVkT3BIblo0ZzJLVG9hZmhGdGhxczhJTHd1R2p4OUF0eWhhQ3RuSTdI?=
 =?utf-8?B?VDB6QUE5a05oVFdyeFRLR05yU2o0d2FVZGlxZmk2VDhsYlBVZy9NOE1oQ2d3?=
 =?utf-8?B?Q2JybGMvM2pSbGJsZm44SzZvM2dySXRoRzRFV2VhTHcxRzMxQ2dHVmJSbjZs?=
 =?utf-8?B?QXoyVXhYWjlRZHVsT0ZMQjJsOVBXUFNJUEN6NUprQW5ubGJWYnRwYU9LQk9z?=
 =?utf-8?B?QXBqekVTY1d2dU54RG43cnAwc0VQRHBPOE1MZmh0cjJDKzRmTjlBQXJ5Uksy?=
 =?utf-8?B?K085VENmKzRBR2Nqek1sN2QweEJPdUxtTW5kNG1LSjhoUUxVRjhpNEUxaENs?=
 =?utf-8?B?NlA2QmFWMUJaWkR6MG9GdVlRTmgyK0x4dzhtNS8vR1N1SGJCV3FrTHNCclRP?=
 =?utf-8?B?WFo0MU05ekFLa1AzU2FyM2x4dzhmakh3bURYak9EMWh5TTRmSEV6eDdGN0h6?=
 =?utf-8?B?b0NCQUFjcUZKMVFwOWtEWDN0UmVZZG5jelltYkZLNFA2ZGlWNDdwbjdVNVQ5?=
 =?utf-8?Q?zv4sXd7OKNq9tk+gRJS05jNPP?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7160c5dc-597b-475e-2627-08dde97c2baf
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2025 17:22:47.4443
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fwZ6ChNN96U7WDMuGdr/jueDH2xCeB9eOypo+mT1M1HrozQqGYLAw0Dxw1wzlFS8mhQddIzGJ/riMeHcYrTUuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10063

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXJuYXVkIFBPVUxJUVVF
TiA8YXJuYXVkLnBvdWxpcXVlbkBmb3NzLnN0LmNvbT4NCj4gU2VudDogTW9uZGF5LCBTZXB0ZW1i
ZXIgMSwgMjAyNSAyOjI3IEFNDQo+IFRvOiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxp
bmFyby5vcmc+OyBTaGVud2VpIFdhbmcNCj4gPHNoZW53ZWkud2FuZ0BueHAuY29tPjsgQmpvcm4g
QW5kZXJzc29uIDxhbmRlcnNzb25Aa2VybmVsLm9yZz47IE1hdGhpZXUNCj4gUG9pcmllciA8bWF0
aGlldS5wb2lyaWVyQGxpbmFyby5vcmc+DQo+IENjOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPjsgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6aytkdEBrZXJuZWwub3JnPjsNCj4gQ29ub3Ig
RG9vbGV5IDxjb25vcitkdEBrZXJuZWwub3JnPjsgU2hhd24gR3VvIDxzaGF3bmd1b0BrZXJuZWwu
b3JnPjsNCj4gU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPjsgQmFydG9zeiBH
b2xhc3pld3NraSA8YnJnbEBiZ2Rldi5wbD47DQo+IFBlbmd1dHJvbml4IEtlcm5lbCBUZWFtIDxr
ZXJuZWxAcGVuZ3V0cm9uaXguZGU+OyBGYWJpbyBFc3RldmFtDQo+IDxmZXN0ZXZhbUBnbWFpbC5j
b20+OyBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT47IGxpbnV4LQ0KPiByZW1vdGVwcm9jQHZn
ZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGlteEBsaXN0cy5saW51
eC5kZXY7DQo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZzsgZGwtbGludXgtaW14DQo+IDxsaW51eC1pbXhAbnhwLmNvbT4N
Cj4gU3ViamVjdDogW0VYVF0gUmU6IFtQQVRDSCAzLzRdIGdwaW86IGlteC1ycG1zZzogYWRkIGlt
eC1ycG1zZyBHUElPIGRyaXZlcg0KPiANCj4gDQo+IEhlbGxvLA0KPiANCj4gT24gOC8yMS8yNSAx
MTowMSwgTGludXMgV2FsbGVpaiB3cm90ZToNCj4gPiBIaSBTaGVud2VpLA0KPiA+DQo+ID4gdGhh
bmtzIGZvciB5b3VyIHBhdGNoIQ0KPiA+DQo+ID4gT24gTW9uLCBBdWcgMTgsIDIwMjUgYXQgMTA6
NDXigK9QTSBTaGVud2VpIFdhbmcgPHNoZW53ZWkud2FuZ0BueHAuY29tPg0KPiB3cm90ZToNCj4g
Pg0KPiA+PiBPbiBpLk1YIFNvQ3MsIHRoZSBzeXN0ZW0gbWF5IGluY2x1ZGUgdHdvIHByb2Nlc3Nv
cnM6DQo+ID4+ICAgICAgICAgIC0gQW4gTUNVIHJ1bm5pbmcgYW4gUlRPUw0KPiA+PiAgICAgICAg
ICAtIEFuIE1QVSBydW5uaW5nIExpbnV4DQo+ID4+DQo+ID4+IFRoZXNlIHByb2Nlc3NvcnMgY29t
bXVuaWNhdGUgdmlhIHRoZSBSUE1TRyBwcm90b2NvbC4NCj4gPj4gVGhlIGRyaXZlciBpbXBsZW1l
bnRzIHRoZSBzdGFuZGFyZCBHUElPIGludGVyZmFjZSwgYWxsb3dpbmcgdGhlIExpbnV4DQo+ID4+
IHNpZGUgdG8gY29udHJvbCBHUElPIGNvbnRyb2xsZXJzIHdoaWNoIHJlc2lkZSBpbiB0aGUgcmVt
b3RlIHByb2Nlc3Nvcg0KPiA+PiB2aWEgUlBNU0cgcHJvdG9jb2wuDQo+ID4+DQo+ID4+IFNpZ25l
ZC1vZmYtYnk6IFNoZW53ZWkgV2FuZyA8c2hlbndlaS53YW5nQG54cC5jb20+DQo+ID4gU2luY2Ug
dGhpcyBpcyBhIGZpcnN0IFJQTVNHIEdQSU8gZHJpdmVyLCBJJ2QgbGlrZSBpZiBCasO2cm4gYW5k
L29yDQo+ID4gTWF0aGlldSBoYXZlIGEgbG9vayBhdCBpdCBzbyBJJ20gc3VyZSBpdCBpcyBSUE1T
Ry1wcm9wZXIhDQo+IA0KPiBDb3VsZCB0aGlzIGRyaXZlciBiZSBnZW5lcmljIChwbGF0Zm9ybSBp
bmRlcGVuZGVudCkgPw0KPiBQZXJoYXBzIGkgbWlzc2VkIHNvbWV0aGluZywgYnV0IGl0IHNlZW1z
IHRvIG1lIHRoYXQgdGhlcmUgaXMgbm8gSU1YIHNwZWNpZmljDQo+IGNvZGUuDQo+IE1ha2luZyBp
dCBnZW5lcmljIHdvdWxkIGFsbG93IG90aGVyIHBsYXRmb3JtcyB0byByZXVzZSBpdCBpbnN0ZWFk
IG9mIGR1cGxpY2F0aW5nIGl0Lg0KPiANCg0KVGhlIGRyaXZlciB1c2VzIHRoZSBSUE1TRyBjaGFu
bmVsIGp1c3QgYXMgYSB0cmFuc3BvcnQgbGF5ZXIsIHNvIHRoZSBpbXBsZW1lbnRhdGlvbiBpcyBh
Y3R1YWxseQ0KcGxhdGZvcm0taW5kZXBlbmRlbnQuIEhvd2V2ZXIsIGl0IHJlcXVpcmVzIHRoZSBy
ZW1vdGUgc2lkZSB0byBpbXBsZW1lbnQgdGhlIHNhbWUgY29tbXVuaWNhdGlvbiANCnByb3RvY29s
IGFuZCBiZWhhdmlvciBmb3IgdGhlIEdQSU8gY29udHJvbGxlci4NCg0KVGhhbmtzLA0KU2hlbndl
aQ0KDQo+IFRoYW5rcywNCj4gQXJuYXVkDQo+IA0KPiA+DQo+ID4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwaW8vS2NvbmZpZyBiL2RyaXZlcnMvZ3Bpby9LY29uZmlnIGluZGV4DQo+ID4+IGE0Mzdm
ZTY1MmRiYy4uMmNlNGU5YjUyMjVlIDEwMDY0NA0KPiA+PiAtLS0gYS9kcml2ZXJzL2dwaW8vS2Nv
bmZpZw0KPiA+PiArKysgYi9kcml2ZXJzL2dwaW8vS2NvbmZpZw0KPiA+PiBAQCAtNDAyLDYgKzQw
MiwxNyBAQCBjb25maWcgR1BJT19JQ0gNCj4gPj4NCj4gPj4gICAgICAgICAgICBJZiB1bnN1cmUs
IHNheSBOLg0KPiA+Pg0KPiA+PiArY29uZmlnIEdQSU9fSU1YX1JQTVNHDQo+ID4+ICsgICAgICAg
dHJpc3RhdGUgIk5YUCBpLk1YIFNvQyBSUE1TRyBHUElPIHN1cHBvcnQiDQo+ID4+ICsgICAgICAg
ZGVwZW5kcyBvbiBJTVhfUkVNT1RFUFJPQyAmJiBSUE1TRyAmJiBHUElPTElCDQo+ID4+ICsgICAg
ICAgZGVmYXVsdCBJTVhfUkVNT1RFUFJPQw0KPiA+PiArICAgICAgIGhlbHANCj4gPj4gKyAgICAg
ICAgIFNheSB5ZXMgaGVyZSB0byBzdXBwb3J0IHRoZSBSUE1TRyBHUElPIGZ1bmN0aW9ucyBvbiBp
Lk1YIFNvQyBiYXNlZA0KPiA+PiArICAgICAgICAgcGxhdGZvcm0uICBDdXJyZW50bHkgc3VwcG9y
dGVkIGRldmljZXM6IGkuTVg3VUxQLCBpLk1YOFVMUCwgaS5NWDh4LA0KPiA+PiArICAgICAgICAg
YW5kIGkuTVg5eC4NCj4gPj4gKw0KPiA+PiArICAgICAgICAgSWYgdW5zdXJlLCBzYXkgTi4NCg==
