Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816662139DF;
	Thu, 27 Jun 2024 02:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719455496; cv=fail; b=tIOt9j4QAGnebZHWw7e3SUEqk1XAr7zTdc9jMlZvz5VFO8aOuV8dpIGmtPU6Y6iO3fiwimoQncB0teLrdbnzRXGafhnuq7qC6hX+XdPdXS68YgJ8kFpwG0qC1Zy5YAnxnieyiDDqDq2f6pUTUt/PLpVufUiS2GDN3/rOHZwPnnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719455496; c=relaxed/simple;
	bh=QnuDVIXKNoFpNDpWO3Quue6WgzV2hSlQGfLNdvYC1uQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JeGro0pCdKgLmv4uuhs6bXlTgn1okkA+Z2h8xsbMQGjYKMxNkvuJ+AJWpMFVlSW0YtLtCC+9yZoRz24o0SnKrzTXzwst01WJz4AWPDlSV8fe905Wi6YuWZJkb//E0RPapLa7tq1dPfX+MSjUN31+ijFLOa9CzmjxzcMT/bPafr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=sIx5eE7e; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=wbJSW4vO; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="sIx5eE7e";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="wbJSW4vO"
X-UUID: 56aca226342d11ef99dc3f8fac2c3230-20240627
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=QnuDVIXKNoFpNDpWO3Quue6WgzV2hSlQGfLNdvYC1uQ=;
	b=sIx5eE7eXtgoSypdoq+f3yjMf/vnnoAVG1MDEC7URL+UVaeExbDYLoAuotBRS/AlY87R6j6ZHq5m14O0pET5wPnf0f0MxsNm+h9feAVMJqS3q0OmydwHDqCOW4EZTRUcysd7FM8exQ/31gFSci23V9/uPxvDh2WUtEjYjM+NU8I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:e5ebd16f-39bb-467c-b0be-08c9a0cdb734,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:65f87b94-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 56aca226342d11ef99dc3f8fac2c3230-20240627
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <jason-ch.chen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 704582427; Thu, 27 Jun 2024 10:31:20 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 27 Jun 2024 10:31:19 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 27 Jun 2024 10:31:19 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XXGjD/Z9gFXUNc5rhHf1DLklqyvEEtoC9Efg09anZkIyU8M/RlTsinqAU4mvJb+WFhVPaSGfY3E21o/zJLL1gBb/RCfa7V5hLXdvaT5iQLEGhYdv9nCg7U2saRdsDu7RXF73+SUUeQRXKrrj7ek/HLaNuuvyOrc6+EilB36lqLjjPmf+oQ2H17yOdUF30IjK05XmTWpbX6f6nzqEgvYDM5vhxw/POuagdnUcR2qRB6JRPFpR1Rh7sPx5byo4bHNECbWwPzSKxNtuVbdsXq/DX5tRVdv+2Cak5H+plSovAHH8eiVR1B472s95rgxCJf0N/hU+AUbPVtN7Qmg9k+mtVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnuDVIXKNoFpNDpWO3Quue6WgzV2hSlQGfLNdvYC1uQ=;
 b=GzYkvMmz/QhNykI7IoUXOcwtC8hXQtBEAoygA/xoVjmktXk47wdbiohJFjLiybV4VeQH7JXRza+sESSxiH14u+7DLROPdqy/frQW9AzHdEkvRPQZuHkFN0miv4WUgNEeTAk0l791wIU8YjfNfgzlRoeTo8PrYrlOAplcpBaL1TFzknZQOUSOTSEHRzOWxg6PapEuGDd011jCEevrMZEsnwY/xZVtvMIc5W+ZJQUyHoAx5BfsatWyqLN2dYx0nMiejD2po7HzRDLSDx3u2AxmqqelkQJdSigVrcTNmdN+cTFLSztYUh4PhPVfkRmQVuecKHtfyxAsfZouGvQjr9TsTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QnuDVIXKNoFpNDpWO3Quue6WgzV2hSlQGfLNdvYC1uQ=;
 b=wbJSW4vOfQTwbo0INIHQCdTybM6N31aAHGxXD84OI0gCXCHQQSr6adeEgnZNJdPO3fficRUDvsFRHArLeuWnn4/yZqM6I4oyMspBZHwGnxhyPqe2qQ89OaAH4F4kCAjZCsG+m7GMBiDrUkkXYoPeh/I2eiiN+LkFkC5FDre+7pc=
