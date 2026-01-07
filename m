Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5891F7916;
	Wed,  7 Jan 2026 11:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767784356; cv=fail; b=Sxtb5Ts2foFiQ+jIgkNhGhZBIrL523U6WgkcTCTw7zIBmKxH8ZrhJYanLmv/UCIiMFdlSrV8YrL33hgmNfEOkgQm50PGwPwKAS1Uj7H1obUcGWwAd4zMb2SI3+2kkTeq/HhWFI1lCXjL9MqYIywEC6GE3fFTgK8bN8RoS983Yr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767784356; c=relaxed/simple;
	bh=CMxs/++VYS4tLhvrtHuUchcOTrlKpJERoElDYmc2lhU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Hib5k8DbBEoIf0Izu+JwDOAfqJW/K0yYu36iEXEeKc0rpfzyejJPzEbWUqlYoFKzGxLALJDsY3PlIo+mVhzReQuPH5HdbkFcme3/abFtAGWyRKJXWf3U75vMq6MLfDwiHANMYK/dEuBoIq14Y+Rsd3a9ME0vn/vSS7iWmP0Qiok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=c/+blbUz; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=RjXr5nYh; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="c/+blbUz";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="RjXr5nYh"
X-UUID: bc8b6380ebb911f0942a039f3f28ce95-20260107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=CMxs/++VYS4tLhvrtHuUchcOTrlKpJERoElDYmc2lhU=;
	b=c/+blbUz1/yvT/zdI5CA9CWTfLmSvKzo87EbvCIKXCJXDWcvR0lOJ0TFQH9/2+SHW0CA1zbB0N6AegYcugclntdYMcsvTDY/b5nOGYRNLfTMbrQn9f3uScm7qhQAdDn8eQL7fh/3aqRm5kPEuNYSYxLWVln83nIaRGBWaimARpk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:15577bfc-170f-4801-ac51-c2bc572be50e,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:87f1da59-a957-4259-bcca-d3af718d7034,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bc8b6380ebb911f0942a039f3f28ce95-20260107
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1746793016; Wed, 07 Jan 2026 19:12:21 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 19:12:20 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 19:12:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wprL91Um5Y4EbG7uZhCMnUbx7b5dL1bJugdfp+A4xZHwfsFUVO6SIdvIon2DgBq39gBvhCE0p0u5iaWmOr7IFDZtHPzsbs8L6IoRfrdv1Nao1xlG/XitWMXvzu3Y4J+j5LJYSvDJyKmsgyiVxBElB0bTLqElmMOwpaDnpGU60dg4lJ9Nk0MdwvTKpTSOtuX9fdx79RECOdnmRV7dR/np2rRl3hjsOjxzpOlXp5LwAlUMhF3xRaSvOdmWl/1WBdDmo5F7+68CM1BzzgflS+MmBW4m4YHXbzy2+VE2ZzNUwkR6wTbNQskrvxk5c2v862VXPRdQA6LssWWaJrKUZ1QsFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CMxs/++VYS4tLhvrtHuUchcOTrlKpJERoElDYmc2lhU=;
 b=fMp2MBJ58vDCid6ypo8qfVqDac4wpnQyPl0GTVYzjjTJzdsmFMQA8+LTCl7GPBQwzyVgKGaZmbJMG0h6NwgWlBJ1URKvYv76hzSWU71b68ZQGDZSTE70n3fj9uUSSlhYBj11/u0iHeB6TDLAQrPyf6UdViH47rpdqwqdTpksxgScBt97JJZFGWrYZq4JbdRj6n5KT6MzXe1h36rXKOkE3pmwExF4paaBqoRupnQtODnBzVHVAjuGmCBTf6HCLY9oN49mot8cM2HIXa5J4SGUrZBgUmheiOFazGF2GQnAA6m0ZaQiK6yPFXzSwoELKiGbnWzXmA9fuePK6Uh1l0cilQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CMxs/++VYS4tLhvrtHuUchcOTrlKpJERoElDYmc2lhU=;
 b=RjXr5nYh9QiY4Ew7tft0QQaywJializXmP6uQSKbyZW+aaVJ3uXfcMWuuMk/eAy6opUSV+B1bVEKrcHyxYT1tQTg51WhFAEOZATdwBBMNIrWB3lcLFotFVxMChCESMgOh0Ms60JPCmCjW/iPij29T/BiEutMY1qqGhyXvwSrO1s=
