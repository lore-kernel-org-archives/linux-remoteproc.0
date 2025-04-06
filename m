Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8B12E62B0;
	Sun,  6 Apr 2025 06:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743921999; cv=fail; b=oD3jaSA9466VwCigJ86gcdR9O+kP4wX980TdlC6draIiDXApzLxxWOtDkzjK7cm2Grs0NR/In/Hollvk0KZ15wue5TYZtYZNHZGBUuooqwnKnBl6OW62xCo2+UzrC8075CYc9o2MkiD+zSifCa1gvQv3d1AYtOunvoQtDU19Rq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743921999; c=relaxed/simple;
	bh=UknwBfdW+8fAEEm5EVn5D0HHqRDL+Q5HYqcL7RIvb0g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rjxsOFtMVa84qff0X+8UjhUwCOMeAQw69eBSSRpwJUaZA+ST8b9okKUQDp4NyCSDV7c7rNyFf9Cu80PytWNpDioCZkxVzzjYBVi/shvpg1z4bPflEff/gwN8we8GgqEYBiS0oppE9nRf6gmIqUCT9WIB2mLH1wC/RlhNTzpSPOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=n4bh288r; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=KKQATqpk; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="n4bh288r";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="KKQATqpk"
X-UUID: df421fe412b211f08eb9c36241bbb6fb-20250406
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=UknwBfdW+8fAEEm5EVn5D0HHqRDL+Q5HYqcL7RIvb0g=;
	b=n4bh288rVRWqgUQ5u2y/57w1+kC+dD1TiW4M8g0eqff1+HY3UNFfyGkH1boe7yK4LNrJrnnA+GmTlGgo0pdtxLlUYqTy7Le7giE3IUAJTioVTEDgruR94FIqRoHhzUQs0qCnDym2u7PKx1kvJ2IZQSeojP6HVZttKS9xpzfDy8g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:3a60781d-6f63-42ad-a80b-64a56d71a1f6,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:375d39c7-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: df421fe412b211f08eb9c36241bbb6fb-20250406
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <xiangzhi.tang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1008446534; Sun, 06 Apr 2025 14:46:30 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sun, 6 Apr 2025 14:46:29 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sun, 6 Apr 2025 14:46:29 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wwqnvm2k97Qr79wkoktB/9MV13HtMi1n7VC8vZC2xIaGxEA4W3Llv152ApP4HwxABnd1NCxxpVBN99Y2LOEjXVTZLweDJbcllCC2HSfy/wmalSolCZo5EwV2Hl3EGWw2T3cuuBbiy08AXG9us5oEyEAbrUE8j0cz0nlTfQe77IUPO8qDgrjk7QGQjPCfk6ifqCXKw3jpXtOvcVk/FHHUx4C+F71FiQ70FtC42PsryHIXyou7akhMj4hykgkrIAhIQORm1GtP3M41eVhEzq+VNYHkKBc3Qx6drEjPvzwWf+8wutR6hH4jDuFh0ZtL3ErTFBfpWTGCDkKH5//9u7UEYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UknwBfdW+8fAEEm5EVn5D0HHqRDL+Q5HYqcL7RIvb0g=;
 b=QuRcWdgAcc3Tdh5ukSyqG0QWZh2wZLzsU8AYBLfYBejk8kB6ayhy/42PnrJzTAhBbNEqwE76qcTimLfSuiu92Varf1Txi5+pAzPjLS2DNyzRyKsOnhdLAYf4PXPwjlAbmxbt0vu8oiB68ULRk/NIx9Roysp9UseLIo5MCr2F1BKCVtBV7vUm0etPuk2+yohWrG64bvisNgYFjZfDZR3AiewGIWTtPKU7fiNiAHfvaYK4yMIl4Nehgp18p4H4xTYVWVYAK/ibtC0/ceJGaS6zM6OK2YYRouJKpBJylKSsFlVIo1c8PbZB8nQ6pi5HG/TP3Wy5p1dmSsZ/Wbfd4ZICOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UknwBfdW+8fAEEm5EVn5D0HHqRDL+Q5HYqcL7RIvb0g=;
 b=KKQATqpkt3efqxuaJ/94VGIJKvG0zKCly+akhM81NlGcyY0UAFdlmBAyRnVWwvaTVsWEpO9qOf/p6ly2g/R+gUzCNjCyeQ4MJNK+wMx9u2+dVYs5cZYy7WkSmmMkRLZnO+GoQJjjR9VI2z8U4A4hbgVAtTjhuYsALM3QU2vOURI=
