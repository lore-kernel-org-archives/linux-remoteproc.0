Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4017F35972;
	Mon,  4 Aug 2025 10:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754304321; cv=fail; b=Sme6CBVSASEOKBZiNOJS6JG/Rh97fHEIYoN4cdIGuRbfc417UgZz/CnObxfYjpy6PbsfH75zIH+9hugqNANkQWvptXYSBaZD9+nLhBDFEKHxniwpt0DY65lX0J3qOZAMnbA8EM0ayafeLDAqE4Op4VLg0tsR/cXrhVJkDHud4TU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754304321; c=relaxed/simple;
	bh=QN7PO1jFBSC84gOZ3auMiw3wN0i9/PdkU59e03nqF7M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BRybVqclbWmxElWkvlY5rcR41U3JrFMq5FsNHr9YYoSCFzvVV8+0Jce4gZyiZALu9L4ClKonxVkJAYqVsNSO5lieJO7CeAuYOElFEnBB4NOiTXAaYb8Bn9OHH5+VzpBqU2+DNsiRG8+Q84knzKNbhazIgQBqYvwPL2Vq5u5YKlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=nHK8eWtv; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=P6rky/KL; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nHK8eWtv";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="P6rky/KL"
X-UUID: 18c44884712011f0b33aeb1e7f16c2b6-20250804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=QN7PO1jFBSC84gOZ3auMiw3wN0i9/PdkU59e03nqF7M=;
	b=nHK8eWtvdnxzz09ZClmE28Xd4zeH5a+K4xg23DuQzi6tMHjCx3e+bMOnTMeLpwqp3U1hDTgn4hz0ketUgiN8WwBxtsqdQxL/zlNzXlMPEMdDM4Hos7A1qAZ3O94vhvOIvfMK7ClZbOGJ5kKRX1LNtnYx6lFvMDgrseHQwyfVdiY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:75b20061-3497-4626-808a-f5c6a983822b,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:0cc1959a-32fc-44a3-90ac-aa371853f23f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 18c44884712011f0b33aeb1e7f16c2b6-20250804
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <huayu.zong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 443456040; Mon, 04 Aug 2025 18:45:11 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 4 Aug 2025 18:45:09 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 4 Aug 2025 18:45:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x6fa/+XXPsWYF/pOcVbaAiqQfJKKmD+ZLmkV2v0PZGC64C9JDVOsd335mC9Nz1Tgji9AcriS+q7CHUHQCZ4Zn3LUNCvv5naPuo4FwpVHNyTu++/E9nFaonK/o7rpXofOWAj6gvwThylzXOZzVSdFDp/otgSeAzYWjpr5nwmNyv9l3AuKA3oZYq5Mw6wjlR3ZB29PAwqBP8nvyQuHI9sn+7J6v022es3VG2e1Y87keFXZp7uZby3HsPMVhnpFBmsEQnGi+3PJUQRH8DvWn/jXTNyL8jOi51aSPTxxsU+R/U4Aw5cLEdiWeoMwBsDDOuRX0bbjJMDLwd/QhFmKJWZLHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QN7PO1jFBSC84gOZ3auMiw3wN0i9/PdkU59e03nqF7M=;
 b=yQHU6rES5mYcYcSjZy5NK4Da9UyxSMut/pBygvy7UVbpv13Lryi43FTktviVtzgd7oTPzps85eQtp8veP8HwcgRMBWoHjkdAInV8HzzYCk+rCPFbMgvWwUc2WdJmUQD14UT9w6OnbF0UABBRNciruZ+CeAyKyJRIy1jehu/C0Jbwyb6r23FszhHg8RnyR1DjbW9pV0/GGxMqyZHkffAskjYcLubpfGB7NuFSj6g3PrxSUEqwPeD28qXzol82c/k1dJRE4NGyzIqw91A7SXX125zYrFYCwCacjqZ9oJOdVlSgKDjiXE8jtLXdZSndbPOuAMvdZ7byHdmAxhxgMZeryg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QN7PO1jFBSC84gOZ3auMiw3wN0i9/PdkU59e03nqF7M=;
 b=P6rky/KLv1hnYF04M23/jb/9AVRILARep2A3nEX+yMmSDZMJ+focXTbScc3mZXKHTigQ6vlHSrqmB1oa9M6HOtpnr4OL9PhMHV7nQVYdg84J4QvXIzDom8SBUHRSub62ytviNLU1/AwCdJbgeROMEz05+n9W3CX841gAxOcR1Cs=
