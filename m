Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1449622259E;
	Mon,  4 Aug 2025 09:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754298613; cv=fail; b=e4Ky/Yq6wAY2COWHDarR2H3Usi+DtHzK0z5pJqFFsQI/FG4U4gOo3tXjTOWOICFMxwkLiWCyOGCxMGgIdkUU9MftUjUzgsoI+K0Ngi4I5tF1i8Zwk6jsuE3kzFHABqwXmvgBxJnRSeTf5U6PHmt/oUzMPvpEM22LmJMrwiVF+qY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754298613; c=relaxed/simple;
	bh=9HL5ff8v5GFRKL3zlcAaEChigKIAFEKWTAnvXjyMb/E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rD0K2NLIhnXUGo7Al+OkUCNtwh8HqsmgtTpPI0xnUBYAcADKSONiMS1+gQUFbEJog2R+wKk0fkWTOJk055Px8iqWoCSOHlsdWcgnQ1pcXvDx7ydfckIhTWVpNhcjzEgjcGlTM/cgB1ttSVwlZLbh9d9k/gDj+29NQh3LUlTZsfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=cgwKdCvQ; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=bVeRoR+V; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cgwKdCvQ";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="bVeRoR+V"
X-UUID: cf2bc60a711211f08871991801538c65-20250804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=9HL5ff8v5GFRKL3zlcAaEChigKIAFEKWTAnvXjyMb/E=;
	b=cgwKdCvQrPjNBrteHw5+ZPR7rmYdLNtsWv/v/6jUl+TbfR4msAeLlBZAO0ICoja1ftpHAAkStPBNYTsLJn1GaGCqsqNGyS4JFrWBNbNaFPDDaNNH57CmkBslfvoAt7xg3hohK7AR45RJ6NTtZP5Vgpx/2UnqzG6xfOdzzdaZv4k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:4f59165c-cfe4-4c7a-9e2d-a1ab4455edbe,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:1c0b1809-aadc-4681-92d7-012627504691,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cf2bc60a711211f08871991801538c65-20250804
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <huayu.zong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 360947025; Mon, 04 Aug 2025 17:10:04 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 4 Aug 2025 17:10:02 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 4 Aug 2025 17:10:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RT9p+02tjTmWhrvGyWm7q9nUVCdZyNz5bYkSW/FP9hvJJabTGsmk9c7alKvbvq3DSOpSs97iOrdgo22W/QmxCIKB3lmf2TjIDJXtBNVVuGzuntkwzR1zHkpMfusEUsEDLjqZKWseCHxAaJzhpQQSFu9yCYw42PuLwsfZSgo89vRm3pFJ49P2ERjWvge3QWft2zunbMuOq3mXFSdPri4E3iOHUb7WOh0SWf0mgP9XeyAiyNzR3rMxDwJLGJaw+t2xwuixTeK9C/CGUXpbf7XBSe6dZ9Hk/tPPE9IdfxAsM3hNmvyr/dKkL3+j1vf3YCv/QJ39JsYdw4/Prm6VfZzkHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9HL5ff8v5GFRKL3zlcAaEChigKIAFEKWTAnvXjyMb/E=;
 b=aJ1SkFZoGP/qDvFbBETEdffkU1jIhiFcolfUEDrELYxn9qwZIx4vFhaqanj5DHBwJ3JiEDbs9cjwXexZsRmcKEr1BrOGYoO4UZor0sXFrzov6r5N37GC3lw/pKOTTuWHccgakYu4BSgGWC1UneWH9IEtz1UhvuLWFIpkM9O6bIE8R7F6G90CVn4UMpRJndP9qpo3UeKa8G5T1mzsRIcJ1JztVz/sn3dh4RB9/jmFpaZeWHNFEKNwsil2YRxY2ORxZ83157yi1fMDimpXHamaAksIw5kUKaA4xk5LXQDSbQeiE2MGU0c5Cn0jmxCbLbJUW1gZfvsLIFuteGsyoHAdAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HL5ff8v5GFRKL3zlcAaEChigKIAFEKWTAnvXjyMb/E=;
 b=bVeRoR+VqpfC9p3mKQ4q+uBmLkPtC9Q4H6Z+y6J57ImbtU/5Kqu9Q54kekNIKNitruuo1mvf3zn/g3iX23q2HmZaaCY4JBrhW6N5APm/C9YQOTnecdonAL7XXEV/4VrKdsc9UHC7VbfmeGvSSrXTRcymyApU1Q9lfJZZU5++tLg=
