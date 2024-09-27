Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF4D79CD;
	Fri, 27 Sep 2024 02:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727405519; cv=fail; b=tkLHeVBEqWyoI+/N760KNqUUJaMjNJcuPrudI97kkD9qd0eRb02tXx+Vb2cLpyxO4C/1QUvv1Dx0CmYGFb7wCfC9XVnkIphzwqm13g4xDhxv+3YAOARNuzj1FiQjoWpPQoqZcu8LMmOyluf6XNr60qj28uV8XbqJ7PBhdRzjDW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727405519; c=relaxed/simple;
	bh=05jG7Dv4yvZiyH0otfjBpvrOw0xzt5FLaPDtoJbBFPo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RIlTCbWLLumo18CrWYfOqrdYvGXsnFYGsHl+lYgzLLGz5rpQwiwnfm8iSnnv+FKaftfdUnpyHUSTNaGs/XEnvDEV3isSa6YpGxd3P2UleE/iBaCKDeQ8AiJWA4/ynf77GaZWcKGBNrgU9ic0fab+qBVZMh38hNSfQ3UH83a2V4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Vm+sCnMW; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=FHw+/5Tc; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Vm+sCnMW";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="FHw+/5Tc"
X-UUID: 70e2fa147c7b11efb66947d174671e26-20240927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=05jG7Dv4yvZiyH0otfjBpvrOw0xzt5FLaPDtoJbBFPo=;
	b=Vm+sCnMWC9kEOinAZt0fjk2dUWKLAhFC4kiGISYwdoWS1cKazEB//Xk7CgNu7M52L9GJxaqNi2/Ac5cQvx9nPVeZS9ht3AzOyPXKw6uukP85iesMJYQ1NIdNMiZAX4xQsSVaM2WaAZylrG4LQnI/D2XWCE+Fh8mHwAL296iupUk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:71961d23-3052-46f6-80b5-1ab2e83509dd,IP:0,U
	RL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-20
X-CID-META: VersionHash:6dc6a47,CLOUDID:375aa39e-8e9a-4ac1-b510-390a86b53c0a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 70e2fa147c7b11efb66947d174671e26-20240927
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <mark-pk.tsai@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 833057365; Fri, 27 Sep 2024 10:51:48 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 27 Sep 2024 10:51:43 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 27 Sep 2024 10:51:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MJOTXUWHNOSZT5UOQGpjUEsWltZcNhuy3yuSxpKvEWVmvg2amH5E+h/KfsJLvHvrkEUU78LDsSnA+MeODuOrNKFKKS31eqDKaH7+VN92WZtcfb/JMQnDSID9zFyVqQr8t2q//fBreqvyRhXR88loBPbyLp66nX+FcpcgQF65RToJLYPMKS3068nEsMKJxpsYt+8eb+gobVeDfBbYDB4+RvqOwUE8V1eq0UcMQrgT1xo+lgdG0AYejvd3dwk8hVACIoFr5JcTx7Hnfct6kjVBiDyFck5mjoPTofqBZEMc+929ThtlBkZRq0MILOH4GMZVfC8YmMEmw2topZSztJRbDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05jG7Dv4yvZiyH0otfjBpvrOw0xzt5FLaPDtoJbBFPo=;
 b=JLwuuAOtR/XGLbj9BCfR1aEnpWlQh4dWuX+7qlt+jXXe0nfjUoxL8D+dBVrCAF7/YAMEY7wX+T2xVbDXuCk02mDGtxn0yu70WEQWFANMLrOMywvZX/KvY5ZJOolvzeVO3Fl3mvE3P7d98Pd/yZXggGf3AbfhnkC0y0d00zqzKXjAl1QODZGDAuiYNHHoBwAw+6HB6n8MHlT7misOzHaiX3IntUO692nEzBYmfmeJ/fUp/yLFPcdthanDb4LJ3WmjcS7WUJEBUiHZ2q7fVwgC3o3VOD3JmNpAv53iDwQi47JxtOh48qOyLB+AdUiA2qhUPJhdCox7zQWNwocnWl1/qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05jG7Dv4yvZiyH0otfjBpvrOw0xzt5FLaPDtoJbBFPo=;
 b=FHw+/5TcUlzIG4yH1UrWkVHiOBrt3gy232FqxDUQGqBpeE83m9H74/KnwafokAuQ8OPS2odWyTvSfdd7+InA0WRcyRcyShhkzMSjfGeuk3VIryJfrO5hMFlD/k03QiXCagKjqFGlrStxWLwJt9w99qzWrT7s99HDwDoi2WEIlsU=