Received: from KL1PR03MB5808.apcprd03.prod.outlook.com (2603:1096:820:81::12)
 by KUZPR03MB9360.apcprd03.prod.outlook.com (2603:1096:d10:21::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 10:45:07 +0000
Received: from KL1PR03MB5808.apcprd03.prod.outlook.com
 ([fe80::b75c:b0c5:893b:193]) by KL1PR03MB5808.apcprd03.prod.outlook.com
 ([fe80::b75c:b0c5:893b:193%7]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 10:45:07 +0000
From: =?utf-8?B?SHVheXUgWm9uZyAo57q15Y2O5a6HKQ==?= <Huayu.Zong@mediatek.com>
To: "conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "andersson@kernel.org"
	<andersson@kernel.org>, =?utf-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?=
	<TingHan.Shen@mediatek.com>, AngeloGioacchino Del Regno
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
Thread-Index: AQHcADDoNZEn24Fdx0uTV8qr/L9vOLRSMtUAgAAL5ICAAACEAIAAGg8A
Date: Mon, 4 Aug 2025 10:45:07 +0000
Message-ID: <32cd4a72220e7306b81af6fbf1748add61478467.camel@mediatek.com>
References: <20250729023125.9036-1-huayu.zong@mediatek.com>
	 <20250729023125.9036-2-huayu.zong@mediatek.com>
	 <7aececf2-438a-4dbc-90e6-fd457a12ace6@collabora.com>
	 <054c15233e27eec29bb88f7839f99b9ccce9691b.camel@mediatek.com>
	 <b6311035-9699-4f59-a3fd-8e1114ba9e0d@collabora.com>
In-Reply-To: <b6311035-9699-4f59-a3fd-8e1114ba9e0d@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5808:EE_|KUZPR03MB9360:EE_
x-ms-office365-filtering-correlation-id: 8d4c1290-d125-4e10-b521-08ddd343fa65
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bjRUQzdUZHgxMTQzWHJkbmFLZ0xoaHo0TjVjcldoTFpqeE9PMDVqeE1IWG1t?=
 =?utf-8?B?VTVFOHhPZ0xlZDh6WWQ2c2xzUzNSOWNOWStIYjQzWlp5ODhBM3JKazVKRHkz?=
 =?utf-8?B?YXRWbnBlajJLMjB3L1hleHc4b1Rkd2Q3bXpXd3hId1psY1E2Vk9UWUpvYTYw?=
 =?utf-8?B?TVVhcXRodXprYlR0QWlWeUV4cXpXYlloVVFzTWJHQ2ZIL2VQUXBrOWR0aUNY?=
 =?utf-8?B?TkVSOHN2NnI2TGYyVG1ocWxaUmZjMHAvRU1LRzRtVERJV21LdHI0eEhrWm8w?=
 =?utf-8?B?cHJDN1pvL1BOYWJlT2ZaOXdlTnVVZ1hVWENHMGJJN1ZWWkE1TTRmNW1mdlRi?=
 =?utf-8?B?MmJTTlVzOTJWUGZmM0JqcUdPaE51Tzl4TEhody8xWTY3eDlRbkdOOG1KV2Q4?=
 =?utf-8?B?WTZva1VidnpqN3h6L1JlT1BPZjlzMWN6MEtyWmNIRkZkcHZ2dTVHdmhVNTBX?=
 =?utf-8?B?K0lFV0JOMnpkc2FkZUVLbVhiMHNmYjBXSFlxTGt0TFROa2oyK2RMRUtmeTVl?=
 =?utf-8?B?STdwcWtML2dKYWxnWmZZMDdTL1pCWWNPMms4aDhEVm12UjJHQXNNbVE0bGhT?=
 =?utf-8?B?Vm01dUxUY3llOHhtTHpJTU9uM29FMGI4MFBaOE52SG1KZU9DbEtIcUNFVDhM?=
 =?utf-8?B?TzBrRWJlNGk3aWdnQUpkMEhCWmg5T2F3UnFTb1BkRXNjcDA5VDFhR2s5VW5N?=
 =?utf-8?B?QURuU1Eyd0w5YTlWMnRsVm1jMnp4d0EvazE2VEdSWnRLRmdVTmZwMmdKVG9K?=
 =?utf-8?B?SHM2S2draEVzSG41emdRR2NRL21EQm0rUHBVRHA5WGdLcHZOclcySVdTTFA0?=
 =?utf-8?B?bzdnZzJNaTFkY1JFcEorRjhZWmYxa1N4VllGNDVHcENRY3NOZ2M3VWIzOVJM?=
 =?utf-8?B?Y2F0T3V3NlpQQlRSQWlKVVBmVTZ4SlUweUdpUFgwR1lZRnVJVXVqRWpTeFoy?=
 =?utf-8?B?UVJLeHVNbU1GWW5sVi9EQjhjemNFR3BPdFVRZzV6YlA0MG1pM25rMm5yT1VO?=
 =?utf-8?B?UkJ1a3REYzZmUS9lMGRBVndnQ0hNaWM3VWhnRUxLVGtDa0NzblYyeTRFZ2s1?=
 =?utf-8?B?TndtODJ6c29HVW1OYWVNL2hWclhHZG41RmRhNHo3VHhJWXhhOVhBMkZ1U2VG?=
 =?utf-8?B?WFRwQTVETFpscFBpdjNTaWdZaGJxYlhvREhyWUxNaStuajNycDJuZkdIYm8x?=
 =?utf-8?B?OFh1aFJTeXcrNy9ZOXJWUDlPaGJ5Z1hmcEFtOStZcjEvYk42ZG5aK3JxTnMz?=
 =?utf-8?B?amJtOE1zT2grRmN3VWRzSXlrcDdJUi8wSWMwTzBPQktpT0ZIUnZZa2xwazhE?=
 =?utf-8?B?QlE5SkpEM1BFazBLalVJOC9jYy90aFphU0YrWWlBZjhtTFYwM2FxSWM0ZWlW?=
 =?utf-8?B?K1hvbFBnOGpsdDlTT1B5ZThXMjVzbmRVUVM5UEtuV1NwQ0RHbUordXJjeXVp?=
 =?utf-8?B?SW9CZzdSenlITlFlZkRrWSsxQ0ZjL2FiN3dpZXlaeVJKZGV6ZUxHak51Z2lv?=
 =?utf-8?B?OHFXYXFyUjdzdE1BenZhcDBWZWlETW92b28rSHF2ckc1bnhaSlZ5VERhdlZM?=
 =?utf-8?B?dzBmVncxcDZDZFlaWUtTNE1GZm5qc0UraUVEWWhHRUZTR2JJdjVwY3ZpVHRL?=
 =?utf-8?B?azJkaWZjTWZuWXdKbjlsVmJWd0U2T2x2TzVVb2xoZDJCMjJYdXBpQlphaUhx?=
 =?utf-8?B?NVNCTWx4bUI4TkpaMGV5ckxVWHB6VHpkRWROWUZud0lDMXNaUEZtYUFwR3M1?=
 =?utf-8?B?MU5POEg4b0JOVXlrZUFNb0ZMUjRLdlNOa0FLcVpKOHk1YVduUXBaRVp6Wm9r?=
 =?utf-8?B?dzVrTE8wMUtveGpwTEpNZHp1dzZIU09CL3kzTDg0Qkt6MVpRait0REYzdkY1?=
 =?utf-8?B?b3ZRSzJBVjNBRHRTc05qc2xXT1pQcStkbXNTSithNnRIMGJYZjg1WUY0dXVm?=
 =?utf-8?B?VnR0VnFlTmcza2ZjZkh3TlVMYXhJK3NPRnBueW9sWUl1NHNpMWRVdVg1NHZr?=
 =?utf-8?B?WUtXVit2ZU9BPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5808.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WTUySWtoamZHeGwxdlN2Tlc3d2pYNWZ5N2FybzhtNGtrRHF2UnN5WUczUWE0?=
 =?utf-8?B?YlBpY0JOUGdpYTliN1ZDSWh0VHpxc0pTOFVHK3hrNXNEOXJjRGxvSnZRaHV0?=
 =?utf-8?B?c3kxeGNRd0UrYUVLWEFUYmlLN1IwWG9xaHFtcWMzZ3AyMVhLQktmRTNXMjcz?=
 =?utf-8?B?NDNLdHV2VlJiWU1VL2Ywc210ZG5uUjlITmtFWUd5cnJ5dzhWQlFML3V3ZlIy?=
 =?utf-8?B?TzVsNzRCWEhzcHF6MzFJV21sbzNPRUhpVnpjejJId2t1VGxyZzFlTkxjNElD?=
 =?utf-8?B?cmVnVllUSC9sdkJRbUd4RHZGNmZzSVJOb2x4RWk4SkcvaXlueEZZRVRxSW0v?=
 =?utf-8?B?anArNDc1U0hZd2VCSVN6Q1lmOStjVC93ZW1Gb04xWkl1YVlHdUZRR0dQNEdE?=
 =?utf-8?B?cUpYdTlleTBucEorSVFjUkQ3NVJMUldZUDZwNXNCRCtseUpLVnBWZXpJcTZy?=
 =?utf-8?B?Sy81d2lIVEFUbUNoUGdDbVB4clgyUE51MElPZnhiVnhMN0V2RXRQM0VlK1Mr?=
 =?utf-8?B?RTRoeU9UL1dLcEZzbU00Y04wZWxwbHZWZG1iTWVUSHRuZmtaVFk5cHB1U0Zv?=
 =?utf-8?B?cVBiS3BNYU1qWHNyQm51WlBnTFAva0hSRzJqZ0RWdld5Umsrc1F5MmNsWUNH?=
 =?utf-8?B?c1gzMnE4bG9IdklDcWdYQzdtMDFXYWJlVW1TanE1RUU2dTZjckRpNmFRQ1do?=
 =?utf-8?B?TENHOTZGZVQyaFBOdXJJSGhReXdaTnAvUVRQQWtmL01DbU5BTWgzYUxMMG5D?=
 =?utf-8?B?M1JkYWJVNjFwWjdLNW5hWTJDY3lSeEhqSUVVNm10TCs4NEg0T0U0MklDZ0h0?=
 =?utf-8?B?di9KN1JKNjl0bzlTaS9NV2twU0xEdWdHa2YydXFQM2ltRjU2U1hoblhwSHdJ?=
 =?utf-8?B?dUIyeExMdExHdHVONDRDMFg5TU9PTzQwL2orUENsa1RvR2tkNlJqb2dGVHk1?=
 =?utf-8?B?REZ5SThHdFdhaEtNRnR1SzNVS1lmNkZKRk1CZml4aWRSZlZEaUNBaHhqaldI?=
 =?utf-8?B?aVR0K2tiT1dWcGd4c1F5SG1pMGk4NmxiM2hVdG5qdEdXaW5ad2FZb2RHK0Rj?=
 =?utf-8?B?QUxlSzZaZERVN1AvL0xGSHZoMjh3WStYSXF3OVYwVEZ4WkQrVnJPYmpKekhR?=
 =?utf-8?B?SytRUjVISUFFUEs3dGJrSUpSK2g4SlBPTnZrNXZncjhHSnFiMEJWdnlzUzZD?=
 =?utf-8?B?dHFLQVJHc0Q2MFFBNTZGSmQ2bVkxU0NOTGhEb1JoeFZIbnJZeHNJR3dyYWtC?=
 =?utf-8?B?c1lIYzVGa2g3Ky9oZ3VRTHFVeVJRN0t6dFVucHUvM01zTzczWElhQkJma0tC?=
 =?utf-8?B?RktjdmVMejRWN25tV3FtN09sT3lDeWRXRkROa2RZeXVRd0dJVlI3V0JZZE0y?=
 =?utf-8?B?cVhpejFvMlhiK29rTnIzeWY5RzJUSE1rYTBweHlsdkJIOEVlYlNDMTJGOEdC?=
 =?utf-8?B?OExwNVVCK3JSL0F1L0w5amJUS01SR3hTdzNkOTZVK3FwOXdYYUc2ZDE2T2Zy?=
 =?utf-8?B?NmUvK2V6Ryt1QVRxcFY4NnA3enhuajZJNG9ubmVkNG9zV1B5NENGaDR5UVRU?=
 =?utf-8?B?WStRTWNlSStOU29iVndPSm9Oa0pzQTIzMGUxanN4TnljTEJPc0JaNzRMSDVM?=
 =?utf-8?B?SEl5ek5yRnF5aEJLTXp2TGxtYmRvZHVTdkZxMCtiNzlzVFNoekVEK2ZDdzg4?=
 =?utf-8?B?NmMrOGNOMXhnc0x3V0t1Qjd4UzlkcG54dkZMajJFVzNSWUZEUTRjZ01qanl2?=
 =?utf-8?B?QzZ0NnJJQjRsWTQzSmQ4TWRDVEdWVzRGUGxldTBKcTc1cU9RYUQ0RFNxVkFo?=
 =?utf-8?B?Y3JtZkNOK0x3U0dpQ0VLRUNqNlRsOE03cFJhdXVnN0pFcndTMVFYS0lRdVZj?=
 =?utf-8?B?b1dKdytZaXZWYU42KzJrV243eExSWXorMmpwNmRFMkJiKzlZNjBEVHpHWHJt?=
 =?utf-8?B?Y0lTOFpGSUhrajNmVTlNWDl2SDgzOG9QTTlqcFdWUEFDUHpiNkZ2UGh3OGRv?=
 =?utf-8?B?MWRBT01nSHhmWEVUYjVFVWpBT1Bka3hjdllVUnN6NlNSUnZTUG5YMDZSV0hL?=
 =?utf-8?B?WG5hclRGbUZKdVU0OWc4YTZuRWVJQmtvNmUwMUVoekpPbWhoZlhUdjZDWjhO?=
 =?utf-8?B?ZTZMdjYwOUxLb0ZSaXNoMDEwQjMwdFcwM3NTaWc2UUt6QklBcHN5TXo3a0pj?=
 =?utf-8?B?Q0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CDA06AC001DCAA4F9CF20AC8626AF227@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5808.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d4c1290-d125-4e10-b521-08ddd343fa65
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2025 10:45:07.3156
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +zHbSrXKxLAwJGCrMshRU59ECKwHvIiKViQUf32QbHk87IV+ekENtX5wwILfTTSWFc4DWa5lgv8hV9dhc/0+hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR03MB9360

T24gTW9uLCAyMDI1LTA4LTA0IGF0IDExOjExICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAwNC8wOC8yNSAxMToxMCwgSHVheXUgWm9u
ZyAo57q15Y2O5a6HKSBoYSBzY3JpdHRvOg0KPiA+IE9uIE1vbiwgMjAyNS0wOC0wNCBhdCAxMDoy
NyArMDIwMCwgQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8NCj4gPiB3cm90ZToNCj4gPiA+IEV4
dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1l
bnRzDQo+ID4gPiB1bnRpbA0KPiA+ID4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0
aGUgY29udGVudC4NCj4gPiA+IA0KPiA+ID4gDQo+ID4gPiBJbCAyOS8wNy8yNSAwNDozMSwgSHVh
eXUgWm9uZyBoYSBzY3JpdHRvOg0KPiA+ID4gPiBBZGQgdGhlIGNvbXBhdGlibGUgZm9yIG10ODE4
OSBTQ1AgdG8gdGhlIGJpbmRpbmcuDQo+ID4gPiA+IA0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBI
dWF5dSBab25nIDxodWF5dS56b25nQG1lZGlhdGVrLmNvbT4NCj4gPiA+IA0KPiA+ID4gSXMgTVQ4
MTg5J3MgU0NQIHJlYWxseSBzaW5nbGUtY29yZT8NCj4gPiA+IA0KPiA+ID4gQWxsIG9mIHRoZSBu
ZXcgU29DcyBoYXZlIHR3byBTQ1AgY29yZXMgLSBpdCdzIGEgYml0IHN0cmFuZ2UgdG8NCj4gPiA+
IHNlZQ0KPiA+ID4gdGhhdCA4MTg5IGhhcw0KPiA+ID4gb25seSBvbmUuLi4gaGVuY2UsIHBsZWFz
ZSB0cmlwbGUgY2hlY2sgYW5kIGNvbmZpcm0uDQo+ID4gPiANCj4gPiA+IENoZWVycywNCj4gPiA+
IEFuZ2Vsbw0KPiA+ID4gDQo+ID4gDQo+ID4geWVzLiBPbiB0aGUgODE4OSBwbGF0Zm9ybSwgdGhl
IGFyY2hpdGVjdHVyZSBkZXNpZ24gb2YgU0NQIGlzIGENCj4gPiBzaW5nbGUNCj4gPiBjb3JlLg0K
PiA+IA0KPiANCj4gQnkgaGFyZHdhcmUsIG9yIGJlY2F1c2UgdGhlIGZpcm13YXJlIHVzZXMgb25s
eSBvbmUgY29yZT8NCj4gDQo+IEknbSBhc2tpbmcgYWdhaW4gYmVjYXVzZSB0aGlzIGhhcHBlbmVk
IG11bHRpcGxlIHRpbWVzIC0gd2l0aCBNVDgxOTUNCj4gYW5kIE1UODE4OC4NCj4gDQo+IElmIHRo
aXMgaXMgYnkgaGFyZHdhcmU6DQo+IA0KPiBSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBE
ZWwgUmVnbm8gPA0KPiBhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+
IA0KPiANCg0KTVQ4MTg5IFNDUCBoYXJkd2FyZSBoYXMgb25seSBvbiBjb3JlLCBub3QgU1cgZGV0
ZXJtaW5hdGUuDQoNCk9uIGJvdGggTVQ4MTg4IGFuZCBNVDgxOTUgU0NQIHBsYXRmb3JtLCB0aGV5
IGhhdmUgdHdvIGNvcmVzLiBCdXQgdGhlcmUNCmFyZSBmZXdlciBmZWF0dXJlcyBydW5uaW5nIG9u
IHRoZSA4MTg5IFNDUCwgc28gaXRzIGhhcmR3YXJlIGlzIGRlc2lnbmVkDQp3aXRoIGp1c3Qgb25l
IGNvcmUuDQoNClRoYW5rcy4NCg0KDQoNCg==
