Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013063.outbound.protection.outlook.com [52.101.83.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA2B25A62E;
	Fri, 19 Sep 2025 02:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758247358; cv=fail; b=QA9xJlCuoqYMjilBTI4+12GPqCg8mQao6lutMa2Urv6i7A+7BRQuKXfY9nuWQaGRtiuGB3ouHFf/F7eUeTfObRfe2GM+6E6gj7XZfH4EC3RKht4+0aoJLqV/F7NJm9dqT8n4MqLn+R1G5N7O3N0MyPzyrsa9Ny07RP3s03VgfPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758247358; c=relaxed/simple;
	bh=puKurcyMyOmRKG47elUNd3aUUJ4WmSHnyiyr7+FDydk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=U+sA4lqq6JCq1EuhG6goqWS5ozY5q4UGLBl5HJXVV1IleWZm0me+8igoi0WUWUdq4/KNamfe6verDK/QQuM/Z+nRh9DbHlOjn7Lt3pDpaYFhEKWaQII6sWln/Bgwe5U3sREBOYdMMquiAA4lFbCSqX9L9MF+b2XordYpiD4PLUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MYu/+ful; arc=fail smtp.client-ip=52.101.83.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MYu/+ful"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nIDSFMHzcjTlFACny5wfFJuOTFCi3RJ4io5PTUGRCT5jhEuMbk866vesg80EXEagwor/tz0TZNlDk4Oxvi/7hCeb/NhgIGHyOC9SgorcQcdKLOIFw/QYuLsCqvfYfwNKELJ+7AsImz/v6t7e73VJMQ41j3aB9AZ2OdUqTJyT3dF2sw0jdKyyCJZaQ6UjaLk9qrCm5Q0i0ivDDpALSzTRogWRstznj0Lgpoq1Sg8/vZVvCweRiyxQ6d3fR4/Tnc19+XWfB51Jivju7N5xT0lyv7WZJLh9aPt4YnsBjaEGUlAfwF0VD2XBUhFg5gzj++91Xwa9JZLsXg3LqDHqghrlsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=puKurcyMyOmRKG47elUNd3aUUJ4WmSHnyiyr7+FDydk=;
 b=tlyhvpDNeTWV6EW58NxuwxH4RRY0fDqbm4tbwXmwuGRAsKA28f6WHc8YWpXzCDgglC3Q+fFL5quFXj2vaa2Mg9Z72jX/dbo8W6FYoRivlyJgK4RbrrKDhw5QqO/O9KqjMiUP2G1cJGklaLxJpxQBqwoaXZifXRjmXieJQoaLtU3NkhTh0I1CIhyuLos8R6r4+Awom0d7a9HgZNcEh37VRxFraV7MLMp7yoJl3GlJ9npfiGxhxW6nOcL0vXzVqNSnx9uc9zuC5d5UXbcUh3y8SfagrEZK5cXeeFMIWMj+M/Wxj9aKcd9sAvsm0ZrQcLhlCMJG/uoPS9AsHOpz1LjBLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puKurcyMyOmRKG47elUNd3aUUJ4WmSHnyiyr7+FDydk=;
 b=MYu/+fulIY4o/lGfQrfve533vgjRlOck44lnk6OrR3880HsgKITkTiYiJUBfp+Cv6nGhZbP7Bj9fDozSxqfKss781gYmUK/KjbxGy36FmbvpQKFn+MktYGHtjseGN/SkrDGeVzIx4P0Ylhsy5b415/mRFDJ/Wtnba9CB1ARL/1b0Hn0cJ2ZqG880m9sXDEKm+V+COEzEFjolmyTtuk357668MxCLA9KFFmWmkyng56GXrWKeOLtEuiAbcR/vyBnU5IlZo7WA5PhYRhnA7KBATEM3GzmU9BDxxVdpfZ02Zp2LQGt8iZCfB4kNK9AMAKiNvA+EM7iDeWSbWlN2TayV4w==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB7783.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 02:02:33 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 02:02:33 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
CC: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, Daniel
 Baluta <daniel.baluta@nxp.com>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/5] remoteproc: imx_rproc: Simplify clock enable logic
 using dcfg flags
Thread-Topic: [PATCH 1/5] remoteproc: imx_rproc: Simplify clock enable logic
 using dcfg flags
