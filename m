Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D362E3709;
	Fri,  1 Aug 2025 02:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754015512; cv=fail; b=seeppLlAsZTGCWu+NmMyG2vFBsEoWn69C3taT/mggq2oC4YJ7grZxAwdGRQ3EXZFPqigEzlYYyQoXoZ/H39QekPqREecp5QvwZcV5R6oPhBYXz1QeRVUId1IxPNlIK3UMAUPVc0v/2wZ3Yjw3lWTO235gGxvWs+WflRxSwEDJpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754015512; c=relaxed/simple;
	bh=I35pISzL9JoyXvTx1hnyd6eGgne+nXxCxOwDZ61Tkd0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dUcUHpjgi/MTfnihxqrLhgpfW9arrm8Sv5jxeSu/n4dzk8F31CZPoZlcIQ7+q4JwoZS7th7/eeU8hf/HyTFqQmemrVJnx9u6IHzbOr/ju7+usi4HEmQw5IKb359D1+cZh0JEVlu5sio2RKKDw9AVW6Eqn/TlKXdbl3UnA68OHLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=nrrYtIhM; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=bwPtKA/4; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nrrYtIhM";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="bwPtKA/4"
X-UUID: a6e6c0906e7f11f08871991801538c65-20250801
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=I35pISzL9JoyXvTx1hnyd6eGgne+nXxCxOwDZ61Tkd0=;
	b=nrrYtIhMvkcdtvUVB2VPUAgs/cOEqY9d6g+coQxOzwrXygEpgYKxgM2hr76IRYW/gZjyj6+JUnw6p+Q3tRWhAM9lD09/I2yJtVDGy6HHM5E0hTAf93dvXtCo7VKaOIX7LUQmWByv4GtdA2thucmIKyYIEX4zNF/htHBQ8pNnGD0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:fe00bca0-dceb-4ed3-8271-3aaefde8fc2e,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:14f9630f-6968-429c-a74d-a1cce2b698bd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a6e6c0906e7f11f08871991801538c65-20250801
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <huayu.zong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1860812914; Fri, 01 Aug 2025 10:31:38 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 1 Aug 2025 10:31:37 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 1 Aug 2025 10:31:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rgWjxKpYnQ/pJArzQKGloZwlhZeFcmNw2hwPOeuZ3NFyh5HCxmYG0/9MJA1EgXjqp23CD//vUOwxkbdgmYbUNO++Cd97cnlHmmLa633YaTAgfdMm4oyuh44ztrB7hIt/cdnIeEqkTtrl3CuHECH5iyRotT2GO6Tb+5xh0WWHd8Cx0+kvejZCku1bjN6t9m9ttxVSFBUC+Nsm/kNhJ0QkfTxaHRrmmPjvq/T6Ydf24S4ydXT0/N9M5sLzcAkNqqzNyEJYgXVRCO+Of9ee2kRHfNiU807ZB8MNfdyAntSqfa67X1TKQwRTZmVlHhljfefcZTCxvKxqy3m2aMs0/zxITg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I35pISzL9JoyXvTx1hnyd6eGgne+nXxCxOwDZ61Tkd0=;
 b=HxnkcOILyxAOVJR8XB8RjR2QDg2Sj55oLX2p4J0rXE5iTIf0mM2yTc0+E3O8ZtyhD0cX3RzlcI4gPHxsvZDLOqOVXpwPJDxrLAy24r2FF3ceIQEf64JpyiKWGFUqjKGl/el4KRXaW+rZEsq8lvrQtBt+G0V7X9Cg0p6qrwi3ODNXKB05pT8EsgGmOA4SqUlnLpxm6+9nokaD4BAjs0j31r0eeWL14znbhwBG1Zr45dtxbC1a4CxBmEYzJ0nEF2Uudoyfvz3S1TxQkdSorSURsdDvf8vQeROkNyV2gP8kv2NeHnwZ4xkQu/T+hrdUaJ190jWqvmbrB1XOMSv4l9VqBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I35pISzL9JoyXvTx1hnyd6eGgne+nXxCxOwDZ61Tkd0=;
 b=bwPtKA/4eubhvPzMo4Riop5hHTU+/OD7xiUchCrmyXhoY/KOii082yrx9TVh7cna2B40XlkUDETlkrk4VIFmnod8Dm2JsZdZWxdL+nM+HfHpYvihy3GJvUj/nM5A1tFd1Ld8aB0TCFfo+ARjb0LFg6v+WQgxtBaN+06YLvCgRH4=
