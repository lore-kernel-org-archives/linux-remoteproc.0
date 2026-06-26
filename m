Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013067.outbound.protection.outlook.com [40.107.162.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0FC3E7BC4
	for <linux-remoteproc@vger.kernel.org>; Fri, 26 Jun 2026 09:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782464413; cv=fail; b=J5gM9mhGvgIrlQum+vWHbJdVkBu/kTKxtNlH8wgxaZeql01w3YGTAfWixASIBTAwwnQ7O4mwkHj7cvVXgUDh+ciWlpm6tp80B22EAO00fjDHd1NpqmHmqUYwYNGbm+mgUkZ1YUo4x+gBX1Dbuao6zlLOHsDGFFLxTMm9ZHwzjLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782464413; c=relaxed/simple;
	bh=NXc1HNBub9Odlxt9uHL5dZmAmGbkpeVwGZhN05awU+k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pOj+0eoKxXGkj4vARZYzJagEqo8CgyrxUHTw5B+nW8IDmjt614ELE5hZczwNN+T46jDjfvIvvzkHflooDyVQrZR3V16r0/H+yOMVADd37jJZShOkt2aTqzVlXElPmQ0ukqVGiboOkcyHLeHSoIAuvy3zLWbnAY4Q/cf2uJX7NsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Cx0spRfi; arc=fail smtp.client-ip=40.107.162.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Cx0spRfi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nrgqRnaMj0+88LdGJ/nnCj+UzOrfQrNO6Tob8SWT7/2XSehGjbRYFlcJyqjP2Ei/UhXSuEAECFg5AuEX1xn5tmaU//aiuCK+0fG6wCDxmdNl60pa8jUX4ZJ9xU2x5xaNrAshD/Jwaqlz7cpZKpb42XyOqkDhkmkvOWnRcMYDykCQfw3RkBYRW++gFsYL6xUnshraBRP6VAwfenKANbT4iz5Ad/tZu7Cn3YPLWZRKugq60xb7hbcgeis4g9GXoIO2WUIFF1DDliS51ZqTDZeSMqHXfHmKeo8/WEI7Uczj3zmFGxzeVY030OM/Gl9Q94B4TLrAXPO5TPGBJY/ZFESnYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXc1HNBub9Odlxt9uHL5dZmAmGbkpeVwGZhN05awU+k=;
 b=iMY0O+az05RuqH4zcJIDZvAUhI2k63VjDH2uijqpbG8bTW68HSBVDTh6Tl4SgPYVejJkYYfkjBpDtiqtlNKvV9XgJM978aXW8JfyexIKYYRoLOn7TDcc6mUSw8SLN34plL5GT2uOI/SfL+D30pJfy4m7OIqyRP20pmqjqWe/p/cRh/am7x0GEjcRUPi55djGFSDdBrpF7oBF6GoiEmp0TBUak6xS+Pd09pFbQ76vQkWzdHiqfDVPSYcGQCTAACBM32dARC4qC/eJC35M7q1iUEvVKHoZy4oQAs1NF1DJjq3KqSl24tnsHJZakpyCnH3uh4OokyYmD92BIhn53rA6ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXc1HNBub9Odlxt9uHL5dZmAmGbkpeVwGZhN05awU+k=;
 b=Cx0spRfin8ynbf02K6m830Tp7A64mDLL1+sWDpZw6boAiDVZ7ufW1v/FH6xA2R7C6JtpSXMpXSKZ071mEU6I/CpJNssxmUo9z2yrq2QT6lnD14MJtNQL3lIgZl8IL/lZNvhZYDhF3Ep6QvxoBAe5aIr6lneVTkV0pVG0s4uACL4eVQUn0pzPjfv4mv0wdHT2x/lw3BWFHr/cBptpdpgySuKQ4rscjo5dNE8Gxt0NLUhhAtoCR+9tslg/b+C/AblufZC3x1wmZTpbQMY6rWCrNI9d6vsguC6qdZiswGVmWImMFeKRxHgxStJuD5XJJVw2R/CAu0NDf1ny7FDHoCyBtQ==
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by PAXPR04MB8317.eurprd04.prod.outlook.com (2603:10a6:102:1ce::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 09:00:04 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 09:00:04 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-rt-devel@lists.linux.dev"
	<linux-rt-devel@lists.linux.dev>, Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Frank Li <frank.li@nxp.com>, Jassi Brar <jassisinghbrar@gmail.com>, Mathieu
 Poirier <mathieu.poirier@linaro.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Steven
 Rostedt <rostedt@goodmis.org>
Subject: RE: [PATCH v3 01/10] mailbox: imx: Forward the timeout/ error in
 imx_mu_generic_tx()
Thread-Topic: [PATCH v3 01/10] mailbox: imx: Forward the timeout/ error in
 imx_mu_generic_tx()
Thread-Index: AQHc/iZYga2ImdpEMkuKEQrmgYYx5rZKdvEAgALnPYCAAy+/gIAAAusAgAAGoAA=
Date: Fri, 26 Jun 2026 09:00:04 +0000
Message-ID:
 <MRWPR04MB12330C5851B5421F8EE723F1A88EB2@MRWPR04MB12330.eurprd04.prod.outlook.com>
References: <20260617-imx_mbox_rproc-v3-0-77948112defc@linutronix.de>
 <20260617-imx_mbox_rproc-v3-1-77948112defc@linutronix.de>
 <ajkbUNkn6MSw8txc@shlinux89> <20260624074409.5jwpWs61@linutronix.de>
 <aj43FQ7f6juXQ/tP@shlinux89> <20260626083416.xbVlbOQJ@linutronix.de>
In-Reply-To: <20260626083416.xbVlbOQJ@linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRWPR04MB12330:EE_|PAXPR04MB8317:EE_
x-ms-office365-filtering-correlation-id: 9fb034f0-e1d7-469c-1275-08ded3615029
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|366016|376014|7416014|23010399003|1800799024|19092799006|38070700021|22082099003|18002099003|56012099006|4143699003|11063799006;
x-microsoft-antispam-message-info:
 gGBTsA3hUAWwuZo2F/n3rD9uI7f858gQ5SEl3dvwfybJki/tv/frTG7Cb2q6j32qvmt2+8O66ywkPw7rDefG9O1eZij5S/StWEtlY8Cn2TstyKbU5/wMwqsWf4/lkP8NkkBL7hqE2JBZwQxg0uQJPkhaV/yzcH6ljMsxfRBxsMWkJdM0KU2IEeCC2Zd3rEU3JKa9uWRx0uHcJBmBn4r31gHhYP4YB+rlMUGahhQwaUy6PT9psqgX2MxLylfuqWC2TbCE8y4nKAO+q7nCbCG/TXLw8OIR/FfGuETz/687Ek1mxqukox1E65xUu5gvI8D74I6oXhTAkl3tNa30e60jGkUDLkhNHtTgaADu8TwuhxIg8l2qWYkHeMqrFMr2y93YRGWlokbOqNrIBfZGLhW1EMYYqNOjRmmpcX9MUOlmZoAzGExOIPFk7vgKP7/9qF6xIxFOeisrNYwz8NTP/IgQxgXO4lr+mr6vmn/FuXXBt2S+BM5/WDkRYX2p4zGr7u02AEP6lrpDhP1/cU10Ga781viiziECcCgdv5/aJHcNIRZR00z/RvjaE0bfOeVPtP25CzNdRNEJI3XhmWrRfjP/dALnsj7qCqmmeHEo1AgKgyzUyy0fj8M1fUMALbcV/jnSK+YlUFYDdI/eNociTnJaKd7yS17QCW+qeB8MIXbeze7KDzzzHe9FwzT5wh+217El4y940GphgLNm/HViAL9cs3IHXrHQhqHJ0DWZXJusjUo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(7416014)(23010399003)(1800799024)(19092799006)(38070700021)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bG1nRUlVY0J0ZkgwSzViWDJ0V2ZzNkdkTlJTRXZIVEFRdkxNd3Q0dnhibWcw?=
 =?utf-8?B?aWh6emZnRDlDWnd4UzZiakR3MzNlQkIvN0Voa2FiVWlyRDVVSVBQTFFIZ0M0?=
 =?utf-8?B?c2J4Z29ObXFKcENRMG9oTVlSdGFtNUZHdFFPUXVzbm94czFRK1haSjdJWE9u?=
 =?utf-8?B?UFQ0b0ZVR0ZOZllITlkycS8xR0hGRVlZWk9KemlIK0NNT3F2dldwdEhiSWVv?=
 =?utf-8?B?UUYweUxzd1MyM2E4WFYvVzNXZ3haemhiL20xclhHN0pHRGdxRExLRXBGeitS?=
 =?utf-8?B?b1N5U0tzVHJ4UjFuVGJMc1hTSnl2MXZPb2N5UXFFekU4VDEycDgwbmpjNVRJ?=
 =?utf-8?B?T1dHS0dTK0JFaXZhN2dKZWRQWkNWeVR5L1p3ZnVpMG5hUXo4d1NJZmJmdVlq?=
 =?utf-8?B?US9laFZYc3N4MnlSZmQ0U0dETlQ5Y3hBRFZJWGNzWmFoREpod0h5QkZtNzk3?=
 =?utf-8?B?cGdUSjNnZnJKZnhTalRkY0JQWnVUMjFNanIxSnd5TWNoSW1TY3ZuK0Nib0h1?=
 =?utf-8?B?YXROV0hNNndLa21Na3dtSWY0d0RxendvOWV6SXRhcDQzanppL1gyOEd4QnVn?=
 =?utf-8?B?NWtQZVBEYU9pL2FVZEM2VlZtR2RFZVlOSXVQMjB1UEFFc0gvMzZrQzBhTkFU?=
 =?utf-8?B?WUh1bGMvMmxPZkM4bHhHbkhWZFZpelVNN0Q3NUR1emxHOGYvdUN4N2N1b1dp?=
 =?utf-8?B?QU1WcG93Y3gvVTd1WmNDcFZscndadDN5dU5nSTJybG4vVld1MnRIZkp4VHll?=
 =?utf-8?B?eTFwOHA4Mitob3F3UDFmbjlxdDdsMW5IeVE3ZE5Ka3g3cGZxNHg1MmJabEpo?=
 =?utf-8?B?a3lwSzZnUWNIMTlyL0VvaHUxSmRUK1BuMU9vbElQWTlKalFtMHR4L2JUMHFM?=
 =?utf-8?B?Umt6NjA3NFQwVU93SWNOeXRYT2JMUnZPOHh4RGRHTU9YR2JzQlRQdGJ2QnE5?=
 =?utf-8?B?NmRJVlpXd2g2akVTS2IxU3ltTTZJYVE1a3dLR1ZkaTgrY2ZzSWpXa3I3VEZP?=
 =?utf-8?B?ZUlmTlJ2Z1U0M3E3ZktMbytzY1Z0ZEZuR2dmc0w2L2R0bGg3OUhlZGxGRUNQ?=
 =?utf-8?B?SEEzNWZHRUZlQ1pSMUJPc1JSRVhrNnBHbGJOTFNEMTNMTndxb3VzQXp3TVZ1?=
 =?utf-8?B?ZHM4VUhUSWZwcytwcGRHWURQWDdjeDlsM0hRWHZZTzRCT1lyTk16ZXJMcVg5?=
 =?utf-8?B?bjhPTEtGajIvcFVRWHo4WEMzakt3ZmloQkwzNkltbWFSMWR3SG1RZEZUN2kz?=
 =?utf-8?B?T0FXTWR1enZvUE4wcXhDclBRSkdtclJEYUJ1MWJhWmJIY3NxR2UyYmJWVDlZ?=
 =?utf-8?B?V2xJRkpxbDFwTjBuR3hISWFkME5QYlZIVEVZeS9SKzQrSW05M3lVR2FBNzFE?=
 =?utf-8?B?MUlnSmlCcG52YWQxNVpuZ1pPRjFTL1JtVmhHWmFqUHdOcFlyVjhsQytDOThX?=
 =?utf-8?B?MEc2MHk5MFJybHVveWdqUERLR2YxTmlSdUtaY1pRSSsyRzJNV0c4UktUeFUv?=
 =?utf-8?B?dWVxVmtkN1lSTnNNSHpVcnJMbWY1NmdxTmhwVEI2enJrbU52WU00QVltaGlY?=
 =?utf-8?B?aEsrRGZ2Lzh2SHRFbXZReEF6QjdZQUt0K09CRXdRdm5rSkJSOExxK2c4YXlx?=
 =?utf-8?B?dzRMNFkxdXdjektvS3MzMkxPdXlxTDZHYXprWFVDSG9tVUU0cGcwWE40WWFC?=
 =?utf-8?B?SGV5Y1pmeWV2TFdaeHUwMzh4eEZLZkNjVjRXUHV0MnpFd3c0aXJ0MGh2MUxV?=
 =?utf-8?B?bW82dUlUcG8zTmp5UFJSTHFEc1Z1VzNORVFFNndMWlJWY3FFUVpwV3R5Sk4v?=
 =?utf-8?B?Z0tNbWZEMVQ4d2JJNDNJMzNMV2tMNk42eHZ1eWZudW9yTDRONFN6c29hMjd5?=
 =?utf-8?B?MUR0bTAzVEQzdGtIV1BybDg5N2NFRUVOMEdlMnMzaDVGNDRtUWpEV3h5aTZD?=
 =?utf-8?B?TmxTVStyWFZXREZteHViQnIrU0ZMQWRHQkRHYTYwMkd3LytxVzMzMnlXNVl3?=
 =?utf-8?B?eGM1b1J2VldoZXNaNk9tU2M1RkFucmlZUEVRNUN4S2hXTC8valUxazR6dE5m?=
 =?utf-8?B?T1c0MGpEMEVPT3RoQXA0QjgvdzUyMmpNc0NFN2tLbGJ6VWo3dWw3dWZ6VWtk?=
 =?utf-8?B?UFlMcnQ1bEticzJoemxxaFlqWEluVkV6YkdiR25YbGR1anVMMkdHeTB4TTRz?=
 =?utf-8?B?c2FrWWFaR1ZmK1RKQjBPblh3ZUwxc0ZZMFhYWTFSV0xZZ3JMSVhGQXA1OGdx?=
 =?utf-8?B?bXRxT0xDZzVYdFBUczRhbnY2U1FMb0VqUTRqWENSWDQydmM1VG5icTdRWEFJ?=
 =?utf-8?B?c3FGQUxWbXhQMDkxNlErdmFrVDI2VU50Qzd4TXZCZEJ1cnplMnA0SnlzMXB2?=
 =?utf-8?Q?7s4rPOmtg55iyNBetlpqlM2P4AIe/z/I8UMFa?=
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
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fb034f0-e1d7-469c-1275-08ded3615029
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2026 09:00:04.3143
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xAoeio98sUn/6QBSWHQE96+QGVeqASaXrYX4bQNKLsXNTE8CyvBoF+TXAJZBAwIEH47LIhsfQcT09yXCD7JRwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8317

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDAxLzEwXSBtYWlsYm94OiBpbXg6IEZvcndhcmQgdGhl
IHRpbWVvdXQvDQo+IGVycm9yIGluIGlteF9tdV9nZW5lcmljX3R4KCkNCj4gDQo+IE9uIDIwMjYt
MDYtMjYgMTY6MjM6NDkgWyswODAwXSwgUGVuZyBGYW4gd3JvdGU6DQo+ID4gT24gV2VkLCBKdW4g
MjQsIDIwMjYgYXQgMDk6NDQ6MDlBTSArMDIwMCwgU2ViYXN0aWFuIEFuZHJ6ZWoNCj4gU2lld2lv
ciB3cm90ZToNCj4gPiA+T24gMjAyNi0wNi0yMiAxOToyNDowMCBbKzA4MDBdLCBQZW5nIEZhbiB3
cm90ZToNCj4gPiA+PiBXZSBtYXkgbmVlZCB0byB1c2UgYXRvbWljIEFQSSBmb3IgVFhEQl9WMi4g
Rm9yIHRoZSBwYXRjaHNldA0KPiBpdHNlbGYsDQo+ID4gPj4gaXQgbG9va3MgZ29vZCB0byBtZS4N
Cj4gPiA+Pg0KPiA+ID4+IFJldmlld2VkLWJ5OiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4N
Cj4gPiA+DQo+ID4gPlRoYW5rIHlvdS4gSXMgdGhlcmUgYW55dGhpbmcgeW91IHdhbnQgbWUgdG8g
ZG8gb3IgaXMgdGhpcyBzZXJpZXMNCj4gZ29vZA0KPiA+ID5hcy1pcz8NCj4gPg0KPiA+IElmIHlv
dSB3b3VsZCBsaWtlIHRvIGFkZHJlc3MgdGhlIEFJIHJlcG9ydGVkIGlzc3VlIGZ1cnRoZXIsIHlv
dSBtYXkNCj4gPiB1cGRhdGUgcmVhZGxfcG9sbF90aW1lb3V0IHRvIHJlYWRsX3BvbGxfdGltZW91
dF9hdG9taWMuDQo+IA0KPiBXaGF0IGFib3V0IHRoZSB0aW1lb3V0IHZhbHVlPyBLZWVwIGl0IGFz
LWlzIG9yIHJlZHVjZSB0bz8NCg0KTGV0J3Mga2VlcCBpdCBhcy1pcy4NCg0KVGhhbmtzLA0KUGVu
Zy4NCg0KPiANCj4gPiBGcm9tIHRoZSBmaXggb24gZXJyb3IgcmV0dXJuLCB0aGlzIHBhdGNoIGlz
IG9rIHRvIG1lLCBhbmQgdGhlIHNlcmllcyBpcw0KPiBnb29kLg0KPiANCj4gVGhhbmtzLg0KPiAN
Cj4gPiBUaGFua3MsDQo+ID4gUGVuZw0KPiA+ID4NCj4gDQo+IFNlYmFzdGlhbg0KDQo=
