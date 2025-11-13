Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010038.outbound.protection.outlook.com [52.101.69.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AD631A072;
	Thu, 13 Nov 2025 22:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763072625; cv=fail; b=eLkcuaBPkhLeFsv4dyKEOBbGEsxUlW7o6o8rcjN/hoC7OXbakC5N94LU1lDjpR/L4kO2RA98Vd9pWTievqhquo4g2/BAN3CC9U+rIXrNAhgnhW6gzbZC8PFJYn9whonTQVyWYnToSAVHGpzRhv+Hx9dgHwece6aBiAOf9+2dZZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763072625; c=relaxed/simple;
	bh=IopcIcm2cK+N5cCHk4WF0wL/+c7z7mdm2V6MIv2tl24=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qKjvn8inU5AkT230Vw5/3u5OedTRDx5uogJl9FnRUjmyKGeAmTW6D9jMNrdiLJcx9zUPBuX1LfQA82b4V6kjPD+t4gGsHsKvJLGNOLwWkJubpkDCTb+5SH3A+AP4w4AcJJjvQ6j8FI29okic8CK53a4rQkSocySbGoD93LsT3v0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kduI50Sm; arc=fail smtp.client-ip=52.101.69.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kduI50Sm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MoJcJYjH0YPdlaoWYIsFTeiThGYiTVF8axV/h4vWn8T8uCngYJ2fOAV0WvrDJdluculK8EyZ0Ca8j74e++A2lm1uL+it4XoZgbkNDiNd/Ks1BB5VjeDjLsyuitX4eJY9k7JKHyTudJ+qr7eYCmYf8mPFbDCrhT3yCw4nQru7iQisRUgeYaVPPqb56v94FwYopZa8bFvWzTr1M6VWOLVlIfXxfE79mKgTMpIeWlxygLRAtjnUuuHiUr1RYbq3MaXiZaH9XREmH2SutDY8QgG7Vx2zDEo2Hlp3Ks4ZMNT/k5HnZma7UikMcxXVuMCmVp+6gsNjTllsbNLb+Wywt0Kzgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IopcIcm2cK+N5cCHk4WF0wL/+c7z7mdm2V6MIv2tl24=;
 b=i581C6/zFHpru1frbm5UkAcIN+dv4ZuRQyrqmKPjgMII+7MlxZuNsRoJGK5ljRrbkGNpmI79OOpSNJ5hJgjKJdEE1EgLrUSJLrIKDdn7V56QN3/K6oBROe6sEoB5UIzjAjH+9f5KjVZhctH6QgYfrdllHlmyvwcO/djd9vEUXV970AX1wIGsF9kfHpjga2Qhrt+XYOdne1NCe81x9wBBFp4HqdhHMVUSmZew9NRPOWfQp7woXchtNfzPsuxEMTHGSFpTnLHqzDk7FQFhoeNTrqxkbcKwtmbT1GEeZoaBWVKWZxK2NplVFWVLWp6Y1PyZi2q+RELs9yPLcB24LkSmpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IopcIcm2cK+N5cCHk4WF0wL/+c7z7mdm2V6MIv2tl24=;
 b=kduI50Sm27KG/AS/6Pru92fKdkSUz2MJ+2ZqMz/eq9d6P2dC2WyKk6EFOOeSxEq3B67UQFHIl6KoLEB3F/PoCJok0XIgMq3QCrHZLlg28ltXLuJAgQfUFTact/zC7GCrBV2UaeDhJybYXY9WMh1Cxc9QjWR1FQZC7FUW5C1pT1HqJwXlDw+1QRvbdcqji8WvsHL+4ziirVDPPtk8oBvOKPDxk2pFyxPiVkTLLPoqcN8/CsC/g11kd8jvdCU1p9GfMHnZ7yxg4mX4IjN2G1zg+25WRS01/i7cRb3sTrWH3RvQqkrybP52T6HYJhnaQKOY25hFx4Xslewz04n3P5aYfg==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AM8PR04MB8002.eurprd04.prod.outlook.com (2603:10a6:20b:247::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 22:23:39 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 22:23:39 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Randy Dunlap <rdunlap@infradead.org>, Daniel Baluta
	<daniel.baluta@gmail.com>, Rob Herring <robh@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, Linus Walleij
	<linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng
 Fan <peng.fan@nxp.com>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rpmsg bus
Thread-Topic: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rpmsg bus
Thread-Index: AQHcVOwout3JwwqGhUSOVBLWX+QUXw==
Date: Thu, 13 Nov 2025 22:23:38 +0000
Message-ID:
 <PAXPR04MB9185B7827B1CCD1CD8D0E9B389CDA@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-4-shenwei.wang@nxp.com>
 <20251112125741.GB1319094-robh@kernel.org>
 <CAEnQRZB4ymvSERKhJW=PAk5xA2JYD=i4wzkbumj_g5S8BjONjg@mail.gmail.com>
 <1dd236fc-26f7-4c02-b183-c3fc13d24767@infradead.org>
In-Reply-To: <1dd236fc-26f7-4c02-b183-c3fc13d24767@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AM8PR04MB8002:EE_
x-ms-office365-filtering-correlation-id: 1d71c3b8-b52a-4170-5e0c-08de23034b67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|19092799006|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?TjNBeUhsSFp2K01vZ1JxUTFYSWN6TTEvTll5N1JsS01MN0dBaVVXclVOWXU2?=
 =?utf-8?B?Q3YyRlM1bkJKcDRZRzFwbGQ5V0FoOVFvVy80Z1dhN2NtakdUVjcvWXVhYWxz?=
 =?utf-8?B?b25HUmY4TS95OTNoNnlZVmliMGhmSkxEaXhoTkRlTkVSeGlFcnhCT3NWYThU?=
 =?utf-8?B?MmNjUW80MGxLRVBoUXErWWU4UENjOEhTTE4wNHY4cmVuYjVjQjJNcG9uaFht?=
 =?utf-8?B?RjlrM0dMdEhUSHAybEc2MW1wSUNKZU82TFJsa0dRT3pxZ25uWnk2L0xqK05L?=
 =?utf-8?B?ZUtIZHh5NzNUNkdueVU1VUF2UG5NQ09tZVFHejRHdHRiSytyb1RRMmxIaDcx?=
 =?utf-8?B?a016UFlkem1jMEN1Z3VHRTlmdUZ4REdXV24zdmRLV0xjTmpNSS84VzVzNUJO?=
 =?utf-8?B?WnJjRzk1K0FxSE5qRG1wNGdGS1JLSXlCZlBOeWdYdCtjVWJhZ0NOR2RmaHFw?=
 =?utf-8?B?WGNnWFZHUW1KZjJhM3BnQVloR3Frb25UYlFvS3BObnd1aE0ydmFLMjVVWkNC?=
 =?utf-8?B?enJENmpqc3FvUkg4Vk11L29EZzU3aFUrRTV1Qk1mbUZYNjdKRnJ6dWtPQWFa?=
 =?utf-8?B?ZmJwMFJzNzUxYmFjMkV2TWRZRGdLSGJNMWJ1SFlwVVlBYzdya1Nqd05adlFS?=
 =?utf-8?B?ZHl2NUFYZy9VRGVSZU9INHdyTXhaZmhHSmdqSGpPSzdmNGpZQ3VOUG1XMW9B?=
 =?utf-8?B?V1JzOEw1L1VlaS9IM0dJK2xGLzYxcGhvcXpWU2tEWXZVUEtJNW9xVWFZeTRq?=
 =?utf-8?B?aElYcWVEdHVrQ1hKamZvTzVvTHJ4OXFNcmQxcDlxRHhBN1VWQzg5OHU5ME9k?=
 =?utf-8?B?WUdUWVNSRjZxTnVIVmw3cXR2RDV0bDhtT3RjOWU4WjFsa2lmckpQcytnNklh?=
 =?utf-8?B?RTZRUmdrY0lLNTYwN2V6Z0hTMHFWbFhJUWk3VE9mM2tSaWxyU3hXS2pZMC90?=
 =?utf-8?B?REVmME5NaGdjckdEUHFxaENmK2xNdGZCbjZhM0dXUWF5WC9ZTFk4TjlFQkI3?=
 =?utf-8?B?QmRtSFlRVVhTK005RWNldXlZMnVrbGhKZjkrQjY0Q25Gc2M2SHJEb2FnZFBU?=
 =?utf-8?B?ODNQMUZEeCtJRTQ2SEl1YWRHV041ZEFTTUxEbitzeDc4Nk1IRmlzaHB1VFhY?=
 =?utf-8?B?dVJNS2libDRaemVTaVUySjR0aXRmZ2dhZHBocjJCQUtpTGpmL0VzNnY2YkF5?=
 =?utf-8?B?M3ptWUwvb2dGWjZoK3FiT3YycVQzak1CMTJiQlVTcTByK0VzcUREN1oyRDVn?=
 =?utf-8?B?RDhuMVJXaUtCS2NveENEVER3VjQ0TTE3RlQ1THdhV253bjErUXpTQ0g5aTF3?=
 =?utf-8?B?ZUtpWVp0alFwQXpYZGg4OTVSa2l0WWJYVjZ2MXdMMGFsbkdOM2Y5Yk4xTTlt?=
 =?utf-8?B?TWtkSlp1ekQzYTFlQVRLd0hRN21wNHptdTNYR0ZqUWVOL1AwNDZQV2NmbHNF?=
 =?utf-8?B?dTAxb05paG9VUzFjQWlsbmR0WWhxeWtMaW1UUmNFV2hiRThUMDdxT3lGdTls?=
 =?utf-8?B?QWVZRVZ1b3N6OFJpbldadi9pM0dxQ1orN2xXYlAyd3EwTXlNaFltQ3dFa0tE?=
 =?utf-8?B?UFFSU0hRMXo2aDEyWUVTelFIVFVvYWV6SnFrTFZVU0hzWVdnU0RSclZYaGRy?=
 =?utf-8?B?NmN3cGVpMEw0MDcvOXVYakUvenB2RjBYUWJ4YjV1V0RxUDNicDRhRkpReldj?=
 =?utf-8?B?bTdEbUNsZmpQeG90bFJFUytnSXlsM28xWjh3K2RxcUZ5eXNXRXJMTzhXYjBC?=
 =?utf-8?B?a2tVVUZnOUVtSzErUGVKQUdIaDZSb01abzRHNy9uckVsYkJQeTEvMW9nOTZk?=
 =?utf-8?B?QzdMd0RuSTBkZFZUQ0dISlpESmhNYWpSVVcrUTJOZHR5WXhsbzdGMGFlT0JN?=
 =?utf-8?B?ZFJsU3NpLzdHM0g1Zno5TTh2T0ZxS2l6b29sRmZZaEtaVkxFcUU2ekw5bjZV?=
 =?utf-8?B?d0pMaXlSTnMrNytTYWlhQnQzZC91aHZwWW9Dd1pLZlZOS216VFlNTkk1bjYv?=
 =?utf-8?B?eHYzVFlwSkVaZmtucG5vUW5jTlBnYlg5d1BEZENVbkl0d1RhMDFiYks4MElo?=
 =?utf-8?Q?4WCogc?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(19092799006)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZllDYzZYSGpHV2ZGd3pTbjEybHh2Y2h6cnh1cllGL3dEbXZwNVR4OGt4dHp2?=
 =?utf-8?B?UmZERW4zV201cjI5Nm80QitNWUo4RWhCU2Z2bXRyQnptcjBnRXBsSzBEeVND?=
 =?utf-8?B?YWhES3kxZUxJMFY1ZVVJOG9SanZYdTk1ejlmMzNQdTF0amE0clJkRkxWMEE0?=
 =?utf-8?B?bmJrV3kxZXhYd3B1NHpqbWhORGdmZDhvL0hCRDZOYVNucHduN0s1ZE9BNVEw?=
 =?utf-8?B?K2VqRnZ2OUw2YzE4UXJaV2hFL21LeDFsazNYSXV0OTI4ZEJEUlRmNkFqVXp5?=
 =?utf-8?B?eldKK3JiZjhVRFNRb2d3Q05wNHdTbFFOUjFPOU1uSTJtK2YxcHJsYXkrOGhR?=
 =?utf-8?B?MGVMeEdyZ293ZE1LaHlES0J2U3FUSEsvdTNobWJRaytUY1JmakFxNXdVWnFv?=
 =?utf-8?B?UHZyaWJBeWVTcmZhSDRDWHVFaGQ2R0hFRHcwZDh2NWlGQ3BkS2p6M01ubFB4?=
 =?utf-8?B?VmU4SFd2N1RyK1FuRmozWmFFR3VPb2w0c2J4TW5aa211aGRCbDczRW9ENmlR?=
 =?utf-8?B?QTNLMi9ScW9FVmZFMmFPQWpiaDdWWkdRd1JXOHYvMjFxcUhDQ0ZkR1RQV0N5?=
 =?utf-8?B?TWlRd2R2d1pXalBqWGh6NHNiVml1SVpMR3lBSW56L2FQNlZZMWJIOWZLbHdZ?=
 =?utf-8?B?TlJET3pCeTJPTzZUVnY4UFlhbjhqRHdleVl4NkozY1RXV0VtY3dQcHpYKytv?=
 =?utf-8?B?YnBSMncrT3FKWTNHc1JOSm4rY2NPUGRXQ2JEbXAwako1QmJVcU1wRDVTWW1n?=
 =?utf-8?B?Uk9IenJjT3dYb3hSeWNQN09jYUsydldzWE9ndFBVMkN3L0xJUFpSK0lDR3JS?=
 =?utf-8?B?QkJuRkw2dmxhWHlkUWtLbFMwUVZjN29pWDUwT0hUS3ZNYURyTnlNYjI3OXhk?=
 =?utf-8?B?NmVwMGtqOEFDQmt4ZnBCOStFKzlWakJIcXJnRDdjcm5SR2VZNnZoenZtQVZq?=
 =?utf-8?B?VEFCZ09rWVZCNHBtRXNCbUhDdW5MZ2JHWUhpa0xLajNDTnY1WTN5V3dPem9z?=
 =?utf-8?B?N2VGR1pBNU5rck9IQ0g5My8rQmw0anJReXM3Yk9GZU0xcHdEMXp5Q01WSlFp?=
 =?utf-8?B?dVRkekRiV1hKcDlvWlNVM1BMOUgwRS9vSkcxNVZBS3NrU0E3YmZmaDlEWjBh?=
 =?utf-8?B?eExTZnB5WjJrVGFlNEQ1QVdRcjRHMkxUWWkrNDQxZ29HUnQ1TlQ1RFJZTm1K?=
 =?utf-8?B?TkNuWTJ2Ni9GWUV6WkIrcHR1bnVxd0dEeW41VFdORFdJL1owUlhwNGQvNEk3?=
 =?utf-8?B?ZVVJS1hxMWFoTDNOa2RxTmk3V3dzQ0lscmZJYUJqR3lmTGduV29JQkZ2eVNR?=
 =?utf-8?B?NVhBSi9GZUJPV2p6LzloVmgzS0RQWTd3dm5YUmx0cWFDRk9iTHpJMVdGYjlP?=
 =?utf-8?B?STJ5TnpvUzA5V2tTWktQYVBIR0VaTTRBUFZxblRqQkhEc3F6NHdYTXNteDBw?=
 =?utf-8?B?RnZmWlJ5MjVDTU12N2M2enE1NG1qMEozdVh4ckZab2NrMUdqRWw3UGc1OHpm?=
 =?utf-8?B?a0NLUnBGOFB4VmdJUi9qamhOMDY1OVNqTlJhOTJHUUVrZXRCWTI3UmlsRzc0?=
 =?utf-8?B?T0ZkTTVIQ1J2K2lxT1U4a29WaFRxQ3dwWVZWRTRtZlBMdWJpVVFKai9NbGxk?=
 =?utf-8?B?Y045ZmFQdVNtZDB5V0dkUmZ1UmpZeDZyTFRadFJSR05KdHhGVGg2S2NtTWZX?=
 =?utf-8?B?ME8ySkM2Q0cyaG5VRnZBdERwQ2lHMDUwN0VXS3pyTzkxK05jdUxiSjVZNlIw?=
 =?utf-8?B?K0F6S1R1WUl0b2FEK3dQNFZCQnB0dG5uZ0ZWLzFXT1JDdUFyYWdibUZJcG42?=
 =?utf-8?B?SEw1cFRWbzlzTnhSVlZ0TDVmNTF4blFiNC9LZnhqd0JGcWhtMk9VZFVNcUZJ?=
 =?utf-8?B?WWFram5FbFVNZWdxNEw0Z3JSMTRjV2dnVWxmVFVJSWN4QUxRSXhMdzMzQ2ZQ?=
 =?utf-8?B?YWl4NnJ0QWpWUE82L2w1ZTQ5NlBoM2FSZDJiR0hibXJLeFNYeUpHSHUzaGpn?=
 =?utf-8?B?akxmRi80a1UySDRJSm14N2l0S1BNVVgyZnM5ZXFqU3BrQTlaZC9Yd3ZXTHRI?=
 =?utf-8?B?Q3ZtTEFzOHJnaWNlcFUxWTBaa0xmQ21WZnRZY1ZBbHQvT1UzYXR3WWNOMUxv?=
 =?utf-8?Q?ko4w=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d71c3b8-b52a-4170-5e0c-08de23034b67
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 22:23:38.9749
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rd/KR/zJijd8DoezaGTa5ObWy4jcbYg3vJzxx2lT3Ps/3p91lK41xKNsKam5jHuynzaT6p97v+CCCs7ghRzwNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8002

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmFuZHkgRHVubGFwIDxy
ZHVubGFwQGluZnJhZGVhZC5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwgTm92ZW1iZXIgMTIsIDIw
MjUgMzoxOCBQTQ0KPiBUbzogRGFuaWVsIEJhbHV0YSA8ZGFuaWVsLmJhbHV0YUBnbWFpbC5jb20+
OyBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KPiBDYzogU2hlbndlaSBXYW5nIDxzaGVu
d2VpLndhbmdAbnhwLmNvbT47IEJqb3JuIEFuZGVyc3Nvbg0KPiA8YW5kZXJzc29uQGtlcm5lbC5v
cmc+OyBNYXRoaWV1IFBvaXJpZXIgPG1hdGhpZXUucG9pcmllckBsaW5hcm8ub3JnPjsNCj4gS3J6
eXN6dG9mIEtvemxvd3NraSA8a3J6aytkdEBrZXJuZWwub3JnPjsgQ29ub3IgRG9vbGV5DQo+IDxj
b25vcitkdEBrZXJuZWwub3JnPjsgU2hhd24gR3VvIDxzaGF3bmd1b0BrZXJuZWwub3JnPjsgU2Fz
Y2hhIEhhdWVyDQo+IDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPjsgSm9uYXRoYW4gQ29yYmV0IDxj
b3JiZXRAbHduLm5ldD47IExpbnVzIFdhbGxlaWoNCj4gPGxpbnVzLndhbGxlaWpAbGluYXJvLm9y
Zz47IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJyZ2xAYmdkZXYucGw+OyBQZW5ndXRyb25peA0KPiBL
ZXJuZWwgVGVhbSA8a2VybmVsQHBlbmd1dHJvbml4LmRlPjsgRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2
YW1AZ21haWwuY29tPjsNCj4gUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+OyBsaW51eC1yZW1v
dGVwcm9jQHZnZXIua2VybmVsLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGlt
eEBsaXN0cy5saW51eC5kZXY7IGxpbnV4LWFybS0NCj4ga2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBkb2NAdmdlci5rZXJu
ZWwub3JnOyBkbC1saW51eC1pbXggPGxpbnV4LWlteEBueHAuY29tPg0KPiBTdWJqZWN0OiBbRVhU
XSBSZTogW1BBVENIIHY1IDMvNV0gZG9jczogc3RhZ2luZzogZ3Bpby1ycG1zZzogZ3BpbyBvdmVy
IHJwbXNnIGJ1cw0KPiBPbiAxMS8xMi8yNSA1OjM1IEFNLCBEYW5pZWwgQmFsdXRhIHdyb3RlOg0K
PiA+IE9uIFdlZCwgTm92IDEyLCAyMDI1IGF0IDI6NTnigK9QTSBSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPiB3cm90ZToNCj4gPj4NCj4gPj4gT24gVHVlLCBOb3YgMDQsIDIwMjUgYXQgMDI6
MzM6MTNQTSAtMDYwMCwgU2hlbndlaSBXYW5nIHdyb3RlOg0KPiA+Pj4gRGVzY3JpYmVzIHRoZSBn
cGlvIHJwbXNnIHRyYW5zcG9ydCBwcm90b2NvbCBvdmVyIHRoZSBycG1zZyBidXMNCj4gPj4+IGJl
dHdlZW4gdGhlIGNvcmVzLg0KPiA+Pj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IFNoZW53ZWkgV2Fu
ZyA8c2hlbndlaS53YW5nQG54cC5jb20+DQo+ID4+PiAtLS0NCj4gPj4+ICBEb2N1bWVudGF0aW9u
L3N0YWdpbmcvZ3Bpby1ycG1zZy5yc3QgfCAyMDINCj4gKysrKysrKysrKysrKysrKysrKysrKysr
KysrDQo+ID4+PiAgRG9jdW1lbnRhdGlvbi9zdGFnaW5nL2luZGV4LnJzdCAgICAgIHwgICAxICsN
Cj4gPj4NCj4gPj4gV2h5IGlzIHRoaXMgaW4gc3RhZ2luZyB3aGVuIG5vbmUgb2YgdGhlIGRyaXZl
cnMgYXJlPw0KPiA+DQo+ID4gSSBndWVzcyB0aGF0J3MgYmVjYXVzZSByZW1vdGVwcm9jLnJzdCBh
bmQgcnBtc2cucnN0IGFyZSBpbg0KPiA+IERvY3VtZW50YXRpb24vc3RhZ2luZyBhbmQgdGhhdCdz
IGJlY2F1c2Ugd2hlbiBjb252ZXJ0aW5nIHRoZW0gZnJvbQ0KPiA+IC50eHQgdG8gLnJzdCB0aGUg
YXV0aG9yIGRpZG4ndCBrbm93IGEgZ29vZCBwbGFjZSB3aGVyZSB0byBtb3ZlIHRoZW0uDQo+ID4N
Cj4gPiBXb3VsZCBEb2N1bWVudGF0aW9uL2RyaXZlci1hcGkgYmUgYSBnb29kIHBsYWNlIGZvciB0
aGVzZSBkb2MgZmlsZXM/IEkNCj4gPiBjYW4gbW92ZSB0aGVtIGFuZCB0aGVuIFNoZW53ZWkgcGxh
Y2UgdGhlIGdwaW8tcnBtc2cucnN0IGluIHRoZQ0KPiA+IERvY3VtZW50YXRpb24vZHJpdmVyLWFw
aSBhbHNvDQo+IA0KPiBEb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvZ3Bpby8gaWYgaXRzIGRyaXZl
ciBkb2N1bWVudGF0aW9uLg0KPiBEb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvZ3Bpby8gaWYg
aXQgdXNlciBBUEkgZG9jcyBUaGVyZSBpcyBhbHNvIGdwaW8NCj4gZG9jdW1lbnRhdGlvbiBpbiBE
b2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2dwaW8vIHdoaWNoIGNvdWxkIGFsc28gYmUNCj4gYXBw
cm9wcmlhdGUgZGVwZW5kaW5nIG9uIHRoZSBuYXR1cmUgb2YgdGhlIGRvY3VtZW50Lg0KPiANCg0K
VGhhbmtzIFJhbmR5IQ0KDQpEbyB3ZSBoYXZlIGEgZmluYWwgZGVjaXNpb24gb24gd2hlcmUgdG8g
cGxhY2UgdGhpcyBkb2N1bWVudD8NCk15IHRob3VnaHQgaXMgdGhhdCBEb2N1bWVudGF0aW9uL2Ry
aXZlci1hcGkvZ3Bpby8gc2VlbXMgbW9yZSBhcHByb3ByaWF0ZS4gDQpIb3dldmVyLCBpdOKAmXMg
d29ydGggbm90aW5nIHRoYXQgd2hpbGUgdGhpcyBpcyBhIGRyaXZlci1yZWxhdGVkIGRvY3VtZW50
LCBpdCBkb2VzbuKAmXQgZGVzY3JpYmUgdGhlIGRyaXZlciBBUEkgaXRzZWxmLg0KDQpUaGFua3Ms
DQpTaGVud2VpDQoNCj4gLS0NCj4gflJhbmR5DQoNCg==