Received: from KL1PR03MB7648.apcprd03.prod.outlook.com (2603:1096:820:e1::7)
 by TYZPR03MB8586.apcprd03.prod.outlook.com (2603:1096:405:af::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Fri, 27 Sep
 2024 02:51:40 +0000
Received: from KL1PR03MB7648.apcprd03.prod.outlook.com
 ([fe80::316:e06c:7211:1396]) by KL1PR03MB7648.apcprd03.prod.outlook.com
 ([fe80::316:e06c:7211:1396%5]) with mapi id 15.20.8005.017; Fri, 27 Sep 2024
 02:51:38 +0000
From: =?utf-8?B?TWFyay1QSyBUc2FpICjolKHmspvliZsp?= <Mark-PK.Tsai@mediatek.com>
To: "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "andersson@kernel.org"
	<andersson@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	=?utf-8?B?SlkgSG8gKOS9lemnv+W9pSk=?= <JY.Ho@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?WUogQ2hpYW5nICjmsZ/oi7HmnbAp?= <yj.chiang@mediatek.com>
Subject: Re: [PATCH] remoteproc: virtio: Add synchronize_cbs to
 remoteproc_virtio
Thread-Topic: [PATCH] remoteproc: virtio: Add synchronize_cbs to
 remoteproc_virtio
Thread-Index: AQHbCz3fZgUCFE6m5EOZ0YFVNTeNjrJq+duA
Date: Fri, 27 Sep 2024 02:51:38 +0000
Message-ID: <109aa022a017648be7b1c583ec21af74d8a23dc7.camel@mediatek.com>
References: <20240920091659.3933-1-mark-pk.tsai@mediatek.com>
In-Reply-To: <20240920091659.3933-1-mark-pk.tsai@mediatek.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB7648:EE_|TYZPR03MB8586:EE_
x-ms-office365-filtering-correlation-id: 937a9fb3-9ebb-46b7-48d9-08dcde9f4f22
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TVZab0hzSGNDWEJSaURRYjBSK055UXNDVXZNQlFseExoM0kwY0g5V0ZTUWJu?=
 =?utf-8?B?UmZ5WWlOdXNPdjR4SWZMRlVUT2xraUZPM2xSTjR6Z2VHWWxEbmRuMWNHb2Jj?=
 =?utf-8?B?ZTNJM2xLQ01mQ0VlVnBNQkE0OGE3WmFFcjFTbENta2dDWUNHNUtIMzhRalhH?=
 =?utf-8?B?QzQ1dlBWaVJQZXpZUnI3clBleDhEcnRPSlNXVVZvUzlrNjFqWXdobDFPWGti?=
 =?utf-8?B?RGZ1bUFUNklnVTdCRmxvbFBKQklFdUhLSkR5RWNUNndLYWVZVjZ6NExpT1dH?=
 =?utf-8?B?UmZ2MFE2MGxrU1c0Tkpmamx6bGlZdFJGMHcvNzd2MGNVdzJXdjFON2RKWXZ2?=
 =?utf-8?B?Z2tTeDBvZUQ4bVpBejNia3hHNjllRWJocEFxZVl2ZVh6anJFemw5VUZLcXJ0?=
 =?utf-8?B?bUk4Zm5sVU5PbzFxSVJwT0I4c05BVGsyZDVSbzNoZmRFRDVXY1dTL0h2MVAy?=
 =?utf-8?B?ZE5pcnc2ZWdZNUQxRnJOdjRET21CNTAxc1FBVHQ4TEtJTXVwVmJvQnJ3V3FL?=
 =?utf-8?B?M3VoVStUOHAzakZObDdNdFI1Z3ZGTElxa2tlTjIyRWNjaXhJV0dNMXRrWlV5?=
 =?utf-8?B?ZWhSYVpXSThETm1FV05sZ0RISEozZlZCTGtrV3VCdkNBazdWMllXMzg2OWdY?=
 =?utf-8?B?VWFXZXFoZmdpOVNzWVRXeDlZRXMxZS90QUtnanlzNkZhNUFrbzZleWxQbGpz?=
 =?utf-8?B?ZXFRZnFJMWxYWnFZNjcwWUgyZWRGQmxWVTY5UGVYTjl2K25XZElKaVhUcmdv?=
 =?utf-8?B?R2ZZLy9xOStxV1czZ0dIaFQ5Ky8xOTJocDVadTdsRlBtOENZVDVobzdtai9m?=
 =?utf-8?B?TTdOT0VVM0JKbG1mODNGcnV4aG4zUVNSYzJ2V3RRa1FZNkZkeXNqQ3hNUGRl?=
 =?utf-8?B?YzJDMytpNUlSWkc1VytIblFBSUh5M2IwMkM4MS9lSW5PZnF0SkpYZTRSRk9Z?=
 =?utf-8?B?WnNXVzh3N29RZ2hVT1FFTjFHbmZOTHdoSzBwYmpOWFduYXFwNGdlbWloclRu?=
 =?utf-8?B?WVRoWVFPZFhNMi9BdDlqU0M1VnJjd0sydlo2WmIyYklFT09OZDRBOTg2RWhT?=
 =?utf-8?B?Sy8zL1hzMTlRNldRZmNyOCtLTEk3cVBHT3VUZWVsWE5rQmcyQkthZWNveSs3?=
 =?utf-8?B?djRqMjVLbDJmRlg5cFRlQUkvT1NCenl2UlA3NE5SZDUyNi9iSXRQS2pmcUdq?=
 =?utf-8?B?QkpRRTVEdHNjMWZGdWcrbzVCQ0VZVCtJWjFjZm8vMUk3MmxoMjFybTZFQTVY?=
 =?utf-8?B?dnhoY3VxcTJ4ckNienJOZHlKTmk0aldyUXpCT0FHN05oZUtNdkFUVytFVk93?=
 =?utf-8?B?U2k5QlZnbXlNcHpWOVFzZ1ZydkpqcUdwMHBMNEhvN3FtMGF3RDYzZ1hjZjMw?=
 =?utf-8?B?dlppTnExcUxyNGFhOEh0VThPWWd1T0NSRHBSalhBT1gwNEpkcElkNzJSVWpZ?=
 =?utf-8?B?eTFXcGR2dWluYldhVjhIWmdXNWE1emNFL3NVdW5oazZpQnphN0NSTENoYWZ2?=
 =?utf-8?B?V2VteHJ6NnRsem1RWFJZOWJlRjJLd21URm5ibXhUUnBKdjJ1RkpwSFZKWXFM?=
 =?utf-8?B?S1NmeFdRdjJ2OTdzUnZoYjQ3NWZTenF1UlpZaWQ5MkJqN2RKTWEzbTJwSWtr?=
 =?utf-8?B?YW1VUSt2WnZQMXh2SmJ5QW1yYWhOc3RhS0JRZXJmWDRTejhTaEZuU044cDVB?=
 =?utf-8?B?a0hXbVFnd0JZUk5HdUk2SmdDYVU0U3hIYkxHbTVLWHh4blRpcTNPZmhYOXVB?=
 =?utf-8?B?TFkzLzlVT05OalMzeE56a01zd1lYSFhwRUVsSXlxenRmV1NreGE2d1hkWTc0?=
 =?utf-8?B?OHZEV1YwdHFxbTdNRmx1UT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7648.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q1lyL1JYcE51RDcxL0NSakxwMjJNcytBOG1YRDA2U2k0MzkrMVhSbHpKbXZW?=
 =?utf-8?B?eEhPd0FiaWk0THhYWHhjSVdFbERNUXRhUVh1OFQ0WWFGb2Y4MkR2Qjl1S0ZT?=
 =?utf-8?B?d0hrSVM0U0ZROVNjZWFKZXIzdGczUWRYZkhOaWdMVnZLamgrMENXVVp2bWNa?=
 =?utf-8?B?M0RvWE5yVTFCTExQV1NDdmoxZ2gxQ3poV2xqN28xdytheVRkc3dpeWhCUXRh?=
 =?utf-8?B?bE1BQU44MTBxUTcwalo4ZGtXdHM3bU0vL21veVJGbm0xcnVPUjZlTElpaWFx?=
 =?utf-8?B?Skx4TnFSOGN5WVBnR2Q0SG1obFNsekhqcWlsQndqOHBoMU1qaHZVWGVtb3Zq?=
 =?utf-8?B?OTFjTlhpaC9HY1lrY1RhV3V3am9GdjhtRGJNQ1FsVmJDbTZrMjQxbVhSTzNu?=
 =?utf-8?B?WXJ1RldsMUFZUkswWW1ET3Q5VGpYYzNOd2NGM2cxUHRNaUJuRXorZGhDRWNJ?=
 =?utf-8?B?NWR5QVdJY3BHYllIWkFSQzNZS3BlcDEvZ0lNRk96L1RJRFdsMElCU21Ya0Ft?=
 =?utf-8?B?RS8vR21GNHhjOWRnOWRaQUpwY2FiR0JLSlBhdGVKaFFDU3ZFcWpQUVdtUHpG?=
 =?utf-8?B?NEtVd3lnMkw5cnRUTXlDY2ZBMXN0NEFpZ1NTQkVlMVJsRTV1Szc5Z2VXUmN6?=
 =?utf-8?B?dGxwY2RiMkFKZ2NuRUF0TGFlR0ZtOFJDY1dCUTlFS1VxS24yYUxpRGdhbXd0?=
 =?utf-8?B?NTdOMlNLK2ZWcVF2eHpab3FnS3VBVGRpUmEwQWdWdWdXb3g0bDRMQTdMOEdK?=
 =?utf-8?B?elFwN2tYNVIrenJhQlhLTUJ2ZSs1bXgrcFpZMzI4UmE2R0ZSay9ZMi9YSGs3?=
 =?utf-8?B?S1JOcXBEamE0ZmFTODNvNlF5V1llTlN1Zm1GRVRZTVNkdlNETlM3bjdIY2I5?=
 =?utf-8?B?TzBQc2crYmtiY0crODR3NW13eEk3N3hBZy8vTU8rbXVaeERqTnFBckdJUXVN?=
 =?utf-8?B?UXhUc1ZBOVc4REw3Qk9jMVJ0U1pNOGdyMnJ1VVh6R2FBdGJxSS9BRjBvUlVq?=
 =?utf-8?B?TFVpcEovQ1BaZm5rZlV5cEV2SWR2OUkrMm1tLzIvb2tvOWlUdk96N1kwWldt?=
 =?utf-8?B?OWdOWnBJUlBWbGNGWTIwaUNpNTJnb3Y1b2x5NXZyL0ZnVFZzQWx0aFIxYUxK?=
 =?utf-8?B?a3BiKzZiMXhZMUxMTkc2L3gwVWJkSkVmN0g5N1VDa2VOSDk4VW01eDNDVHhZ?=
 =?utf-8?B?c0pjUEVnRW01TGlEREVTeWhBZzZwZGpqdXRXb3BMdzZnZ2JvdkFxT3h5TEVu?=
 =?utf-8?B?aUt5L1g3a2xjRlNpTGpqZEdrNlZ5WDJ2SEVybERrSmxkRG5ROXZwazAwdjVx?=
 =?utf-8?B?dEZCL3Zha3V0VzE4T3JvVjJpOHIrdzJFV2xlVEpKZERsVEtVcmZUSmo5Qm5w?=
 =?utf-8?B?NkNJYys0NDBBdU1TekJnbXBHMGloTUg0OEN5b2NuNzFKbk1ibEdKb2swOHNH?=
 =?utf-8?B?NDI2a2E2NjBIR3ROOVhtWGN1ZllteERUSU9RcllWaWs3VmlqYWxmYXZiV1cy?=
 =?utf-8?B?Tm5kM1VWM3RRNFBrMzRKUWphdCticFBoRmxFUnNLK3p5RHNNcTZwT2VZT3kz?=
 =?utf-8?B?WjVnbldpL09rTUpFTmFNalkxQ1ZqUklsYzNnVFhtVTgwWnJtVUUrRTk1MU4r?=
 =?utf-8?B?NURFMitaSm5KTFBkZlp1Y1ZhbFlQakdYSXVYa0lhSzNtdDM3b3pDZzh2TVlS?=
 =?utf-8?B?cFJXSjdjRGNaZWtHWEQ4SDNzWWNTODl6eVVDTC92dzlzZXdHYTN5TjdtUnRX?=
 =?utf-8?B?YnJ3aGNCci9OQ01naVFXTlVHcHNkQ2hiejZXOEVYbDVnd1ZLQU42alhYVUh0?=
 =?utf-8?B?SzNvUUFjQWRhbHFraEZKM3dxVXluU09oVkt3anNDUDNrOFFObVpva1JkUWlq?=
 =?utf-8?B?dGJDWlZvanRqeDdKWmg2TUx0UWl3RVpLSFd1WnZTOFBaZldQR1pPTzRsNEtY?=
 =?utf-8?B?SWNSdUFjMTBNRWo1UmJJbDNtMWpMT28wTjZLOUE0aVVMWlI0WFdzNUxhdHph?=
 =?utf-8?B?dW1TTmZ6Y2Myd3VGWCtuZXJqYm5FNG9YNitQeVFsb2JDZEVnWjgrNWtNUHV1?=
 =?utf-8?B?M3lqWEJUNm84VEg0cnpjakovb0d2VXBIeGE0RkxGYmZHR2ZFZW1ZV2VpZ1B0?=
 =?utf-8?B?ZHdNNGdwOU5mcytqNEozYjYvRnVUUVJ5Q2s3bXV0UDdyMXlRTkdzM1hzZ0Q5?=
 =?utf-8?B?VUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C7318D8ABC228A4F992663BBB09BAE14@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7648.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 937a9fb3-9ebb-46b7-48d9-08dcde9f4f22
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2024 02:51:38.8428
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Csjlr9gklftqRkitPYMn85ZG76D2geP2XICvwr2LuDktnv/e/B2jymFCY6VOs4FRc+YvKNpc1GPWeDolOUSLEoTPf7p39EdCn87BsvtuiY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8586
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.493600-8.000000
X-TMASE-MatchedRID: 2SDSohiwfqTUL3YCMmnG4mZUc2jtcaSdXs5nqGvDCfP7efdnqtsaE1mE
	vDqzEeg3SkMMeZO0mFnxKVCKs1uu4lhdPEiZHlm8dXu122+iJtppMVzYdfhGYTFidTBRWb28WTF
	H84r4cDRFyFgjtCcl4PNeqd2VNJ3hKc+6Aaw3enkc9jA4mLo8uU/ZEi+0sAdYDXHJBD8X89j/VD
	kfYPImrhNMUfQy/C01uQrgQ+Mbukum808RnCX1auor0PKDup1CQPCPzycuBFNGL0g1nVmkYXB44
	IkzjfYyThbvLLI8RvOxFD3LjEoRDdbvIKq9pLNFyeVujmXuYYUs9yCYjUR6SxAfwLHOKGmBm2M9
	I54EAiXu6InfDVPRQIYj9NPA4+LIQv21zJNl0CyDGx/OQ1GV8tp/U3XwL5kCF70JBot7Y8+OhzO
	a6g8KrWZ3Z79w4GfpWYQji0deggNcsFe9jRSumY2R3mSp5vE1F/hcCZ7yQ+7JEvCPnHItjqrp16
	VsQf7WUk4S1RSUGJBYp3LO+3lv7nOWjFC52UVP9edTJzeSS9vi65ijgz6k6GCGLFiGs7u/iKJKI
	7cVvfOUTGVAhB5EbQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.493600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	B8735659C96AA34F8B7404344C0E693C1531B9BA77201D70F7C6871F6A0BC28C2000:8
X-MTK: N

SGksDQoNCkNvdWxkIHNvbWVvbmUgaGVscCB0byByZXZpZXcgaXQgb3IgcHJvdmlkZSBzdWdnZXN0
aW9ucz8NCkFueSBjb21tZW50cyBhcmUgd2VsY29tZS4NCg0KVGhpcyBwYXRjaCBpcyBpbnRlbmRl
ZCB0byBhbGxvdyB0aGUgcnByb2MgZHJpdmVyIHRvIGhhbmRsZSB0aGUNCmZvbGxvd2luZyB1c2Ut
YWZ0ZXItZnJlZSBpc3N1ZToNCg0KDQojIyMgVUFGIGxvZw0KWyAgMzM3LjU0MDI3NV1bICBUNDcw
XSAgdmlydHF1ZXVlX2FkZC5sbHZtLjEwMTUzNDYyMjg0NDI0OTg0NjMyKzB4YjQ4LzANCnhjYzQN
ClsgIDMzNy41NDY5NjldWyAgVDQ3MF0gIHZpcnRxdWV1ZV9hZGRfaW5idWYrMHg0NC8weDZjICAg
ICAgICAgICAgICAgIA0KPC0tLSB2cXMgYXJlIGZyZWVkIGluIHZyaW5nX2RlbF92aXJ0cXVldWUN
ClsgIDMzNy41NTE3NTVdWyAgVDQ3MF0gIHJwbXNnX3JlY3ZfZG9uZSsweDFmYy8weDJjNCBbdmly
dGlvX3JwbXNnX2J1c10NClsgIDMzNy41NTgwMjNdWyAgVDQ3MF0gIHZyaW5nX2ludGVycnVwdCsw
eGEwLzB4ZTANClsgIDMzNy41NjI0NjJdWyAgVDQ3MF0gIHJwcm9jX3ZxX2ludGVycnVwdCsweDM0
LzB4NDgNClsgIDMzNy41NjcxNjBdWyAgVDQ3MF0gIGhhbmRsZV9ldmVudCsweDI4LzB4NDggW210
a19wcXVfcnByb2NdDQpbICAzMzcuNTcyNzQyXVsgIFQ0NzBdICBpcnFfdGhyZWFkX2ZuKzB4NGMv
MHhjYw0KWyAgMzM3LjU3NzAwOV1bICBUNDcwXSAgaXJxX3RocmVhZCsweDFkMC8weDM2MA0KWyAg
MzM3LjU4MTE4OV1bICBUNDcwXSAga3RocmVhZCsweDE2OC8weDFjYw0KWyAgMzM3LjU4NTEwN11b
ICBUNDcwXSAgcmV0X2Zyb21fZm9yaysweDEwLzB4MjANCg0KIyMjIHN0YWNrIHRyYWNlIG9mIG9i
aiBmcmVlDQpbICAzMzkuMjUzMDYzXVsgIFQ0NzBdIGRpZV9oZWxwZXI6ICAgICAgIDwtDQp2cmlu
Z19kZWxfdmlydHF1ZXVlKzB4MTZjLzB4MTk4DQpbICAzMzkuMjU5NzU3XVsgIFQ0NzBdIGRpZV9o
ZWxwZXI6ICAgICAgIDwtIGtmcmVlKzB4Mjc0LzB4MzVjDQpbICAzMzkuMjY1MjM2XVsgIFQ0NzBd
IGRpZV9oZWxwZXI6ICAgICAgIDwtDQp2cmluZ19kZWxfdmlydHF1ZXVlKzB4MTZjLzB4MTk4DQpb
ICAzMzkuMjcxOTI5XVsgIFQ0NzBdIGRpZV9oZWxwZXI6ICAgICAgIDwtDQpycHJvY192aXJ0aW9f
ZGVsX3ZxcysweDNjLzB4NTgNClsgIDMzOS4yNzg1MzVdWyAgVDQ3MF0gZGllX2hlbHBlcjogICAg
ICAgPC0gcnBtc2dfcmVtb3ZlKzB4OGMvMHgxMmMNClt2aXJ0aW9fcnBtc2dfYnVzXQ0KWyAgMzM5
LjI4NjE4OV1bICBUNDcwXSBkaWVfaGVscGVyOiAgICAgICA8LQ0KdmlydGlvX2Rldl9yZW1vdmUr
MHg2NC8weDE3NA0KWyAgMzM5LjI5MjYyMl1bICBUNDcwXSBkaWVfaGVscGVyOiAgICAgICA8LQ0K
ZGV2aWNlX3JlbGVhc2VfZHJpdmVyX2ludGVybmFsKzB4MWE4LzB4MzJjDQpbICAzMzkuMzAwMjcw
XVsgIFQ0NzBdIGRpZV9oZWxwZXI6ICAgICAgIDwtDQpidXNfcmVtb3ZlX2RldmljZSsweDEzMC8w
eDE2MA0KWyAgMzM5LjMwNjc4OV1bICBUNDcwXSBkaWVfaGVscGVyOiAgICAgICA8LSBkZXZpY2Vf
ZGVsKzB4MjI0LzB4NTE4DQpbICAzMzkuMzEyNzAyXVsgIFQ0NzBdIGRpZV9oZWxwZXI6ICAgICAg
IDwtIGRldmljZV91bnJlZ2lzdGVyKzB4MjAvMHgzYw0KWyAgMzM5LjMxOTA0N11bICBUNDcwXSBk
aWVfaGVscGVyOiAgICAgICA8LQ0KcnByb2NfcmVtb3ZlX3ZpcnRpb19kZXYrMHgyMC8weDQ0DQpb
ICAzMzkuMzI1OTEzXVsgIFQ0NzBdIGRpZV9oZWxwZXI6ICAgICAgIDwtDQpkZXZpY2VfZm9yX2Vh
Y2hfY2hpbGQrMHg4NC8weDEwMA0KWyAgMzM5LjMzMjY5Nl1bICBUNDcwXSBkaWVfaGVscGVyOiAg
ICAgICA8LQ0KcnByb2NfdmRldl9kb19zdG9wKzB4MzAvMHg1Yw0KWyAgMzM5LjMzOTEzMF1bICBU
NDcwXSBkaWVfaGVscGVyOiAgICAgICA8LSBycHJvY19zdG9wKzB4Y2MvMHgyMDANCg0KT24gRnJp
LCAyMDI0LTA5LTIwIGF0IDE3OjE2ICswODAwLCBNYXJrLVBLIFRzYWkgd3JvdGU6DQo+IEFkZCBz
eW5jaG9ybml6ZV9jYnMgdG8gcnByb2NfdmlydGlvX2NvbmZpZ19vcHMgYW5kIGENCj4gc3luY2hy
b25pemVfdnFzIGNhbGxiYWNrIHRvIHRoZSBycHJvY19vcHMgdG8gZW5zdXJlIHZxcycNCj4gc3Rh
dGUgY2hhbmdlcyBhcmUgdmlzaWJsZSBpbiB2cmluZ19pbnRlcnJ1cHRzIHdoZW4gdGhlIHZxIGlz
DQo+IGJyb2tlbiBvciByZW1vdmVkLg0KPiANCj4gQW5kIHdoZW4gVklSVElPX0hBUkRFTl9OT1RJ
RklDQVRJT04gaXMgbm90IHNldCwgY2FsbA0KPiBycHJvY192aXJ0aW9fc3luY2hyb25pemVfY2Jz
IGRpcmVjdGx5IGluIF9fcnByb2NfdmlydGlvX2RlbF92cXMNCj4gYmVmb3JlIHZpcnRxdWV1ZSBp
cyBmcmVlIHRvIGVuc3VyZSB0aGF0IHJwcm9jX3ZxX2ludGVycnVwdCBpcw0KPiBhd2FyZSBvZiB0
aGUgdmlydHF1ZXVlIHJlbW92YWwuDQo+IA0KPiBUaGUgc3luY2hyb25pemVkX3ZxcyBpcyBleHBl
Y3RlZCB0byBiZSBpbXBsZW1lbnRlZCBpbiBycHJvYw0KPiBkcml2ZXIgdG8gZW5zdXJlIHRoYXQg
YWxsIHByZXZpb3VzIHZyaW5nX2ludGVycnVwdHMgYXJlIGhhbmRsZWQNCj4gYmVmb3JlIHRoZSB2
cXMgYXJlIG1hcmtlZCBhcyBicm9rZW4gb3IgcmVtb3ZlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IE1hcmstUEsgVHNhaSA8bWFyay1way50c2FpQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQo+ICBkcml2
ZXJzL3JlbW90ZXByb2MvcmVtb3RlcHJvY192aXJ0aW8uYyB8IDEyICsrKysrKysrKysrKw0KPiAg
aW5jbHVkZS9saW51eC9yZW1vdGVwcm9jLmggICAgICAgICAgICAgfCAgNCArKysrDQo+ICAyIGZp
bGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3JlbW90ZXByb2MvcmVtb3RlcHJvY192aXJ0aW8uYw0KPiBiL2RyaXZlcnMvcmVtb3RlcHJvYy9y
ZW1vdGVwcm9jX3ZpcnRpby5jDQo+IGluZGV4IGQzZjM5MDA5YjI4ZS4uZTE4MjU4YjY5ODUxIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL3JlbW90ZXByb2MvcmVtb3RlcHJvY192aXJ0aW8uYw0KPiAr
KysgYi9kcml2ZXJzL3JlbW90ZXByb2MvcmVtb3RlcHJvY192aXJ0aW8uYw0KPiBAQCAtNzQsNiAr
NzQsMTQgQEAgc3RhdGljIGJvb2wgcnByb2NfdmlydGlvX25vdGlmeShzdHJ1Y3QgdmlydHF1ZXVl
DQo+ICp2cSkNCj4gIAlyZXR1cm4gdHJ1ZTsNCj4gIH0NCj4gIA0KPiArc3RhdGljIHZvaWQgcnBy
b2NfdmlydGlvX3N5bmNocm9uaXplX2NicyhzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldikNCj4g
K3sNCj4gKwlzdHJ1Y3QgcnByb2MgKnJwcm9jID0gdmRldl90b19ycHJvYyh2ZGV2KTsNCj4gKw0K
PiArCWlmIChycHJvYy0+b3BzLT5zeW5jaHJvbml6ZV92cXMpDQo+ICsJCXJwcm9jLT5vcHMtPnN5
bmNocm9uaXplX3ZxcyhycHJvYyk7DQo+ICt9DQo+ICsNCj4gIC8qKg0KPiAgICogcnByb2NfdnFf
aW50ZXJydXB0KCkgLSB0ZWxsIHJlbW90ZXByb2MgdGhhdCBhIHZpcnRxdWV1ZSBpcw0KPiBpbnRl
cnJ1cHRlZA0KPiAgICogQHJwcm9jOiBoYW5kbGUgdG8gdGhlIHJlbW90ZSBwcm9jZXNzb3INCj4g
QEAgLTE3MSw2ICsxNzksOSBAQCBzdGF0aWMgdm9pZCBfX3Jwcm9jX3ZpcnRpb19kZWxfdnFzKHN0
cnVjdA0KPiB2aXJ0aW9fZGV2aWNlICp2ZGV2KQ0KPiAgCWxpc3RfZm9yX2VhY2hfZW50cnlfc2Fm
ZSh2cSwgbiwgJnZkZXYtPnZxcywgbGlzdCkgew0KPiAgCQlydnJpbmcgPSB2cS0+cHJpdjsNCj4g
IAkJcnZyaW5nLT52cSA9IE5VTEw7DQo+ICsjaWZuZGVmIENPTkZJR19WSVJUSU9fSEFSREVOX05P
VElGSUNBVElPTg0KPiArCQlycHJvY192aXJ0aW9fc3luY2hyb25pemVfY2JzKHZkZXYpOw0KPiAr
I2VuZGlmDQo+ICAJCXZyaW5nX2RlbF92aXJ0cXVldWUodnEpOw0KPiAgCX0NCj4gIH0NCj4gQEAg
LTMzNCw2ICszNDUsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHZpcnRpb19jb25maWdfb3BzDQo+
IHJwcm9jX3ZpcnRpb19jb25maWdfb3BzID0gew0KPiAgCS5nZXRfc3RhdHVzCT0gcnByb2Nfdmly
dGlvX2dldF9zdGF0dXMsDQo+ICAJLmdldAkJPSBycHJvY192aXJ0aW9fZ2V0LA0KPiAgCS5zZXQJ
CT0gcnByb2NfdmlydGlvX3NldCwNCj4gKwkuc3luY2hyb25pemVfY2JzID0gcnByb2NfdmlydGlv
X3N5bmNocm9uaXplX2NicywNCj4gIH07DQo+ICANCj4gIC8qDQo+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL2xpbnV4L3JlbW90ZXByb2MuaCBiL2luY2x1ZGUvbGludXgvcmVtb3RlcHJvYy5oDQo+IGlu
ZGV4IGI0Nzk1Njk4ZDhjMi4uNzM5MDE2NzhhYzdkIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2xp
bnV4L3JlbW90ZXByb2MuaA0KPiArKysgYi9pbmNsdWRlL2xpbnV4L3JlbW90ZXByb2MuaA0KPiBA
QCAtMzgxLDYgKzM4MSw5IEBAIGVudW0gcnNjX2hhbmRsaW5nX3N0YXR1cyB7DQo+ICAgKiBAcGFu
aWM6CW9wdGlvbmFsIGNhbGxiYWNrIHRvIHJlYWN0IHRvIHN5c3RlbSBwYW5pYywgY29yZSB3aWxs
DQo+IGRlbGF5DQo+ICAgKgkJcGFuaWMgYXQgbGVhc3QgdGhlIHJldHVybmVkIG51bWJlciBvZiBt
aWxsaXNlY29uZHMNCj4gICAqIEBjb3JlZHVtcDoJICBjb2xsZWN0IGZpcm13YXJlIGR1bXAgYWZ0
ZXIgdGhlIHN1YnN5c3RlbSBpcw0KPiBzaHV0ZG93bg0KPiArICogQHN5bmNocm9uaXplX3ZxczoJ
b3B0aW9uYWwgY2FsbGJhY2sgdG8gZ3VhcmFudGVlIGFsbCBtZW1vcnkNCj4gb3BlcmF0aW9ucw0K
PiArICoJCQlvbiB0aGUgdmlydHF1ZXVlIGJlZm9yZSBpdCBhcmUgdmlzaWJsZSB0byB0aGUNCj4g
KyAqCQkJcnByb2NfdnFfaW50ZXJydXB0KCkuDQo+ICAgKi8NCj4gIHN0cnVjdCBycHJvY19vcHMg
ew0KPiAgCWludCAoKnByZXBhcmUpKHN0cnVjdCBycHJvYyAqcnByb2MpOw0KPiBAQCAtNDAzLDYg
KzQwNiw3IEBAIHN0cnVjdCBycHJvY19vcHMgew0KPiAgCXU2NCAoKmdldF9ib290X2FkZHIpKHN0
cnVjdCBycHJvYyAqcnByb2MsIGNvbnN0IHN0cnVjdCBmaXJtd2FyZQ0KPiAqZncpOw0KPiAgCXVu
c2lnbmVkIGxvbmcgKCpwYW5pYykoc3RydWN0IHJwcm9jICpycHJvYyk7DQo+ICAJdm9pZCAoKmNv
cmVkdW1wKShzdHJ1Y3QgcnByb2MgKnJwcm9jKTsNCj4gKwl2b2lkICgqc3luY2hyb25pemVfdnFz
KShzdHJ1Y3QgcnByb2MgKnJwcm9jKTsNCj4gIH07DQo+ICANCj4gIC8qKg0KDQo=
