Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013031.outbound.protection.outlook.com [52.101.72.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E3E2857EE;
	Fri,  8 May 2026 03:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778210217; cv=fail; b=u7xZacheXOEdBWDtiMECeawDDZ3xw4t/7+vrh0FBaTaZ9e0mrF8rNa/U84i7xFNsxBgCPZ8Dfzb0pGQCJ7YHiKGm0Yl0ljrld3OzAk3qP+sHQsEoRR+ExE0qQ5jsfbRG+a/Jym8mOguvm4VazYzHzdwIxuNbKTgTKkIzS8Zsdfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778210217; c=relaxed/simple;
	bh=Y4ziLJ4J7yAIidk7yuQVRWoGf+VZjaZIJJOb4QNk45Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Md1yo7Ifivjtj6SPzGTK8iEEgT8L/zYEtDVaIcK9/P0uGn0nzH7LoYEIGuTxyZ7+DpaVasF5ugcXgmlZXFDfgaKbbw9iBHcHr+EARGmVHYzUEGn3Hfy5ccqQVVlonmTMo5Zz9H/bDMynreyZ7/xPTxsjHYZ1sRVZIx34VUz98pw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bgcuJ2Xa; arc=fail smtp.client-ip=52.101.72.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bgcuJ2Xa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wEmBjp1DJRBY7nQcqpHPigKw7KsWnH1CxHGbMsV5AFDcuy/RVhAIcZag3vvUuxE6k/66VQ7teiQryd0yUAhrNTvkmD3W083kgrU3k2q8ej5EQaWFJkwk6eZdDZk6hsKUkVHGwRQUbiZOGCJwoGxCtkj2u2RSz9gmjHsdPjGQj4JueyejhxWk7wZ3DKeQ+urE/8F//VuGqN0H5ZiP358Bdipn2hd8nwCjNXkxr2FiFnghsR1U1e2qMUJQCKRropnIGWYpF+8ppd7rUz6YYMFt9VPF4Br5I2w2WvNLA+NogarhbSQN+GUNfd8N0RLzVA3Ln5WTcp6dcKW+sDch1nAYxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4ziLJ4J7yAIidk7yuQVRWoGf+VZjaZIJJOb4QNk45Y=;
 b=TY9TI1SnlwL1C4c0Z1qWob4/QGO3qkPVXfCkTqtMJUkYmEOFCqQUvc03ORLgiQJmcz/YnH6BsC5ESzh8WJYvBWT2RFYfv8Ail0E4OxDl/oRlIVTBGLnksMkrFGBYGBh6krL+5lspLGYfLEtzrRPBrA8YGEyWSWLqqDEMK3Dv/YXJvo5DavWWHYDH36rZ7R59Zc61kl6i6DRAy39MOmrJ4eoLU/6fAdOxnjFk2wIDMmdh7Lpjt3R6Pa1ornbfiQZKGuJZmHNUMSWmz3vtx7uXI3uLlc2V2Asmx2xFE/Dils0Sfdn1HDN45iwcM0CgV9PjXUzOsJS89P009bSk77cSHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y4ziLJ4J7yAIidk7yuQVRWoGf+VZjaZIJJOb4QNk45Y=;
 b=bgcuJ2XauvXBVIVoOHJhvNryZ1TNX11nesOjAnNgKLuDfVqxSPkuLA4Mn1LFd+d6OKxe9fA/iqSQybuyCmcxx+P76RxWQICxjSjdwX7QzUdA3Pm+WGFA2506hDtT6FB8leKKXEpcz+vCuic8MX86x95/0CieWus1ClsfcOtD5suZClmUEQzpLKuWeoDvwrfc8a/i7aZIwAVLgg5co01efBgL0yqFxDGQW1X5uO+K/T7W3rBE3al/IEluxS6l8wlR6IQ+/5/Sy4KPTokQR5izClTR+W8nVLBZ0ym5MRWzgUpGdqAUysYG3mQZAGUbaH9Abm+0hQTf05V7P7pPQDJvsg==
Received: from AM9PR04MB8196.eurprd04.prod.outlook.com (2603:10a6:20b:3e9::12)
 by AMBPR04MB12613.eurprd04.prod.outlook.com (2603:10a6:20b:77b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 03:16:53 +0000
Received: from AM9PR04MB8196.eurprd04.prod.outlook.com
 ([fe80::fddb:8654:17a2:b4a1]) by AM9PR04MB8196.eurprd04.prod.outlook.com
 ([fe80::fddb:8654:17a2:b4a1%6]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 03:16:53 +0000
From: Jiafei Pan <jiafei.pan@nxp.com>
To: "Daniel Baluta (OSS)" <daniel.baluta@oss.nxp.com>, "andersson@kernel.org"
	<andersson@kernel.org>, "mathieu.poirier@linaro.org"
	<mathieu.poirier@linaro.org>, Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>
CC: Daniel Baluta <daniel.baluta@nxp.com>, Jiafei Pan <jiafei.pan@nxp.com>
Subject: RE: [PATCH] remoteproc: imx: use device node name as processor name
Thread-Topic: [PATCH] remoteproc: imx: use device node name as processor name
Thread-Index: AQHc2Gih4qFT+2OzSkqlTbweMT8A87X3p1GAgAvXejA=
Date: Fri, 8 May 2026 03:16:53 +0000
Message-ID:
 <AM9PR04MB8196C5ED52E80BDFE30785048A3D2@AM9PR04MB8196.eurprd04.prod.outlook.com>
References: <20260430061701.27270-1-Jiafei.Pan@nxp.com>
 <830f0c65-faca-4843-a6c9-693db7562037@oss.nxp.com>
In-Reply-To: <830f0c65-faca-4843-a6c9-693db7562037@oss.nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8196:EE_|AMBPR04MB12613:EE_
x-ms-office365-filtering-correlation-id: 92725c01-f9ff-4d95-e147-08deacb040d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|19092799006|18002099003|921020|38070700021|56012099003|22082099003;
x-microsoft-antispam-message-info:
 8D5nuhilfPozvX9MnnP+CHjyUY4Xmupk4MC0JESa4AmEPI9zG8AdGflvCyxJamJ/PM7WBQuNkWjz9xgswQsJR4S3ICvd2Ll1afqtL1edp7Krh9pACiu/mdHat4kq1VXPumj8cBxoZtOOV46DrE18pSiv0zfApMguVqInJbGOGJAYfoouJEIm9JWBN2ytk4vz+WuGnZa1QYa7p6UaPAVP+wkUzW3W5lEWMiiiP4oVdWTJKHEY5NmkYpAxRB+QAhYu9GD6Tai3bEDQrEY+ERd/MB+oRs2/itTjulkIvrb5vCdunXpbO2LCFSFYg1Ok3UAKWycdGrYv5mzGNS4fvbsyune56BohFJ7VrmvmKlw/69We0gY3+OJtSs88qJ3kRgEW47VLb91ws9KnD5Qdafq4qONTKHnQfQaoJP+bkQlwS1H1HeOJdfsduEHrMi3WziZydmOGdDUh/GmBVM/noFRRs9xz/oxixPU6i2SyfiYzxiW13KeZaa9lWfEQpmEIszh1qBPS3xaSlIC9xsa1LS/qjqpqMDm1xBCEmNQCYmtftX3P5+N7FZZD7cqg6a27EaPz26R7avtvQk1hyXaKbYeRAoLiSMQ9kvcma6eI0UNRsqNgEwLVoIAmbBYdtlkqMXrEjyT6wzq206PF/dZIt398vMWqtWttlHRy9MIZFymZsobqL38zwIUZ97mbfUb39ARYgLmeY4U5G7lrSN3T9rF0QEAmOfDNMXGNXWq9FctfzbnBKEHvj1XhiyppO4Dl4BoXjvWFCOD8ix3gDxVykOIvjA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8196.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(18002099003)(921020)(38070700021)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OFFNdTF3Sk0wZjh4L3NlVkwwZUlrSG1teE8rK3g3Y2dYQU4wR3FuTGx5WVc5?=
 =?utf-8?B?eGs2Yjh1ckpyeUZZVHI2YXIvRlorSFM3R2U1UWM1TmhGcHU4cjF3RmY5bGFY?=
 =?utf-8?B?bGpmOWRWdjcwNHdNR1pMb2pGeE1ieXRMSjdoQ0ZHUlQ1VmJCbm1yb0grNzA5?=
 =?utf-8?B?b3N3cE1Sb1A2WjMwMUx3YldBMkcyMU9mTzAxbXdYNmJ5eTJGcDdkYVd0QzNY?=
 =?utf-8?B?bmx0R2ozWCs5eDdOTXZJaE9qVkMxK3IvZENZRUlYNGI5cUhOd0JaM2cxVGo5?=
 =?utf-8?B?blZDcUU5UmFPNXpLa2l1ZStDYkhmYndBSFhqZjF1UFQ0ZjAvVFowOGdGQ2N4?=
 =?utf-8?B?M1JiNnRVSTJJMUlGb0hweGR5ZnZFQ2dNZXFicWhQZGZxTUQxTUkrMEdDOUdt?=
 =?utf-8?B?NlBtbHBKaDkxSmR1TkdFd3pWVTBtcGtqcG1mT0lYc0NVdjhINkE0cjlqYVhW?=
 =?utf-8?B?ellSb3RSTkFJUFBwYlVUTit3Z1hhOVI5Q0Jrck5tejV1bUx4eGJjcXZ5Z2Rl?=
 =?utf-8?B?WmNxTTc1N0FUWHFPYjV2TEFNWEtlYzBJR0dKK2lNVkJ6aWRyTk5VVFhraU1q?=
 =?utf-8?B?L25mYVJCWW9LUG56UlNZY1FlMEZwYXA1TzZhN3lIdzQ1QXZTZk5FMjA5OE5r?=
 =?utf-8?B?WUFpZ1pDWDBDQ1BRUmFYa1FwSkNNbTFnbFowaDRYV3JvTXBBQ011SlhzMGpk?=
 =?utf-8?B?SFp5SU1hL1pNN25ubkFmenE0TnJSUXMwTTR5WlV1WTRpN1YxSWhvODFrekxj?=
 =?utf-8?B?NWhSZk52WFBsR0NNR0JXNGZzdGxPRE9GNVVBUS9udFFOcE02ME1kNUpmUnNO?=
 =?utf-8?B?T1puVXJiOWczVG1oNUdVdGV4Z3RTd29zM0ZIcFRmbXZiWUtndE1qMVZkc0lv?=
 =?utf-8?B?WUhFckRoM2xvZGk2djJwVDZ6YnZoTGl2amtQSnhZaGUza0t3eGltbllnK21L?=
 =?utf-8?B?cEJIYnFvSXlsOFVWWThrdXROZU9BSC9Vekc1Q3NaOEliYlZZYjFHMDBmc0dr?=
 =?utf-8?B?MndMRmV0b2lZbTEzTVR5aEtIRkkyMmtId1JpaWljb0VwaUVpaXdJRFlwY0xo?=
 =?utf-8?B?L0I5UlB4b3NIU2g5OHVjd2pURVdub2hoSVhRaXB5QXlLaWFyaFI5cGxUR0xH?=
 =?utf-8?B?MFJCQ24zazF6aTN1T0pNQXN2cjlKUVdSREF2VVlaYy9zMkVQcDVwenNEL2cy?=
 =?utf-8?B?cTR0c0lFdjB3d2EzYnBrRFNxeWFzanpJWkNySGx4Zm0wLzV4QkFyczU5UnFU?=
 =?utf-8?B?QVBsMjgxNCtTNExCL0dvdGZHNHdQcXQzUXhsVHRjRU5tQ3hhMUtHTGxmWkVx?=
 =?utf-8?B?Q0NLS1lkaTg1Vk9TUW9mZlNadk5wVU43V3VlTjduSHA5a0gvdFQ4RU9ldDZQ?=
 =?utf-8?B?YjBUSEJzUEo4cnp1YXkrWW9McjRpQmRUUG5QL1JqVDAyL3pWY2FqUTdhNlVP?=
 =?utf-8?B?S0JNL2Nwc3I4NXNiM3JwMzJUZEkxRytrbkYrT1kvam8rRjdQbGV6dG13bm05?=
 =?utf-8?B?ajlldnFpYk5md0gzaHVHNTJoWGFyKzVNaHRtdHBKQkwzeDU4STNaeDI1ckV3?=
 =?utf-8?B?YmpQS2NOT2dRQUpzZlNuaDVwaVFBNUlBcE4ycXEvRFBGR0lScFlaTXB6bWdO?=
 =?utf-8?B?d0xWY2oxbThNK2JoMWVuZUJheWsxazBmZG9XWkcvTk5ObHVLc2NjYWIxRjZ0?=
 =?utf-8?B?L05FMjkwdCt3UDhLUEhlQXd1SUtXUUU4aFRKT0M1T1pIZ0hBY3lyR1NoTUEx?=
 =?utf-8?B?WDJuSHdmZkV1YU5uRHJ1OHA2MjJMVUZQSm1TQnhCREZpSkxMMkw3ZjY2S2di?=
 =?utf-8?B?LzVQNUlOTmZZT1JyeUlObTNpQVFxUE94RFRkUWNnZERZWmhQMm9DT2c5ZWVr?=
 =?utf-8?B?RW1iKzJmR0QrdEtSOXB0SUNQYTRxU0wrbTFZZ2VJN0gwbXkxTTdkZnMwOW1C?=
 =?utf-8?B?TG03REpkYUFOMkxmQVVMNWtocmx6Y3J5cFhkUXhFamJCMjlkdGp0YTZ3YUor?=
 =?utf-8?B?K0V6eVdaWElBWmFhRHVtN3ZnbjA4UUFrbERPNTk2Zk5RSkIzS0Q5QnYvNHdY?=
 =?utf-8?B?QWdDWEVGZFhySTdUaG9EeWxmS0c5SEhNVk9CVU1wU0R0UzVlbklXdmlFZ1NL?=
 =?utf-8?B?Y3A2cEl0b3F3MzE3azFnRnMwZWF0T0kreFdwcVBmTHBWTnhtZ1dhQlFLUkxT?=
 =?utf-8?B?WXdGMXlCSzcrT1J1YWNxRmVrYU9TUVQ3M25Sc1ZQR0ptVTlhTlEwQlo3YXc3?=
 =?utf-8?B?K2JLcEpreUNxMmg5SmNqV05UVWtPMmhGaFROYkoxNGRkRmR0MURsYmZNRTRX?=
 =?utf-8?Q?WxN/n4q8HCL3NU3Iki?=
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
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8196.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92725c01-f9ff-4d95-e147-08deacb040d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2026 03:16:53.4824
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0ht1m4nwvUup+Z1gjb1J9wSDGIoP65SCne/XC2ykukSxAFKOs+V5R/+5in7JPjTveVCJWOq+23uJi4Oes8RIhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12613

PiBPbiA0LzMwLzI2IDA5OjE3LCBKaWFmZWkgUGFuIHdyb3RlOg0KPiA+IEFzIGN1cnJlbnRseSB0
aGVyZSBhcmUgbWF5YmUgbXVsdGlwbGUgcmVtb3RlIHByb2Nlc3NvcnMsIHNvIGNoYW5nZQ0KPiA+
IGZyb20gdXNpbmcgZml4ZWQgbmFtZSB0byB1c2luZyBkZXZpY2Ugbm9kZSBuYW1lIGFzIHJlbW90
ZSBwcm9jZXNzb3INCj4gPiBuYW1lIGluIG9yZGVyIHRvIG1ha2UgdGhlbSBjYW4gYmUgZGlzdGlu
Z3Vpc2hlZCBieSB0aHJvdWdoIG9mIG5hbWUgaW4NCj4gPiBzeXMgZmlsZXN5c3RlbS4NCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IEppYWZlaSBQYW4gPEppYWZlaS5QYW5AbnhwLmNvbT4NCj4gDQo+
IFBsZWFzZSB1c2UgZ2l0IGxvZyAtLW9uZWxpbmUgZHJpdmVycy9yZW1vdGVwcm9jL2lteF9ycHJv
Yy5jIGFuZCBjaGVjayB0aGUgcHJlZml4DQo+IHN1YmplY3QgZm9yIGNvbW1pdCBtZXNzZ2VzIHJl
bGF0ZWQgdG8gaW14X3Jwcm9jIGZpbGVzLg0KPiANCj4gDQo+IA0KPiA5YjI0NTE2NThhZmE5IHJl
bW90ZXByb2M6IGlteF9ycHJvYzogVXNlIGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldCgpIGZvcg0K
PiBzY3UgY2xlYW51cCA2NWFmNzIyYWE4NmZjIHJlbW90ZXByb2M6IGlteF9ycHJvYzogVXNlDQo+
IGRldm1fY2xrX2dldF9lbmFibGVkKCkgYW5kIHNpbXBsaWZ5IGNsZWFudXANCj4gYjAxMDZkZWZj
MGZmNiByZW1vdGVwcm9jOiBpbXhfcnByb2M6IFVzZSBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQo
KSBmb3INCj4gbWFpbGJveCBjbGVhbnVwDQo+IA0KPiBUaGFua3MsDQo+IERhbmllbC4NCg0KVXBk
YXRlZCwgdGhhbmtzLg0KSmlhZmVpLg0K
