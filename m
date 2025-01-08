Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2112.outbound.protection.outlook.com [40.107.20.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C110A59;
	Wed,  8 Jan 2025 07:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736321518; cv=fail; b=hT2axcAOE/dZUaHWJtplIYUc5cbgnPg8H61Wc9OjQ9WPbmH2P+H6Yw+Wl9OCTdV5Wt7w9Pd//kB2SX3qt3hWIxWdMIP/6Uw94F6izU0He7MVmkJVzZphBnMWu/vxH+BWdMeSFHnZV4G67UmXVVFZEx2ZW9gCJc2TootiGauw2pQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736321518; c=relaxed/simple;
	bh=GT/QrK4tAcF98fEYIqdgGzMbCDC2IeSKs4EHFppqWi0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RDj0PPq+18GKWaYj8KTcV5S/uFNxc2Lt7UlDItY/UCbvOmSMXdvHbsW2gpbfV+5oRzZA1eFGSg/V8zOMt6Y+czn8kC+CAsx6fZZSZzKIrzpxeqS7HHyoc1B+EeRiERD4J/ADVtJulK1EGaP81Cz9gDHpLxjnZyFZt42M+g3tH88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=ZxhEMtLu; arc=fail smtp.client-ip=40.107.20.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="ZxhEMtLu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgyxwbqeqsF8CypG4jbDUk0trRB408qYpXoA5ZM7txXWSG5PHlowzTyfuS9AgdMqA7SRidkDuFDU2x9rAjBSBTeFxDL1sRvGPxPJahrSjHwA4y+OW8ZCFTJuTaLAEIm1IwSQqmNQtwCrAnkRnICypqWAgvLEvqGUHLMWjzkAkOCi3IgAiLCh5Agz28dPTsatWSFZ2f+zWsg6z+hEOIyHFlYPmEwEDdebhFQK0Mwmcaxp36ynnER/0gX2LQlO1IXFBUKYLqxPhKVfWHh6yb6QK5Quq4Ql6fp+rqH4No9UiNN+Q7mAKnASIlPjQaZW+GJ9Ku4KBsRF+iiq/alTWwKKdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GT/QrK4tAcF98fEYIqdgGzMbCDC2IeSKs4EHFppqWi0=;
 b=gCnCIaUqqsJcVL3JESdeoOnlQ0OpUtR7lMmaCoQ9z+D3b7j0rZ8yKPUOqll8QNVIso/BKEReRV2coAIjdwHKxomiXKNkHZZnL6hzPEXsBZwE1ERQVbObcxfUWsxcmtzrbWdjtV2mDG2doRXdthRfv4ucAf1vuumuYKrEDgIdPOeSUV5mg9i1noBrdzjuD2+9rMQx5hnM7jUelevq+WxEEfVTpzeSRmiokKqllQaU0O94qz5DGW2Zf7yBfGRbd36vsH5ucSXIfY8wr3fR1NRkUv0eqUORXywpBPxNEW5hv2iBNnfYDs6YmjaGRIEJyP+I7M6LzdWdUELNXVttYCHq4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GT/QrK4tAcF98fEYIqdgGzMbCDC2IeSKs4EHFppqWi0=;
 b=ZxhEMtLuN2j8DNekAjvFCW30roC3PVwHRnLd9R3Q7rVhRDEKYWa4dvaZAQDAbMwXV8/+5BXWZBkIXnJMWCHmcn9fqvjckAiG1lLIP0CPv0ASquSPdlLytozw7vRbh1Q1NtukL/oxjADPtv0P06ILSBHcpIBNMzzsGjN4RAQh1boQtctPbVs5X5xQai2HG5OJZql533R/cJktxvhB/0l2YUZRX0Mpqn1U95pFE3WqZRMVQdB4BDyk/2Ey21e2e1yAJPTf4EYsy/oerRS5VrbIDlV7ULJ7WBpwYBK3NIuAKUvc7OdhY+qsCDaIhpQSyfV99Z2wQXAglrJVjTZ79BVYiA==
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:248::6)
 by AS8P195MB1302.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:3c3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 07:31:50 +0000
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981]) by VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981%6]) with mapi id 15.20.8335.010; Wed, 8 Jan 2025
 07:31:49 +0000