Received: from KL1PR03MB5808.apcprd03.prod.outlook.com (2603:1096:820:81::12)
 by JH0PR03MB7976.apcprd03.prod.outlook.com (2603:1096:990:2f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Fri, 1 Aug
 2025 02:31:35 +0000
Received: from KL1PR03MB5808.apcprd03.prod.outlook.com
 ([fe80::b75c:b0c5:893b:193]) by KL1PR03MB5808.apcprd03.prod.outlook.com
 ([fe80::b75c:b0c5:893b:193%7]) with mapi id 15.20.8989.015; Fri, 1 Aug 2025
 02:31:35 +0000
From: =?utf-8?B?SHVheXUgWm9uZyAo57q15Y2O5a6HKQ==?= <Huayu.Zong@mediatek.com>
To: "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "robh@kernel.org"
	<robh@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"andersson@kernel.org" <andersson@kernel.org>,
	=?utf-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= <TingHan.Shen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 3/3] remoteproc: mediatek: Support MT8189 SCP
Thread-Topic: [PATCH 3/3] remoteproc: mediatek: Support MT8189 SCP
Thread-Index: AQHcADD22gkMGP7YukCbuFYYtbsBdLRKxu8AgAJReYA=
Date: Fri, 1 Aug 2025 02:31:34 +0000
Message-ID: <2273ad232f5492cdc091943d1adb6fa5db577963.camel@mediatek.com>
References: <20250729023125.9036-1-huayu.zong@mediatek.com>
	 <20250729023125.9036-4-huayu.zong@mediatek.com> <aIo1LsFeKqtPoCDm@p14s>