Thread-Index: AQHcKJKX19GN76/NtEqi97XmThDYCLSY35UAgADg5dA=
Date: Fri, 19 Sep 2025 02:02:33 +0000
Message-ID:
 <PAXPR04MB8459216DAA827DB05BF675AA8811A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250918-imx_rproc_c2-v1-0-deec8183185f@nxp.com>
 <20250918-imx_rproc_c2-v1-1-deec8183185f@nxp.com>
 <CAEnQRZB2ZkcRirj1SZkfbsPHyyGr5PfnCDfv+ZuMu_Mj6XKBEQ@mail.gmail.com>
In-Reply-To:
 <CAEnQRZB2ZkcRirj1SZkfbsPHyyGr5PfnCDfv+ZuMu_Mj6XKBEQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AS8PR04MB7783:EE_
x-ms-office365-filtering-correlation-id: 68b428f3-9273-44ee-3722-08ddf72098e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|19092799006|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?TEhiMzBxd1hkWlg5cUZia01idnByU1NrK0ZFNFhrWlhJSjdHZFExeFUycWw2?=
 =?utf-8?B?TGVFdUtHQi9tRVRBTGlmb0VTRnZxdnNpeGZBdGJWRFU5YkJVcjNmZkl1Q0xx?=
 =?utf-8?B?NWpXeEdhYTFPZjdyelZRSjVtQzhPc1BNOXdKMDdxWUNIUGRUd0ZuVEJwVnBB?=
 =?utf-8?B?NUxoZ1RPOGZZMXpjam55blF6ZDlVVitsMExGV2hCUEcxOHo4OEt5cmlvOFlV?=
 =?utf-8?B?V3BmTWppYk1OMzBVbElEeFBvOGVjdEpqNWFFQXA0RjVaMVFRNmYvdG5keGtn?=
 =?utf-8?B?a3g3K0VnSUlDV1NabThRNG8wN1pVQ0p6blFxVER2QWFTeWYzbjV2TGhyMTBh?=
 =?utf-8?B?WkloNmkvekg4eWNDMDR2b3dyZUxLRVk3cFNsRzFFMUJ3N3B1OTR4RWt2VHFu?=
 =?utf-8?B?Wjg1TG1xZDA2ZFJBK1cxZUVGelNlaUIycDFlSmJiZUFKWmFqYlRXV1ZHQlNw?=
 =?utf-8?B?dytEZDIweHBYL2FMTHh5Q3ZBdWJya25URm1oMjF2MTlpVjdLNmVDaXpiVGJy?=
 =?utf-8?B?cjlkR2gyc1crdlRiWXA5RG1MQ01HUjJYbDNHZ21uK1RvN0MvWnI1a1V2aDll?=
 =?utf-8?B?QVlnL3JzOGt1dHVsaEVLUlJyUUpPTjFzU1Q0YUNZSWdSb3BQVU84TGordzJZ?=
 =?utf-8?B?eEpsS3J0OGVsWGc2TjhJamlJckZuNnd0aHhpRTBKcVA1QS9lMzhIWDB0MmhT?=
 =?utf-8?B?WVp4UGx0alJlNVBoZzE4dTFaT0ViN212NGlJdkkwNGF1WWdybmFucjN2ZWhx?=
 =?utf-8?B?WHB3Rnc1V0x0WU1mT2FWMksvUmZSbW85bVFybXRjZVkxbDdiSzdoeUlHZWNX?=
 =?utf-8?B?UTc5SGhQbGIrTUJBWnNOT2wrR0JtSFRxK3duTVcvTlI4QWs3Tkp2Z24xeDNM?=
 =?utf-8?B?eWFDOFNtY09WMEV3L2JqVUhjb043dlJ1ajM4OHlnTjNkMGt2UUE4Ti85dmhj?=
 =?utf-8?B?WndQQmRhbEdXUkM3TFNrTXNnNzYzNjhJWS9qbjhLYm42VXlkbUdKUHZtOW9C?=
 =?utf-8?B?aFlpd3kxWnZxTTltcVVEYlY2YTdOYW1UdkRjQk41RW5FOFYwRkZ5dlRsYU1S?=
 =?utf-8?B?UDFpVGVPY2hONXBMTkZpY1p5bEVxbzlhQzB2TXlVMmpKL3ZMOG9zY2dKV1VU?=
 =?utf-8?B?RGExZ21UY1kzRWlpVUdFeDliL00yNCt5T2J5TjByT1NkWlVjTlJCZ0F5MVo1?=
 =?utf-8?B?a01ZeXNKNHhnOVVrM2tZWDd6TzFOUmhBQ2VhZy9rbVdWVmluYkpSejN1ekZV?=
 =?utf-8?B?SkREM3NsekU2OE0yZHlXMHN0RkZuNFBKNGsxajFtQ1NiK2Q3SitBczMycHRp?=
 =?utf-8?B?SVBQTS8rQnkrd1VKd1FUVnlYRXdWYXR4R1A4VS9CL0xPMWcvMno3TndhaC9P?=
 =?utf-8?B?TUhaYzRHSkRzQlVOQUFhSm1MT2thOHVPNW1UUlhUU1UyR1BSUC9zbHhlQVdw?=
 =?utf-8?B?UVVoYXd3VlBDTFdKMzZyQ2E4ZTdEVDNKT3FvWUxrV1JCSHhZYTF0cWo2YTli?=
 =?utf-8?B?ZkRSWWx0dHdmVmI1eS80R00yWGwxeW14dTNnYmtZUlRER2lWZEczTUt6SW8v?=
 =?utf-8?B?OWxwZms3M2ZzZ1c0MGdMRllVZlEvTDZQZ2RWbFMyS2NtZTRyeWh1VTBoUlJO?=
 =?utf-8?B?MWxWK2hpZ3UybjdUdEhNdmpmZmEzZ1NKcURFS2N4QjNQejg3TndWNFN3Z0VC?=
 =?utf-8?B?UXJJUk9KODhQa2h4UUlHaGJVcmZSKzlCZSswenFabys0cnRjb1U4WjlQN3Ny?=
 =?utf-8?B?dXFpWVFGd3BkUXQ4dHVhcFlGKytWK1pJSytFMmJ4ZVpTS1dJZUtMQnFRVndz?=
 =?utf-8?B?NW1OYThuYjFmM0xGV1U2MHdwQThEbTJFYmRFa2dyNHNpUlNGMXMxWDlIM0t3?=
 =?utf-8?B?WE1ESFkvcWR3Q2dLc2NyVUIrYk5GUjBuOXJKaUhlY2lSa1pqSjZrdmdIQnE0?=
 =?utf-8?B?amE4UzNqd1hzNnBlbWJUbEVxTUdrdzRVbnpuNnVyUTJIb3F3UHpSUDZRUlZM?=
 =?utf-8?B?Tlo4UXVIWHJRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZEZvbldLTXFwaUtLODdxZjB4NlpwWnhNeE5yZFJNdWQvck92U0lTbEtLV0F4?=
 =?utf-8?B?OUlNRDl3SCt2T0M5MjVxWm10M2lrcTF2VklXQ1MwaEhFZnEydnBjTG1ZM1dn?=
 =?utf-8?B?VzdYc3d6QWZDVWdnYklaVTUvdzV1QWF4dDZZeTh2RWoxMzR2eDZkU3dUblJy?=
 =?utf-8?B?VUE5cE5vSytwajZhY0RrNUxZWHhmeHVUa3dMUStvRmY2TEpDS1pZdU1uNlB4?=
 =?utf-8?B?OU1rb3BBOWdMUGJFck9uQXB3emVqQVFqVU5oVHhQZHZ3UUk3Q05WRHFRaHAw?=
 =?utf-8?B?dW1JQnVORmpvdVRBb3BmVWxNclVHVzFaNllrM1hWYnlYbzdiRDZ0UkZTTm5u?=
 =?utf-8?B?aDRXY1MydmRyTXV2bm13a1BaWGFDY002Q0daU2h3MEJ3a2M1RkY1ak5kYlRl?=
 =?utf-8?B?enFCUHArRWRrT3V5WFh0WUtPODRrSzZDVTN4dlRCSXpQWkhZZ3c4TnU5NWxs?=
 =?utf-8?B?bVU2WEYyK25mTDBNTklHcW0vUTFxaFVyYTNWVFE1TERGZzROUGpMWitLcTcw?=
 =?utf-8?B?T3Zmd0dmUjZuQ2dkUUx5M3diakNiL2VQdlYzcFFmT05qRXJpYU9ZaVh2K2t3?=
 =?utf-8?B?aXFPVzhpQnQvSTl0T2NveE5RZkRLMS9oc0lKUndpdHdRN1JQN01hU2lvK09D?=
 =?utf-8?B?RjV2aDNDcDhucVdydjVtL2ZpdzgvZTJvY1A5OWQyTDNRZjV0Tng3RThjb1Vn?=
 =?utf-8?B?Mk5uck9jQlNJL2tURSt6SlFIK2Q2VWs1TEI2T0pQZFgvQnM5bTgxWmZlOVJF?=
 =?utf-8?B?TFFFdkhQVnVmSnNZVlFIbzJwVG13MlpyQlA4cTMrZS9ZV0FURjFmV09pbzRs?=
 =?utf-8?B?VjRTclJUTTV6bWVENFZ0VDZOOFdpOTlNQmZsbEZBVHh3TkhPZHlSYVVKa25q?=
 =?utf-8?B?NzFmbXFLSnBpRGgvbFl2OUR1T3hYKzNXUzhVRGovNlZMeWFhQ1JLaG1PL0Q5?=
 =?utf-8?B?MS8xcC9BVkVUMHlLb0NTQWNyR0o4RmFBUVgzNE4rbHp3RWJkV3p5dUFCQVpZ?=
 =?utf-8?B?cW9mVVZyTTNra01JMjljZzl2cWQ4Wi9iNEZNakRTR0pwVUtVSnk5cFJkVXJo?=
 =?utf-8?B?a0RacWJSR3poMytyMlY1K2pwYXc1QnlzeFNZRC9iOXJaYzF2YmU4TWZnSk00?=
 =?utf-8?B?OEIzczRpN3BuY3dwbmhEVFRJamRrY1RvemRucWpqbkxCUDZlRFdQMS9pTGVP?=
 =?utf-8?B?aGhPZGRiTFd6RW8zQTBRSFNab0Zyc0dJaGZFSTUxdkVJK2dDNVNWdXZJVHNG?=
 =?utf-8?B?UmVYVUwzRW5ZRlRpMUxBeE5hdENUeEtSQk5DMk1tV2pLMVJDcEFOVHk4TUIr?=
 =?utf-8?B?SStNNk9GZVpIeGxIWk1DbHo0QVhTVUw5TFpoU1hGNXJTVWZPcitzc1BTQlpZ?=
 =?utf-8?B?N1hsd3RTZENrSHpaNG9SUVRhVjlCYkxtZUVYMlVsS3FDRUI1QlZGbWxsTERs?=
 =?utf-8?B?dGRFS2JVRm11TVJSR0k5MDZQUnB6SUU1QjV0aGVyNnVjbXhDTlh5MytYWHVl?=
 =?utf-8?B?ZGpvcTVGaEh0N05Yb2UxSldNWVg3bVBZdjBFU2krYlN4MTR5TEhrdThFdXU4?=
 =?utf-8?B?OW5SZHpxSEY4bkRjNHczYmUxMWVTZm1vbXNJZVQxbUVJb0k1NW9YWk8zN1c5?=
 =?utf-8?B?amd4QUlDQWt6aldmbUM0aEYrajZOeG9WSWxWUTEwVTdEOERNV09mOEViRWJ4?=
 =?utf-8?B?TWI3UUVWS0RXZWFGQkpyNSsrOGQwUk4zWVFXK21YL3V6MGNTTGwzY1JJNTVz?=
 =?utf-8?B?N2NZalpaTTg1eE00eVpJUXVQOWQ1RE1ISkVFQ2hubHhtWVhxTGx6NktUTVJw?=
 =?utf-8?B?aVU4bGRERVBmZkNxZzZrcGRkQkk0R2dSd25seE9FbkJBcTQ2OUlqU3I1YWJR?=
 =?utf-8?B?ZDJKR04zMWN2YzZ5cnhFQ3JrSkIrNEtVOVJLRndUeDJkcmYvRFlZQmEwTktZ?=
 =?utf-8?B?M3ByTmN4ZXlVSUVaMlJPWWozYVdZSHZkK2RTSVZHNCtVdElLRnN4WHp4S3d1?=
 =?utf-8?B?cGNpd2U3TFhxd3hHeDgvdWdpbUNKK2xzWXlPaFladFBJZmZ4OTEyT3NjZXh4?=
 =?utf-8?B?VndZc3FyTGNxZzNlL1lSVURsMTZSNWhHZlh5ZFhwTEVudzd1ZWFPTCtFR2JI?=
 =?utf-8?Q?vLQ8=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68b428f3-9273-44ee-3722-08ddf72098e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2025 02:02:33.2176
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X85ej3T1RChTjbEdulUvV+gqEWpgUH1BTWtW4dh3Rmx+iHkI6pSOM8/yYgpPbnS7lUq8SpLY3dH3Vz0NInjFnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7783

