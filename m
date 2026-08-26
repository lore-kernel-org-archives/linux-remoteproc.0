Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011038.outbound.protection.outlook.com [40.107.130.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9846B418361;
	Wed, 26 Aug 2026 18:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787769431; cv=fail; b=cpFFp1FCQ013dyADfl5Tcj7gHZoeg/FC3b4Gr00kRV3L3RCKAhyE6dmX0HHLwGCNcDHy2UPXo6rjhPO+gWDC6kC9/nlhQ19nWBRoLvrW6XcfEwii3A7LChakbh7LdgH3CIAdrBAs31VTwq7rJSdMt51wDRxKB+tr0EumF7ECszo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787769431; c=relaxed/simple;
	bh=NeWWvLHpaS6JHJc1fdOZyef6DSHs69kl/m72FnlmvgM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=b+CbDefxKYzmat4wwITj60+foLldb5YkxLpYD6ZUk0grKEpHglDzbwKb9ynSt6GQLIOn6tYekVQxMcilmyH3F6hddqsLTDI8ZaArYQOCjzIwUybgbN2yQtWFzVNHwlQ+6MkP+PEP7l0xX3rhnMGfKJH1oiV6BYrDW3axXa4xRIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fKKYb0sz; arc=fail smtp.client-ip=40.107.130.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fKKYb0sz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVpq88YIQBrT1fIrc4ODbTWJ/hZJVp6qredfM6qDtI+dWQ3n+8c/5PE6/+CS4Iu6f88KHOMvayYYiHGMDA/EQP2d50a7o0nlrtSiXrsldyFHJFO4fPAiK1E26c+ezNfz9Hmpb1Ejz910sHrlUn6+dsPuVQotW99reK4sTQqniP2ffcsWLw6Pj5eMh8S9rIV0XtQBeGRkN4RILxNFqUpGtODwCNYWD96FwPanzpwaymu2i5mT6XFcHXRleyh6h6cPqHXQwL+GfAbCXbzPtoH8XJkmjoShBrzM1jKPGE2ofY+Ht0wiNeknij28ej5V9N0ewy4HROL6ltieSClZR+xYDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NeWWvLHpaS6JHJc1fdOZyef6DSHs69kl/m72FnlmvgM=;
 b=F7QQ5nDLckk7tOhSGENCfQxPUepj/3i+bCYESSZEUmAUaJy1+6ZjRdJKT3Rm3zr1jVaXH+GB5Tedvz5Vy9lF06aeWkiBiLMP/rtNIMLveSJ2ELE3wRrhmtfqPHav4y+V1eQqidSGg+TEvtiUZ+akHLMF9bj2HFuaCcqXgltORFLJGDXaQ166REn11z5h8dQ0+8OERZYihsklHo5V6Uqca98KTPSgkazkKSDxN+pYf6RXMaoIgMkVqnug5u4f3gR5bJtmpJ1Y3kFph71pSkNvOKtdrxcIxCAJkNC7qOO/72UVhqrg6hAZ0EqA6TBxKaqeNse/DlFjKkgpnspxtmTrDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NeWWvLHpaS6JHJc1fdOZyef6DSHs69kl/m72FnlmvgM=;
 b=fKKYb0szlkA+R0v3A04PlhVxJhtnw6NKUd6Aday/Pnhb+rkwOMjP8cQsT6R4DSdWU6AaNQdcX7qyQsbhsJm8mhejxDH950WRnEW+bznsc9fyMdX1BQJEtoXXiwvOge5Hc9lHug9NLkc/CZ2Q79jnJxiKco6QS7879TO7F5vpjDFOCOZUAOJyUITr5F+Z8oS05hIcJM2KKDz043aTr1uQ8UawaNwbx7mGYC/GHQZRghWMuCVYU9liefbpZnBQk11A1IBpDZi1mr+zXHZ1EqmJCuB6j4AE44Rba3UjjYuHvqkct/dB4USAy/vGA+MC+d6CMLnxwdtXGirwml9v9Jm+dQ==
Received: from PAXPR04MB8093.eurprd04.prod.outlook.com (2603:10a6:102:1c9::23)
 by VI0PR04MB10568.eurprd04.prod.outlook.com (2603:10a6:800:26c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 18:36:55 +0000
Received: from PAXPR04MB8093.eurprd04.prod.outlook.com
 ([fe80::b74d:9238:af4:f489]) by PAXPR04MB8093.eurprd04.prod.outlook.com
 ([fe80::b74d:9238:af4:f489%5]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 18:36:54 +0000
From: "Shenwei Wang (OSS)" <shenwei.wang@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, "Shenwei Wang (OSS)"
	<shenwei.wang@oss.nxp.com>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, "b-padhi@ti.com"
	<b-padhi@ti.com>, Andrew Lunn <andrew@lunn.ch>
Subject: RE: [PATCH v15 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Thread-Topic: [PATCH v15 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Thread-Index: AQHdNYneh1bgHdgnLUyi2ZVbdKkWPQ==
Date: Wed, 26 Aug 2026 18:36:54 +0000
Message-ID:
 <PAXPR04MB8093FA9283357BF9604BE39F89AE2@PAXPR04MB8093.eurprd04.prod.outlook.com>
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
 <20260721204704.400781-3-shenwei.wang@oss.nxp.com>
 <CANLsYkxZbr9hKaJJGXwYXErLwQ-A07eb-oeNXY1CceHHa0Tdmg@mail.gmail.com>
In-Reply-To:
 <CANLsYkxZbr9hKaJJGXwYXErLwQ-A07eb-oeNXY1CceHHa0Tdmg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Enabled=True;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SetDate=2026-08-26T18:32:38.0000000Z;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Name=NXP
 Public;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_ContentBits=3;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8093:EE_|VI0PR04MB10568:EE_
x-ms-office365-filtering-correlation-id: 6fe3154b-0edc-439f-e695-08df03a100dc
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|7416014|19092799006|376014|1800799024|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 4VgjnaDkqvhsEqp1ED+gu6FkWLkmyAtqHOs1Lr1KNyzAU0IiUR0cnVluHamNGXUv//cALpz8SE8OTFYon6MDtqgP+ZJDFHP200Fej2LCSVxEOTT/iqwSxubHkU5L9yazljyBGp9QHUjhCWoW7Na4+UER6zZA8Z329u3q4SLgnlcvNwuErt1WAL/mW5/YoFbd1P5rLzSdSxgnL44PKpogketgBIUZ0+8X50WZXghyD4Pl1oefQBmmi+bDoAHI3riuAq/E0/mm93wAYXM37OWkRycWYxj7Yv/y1moiqLD3oZtCUxbtB/NzDOshFT1N3D7OJeHhBdRKmgyyZETij9BBRFQe1g/8Hj+ico77A2fKK+KvX8xtxuoOL/JuFwmv/2F+w/ISaq1dmvnYcMkA8jL2sv8Tce/sbrzH4E+pRikb/XcnQ9kKBXfoVEhTcdRanznjzE9l7sWST3yfDu6sVkOGyihLL3gxuvShMRjYYVjM0sJunJmVShDZ6jpsJYhC6EBZBhY76m/eG+w39DRBA4AFMh0a7FH7G0y0d10l91b/b6fdVVZktSOnguFTmu7ODlRuUYKO9qnXnRbKqYRiUA/C9pqfbCqHHAGcFiuC0iFM3ZmtLCUl13ymIc2ubhQgUILxtFuScDS2GYFAAtwis/qHXh/h4N0uz8NcIUQgK8Fbcx0lL9ePzbNEISrQYugM37P2pnyPDsvp60iJ/M938WJ44fJiDEhARiK4lqNL04Y4+ZI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8093.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(19092799006)(376014)(1800799024)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TENLN3VtVWtFYzRFZWFESTY2MHk3cnM0ZU5UaUNqMGtJQnYyVG9BQXpacFJ6?=
 =?utf-8?B?L2Exem1qNHV3S1BVU0NKRW83bjNCSkpnWW1LRm5zQWtWcEozWTMwUDRLYmZI?=
 =?utf-8?B?S1VyTnFTQjlNZE5VYmxqRUZYQW9jd0F6ZDI1SWFMTk1GdlEycm0rU1AxSXI5?=
 =?utf-8?B?S1h4bUE4WXJGclRTTFJKaUkvSGdKN1UwbHNsOUdabXU2Q3JiSUlDNXVtMGl6?=
 =?utf-8?B?aG5jdzVud1l6QzYwRGRiZWtWZ3lteGh0Tmg2MVhHYWdySkpVWm5IdkszS2xC?=
 =?utf-8?B?eGZsWFh0NHZ1R3MxeW5vNlF6dDQ3cUFNTEJLOUVpNlAzOXFmRFF3SGdZQ0pY?=
 =?utf-8?B?RTYrMVNJZW1icjd4eFJoR2NkTDF5cmtsR3pKU3NCdFQ3Z0hUWUo1MjRqYXEr?=
 =?utf-8?B?NkZ2QWJFcEJwYkNpaVJ0eURxWHNTZ2E4U0NidTFvaHJabzNpanREVEJ3VkR0?=
 =?utf-8?B?Zzk0eGtSYkFtc3JVWWlxRUcwekFHTncvQkI0OWtrTXhKZFExSGNPVDduR2V2?=
 =?utf-8?B?Yy9GbmYvemYxTEV6TDFTbG84c2FvKzFnWFJMcmw3SERuNjk5c1ZES3NZTlhC?=
 =?utf-8?B?QlNIZTY4NEpoTW1KcWNZYUFKdVhFaFR6eG00THo4Rk90Wkc1blN4aWpvZ2FU?=
 =?utf-8?B?Vk40R1ZIa2d6UUEvNU40SDd4Tks2Y0tLNVNqdXNCNUhEakRtTkJRclJqTU9X?=
 =?utf-8?B?UE1UTlpMcjhyVjZObmJZSmNZcSsrN0ljcFlYMmRDT0d6ZjRHR3BEVXlNVGQ2?=
 =?utf-8?B?bmRFaWI0UENQY2tDMHcweDlQcEN6ajdLblZhZFpjZG5JRG1MaC9QUEh2dkVU?=
 =?utf-8?B?QTJaSmJFbGV2NWk0K2piVUIyV0VoUVdUUUVvTEhaY1dLTTlWNGI5T09yS3JX?=
 =?utf-8?B?MGRmcjk4SnVIdVFaQ0p5SzFaaEpadVRNbUtQVi8yaWJDTkRqTEo3dXlrd1BV?=
 =?utf-8?B?NkdWbDFzQXlGbTA1ZGRqK2hObldQV3lsNHVkaExjRzdDVjBjRy9YdmM2T2JN?=
 =?utf-8?B?b3RkN0RwVFY3c1BMZ1RLOTZBaDBscEN1OFk2bkhyblRlck5XZEV5WjRrd2xM?=
 =?utf-8?B?eUFmcFFtODJPK05pdjRlYm5kSTBSbC9KN0QrWlhqN1AxSjU3UStnWjY3OGhm?=
 =?utf-8?B?S2VhaXZBaWwwWnJ0cHAwcHRNN1lyR1RtMkhZOGpjZ05pQWZibVo2WXpYZXNv?=
 =?utf-8?B?VWZjTGprZW0rYW5wcWZ5eVFzakFPeXVNZlRhVEc5ZjZKeTlMaWJPZG9DMGFj?=
 =?utf-8?B?WlRsbldVYk94ZyszZGdvek5KR2RLeWxwV1A1MEpRNVRrbkFIZ2Y2VkhpT0ta?=
 =?utf-8?B?amZGMGdoNTFveUtHMW9RSC9hT1JxYVVmWmw4TUdqUU11RExhcFZiOHdnRmRL?=
 =?utf-8?B?NEM3Z1ZtR3l3MXU2ZmxMUWtESnBxTytxVXdzSmF4WkJCUEM3MmkxSUtTSW9q?=
 =?utf-8?B?RStVUGdDbEFWZDdTTXN2a0RHTE0yQ2FXOXZIdnNNTm5wWXNFaW5GMGJ3RXhM?=
 =?utf-8?B?a0hLSHhwYmJndDlraDZ5UUhaL2NNWXBFV01nT3VaVUpncnJ2eEc0WW9GNjhT?=
 =?utf-8?B?R1VsVXhxZ2ZHN1lsc01QOVRyTjQvdVI1Vm54NXB5ZHNZTmtJUnVRbDlkWWFs?=
 =?utf-8?B?V0RVdEtmMnI4Y05pRGI5T04zaVBsT0l0ck5KZ0pQY0F5eDZKOXMrRXhlUStI?=
 =?utf-8?B?cTR4K3hyOFZyMHNCVklZai9adksyeDlRYmRGT05QWlZzaXAwUGNtdUVDclVQ?=
 =?utf-8?B?b3FQLzdnVG90QW00dllMMjczNTlKbDVzMlUwekdPNUhTMml0Z0NtUCtXU2d2?=
 =?utf-8?B?RlFKdG1YTFFWSGpXcm5tM2UwZktHeDQrYjBHeVE0N0hPRm5iV1BOTm5ybzBL?=
 =?utf-8?B?RCtOeG1RV1k3K204ekZkZ3V2Q1pGakJpVFd4aFNEdkNtQkhzUnR1a2lkd08x?=
 =?utf-8?B?ejBvWTJjVmZOeVM0MVRxaVlTQzN4ckhDb3BDMnRPOUhVVVp0SW82T0JNVHBP?=
 =?utf-8?B?K3hLL3pVV2tFNEh6dW0zUExJUm96aG15cVpOL2VBYjJpOFRWbzc3dytjeS9l?=
 =?utf-8?B?VW9zQmhiaFdGU0o0U0VubFNVQ3hWTXpWSG5MaENMUG5BK2JFVnMzU04yak9w?=
 =?utf-8?B?alFVT3kzcmZlNFZnUGd1TFVRVGdvTUZXdmhOYzZYS3FHbmFlR3N5cVpBQXlm?=
 =?utf-8?B?YVcvMEhjQ1l1dTk4K01aYXI0MTdONTN5cTdZT25nZWJibVFvMEM5NmJsb1dm?=
 =?utf-8?B?QjU5S2VGaDJ6UDlGb2dHNUpydWFpWTBmeXFNV2w2MHowTmNrMUdyM201SDlQ?=
 =?utf-8?B?cnF6cHg1b0dnKzNvdmI0bXFjZEFUcmFCK3lRMWdqRTJFTGJ5ZGlpQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8093.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe3154b-0edc-439f-e695-08df03a100dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2026 18:36:54.8896
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T1fc9BJBPe+l7RlBtVA0NoIJasxmWfX6N6dNnNmrkFw+KwozlQ5FYBdarTmFfCQKKRExW2Glo9xfpP3pIQBr+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10568

DQoNCg0KTlhQIFB1YmxpYw0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBN
YXRoaWV1IFBvaXJpZXIgPG1hdGhpZXUucG9pcmllckBsaW5hcm8ub3JnPg0KPiBTZW50OiBNb25k
YXksIEF1Z3VzdCAyNCwgMjAyNiA5OjM5IEFNDQo+IFRvOiBTaGVud2VpIFdhbmcgKE9TUykgPHNo
ZW53ZWkud2FuZ0Bvc3MubnhwLmNvbT4NCj4gQ2M6IExpbnVzIFdhbGxlaWogPGxpbnVzd0BrZXJu
ZWwub3JnPjsgQmFydG9zeiBHb2xhc3pld3NraSA8YnJnbEBrZXJuZWwub3JnPjsNCj4gSm9uYXRo
YW4gQ29yYmV0IDxjb3JiZXRAbHduLm5ldD47IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+
OyBLcnp5c3p0b2YNCj4gS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25vciBEb29s
ZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBCam9ybg0KPiBBbmRlcnNzb24gPGFuZGVyc3NvbkBr
ZXJuZWwub3JnPjsgRnJhbmsgTGkgPGZyYW5rLmxpQG54cC5jb20+OyBTYXNjaGEgSGF1ZXINCj4g
PHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+OyBTaHVhaCBLaGFuIDxza2hhbkBsaW51eGZvdW5kYXRp
b24ub3JnPjsgbGludXgtDQo+IGdwaW9Admdlci5rZXJuZWwub3JnOyBsaW51eC1kb2NAdmdlci5r
ZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBQZW5ndXRyb25peCBL
ZXJuZWwgVGVhbSA8a2VybmVsQHBlbmd1dHJvbml4LmRlPjsgRmFiaW8gRXN0ZXZhbQ0KPiA8ZmVz
dGV2YW1AZ21haWwuY29tPjsgU2hlbndlaSBXYW5nIDxzaGVud2VpLndhbmdAbnhwLmNvbT47IFBl
bmcgRmFuDQo+IDxwZW5nLmZhbkBueHAuY29tPjsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7
IGxpbnV4LQ0KPiByZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZzsgaW14QGxpc3RzLmxpbnV4LmRl
djsgbGludXgtYXJtLQ0KPiBrZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgZGwtbGludXgtaW14
IDxsaW51eC1pbXhAbnhwLmNvbT47IEFybmF1ZA0KPiBQT1VMSVFVRU4gPGFybmF1ZC5wb3VsaXF1
ZW5AZm9zcy5zdC5jb20+OyBiLXBhZGhpQHRpLmNvbTsgQW5kcmV3IEx1bm4NCj4gPGFuZHJld0Bs
dW5uLmNoPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxNSAyLzVdIGR0LWJpbmRpbmdzOiByZW1v
dGVwcm9jOiBpbXhfcnByb2M6IEFkZCAicnBtc2ciDQo+IHN1Ym5vZGUgc3VwcG9ydA0KPiA+ICsg
ICAgICAgICAgZ3Bpb0AxIHsNCj4gPiArICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJycG1zZy1n
cGlvIjsNCj4gPiArICAgICAgICAgICAgcmVnID0gPDE+Ow0KPiA+ICsgICAgICAgICAgICBncGlv
LWNvbnRyb2xsZXI7DQo+ID4gKyAgICAgICAgICAgICNncGlvLWNlbGxzID0gPDI+Ow0KPiA+ICsg
ICAgICAgICAgICAjaW50ZXJydXB0LWNlbGxzID0gPDI+Ow0KPiA+ICsgICAgICAgICAgICBpbnRl
cnJ1cHQtY29udHJvbGxlcjsNCj4gPiArICAgICAgICAgIH07DQo+ID4gKyAgICAgICAgfTsNCj4N
Cj4gQXMgSSAoYW5kIEFybmF1ZCkgaGF2ZSBzdGF0ZWQgYmVmb3JlLCBJIGRvbid0IHRoaW5rIHRo
aXMgaXMgdGhlIGJlc3Qgd2F5IHRvIGxheSBvdXQNCj4gYmluZGluZ3MgZm9yIHJwbXNnLWdwaW8g
bm9kZXMuICBJIGFtIGN1cnJlbnRseSB0aGlua2luZyBhYm91dCBhIHJlcHJlc2VudGF0aW9uDQo+
IHRoYXQgYWxpZ25zIGJldHRlciB3aXRoIG90aGVyIHZpcnRpbyBkZXZpY2VzLg0KPg0KDQpIaSBN
YXRoaWV1LA0KDQpXb3VsZCB5b3UgcHJlZmVyIHRoYXQgSSB3YWl0IHVudGlsIHlvdSBmaW5hbGl6
ZSB0aGUgbGF5b3V0IGJlZm9yZSBzdWJtaXR0aW5nIHRoZSBuZXh0IHZlcnNpb24/DQoNClNoZW53
ZWkNCg0KPiA+ICsgICAgICB9Ow0KPiA+ICAgICAgfTsNCj4gPiAgLi4uDQo+ID4gLS0NCj4gPiAy
LjQzLjANCj4gPg0K