In-Reply-To: <aIo1LsFeKqtPoCDm@p14s>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5808:EE_|JH0PR03MB7976:EE_
x-ms-office365-filtering-correlation-id: 69b84700-12fd-4258-68be-08ddd0a388c6
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cGlGQmtLMmpiKzFlNDk5NzhKMFVxa3ZoSGNXdGtCRk5UZWM2Nnh4NlgrY2pU?=
 =?utf-8?B?NEorWnR5b1NSNUk3ZUJHQmEvekJUN01KdU54YzZoQUdqalRZUStTcFVaOVBp?=
 =?utf-8?B?YzBGMmo1T1RGczlWZEZhcEpHZkNQV25UVWpBUUREZ3FrN1ZUNm9laldZNER5?=
 =?utf-8?B?QXZQek12U2dCUjhJbzhwQUFKY0gwTU5xd1EzeU1NU1YwR05iMnhKM1FuODlx?=
 =?utf-8?B?RHVBSXZqbTBLTndkdm9IaTQ5ZEh2NXlNYThueFZ1SVVGV3dHbTBoVlpoVGF3?=
 =?utf-8?B?eFVLb0VGdGl3Z0J2SVU1V2hNVlFkMzRXVnAwTWkyaG9hUFl4QmtwengrN2tC?=
 =?utf-8?B?SmljVFVzTFpiTk9zbGRNOFdETWhkempLZzU0bzNuNWdYb2YzVCtDNmFPNnlr?=
 =?utf-8?B?MkQvTlcxRVEzYVhMVFQ3M21Ld2t0UTVtcjV0WjU3Wm9xWUxzQXFwNThCQVR4?=
 =?utf-8?B?NzhIb3BsZnVyODlCU010d0lVZnkyZFM5SE1acW1ldnJRNjNVUGRtdXNVVGRV?=
 =?utf-8?B?UE9LMjhnVkV2d3dYd29rRno5VUwvK3lVeG8yVWIwMXBjQk5NcCtsNVlZbTYr?=
 =?utf-8?B?Rktjc0RGTEx5SWNURk5aSHNZZTdTZDVzdmpoMURsY0UvVGRpZTNNSlg5d3lV?=
 =?utf-8?B?OXFMVnd5dlhNZ0lzZ04xUmpSdHhNd0ZlMEE1UE9MU2pTdG8vODA2djI0UTl3?=
 =?utf-8?B?NU5pVWc1S1J2eEt1ZzhNOW1DcG1rczRkUmlUOG5BL1BvaVMyMUEveE4yazBO?=
 =?utf-8?B?UWE5NDJaNVhuaEQreGpJaHJYV091d0FzNXYzejFYNis2MXBVQS9JWWNQaUZI?=
 =?utf-8?B?OEREVDdGZ21EemFHZlBEQ3oxUWhFc0lRYTgwaUF4YW16anZYZDBWdE9TNUNS?=
 =?utf-8?B?N2M5eVgvQ21oeTl3Z1owSUsvZEdYTTNFTCt6Y0Izb1RNRWV6NVVlRFozQ29O?=
 =?utf-8?B?aWR0MGJxOFFSVnIwOU9FUzBrN2o0TzVuYnJmY0ViSFRHMHlCU3lKeXZWQlBW?=
 =?utf-8?B?U1ZsSm9CKzZPd2x5Y0tJNGlmdzIzQ1NBV1VHWWxTNS9lYmlhT2s0ZzZ6c0Z0?=
 =?utf-8?B?K1hyQ1FtMDQ4UkdiQzR1MzBTU2x1RU8vd1pWMUMvNFZtRHo3cXdobFcxOU01?=
 =?utf-8?B?QzB4OWxoZ2tRc0RJWXNyRkNpRFJzbWd6aEJWT0U1Nk9KazdmenpGcGRpd1Rj?=
 =?utf-8?B?UWlZTmpsQ0RFVTZ0cTJCVzdndFVyd1AxTXRkRlQwU1lPWXVpNEFhN2U1ZzhU?=
 =?utf-8?B?V0l0MmQvcGdEVG8zbjNzQk8zTWFEWGowS1ZFQis5dTJ0c3F3MUZaN2RZWE5v?=
 =?utf-8?B?bGhmTk8wcHlkV3R2YzluaVR6VlJxVWRRaDhObDVyeTFkUkVqeUY0eWFBb0NF?=
 =?utf-8?B?ZDlOTjVBdHF6NTl0N2NpQ2VKeFVwRlNCZkt1ZFNMVjdhbW9uQ3RwY1VLZ0dC?=
 =?utf-8?B?U1pVdGhadzM0MlMxcmt0dllocDJmL3o3NkJBTjl2bEoxV1lZREdIZ2FMc2cy?=
 =?utf-8?B?YzdWcTZrSWdlejZBMlFKcEtlcjdibzkwRVpHM3l5NmNxam9pT0YxaGI4Ti9h?=
 =?utf-8?B?RTNHL2dKNU1tRlpDTWExWG4reXV4QlBDMzBNTGZZQmtqNlJTKy9uelBzSWFq?=
 =?utf-8?B?NVg5MVFQci9NZzJWMlVQMGFSQmlXcWQ5dXQ0SmorbS9DUFJFZEV4ZlNDMkk3?=
 =?utf-8?B?ZFVrR0JmdFNrMVZ6Qm52Wk1FOVp6L3kyK0NoNUVpWlR4Sjk0L3JNNC9ZVUVB?=
 =?utf-8?B?N0N6TmY5Z0RIZWd3ZE5kRkFoRmtzbUtQYkY2YmxQMHVHK1Vpc0ZkQ2kzekdT?=
 =?utf-8?B?MmJmRDM2a242ZmErVnV3czdPcVE0ZzJRdG1xaGFkT2Q2MDlnMHl1RXdZaytS?=
 =?utf-8?B?SXROZGFBMWhGZjNvUXV2eU5tem1Xb2VqYU93VXlDNXVUcUtCcnJDTVA3ZmZr?=
 =?utf-8?B?SDF6NldUVmt2UDdaSmxSeXpBdmErNzdOTE9wbHJvU1d3OFhSSTFMUEl6cjRl?=
 =?utf-8?B?bUpNOENqUGpBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5808.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUFIOGRJUEdrWWVvRitleHo3NjJZaDVCdUdhQUtGaWRsbmR1Y2R6bnl0bGNz?=
 =?utf-8?B?VEs0eVdpUFdWRXB1RWFZTVNXWVBmVFhwb09vMWtGYk9hZ3BFK2dhSWxXRm53?=
 =?utf-8?B?NCs3VGpFSFpnd0RlaGFXeE5QMzJQMllORGRmbWZjcW9uelltdzBjbGJFa0ha?=
 =?utf-8?B?eWdmQzNGWHBUU0dtY2IyUWZJcTJTeXVxZEZESTFSWUhYMzZKZTJYMnVRQUp6?=
 =?utf-8?B?RGtRL1plZ2FndEh3MVJLcGEwa2UwN2QybWl3YTlobEN0MjlGT09MSTlTSjFG?=
 =?utf-8?B?L3B5Wk1uUElNb0t2ZmJpVVhPZ3N4R2REdUdNVVcyNkN6NTNFQ2tPMkE0bWZD?=
 =?utf-8?B?UG82ckxWYjVPRkk5U0FyNXlWSVI3dGxNRVRaanFoRGhFbFBRL1p5aFl5UGRR?=
 =?utf-8?B?VkVhWHU2QmhvL0VSYmJiRkFVSVhyQXBlRGNuQmgzeVZaR1RHa1FHeGFNN0R5?=
 =?utf-8?B?MlQvclBDYm1SSFo1OHBvY2xOTnZVdW9GM0lQOE0zL3BMSlE4cDl2R0d2SHdJ?=
 =?utf-8?B?K0RSNXVrNk4yczhiOC9MYitrS0diYjVabHpKa251UUl4dCs1NElNeGtPUTZE?=
 =?utf-8?B?KzZrRVdxcld3RzJWekxyUlRDcVhoWlFkbG9tOUljUGhGazZCS3ovc3YxbGNx?=
 =?utf-8?B?REV6WW5EZUtVSnZXQXR0aDlUelE2RzRWOEJ1V3c0T2dHV1hWenR4MzdxZE5x?=
 =?utf-8?B?NVg1NzdPUTJWSXZVcUx5eVlNVTZPQk1LMEZ0clZzelZNTnlaTFo2UTdEcm1x?=
 =?utf-8?B?c3NYR01hL2lPVS85QitKcTdHcUlyVHRPdzY2aUx1UlAzb3dlRlNVS3k3SFZi?=
 =?utf-8?B?OHJlUjN2RFBIT3Vxa3NqclRkbDQ5cWRtQ3k3eXR1TDlKck5WMWR2MEVlb2xm?=
 =?utf-8?B?dXFEaS91a2U2N0VZUDRMSVlhekthamNHVWxJUUphYkRrak1yOGxBMnhNZDlM?=
 =?utf-8?B?MGI0NHMweVlUNTRnbjFFSlFRRWJ0U2lyZzhpeXVla0Z4WG9HbGNYZWYyTmV1?=
 =?utf-8?B?cy9pWUlNNzhGRHZ2NHQ1Qm9WYmRmYzJPajdDN2ZJT21ITE5wZHRyREtPNll1?=
 =?utf-8?B?NVlpbEZFU3l5Ri9EU3NrZDBPemc1MDZBUWtyZkVuZUxrOTlwOHlwTldQSThM?=
 =?utf-8?B?UEtrdTloOWtKV2UvbnZTUjlpaC9INHZKMjlxMWdGWGZWR01BN0d6SFNsMmxI?=
 =?utf-8?B?T3JJQTJ5dTlyNXZWaXBXOFFuYzdwZ0RiL0ZxUThvb3hvREd0cEVxSlVtREl0?=
 =?utf-8?B?VWFxOFRtUWhSTCs0ZVJkbnlmT2hRMmtER2pqSW0vOGdiNkZJKzdLZWtnREVE?=
 =?utf-8?B?MmNybmpRZFNyd2lqYUNLOE5ldnJZQm5hZUNEUFJIVnU1SERMeXdJQWsxWEFw?=
 =?utf-8?B?Zndzalg2ZktGa2FEU0J0SklQK25venhwbGFmVkl0Y1FqQk84NFB0T3ZtL291?=
 =?utf-8?B?K0xYTk1yUG1neVdmU3BEZ05RVzl4OTRsMjZaYVZSZjFHeXE0UGJiZUg3Tk9v?=
 =?utf-8?B?cjBueEpBNGhGczRlUGkweGRNWUc4U3Y0Q04rdDQ4aGs3czJqQU9qSytaMFRZ?=
 =?utf-8?B?NVQ2eXdxNkZVN2RibVh0Q2xOTTBSd1Z1RWVORGlkTTVTU3lUWFlET1NlRDRV?=
 =?utf-8?B?eVJrc21Vb0tabmRqeStkeklLOHdCUlFLQmJucWNPQ3RSZ3pNbTgvVGl2S3hX?=
 =?utf-8?B?SmJtbk8yUTlRa05sQVd2L1JQQ3dxNFVWT1lVdXFSTVQwb1JPMkFUTGpqREg5?=
 =?utf-8?B?Y201a2VQa1p4OU1iV2E4TlBISUd1Z3EzSmsrVlgzSnVhb2ZiTDFsOWFtOU5G?=
 =?utf-8?B?WFRqT1l4cTNoTlF6Z0xVY3NhblhibXJVS014MDFOK01UV0VjSk1Pb1V2VUFI?=
 =?utf-8?B?NEdnRGtURnFONURrdE80U1VrQTUvVTNBWFZTWWVVTWlnM0pVcUpiTW1zS1hZ?=
 =?utf-8?B?a0NiMUcySFNNc3BGaDJic0oyeW5laTlwZnFzS3FWdVFpc3RFa3JNN29nazlj?=
 =?utf-8?B?aG9qY3FsNUZDc2dxUlNJNlZwV1ZOU3FaZnIwWjBSYjNiVmUrN3FvMy9RLzVE?=
 =?utf-8?B?L0JXZldlOXlWWTQxZjlrQVhKTUZkSDNLZGMyd2o4dzR3SDhUdFU5ZlQvcU5p?=
 =?utf-8?B?cTY4QWpzNjl1cnl5dHBuWWl1MkV6RTlDRjVpc2NVSEtFU0pUNlAwNk1jQWs4?=
 =?utf-8?B?dEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FAAFB541AAF9334193F99805113365E0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5808.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69b84700-12fd-4258-68be-08ddd0a388c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 02:31:34.9008
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j+yX0yXja3FrZajQVUA9Q1INiYqbC4YKq56eAIiCC0adtG3Q55N7XAj+eAm20W1brCdhBntV6NeqPgXknQb/xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7976

