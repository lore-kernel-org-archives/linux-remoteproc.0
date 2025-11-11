Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012051.outbound.protection.outlook.com [52.101.66.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1360A2D979F;
	Tue, 11 Nov 2025 16:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762879547; cv=fail; b=iCsBqvhOG0JtQ/1N4Dgw9Usdan4fWBk2Zphryk6NSd5iCXmEcaxEhlqo4Kt/jHKdWzDz23GhjUGmnm6xTILNP33dSVhsxkML+fg+dsF8VrG5AGqX80cGw8n6zgdHHucs1095ymNFjVx8LoLk1QuYFbDBKc5GOBJYj168KJgszBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762879547; c=relaxed/simple;
	bh=E/w/f3ElvAMk+xhqaLzPbNwkMkHyNg/kBdzMMhv9VYw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BDJwFS5WqJp8QClBEVL8aUyE9ShGMoeGYZ/AsRSduPk7Z2SlPWvAdtzlnfXgyiiZfM45K6uQyGJ5bCXFYn0XpK41Qm1J8BAXdCyJU2TfBepjQey0unYpA5mOlS2Cb6WLAaMmpWQBPeNnk8VzV20zZDvCJYqgAHKFbPbUbXQioV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Jemn/gUe; arc=fail smtp.client-ip=52.101.66.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Jemn/gUe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RlKXWX57zVucodSXyQ8u+AumE4bIY0B6nr3r4xNWeA4RCqhFwREGFuNESkuAoVVD58id5R9VNr5xL7Wn79KLBr1ImmvSgjTcoUhb8iRV/bEdhgz9EPdLnwiJKnWMCjgwP9d0TmicUrr7h60VheTrRLxOQbFJik/mwe0wo40J97mF8y9JOYnz+nVvLpuuBTMusC4Wq7OU/V/nWdqeIzs5MhTO4sUdGo3HA5Kx/ynHw/4yZSHLL64h/Ge51gpqQyuEWxq1I9W5F6vcXhxBXSULY/89OMsVQ2b8WIcwENlDtnd6KmHbci/Zh6SwpPeObYCGNPy5HAoTCTWuaqglkG8vGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/w/f3ElvAMk+xhqaLzPbNwkMkHyNg/kBdzMMhv9VYw=;
 b=HJgxz4jhUqiBiJjrBdzC3/EBsT32ck1OeLE4jryfnPu/bdoW90KoDyjBWQRN55mLwuWyDm51Ui7CYg1sPtAfYdX/MBYjEXjGwTOkTU79fFHwzEQZSoTRdNwbdo3J1oFY5GjvVnBppJSyrAuCo0Voh0YO3VA3Q2I63MG4GgBAIQzqUNGHuW4v6h+M7uYd9BuzmcJXVVaAfT7fIG4JCr972SVbFg6XXJfqJlGSUBgRBxmNkuPNmOO6lXl49WagaWxB+h3ztEWgo4HUmACIK1A9gZyM3NYa1QAQcCX/gzYVkcZDZmZ9+Wj7HD9SGjYP1pWWMMPWg8oRlRDCmJSU7lci+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/w/f3ElvAMk+xhqaLzPbNwkMkHyNg/kBdzMMhv9VYw=;
 b=Jemn/gUeDTk0YwL2XDCGyEbh3Y8dCQutdUixU7JpjlAPMyF9FxQMqV1aRyi8Sgk5HsmW4W0d15mj7kNuEu6SvdM5i5uHri3VdPPYx+4G75bwGE/X58FKqwOgYbyV5oSEKLiY4Mb6oNwLOa3yAFeLu0suYPZa8CWFqJ6mMSGfgfmHTMlaaWTT3w/fpHCfoGZg1UApzPkpEgX+ZsjLr59X12slBplWnlDd7ikjykytJc7BHxsY9gPesHpApkrMjLhbpSJNj+4iUd7hwoFr/dhjthWS5I48ScYYA+igQSYVeUjqFd9Ztj6h7EstHQoRRxQ4nLr2hnRDfLXb2lD7G0Yqvg==
Received: from AS8PR04MB9176.eurprd04.prod.outlook.com (2603:10a6:20b:44b::7)
 by PAXPR04MB8320.eurprd04.prod.outlook.com (2603:10a6:102:1cf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 16:45:41 +0000
Received: from AS8PR04MB9176.eurprd04.prod.outlook.com
 ([fe80::ba87:1cd1:53d9:fcd7]) by AS8PR04MB9176.eurprd04.prod.outlook.com
 ([fe80::ba87:1cd1:53d9:fcd7%3]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 16:45:40 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson
	<andersson@kernel.org>
CC: Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rpmsg bus
Thread-Topic: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rpmsg bus
Thread-Index: AQHcUyqdD62fMoDC1UaUpKR2foUN1w==
Date: Tue, 11 Nov 2025 16:45:40 +0000
Message-ID:
 <AS8PR04MB9176F105B09FF939B22B85E589CFA@AS8PR04MB9176.eurprd04.prod.outlook.com>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-4-shenwei.wang@nxp.com>
 <CACRpkdZR2C=+ssYOKnF=hyOqTakGjVxzp5_qz=3-uYRpzaZgNQ@mail.gmail.com>
In-Reply-To:
 <CACRpkdZR2C=+ssYOKnF=hyOqTakGjVxzp5_qz=3-uYRpzaZgNQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9176:EE_|PAXPR04MB8320:EE_
x-ms-office365-filtering-correlation-id: 7f61cfea-d911-4237-70b5-08de2141bfe5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z3ZzVXBSMjFicTF5WDlBazdNWFVEMURYTENwOTVXeW9tcmtud0xjU05BSGI2?=
 =?utf-8?B?V0YydE9DenVwUHc4L3dneEtwNzBGR2ZBczBCL0xTRlNKUHFxOXI4c2drVGh0?=
 =?utf-8?B?ck13bm5xUW5MYnlYdVBHK3UvSDJMZVN0Z1gwWno0a1lmemhLbmdsaS9VMUJn?=
 =?utf-8?B?SGFIY3BqWkorT2ZzRFpQNHhuWFk2SWNRVTNGb2ROUkV4WGZST3E1NEFkdGEr?=
 =?utf-8?B?Sk9NYUo2MEdnYU5jVW05MFpDMy9ETjN4aTJTemdVdmtHZkVHSGhEL25ESkJE?=
 =?utf-8?B?ajZCSGxzS2twSURvSmlJeDNZWCtUZ2UzN1RsdUoxQkRUazJ0dExHdHZjUkpM?=
 =?utf-8?B?TWlreURFbVBMQlZLU0liSHlmOTZnN2x0dndsUDR4ZzM1QTBCdXRWZVNiM0Rr?=
 =?utf-8?B?eTF3OG9adDdwdWFNK1pjeit3d001NFFoT0wwZElZWG44YXZlb2tmck1ZVUs4?=
 =?utf-8?B?di9LY1VuYXUwNzVSSFFYTXVidjdYUnRNQlZIS09WTGQ2NlZhY25yT0hmUXB6?=
 =?utf-8?B?cXlTcytINGpreUJvT1QxQ0Ntc3BTZ256Y0tXeUpBUDNKR0hZWUVhMmJjWlRl?=
 =?utf-8?B?VUdQM3VyaVdQVXVzbGhmZmhCTHVZVWRBZ0ZpcjIraEdYTktQSURBOUxLUGZo?=
 =?utf-8?B?aTE1eXNETFZZQ3NwQmM3OU9GOVR4TFZmZ0NDWU1iWXI3NFBXaitDS0g0M0FO?=
 =?utf-8?B?cm1NNTJPVGc5UFJTTzBUS0dwZVMxOVVEa09kYytja0Jic0FZN3o1aStLbXE2?=
 =?utf-8?B?cVgzS3htdGRuK1hjMjEvc0pqSFEzMTBMK1czUERjbjhYaFZ3WFlGWEMrSnNG?=
 =?utf-8?B?UDJmbm8xeUdXbXUrbC9FZzlZNDJsc1ZSZVU3N3g4Y2d4dFdPYkZFanUwQ2xq?=
 =?utf-8?B?NUY0b1d4MGw5aEFsRExzNlBYTG1uMVIxcG81Mm4yQWN2Nnl2Tys1a1FGOWsx?=
 =?utf-8?B?TkxjeEtSUitBSzNvZWo0ay96NFdzREJOTUl0dFY3cE05eVBZRG5KMVNta2hK?=
 =?utf-8?B?Umd1Y1hnRkdQNm9VSnJjaUNWRXZQNWNwNUtlZTRoOUFCdHFlODV5cDRrYjc2?=
 =?utf-8?B?V0Y4bHoxeDYvZmw3RjdWSEV4blN4cGhzK0tnRVVjRXU1M3VPMnNla0dpSEFs?=
 =?utf-8?B?QWJPTjNTa0theGNGR0NTTEpOdEg0Q3VhSU5WWXpmVUVQbEU1dGs4TGNPZUdM?=
 =?utf-8?B?UVEydkNqenpkaUkrVHJIVlBSWXczQTkzSDJNem5Ua0YrYzBUd0R5YUd3RUFK?=
 =?utf-8?B?a0wyMzdJbmFXS1pLeGFsZTd0NENXdDkxajlxTjBoZC9ualhSMUlmYm0wQ3Fo?=
 =?utf-8?B?Wmg4M2ZGRmkwbVJ0WHlrWmI3YTFTY1Z5bjNiWVFvQ2lhNTVCU29Ec3ZzZHh0?=
 =?utf-8?B?NmJDaEIxc1gxMlZEaHFHblFKYUpIa093VmVNY01nM3dKOEdjSWJJeGw3akxS?=
 =?utf-8?B?SEwyU2JCTUU0YXNtL3M3enU5Tlo1OTdwMUtZR3d4WUVmeGJRUENRWnlFWU1C?=
 =?utf-8?B?djZrckZMUzdpenZnRm1PNjNteVU4VDRHbGo3Smw5eUlOV2lYcTFYVzUwTDN2?=
 =?utf-8?B?WDEvYzd1bWRuYUlFMk5Rc0MyMzBlUUxROEJvSC9JL21rUGtmejBPUmFIbm1j?=
 =?utf-8?B?TnIvV0lVLzI1T0lmVGRLa1FaL2lCVDFnNnNKY2RiaFhCa0M4V01yZU1BS3pF?=
 =?utf-8?B?d3Y2RlA0b0RqbmtGcDVHNm5JS21UUkRQakNHQ2NXWURUS05qMy9SRG1ZVWU5?=
 =?utf-8?B?QXgwYnptQnpYTU4rb01EdmhmNUZxZElocTI4QTl2aTNYTDRFYVBxTklZVU9r?=
 =?utf-8?B?Q3E0ODJweUdXODlBbVJ3YzlqVzNQdWN6UnRwdXJDcVRhL1BTKzVNczdxcFQ5?=
 =?utf-8?B?M2RVRUJhaU04Y2RTcVQyZjcvRm9DQTRGYmxHa0RBdjF5QVdtWFRaL01RcUVK?=
 =?utf-8?B?dmxNU1JLNFRidGh3OW5wNERKbWFYYjh6Z2lZSmF1bVZRSDVnY3hzaW5VREYx?=
 =?utf-8?B?Rk5SeGxTNXUyMVR0Y0EvTU13VE1jL1M2ZUlhb253VTJ1OUFZaitEbmV6U2Iw?=
 =?utf-8?Q?s2pmIg?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9176.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RDI1cFpFTWpFWlhxOU9DOE5CckNkV1FrVzJPNFI4Q1g2UUVFYVBINVhRdTFi?=
 =?utf-8?B?anpWNjhsZnlCUk9VcmVwQjh1aG1aQWo1eStvR09mcyt5S1dVY1ZCV0h3aVl0?=
 =?utf-8?B?R2V5R29TK1RlNnl6ZXN3RTFKQXVlbUdYbzNXOHpoWW16WStKU0UwbUdLUysr?=
 =?utf-8?B?ZW5LM3lKYXRLT1JsQTFEdUhORFo5YktXVHNRSllub2ZxdEV6K1ZJM0h5aWd0?=
 =?utf-8?B?ckpaZmVFNkc3SFB0SXhxYnFvVEFrN3Z5T1VhaGtDZzJNS0ovN0grN2J5M3lv?=
 =?utf-8?B?M3BHSTVCZXJlWENjTjRpZGdGRW00TmkrbXJXU0lTWUxrN29QMkoyTFJkZjhW?=
 =?utf-8?B?QURsOXFLQ21kYUVCQ3p0bzY1R2kzWnQ2TEkzckRaVmF3ZldZd1dDWTRpSjJm?=
 =?utf-8?B?Sk5yL25WL2gyYlFVRkl1cUdmSklVUC9RL1h2S0p4RWNaTXlpUnVna2x1T3dU?=
 =?utf-8?B?T3Nrekx2RTdHYm9POHE4QUp6L3czc1pmVE1xeWNyeGRTc3hZekFtT3lpTy9v?=
 =?utf-8?B?bG93R1dWRzF4alF1djg5ZHZWc0IyTVluMG5kakN5OUtrSGJPYjFMQTN4NnEr?=
 =?utf-8?B?R0VxMzF1VU1uZDBZOVJzM1NKR1AySzZqUHJvRGp4bmt6WFQvY3NTd1o5ODJD?=
 =?utf-8?B?NzA5ME93WXRWaUwzdjJwZllWbTEzRWpxWHpWcVlLMG5zNE9MbWhONU1aU1Iv?=
 =?utf-8?B?aExmdG5WQTVEV21LakpmOUtkMWY1MnFJRTVtWHBBeTR0cjFPaGN5YWEweC9q?=
 =?utf-8?B?TEU0aVRNM0VCSlZrT1NSd3AzVG1RVlJtaWhwUGdRdU45NnlTQU1GbDlYSzlM?=
 =?utf-8?B?ell3ZGE3bVdBS1BZdTRhOGpWYnZLNnlzc0IvOGNaTlNYZzFWaEJOUWhCZ2pC?=
 =?utf-8?B?SDlSY252ZjNYYklUNEM1MjYzZHYzVGFPM3dVOFpGLzI1UzhMcHlVcUNQRWw5?=
 =?utf-8?B?bGRVeExjaDV5ZFNNV3Y3cGwwT0lYb2JzK054OTlzV3VLa201cVZESUovWDUv?=
 =?utf-8?B?SXdkSW02WEo4UEdhTVlUbVVlMUtDRThQMTNJUWd1Qzc1dmNoYjNsa2JqWmNh?=
 =?utf-8?B?YytveUwxWWtEOVEybkVaM0g3TzF3SmdaeVBEL1N0cVRxQjNDVFZNZDhrbG9K?=
 =?utf-8?B?K3JvRWhIb0l0TWVVTVJub29VcHRnZDFFc2ZhQlhQeVl5Q3BUaE1QQXpobFNI?=
 =?utf-8?B?di9KdENHbzFiVkZRYlVXVXpSbkp6aStxUFZzYjdZZWlpekpzYW9DNXgxeHpz?=
 =?utf-8?B?YVNiU1dzOXBlc0x3NnlnZ3J4akt3MDczVlNiNTVZWG1iT0p0eXhySlNQclpR?=
 =?utf-8?B?WEE5eU1CM1gwK0NJTndGdEFEK2lBN1JBdC8yWFhnR21TQ3hOWW9rSDVxYXhm?=
 =?utf-8?B?K25LU2VDU3VON3pITERqMkJJeUVkRG5VdE9oYmxPK3BkbERBWHM0aWU2SmhH?=
 =?utf-8?B?eHRHMGxycXVjb0FIQW04UXlUMDVlWHRqZ0UvQnJJU1RoQWJBbkpXMm0vQ0V0?=
 =?utf-8?B?NEhUQ2pxOHduRm4vWmdjQ1luODlPYnJqYXREYjd3Wi92SktGWTRKY08rcVlS?=
 =?utf-8?B?MHRKNTlaOFZidTd3N2hBV2xMY1N6TDQ0cmVWNlRIdkdzTHBwSU8wa1NqN3BK?=
 =?utf-8?B?T1B6bTZrS3R1VjFacVp4K0h0N05KWi9TU3pVcVA4S0x3QmxLWTFZTytQL09s?=
 =?utf-8?B?R0ZGaUxkKy96N2YvdzNONENyY2NHaUxIMHJwWnErQWkzTk90L3hZY0dQMVor?=
 =?utf-8?B?Z2ZzQnU3QTlpejZ4VUsveVBJRUQxby9XUVEybU5vc2l5bkJBUmsrekM2QmxU?=
 =?utf-8?B?bGl0OE5OanQ0Vm9zSEhHVjRDVmY3SkNRYVJ3VVIxSy95bS9PVGoxcVhxdzRN?=
 =?utf-8?B?Q2ptbXpqVDlkMHdkOStleWRUY1pxYkEyWG5BTFZQVHJFN0haMW81enhaMkZl?=
 =?utf-8?B?Q2xFdCt6L1I3SStoazlnbUszbEIxTW5NYUphU3dRR2NPSWtMc0hyYWp3QS9R?=
 =?utf-8?B?VlpoR1JzMGVwSHAwRklZb0Q0MjRaZ1VFSHB3OVVXdlhEcTdPU0JCclY3eWJi?=
 =?utf-8?B?ZHkrdVVYMnJlZmtpMHJ2dW00RVZ6VEpMcWZ4NHErSHVTVWhvbDYxRUdreDJ5?=
 =?utf-8?Q?wlpP+R3wGC19ok6VIVK3F4L8f?=
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
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9176.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f61cfea-d911-4237-70b5-08de2141bfe5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 16:45:40.8866
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: agHZMlCmwwSLFaO/fTRBnuttQNSadBRqYRpyldeBoDTRoxAaC8b4WUsXm1YROg1WbSed4qWFFlB4A/pEDRrVlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8320

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGludXMgV2FsbGVpaiA8
bGludXMud2FsbGVpakBsaW5hcm8ub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBOb3ZlbWJlciAxMSwg
MjAyNSA0OjM2IEFNDQo+IFRvOiBTaGVud2VpIFdhbmcgPHNoZW53ZWkud2FuZ0BueHAuY29tPjsg
Qmpvcm4gQW5kZXJzc29uDQo+IDxhbmRlcnNzb25Aa2VybmVsLm9yZz4NCj4gQ2M6IE1hdGhpZXUg
UG9pcmllciA8bWF0aGlldS5wb2lyaWVyQGxpbmFyby5vcmc+OyBSb2IgSGVycmluZw0KPiA8cm9i
aEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6aytkdEBrZXJuZWwub3JnPjsg
Q29ub3IgRG9vbGV5DQo+IDxjb25vcitkdEBrZXJuZWwub3JnPjsgU2hhd24gR3VvIDxzaGF3bmd1
b0BrZXJuZWwub3JnPjsgU2FzY2hhIEhhdWVyDQo+IDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPjsg
Sm9uYXRoYW4gQ29yYmV0IDxjb3JiZXRAbHduLm5ldD47IEJhcnRvc3oNCj4gR29sYXN6ZXdza2kg
PGJyZ2xAYmdkZXYucGw+OyBQZW5ndXRyb25peCBLZXJuZWwgVGVhbQ0KPiA8a2VybmVsQHBlbmd1
dHJvbml4LmRlPjsgRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPjsgUGVuZyBGYW4N
Cj4gPHBlbmcuZmFuQG54cC5jb20+OyBsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZzsN
Cj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGlteEBsaXN0cy5saW51eC5kZXY7IGxpbnV4
LWFybS0NCj4ga2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc7IGxpbnV4LQ0KPiBkb2NAdmdlci5rZXJuZWwub3JnOyBkbC1saW51eC1pbXggPGxp
bnV4LWlteEBueHAuY29tPg0KPiBTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENIIHY1IDMvNV0gZG9j
czogc3RhZ2luZzogZ3Bpby1ycG1zZzogZ3BpbyBvdmVyIHJwbXNnIGJ1cw0KPiBIaSBTaGVud2Vp
LA0KPiANCj4gdGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gQWxzbywgYSBiaWcgdGhhbmtz
IGZvciB3b3JraW5nIG9uIGltcHJvdmluZyB0aGUgc3RhbmRhcmRpemF0aW9uIG9mIHJwbXNnIHNv
IHdlDQo+IGNhbiBnZXQgc29tZSBvcmRlciBoZXJlLiBUaGlzIGlzIHZlcnkgaW1wb3J0YW50IHdv
cmsuDQo+IA0KPiBPbiBUdWUsIE5vdiA0LCAyMDI1IGF0IDk6MzTigK9QTSBTaGVud2VpIFdhbmcg
PHNoZW53ZWkud2FuZ0BueHAuY29tPg0KPiB3cm90ZToNCj4gDQo+ID4gKy0gKipNYWpvcioqOiBN
YWpvciB2ZXJzaW9uIG51bWJlci4NCj4gPiArDQo+ID4gKy0gKipNaW5vcioqOiBNaW5vciB2ZXJz
aW9uIG51bWJlci4NCj4gDQo+IEknbSBub3QgY29udGVzdGluZyB0aGVzZSBpZiB0aGV5IGNvbWUg
ZnJvbSBzaW1pbGFyIGZpZWxkcyBpbiBvdGhlciBycG1zZyBkZXZpY2VzLg0KPiANCj4gV2hhdCBJ
J20gdGhpbmtpbmcgaXMgdGhhdCB0aGUgZHJpdmVyIHdpbGwgZXZlbnR1YWxseSBoYXZlIHRvIHF1
aXJrIGFyb3VuZCBidWdzIGluDQo+IHRoZSByZXNwb25kaW5nIHJwbXNnIENQVSwgYW5kIHRoZXJl
IHdpbGwgYmUgYnVncy4gVGhpcyBjYW4gZW5kIHVwIHdpdGggdGhpcw0KPiBzaXR1YXRpb246DQo+
IA0KPiBtYWpvcixtaW5vciA9ICgxLDIpIE5YUCBpbXBsZW1lbnRhdGlvbiwgbm8gYnVnIG1ham9y
LG1pbm9yID0gKDEsMikgU2hhcnANCj4gaW1wbGVtZW50YXRpb24sIG5vIGJ1ZyBtYWpvcixtaW5v
ciA9ICgxLDIpIFNvbnkgaW1wbGVtZW50YXRpb24sIG9vb3BzIHRoaXMgaGFzDQo+IGEgYnVnDQo+
IA0KPiBXaGF0IGlzIHRoZSBkcml2ZXIgZ29pbmcgdG8gZG8gaGVyZSB0byB3b3JrIGFyb3VuZCB0
aGF0IGJ1Zz8NCj4gDQo+IFRoZSBzY2hlbWUga2luZCBvZiBzdXBwb3NlIHRoYXQgYWxsIHZlbmRv
cnMgdXNlIHRoZSBzYW1lIGNvZGViYXNlIGFuZCB0aGV5DQo+IGRvbid0Lg0KPiANCj4gSSB3b3Vs
ZCByYXRoZXIgaGF2ZToNCj4gDQo+ICoqVmVuZG9yKio6IFZlbmRvciBJRCBudW1iZXIgKHN1Y2gg
YXMgdGhlIFBDSSBvciBVU0IgSUQpDQo+IA0KPiAqKlZlcnNpb24qKjogVmVuZG9yLXNwZWNpZmlj
IHZlcnNpb24gbnVtYmVyIChzdWNoIGFzIFNXIHJlbGVhc2UpDQo+IA0KPiBUaGlzIHdpbGwgbWFr
ZSBpdCBwb3NzaWJsZSB0byBpZGVudGlmeSBidWdneSBmaXJtd2FyZSBhbmQgYXBwbHkgcXVpcmtz
Lg0KPiANCj4gTXkgYXBvbG9naWVzIGlmIHRoZSBycG1zZyBjb21tdW5pdHkgaGFzIGFscmVhZHkg
dGhvdWdodCBhYm91dCB0aGlzLg0KPiANCj4gQmpvcm5zIGlucHV0IHdvdWxkIGJlIGFwcHJlY2lh
dGVkIQ0KPiANCg0KSGkgTGludXMsDQoNClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHRoZSByZXZp
ZXcgYW5kIHN1Z2dlc3Rpb25zLg0KDQpXb3VsZCBpdCBiZSBmZWFzaWJsZSB0byB1c2UgdGhlIHJl
c2VydmVkIGZpZWxkIGZvciB0aGlzIHB1cnBvc2U/IFRoaXMgYXBwcm9hY2ggd291bGQgbWFpbnRh
aW4gDQpjb21wYXRpYmlsaXR5IHdpdGggdGhlIGV4aXN0aW5nIHN5c3RlbS4NCg0KKy0tLS0tKy0t
LS0tLSstLS0tLS0rLS0tLS0rLS0tLS0rLS0tLS0tLS0tLS0tKy0tLS0tKy0tLS0tKy0tLS0tLS0t
Kw0KfDB4MDAgfDB4MDEgIHwweDAyICB8MHgwMyB8MHgwNCB8MHgwNS4uMHgwOSAgfDB4MEEgfDB4
MEIgfDB4MEN+MHgwRHwNCnxjYXRlIHxtYWpvciB8bWlub3IgfHR5cGUgfGNtZCAgfHJlc2VydmVk
WzVdIHxsaW5lIHxwb3J0IHwgIGRhdGEgIHwNCistLS0tLSstLS0tLS0rLS0tLS0tKy0tLS0tKy0t
LS0tKy0tLS0tLS0tLS0tLSstLS0tLSstLS0tLSstLS0tLS0tLSsNCg0KV2UgY291bGQgYWxsb2Nh
dGUgZm91ciBieXRlcyBmcm9tIHRoZSByZXNlcnZlZCBmaWVsZCB0byBzdG9yZSB0aGUgVklEOlBJ
RCBjb21iaW5hdGlvbnMuDQoNClRoYW5rcywNClNoZW53ZWkNCg0KPiBZb3VycywNCj4gTGludXMg
V2FsbGVpag0K