Received: from PUZPR03MB7185.apcprd03.prod.outlook.com (2603:1096:301:114::11)
 by TY0PR03MB6908.apcprd03.prod.outlook.com (2603:1096:400:27a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.45; Sun, 6 Apr
 2025 06:46:25 +0000
Received: from PUZPR03MB7185.apcprd03.prod.outlook.com
 ([fe80::79b6:bbd7:e776:55c6]) by PUZPR03MB7185.apcprd03.prod.outlook.com
 ([fe80::79b6:bbd7:e776:55c6%7]) with mapi id 15.20.8606.027; Sun, 6 Apr 2025
 06:46:24 +0000
From: =?utf-8?B?WGlhbmd6aGkgVGFuZyAo5ZSQ55u45b+XKQ==?=
	<Xiangzhi.Tang@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "andersson@kernel.org" <andersson@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?SGFpbG9uZyBGYW4gKOiMg+a1t+m+mSk=?= <Hailong.Fan@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?SmppYW4gWmhvdSAo5ZGo5bu6KQ==?= <Jjian.Zhou@mediatek.com>
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: Add VCP support for mt8196
Thread-Topic: [PATCH 1/2] dt-bindings: remoteproc: Add VCP support for mt8196
Thread-Index: AQHbo7DSWHfkxOZR90yd7IgCqrl6n7OQOKWAgAX/MAA=
Date: Sun, 6 Apr 2025 06:46:23 +0000
Message-ID: <625410299fd45188759d3b1fe205e6c42af0bbda.camel@mediatek.com>
References: <20250402092134.12293-1-xiangzhi.tang@mediatek.com>
	 <20250402092134.12293-2-xiangzhi.tang@mediatek.com>
	 <860ae623-f33f-4cfe-be08-6bb6524ecf94@kernel.org>
In-Reply-To: <860ae623-f33f-4cfe-be08-6bb6524ecf94@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB7185:EE_|TY0PR03MB6908:EE_
x-ms-office365-filtering-correlation-id: 972168a0-7e53-4519-de01-08dd74d6bf6b
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bUtrRk1rNlFMeXh2c2xPYlhYQWxNU2lNSU1tRkRQd1YvOTIyazFVOXE1eEwv?=
 =?utf-8?B?WFJjclhhRXBmMk4xU3NDcVFvSGVnZS9GZUMycmVPS0ROMWszV1JjeFVyeCtv?=
 =?utf-8?B?MjRtbWVpWTIyWmNuOFhVeGxTa0UvM09peGgrbzE3UDdvMko0QkNxR1NDZG5w?=
 =?utf-8?B?ME9aODhkb2owdytTNGFnVWwzakFwNG1Jdk0wWFpjQ2lnM0J0TmdCRjRDS1pn?=
 =?utf-8?B?VVYyWDQ0bEJhTmN0OURUWWN0dWhrbzJ4S21TSSt0anUrQk1ENzU3YThuK0U2?=
 =?utf-8?B?amQxSHhPYmVqMlNmcnNTUFVHNk9rTklOV3Q3MFk0TTgvQXJMK2Q5NGJTbk43?=
 =?utf-8?B?TnlhM3ZSQ0JHRXFIcjFwNkt6bmNEQjJ4SkhMOHBycytrK2N4MENFdWkyZ0N3?=
 =?utf-8?B?dHFOVGRTdEVXZ1hwdzJIdmVWaHJ4YTBuZ1g0cEM3M3ZXdlFXQjRCMGhPZEVx?=
 =?utf-8?B?Ky81Qk5rOG45NGJkbnBXOXZWd1FaWnBkK2VJenhZdmI1QUdhbzJCTnBSZG9M?=
 =?utf-8?B?SWpsemdPM0ZBVnl2RTZneWN2aU5mT2JUYVBqaWNVR2hRem96bFZONXVuQVgx?=
 =?utf-8?B?blpGVlQwbi85bGxSVzJPWW5TSDFFeUZGTERJaWQvUTd4N0JzalBUbzRTdzRl?=
 =?utf-8?B?NG9OZnFZb0ROUmI4QzJqOUJXTTBIcldJQVZmWFV5dHdsS3RrOU14Vk1wNjd1?=
 =?utf-8?B?Y3o3QTVFaS9yRFBxOGVPczhVVVlreGZWamZ3QTlDNlVlM3h3NGZhOEkvRWZJ?=
 =?utf-8?B?RHVMeEFzeFRYcUtRcUFtK2dHTG1YOE1BK04raVQ3NkozNklnVnpzRUlUSUhM?=
 =?utf-8?B?R3Vlamw0ZEV0VTYxZFJVaFpXZmJxQVk4WTk1azBlWnZ5aXpqcXlvekpwRElL?=
 =?utf-8?B?YXBsdFVPVzFIMCtvSTJKaE5YRkxyVE1ZRFIrTEpTdmpIdVEzWE1qMHhhQUUr?=
 =?utf-8?B?eVg0TTgrMm83MmUxMXdzbXhWMlRBL3ZFQUwyQmVWWjBDeHpxeHNuUlFRWlE0?=
 =?utf-8?B?dzJwM2FwaUpVYzJYVzBiS0piSUYvdlEvUUxKRldFVE82WTVTSzZZWFBBRmNB?=
 =?utf-8?B?cnRqOU5VWnlhWE05S2QwUzJ4NkNxNlkvN2xINnd4ZHl4SjR4Z0RieEtYTVBP?=
 =?utf-8?B?UE1oTDhWRys3QUsrMmVCbHNKZGNqcVRkbERNamdDQklNSU9vbjBIZ3p0ZGlD?=
 =?utf-8?B?T1dZWXpGUXB6R0FNalliVkhHSkhQRyt6K05wcnI4Sy92WXM5bHJLK1V5K3Vu?=
 =?utf-8?B?TlNDU2VqZmRMVFd4RGRQSXYvdFJZRHJVZmIwYkZVeVUydUc3T0t6TEVRelVn?=
 =?utf-8?B?UzRCcXltVGlhdDNnRU9uci9uNnpXTjd0ZlFIZ2RBQUxCanE2dk5tRVIwamp2?=
 =?utf-8?B?b0ZvMDdoQUN1WlBDRHNuMmErN2h2WkZwTmx4TWxWa3VqejAvMzNUK2V4ZjNo?=
 =?utf-8?B?QThKZzVVMUlUZVdzYmVEemczYzdHbjYxYmxqOEdkVTR4MWVrbCtORm1nZXNW?=
 =?utf-8?B?Zlp2SnlsK3hLMWRYczMrcnk5RXcvNHBVNnNFQnFIcUpUSHRWRkdhYndRZW8r?=
 =?utf-8?B?QnZoVVB2UlI2NkxhbE5uWWpZak5XOE5VMG5WbnU2RWViL1pSUUdOSW9UVFBZ?=
 =?utf-8?B?KzhrUkZHNzhPQlhhUVJvZ1pJWmF5Q3M2TG9mN1pPdjBLQUkzR1NIcEpkamYw?=
 =?utf-8?B?ZXNMYTU3Y01nbDUxZlMvOWFCNEVyOU5IcytXdmdDU1J3cTJqVzI1VjNxTTU1?=
 =?utf-8?B?SXBYL0k5MW80anNJeGhiVm9nNTU3Y2RQRXN5empyNkJMVStSSlZwVzFJbkJ3?=
 =?utf-8?B?MEQrTkRYYXA1RGI1MFh2QVJWYjFKR2RVTkhwQnBFYkQ1ZkI2bmFhUUZuY0VY?=
 =?utf-8?B?RkdvUjdSSHEyV00wbFQyWUdacmZ0bGg5dWFvN09UQkZDSXhjc01TQ01McVpF?=
 =?utf-8?B?RTd6K244UjRBNWpDak5WN3VjOXVVcDc2K212OVdsVjF5RzNKWHNJQkZrcHpD?=
 =?utf-8?Q?bCPkc6dvrp/r/7rnczMP/w04WfrFOQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB7185.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2ZyWWEzZTNqa2hjd2ZsSmk1VVdNUTNTKzE2dWRnVW4xNDNvT3hoclJKNHNi?=
 =?utf-8?B?Yms0aUFneHd2Q0xXck1FUlJpUmhISVRScTlheDBXM1FNYmx3ekdHdDJiY2RW?=
 =?utf-8?B?ZU9rWldUTm4rTU5LMGozajhLMVNsMTJ3ZjRuQldaSUREVU9OWDBWWndGa3ZJ?=
 =?utf-8?B?SzV0SGhtSEJWYTJYN2FoTXk3ZVdha3NHbTl2bWNDRTdpRGJQRlhEMUJJdEZE?=
 =?utf-8?B?Z05pWTFSUElUODYyazduVjFBeEMwZDBUSVQ1VElUQ21PZHVmRzlVMVZ2d0xi?=
 =?utf-8?B?c1d3SGJoSGRkMkxqZXVENDVEKzN4cVNITWFNa0FxOGlxQmpBMERQZ0VsOW9Q?=
 =?utf-8?B?YWV2K2h0bDBPRmlpTitZWDlJaG9VSUlzQmtyNnJ4QzVoM0F6SVJXNVVpMkhm?=
 =?utf-8?B?V0JWUTZkcFV1bXNabHY3bElOM3d4ckxodGY0TkxsaWFDMGNZVm9URXZxaUpr?=
 =?utf-8?B?TEtUblF2L1dWOUhFMVUwVk1LeFJMdWJlZGVuYS9lcS9NcjFRRmJRNGROOS9r?=
 =?utf-8?B?a2NUMElTWE8wUFpTb2Z2M2F3d0tpVDRmYUpJZkNxMk9PZFFKTGMzWnB0ZkxQ?=
 =?utf-8?B?WTRqMVZISFZwYW54TS9neG43cjRrQ3poS2NWeFdGT3NBQmJpZlNOSUVlSUFh?=
 =?utf-8?B?Ulo0TzFGN3QrSmF2aFgyeFFZKzk1ZjBEYWVGT1NoZnptNHg2dS9jbElzYnkx?=
 =?utf-8?B?ODZlVThCMTB2VktEaTNXVzBuR0xXeHR2UW5WdFNBVW5NRkpLMG9VZUhkUUxv?=
 =?utf-8?B?SGs1Z2NUK3FFdDJMejNtOEZEdHNiTkxOVktnNFRSQ1N1WFpEd3Awd1ZRQ3p2?=
 =?utf-8?B?MGpYamo4MFVvd2s0MlRSNWJPUE9lbWxUZStZWHZSL0pCbmVnT3V1cW5rUFpZ?=
 =?utf-8?B?K3BUR3AyNWZrTmpQRUo2ZDFJdU9UYTJzYkh6dWFpWGhXTW9HUERDandHbGJl?=
 =?utf-8?B?YW1ENFZabGtxdnBWWk1LWFBabEVUeERJbkd5ek40ZFR1ejE0Ukd6aUkra3o2?=
 =?utf-8?B?ZEY3OTg3aFhBaDNUdUUrUkJtVzhGaFFwU0xKNnFJdHd6dVBXSjYwdEE1VzZU?=
 =?utf-8?B?dDRKOWRLblZWSDVvTzJ4Mmh1c29JOE1qYVNCVEJWU3pxbS81WVRzR3JkQ0tO?=
 =?utf-8?B?RmdZUTFSSVYzWHJvcTdMWWdUa1BnMVREMmN3bW5vOVFKSUU0QUlyUVl1SFdT?=
 =?utf-8?B?Q0ZoblJtRWVCK09obHZkeUtMekZyS2xsUGhUd0loTi9ManpLNFBoT21scWFw?=
 =?utf-8?B?NzY3Q3haYlc4aHJGeTZ0cC8reEh3VnVHMXhMTVk0Sm9LMnRTM0lZQVdZVWw0?=
 =?utf-8?B?QnNvc0sxbVhXU3dNQ0FybUd3Z0ZCUkhjQ2h0cSt0UnJaOVE4eFJKeGo3T2pD?=
 =?utf-8?B?UEJYWnBDenVqYTlwUWEwK3I3TFh2ZFlMd0w0aDF4YmZuaS9QU3lsUTUzQi9n?=
 =?utf-8?B?UEkxZG1adUVCb1JsaVlSbjM0eEQ0YWNMeFBhQnJFaXNxdE95OGg4L0JyOTA1?=
 =?utf-8?B?NmloYnY2WGFKTWJRMktQQ1puWVlONU1zMWhTbE5NSmFyUFZ1OURQcmJsUnZm?=
 =?utf-8?B?MGNEV1NGTkZUeE9uMFN3cVVQT3lQZkNORHF6WnVMd3lLRjliczhKRmNFaDNr?=
 =?utf-8?B?R0o2RllTRXY0Vm10UUg0S0R4b3hGSlQ5VXhwVnNkMk5ocGZxNjcxWVRGTjVq?=
 =?utf-8?B?ZXVvSjhMbWd2S1BaT2RzdVU3V1BGdExxWU1PREQ5WW1ydHpnSHhFZWp1a2Ey?=
 =?utf-8?B?b2JNYUVBUXNkR3pqZk9Kc3ZYZlJUQzFwdE9POTVUczE4QXFJVStnbUxvVVR1?=
 =?utf-8?B?SWd0ZlRKQlZtOUFBb0U5VzYrK2Z6Rms0eG0rcGJ4NzE0RlJsbFFET2VrVFRB?=
 =?utf-8?B?S3VwdEdQTFpJVlVhNGQ3cDJmZmxUeWJoRzZzQzN5OXlKS1Fhd1ptWGU0Nk5s?=
 =?utf-8?B?T3lOcXJzamVvNjBEaWgwWjkzcUxXUUpzL05FOVBqa3Nxam9HUUdwZXN2aHZv?=
 =?utf-8?B?QktPa29QQkVCTHNYc0RwdXZ3U1Q4bHVIdEJVbkkxMlVjY2ZtY0M1ZUY0REk5?=
 =?utf-8?B?REtYdUV2Q0dRMkdBbkk4aFVzMHROak95cmErSVYzeHpIclBEak52NWZCNGNa?=
 =?utf-8?B?Y1RMU1pmN3VSZnk2SGpVcnBISkUydmhTdnVmazY0UU9EVXBJOGM1UkZCYXEv?=
 =?utf-8?B?dnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF3B9204E38CF549AAEA7359F9FFA0CA@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB7185.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 972168a0-7e53-4519-de01-08dd74d6bf6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2025 06:46:23.9625
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ub/XjadRVKe3WvRFbKmakwZywzVqi5I0WxNk/NBI6qf536IW8C0+cbSeD1mPRZQtPHrH98ptzgClGxoxGynI7mpVx8S4O7gLSMdDBhmJLRk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6908

T24gV2VkLCAyMDI1LTA0LTAyIGF0IDEzOjExICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDAyLzA0LzIwMjUgMTE6MTksIFhpYW5nemhpIFRhbmcg
d3JvdGU6DQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlvbjoNCj4gPiArICBUaGUgTWVkaWFUZWsgVkNQ
IGVuYWJsZXMgdGhlIFNvQyBjb250cm9sIHRoZSBNZWRpYVRlayBWaWRlbw0KPiA+IENvbXBhbmlv
biBSaXNjLVYgY29wcm9jZXNzb3IuDQo+IA0KPiBXcmFwIGF0IGNvZGluZyBzdHlsZS4NCj4gVGhh
bmtzIGNvbW1lbnQsIEkgd2lsbCBmaXggaXQgb24gdjEgdmVyc2lvbi4NCj4gDQo+ID4gKw0KPiA+
ICtwcm9wZXJ0aWVzOg0KPiA+ICsgIGNvbXBhdGlibGU6DQo+ID4gKyAgICBlbnVtOg0KPiA+ICsg
ICAgICAtIG1lZGlhdGVrLG10ODE5Ni12Y3ANCj4gPiArDQo+ID4gKyAgcmVnOg0KPiA+ICsgICAg
aXRlbXM6DQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IHNyYW0gYmFzZQ0KPiA+ICsgICAgICAt
IGRlc2NyaXB0aW9uOiBjZmcgZ3JvdXAgSU8NCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogY2Zn
IGNvcmUgZ3JvdXAgSU8NCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogY2ZnIHNlYyBncm91cCBJ
Tw0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiB2Y3AgcmR5IGdyb3VwIElPDQo+ID4gKw0KPiA+
ICsgIHJlZy1uYW1lczoNCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICAtIGNvbnN0OiBzcmFt
DQo+ID4gKyAgICAgIC0gY29uc3Q6IGNmZw0KPiA+ICsgICAgICAtIGNvbnN0OiBjZmdfY29yZQ0K
PiA+ICsgICAgICAtIGNvbnN0OiBjZmdfc2VjDQo+ID4gKyAgICAgIC0gY29uc3Q6IHZjcF92bHBf
YW9fcnN2ZDcNCj4gPiArDQo+ID4gKyAgaW50ZXJydXB0czoNCj4gPiArICAgIG1heEl0ZW1zOiAx
DQo+ID4gKw0KPiA+ICsgIG1ib3hlczoNCj4gPiArICAgIGRlc2NyaXB0aW9uOg0KPiA+ICsgICAg
ICBVc2luZyBtYWlsYm94IHRvIGNvbW11bmljYXRlIHdpdGggVkNQLCBpdCBzaG91bGQgaGF2ZSB0
aGlzDQo+ID4gKyAgICAgIHByb3BlcnR5IGFuZCBsaXN0IG9mIHBoYW5kbGUsIG1haWxib3ggc3Bl
Y2lmaWVycy4gU2VlDQo+ID4gKyAgICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tYWlsYm94L21lZGlhdGVrLG10ODE5Ni0NCj4gPiB2Y3AtbWJveC55YW1sDQo+ID4gKyAgICAg
IGZvciBkZXRhaWxzLg0KPiANCj4gRHJvcCBlbnRpcmUgZGVzY3JpcHRpb24sIHJlZHVuZGFudC4N
Cj4gVGhhbmtzIGNvbW1lbnQsIEkgd2lsbCBmaXggaXQgb24gdjEgdmVyc2lvbi4NCj4gDQo+ID4g
KyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlLWFycmF5
DQo+ID4gKw0KPiANCj4gTm8sIHlvdSBkbyBub3QgZ2V0IHlvdXIgb3duIHR5cGUuIEluc3RlYWQg
bGlzdCBpdGVtcyBvciBqdXN0DQo+IG1heEl0ZW1zLg0KPiBUaGFua3MgY29tbWVudCwgSSB3aWxs
IGZpeCBpdCBvbiB2MSB2ZXJzaW9uLg0KPiANCg0KPiANCj4gPiArICBtYm94LW5hbWVzOg0KPiA+
ICsgICAgbWF4SXRlbXM6IDUNCj4gDQo+IE5vLCB5b3UgbXVzdCBsaXN0IHRoZSBpdGVtcy4NCj4g
VGhhbmtzIGNvbW1lbnQsIEkgd2lsbCBmaXggaXQgb24gdjEgdmVyc2lvbi4NCj4gDQo+ID4gKw0K
PiA+ICsgIHBvd2VyLWRvbWFpbnM6DQo+ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPiArICAgICAg
QSBwaGFuZGxlIGFuZCBQTSBkb21haW4gc3BlY2lmaWVyIGFzIGRlZmluZWQgYnkgYmluZGluZ3MN
Cj4gPiArICAgICAgb2YgdGhlIHBvd2VyIGNvbnRyb2xsZXIgc3BlY2lmaWVkIGJ5IHBoYW5kbGUu
IFNlZQ0KPiA+ICsgICAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcG93ZXIv
cG93ZXItZG9tYWluLnlhbWwNCj4gPiBmb3IgZGV0YWlscy4NCj4gDQo+IExvb2sgaG93IG90aGVy
IGJpbmRpbmdzIGRvIGl0LiBEbyBub3QgcmVwZWF0IG9idmlvdXMgc3R1ZmYsIGRvIG5vdA0KPiBk
ZXZlbG9wIGJpbmRpbmdzIGVudGlyZWx5IGRpZmZlcmVudCB0aGFuIGFsbCBvdGhlcnMuDQo+IFRo
YW5rcyBjb21tZW50LCBJIHdpbGwgdXBkYXRlIGl0IG9uIHYxIHZlcnNpb24uDQo+IA0KPiA+ICsg
ICAgbWF4SXRlbXM6IDENCj4gPiArDQo+ID4gKyAgaW9tbXVzOg0KPiA+ICsgICAgZGVzY3JpcHRp
b246DQo+ID4gKyAgICAgIFVzaW5nIE1lZGlhVGVrIGlvbW11IHRvIGFwcGx5IGxhcmIgcG9ydHMg
Zm9yIE11bHRpbWVkaWENCj4gPiBNZW1vcnkNCj4gPiArICAgICAgTWFuYWdlbWVudCBVbml0IGFu
ZCBhZGRyZXNzIHRyYW5zbGF0aW9uDQo+ID4gKyAgICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9pb21tdS9hcm0sc21tdS12My55YW1sDQo+IA0KPiBSZWFsbHksIGxvb2sgYXQg
b3RoZXIgY29kZSBmaXJzdC4NCj4gWWVzLCBwaGFuZGxlIHJlZmVyZW5jZSBpb21tdSBub2RlDQo+
IA0KPiA+ICsNCj4gPiArICBtZW1vcnktcmVnaW9uOg0KPiA+ICsgICAgbWF4SXRlbXM6IDENCj4g
PiArDQo+ID4gKyAgdmNwLW1lbS10Ymw6DQo+ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPiArICAg
ICAgTWFuYWdlIHJlc2VydmVkIG1lbW9yeSBmb3IgVkNQIFJUT1MgRlcgYW5kIHZhcmlvdXMgZmVh
dHVyZXMuDQo+IA0KPiBObywgcmVzZXJ2ZWQgbWVtb3J5IGlzIGluIG1lbW9yeS1yZWdpb24uIERy
b3AgcHJvcGVydHkuDQo+IFRoYW5rcyBjb21tZW50LCBJIHdpbGwgZml4IGl0IG9uIHYxIHZlcnNp
b24uDQo+IA0KPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMv
dWludDMyLWFycmF5DQo+ID4gKyAgICBtaW5JdGVtczogMg0KPiA+ICsgICAgbWF4SXRlbXM6IDEy
DQo+ID4gKw0KPiA+ICtwYXR0ZXJuUHJvcGVydGllczoNCj4gPiArICAiXnZjcF9bYS1mMC05XSsk
IjoNCj4gDQo+IEZvbGxvdyBEVFMgY29kaW5nIHN0eWxlLg0KPiANCj4gSGVoLCBub3RoaW5nIGhl
cmUgd2FzIHJlYWxseSB0ZXN0ZWQgYW5kIHlvdSBoYXZlIG9idmlvdXMgYnVncyBwb2ludGVkDQo+
IG91dCBieSBzaW1wbGUgdGVzdGluZyBvZiBEVFMuDQo+IEkgcnVuIHRlc3QgIm1ha2UgZHRfYmlu
ZGluZ19jaGVjaw0KRFRfU0NIRU1BX0ZJTEVTPURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9yZW1vdGVwcm9jL21lZGlhdGVrLG0NCnQ4MTk2LXZjcC55YW1sIiwgQW5kLCBJIGhhdmUg
dG8gY2hlcnJ5LXBpY2sgZmlyc3QgIg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUw
MzA3MDMyOTQyLjEwNDQ3LTEtZ3VhbmdqaWUuc29uZ0BtZWRpYXRlay5jb20vDQoiIGFuZCAiDQpo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gv
MjAyNTAzMTcxMTAzMzEuMjc3Ni00LWpqaWFuLnpob3VAbWVkaWF0ZWsuY29tLw0KIg0KPiANCj4g
V2h5IHRoZXNlIGNoaWxkcmVuIGFyZSBuZWVkZWQgaW4gdGhlIGZpcnN0IHBsYWNlPyBPZmZzZXRz
IGFyZSBpbXBsaWVkDQo+IGJ5DQo+IHBhcmVudCBjb21wYXRpYmxlLg0KPiBUaGFua3MgY29tbWVu
dCwgSSB3aWxsIGNoZWNrIGl0IGR0YiBzdHlsZSBhZ2Fpbi4NCj4gDQo+ID4gKyAgICB0eXBlOiBv
YmplY3QNCj4gPiArICAgIGRlc2NyaXB0aW9uOg0KPiA+ICsgICAgICBUaGUgTWVkaWFUZWsgVkNQ
IGludGVncmF0ZWQgdG8gU29DIG1pZ2h0IGJlIGEgbXVsdGktY29yZQ0KPiA+IHZlcnNpb24uDQo+
ID4gKyAgICAgIFRoZSBvdGhlciBjb3JlcyBhcmUgcmVwcmVzZW50ZWQgYXMgY2hpbGQgbm9kZXMg
b2YgdGhlIGJvb3QNCj4gPiBjb3JlLg0KPiA+ICsgICAgICBUaGVyZSBhcmUgc29tZSBpbnRlZ3Jh
dGlvbiBkaWZmZXJlbmNlcyBmb3IgdGhlIElQIGxpa2UgdGhlDQo+ID4gdXNhZ2Ugb2YNCj4gPiAr
ICAgICAgYWRkcmVzcyB0cmFuc2xhdG9yIGZvciB0cmFuc2xhdGluZyBTb0MgYnVzIGFkZHJlc3Nl
cyBpbnRvDQo+ID4gYWRkcmVzcw0KPiA+ICsgICAgICBzcGFjZSBmb3IgdGhlIHByb2Nlc3Nvci4N
Cj4gPiArDQo+ID4gKyAgICAgIFRoZSBTUkFNIGFyZSBzaGFyZWQgYnkgYWxsIGNvcmVzLCBlYWNo
IFZDUCBjb3JlIG9ubHkgdXNpbmcgYQ0KPiA+IHBpZWNlDQo+ID4gKyAgICAgIFNSQU0gbWVtb3J5
LiBUaGUgcG93ZXIgb2YgU1JBTSBzaG91bGQgYmUgZW5hYmxlZCBiZWZvcmUNCj4gPiBib290aW5n
IFZDUCBjb3Jlcy4NCj4gPiArICAgICAgVGhlIHNpemUgb2YgU1JBTSBhcmUgdmFyaWVkIG9uIGRp
ZmZlcm50IFNvQ3MuDQo+ID4gKw0KPiA+ICsgICAgICBUaGUgVkNQIGNvcmVzIGhhcyBkaWZmZXJl
bmNlcyBvbiBkaWZmZXJlbnQgU29DcyB0byBzdXBwb3J0DQo+ID4gZm9yDQo+ID4gKyAgICAgIEhh
cnQuDQo+ID4gKw0KPiA+ICsgICAgcHJvcGVydGllczoNCj4gPiArICAgICAgY29tcGF0aWJsZToN
Cj4gPiArICAgICAgICBlbnVtOg0KPiA+ICsgICAgICAgICAgLSBtZWRpYXRlayx2Y3AtY29yZQ0K
PiA+ICsgICAgICAgICAgLSBtZWRpYXRlayxtbXVwLWNvcmUNCj4gPiArDQo+ID4gKyAgICAgIHR3
b2hhcnQ6DQo+IA0KPiBNaXNzaW5nIHZlbmRvciBwcmVmaXgsIGxvb2sgYXQgd3JpdGluZyBiaW5k
aW5ncyBhbmQgb3RoZXIgZXhhbXBsZXMuDQo+IFRoYW5rcyBjb21tZW50LCBJIHdpbGwgY2hlY2sg
aXQgZHRiIHN0eWxlIGFnYWluLg0KPiANCj4gPiArICAgICAgICBlbnVtOiBbMCwgMV0NCj4gPiAr
ICAgICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzINCj4g
PiArDQo+ID4gKyAgICAgIHNyYW0tb2Zmc2V0Og0KPiA+ICsgICAgICAgIGRlc2NyaXB0aW9uOg0K
PiA+ICsgICAgICAgICAgQWxsb2NhdGVkIFNSQU0gbWVtb3J5IGZvciBlYWNoIFZDUCBjb3JlIHVz
ZWQuDQo+ID4gKyAgICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMv
dWludDMyDQo+ID4gKw0KPiA+ICsgICAgcmVxdWlyZWQ6DQo+ID4gKyAgICAgIC0gY29tcGF0aWJs
ZQ0KPiA+ICsgICAgICAtIHR3b2hhcnQNCj4gPiArICAgICAgLSBzcmFtLW9mZnNldA0KPiA+ICsN
Cj4gPiArICAgIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ICsNCj4gPiArcmVxdWly
ZWQ6DQo+ID4gKyAgLSBjb21wYXRpYmxlDQo+ID4gKyAgLSByZWcNCj4gPiArICAtIHJlZy1uYW1l
cw0KPiA+ICsgIC0gaW50ZXJydXB0cw0KPiA+ICsgIC0gbWJveGVzDQo+ID4gKyAgLSBtYm94LW5h
bWVzDQo+ID4gKyAgLSBwb3dlci1kb21haW5zDQo+ID4gKyAgLSBpb21tdXMNCj4gPiArICAtIG1l
bW9yeS1yZWdpb24NCj4gPiArICAtIHZjcC1tZW0tdGJsDQo+ID4gKw0KPiA+ICthZGRpdGlvbmFs
UHJvcGVydGllczogZmFsc2UNCj4gPiArDQo+ID4gK2V4YW1wbGVzOg0KPiA+ICsgIC0gfA0KPiA+
ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FybS1naWMu
aD4NCj4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9p
cnEuaD4NCj4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9wb3dlci9tdDgxOTYtcG93ZXIu
aD4NCj4gPiArDQo+ID4gKyAgICB2Y3A6IHZjcEAzMTgwMDAwMCB7DQo+ID4gKyAgICAgICAgY29t
cGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTYtdmNwIjsNCj4gPiArICAgICAgICByZWcgPSA8MHgz
MTgwMDAwMCAweDYwMDAwPiwNCj4gPiArICAgICAgICAgICAgICA8MHgzMWEwNDAwMCAweGEwMDA+
LA0KPiA+ICsgICAgICAgICAgICAgIDwweDMxYmQwMDAwIDB4MTAwMD4sDQo+ID4gKyAgICAgICAg
ICAgICAgPDB4MzFhNzAwMjAgMHgxMDA+LA0KPiA+ICsgICAgICAgICAgICAgIDwweDFjMDAwOTFj
IDB4ND47DQo+IA0KPiBRdWl0ZSBkaWZmZXJlbnQgYWRkcmVzcywgIGFyZSB5b3Ugc3VyZSB0aGlz
IGlzIHN0aWxsIHBhcnQgb2YgdGhpcw0KPiBkZXZpY2U/IExvb2tzIGxpa2Ugb24gcmVnaXN0ZXIu
DQo+IFllcywgSXQgaXMgbmVjZXNzYXJ5IHJlZ2lzdGVyIGZvciB0aGlzIGRldmljZQ0KPiANCj4g
DQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG8NCg==