From: Daniel Schultz <D.Schultz@phytec.de>
To: Andrew Davis <afd@ti.com>, Bjorn Andersson <andersson@kernel.org>, Mathieu
 Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero
 Kristo <kristo@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Hari
 Nagalla <hnagalla@ti.com>
CC: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v11 9/9] arm64: defconfig: Enable TI K3 M4 remoteproc
 driver
Thread-Topic: [PATCH v11 9/9] arm64: defconfig: Enable TI K3 M4 remoteproc
 driver
Thread-Index: AQHa5PBFs17apAZHw0G+kKIRJLpi3LMNdN8A
Date: Wed, 8 Jan 2025 07:31:49 +0000
Message-ID: <bd487efd-1764-4cdd-9953-22d8c1b6f0a5@phytec.de>
References: <20240802152109.137243-1-afd@ti.com>
 <20240802152109.137243-10-afd@ti.com>
In-Reply-To: <20240802152109.137243-10-afd@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0P195MB2484:EE_|AS8P195MB1302:EE_
x-ms-office365-filtering-correlation-id: 0f1a9266-1f77-41eb-f316-08dd2fb683d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?Tzlaa2RQbXZnRy85bTlNTnlyOWdGZlZERjVSd3lidTFyUVU2Mm8vbEJaK1la?=
 =?utf-8?B?Q1dpOUtqRnVUaVJ0bUYzbVRKK2E4dmR0TnVBbFBkYk9jWmZHYW1aY04wNHFh?=
 =?utf-8?B?Si9yZ0pDVjJ4ejR1WUNRYVQwVjZjaDF1VVJMd2ZoZEIrNXdKeG9SczV2dkY0?=
 =?utf-8?B?bmhac0VjSmd4OU5XNm9iZ1pxWjhFOUd2TnJSdFZCZnpEMU9lZXc5L1E3QnZK?=
 =?utf-8?B?RmNFOG9Ed2ZDZ3RmZDNTLzdXZnRZZnl6ZU05QW9qSG1sU2xaalErT3dBbnA2?=
 =?utf-8?B?bExRK2FHeXUwektDNFJHYWowZ3U2bU9zYklzVnZ3VHEyYlpQTUxCcEt3elg0?=
 =?utf-8?B?MVVCQjdYR0dxYitXUW92SnhZRmJ6ZGV1S2sxZEFYTnc5d3hXMDlWT21VQXZH?=
 =?utf-8?B?b0NpTzcwR3hZNnhvM25rQmFhT3I1V29tS1lKMCtZZWZVQXB1dFdXcFloNWUz?=
 =?utf-8?B?NEZ3cXgzKzhWM1ZpelQ2ZU9Fa1NpU0hIb2lRTFZYOG9VRG50M1VQY3R1SzRJ?=
 =?utf-8?B?QWlkeXdSdmdjbmVzUVVDbzlyeWE2TndlU1c4blkwOXQvcWNqK3VmV045TU5I?=
 =?utf-8?B?QXhmcjhFemhjL3hReS8zczIyc3JUeTM0dSszaldVb1d3R09nL2hNTTBnRUJw?=
 =?utf-8?B?QlRuVXd0dzE2N3h0cElmbDNNYkhYNFhMNkhSYTJKY3h5WEJGMHAwWDRoelln?=
 =?utf-8?B?VUdheTIxRWtZZXdvaUs3c1Noa0c0YmtLUGpFV1FQaUFxQTFPMWhTMlgyb2dV?=
 =?utf-8?B?S3FZdzVxUHVuMXhYMzJpRE05S3BEN2ZJdVI2bGFWYTlDWEl2d1Fjb1VXWkdE?=
 =?utf-8?B?bnRxQnYvclBHRVI3dmdSUk9kTlg5ZzBhaXRDVXdUb2RyYURsY1o3anRxbUlv?=
 =?utf-8?B?QlhjbzE5dHBlRC84Mkp5QWhoT2I3RzJ5NmVMRTRDcEw4MGlRZWxUcW9CcG9N?=
 =?utf-8?B?WHNGUEVkbUVzcFZ4TVpHb0g4Z3E4MkdEem8xZ2hWejVzY2U4ZGUrWnZqZGVK?=
 =?utf-8?B?Q0RSeFk5WURsRVhXaFdKNThGOHZFMnZaTHdqbHdxa1pLa2tsRHFMdHRKQXl0?=
 =?utf-8?B?NGhoSVMxTC90MWJsd2lBbTI3NTUvcGhldjdIZUV0aUdIcjdzQWtRZkdZb05x?=
 =?utf-8?B?MmxmVjZ3YUxXVUdGY3NObVhWTTl2TWtUbTdFcVFMcHNpUm4vSTBjR0diUk0v?=
 =?utf-8?B?V0NkUERueVUrWUJIdlJLUnVCOTlwZ0s3UkJaTFVXTDFEWll5ZVhnbXcrbGNL?=
 =?utf-8?B?bW1YZW41bG02TEM1SVEwRTlzdVAwZFF4bUtlWjZMNmd5MmR5b3A3ZEV2Z2k1?=
 =?utf-8?B?NU9HNkI2WFpCREgxM1FPMTJ1SEZESk5HYmN4RnpuVHFxbGh2K2taQUlOVzZN?=
 =?utf-8?B?dWY5VEJNNW10T3k3b1lvVUk4dHBjbHJTSTBlWVVxL01OS21iNllxQldoa3ZS?=
 =?utf-8?B?YTZ0Umg3Y3FIMWZqcG4ydEFzdkxBQyswQlVWSUF4MjArR1dNVkh1NXVWWjlT?=
 =?utf-8?B?ZVhoeitJVWFrVlV6aC9IdHB6SXRXcjNKaW1nT0FWZXRCM09QbkNrVFpqVFRx?=
 =?utf-8?B?a0p1SmIvUjU2WDRMMTBPZkkxRjdoRXcwWUlLeTF4V1l6MkZDWmREZ2pTU3hl?=
 =?utf-8?B?Q05XMEtVQTZYWGxYZFczb0N1Ni80R2ZENG1VUllXWlFPZmhpMlBMNi9xVUZG?=
 =?utf-8?B?NEtWTWxOZUVFdWwwa3ovMXJ3U0I4WGJJWFU1WXRhdEc4bTlWWjVtTmNtdU85?=
 =?utf-8?B?V2tBRW0xakpWQW9UQXdtRm1zRmYvcnBZbGo2aThIdkRaNk41MEF6M3VXaDdk?=
 =?utf-8?B?NHM1bGoyYWVyY3ZSSCtNdUtmaXZPT1ZNNTlvMmo0QXVYQW80NCtEUUEyTmN3?=
 =?utf-8?B?UkhkN3FQak0rTnZhZlNTYTdHbUlFblFkK1RNd1pQNTQxTkZkT1dLUGZQR2lB?=
 =?utf-8?B?c1h1QTk0TEhXOFdyNlZUdlZqZmlESmM5dXlTRFJhcEdHUTdsSVZFZi9qNkh3?=
 =?utf-8?B?aFVBN3JKajR3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0P195MB2484.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?alJ6N281RmJGdThDcHd6MEd5TUtpUlMyeVM2VlExc0lLRThIbWJRbENNVGpQ?=
 =?utf-8?B?aG1zTDAyazgrZk1FU05GSTlCV05Ydm50QnhTdzJDZDArUzNZVEJoek03Zm5U?=
 =?utf-8?B?Smxld0lCOHFmV1lzcW5FbEM2TmErVmJHeklHWldBOXhCUk9FWmNSY3Y3bGEx?=
 =?utf-8?B?NVZqWGpxTjlETHF1dVBZbis1bXBvZ0Q3RlZ5VTRmaTFZdDBrcTJ3bWNLVDdV?=
 =?utf-8?B?bWtORTU1U2J4aXVrdG5JNmtkTFFwVGFUWCtqOCtYRmdkbkZGdWR1OGFwdDZu?=
 =?utf-8?B?cVFnTXloenlBeW5YNkJnV3BCV0poVGRyem5SQjgzZU9BU2dtbm50ZTIrRGhP?=
 =?utf-8?B?VUh6cUVmMXVYZ1JpakdzcU9KcDl0OWVHdkV6YmN3WVdUcGdSK1Y3V2hRcFNW?=
 =?utf-8?B?YlZmSGxjdFJCNERQTDRkOFR0YlFYb2dJRjRvTEY1M3VCdTAzOHFCTHJtVG9a?=
 =?utf-8?B?Qy9tUUt4d2h0SzVCck83dWhjQUZKY2lFR0xQa1dGSU1Eak93ODVNdzdhanp3?=
 =?utf-8?B?dVFRUXFQUDJUcDFkMjBDSDUyWFplY2FTb3NIWkcwYmJaa3BCVkkvNjNXR3Fr?=
 =?utf-8?B?bm9vcTNuKzI0SEgrb0Ric1RMdjg4YTZlZVZWeE5XRy9zS2NKY1g4U2I4N05D?=
 =?utf-8?B?eGhvd3FKcS9kQmV4Y1kxTjFKMmljeUhGSmFvTmxOcDV5OHJFOGkwa2I4NDhv?=
 =?utf-8?B?dTB2UVZKWTlZeXBlU1k0bnFVMDNtdGJSVG5qOEVjRFA4ZkFqMGJ0Qm9zSGhO?=
 =?utf-8?B?QWVtbUl0T2lQR2RIcjFCY05HYTJqR0pwSzNGY2xTenpxc242NlpVaENtY1l1?=
 =?utf-8?B?b253NC8xbW1wUUNMTVNUS0RTNEFOaWJCM3FaT0c5YmZBaklQTkUwSVRmSUtu?=
 =?utf-8?B?eFl6bGFyL1NheE9HcG9ocW9uZVZTT2czdDlld0JnTDU2KzdHd2R5Q2h5eEU5?=
 =?utf-8?B?NCtuVkpZeUpBYmMyeVhabGU4RmVmK2t2dXpDeGFWNGp5QWUxR1lielR6Rk5x?=
 =?utf-8?B?bGRDRnpwKzVZOG1uZ29WT1YzQVRtMUo5aGVsY01tSUY1d1k5NXBwaWVpdFFo?=
 =?utf-8?B?RFIxT2lxbVQzWGFZUE0wcnhiMHV3VHprSVpleFRHeG1ETmNkOHZ3KzBoY1Qy?=
 =?utf-8?B?Ny84Ui9uZzYyYkppYnNZWm5xLzhZTUpIMHV2SmlVVGZvbVNNNndzVTJWMVc2?=
 =?utf-8?B?MUFzYnJFMERzQjErdUhGOEJxVjZObURrSDRJbWxab3E1QTRxRkhBdzdPaGxr?=
 =?utf-8?B?MWNOTjVSYlFFOVgyQUxoSW9lb3EyaFU2b3IzUStPU0FDRHh6emRRUXZINnVS?=
 =?utf-8?B?QWs1S2lyOExIVE9zSWpiM3FaS3k0V2RVcFdDeUNDY2NuTDVGeDNLaDBwYjlz?=
 =?utf-8?B?eUdaMTFNYkFaL1l6OVRsMWZ6QzFTQ0pXa0ZmUTBjRWNzamYrcFlLV1FVUHBF?=
 =?utf-8?B?RmxueUNhbWN4NTJBcENyNUNWbDE2UkNRS01MRllFUGtEb1U4eTgwRjRkcXhQ?=
 =?utf-8?B?UXZPMkZUblh3L1BoZFFzMmxlUVByRHBjWUlWUkxpSUoxV1VISGgvaVh1M3Ja?=
 =?utf-8?B?Z1puSUpJak1jcjRGVGpxbDZoR3VKbEJjOFd2UjVGUm1CeW5qdjlaRTVjbkk2?=
 =?utf-8?B?aHp5SlRoV3Y3UDNBckVNSTVqTzdKVFljRjYrT1V4UU1qUVlHTkc4M3Fzc0h4?=
 =?utf-8?B?R2hKQ1BTOURMaFozcmEyWUtMOHg1ME1jL0dsMFdDS0R0dVdRNEVVblZWVDQv?=
 =?utf-8?B?bVdBbSsyQjcwSFA2MnpyOHlQbjRXZGZaR2J4aXdQZlNtMklPdFNiUzNsQkxG?=
 =?utf-8?B?VkpVSjVQM1BwV21vLzVrTnZocENxUVE5RGoxaXNFNlJEVG9jNmQvS29BMW5P?=
 =?utf-8?B?OTdvVHloMCtmdkdnR0UyWUs3eThQT2x6ZHBHV2VLdFdreTQya1RFNDF1MjdX?=
 =?utf-8?B?RjhvMHZqOFhWOUNRdlhpd0V3VU1kMFM5QzhKeU5Jc1lqZzZaTW0rNU1TY0lR?=
 =?utf-8?B?aENHVUIyVW5kRjIwMmdpTTlXMEM4SktHUHZtZFhpL2ViVmZRNW5GbjJacUdn?=
 =?utf-8?B?czVlZ0syWmFJSWJoRzlSU1pocjZZeE5OR0ZqTDlnLy9GaWNQOVJqMDRLT2JL?=
 =?utf-8?Q?DdpM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <720B0B91C755CC40A7EAC093E381BA7A@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f1a9266-1f77-41eb-f316-08dd2fb683d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2025 07:31:49.8135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VpYXmVte6HWtUeYiGlrNeUgYGBcsjOTg19DaPrn8PaeD7SnQQuXh1RIJwor6xgCdGc4o2ds0YEjZeS4pNK5riQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P195MB1302

