Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F8113633F;
	Sun,  6 Apr 2025 08:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743926741; cv=fail; b=LRbrvOEgyc7gzNsHJm/npiyHJp2qdxSmV6ClxW+4pLsfcXRXcUrYqs3R6cmUr1Awazl8wiXO9StZ237pPyhEx15OcmllzioTdHgxn7L4M75wTfcBeLNrPnzxHGkp8btUw5pIoqZ/6XObyppmVNFO5kFSTdeCoR58BiUdP2nCA6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743926741; c=relaxed/simple;
	bh=WhzAs03jATdwZIzhgvTnEjL6MNodtKzRkIGFP7BQBCQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=q6bYxJPEuPPjLFpNzOPeBKRML5BecSQW7NutyUtcsvjMK8Yl10uQTAiqSS9n7vZ13be18FaXvwa/rODuzcg/dw07FWUS3vq9qdRD4znpt9JpfjeVXWBPuUmiF5oJNLxCo4WSVEM1r3sIRSoRXzkXYw4rGGIaZ3Kahq0pKiu79HI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=FspAdfmc; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=qH13wSwC; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FspAdfmc";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="qH13wSwC"
X-UUID: ebe49f4612bd11f0aae1fd9735fae912-20250406
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=WhzAs03jATdwZIzhgvTnEjL6MNodtKzRkIGFP7BQBCQ=;
	b=FspAdfmcfSP9NNs9VNLzcG+n23lVHZooEN1lUuRGokV8EkO1Y+0Tsfq2chlATEmsXoKFWKs8CUJDQbIldNIISX0T0eQ5pHcV6t1LX7n2hG1fvk7e0CUKyzzv3ZF610wy2AlV4OOtR9gxVtTbv6372wa2B8opBVVJeh6Ciy9Vsqc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:91020274-f32e-422a-9341-cb69a6bc9c38,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:79af39c7-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: ebe49f4612bd11f0aae1fd9735fae912-20250406
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <xiangzhi.tang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1042079479; Sun, 06 Apr 2025 16:05:36 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sun, 6 Apr 2025 16:05:35 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sun, 6 Apr 2025 16:05:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+n2QtkPHints1aJDVaDbH8xY2cWjvz9oqTlx7uFTMX5VdzqhwMpayNo3WJHLJmPYepyqOuz95a3TXKIC8DHRFi0oynJgudXZiIOCVEL7avYQII+MuSuEjnsSwI7qBvlln5+jEbbclTAwO09Yy05nN2xA7AGs79ruZVNDTBSdAFBZBTDN9yfpqFWd9B9oGudx73Bbw3/K7P88CffeGgJsf25EwrD3SjDYgMXeoIMhz+xQDEGM08SGsNpTeak7xur2hTEyLvaTOWi6TZ7JA3KE9sEcCRKlPXggk7lQbmfeY+6ibfB8ptsONb+kARzvy6/AGua+POzSkd+VD4TiIdKmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WhzAs03jATdwZIzhgvTnEjL6MNodtKzRkIGFP7BQBCQ=;
 b=MEcV5qE9Kbp1M1hScFq+7vKmtaDj4OgxMvD0tLUZH+zxEtdwQeiQGgW+e6OkoURkcWdX8YpvinXV8g4oEyZv7K50OIo2O4LtNes37dMhIFcJgJ9y9W0ztsYcCxHUiOL0iRrf5IxOp7ek1dq2uWcjxFkgk5ZBAkruHSrz4JhSW3ejRi5Jes25QWcQUri4qZADj/lU/oOWYPAGnWRNiM4tYMusH7bNYy6Tu9iIHIeJuQYxnRqrwWfs1tYw5+2vIFBhbrHBzNLAbNeqAXIjiM9uAQy0rKftxlkur74Qai6afP6SsmgfYrZkJ0ucl5Rpopl12N44RJy4Wye/b0gmcJnMrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhzAs03jATdwZIzhgvTnEjL6MNodtKzRkIGFP7BQBCQ=;
 b=qH13wSwCietFHGP6XUOvgZ40tLK4k8DVkb8wMnRPoNuMZesJWFADRXcSzYHDK1fwMiDId+s7PXs4y49tbAykZBtUP4wmfaGERjvyIjS82dDINeJJOTeiD4cvNAdKtUvLVX+qb7qLTgJBF4JZ/lsRRcsdd281QVvnOeovEF+7IIg=
