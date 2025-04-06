Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750222A1D8;
	Sun,  6 Apr 2025 08:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743926705; cv=fail; b=HNxMT7QgulwA7iXb5jPV7ltNbi9Gp7WRsbujCpfSvrxqvb57xw6cx9a6ZQl1Funa1nytYtm/mN6EQqORXm1x0fhj9kV6OvPg1vcv/a0b/NaE12r9Jos74RZq8UXyIxJEzpPisvpswiIeQDULgnrO5yCTGRpD85+nwG3yP3uipL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743926705; c=relaxed/simple;
	bh=i4Xl2klflJJu9yC3xD44rxaFAWTv84mV+2c3zAPOVig=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EQs/+L+DwbJiRk7go8k+XEQSkd/wNVwEeYajoKe3Q4m3IoaKgiW270Xnu4ZjbdZb8ru+tfY0jzLYkjL+2nBuZPOycWP7Hy9Y8l1/bqVSB2o2ws/d2N5RDBvrvReN6E5Ww+C+B1lTE0hQMd4edHUCTsWC692fT9lgNIX8PkYCtVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=cYApFwr8; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=E1Xmzm9Z; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cYApFwr8";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="E1Xmzm9Z"
X-UUID: d4bcbf3812bd11f0aae1fd9735fae912-20250406
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=i4Xl2klflJJu9yC3xD44rxaFAWTv84mV+2c3zAPOVig=;
	b=cYApFwr8wPfEEKgUZ3PamrBPwcbiCoyJCRBeaz45JptZd0WEzJfC2ZnojCvSmNzpw9HoEVhTKNxzA3tZvkAWTKLW2vZGiHMXdKalTfmoGJHX6d1FjOwgoCJtXzLwAelX0nv5WEXIHFcD1SqWNThYWSSbRQE0dZMH7Mx20Wlm/Go=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:0bbd8cc1-61e5-436c-a42b-fc1737a520e3,IP:0,UR
	L:0,TC:0,Content:8,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:8
X-CID-META: VersionHash:0ef645f,CLOUDID:d68abaa5-c619-47e3-a41b-90eedbf5b947,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:4|50,EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: d4bcbf3812bd11f0aae1fd9735fae912-20250406
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <xiangzhi.tang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1085793014; Sun, 06 Apr 2025 16:04:57 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sun, 6 Apr 2025 16:04:56 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sun, 6 Apr 2025 16:04:56 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CuWih1Dko4sslJWQuw+I/HK1pIVSH6kwfw8lrOj/oBY+bEEuYnVM89hFeM2GA+7q/+D+ZPC7kO2pU3V/tg3wOsh+QAZbZ/3rKG/XnYnZAiIxvzQx6IulrM7tjP3nMJf13rCA/cFlO+nLGY7OrYZWesL4DenBjfKyq3f1X5QpoAC0PdSdYOqY+D2XlRxgXL4hgqcB45zM7iWNu2GGq1Va8IFyKpVt+iOpB1pxop8DJLLtSifgmE89WxJwYWhvMfxJvV++0Wia7+8LVt6OA5u79kG2UvMB4HnZRrOWUFW0BbW/VQ589szE5S47Qm1eEnHROJ34GROktdMwBXH8zpJ/Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4Xl2klflJJu9yC3xD44rxaFAWTv84mV+2c3zAPOVig=;
 b=CzqLPfu+ywwhjnikiSJZeK0cGntCaPdy9PRSBnvzDb6FuQmiR1d7vwVZIVs/sEbkQTNByz3zhtXHMCDqS1BLrKXN4dh8T3UcgSrC1EppTW5GTVXiFmjfCm6mPQpMTKx3cifaQ9b3vBIRub7WnL+FvwdvSh0NbGOuECSgSe8VS6v1XLRgkd3bDo/LXzXaLAU9aGov+/ix2n7we1gHEmTyiROknyh0vTLAMJZYFD+NeSA7yVNHixF51TsRnFeItxILMyuFnITzdzecngrqPcOPg22sbcguIyoBjzPOHCiuldjdhGz7mTlWz0QWmEgTgSqlZ6UoScSou5B6PLY8wKOcfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4Xl2klflJJu9yC3xD44rxaFAWTv84mV+2c3zAPOVig=;
 b=E1Xmzm9Zm1UoBeoj/FDXSToto5iil+SYqzRzYdyT1OUdBFY+PHj1rFUlu/DjWcgZcsN+sFlP8+xLc6HP55/4EG9NVWcz6YLwIF5IbrSdNEVKK2IesjViSP9j1roMzq7AQ0vfOhSlaNz3n7D4BGai5L9o78ltKqw3565mKshEJgo=