Received: from KL1PR03MB5808.apcprd03.prod.outlook.com (2603:1096:820:81::12)
 by TYSPR03MB7824.apcprd03.prod.outlook.com (2603:1096:400:47b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 09:10:01 +0000
Received: from KL1PR03MB5808.apcprd03.prod.outlook.com
 ([fe80::b75c:b0c5:893b:193]) by KL1PR03MB5808.apcprd03.prod.outlook.com
 ([fe80::b75c:b0c5:893b:193%7]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 09:10:00 +0000
From: =?utf-8?B?SHVheXUgWm9uZyAo57q15Y2O5a6HKQ==?= <Huayu.Zong@mediatek.com>
To: =?utf-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= <TingHan.Shen@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "andersson@kernel.org"
	<andersson@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "mathieu.poirier@linaro.org"
	<mathieu.poirier@linaro.org>
CC: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH 1/3] dt-bindings: remoteproc: mediatek: Add binding for
 mt8189 scp
Thread-Topic: [PATCH 1/3] dt-bindings: remoteproc: mediatek: Add binding for
 mt8189 scp
Thread-Index: AQHcADDoNZEn24Fdx0uTV8qr/L9vOLRSMtUAgAAL5IA=
Date: Mon, 4 Aug 2025 09:10:00 +0000
Message-ID: <054c15233e27eec29bb88f7839f99b9ccce9691b.camel@mediatek.com>
References: <20250729023125.9036-1-huayu.zong@mediatek.com>
	 <20250729023125.9036-2-huayu.zong@mediatek.com>
	 <7aececf2-438a-4dbc-90e6-fd457a12ace6@collabora.com>
In-Reply-To: <7aececf2-438a-4dbc-90e6-fd457a12ace6@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5808:EE_|TYSPR03MB7824:EE_
x-ms-office365-filtering-correlation-id: dc31be76-5f6d-474d-a178-08ddd336b101
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UjNBaHhCRjZoZjZ5TW9JWkxxSXcyT3FhK0F5dTBMOGFkVmtPdlg4RFFUZ0Zx?=
 =?utf-8?B?MDZZWEFvaVovK1FrRGd1ODRveGNDZytyL3hqZGVSVFJoTEFqdlZPS0VKSEZB?=
 =?utf-8?B?WGpjNFJJQXNBMUk1Ly9tY1VoVTF0MGFzTUdNZTdmbTRkRWJ5OWZiWS9CeW1W?=
 =?utf-8?B?UllPSXNWRTRIS1BwSEFmREpUTVpZeUw3UnROM0FZWUhNZFYrZUJSVm9WOExn?=
 =?utf-8?B?QTFHVEF5WkZOdkdLbXJCR2oxbHpSREZFMkhWZmFGaFVkRjB3aU9kYkMvU05s?=
 =?utf-8?B?WE1mUTMxSnRNVnpDN3RqdVZhTmRZSzR1bVNIQ2JlcUVUaitUV3lISkwzV2pi?=
 =?utf-8?B?UUhOYTVxV3FreTFGM2VkUUtzRklneXlTd2pXQmQweGQvMGhxa2NzK1ppT3Bu?=
 =?utf-8?B?dmpaVTBzcjZBVmdteTRrWFVtY29OeHh5d2VBdGFnWUtoWTU5M1BaK0hwSS9N?=
 =?utf-8?B?cHkwTXc2YVFDSHFtM2ZzclpXblJrZnRsQkMrQ3R4VHdMakhLK0cwVlhLb29N?=
 =?utf-8?B?Q2ZFSVZKNWp6ZEhNekYrN1JSM1FudkRocUc2ZWsvQmhrc3VhQzA4eDFDTWNM?=
 =?utf-8?B?c1JVZUtyQktFY3RPa25FY1FodnVoTEIyRGdNcForbkI1MnYyMTBYaGEzZFhO?=
 =?utf-8?B?azc2dTVqUGhuQ3Y5d2VyTm5ob1ZjdG1MUDdWZ05jaFpWb0duaHZGOHRWSndG?=
 =?utf-8?B?UCtSbUdHbVk3bFNjWVZUSWgzVXZnaXNxSVZTWDJzVlJUN2s4R3RNb1FoajhY?=
 =?utf-8?B?RHFUZjRpZ0FrRmZZd3BKQUFVT1pnck5HdG00UjhJNGZDNkRSemg1dHEyeWZ4?=
 =?utf-8?B?M25hOGU5b1RvcCt3dmxwU25zSlFsOWlaUTNlWCtwQTFqTjhBMzhsMWVRY01Y?=
 =?utf-8?B?NVFpNFRhWm5PNHdwcnRkc1E5K3pSeDF2aVRNOHFDb3lncWNTaU04cW5qTTFo?=
 =?utf-8?B?MlRnK01TZkZDVjdHd0graC9xbi9jSTg2Zmg3c3JUWTZNVWxTcTdDKzFyZ0Qy?=
 =?utf-8?B?WmU3bXBCRVQvdjE5STUydFlseDVMVlJkNGg4OG9tTVlwR2hweUx3ZmNtYUt2?=
 =?utf-8?B?SjUzY0RGL0FtUWNTbzI0S3NLbkg5RVl4UUpORjVFYnM0L0lyME1zanM3NmNy?=
 =?utf-8?B?bjBxeU95cTBtSFRXVTdnM243Mk04N1lhRHNRbDZYSWh1d0hNUlU1VEV2MHZH?=
 =?utf-8?B?YWZTSk1HV0RRL3V5VVBKRnlqZVFwUFZNMVR5QkhPanRkTHlzZ2VSWmNMbFRq?=
 =?utf-8?B?K0poR2R1ZWU5RVAxUy9DemgzQld4N0pBOVZzMGxKZkZ4azFQUmtUM0lwZ1Np?=
 =?utf-8?B?UHBWOC9PSm1ucHpyVGl2ZXdYZko3eS90aWVQd2dLNzdNSmFYTjJjcmo2dHc5?=
 =?utf-8?B?bUhaZWdGV2NROW9VUUhVRklNQ2xKK2U2d3pucy9Bd0FhQ0p0ZExmNkdrZjlj?=
 =?utf-8?B?emlkcGt6L3JsZGhidCt0UXA5ZVN6NkkxK0IzRjIvbjBDNmE1UElsVmJrd3Ri?=
 =?utf-8?B?bmVGaFBZWHMyVm9DWkVFYnBkY1VsRVVlWTB1Q0xNNFhZL0VqdE5mZUNXQlc3?=
 =?utf-8?B?QUJBblFyT204VXFmWVg4YnJCd1pQZDFqYlF4aWFKV3ZIM0taU1BQYWRVWlVG?=
 =?utf-8?B?VnlMWGtMU2NOTWNSUTIyZTdyb2NyRWF3VjNKOW1aNThET3dvMDFlMm1pUWlV?=
 =?utf-8?B?NUV3YUVVUjdQaWNaUTB2SS9xbWdLTXhmMGlpT09TQ1F6ekVwVXpDM3NZaUFl?=
 =?utf-8?B?Yk9oQVVmQUJCaElHaXpCdlZlK0hqK3E0Wk9QYzZpTEt0d2xLZXJKdGFSK0tG?=
 =?utf-8?B?SmxFK1lZdGVHVHB2RWVRQ2pGQ3RsNFFKTE85TWUwandYVlBtQktmaERNQXBv?=
 =?utf-8?B?SHhKQTdzdWUreGNoMWVTSkxGVVNhZFBKdHU1eHJkYzByRVVZS0pkS0Q3Y2RD?=
 =?utf-8?B?NGN5VklXRDJmaVhSbGcyL251bzFQei9oKy8yUWlyVHZobk1CQW15UWZPaTlD?=
 =?utf-8?B?L3hxNXkzcXBnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5808.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UnlMMkRJQS8vYkVKVXJWVlc3SHZRWFp2SkRoandqcjBaSW1OQWdlaGVmc3Zh?=
 =?utf-8?B?TmpGM0VPd1I4NW9wMXpvNHh4cUgvczN5TUtnZEpJWnlJejJTckpZczMramlL?=
 =?utf-8?B?U29qY0NIME85RHVHdXpuYlBlZ0NGMlVlYVZraGd1V1BOMTZFMWwyY0xJNXda?=
 =?utf-8?B?TjFGTjNjeGdjMWd5aFBOWnl3V1hRVUJsb0J4Qmp5YXZBaGtoZ1d4VSt2c1F0?=
 =?utf-8?B?YytDYlIzZkVvUWRpb04yTDc0djRrS0NuV3FLRWVvTjdkcEVsQUl5NksrYlNT?=
 =?utf-8?B?TnBhK1M4SkhtbGVlYk0vQlZOME5EOElUdmNKN1ZFd3hEZ0ZnMzRCYkJxQXp6?=
 =?utf-8?B?VU9qODh3YWp2NjZqSFNQUEErUTRmTkNsc1d2UVpIUkNkNzd4eHQ2ZnlUQkNU?=
 =?utf-8?B?R1RYVS9WWTdHSkU0VWQwekhUbmQvTVlxVitUdHAyWDJ0S1h4LzBRTG9UdHRM?=
 =?utf-8?B?ZjNwTlorRDRXTUtOdFc3cjI0MFgwcitsWWtVdlhJODg5WHpGZDVNL0NTYTVW?=
 =?utf-8?B?Z055WGFVdlJBZ01ta1pZeTczRzQ0eWRad1NOS0E4WnNuZ3BQOUUxV1NWZUsz?=
 =?utf-8?B?NDI1RDN1VXVYdDloM0VwaGtHTGNoMzlXOW1ZQVF3UkRycUpsb2NXTThDalBC?=
 =?utf-8?B?aDhlbUNlR2xCOERmNXd0ckZobjFJZnlKd3JRRjNMbUJKcmZGQzZsQmVqaWxE?=
 =?utf-8?B?dlN3TU03ZHdPelFhYUl4YzN3OGdFRVBza3Q3c0NidHJnUHgrbVBPZjVHSU1U?=
 =?utf-8?B?UGp1ejl6VTM5SHUwbG9OMUpJUDZpNHlDU0ZsMERtcVllZHlOZ1FhQXdFUERx?=
 =?utf-8?B?Nnh4VXBDSmsrSUl5a0tkYWQ2eklONjdBc09NajNPSi9iK0d0amZqbjczWmxt?=
 =?utf-8?B?T2JBbXhRcDJMRGVzZXFYWlNLVzdaL2tBSlU4cjM1V3VXRHZCT1Y2MUI3aUV5?=
 =?utf-8?B?YU5iOFA2cis3U21pRXZQMU5HSG9QSlZJZDBNUFR4T2J2Wkw5WDR4YWlxZ1li?=
 =?utf-8?B?endwdXpoSEY5L0JaalBObTV3R2ZXZGs5UWxLVGJUVmxjZm4wbi9sL3R2SUVV?=
 =?utf-8?B?U2xjL0ltMXFPZjN2cWV2T3g4OGFJZTNLZTQwdlc5V0FCbW0vb1dNY1IvRUNt?=
 =?utf-8?B?SW1iVTlEeFBNMDBBRTJOL2licndIeUxIbXgrV3dHTnZEZFBMdTFSUHJOZDNE?=
 =?utf-8?B?L3k3RlB0R2dYSFVsNFhiaFByY2FTanBZcXQ0VktNUGxnQnlyWVdsSEVIeldJ?=
 =?utf-8?B?YjdrdFA1dTRnN1o4UzdBUkJCU29Wb29jdXdSejdPYmErUkxjb2FOVU8yQnBE?=
 =?utf-8?B?dXluWlpNT2pCeWc1RFVPVVNWV3RneFhjc1hiOFNLbmdEbTlVRnp4amMwbTBD?=
 =?utf-8?B?cCtqN3dXZWZyZ1U2V3FXOWY2SEhoNm5zYlNZSFVuNGRLTm5GREtCSEVqbnFG?=
 =?utf-8?B?VDJ3V3dKWnQ2TENrcTlmYzBaSndUL2R1MmJpMWZ1aUQyUE9SdUZEZjArcUJ6?=
 =?utf-8?B?dWlVQVJaZER2eEJXdXUxYUx4S1N2TFY3R2FtZGt6d256Ung0eVdkTU55N0Zt?=
 =?utf-8?B?bVYweE9Yb214MGJCU3dLUVVUTTJrNUxDdWc5Ni92RDRycGt5akdGZ3ROcmV0?=
 =?utf-8?B?ZEpFdVl4RllPWHF3cnpLVTRwQ1hXaFpqQVRyUXhLaWhqbXR4aWFNRUdaYnhT?=
 =?utf-8?B?a0xNcGhFd1I5NzErNlFoa1pkZkFyTVNLRmlTWStEVmZTaldkMWQrMmpRYjBC?=
 =?utf-8?B?dkFYWEMweks1NHcyRHl3YzRjSzNHTGJYcjVoNGQvaHZxbjd2UzUyNFZUa1hm?=
 =?utf-8?B?MkhMN1hZYnU0ZDljRUNqdzg5RExwdlR2b09XaVVFSm1NMWJ6N2dTdkdhKzVL?=
 =?utf-8?B?djV0RFFKb3kxRTVHbzRTZ2pma3ZyaUwrSEljelpuNjIzbW9vWGFsOVhjNCth?=
 =?utf-8?B?S1IvWG0vTGNQamV4K1ArYkhiRjdjdmpFOTQ0SVhZVWMrazVoMmRVWS9XZ1hu?=
 =?utf-8?B?bDNBWWRHVEJKUGx0QnU0a2Iwc2RmcUc5SWdHWmcwcGVYMFNMQmdVcENZSUQx?=
 =?utf-8?B?eGtrUE81NUdxS3YzMGxDelU2ZkRQai92ZnJYUmZkQVJ6QzRTS21TeHlUOVNw?=
 =?utf-8?B?UzQybG50MXRoWG9xL2o5NUhmeTVSTzdGaTczWXg3Z216WmY2cHh2UE5haW0z?=
 =?utf-8?B?UWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A0CFB6DABFDA8449D841F83C8D0DB7F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5808.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc31be76-5f6d-474d-a178-08ddd336b101
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2025 09:10:00.7530
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sM0RxlZK2NiY6WqDK+hhWcfIxG/HRe5Yw9ETuc/JPGDVgqxKwhpbUfRZZa7XTtsV2eOUgFFd8xG9rdpof6adAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7824

T24gTW9uLCAyMDI1LTA4LTA0IGF0IDEwOjI3ICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAyOS8wNy8yNSAwNDozMSwgSHVheXUgWm9u
ZyBoYSBzY3JpdHRvOg0KPiA+IEFkZCB0aGUgY29tcGF0aWJsZSBmb3IgbXQ4MTg5IFNDUCB0byB0
aGUgYmluZGluZy4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBIdWF5dSBab25nIDxodWF5dS56
b25nQG1lZGlhdGVrLmNvbT4NCj4gDQo+IElzIE1UODE4OSdzIFNDUCByZWFsbHkgc2luZ2xlLWNv
cmU/DQo+IA0KPiBBbGwgb2YgdGhlIG5ldyBTb0NzIGhhdmUgdHdvIFNDUCBjb3JlcyAtIGl0J3Mg
YSBiaXQgc3RyYW5nZSB0byBzZWUNCj4gdGhhdCA4MTg5IGhhcw0KPiBvbmx5IG9uZS4uLiBoZW5j
ZSwgcGxlYXNlIHRyaXBsZSBjaGVjayBhbmQgY29uZmlybS4NCj4gDQo+IENoZWVycywNCj4gQW5n
ZWxvDQo+IA0KDQp5ZXMuIE9uIHRoZSA4MTg5IHBsYXRmb3JtLCB0aGUgYXJjaGl0ZWN0dXJlIGRl
c2lnbiBvZiBTQ1AgaXMgYSBzaW5nbGUNCmNvcmUuDQoNCj4gPiAtLS0NCj4gPiAgIERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9jL210ayxzY3AueWFtbCB8IDIgKysN
Cj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0t
Z2l0DQo+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVtb3RlcHJvYy9t
dGssc2NwLnlhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZW1v
dGVwcm9jL210ayxzY3AueWFtbA0KPiA+IGluZGV4IGFkYzZiM2YzNmZkZS4uODhlMjQwNDMwZjNm
IDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZW1v
dGVwcm9jL210ayxzY3AueWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9yZW1vdGVwcm9jL210ayxzY3AueWFtbA0KPiA+IEBAIC0yMCw2ICsyMCw3IEBAIHBy
b3BlcnRpZXM6DQo+ID4gICAgICAgICAtIG1lZGlhdGVrLG10ODE4Ni1zY3ANCj4gPiAgICAgICAg
IC0gbWVkaWF0ZWssbXQ4MTg4LXNjcA0KPiA+ICAgICAgICAgLSBtZWRpYXRlayxtdDgxODgtc2Nw
LWR1YWwNCj4gPiArICAgICAgLSBtZWRpYXRlayxtdDgxODktc2NwDQo+ID4gICAgICAgICAtIG1l
ZGlhdGVrLG10ODE5Mi1zY3ANCj4gPiAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTk1LXNjcA0KPiA+
ICAgICAgICAgLSBtZWRpYXRlayxtdDgxOTUtc2NwLWR1YWwNCj4gPiBAQCAtMTY4LDYgKzE2OSw3
IEBAIGFsbE9mOg0KPiA+ICAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgxODMtc2NwDQo+ID4g
ICAgICAgICAgICAgICAtIG1lZGlhdGVrLG10ODE4Ni1zY3ANCj4gPiAgICAgICAgICAgICAgIC0g
bWVkaWF0ZWssbXQ4MTg4LXNjcA0KPiA+ICsgICAgICAgICAgICAtIG1lZGlhdGVrLG10ODE4OS1z
Y3ANCj4gPiAgICAgICB0aGVuOg0KPiA+ICAgICAgICAgcHJvcGVydGllczoNCj4gPiAgICAgICAg
ICAgcmVnOg0KPiANCj4gDQo+IA0K