SGV5LA0KDQppdCBsb29rcyBsaWtlIHRoaXMgcGF0Y2ggaXMgbWlzc2luZyBpbiA2LjEzLXJjNiB3
aGlsZSB0aGUgZHJpdmVyIGFuZCBEVFMgDQpjaGFuZ2VzIGdvdCBtZXJnZWQuIEdlbnRsZSBwaW5n
IGlmIGl0J3Mgbm90IHNvbWV3aGVyZSBlbHNlIGluIGEgcXVldWUgDQpmb3IgNi4xNC4NCg0KLSBE
YW5pZWwNCg0KT24gMDIuMDguMjQgMTc6MjEsIEFuZHJldyBEYXZpcyB3cm90ZToNCj4gRnJvbTog
SGFyaSBOYWdhbGxhIDxobmFnYWxsYUB0aS5jb20+DQo+DQo+IFNvbWUgSzMgcGxhdGZvcm0gZGV2
aWNlcyAoQU02NHgsIEFNNjJ4KSBoYXZlIGEgQ29ydGV4IE00IGNvcmUuIEJ1aWxkDQo+IHRoZSBN
NCByZW1vdGUgcHJvYyBkcml2ZXIgYXMgYSBtb2R1bGUgZm9yIHRoZXNlIHBsYXRmb3Jtcy4NCj4N
Cj4gU2lnbmVkLW9mZi1ieTogSGFyaSBOYWdhbGxhIDxobmFnYWxsYUB0aS5jb20+DQo+IFNpZ25l
ZC1vZmYtYnk6IEFuZHJldyBEYXZpcyA8YWZkQHRpLmNvbT4NCj4gLS0tDQo+ICAgYXJjaC9hcm02
NC9jb25maWdzL2RlZmNvbmZpZyB8IDEgKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9jb25maWdzL2RlZmNvbmZpZyBiL2Fy
Y2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcNCj4gaW5kZXggN2QzMmZjYTY0OTk2NS4uMzNiMDQ4
N2IwZDYwNyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9hcm02NC9jb25maWdzL2RlZmNvbmZpZw0KPiAr
KysgYi9hcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnDQo+IEBAIC0xMzgzLDYgKzEzODMsNyBA
QCBDT05GSUdfUUNPTV9RNlY1X1BBUz1tDQo+ICAgQ09ORklHX1FDT01fU1lTTU9OPW0NCj4gICBD
T05GSUdfUUNPTV9XQ05TU19QSUw9bQ0KPiAgIENPTkZJR19USV9LM19EU1BfUkVNT1RFUFJPQz1t
DQo+ICtDT05GSUdfVElfSzNfTTRfUkVNT1RFUFJPQz1tDQo+ICAgQ09ORklHX1RJX0szX1I1X1JF
TU9URVBST0M9bQ0KPiAgIENPTkZJR19SUE1TR19DSEFSPW0NCj4gICBDT05GSUdfUlBNU0dfQ1RS
TD1tDQo=