Received: from SEZPR03MB7810.apcprd03.prod.outlook.com (2603:1096:101:184::13)
 by JH0PR03MB7908.apcprd03.prod.outlook.com (2603:1096:990:34::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Wed, 7 Jan
 2026 11:12:14 +0000
Received: from SEZPR03MB7810.apcprd03.prod.outlook.com
 ([fe80::2557:de4d:a3c7:41e8]) by SEZPR03MB7810.apcprd03.prod.outlook.com
 ([fe80::2557:de4d:a3c7:41e8%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 11:12:14 +0000
From: =?utf-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>
To: "Ann.cheng@arm.com" <Ann.cheng@arm.com>, "sam.moss@arm.com"
	<sam.moss@arm.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "wenst@chromium.org"
	<wenst@chromium.org>, "arnd@arndb.de" <arnd@arndb.de>,
	=?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
CC: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"andersson@kernel.org" <andersson@kernel.org>, "mathieu.poirier@linaro.org"
	<mathieu.poirier@linaro.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "kernel@collabora.com"
	<kernel@collabora.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2] remoteproc: mtk_scp: Construct FW path if
 firmware-name not present
Thread-Topic: [PATCH v2] remoteproc: mtk_scp: Construct FW path if
 firmware-name not present
Thread-Index: AQHcPa+KXbrnrZrzM0aWlQYHJQpq2LTY7ZMAgAAe8YCAAWSFgIAADbSAgAAFNgCAbI2ggA==
Date: Wed, 7 Jan 2026 11:12:14 +0000
Message-ID: <033dc81719ee8d5e7e47b9382f141eb129a01b29.camel@mediatek.com>
References: <20251015084103.10737-1-angelogioacchino.delregno@collabora.com>
	 <CAGXv+5Gs5_j5L3+HT7K-XYwVG6S8ZGhHZkEcS0HpdkcjRQq2oQ@mail.gmail.com>
	 <9f5a3dc5-d0f8-4172-a4b4-867919612a2d@collabora.com>
	 <CAGXv+5Ge-uZHKATOvqQF25DRTcHFJkopUk-JUXDtpEen=BwCiA@mail.gmail.com>
	 <f434165f-1717-41ff-93e4-9be5b7fca929@app.fastmail.com>
	 <141839e6-1dbe-4e98-8412-d47e853d997b@collabora.com>
In-Reply-To: <141839e6-1dbe-4e98-8412-d47e853d997b@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7810:EE_|JH0PR03MB7908:EE_
x-ms-office365-filtering-correlation-id: 5f1a9d32-18f2-472e-afda-08de4ddd9cc7
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?N1U5WVZVT0NDRDRlTzZLUVBlWHRoZS8va1RWM3lBaUlBZDBhVXNDek4rWEpa?=
 =?utf-8?B?Q1k5cGRKUHpiMS8reXVtOWlQdCtYTkFzZTU1akg0MWRzY3BzN1M2NEVVa0kr?=
 =?utf-8?B?VVRXL0VJbkl1ZFpXUGowNlFqdFFQajBHRkNsVENsYTh3QUNTdGdoQUowbkls?=
 =?utf-8?B?RFd3cXlJam12SDM2SERkMXBpQlh4N3IxUUNxZ1pkei9sWTZUMEdOcEovUmgv?=
 =?utf-8?B?MEFGS0xDMVUxb1pLenFxN2U2VUNLOG9rSXpSNHVXckFvUWhKQzhObzRXS0dF?=
 =?utf-8?B?RkdXM1JYOEpQWlVQV3BSZlhZV1M5RW9XRDhKbHdtcGh3bExpQUNJOHF0OTFt?=
 =?utf-8?B?SVZFcTJmMElsNDhXZ3UrZmNSZEplTW5DQkdGMFJKcUw0dkY3blFiWWpPNzE1?=
 =?utf-8?B?UEdLQmlqcE56R2VTeHFzbFByblR3Snhlc3FOUURCMmwvY25XVk51R2Z1dkFo?=
 =?utf-8?B?U0VBRndOYjVvVVFBTU10YnNrdlBCSEFrdG51NGJ0U2RaUm9hdFhRVGNSNFBo?=
 =?utf-8?B?UXJOTTZPYmxQMzhFUTBlc2NxdFhIMkc3V09EQUhkbjgyRk9sVjJwdU1JRWFS?=
 =?utf-8?B?MFB3UkljQVdRcTZVeldENGFBQjlwQVR2cVZPNmw0UzFISUo0TUM3KzA2UmdI?=
 =?utf-8?B?RUJqckF6S0NWUGhSbFFlWUxYN2s4b2NsTTV4NnY0OHV1dk5jYnJZVHpwZUl0?=
 =?utf-8?B?UnlGcWFZUkxJaUtOanJFZUhOdktYZ2NPZEpNZnh3bHRlZ2M4ZHVkY25zOU9G?=
 =?utf-8?B?VTJHTkJ6NjlVZzV2c0p5TVpQUmR0LzdvQUhBMUFla3VSdTYybm01QVNEMmxh?=
 =?utf-8?B?Qll5QVBPL2lORkV2Wk5WRXZraTZHY2dDM3hnTDlxQXMyY0tpazl6dHg0Mmdl?=
 =?utf-8?B?aGlRYXNWNVh2Nm5sSnpOV0J6VjZVeHBvNUF0ZW9MTkRnR0pVTk9qVTNYcU52?=
 =?utf-8?B?MFZ1eEJMRzNsR1RHZzlDVVRIejFMOXlGTDExMC9aU3JPMEhNblJQbVZObFJx?=
 =?utf-8?B?aWdZb0xYOGUxMi9XMUpDUWV6ZFdpeFdzbDlPeldPdHNkM3Rxa1FrTWdWSVBz?=
 =?utf-8?B?R2hWd1Bvb0RVY3lKKzNBRFRJeHRGa0dmOEdjOU1pNUtDaUY3bFVwbnRUYjht?=
 =?utf-8?B?UDljYTVzMjhRQUFkRy90ZDk4akVXQkoxMlQ4dWhNNmc5RzdzNW81aDF6U3dY?=
 =?utf-8?B?RjlWc3FvU0t4S3luQ3FEYkxBd2U2cVVXVUNDQVU4bDlrUUIxLytlQ0EycXQy?=
 =?utf-8?B?c0lubHJTOVFvTDZMMFhhamFTdDVaQi9CM0o5U3VPNk1GN3ZtY252cHRSVklx?=
 =?utf-8?B?OFMybXo2M3N5U25zNlB3Nk1Bc3VKek1aSE1JZDA0RW44ZW5PNGIrOEpaNllh?=
 =?utf-8?B?MU9hR1V0QVhhRlNZaFB3TE0ydzA3NzREbE9JUHdGRnZZOUx3ajIxbFB4ZXpp?=
 =?utf-8?B?MkpDUXJOYkoyaFAyc2RoNTI5TUhsVmhvSjZQMzNXVlM5ZVM4cEdCU0FOeHZ3?=
 =?utf-8?B?c0NwT0g0cmxETFZFSkRCdTdZbzlOS1h3RUx0dERBMjluY2o2K0hzMUdhZUJo?=
 =?utf-8?B?YzVMS3pzV1FRaUx1RWt3MXNFZCtsYmJta0dqWmltTkxLQ1M1QURVSjRvWXJx?=
 =?utf-8?B?WXVWbEtpbTNQakhPb0tzQTU2Q0VkdkxKc2ZxdjIweFQzU3RxQzVwTGc5Ritz?=
 =?utf-8?B?RFlWdTNJYmRrUSt1RnIwS1BmK0U2ckJ3Rk1nTmhFbytxRGxsRklSbFVwSENW?=
 =?utf-8?B?enVvTTFRSmw1UVpLOGlSbUJFQ2hCVXlZM1gzalhqT2pQOVNkckEzL1FFS0lj?=
 =?utf-8?B?cjZpWG16U1pHdnRjckdWS1NhMWY3TnFTMFF2SFIwVkdEcGVZVUY5b3NtT3V1?=
 =?utf-8?B?RzFFQkhXNGpFY2pPU2tSSkRRMTBKOU5sNGNyeEViMWh0UjhvSzNMSFprdkFj?=
 =?utf-8?B?SnB2ZktBR0JyaTBlR1JlQW5TZXhXL3ljZUlKam9vRkZzeHBVSEhzeHRKYlhE?=
 =?utf-8?B?REpia2YvRWxSL1RwT1JyTDErWXVUQTFuOEdaaTNqVGdhbExEVzV6eWt1S0Yy?=
 =?utf-8?Q?/Q7uxk?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7810.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nms1akxsUDA0dGFOSGhyMFFJY2xDS24vUGx3bUNPT2R1S3VqZTNUN1VURkFD?=
 =?utf-8?B?OWxwRXlGaDRVSkl3TEREWll5UUV6ZjF1N2ZoUVpyYm9zSGZKZXc4dTVEMFZ2?=
 =?utf-8?B?RVFXMTVqTUM3eGZhQzdvTWUrWUsxNXV6WUlNem9DN3pKUk9UTGJpVW9xVTVk?=
 =?utf-8?B?Z2FIWjVNeG1NcTdna1NFRmFlU2lqR1NTcmZ2R004ZGh3ek1zZUVoaURLU251?=
 =?utf-8?B?djNpSS9YUTV1bWJRMEFZR2s2a282SmdZVGliT24yM2pFajRxYTVhOVRqaTFO?=
 =?utf-8?B?NVU1eVJMbFpKL1RsaTBhcHNIREcxcG5lSUlNT2hpWkRFa3d5UVhmZ085cmsv?=
 =?utf-8?B?K2o1RWYzWHhkanhMT1BxZmdqQWVvSDBTVFBCcU91TXNwYmJ5RnhSN0FTRkpJ?=
 =?utf-8?B?SnY2SWZEdUhSYk5qRG5Pek9ZTTRJenUvaVJLWnMrRTRMREswd01rMGFCRzhh?=
 =?utf-8?B?ZDJSSC83OW10TDlkeEM1M0I3RFZFY09xdGFrcFJQb0ovRllHRUMxeU5vTytt?=
 =?utf-8?B?S1hDWm5ST1JiZFNUcFhXVGJPU3ZNUVNpaVAzcXRUN05kenZOVHVoY3NzTnNt?=
 =?utf-8?B?cVlHMFZFVDF3WFJncUpjVFRiYUMzZEFHd2xYNVRYa2kyMlJNZ3FXNmJkcmlt?=
 =?utf-8?B?MXVLL0UxNFZzNXdJMUdTWkd5eDN2TlhrYjdxckdDTFl5KzRSN2tkVERnTUlk?=
 =?utf-8?B?R3pPRXc4UjJ4N2ljK3ZqdWFDSkNTZzByQkxKQjdZTjFHSy9HQk5KWnNMWENr?=
 =?utf-8?B?bEI2R1BDWEVLV21mNDV5cm1wSDZ6N3pHeGUzUXVQK3JBZTB3Y2w1WTF3TXgv?=
 =?utf-8?B?ZE1oRUZBMWpOZ1RoN25RdVJCT0djV2NxNEJKYWt3bHBrYmdiLzFjdXJRelRY?=
 =?utf-8?B?UGFBc3luVklqWmF4Rm42dCt1Z0g5ZW5QWmZSNG5zRkE0NWJFV09jTER5RmF0?=
 =?utf-8?B?OFNRRGNSdGRzd1RqYzNWdDZqcUcvVnhMUDZTM2lGTllZeXpPR0IyeFI0c0Zu?=
 =?utf-8?B?L2VLT3ZIanVPN3YydDNnZjIrd04vWTE1REpXVGNia0gzTGwrOXZqeHhIRlVl?=
 =?utf-8?B?a3AxYklkam1CVEtWMDd2bDQzMEM1S3REcU1TeWpUdWZ5V3NrYmtaNzc5UTJR?=
 =?utf-8?B?RHFJT1ByM2ZsTmFrRy9PV1JoQmNDenplTnhWMk4vTkFqQjRTbHlJTmJtV0Ev?=
 =?utf-8?B?OG1vTmtjalhLNEFRaFd3UFhDaXVYRzdHbVFDcG5FeGRISiswZVhPY21PTEZ2?=
 =?utf-8?B?QkdGVklyYVB0aEo1NjdZUWdNRTF2cVlBbXZaRnhkZzN0TkdrVlRlZXltL0VV?=
 =?utf-8?B?enAwQkJUNEZ1d2k5Q3U4b0NoMnNvWVFRWFk5MkdFU09NeVhkamIyNUkwYmtB?=
 =?utf-8?B?YngxNFdWVUlIaCtpeW9TR2NGaUlGRFhyWDkzVTUyU1FFaHBPb3Y0bnQ3NlpE?=
 =?utf-8?B?Zng0bENESGViMVRNWWtHSUcyT2w1aS96ZnZ3UmF1MmlCY0hRMlFLbGdrZzlG?=
 =?utf-8?B?Y0V6TENmY3l3WUplS2t3ZjlvNHpZM0ZjQkhpcTQydWJKcjBjbE1DVkRaMFZh?=
 =?utf-8?B?d1NCbVJGVlVLOUI3NWxBUEM3bHVQaUVXTzhWRlpRcWpHaVNxajZMZi9YelFR?=
 =?utf-8?B?d2FXaE54QjdBd3ZkaGI3bkI2VHExMjFaa0lGWkJxQWZ5Y1lSbkZWVkdKUVFK?=
 =?utf-8?B?Y1ZzTkpEQVRmYmxtd0RHb3ZTZTB4cklGamEzMlFDSjhqaWFRQlh3ZmFUZmIr?=
 =?utf-8?B?WEpzWVZ4MnJlSXhORmQvTm9KWXZuTDZ2VElHb0ZqYmlnOWVpUDlxdGRBQW9Y?=
 =?utf-8?B?dDhpTS9vQ2NvdkNQNkhpNkhGZjVyRkxYb3FYN3VaUGMzWDNId0U0VDBsQ2pC?=
 =?utf-8?B?NnNaUVpqVlZqWVAxNlNzMEsrUU5zNy85K0NsazA5V2E0bkFLdkQxSSt5RWJC?=
 =?utf-8?B?c21rODVRL3VtNXY2Z2xRRlJKc1c5T3VlVDAxSlZ6MU5lVmJZK3c3YWNSTXdw?=
 =?utf-8?B?QVpaUFhUUG5mQnNKd2w4QmMxakpqSFptazRNbk9zVGtwdStjZTU4RU9RQkRr?=
 =?utf-8?B?dUM0d2NlN0hHc2RPZHYwMDBZblJ5aVhrNGgzNERGeFdDQXZkWWl4V04zTXNR?=
 =?utf-8?B?c2R4U0diRWNkdnN6eFRldXRlSitRakJJOHQySEtvTERqS1hmZzVVQ2hGd0px?=
 =?utf-8?B?Ynh0WlpYL1RVSEN5S2Z1M3RhZjdWVVZCSTZkOVk5OFFYNlJyQXpQNDZIWFlE?=
 =?utf-8?B?aG0rZFFTRXA5Mi9mRUlUamg0NkxOSzlsTFRBV2xtN2d0cmFYS3pjUmE5elZX?=
 =?utf-8?B?ZHF0L0dVTzR0WDBFTUZWNWhKa1VvL3hvYU1udFdRT2dZWUxEald6TVFqUlR0?=
 =?utf-8?Q?uFHTk8JwAT8A6YS0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <53C17C341B6D7148A7B3E85EE19D6D0A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7810.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f1a9d32-18f2-472e-afda-08de4ddd9cc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2026 11:12:14.6093
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UIqLRyS1e82yZe/pcO9wfEHvk8JL6B2BgiM+ZkswsajAvpZlpT0gWv1DOCj4E+ggo5PScxvSEQC6k1pFhv1ikHz28vb/PuJmNBLV3JPqi+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7908
X-MTK: N

T24gVGh1LCAyMDI1LTEwLTMwIGF0IDEwOjI5ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSWwgMzAvMTAvMjUgMTA6MTAsIEFybmQgQmVyZ21hbm4gaGEgc2NyaXR0
bzoNCj4gPiBPbiBUaHUsIE9jdCAzMCwgMjAyNSwgYXQgMDk6MjEsIENoZW4tWXUgVHNhaSB3cm90
ZToNCj4gPiA+IE9uIFdlZCwgT2N0IDI5LCAyMDI1IGF0IDc6MDXigK9QTSBBbmdlbG9HaW9hY2No
aW5vIERlbCBSZWdubw0KPiA+ID4gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3Jh
LmNvbT4gd3JvdGU6DQo+ID4gPiA+IA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEkgZ3Vlc3MgSSBj
YW4gc2VuZCBhIGZvbGxvd3VwIHBhdGNoPw0KPiA+ID4gPiANCj4gPiA+ID4gVGhlIG9ubHkgZm9s
bG93dXAgcGF0Y2ggdGhhdCBJIGRlZW0gdG8gYmUgbmVjZXNzYXJ5IGlzIG9uZQ0KPiA+ID4gPiBh
ZGRpbmcgYSBzeW1saW5rDQo+ID4gPiA+IG9yIHJlbmFtaW5nIGZvciBNVDgxODgncyBTQ1AgYW5k
IG5vdGhpbmcgZWxzZS4NCj4gPiA+IA0KDQpEZWFyIE1vdWR5LCBqdXN0IGEgcmVtaW5kIHBsZWFz
ZSBoZWxwIHRvIGRvdWJsZSBjaGVjayBpZiBhIHJlbmFtZSBvcg0KbGluayBmb3IgTVQ4MTg4J3Mg
U0NQIGltYWdlIGlzIHJlcXVpcmVkLg0KDQo+ID4gPiBUaGUgZmlybXdhcmUgd2FzIHVwbG9hZGVk
IGluIE1hcmNoIG9mIDIwMjUsIGFuZCBpcyBwYWNrYWdlZCBpbg0KPiA+ID4gRGViaWFuDQo+ID4g
PiBUcml4aWUsIGFuZCB3YXMgYWxzbyBiYWNrcG9ydGVkIHRvIEJvb2t3b3JtLiBFaXRoZXIgYWRk
aW5nIGENCj4gPiA+IHN5bWxpbmsgb3INCj4gPiA+IHJlbmFtaW5nIGl0IHdvbid0IHRyaWNrbGUg
ZG93biB0byB1c2VycyBmb3Igc29tZSB0aW1lLiBTbyB0aGlzDQo+ID4gPiBzZWVtcw0KPiA+ID4g
bGlrZSBhIHBvc3NpYmxlIEFCSSBicmVhaywgd2hlcmUgdGhlIEFCSSBpcyB0aGUgZmlsZSBuYW1l
Lg0KPiA+ID4gDQoNCj4gSnVzdCBhcyBhIGNsYXJpZmljYXRpb246DQo+IA0KPiBFeGFjdGx5LCBT
Q1AgaGFzbid0IGJlZW4gZW5hYmxlZCBpbiB0aGUga2VybmVsIGluIGFueSByZWxlYXNlIGluIHRo
ZQ0KPiBzcGVjaWZpYw0KPiBjYXNlIG9mIE1UODE4OCwgc28gdGhpcyBpcyBub3QgYnJlYWtpbmcg
YW55dGhpbmcsIGFuZCBpdCdzIG5vdA0KPiBjcmVhdGluZyBhbnkNCj4gcmVncmVzc2lvbi4NCj4g
DQoNClNvbWUgYm9hcmRzIHN1cHBvcnRzIFN5c3RlbVJlYWR5IElSIG1pZ2h0IHJlcXVpcmUgZmly
bXdhcmUgbG9hZGluZw0KaWYgdGhleSdyZSB1c2luZyBEZWJpYW4sIG9wZW5TdXNlLCBVYnVudHUg
b2ZmaWNhbCBBUk0gaW1hZ2UsIGV0Yy4NCldlJ2xsIG5lZWQgdG8gY2hlY2sgd2hlbiB0aGVzZSBk
aXN0cm9zIGNvdWxkIHVwZGF0ZSB0byB0aGUgbGF0ZXN0DQpsaW51eC1maXJtd2FyZSB3aXRoIHdo
aWNoIHZlcmlzb24gb2Ygb2ZmaWNpYWwgcmVsZWFzZS4gRm9yIGV4YW1wbGUgDQosIHRoZSBDRCBp
bWFnZSBvZiBUcml4aWUsIExFIDE2LCBVYnVudHUgMjUuMTAgKGFuZCB0aGUgY29taW5nIDI2LjA0
KSwNCmV0Yy4NCg0KTWF5YmUgdGhlIHdvcnNlIGNhc2UgaXMgdG8gc3VwcG9ydCBhIGJhY2t3YXJk
IGNvbXBhdGlibGUgZmlybXdhcmUNCmxvYWRpbmcgaWYgdGhlcmUgaXMgYSAnZmlybXdhcmUtbmFt
ZScgZXhpc3RlZCBpbiBzb21lIGRldmljZXMgYWxyZWFkeQ0Kc29sZC4gSSBndWVzcyB0aGVyZSBp
cyBvbmx5IGZldyBkZXZpY2VzIHN1cHBvcnRzIENEIGltYWdlIGluc3RhbGxhdGlvbg0KaW4gcmVh
bCB3b3JsZCBkZXBsb3ltZW50IHdpbGwgYmUgYWZmZWN0ZWQgc2luY2UgdGhlIG11bHRpbWVkaWEg
c3VwcG9ydMKgDQpqdXN0IHJlYWR5IGEgZmV3IG1vbnRocyBhZ28gaW4gdGhlIHVwc3RyZWFtIGtl
cm5lbC4NCg0KPiA+IA0KPiA+IEl0J3Mgbm9ybWFsbHkgdXAgdG8gdGhlIGtlcm5lbCBkcml2ZXIg
dG8ga25vdyBhYm91dCB0aGUgZmlybXdhcmUNCj4gPiBmaWxlIG5hbWVzIGFuZCB0aGUgb3JkZXIg
b2YgdHJ5aW5nIHRoZSBwb3NzaWJsZSBmYWxsYmFja3MsIHdoaWNoDQo+ID4gaXMgZXhhY3RseSB3
aHkgSSBvcmlnaW5hbGx5IGFza2VkIHRvIG5vdCByZWx5IG9uIHRoZSBwcm9wZXJ0eQ0KPiA+IGZy
b20gZHRiLg0KPiA+IA0KPiA+IElmIHlvdSB3YW50IGEgc3ltbGluayBpbiBsaW51eC1maXJtd2Fy
ZSwgdGhhdCB3b3VsZCBnbyB0aGUgb3RoZXINCj4gPiB3YXksIHBvaW50aW5nIHRoZSBvbGQgZmls
ZW5hbWUgdG8gdGhlIG5ldyBsb2NhdGlvbi4NCj4gPiANCj4gPiDCoMKgwqDCoCBBcm5kDQo+IA0K
PiBDaGVlcnMhDQo+IEFuZ2Vsbw0KDQpEbyB3ZSBuZWVkIGEgZm9sbG93aW5nIHBhdGNoIHRvIHJl
bW92ZSB0aGUgZmlybXdhcmUtbmFtZXMgaW4gZHRzIG5vZGVzPw0KSSd2ZSBtYWRlIG9uZSBwYXRj
aCBidXQgbm90IHN1cmUgaWYgd2Ugc2hvdWxkIGtlZXAgdGhlc2UgcHJvcGVydGllc8KgDQppbiBj
dXJyZW50IGR0cyBmb3Igb2xkIGRldmljZXMuDQoNCkJlc3QgcmVnYXJkcywNCk1hY3BhdWwgTGlu
DQo=