SGkgRGFuaWVsLA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS81XSByZW1vdGVwcm9jOiBpbXhf
cnByb2M6IFNpbXBsaWZ5IGNsb2NrIGVuYWJsZQ0KPiBsb2dpYyB1c2luZyBkY2ZnIGZsYWdzDQo+
ID4gKyAgICAgICAvKiBSZW1vdGUgY29yZSBpcyB1bmRlciBjb250cm9sIG9mIExpbnV4IG9yIGNs
b2NrIGlzIG5vdA0KPiA+ICsgbWFuYWdlZCBieSBmaXJtd2FyZSAqLw0KPiANCj4gSSBzZWUgdGhh
dCB5b3UgbmVnYXRlIHRoZSBjb21tZW50IGZyb20gaW14X3Jwcm9jX2Nsa19lbmFibGUgYnV0DQo+
IHdpdGggdGhlIG5lZ2F0aW9uIE9SIGJlY29tZXMgQU5ELg0KPiANCj4gU28sIHRoZSBjb21tZW50
IHNob3VsZCBiZToNCj4gDQo+IC8qIEhhbmRsZSBjbG9ja3Mgd2hlbiByZW1vdGUgY29yZSBpcyB1
bmRlciBjb250cm9sIG9mIExpbnV4IEFORCB0aGUNCj4gY2xvY2tzIGFyZSBub3QgbWFuYWdlZCBi
eSByZW1vdGUgc2lkZSAgRlcgKi8NCg0KSSB0aG91Z2h0IHRoaXMgZmxhZyBpcyBjbGVhciB0aGF0
IGNsayBzaG91bGQgYmUgbWFuYWdlZCBieSBkcml2ZXIuDQpJIHdpbGwgdXBkYXRlIHRoZSBjb21t
ZW50Lg0KDQo+IA0KPiBBbHNvLCBkbyB3ZSByZWFsbHkgbmVlZCB0aGlzIGZsYWc/DQo+IFNob3Vs
ZG4ndCB3ZSBqdXN0IG1ha2UgYSBkZWNpc2lvbiBiYXNlZCBvbiB0aGUgZmFjdCB0aGF0IGNsayBp
cyBpbiB0aGUNCj4gZGV2aWNlIHRyZWUgb3Igbm90Pw0KDQpGcm9tIGhhcmR3YXJlIHBlcnNwZWN0
aXZlLCB0aGVyZSBpcyBhbHdheXMgY2xrIGZvciB0aGUgcmVtb3RlIGNvcmVzLg0KU28gRFQgZGVz
Y3JpYmUgaGFyZHdhcmUsIGEgY2xrIHByb3BlcnR5IHNob3VsZCBiZSB0aGVyZS4NCg0KQnV0IE5Y
UCBzeXN0ZW0gZmlybXdhcmUgbWFuYWdlcyB0aGUgQ0xLIGF1dG9tYXRpY2FsbHksIG5vIG5lZWQN
CmRyaXZlciB0byBkbyB0aGF0LiAgU28gdGhpcyBmbGFnIGlzIHJlcXVpcmVkIGhlcmUuDQoNClRo
YW5rcywNClBlbmcuDQoNCj4gDQo+ID4gKyAgICAgICBpZiAoZGNmZy0+ZmxhZ3MgJiBJTVhfUlBS
T0NfTkVFRF9DTEtTKSB7DQo+ID4gKyAgICAgICAgICAgICAgIHByaXYtPmNsayA9IGRldm1fY2xr
X2dldF9lbmFibGVkKGRldiwgTlVMTCk7DQo+ID4gKyAgICAgICAgICAgICAgIGlmIChJU19FUlIo
cHJpdi0+Y2xrKSkNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9w
cm9iZShkZXYsIFBUUl9FUlIocHJpdi0+Y2xrKSwNCj4gPiArICJGYWlsZWQgdG8gZW5hYmxlIGNs
b2NrXG4iKTsNCg==