Received: from PUZPR03MB7185.apcprd03.prod.outlook.com (2603:1096:301:114::11)
 by SEZPR03MB8140.apcprd03.prod.outlook.com (2603:1096:101:17f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.43; Sun, 6 Apr
 2025 08:05:32 +0000
Received: from PUZPR03MB7185.apcprd03.prod.outlook.com
 ([fe80::79b6:bbd7:e776:55c6]) by PUZPR03MB7185.apcprd03.prod.outlook.com
 ([fe80::79b6:bbd7:e776:55c6%7]) with mapi id 15.20.8606.027; Sun, 6 Apr 2025
 08:05:32 +0000
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
Subject: Re: [PATCH 0/2] Add vcp driver
Thread-Topic: [PATCH 0/2] Add vcp driver
Thread-Index: AQHbo7DHZHPpi31zN0yHgnp15BxwDrOQLXSAgAYgf4A=
Date: Sun, 6 Apr 2025 08:05:32 +0000
Message-ID: <4981f87ea9d86fb8633278ab31f7341ec0a9ad74.camel@mediatek.com>
References: <20250402092134.12293-1-xiangzhi.tang@mediatek.com>
	 <ca8d93e1-ea75-42b3-b7a5-a12cb509890c@kernel.org>
In-Reply-To: <ca8d93e1-ea75-42b3-b7a5-a12cb509890c@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB7185:EE_|SEZPR03MB8140:EE_
x-ms-office365-filtering-correlation-id: 5fac23c4-bfe8-4d9c-d002-08dd74e1cd8a
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|13003099007|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SXk5Q1ZrWU1zUzVSQ0NiRXZYcVc2UkRKV2pYb0l4OUtLc0R5cWsrVUNnWms0?=
 =?utf-8?B?dnZoa0hIQWlkZnFhWFljN3puN0FHVXpGRlNaMmlqdmpPVHA4Sm5KM2VycDcr?=
 =?utf-8?B?OG9GS3VjcXBadm1LUFVsbWJtdnNiZkdHMER4MjRmUDhJWTdKZHlZMzVOY0lE?=
 =?utf-8?B?Tk5ub2Z3ZlJ0RWZNYkdEQ3lxMDFBYVZxVGIzY0pVZmFxWkttb2N4WUsyR3lS?=
 =?utf-8?B?bU8vTE9qbitLZFl3a2dmU1I1dHZjNDR0V3JBUEkwM0lkQkNiUmZUV3pHNElw?=
 =?utf-8?B?QnJGdXJNbnZiYTliNFpkaGR6c3FxZkFhUXRDZXFiQkszLzJlNERmQTFPY3N2?=
 =?utf-8?B?dzFFdE1OZ3l2SkxuRCtSRHhsbGh4c2lSVjJXUko0WmxWSS8zSVRQZHFhd1hr?=
 =?utf-8?B?S0xraUI4UCtCajlZbkNRRVlHS2s4QWRVMmx5WTJWM2lSV3RrWTVob2VUeDZS?=
 =?utf-8?B?T1JOMEpOUVFDYmVvTFluL20wZkZWblBndTJuR0YwNTZMTHJRek9tOHhYZHFJ?=
 =?utf-8?B?cnR2UzdlWFVLMlB3WlBaMzNrM3dzazBWQjRSMW9Jc203RTZaM28rV3l3L1B2?=
 =?utf-8?B?blhja0U3cFRsa2VPU2hQdk44MDlqS3EvZnp3cmMwdnBONG4yVXBYNFo1WS83?=
 =?utf-8?B?MTRlbVlXRXZrN2JCZE5yNm9LK05pS09uWnFsVkJrODdvVk1wYjE1akFQVUFo?=
 =?utf-8?B?TjE4MGRtV0tRbEprWGhXRUJRcFhVSGNISnhvdWNEaWlwT2dpb3BGdWtNUHhy?=
 =?utf-8?B?cFVRdkdYV1A4S1hLaG9NQjdvU0o1S0crVG0rTGM5eS93MWFIWDdENHVvYTB1?=
 =?utf-8?B?aGQ1VjM4bDRqUG85b2pTS2NlTUZVWkxoYTB6cWRzQzVacUZMcDVRUDBkcHY4?=
 =?utf-8?B?Mnl0RVB5UWh1SEkvL3h3SVVxd0hRZ3FUeXY5bEtzQjJYbEljMko4OEJKTzhU?=
 =?utf-8?B?WmhTMWFLZm5GNUZCT1VYZ0VKRlliZ0picFQ1OUZDdmZ2ZDhaWUcxNXVqSzdE?=
 =?utf-8?B?eStCOUJEQllxR2kxSXZaa1o3dTBPbXVWUGhuK0J5eWJVenU1Nk91aFRia0NE?=
 =?utf-8?B?ZUVsb3Y1c09GU1NqVkVuMnVtK3VvY2JtMWRQUEFFNVNMSDl1N1FoRStOQkls?=
 =?utf-8?B?Sy9WYW1pRkk3M05TSG5iTDBOa2hCZ1JiQWV3QVVKVGo0OVFUMzFmNmQvODdV?=
 =?utf-8?B?L3N3bDVlTjN2SXltU1ZiOGhpemN3eFlVeEk0a1FmdVBNR2c0RWUrVzdxZXlQ?=
 =?utf-8?B?cDZEenRFNjhRWjdmMnppUVJxdm1XQ29FNzlackl1T3lYbER4Rjd6S0dWaDVM?=
 =?utf-8?B?SGgvZ0NuMWFhNnpHeWc5Si9Yb0tFKzlvQmU0S2RzU0NWK3pGRVNMVkhzYVZl?=
 =?utf-8?B?WEtMQjdVUmJranRDaWdJeWQ2WmNlMHMrMThPUy9Xak1JWGxXa3FVT0QwOEpi?=
 =?utf-8?B?RWtOZWFCOXdJTG0xa1AvemtTaGxjRzFTZk9hZmRXdXJxS01hc0JSUThqcHpK?=
 =?utf-8?B?bFE2N0hIOUxpVEtUSEN4MDBqcTJEak8xcnNWK210Yis1ZHRVVnd3S3VhZ3lR?=
 =?utf-8?B?SWsxNVh4ZzVqM2l2MkNvdysvcUdRZGFpTlRneHMvWlhRRWRiVW11ZWhTaUFr?=
 =?utf-8?B?ZHFJaW9aTjZmcHFuMlZ4UXlheUs1bXYxU3duSlBVa3dWZmhzbng1WDJkL0Rj?=
 =?utf-8?B?Y0d5TjFXZVZSYm9kRlMyWDBhNytuNW1wYXhQakhpQ0o5WUpYems4cmk5NkVK?=
 =?utf-8?B?YXpUWTlGNWhGSm5QWm4xeEpTSEtjc3M2cWpvRUQ2WlZOTFlEc04zaXpISExG?=
 =?utf-8?B?ZXFSNWVhN3p1WE8wclRWSXRZMm1wQ3Fqd3dNYXdhazBFVzd6eU1mVnRUbC9m?=
 =?utf-8?B?aFZWQ1JCN1VmbFFEYXV2QkplVjVRbGJsQ0VRMHpOVmtobit0RDNOeUlGYVkx?=
 =?utf-8?B?L2MwOEJIUDFDSDU3RTNzbDhGNnBTSWhhTHNDLytsQWVKaGIzbWNkWlJlQlE0?=
 =?utf-8?Q?o+yCGbcyfdnx5NOYd9zBd+eOyFhbeY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB7185.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VnIweUM1UFVGMEducEpZSS91dEZqSWtzOVEzSC9qVkU3dTRRRERhcGI2cTRM?=
 =?utf-8?B?T0o3RlY0enBDckZNZ3RvckNuWlJxNGZ4N084Wm5mWnBEa2JrT1h0V2hsNXh5?=
 =?utf-8?B?eHljK1RIaTNScFFxWnhDa2t2clVhK3NCbktlb1BVS1lCZkc1WmlCZGdIVGw0?=
 =?utf-8?B?OUFOeDdaNnZwWWlHQzFraEdaVHo2a01UT0VOSEhFVUlTdDBxaEpjbi90bzVn?=
 =?utf-8?B?S3dDLzZtaS9BRGZPY3UyY0NybEd1bjg0TmxjcGNtOWV0MEZ1STJYS3JnYUw4?=
 =?utf-8?B?WStEeWt3RVd1OUJNYSt5dlRhY2dseW93cWx3K0tjekg4VFpCL2pwcEJIdjVi?=
 =?utf-8?B?Y3Z1QkkzT0ZQYXJXSmExMXNGQ3pTMmhXSG9adlJZZDQrWXhYcngwWnlKVjcy?=
 =?utf-8?B?cVNHVHBUOUw2YlNGSXNab0Y4NjBPQkJMZVp6YlFWL2lCWGovQ21PQVAyZW5Z?=
 =?utf-8?B?Y0FZSG9ISk1QUGlvWEVwWjBWR21NaVlqdXJIeVlaOHJQWnVoMjVadEIwL21C?=
 =?utf-8?B?Z0Vkdy9kK0wrTFpLQ01oTHBzVC92WXVETVppZFV6QVkwRFAreXNzRjFDSC9t?=
 =?utf-8?B?eit3V1hXS3RMRTB1aGRsQngrR1lSczlqNzFXS3BSckNOclExeVVtSmxPVi8w?=
 =?utf-8?B?THF6K1ozcjkwY2lnNHl0VWFyOHRaTnJkSXJXYWVRUjNUUnMzN3ZCdldTbGxv?=
 =?utf-8?B?dkdyUm9QVlRaRlhpdStYWWtoSnVhNXI3Uk1TSTJSM2pBS0RDeUE5OHpoNEF1?=
 =?utf-8?B?cWhNSWZia3dKd3NlNHVOYTZ1b2UyazhmZ3dBamR1OW1CVUJRTEROVDlpR3pG?=
 =?utf-8?B?YTc2ZzMzKzdZcGY3K1pvTVhRbnJoUEg3N3VHbUkzMVRrRWRGRTZEczZKKyta?=
 =?utf-8?B?Y1cxMXI0Q01IeTdVT1F5TzMyc3BqZEpJSklIR0pjOHN6NHVsajNOTzZtaTZN?=
 =?utf-8?B?V0hBbUZ0eVhaMGc1YW1FQ2NmS0tmMU1ENCtSSWk1QnhOVzRSZnpVUGcxbmFu?=
 =?utf-8?B?aTJVQXp3K29jL2U3VDJ0MmFGVEhSRUFacGRhMnI4c1FDdnEzcVplRjNFTTJC?=
 =?utf-8?B?K1hESC9tcWRqeHBWQ2FqK0Q2eGwwQlVhaUhIMUJlcnhpTEM3QXUrc1ZCampx?=
 =?utf-8?B?RXFHVmhYdjA1ZkgyWmJnOHpEUHFBd0xHL1N1cy9iU3R1byt4U0NRS1g3bG55?=
 =?utf-8?B?TUlnNGJLMlB2U2FoTnVMWS9NakJSUVBBV3JTUkFRd2JLd3crYkhibnNsbm05?=
 =?utf-8?B?SHRWYmw4QXUxNjlsTVZBQnB6eVorT0x2bC81eVJhcSt1ZStzeExsV3poRFJW?=
 =?utf-8?B?WVV0dHV0REg1UHVqWTErYUVTbWZTRUQ1Ukg2RFI3OUFiYzUydG1XTGh0Z3k2?=
 =?utf-8?B?Q3RCMTFaeDc2cElIQ1V1TlFiV011VDRKWkxEL2VHemgxdmhoL3Z6MUp2dmta?=
 =?utf-8?B?eWR1SGpBUVZLN053d21McG8xVEI2YlhQd1lOQi9qQlNmMkF2bnFPbkJ6ZmZD?=
 =?utf-8?B?R3Y0enNMT1QyeWVkVkYrQWtDZkh1NjNEOFg4V2o4d2hoZGhaTHhQZzgrZ0Vj?=
 =?utf-8?B?VEt5M3B1aG5vN3dOeEZZM2JySFhqejZPdDE2alZvWHZYdlhXWmhXU2Y3QmVa?=
 =?utf-8?B?S0Z3ZjlCM0VBWWRpNitGSjB1bkJxMWZ2WHpQK3RKYzY3MklhZGdmeUN5Q1ZM?=
 =?utf-8?B?ZmpzYXVtdEhyZEVXWkZnNU4zMHZUVThCalkyTXprV0pLNjljSW9kWlVZNTl2?=
 =?utf-8?B?aUdEbDdTNEhDc0tFOERUMFlMRTNKNitwTFpUdVZpT21aZWFlRm4vdDNPa3Fu?=
 =?utf-8?B?VkxoM2NmZkFJQjltQWpDV0JBVE9NOHVuR0MxbnRZVmI0Z083ZWVkQlVzVEhP?=
 =?utf-8?B?YlBaU1ArSGs3cGpVTGdMeXZ0ZTNvYmQvY2NqdktHL0JlbndUODBIaXpscGhu?=
 =?utf-8?B?MHF5cGw3b2k3SVVkdHlMUWVKZDNjdzNsMjI2Wm4zcFdFOGlSL25GTHRWVklr?=
 =?utf-8?B?L0t1cmFnYXB3V3Q0emo3R0ZDL3F0QWxsSDBxbkxDOGM2bWlZdEMxdXkwR2dB?=
 =?utf-8?B?c0l4VElhV01CdDJsTGNNWkZaRWFuWEhqYXBrTS96SWkxYWFEZEg3KzNZNHA2?=
 =?utf-8?B?STFHaXdrT0NzQ0piQnp2SGV5dXU2aXllMVBFQ050V04wVXl0QUFBbkdBcXVu?=
 =?utf-8?B?Z2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F94D980C3841247AB806E1F4CA03A00@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB7185.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fac23c4-bfe8-4d9c-d002-08dd74e1cd8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2025 08:05:32.1241
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZSyMM9LVygjhRJ1pdU0TGKV9Gfa11BfCpIoeCI6y9IQgnP8Z6vxhMX6flgI+hsBrGI68Qb9dkPrx4pJtZTZYJQoT18OC44vUJT5jblmwcD8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8140

T24gV2VkLCAyMDI1LTA0LTAyIGF0IDEyOjMxICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDAyLzA0LzIwMjUgMTE6MTksIFhpYW5nemhpIFRhbmcg
d3JvdGU6DQo+ID4gQWRkIHN1cHBvcnQgTWVkaWFUZWsncyBWaWRlbyBDb21wYW5pb24gUHJvY2Vz
c29yKFZDUCkgaG9zdCBkcml2ZXINCj4gPiB0bw0KPiA+IGNvbnRyb2wgdGhlIE1lZGlhVGVrIFZD
UCBSaXNjLVYgY29wcm9jZXNzb3IuDQo+ID4gVGhlIFZDUCBob3N0IGRyaXZlciB1c2luZyBycHJv
YyBtZWNoYW5pc20gdG8gbG9hZCB2Y20gZmlybXdhcmUNCj4gPiBmcm9tIGZpbGVzeXN0ZW0sIGFu
ZCB1c2luZyBTTUMgc2VydmljZXMgdG8gcmVxdWVzdCBBVEYgdG8gc2V0dGluZw0KPiA+IHZjcCBi
b290IHNlcXVlbmNlLCBhbmQgSG9zdCBjb21tdW5pY2F0ZWQgd2l0aCBWQ1AgRlcgZGVwZW5kcyBv
biBWQ1ANCj4gPiBJUEMgaW50ZXJmYWNlcw0KPiA+IA0KPiA+IFRoaXMgc2VyaWVzIHBhdGNoZXMg
ZGVwZW5kZW50IG9uOg0KPiA+IFsxXQ0KPiA+IA0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
LzIwMjUwMzA3MDMyOTQyLjEwNDQ3LTEtZ3VhbmdqaWUuc29uZ0BtZWRpYXRlay5jb20vDQo+IA0K
PiBUaGV5IHNob3VsZCBub3QgZGVwZW5kLiBJdCBibG9ja3MgeW91ciBwYXRjaC4gSSBzdWdnZXN0
IGRlY291cGxpbmcNCj4gZnJvbQ0KPiBkZXBlbmRlbmNpZXMuDQo+IEkgcnVuIHRlc3QgIm1ha2Ug
ZHRfYmluZGluZ19jaGVjaw0KRFRfU0NIRU1BX0ZJTEVTPURvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9yZW1vdGVwcm9jL21lZGlhdGVrLG0NCnQ4MTk2LXZjcC55YW1sIiwgQW5kLCBJ
IGhhdmUgdG8gY2hlcnJ5LXBpY2sgZmlyc3QgIg0KDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyNTAzMDcwMzI5NDIuMTA0NDctMS1ndWFuZ2ppZS5zb25nQG1lZGlhdGVrLmNvbS8NCiIg
YW5kICINCg0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlh
dGVrL3BhdGNoLzIwMjUwMzE3MTEwMzMxLjI3NzYtNC1qamlhbi56aG91QG1lZGlhdGVrLmNvbS8N
CiINCj4gDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0K