T24gV2VkLCAyMDI1LTA3LTMwIGF0IDA5OjA3IC0wNjAwLCBNYXRoaWV1IFBvaXJpZXIgd3JvdGU6
DQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0
dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNv
bnRlbnQuDQo+IA0KPiANCj4gSGksDQo+IA0KPiBPbiBUdWUsIEp1bCAyOSwgMjAyNSBhdCAxMDoz
MToxM0FNICswODAwLCBIdWF5dSBab25nIHdyb3RlOg0KPiA+IEFkZCBTQ1Agc3VwcG9ydCBmb3Ig
bXQ4MTg5Lg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEh1YXl1IFpvbmcgPGh1YXl1LnpvbmdA
bWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3JlbW90ZXByb2MvbXRrX2NvbW1v
bi5oIHwgMTEgKysrKysrKysrKw0KPiA+ICBkcml2ZXJzL3JlbW90ZXByb2MvbXRrX3NjcC5jICAg
IHwgMzcNCj4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0NCj4gPiAgMiBmaWxl
cyBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3JlbW90ZXByb2MvbXRrX2NvbW1vbi5oDQo+ID4gYi9kcml2ZXJz
L3JlbW90ZXByb2MvbXRrX2NvbW1vbi5oDQo+ID4gaW5kZXggZmQ1YzUzOWFiMmFjLi5mYjIxMzFl
MGVkMDcgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9yZW1vdGVwcm9jL210a19jb21tb24uaA0K
PiA+ICsrKyBiL2RyaXZlcnMvcmVtb3RlcHJvYy9tdGtfY29tbW9uLmgNCj4gPiBAQCAtMzUsNiAr
MzUsMTEgQEANCj4gPiAgI2RlZmluZSBNVDgxODZfU0NQX0wxX1NSQU1fUERfUDEgICAgIDB4NDBC
MA0KPiA+ICAjZGVmaW5lIE1UODE4Nl9TQ1BfTDFfU1JBTV9QRF9wMiAgICAgMHg0MEI0DQo+ID4g
DQo+ID4gKyNkZWZpbmUgTVQ4MTg5X1NDUDJBUE1DVV9JUENfQ0xSICAgICAweDMwMDEwDQo+ID4g
KyNkZWZpbmUgTVQ4MTg5X1NDUDJTUE1fSVBDX0NMUiAgICAgICAgICAgICAgIDB4MzAwMTgNCj4g
PiArI2RlZmluZSBNVDgxODlfU0NQX1NFQ1VSRV9ET01BSU4gICAgIDB4QTA4MA0KPiA+ICsjZGVm
aW5lIE1UODE4OV9TQ1BfRE9NQUlOX1ZBTCAgICAgICAgICAgICAgICAweDMzMDMwMDMNCj4gPiAr
DQo+ID4gICNkZWZpbmUgTVQ4MTkyX0wyVENNX1NSQU1fUERfMCAgICAgICAgICAgICAgIDB4MTBD
MA0KPiA+ICAjZGVmaW5lIE1UODE5Ml9MMlRDTV9TUkFNX1BEXzEgICAgICAgICAgICAgICAweDEw
QzQNCj4gPiAgI2RlZmluZSBNVDgxOTJfTDJUQ01fU1JBTV9QRF8yICAgICAgICAgICAgICAgMHgx
MEM4DQo+ID4gQEAgLTExMiw2ICsxMTcsMTIgQEAgc3RydWN0IG10a19zY3Bfb2ZfZGF0YSB7DQo+
ID4gDQo+ID4gICAgICAgdTMyIGhvc3RfdG9fc2NwX3JlZzsNCj4gPiAgICAgICB1MzIgaG9zdF90
b19zY3BfaW50X2JpdDsNCj4gPiArICAgICB1MzIgc2NwX3RvX2hvc3RfaXBjX3NldF9yZWc7DQo+
ID4gKyAgICAgdTMyIHNjcF90b19ob3N0X2lwY19jbHJfcmVnOw0KPiA+ICsgICAgIHUzMiBzY3Bf
dG9fc3BtX2lwY19jbHJfcmVnOw0KPiA+ICsNCj4gPiArICAgICB1MzIgc2NwX3NlY3VyZV9kb21h
aW5fcmVnOw0KPiA+ICsgICAgIHUzMiBzY3BfZG9tYWluX3ZhbHVlOw0KPiA+IA0KPiA+ICAgICAg
IHNpemVfdCBpcGlfYnVmX29mZnNldDsNCj4gPiAgICAgICBjb25zdCBzdHJ1Y3QgbXRrX3NjcF9z
aXplc19kYXRhICpzY3Bfc2l6ZXM7DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcmVtb3RlcHJv
Yy9tdGtfc2NwLmMNCj4gPiBiL2RyaXZlcnMvcmVtb3RlcHJvYy9tdGtfc2NwLmMNCj4gPiBpbmRl
eCA4MjA2YTE3NjY0ODEuLjk1Njc5M2ZjNjkwMSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3Jl
bW90ZXByb2MvbXRrX3NjcC5jDQo+ID4gKysrIGIvZHJpdmVycy9yZW1vdGVwcm9jL210a19zY3Au
Yw0KPiA+IEBAIC0yMjUsNyArMjI1LDggQEAgc3RhdGljIHZvaWQgbXQ4MTkyX3NjcF9pcnFfaGFu
ZGxlcihzdHJ1Y3QNCj4gPiBtdGtfc2NwICpzY3ApDQo+ID4gIHsNCj4gPiAgICAgICB1MzIgc2Nw
X3RvX2hvc3Q7DQo+ID4gDQo+ID4gLSAgICAgc2NwX3RvX2hvc3QgPSByZWFkbChzY3AtPmNsdXN0
ZXItPnJlZ19iYXNlICsNCj4gPiBNVDgxOTJfU0NQMkFQTUNVX0lQQ19TRVQpOw0KPiA+ICsgICAg
IHNjcF90b19ob3N0ID0gcmVhZGwoc2NwLT5jbHVzdGVyLT5yZWdfYmFzZSArDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICBzY3AtPmRhdGEtPnNjcF90b19ob3N0X2lwY19zZXRfcmVnKTsN
Cj4gDQo+IEFzIGZhciBhcyBJIGNhbiB0ZWxsLCB0aGlzIGlzIHRoZSBzYW1lIGZvciBib3RoIG10
ODE4OSBhbmQgbXQ4MTkyIC0NCj4gaXQgc2hvdWxkDQo+IG5vdCBiZSBuZWVkZWQuDQo+IA0KDQpU
aGFua3MsIEkgd2lsbCB1cGRhdGUgaXQgaW4gbmV4dCB2ZXJzaW9uIHBhdGNoLg0KDQo+ID4gDQo+
ID4gICAgICAgaWYgKHNjcF90b19ob3N0ICYgTVQ4MTkyX1NDUF9JUENfSU5UX0JJVCkgew0KPiA+
ICAgICAgICAgICAgICAgc2NwX2lwaV9oYW5kbGVyKHNjcCk7DQo+ID4gQEAgLTIzNSw3ICsyMzYs
NyBAQCBzdGF0aWMgdm9pZCBtdDgxOTJfc2NwX2lycV9oYW5kbGVyKHN0cnVjdA0KPiA+IG10a19z
Y3AgKnNjcCkNCj4gPiAgICAgICAgICAgICAgICAqIE1UODE5Ml9TQ1AyQVBNQ1VfSVBDLg0KPiA+
ICAgICAgICAgICAgICAgICovDQo+ID4gICAgICAgICAgICAgICB3cml0ZWwoTVQ4MTkyX1NDUF9J
UENfSU5UX0JJVCwNCj4gPiAtICAgICAgICAgICAgICAgICAgICBzY3AtPmNsdXN0ZXItPnJlZ19i
YXNlICsNCj4gPiBNVDgxOTJfU0NQMkFQTUNVX0lQQ19DTFIpOw0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgIHNjcC0+Y2x1c3Rlci0+cmVnX2Jhc2UgKyBzY3AtPmRhdGEtDQo+ID4gPnNjcF90b19o
b3N0X2lwY19jbHJfcmVnKTsNCj4gPiAgICAgICB9IGVsc2Ugew0KPiA+ICAgICAgICAgICAgICAg
c2NwX3dkdF9oYW5kbGVyKHNjcCwgc2NwX3RvX2hvc3QpOw0KPiA+ICAgICAgICAgICAgICAgd3Jp
dGVsKDEsIHNjcC0+Y2x1c3Rlci0+cmVnX2Jhc2UgKw0KPiA+IE1UODE5Ml9DT1JFMF9XRFRfSVJR
KTsNCj4gPiBAQCAtNTU5LDggKzU2MCwxMCBAQCBzdGF0aWMgaW50IG10ODE4OF9zY3BfYzFfYmVm
b3JlX2xvYWQoc3RydWN0DQo+ID4gbXRrX3NjcCAqc2NwKQ0KPiA+IA0KPiA+ICBzdGF0aWMgaW50
IG10ODE5Ml9zY3BfYmVmb3JlX2xvYWQoc3RydWN0IG10a19zY3AgKnNjcCkNCj4gPiAgew0KPiA+
ICsgICAgIHUzMiBzY3Ayc3BtX2lwY19jbHIgPSBzY3AtPmRhdGEtPnNjcF90b19zcG1faXBjX2Ns
cl9yZWc7DQo+ID4gKw0KPiA+ICAgICAgIC8qIGNsZWFyIFNQTSBpbnRlcnJ1cHQsIFNDUDJTUE1f
SVBDX0NMUiAqLw0KPiA+IC0gICAgIHdyaXRlbCgweGZmLCBzY3AtPmNsdXN0ZXItPnJlZ19iYXNl
ICsNCj4gPiBNVDgxOTJfU0NQMlNQTV9JUENfQ0xSKTsNCj4gPiArICAgICB3cml0ZWwoMHhmZiwg
c2NwLT5jbHVzdGVyLT5yZWdfYmFzZSArIHNjcDJzcG1faXBjX2Nscik7DQo+ID4gDQo+ID4gICAg
ICAgd3JpdGVsKDEsIHNjcC0+Y2x1c3Rlci0+cmVnX2Jhc2UgKyBNVDgxOTJfQ09SRTBfU1dfUlNU
Tl9TRVQpOw0KPiA+IA0KPiA+IEBAIC01NzQsNiArNTc3LDExIEBAIHN0YXRpYyBpbnQgbXQ4MTky
X3NjcF9iZWZvcmVfbG9hZChzdHJ1Y3QNCj4gPiBtdGtfc2NwICpzY3ApDQo+ID4gICAgICAgLyog
ZW5hYmxlIE1QVSBmb3IgYWxsIG1lbW9yeSByZWdpb25zICovDQo+ID4gICAgICAgd3JpdGVsKDB4
ZmYsIHNjcC0+Y2x1c3Rlci0+cmVnX2Jhc2UgKw0KPiA+IE1UODE5Ml9DT1JFMF9NRU1fQVRUX1BS
RURFRik7DQo+ID4gDQo+ID4gKyAgICAgLyogc2V0IHRoZSBkb21haW4gb2YgbWFzdGVyIGluIFND
UCAqLw0KPiA+ICsgICAgIGlmIChzY3AtPmRhdGEtPnNjcF9zZWN1cmVfZG9tYWluX3JlZykNCj4g
PiArICAgICAgICAgICAgIHdyaXRlbChzY3AtPmRhdGEtPnNjcF9kb21haW5fdmFsdWUsDQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgc2NwLT5jbHVzdGVyLT5yZWdfYmFzZSArIHNjcC0+ZGF0YS0N
Cj4gPiA+c2NwX3NlY3VyZV9kb21haW5fcmVnKTsNCj4gPiArDQo+ID4gICAgICAgcmV0dXJuIDA7
DQo+ID4gIH0NCj4gPiANCj4gPiBAQCAtMTQ2NCw2ICsxNDcyLDI0IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgbXRrX3NjcF9vZl9kYXRhDQo+ID4gbXQ4MTg4X29mX2RhdGFfYzEgPSB7DQo+ID4gICAg
ICAgLnNjcF9zaXplcyA9ICZtdDgxODhfc2NwX2MxX3NpemVzLA0KPiA+ICB9Ow0KPiA+IA0KPiA+
ICtzdGF0aWMgY29uc3Qgc3RydWN0IG10a19zY3Bfb2ZfZGF0YSBtdDgxODlfb2ZfZGF0YSA9IHsN
Cj4gPiArICAgICAuc2NwX2Nsa19nZXQgPSBtdDgxOTVfc2NwX2Nsa19nZXQsDQo+ID4gKyAgICAg
LnNjcF9iZWZvcmVfbG9hZCA9IG10ODE5Ml9zY3BfYmVmb3JlX2xvYWQsDQo+ID4gKyAgICAgLnNj
cF9pcnFfaGFuZGxlciA9IG10ODE5Ml9zY3BfaXJxX2hhbmRsZXIsDQo+ID4gKyAgICAgLnNjcF9y
ZXNldF9hc3NlcnQgPSBtdDgxOTJfc2NwX3Jlc2V0X2Fzc2VydCwNCj4gPiArICAgICAuc2NwX3Jl
c2V0X2RlYXNzZXJ0ID0gbXQ4MTkyX3NjcF9yZXNldF9kZWFzc2VydCwNCj4gPiArICAgICAuc2Nw
X3N0b3AgPSBtdDgxOTJfc2NwX3N0b3AsDQo+ID4gKyAgICAgLnNjcF9kYV90b192YSA9IG10ODE5
Ml9zY3BfZGFfdG9fdmEsDQo+ID4gKyAgICAgLmhvc3RfdG9fc2NwX3JlZyA9IE1UODE5Ml9HSVBD
X0lOX1NFVCwNCj4gPiArICAgICAuaG9zdF90b19zY3BfaW50X2JpdCA9IE1UODE5Ml9IT1NUX0lQ
Q19JTlRfQklULA0KPiA+ICsgICAgIC5zY3BfdG9faG9zdF9pcGNfc2V0X3JlZyA9IE1UODE5Ml9T
Q1AyQVBNQ1VfSVBDX1NFVCwNCj4gPiArICAgICAuc2NwX3RvX2hvc3RfaXBjX2Nscl9yZWcgPSBN
VDgxODlfU0NQMkFQTUNVX0lQQ19DTFIsDQo+ID4gKyAgICAgLnNjcF90b19zcG1faXBjX2Nscl9y
ZWcgPSBNVDgxODlfU0NQMlNQTV9JUENfQ0xSLA0KPiA+ICsgICAgIC5zY3Bfc2VjdXJlX2RvbWFp
bl9yZWcgPSBNVDgxODlfU0NQX1NFQ1VSRV9ET01BSU4sDQo+ID4gKyAgICAgLnNjcF9kb21haW5f
dmFsdWUgPSBNVDgxODlfU0NQX0RPTUFJTl9WQUwsDQo+ID4gKyAgICAgLnNjcF9zaXplcyA9ICZk
ZWZhdWx0X3NjcF9zaXplcywNCj4gPiArfTsNCj4gPiArDQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgbXRrX3NjcF9vZl9kYXRhIG10ODE5Ml9vZl9kYXRhID0gew0KPiA+ICAgICAgIC5zY3BfY2xr
X2dldCA9IG10ODE5Ml9zY3BfY2xrX2dldCwNCj4gPiAgICAgICAuc2NwX2JlZm9yZV9sb2FkID0g
bXQ4MTkyX3NjcF9iZWZvcmVfbG9hZCwNCj4gPiBAQCAtMTQ3NSw2ICsxNTAxLDEwIEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgbXRrX3NjcF9vZl9kYXRhDQo+ID4gbXQ4MTkyX29mX2RhdGEgPSB7DQo+
ID4gICAgICAgLmhvc3RfdG9fc2NwX3JlZyA9IE1UODE5Ml9HSVBDX0lOX1NFVCwNCj4gPiAgICAg
ICAuaG9zdF90b19zY3BfaW50X2JpdCA9IE1UODE5Ml9IT1NUX0lQQ19JTlRfQklULA0KPiA+ICAg
ICAgIC5zY3Bfc2l6ZXMgPSAmZGVmYXVsdF9zY3Bfc2l6ZXMsDQo+ID4gKyAgICAgLnNjcF90b19o
b3N0X2lwY19zZXRfcmVnID0gTVQ4MTkyX1NDUDJBUE1DVV9JUENfU0VULA0KPiA+ICsgICAgIC5z
Y3BfdG9faG9zdF9pcGNfY2xyX3JlZyA9IE1UODE5Ml9TQ1AyQVBNQ1VfSVBDX0NMUiwNCj4gPiAr
ICAgICAuc2NwX3RvX3NwbV9pcGNfY2xyX3JlZyA9IE1UODE5Ml9TQ1AyU1BNX0lQQ19DTFIsDQo+
ID4gKyAgICAgLnNjcF9zaXplcyA9ICZkZWZhdWx0X3NjcF9zaXplcywNCj4gDQo+IFlvdSBhcmUg
aW50cm9kdWNpbmcgYSBkdXBsaWNhdGUgLnNjcF9zaXplcw0KPiANCj4gVGhhbmtzLA0KPiBNYXRo
aWV1DQo+IA0KDQpUaGFua3MsIEkgd2lsbCByZW1vdmUgdGhlIGR1cGxpY2F0ZSAuc2NwX3NpemVz
IGluIG10ODE5Ml9vZl9kYXRhLg0KDQo+ID4gIH07DQo+ID4gDQo+ID4gIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgbXRrX3NjcF9vZl9kYXRhIG10ODE5NV9vZl9kYXRhID0gew0KPiA+IEBAIC0xNTIwLDYg
KzE1NTAsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZA0KPiA+IG10a19zY3Bf
b2ZfbWF0Y2hbXSA9IHsNCj4gPiAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4
Ni1zY3AiLCAuZGF0YSA9DQo+ID4gJm10ODE4Nl9vZl9kYXRhIH0sDQo+ID4gICAgICAgeyAuY29t
cGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODgtc2NwIiwgLmRhdGEgPQ0KPiA+ICZtdDgxODhfb2Zf
ZGF0YSB9LA0KPiA+ICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTg4LXNjcC1k
dWFsIiwgLmRhdGEgPQ0KPiA+ICZtdDgxODhfb2ZfZGF0YV9jb3JlcyB9LA0KPiA+ICsgICAgIHsg
LmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTg5LXNjcCIsIC5kYXRhID0NCj4gPiAmbXQ4MTg5
X29mX2RhdGEgfSwNCj4gPiAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Mi1z
Y3AiLCAuZGF0YSA9DQo+ID4gJm10ODE5Ml9vZl9kYXRhIH0sDQo+ID4gICAgICAgeyAuY29tcGF0
aWJsZSA9ICJtZWRpYXRlayxtdDgxOTUtc2NwIiwgLmRhdGEgPQ0KPiA+ICZtdDgxOTVfb2ZfZGF0
YSB9LA0KPiA+ICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTk1LXNjcC1kdWFs
IiwgLmRhdGEgPQ0KPiA+ICZtdDgxOTVfb2ZfZGF0YV9jb3JlcyB9LA0KPiA+IC0tDQo+ID4gMi40
NS4yDQo+ID4gDQo=