Received: from PUZPR03MB7185.apcprd03.prod.outlook.com (2603:1096:301:114::11)
 by SEZPR03MB8140.apcprd03.prod.outlook.com (2603:1096:101:17f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.43; Sun, 6 Apr
 2025 08:04:53 +0000
Received: from PUZPR03MB7185.apcprd03.prod.outlook.com
 ([fe80::79b6:bbd7:e776:55c6]) by PUZPR03MB7185.apcprd03.prod.outlook.com
 ([fe80::79b6:bbd7:e776:55c6%7]) with mapi id 15.20.8606.027; Sun, 6 Apr 2025
 08:04:52 +0000
From: =?utf-8?B?WGlhbmd6aGkgVGFuZyAo5ZSQ55u45b+XKQ==?=
	<Xiangzhi.Tang@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?SGFpbG9uZyBGYW4gKOiMg+a1t+m+mSk=?= <Hailong.Fan@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?SmppYW4gWmhvdSAo5ZGo5bu6KQ==?= <Jjian.Zhou@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "andersson@kernel.org" <andersson@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: Add VCP support for mt8196
Thread-Topic: [PATCH 1/2] dt-bindings: remoteproc: Add VCP support for mt8196
Thread-Index: AQHbo7DSWHfkxOZR90yd7IgCqrl6n7OQVaAAgAX4I4A=
Date: Sun, 6 Apr 2025 08:04:52 +0000
Message-ID: <522befcba0d8e5efe089b6fb22049cd74cfb4ead.camel@mediatek.com>
References: <20250402092134.12293-1-xiangzhi.tang@mediatek.com>
	 <20250402092134.12293-2-xiangzhi.tang@mediatek.com>
	 <174359852621.53914.11998352307162389918.robh@kernel.org>
In-Reply-To: <174359852621.53914.11998352307162389918.robh@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB7185:EE_|SEZPR03MB8140:EE_
x-ms-office365-filtering-correlation-id: ecdd428a-5d1f-45db-e95e-08dd74e1b5e7
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Q2hWY3ZJcHRyQjdLYXNJY3JmZFdqOUQxL2V3R2pGMTVDckdRQVc0NGxVeXZC?=
 =?utf-8?B?MFJCM1JvM3Jhb2tZUnYvR1JnVE42NEZsTDdRdUEvcWRUUUE5TTZneUthMkRI?=
 =?utf-8?B?cC9pdjVrZ0dyU2Q5dDdmUklDR3ZmamY1UWxJWjE5YitCUUtZWklVbzVTbG5C?=
 =?utf-8?B?bUZUcUhUa1JMTkZnZzU4R3RIczFGdTB4QjZHWTdCUHBSUitiaG9pY0ZaY3hy?=
 =?utf-8?B?TUNsN2dLdlRoRjFJWU1wU1NrdE5FNktpQ0pqMkFQV3BCOUpaRzM1bG9uUjVF?=
 =?utf-8?B?UmlpQnliTWVJekZ5dURrV0Y2TnZ5NUVzcDNKdkhWYXhRZndvWDZZRkVxSHli?=
 =?utf-8?B?YzFPMG91VFB5Q2ZPeWJ1aTFUb2dQT2QvL2VwRUNJbTdXZDI5OFVUalVNTEFO?=
 =?utf-8?B?R1R6ZTNydXFoQXUyVXg1YUVOSCszc0w2TEdUOElGTVZJaXRqQ2I1endXOGU5?=
 =?utf-8?B?VHVWd2IwMk1VcWNTOS9vdXU0alc2bjc0ODg0MCs4TjE0V1l6T3Q2b282UGZy?=
 =?utf-8?B?MUhKNkJMd3BVNU1DMEpQWU9wb01NTERiUkNxa3k3VSs1QnlKVGxBcytLeTNn?=
 =?utf-8?B?dHc3TDJ0UGtGSmJ0MW1RR2VEanJ6SVhBSm9UMk9DUGRxTlRPK1ZjY2pqTUFS?=
 =?utf-8?B?dm0venVudC9VWERNQ2hNSitibU8xSUxKeXNpYjM4RU9penB3UExJYzhDenNl?=
 =?utf-8?B?MC9FTklIbDM3Mk9XYk95M2Z5ZDBPbTFVWGhhRHZyRXhiN1h4bVlVOVdvS1Nx?=
 =?utf-8?B?bTB6ZnBlSFhpbDRzMUxmQ0xiYS80TDhhbUYvdGNmWlBkQXVtVzFOWE5vbUND?=
 =?utf-8?B?dFRWQzBhK2lreTk0TSt3Z1BFMHZraGxMZFQyL3JvNDd6Rk9JTXR3L29GMENy?=
 =?utf-8?B?SGVGeG9RZGZPaEdWZXcxc0dMR1gyZkNKN2daN3dveWY1NWg4V28weUNSSGpR?=
 =?utf-8?B?SzI1VjFVajlCaXpsVkxxRFZldmQ3UnJpb1pxcit4Smo3cjZxQ2Z4bTByTXU4?=
 =?utf-8?B?Y3Y3K3F3ditpT1RtWThiNXBlOVVPRUJSdDA0eWpNU2I3SllwMisvRnJIajR2?=
 =?utf-8?B?TDVxWTJwM3RIbWgrcXZDRWc5dnMyVmhZQnhNbWZyZktPaTF5WUNCQVNiYjhW?=
 =?utf-8?B?K29KdVczaWRLMk5YOXdYdUlmUTcxZ0NlRlpaZmt6anFGUFJqc3VIUlA5djFL?=
 =?utf-8?B?SWZ5QlNzYVU3OGRMbEtlaVR4cElSUTZINWcrd3ViNnIvV3dkUGRNZlptM29s?=
 =?utf-8?B?S3FFRUVwQzB5U2o5aFFJSjNUOUx2TnVaR2xrc21sYldPcC9WNThWQnZydzNq?=
 =?utf-8?B?ZzRyekk1eE5mcDZMdkJ2cVZSM2I0RzErL2FQc0x6cVB6c0hadEhWY2dBQkFC?=
 =?utf-8?B?Vm5pN3pQMUZ3eWVVYkpXbFNkbnJCNFRyUzNka1lmYTc0dUxQVzNHMWVxSXh4?=
 =?utf-8?B?clJFbDlxakhzdFA2UUdKd1JHbU11NFJjUTBwMTliUnZTM043d2dHL090K3BI?=
 =?utf-8?B?Y3hEdlhQWVRoeHMrdGUxa3VjdEZrd3pjNkVXd0NOMVl3RW1FbllaR1NmSGxF?=
 =?utf-8?B?a052UHczSENNdmNCcWlXNlUxSlVvSFBIMEJrUUllUGpCZkFlSERqdVN6MFMv?=
 =?utf-8?B?ZldWYW92cm1DM3RmTWZwZksyaC9hcitpM1FFRGVjczhycm51S0dLcDlKK0VM?=
 =?utf-8?B?YnNKWXYrc04zWXlrZzFiMXRzVHpZVk5acHRoRmlPZ3kyNWRxeW5iandxanBS?=
 =?utf-8?B?SXFKcU15OUVTYlR3V2N0blRwSHJCWlk4VlRpTDIvNzVUZ21zdElKSUU2amdo?=
 =?utf-8?B?a2dQVk81b29NeEFlVnJHVnZPbTFRL1BXSjgrOS9QVUdGRFZnMlJpM3NRTTVs?=
 =?utf-8?B?R1dpWUdIQWJ5ZlpuRk1RUzg1ek9jYzNsZTM0KzdQM2wwZWZUQkRvTWk4enZy?=
 =?utf-8?B?L0hWR2I2cjJSTlJXZ1k3QysrVkZ6ZzlXTDh0ZG9NZVpySkNxNHZYREJZYWJi?=
 =?utf-8?Q?wYayjyycj/oI6bxEmy8viZbwuOW0+k=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB7185.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGpHY1ZKdmNJVEtPb05mclVmd2hEcDZvQmhrM3A5T2h3Z05xeG5HU1FQNGc2?=
 =?utf-8?B?YjZ0M1EvMGdCcU5qOVR5b1JjU0xCUk1hNWZIdFFkazh3cVJEM1c2MVk2K3lt?=
 =?utf-8?B?a0FMeENTdHFBcFA2dmVqWDBnYlFEZEJLaGtYbGtxUGYyUi83aml5Rlg2T0NJ?=
 =?utf-8?B?bVovN25GSjFOaTQ5WEZ2V2VrbTNQYy9maWVZWk5mZ0prSWtvVFdZdWt0alFs?=
 =?utf-8?B?bTU3WjB3RG5tSG1JWGRvU0t6end0QVF1T2dzdE9sd3ZFajJxVVFOc2p6Wnl3?=
 =?utf-8?B?UTFidVlNZUZVQzNXQk5XNXBTTnJpSTFXT3JJNTgwWTJ3MTVJWG1XYVlQRXRQ?=
 =?utf-8?B?bnE1VHh5K3l1RDFPNjFhYVZIaWx1cWhwcFdwQjZ0RnQ1TUQrWU9abGsrcVkw?=
 =?utf-8?B?dUV0bm9qYmtIUW53WkN2TlNKeUV3dnRZZGdsRGFwYk5JbHVvOG1pTFNEUGp5?=
 =?utf-8?B?dEpxNVUwSmZDNXA0ODJUUnNpOFpSK1ZMQnFENC80a2xQajdCakgzMVZZNEdG?=
 =?utf-8?B?Nm9aaFRlS1JHemhYUUJ6MnFoeFMyY3hnZEEzMWt1WExOTUJBNktqbG56ZGRh?=
 =?utf-8?B?bE1Id3ltcGRUZFZTeWJiUU85bGlTSGpIMkhvcVdNYlNiNUQ4SWc2K01IWm1B?=
 =?utf-8?B?UWgyc0hvbFZBUERSampiYk9VdTBncE4zN212bkVEdVZnOTlabEdnQXRRUk9J?=
 =?utf-8?B?bGUrMGdMQkVPTzRXTDhIQnpNUk8zM05HeGV3czk2ZU5nVUtOWVowS3ljYU9T?=
 =?utf-8?B?ME54anptWFpSdGlRcVpLVDZqMW1qUFJyMjdJdFQ5eDA4RHdtSURodWc3a3Rs?=
 =?utf-8?B?WnBFUWZvQmU4ZEVuazF6Zk9YdGNKL3RJZUFzZnV2a0NCNm41TEI1RTErTjVJ?=
 =?utf-8?B?Q2pZSTU2bUxHNGNBTXlIYlYvY2V5ZkpYbVNndzRIeDdPaWpWaTFoa2huanQ2?=
 =?utf-8?B?U05tVXd3MmRIR2Y0Skw3KzJkbTViaWo5UXc2V1RuRUkyWGFNODc5Vm5XQ09s?=
 =?utf-8?B?WWNZVlFIbS9DenJSQ09LVUhSeXpzMTV2eEtzYTd2OGdTcEhPYUxsNnFQWEYr?=
 =?utf-8?B?WlNRQlBFMGZlQzhLREZMenoyY2t6bWJTaW1tTGVQZmpxdXY4UmNuakVud3Ji?=
 =?utf-8?B?TlJSWGh1cHlmYW5pS2toRDVKMzhKMzFVRHgzQW1ra3BXajlaYi9lYzhpdjNL?=
 =?utf-8?B?L0tTZTFhbEpHb1djWnZzTE1acFBqNjdteFhDbXBvMXhnZXFrWllDbjh6WlMv?=
 =?utf-8?B?Zk1oTXRzRm5uMmFPSGY2aVlXdGVGeFV0anAyTEdhNG80Ym5yaVNHN1ZTODVG?=
 =?utf-8?B?c3pOTENJZ3BtM2FJN1JqSmVwLy8wZ2hvTzhuMjMvOU10emNReVVXUEtJV1Ru?=
 =?utf-8?B?MUcrc1ZlUkhWQWt2Vmh2YXhENytQQ2RVTldhSUVaM0R2Tm9FeVpTcDdyd08w?=
 =?utf-8?B?cmM5RXdWakw5Lyt2OEh0a085S1BpV1JPQ2xFd3R0T3VtNGFaNVR6RkZTZ0Jz?=
 =?utf-8?B?LzdoZGhQNFpYOW1weGhTOTBSclRWTUZIc0ZKdkl4cWZDUXEra2VkOTFvODAr?=
 =?utf-8?B?NWxGU1dva1NpZDZXdFJhWDhQTzMzUXZmUEhza3BYeUFTQUZmQ0RiQmhwVURT?=
 =?utf-8?B?YnFpNGduZHhUa1FFblBPSHZXdUJUSWtIZVkveS9GMGpLMW84NWk4S2R5dGJO?=
 =?utf-8?B?U2taM3ZOVmx4elJNeEM3YXgxZ0NyYkRMQ0p4T3BvVFBXS01XM2hzT2xXcHlF?=
 =?utf-8?B?QktXc0pPeXUvU2NEeTFiaisrbld5aDhTMVFNVXdJbkN4RzUwcUdJY2dIR3VH?=
 =?utf-8?B?a1kvRHB0UTlKK3c2UEtBVTNXMTFrSm9pTWY3SE9VVk5WN09xd2lEZHFmd0dv?=
 =?utf-8?B?eXhya0tKaE9DQll4dlhKdWRZZkw0UnQ1SWY5djBORkxpUXFoazBIbktzcVhi?=
 =?utf-8?B?OS9raVpiSkFsU2w3QUdySFBCcDhJQThmRjVJekJBNVF2bWR6MXNCeGYra2lv?=
 =?utf-8?B?Q0E4cmcyOFovMmltUytYWUh0Q0Vob0tOVVJyZWZpTFVHYkR3WDh4RmhRM1ly?=
 =?utf-8?B?TnpwelRzbUZSUU9FVjhaSVNTbFVXMXRZNU9VempsSTE0OFJnaUdrakh1dHJl?=
 =?utf-8?B?SmtUZVhjbktJN21ZUk1KeEgxS2ZoRFRTM1dQM2RFMjNqM1BOdHJOVzViWThG?=
 =?utf-8?B?cnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D07C5A1E816D154F97DC9F8A6CF465D8@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB7185.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecdd428a-5d1f-45db-e95e-08dd74e1b5e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2025 08:04:52.4685
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xZD/U9DDXNnOvQWWkvR9Sdj0wltSsKVfuZoB91Qs58mmik3lz8AiOQh6YesNn0ufS0yaFQ0dyI3BCg6ZCdon7CGz3uL0P4NgDNyOwdNe5aY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8140

T24gV2VkLCAyMDI1LTA0LTAyIGF0IDA3OjU1IC0wNTAwLCBSb2IgSGVycmluZyAoQXJtKSB3cm90
ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4g
YXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUg
Y29udGVudC4NCj4gDQo+IA0KPiBPbiBXZWQsIDAyIEFwciAyMDI1IDE3OjE5OjI0ICswODAwLCBY
aWFuZ3poaSBUYW5nIHdyb3RlOg0KPiA+IEFkZCB0aGUgbmV3IGJpbmRpbmcgZG9jdW1lbnQgZm9y
IE1lZGlhVGVrIFZpZGVvIENvbXBhbmlvbg0KPiA+IFByb2Nlc3NvcihWQ1ApIG9uIE1lZGlhVGVr
IG10ODE5Ni4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBYaWFuZ3poaSBUYW5nIDx4aWFuZ3po
aS50YW5nQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL3JlbW90ZXByb2MvbWVkaWF0
ZWssbXQ4MTk2LXZjcC55YW1sICAgICAgIHwgMTc0DQo+ID4gKysrKysrKysrKysrKysrKysrDQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNzQgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAx
MDA2NDQNCj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVtb3RlcHJvYy9t
ZWRpYXRlayxtdDgxOTYtDQo+ID4gdmNwLnlhbWwNCj4gPiANCj4gDQo+IE15IGJvdCBmb3VuZCBl
cnJvcnMgcnVubmluZyAnbWFrZSBkdF9iaW5kaW5nX2NoZWNrJyBvbiB5b3VyIHBhdGNoOg0KPiAN
Cj4geWFtbGxpbnQgd2FybmluZ3MvZXJyb3JzOg0KPiANCj4gZHRzY2hlbWEvZHRjIHdhcm5pbmdz
L2Vycm9yczoNCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JlbW90ZXByb2Mv
bWVkaWF0ZWssbXQ4MTk2LQ0KPiB2Y3AuZXhhbXBsZS5kdHM6MjY6MTg6IGZhdGFsIGVycm9yOiBk
dC1iaW5kaW5ncy9wb3dlci9tdDgxOTYtcG93ZXIuaDogDQo+IE5vIHN1Y2ggZmlsZSBvciBkaXJl
Y3RvcnkNCj4gICAgMjYgfCAgICAgICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9wb3dlci9tdDgx
OTYtcG93ZXIuaD4NCj4gICAgICAgfCAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn4NCj4gY29tcGlsYXRpb24gdGVybWluYXRlZC4NCj4gbWFrZVsyXTog
KioqIFtzY3JpcHRzL01ha2VmaWxlLmR0YnM6MTMxOg0KPiBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcmVtb3RlcHJvYy9tZWRpYXRlayxtdDgxOTYtDQo+IHZjcC5leGFtcGxlLmR0
Yl0gRXJyb3IgMQ0KPiBtYWtlWzJdOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4u
Lg0KPiBtYWtlWzFdOiAqKiogWy9idWlsZHMvcm9iaGVycmluZy9kdC1yZXZpZXctY2kvbGludXgv
TWFrZWZpbGU6MTUyMjoNCj4gZHRfYmluZGluZ19jaGVja10gRXJyb3IgMg0KPiBtYWtlOiAqKiog
W01ha2VmaWxlOjI0ODogX19zdWItbWFrZV0gRXJyb3IgMg0KPiANCj4gZG9jIHJlZmVyZW5jZSBl
cnJvcnMgKG1ha2UgcmVmY2hlY2tkb2NzKToNCj4gV2FybmluZzoNCj4gRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3JlbW90ZXByb2MvbWVkaWF0ZWssbXQ4MTk2LXZjcC55YW1sIA0K
PiByZWZlcmVuY2VzIGEgZmlsZSB0aGF0IGRvZXNuJ3QgZXhpc3Q6DQo+IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tYWlsYm94L21lZGlhdGVrLG10ODE5Ni12Y3AtDQo+IG1ib3gu
eWFtbA0KPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVtb3RlcHJvYy9tZWRp
YXRlayxtdDgxOTYtDQo+IHZjcC55YW1sOiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWFpbGJveC9tZWRpYXRlayxtdDgxOTYtDQo+IHZjcC1tYm94LnlhbWwNCj4gDQo+IFNlZSAN
Cj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2RldmljZXRyZWUtYmluZGlu
Z3MvcGF0Y2gvMjAyNTA0MDIwOTIxMzQuMTIyOTMtMi14aWFuZ3poaS50YW5nQG1lZGlhdGVrLmNv
bQ0KPiANCj4gVGhlIGJhc2UgZm9yIHRoZSBzZXJpZXMgaXMgZ2VuZXJhbGx5IHRoZSBsYXRlc3Qg
cmMxLiBBIGRpZmZlcmVudA0KPiBkZXBlbmRlbmN5DQo+IHNob3VsZCBiZSBub3RlZCBpbiAqdGhp
cyogcGF0Y2guDQo+IA0KPiBJZiB5b3UgYWxyZWFkeSByYW4gJ21ha2UgZHRfYmluZGluZ19jaGVj
aycgYW5kIGRpZG4ndCBzZWUgdGhlIGFib3ZlDQo+IGVycm9yKHMpLCB0aGVuIG1ha2Ugc3VyZSAn
eWFtbGxpbnQnIGlzIGluc3RhbGxlZCBhbmQgZHQtc2NoZW1hIGlzIHVwDQo+IHRvDQo+IGRhdGU6
DQo+IA0KPiBwaXAzIGluc3RhbGwgZHRzY2hlbWEgLS11cGdyYWRlDQo+IA0KPiBQbGVhc2UgY2hl
Y2sgYW5kIHJlLXN1Ym1pdCBhZnRlciBydW5uaW5nIHRoZSBhYm92ZSBjb21tYW5kIHlvdXJzZWxm
Lg0KPiBOb3RlDQo+IHRoYXQgRFRfU0NIRU1BX0ZJTEVTIGNhbiBiZSBzZXQgdG8geW91ciBzY2hl
bWEgZmlsZSB0byBzcGVlZCB1cA0KPiBjaGVja2luZw0KPiB5b3VyIHNjaGVtYS4gSG93ZXZlciwg
aXQgbXVzdCBiZSB1bnNldCB0byB0ZXN0IGFsbCBleGFtcGxlcyB3aXRoIHlvdXINCj4gc2NoZW1h
Lg0KPiBJIHJ1biB0ZXN0ICJtYWtlIGR0X2JpbmRpbmdfY2hlY2sNCkRUX1NDSEVNQV9GSUxFUz1E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVtb3RlcHJvYy9tZWRpYXRlayxtDQp0
ODE5Ni12Y3AueWFtbCIsIEFuZCwgSSBoYXZlIHRvIGNoZXJyeS1waWNrIGZpcnN0ICINCg0KaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwMzA3MDMyOTQyLjEwNDQ3LTEtZ3VhbmdqaWUu
c29uZ0BtZWRpYXRlay5jb20vDQoiIGFuZCAiDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5v
cmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRjaC8yMDI1MDMxNzExMDMzMS4yNzc2LTQtampp
YW4uemhvdUBtZWRpYXRlay5jb20vDQoiDQo+IA0K