Received: from KL1PR03MB5650.apcprd03.prod.outlook.com (2603:1096:820:73::5)
 by SEZPR03MB7629.apcprd03.prod.outlook.com (2603:1096:101:12e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Thu, 27 Jun
 2024 02:31:16 +0000
Received: from KL1PR03MB5650.apcprd03.prod.outlook.com
 ([fe80::63ff:4959:1806:df75]) by KL1PR03MB5650.apcprd03.prod.outlook.com
 ([fe80::63ff:4959:1806:df75%6]) with mapi id 15.20.7698.033; Thu, 27 Jun 2024
 02:31:16 +0000
From: =?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
	<Jason-ch.Chen@mediatek.com>
To: "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"jason-ch.chen@mediatek.corp-partner.google.com"
	<jason-ch.chen@mediatek.corp-partner.google.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "andersson@kernel.org" <andersson@kernel.org>
Subject: Re: [PATCH] remoteproc: mediatek: Increase MT8188 SCP core0 DRAM size
Thread-Topic: [PATCH] remoteproc: mediatek: Increase MT8188 SCP core0 DRAM
 size
Thread-Index: AQHat/DMG6REGb8xSEiIb01MBugtM7G6kYWAgAamqgCAGcwVgA==
Date: Thu, 27 Jun 2024 02:31:16 +0000
Message-ID: <114254797e6645ce3207c8d49486ad5365cbd245.camel@mediatek.com>
References: <20240606090609.3199-1-jason-ch.chen@mediatek.corp-partner.google.com>
	 <bc12b046-d2fb-48ae-bd5b-a6ef6cc78c07@collabora.com>
	 <ZmcrCLOCo0Q0W6AU@p14s>
In-Reply-To: <ZmcrCLOCo0Q0W6AU@p14s>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5650:EE_|SEZPR03MB7629:EE_
x-ms-office365-filtering-correlation-id: 6f05a754-41ae-4eb9-7294-08dc96513869
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?STgyeVVDMCtjUHJOU0VvMFVEakovclhGQ2RyV2o4ZnBzVmpYS3RRR1VlMDZn?=
 =?utf-8?B?VjVBK000N3lZUjZ0MEJUdHV1akJWRGhwbHN6VFFiZ3k1d3pFWFY1NkhUeFB4?=
 =?utf-8?B?KzlrL0FSOHlSNThkbHoxMlcrK2tqcnd1eUNyNTVyUHlvN3dUakZaM1o4WjRo?=
 =?utf-8?B?VXdGT3lvb3hHV0dkcjZNdVdkVVhpRjZFcWxXL1BKVzhDR2txQnlzdjEvaWl1?=
 =?utf-8?B?K3BkRzJyZEg5OVFCQTZtWlh4anl1SGV1S0NYYlZsYkh3d05jT09KUnBDVEFu?=
 =?utf-8?B?Q1dVRXlIY0taN25KY29UMHZaczRldzhuWWIyZ0RQRjdndm56LzZ4ZSs4VXBE?=
 =?utf-8?B?TVEzM0cxVTQwUkZRSko0UEdPa1dORkRSd1BtaDQ0SlhZV1plQ3FmeW5qcU1p?=
 =?utf-8?B?bXlHZVl5aFBqWERiTjdkeXpLWnRVRlptUU04NWlxMk5ROXZabERsbHdaaVNG?=
 =?utf-8?B?MmRuTG8zdlhZWHJ0SGlBSUIzd01tcjZBQXJaa3crWmRiUVBpRDFZZHFrdlIz?=
 =?utf-8?B?MzFicElWTmVFcUNtZEhrYytoZjBwbC8zRzh3TjJuTmlIZWJEZWtzUzRCN2JD?=
 =?utf-8?B?aVcwK1hQYXV6RFFpUGdpMWJUbXRsaW5aaGR2NE9wV0RtYkUwNGF6RVpjemVE?=
 =?utf-8?B?Q3dZa0lMSy9PRkJVMGZWM1RIYUVBSm0vM244Y3FaSHZtd0g4ZW96akdPQWFQ?=
 =?utf-8?B?Y2ZuZlprZkRDRVVGd3N1QTQzQVlmNmMrZXl6Q0hGTSt3ZkVzQ0ZNZ2oyUm9u?=
 =?utf-8?B?VzMyR2wxMkM3L3VyZFl5d0NSV0pTS3EvbWY0VGVHTURsZGlsQjFFN0xKTG5C?=
 =?utf-8?B?cEFlZnZub3c0WGVxMmlWTDk3dEFEcjBEekVKNUZpNzRaQ3Y4YUlhZGh6N0FQ?=
 =?utf-8?B?WExwMDRlZUlMQllpd0NBQ2ZtczVmT1JhakhtQUljWi9vNENXekNyWS85VUsw?=
 =?utf-8?B?anRKSVQwbXlOdnkwNFpqMHMyMUgveEhrSVQwUXJyMHVsOGhiUlZrRzIrRzVG?=
 =?utf-8?B?VDNGRm1mZmRzTmhHT0JHMk1ORXdjOTQzTURRMnAvOEtQcmYzSTZHemZYZGxz?=
 =?utf-8?B?cHlUZ3JjNW5ya0V4N2tNZ3ZvOTlWMmdXTHo4RFg5MW5hRm9zS1cwUlBuQWZB?=
 =?utf-8?B?S0owV3k2MEJacWxIOGI4Nzl0cXZ1MnF0c3hFT0pEN3RSR0NDd0doVzhYakgv?=
 =?utf-8?B?dWEyU0pMNGREL01HSXl2ekZvd0N5SlB4dzBEUG56Rys3bnUyZ0tobDJJbG9F?=
 =?utf-8?B?RmdQQ21hYUpPM1ZTM1VpYktNa2RiNmlIbUJOeUZIT1BZN3dvMmZtMEQxSHYy?=
 =?utf-8?B?dXVxQVl3dFBCMXB4ME1yTFhwNjRTblQvMjFuY09mejllOXk5Z0MzNEZHVCt5?=
 =?utf-8?B?TGZlSTE0bXowS0hZNDdEK3I5OEVnanZ3aXNWT1d1OVMvU3lIazV2R2tYTHhl?=
 =?utf-8?B?ZHpCdUhKVTUyUWlIc2grOWhCeG5jUTQvdTdDRFhvNGd3eEgwam5NZHdtVUhh?=
 =?utf-8?B?RmpkWGJGVXBsci9HY2dOR2dneUN0czZCQldNWTFFNHpGRVgrN2lqb00xclF0?=
 =?utf-8?B?N25PbEZKSzFxZlpGc2hmOHFhZWhLcTlNNTdwOHovZ3JRWmxpejl3Ui9iZUp6?=
 =?utf-8?B?ZDRFSi94NldiRGFaM1ZPSm56a1BGQ1BtTEcrb1Ztbzl1WkljSVNFc0NoL3Fv?=
 =?utf-8?B?OHFsTEMwellJYmFlN2EzUWZpRWVyYTZZUGhqZkN6cmgvdmdSeHU2cUdWdmxX?=
 =?utf-8?B?cFZHS3UwektWT1NubXgyYnFkV1dSVHd1TUNxWW5NSE1rTFZIcW9nNXhqY3JP?=
 =?utf-8?B?K3RUNW1XdmJVQlE4YzlVZkVsb3pjeWZhRm5LVTRSdzc3SzI2MTQ2Mm5KMURq?=
 =?utf-8?B?bldIRytaN2s1dzFGVWFIZGdoWCtYR0pQdkxuUGNYN2YxVFE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5650.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RndmNU9HSHJjb1NWTmkwN2g5WktzSUpzQUYwLytwQWRsZm5GNHdrd1ZlZ2w0?=
 =?utf-8?B?c3RuVHdYNFFwUStQTWVxK0FsdmFURkMrdURpS0NSR3hxZkhYSHk4TXBLUjFM?=
 =?utf-8?B?bGV3M1V1ZlJRT0FLV3ZtQ0gvUnlxbXJlTTNFak8vQWFmYlRpSDNyejRuVE5N?=
 =?utf-8?B?RHBSSmZNc09FbnRDUXZHVG4xQmU0MjY0TTdEN1I3YmdVVnhkRWFYVE5Cb3Ux?=
 =?utf-8?B?bGIzVjlSVGRpOVhKWnB2cW9aNHVFd0U4TjBQNjBGUnFINW5sT3lsWnBTUEJI?=
 =?utf-8?B?U3NtTkJGekdnN3cwM3V5OHJHYVdGRDNBNzg3S3BnaE9GMXREcDJEQ2taMWhB?=
 =?utf-8?B?TVhvWEdXQzdQcFRNcjdzYjRwc2xzbDZ4MDJPVTVVUmU3MUdUU2d1RG1rM1Zh?=
 =?utf-8?B?bmpRaVVuVFdwZTFoUGhINmJlbTZrRFQ1K0dDZm1DUTU4UjJKaElKTHBoSUYy?=
 =?utf-8?B?YTFVZGZ6QzJkWVdHSXMrMk05eXVDOUFqTkk3T0tncDNzWnExcXNIbG8waUdD?=
 =?utf-8?B?eXpDc2dYVUtZdTB6UFlFbU9SdDA2R0ZiZDJxRkNlNjNuUUNBeUhib3RPenVq?=
 =?utf-8?B?OHEyU1cvMlBWVTZUOGN1aDJrSitVOXZUT2FzdmZFYXI0bWhIQjU4b3ExY0M1?=
 =?utf-8?B?bGlEZmhrSGFUcWFOYXlqWFk1eDYxQk1BRE9tc08yWEc2MkdKL3lzZVF5Z1lZ?=
 =?utf-8?B?UVBTamhISkhSK29JM0luRmZVREtHSDdrZ0sxeGNDNlhPckhISlBNM3hXcXhM?=
 =?utf-8?B?a0JwMnNTLzBMNThvdVAwc2J0OG5RQnVoa0c1d3h3bW9pZjEwRWU1RnJUZGFP?=
 =?utf-8?B?ckZBcnRrVzJZTGpuR0hqOFYxYVZNSEdWSXNvRHdzTUFKN0RvVkpVa2hVTWVE?=
 =?utf-8?B?NG1UeUkvRGNDMHIrUURVb0NUS2UwMFRuREIwYlMvOHBMR05UVGQ4RnVFNFc2?=
 =?utf-8?B?ZStnQlNTSVJ0amFQeko1eUVHcFlRclR0OVVvZXVGRnJwOEJFd3NIUkI5TkJw?=
 =?utf-8?B?WmtEcHpubHg2TTdsRWsvbEwwWCt1ODR3L3FocGZ1MkpuSktQNU02NlM4bUdN?=
 =?utf-8?B?b0xtR21KQTNzTWc1OUZ2WHJUZ2E1dUY5VTl5SVExZm5NOU1LL1BlN2d6Nm9U?=
 =?utf-8?B?dnRWMjBxeGVDY1dmSFNlQUMrbTVNRTVpRlhrNUE1ZFUxa0V1NWxtSHpNMUFI?=
 =?utf-8?B?Nk9mSFRkenJOUUU3WkdZNDZCU1VaV2tXUGlhMEFlT0hVd3ZoakJUbDlya3FZ?=
 =?utf-8?B?UklaVDBYbW05Z05wWElodjl5OU11bHkvNlV1TVk5UlRSNytTRFdSVytDVlRv?=
 =?utf-8?B?Yi9hQWhvaXhlZDhENmFmczhUMGE4Z2ZsSWgyTWdSTTdxUkRxeEFmM3kvSEcv?=
 =?utf-8?B?eUxRWVlFL3VYaEorcmNQRXBKeU9EcWJIVU5FcnYrTjRMOWovYzk3M3dqT2FD?=
 =?utf-8?B?K2M2NmhaMUhSZXNUc01IYVZyS0FQMlg1TzJxZ3dsa3NWYWN6VHl0R0NGaWFi?=
 =?utf-8?B?RkVaZDlqYnNERklka2QzNys0S0ZoWTNMQlpicU5FeGpXQTNJWWkyR2lrTlZt?=
 =?utf-8?B?Q1g0TGtYNkgzYVRHTng4WHRYZlM3QVRHZ1lGQW1NczhWNnhqbzJ6ck01NWpx?=
 =?utf-8?B?RUNGT1FNZmJwVVFhUk91S0lrS0JpSGxPL1dPWngxZU9OUTRkMy9iczI1STFS?=
 =?utf-8?B?SEtlUVFIQ0RwVXEwRWdlVy9USVpIMm13YzFRaVNwRkFoUG9obEhHUnB0aEMr?=
 =?utf-8?B?cWZFMUhPU2FqQUFONjM0MWVVeFFkRDVDRnpwUFczV0lGQlJYTE5KeTMzZzJM?=
 =?utf-8?B?V01HcmVla3ZTWHMzWjBYMVJuS3RUMlNHRHlmTXBBK2c4Nk93L3NvQjhIVEZa?=
 =?utf-8?B?cUUzK0Z3RmE0cEswWFZGTTc4TlMvNU9aTVJ3anlXSUszUWUwT2c2Qng5RnZo?=
 =?utf-8?B?R1h2SkQ1WFNjcnRyNWZGTHBpOWxOWDNVYWt4T1pBVnRHNFJPVmdSaXVBOTZz?=
 =?utf-8?B?Mk5hajRvUXVxYkZ2a2hUbFhuWXVva3cwb2RJbHZPalE1QWVWTXR4VmMwd1lD?=
 =?utf-8?B?OGZWZDJoMzZZOEVZWHNua25iaTROYlRjTHNmVER5cFJtQS9GbmE3VjZqZ0c5?=
 =?utf-8?B?UkNRamVmQ01yUWx4NGpGSmdjODkyQjZJK1A1WkJoMTdZbW1uSWNVZXo3SDJZ?=
 =?utf-8?B?R0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <77FB0A2FED05814390B06E8C765BEE60@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5650.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f05a754-41ae-4eb9-7294-08dc96513869
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2024 02:31:16.2423
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TX5tYz06zsr6DeWa9EIwNgxf5BK/AL4uZ+qkHCoNBRVxivVPPiNVMTUtFJDfVcPtuBSs1aRGdg5ocm8TXwTtn3XSawjne09q34LFGlG/YmQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7629

SGkgTWF0aGlldSwNCg0KU29ycnkgZm9yIHRoZSBsYXRlIHJlc3BvbnNlLg0KDQpPbiBNb24sIDIw
MjQtMDYtMTAgYXQgMTA6MzQgLTA2MDAsIE1hdGhpZXUgUG9pcmllciB3cm90ZToNCj4gIAkgDQo+
IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFj
aG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRl
bnQuDQo+ICBPbiBUaHUsIEp1biAwNiwgMjAyNCBhdCAwMTowMDoxMVBNICswMjAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubw0KPiB3cm90ZToNCj4gPiBJbCAwNi8wNi8yNCAxMTowNiwgamFz
b24tY2ggY2hlbiBoYSBzY3JpdHRvOg0KPiA+ID4gRnJvbTogSmFzb24gQ2hlbiA8SmFzb24tY2gu
Q2hlbkBtZWRpYXRlay5jb20+DQo+ID4gPiANCj4gPiA+IEluY3JlYXNlIE1UODE4OCBTQ1AgY29y
ZTAgRFJBTSBzaXplIGZvciBIRVZDIGRyaXZlci4NCj4gDQo+IFRoaXMgaXMgdGVsbGluZyBtZSBf
d2hhdF8gZ2V0cyBkb25lIHJhdGhlciB0aGFuIF93aHlfIGl0IGdldHMgZG9uZS4NCj4gDQpJIHdp
bGwgbW9kaWZ5IHRoZSBjb21taXQgbWVzc2FnZSBpbiB0aGUgbmV4dCB2ZXJzaW9uLg0KDQo+ID4g
PiANCj4gPiANCj4gPiAuLi4uc28gdGhlIHNlY29uZCBjb3JlIG9ubHkgZ2V0cyBhIG1heGltdW0g
b2YgMHgyMDAwMDAgb2YgU1JBTT8NCj4gPiBJJ20gbm90IHN1cmUgaG93IHVzZWZ1bCBpcyB0aGUg
c2Vjb25kYXJ5IFNDUCBjb3JlLCBhdCB0aGlzIHBvaW50LA0KPiB3aXRoIHNvIGxpdHRsZQ0KPiA+
IGF2YWlsYWJsZSBTUkFNIGJ1dC4uLiBva2F5LCBhcyB5b3Ugd2lzaC4NCj4gPiANCj4gPiBSZXZp
ZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPA0KPiBhbmdlbG9naW9hY2NoaW5v
LmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+ID4gDQo+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBKYXNvbiBDaGVuIDxKYXNvbi1jaC5DaGVuQG1lZGlhdGVrLmNvbT4NCj4gPiA+IC0tLQ0KPiA+
ID4gICBkcml2ZXJzL3JlbW90ZXByb2MvbXRrX3NjcC5jIHwgMiArLQ0KPiA+ID4gICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPiA+IA0KPiA+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvcmVtb3RlcHJvYy9tdGtfc2NwLmMNCj4gYi9kcml2ZXJzL3JlbW90
ZXByb2MvbXRrX3NjcC5jDQo+ID4gPiBpbmRleCBiODg1YTlhMDQxZTQuLjIxMTlmYzYyYzNmMiAx
MDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvcmVtb3RlcHJvYy9tdGtfc2NwLmMNCj4gPiA+ICsr
KyBiL2RyaXZlcnMvcmVtb3RlcHJvYy9tdGtfc2NwLmMNCj4gPiA+IEBAIC0xMzkwLDcgKzEzOTAs
NyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19zY3Bfc2l6ZXNfZGF0YQ0KPiBkZWZhdWx0X3Nj
cF9zaXplcyA9IHsNCj4gPiA+ICAgfTsNCj4gPiA+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtf
c2NwX3NpemVzX2RhdGEgbXQ4MTg4X3NjcF9zaXplcyA9IHsNCj4gPiA+IC0ubWF4X2RyYW1fc2l6
ZSA9IDB4NTAwMDAwLA0KPiA+ID4gKy5tYXhfZHJhbV9zaXplID0gMHg4MDAwMDAsDQo+IA0KPiBE
byB5b3UgcmVxdWlyZSB0byBmaXggYSAicmVzZXJ2ZWQtbWVtb3J5IiBub2RlIGluIGEgZGV2aWNl
IHRyZWUgZmlsZQ0KPiB0byBhY2NvdW50DQo+IGZvciB0aGlzPw0KDQpVc2luZyBhICJyZXNlcnZl
ZC1tZW1vcnkiIG5vZGUgdG8gY2FsY3VsYXRlIG1heF9kcmFtX3NpemUgcHJlc2VudHMNCmNoYWxs
ZW5nZXMgZHVlIHRvIGFsaWdubWVudCByZXF1aXJlbWVudHMgaW4gZG1hX2FsbG9jX2NvaGVyZW50
KCkuDQoNCkZvciBleGFtcGxlLCANCg0Kc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfc2NwX3NpemVz
X2RhdGEgbXQ4MTg4X3NjcF9jMV9zaXplcyA9IHsNCiAgICAgICAgLm1heF9kcmFtX3NpemUgPSAw
eEEwMDAwMCwNCiAgICAgICAgLmlwaV9zaGFyZV9idWZmZXJfc2l6ZSA9IDYwMCwNCn07DQoNCldl
IHJlcXVpcmUgMjU2MCBwYWdlcyAoMTBNKSBmb3IgU0NQIGNvcmUxIHVzYWdlLCBidXQgYWxpZ25t
ZW50DQpjb25zdHJhaW50cyBuZWNlc3NpdGF0ZSBzZWFyY2hpbmcgZm9yIGEgZnJlZSByZWdpb24g
b2YgMl4xMiBwYWdlcw0KKDE2TSkuIFRoaXMgbWlzYWxpZ25tZW50IGJldHdlZW4gdGhlIHJlc2Vy
dmVkIDEwTSBhbmQgdGhlIHJlcXVpcmVkIDE2TQ0KcHJldmVudHMgc3VjY2Vzc2Z1bCBhbGxvY2F0
aW9uLg0KDQpBZGp1c3RpbmcgdGhlIHJlc2VydmVkIG1lbW9yeSB0byAxNk0gZm9yIGNvcmUxIHdv
dWxkIGxlYWQgdG8gYSA2TQ0Kd2FzdGFnZS4gVG8gYXZvaWQgdGhpcywgcmVzZXJ2aW5nIGEgbGFy
Z2VyIG1lbW9yeSBibG9jayBpcyBhZHZpc2FibGUuDQpUaGlzIGJsb2NrIGNhbiBiZSBwYXJ0aWFs
bHkgdXNlZCBieSBTQ1AgY29yZTEsIHdpdGggdGhlIHJlbWFpbmRlcg0KYWxsb2NhdGVkIHRvIGZl
YXR1cmUgZHJpdmVycy4gQ29uc2VxdWVudGx5LCBzZXR0aW5nIHRoZSBtYXhfZHJhbV9zaXplDQpp
biBTQ1AgY29uZmlndXJhdGlvbnMgaXMgYSBwcmFjdGljYWwgc29sdXRpb24gdG8gbWVldCB0aGVz
ZQ0KcmVxdWlyZW1lbnRzLg0KDQpUaGFua3MsDQpKYXNvbg0KPiANCj4gVGhhbmtzLA0KPiBNYXRo
aWV1DQo+IA0KPiA+ID4gICAuaXBpX3NoYXJlX2J1ZmZlcl9zaXplID0gNjAwLA0KPiA+ID4gICB9
Ow0KPiA+IA0KPiA+IA0K
