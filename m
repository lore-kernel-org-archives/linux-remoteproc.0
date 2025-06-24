Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011062.outbound.protection.outlook.com [52.101.70.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE09A2868AF;
	Tue, 24 Jun 2025 12:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750766434; cv=fail; b=lH/WGtRif6BKtDmtSwyaVmGfDm0L9xAlJKSDewWSVHYpsDRPY8arK4U6atbBMC/HhoGLLhKq3ePMZVxsvbjMvUlTpZcBFRiXLquF29PAzzB0GUBT2GjxSgHFFfDEMV69zGPkxUaXiww1Z0FFLFin8BYJpUwe5u3WyCH27GaB+Qs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750766434; c=relaxed/simple;
	bh=WHHk1NqY/jhnFcqzbnXbrbz+9vbED7nBGYBfyonxwo8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hXZiKEC+0tFIGWKTpppsuncxvSbUJMVu6txUbXG4qYPN/IQZDx+8euxyh0Tl4ZqKdIY4FLcvmkUygA2wVgyGBn8snSjY4PKcjUZ5JquK0zt+phLIXEfEyrPuP41e0on6fn7cj8uQMr3X22tFRIM6tvU29fP7iw5tbUoV+zAnAl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ui/qT41u; arc=fail smtp.client-ip=52.101.70.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ui/qT41u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EY4KTw7m0sET70j4pDEZjgcyEnmBbghc83F5oFYKbLm5PBlKI6rnE8A6RWytin1E7InQWtpOHC9VNQUi/71muSj8MkwSdhM0zQAiwK9v7A2de2iomIyLEq8IFfmvcckRHSCatplprd6dVfR4LoLn6t0qrEt2ChLSeQEd7bjCHfRAIYg2YPJhJLLKGM9V5FVJxYF/9yEtjnxDWRgI1BrEsDLX+ur8en+e9UroNmH8OXm8P7DQ9BJwVPhHhVs7nK3A/jc/rY1naV6MZ3urw6TM+MCNBOpxCA7SD5tV+4aYxhIkuQeYVDTsoDGnjW9vgMSJNMSO/+ptWSIauXPetLnxEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHHk1NqY/jhnFcqzbnXbrbz+9vbED7nBGYBfyonxwo8=;
 b=ZWtztIqIajsAPF6D3lmbB4Zjc/W7AQ6tHduxRS4MaEOpJCJSIHZ8dawy8u5l6nY07zuON5uaW4lbSJmglbK9skX26rhLDLsEdM867uH9NwDSmJZEjpb1bm3qpTnKWXHTw2Wu+Nnx8klD3pDYVqkHG5UtUECoZI1ZJqLcaAPKS6Bh9+5y3b0f9VsE/WzY+PqnfhvGFmIBWvvAguVBuK5C6KPfvJSzU2GH3RkAFSSnhcPS2TT3Wyi2iNnwkXk6UqEiEwcT0hxrnnv9HmT7TKqk6hI2pfoph2UH4eDZqzxwMg6eFjPGXvLdtwGLQ2nI98VpIV+53E7bumxP3dHJXQniTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHHk1NqY/jhnFcqzbnXbrbz+9vbED7nBGYBfyonxwo8=;
 b=Ui/qT41uZX5MFZU6UgjA+zwqrpf6oypn0dB2PCIfGU74hAmAQNN9BZMdvQyBozBJsULIFs40L7YeX0CnGkwZAhleYVCggq4QWXimiPkhOPr8Rs+A4shCarFO2ooYSa0hOkMQ/2vW63FRcn4werKN2IOSE0bT91NDROBZPSJ4Mt2W1ATRlfqvEuJyZ8u9fWyoe+TvX29JUrLyeL0TZRiaO4EVI5Yh1bRj6/VsH9EusF964MYd2FY6Ai8QvMcq9ijDbCKUO7MEgEU9pvCnhaFo/1AZ0WyPeeLSfUluNQQ8iKcberqSahcDfd/a+odKROV3WLU5Pig3j5eVej316TpoyA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM7PR04MB7189.eurprd04.prod.outlook.com (2603:10a6:20b:116::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Tue, 24 Jun
 2025 12:00:29 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 12:00:29 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>, Bjorn Andersson <andersson@kernel.org>, Mathieu
 Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, Daniel Baluta
	<daniel.baluta@nxp.com>
CC: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/3] dt-bindings: remoteproc: fsl,imx-rproc: Add
 support for i.MX95
Thread-Topic: [PATCH v2 1/3] dt-bindings: remoteproc: fsl,imx-rproc: Add
 support for i.MX95
Thread-Index: AQHb1oZIBDyuhxZ8w0m1b0liUn5bjLQQ7mcAgAFiYnA=
Date: Tue, 24 Jun 2025 12:00:29 +0000
Message-ID:
 <PAXPR04MB84592115B2AA1BBE27AA714B8878A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250606-imx95-rproc-1-v2-0-a2bd64438be9@nxp.com>
 <20250606-imx95-rproc-1-v2-1-a2bd64438be9@nxp.com>
 <bd840fac-a698-4961-914e-80b739266e1b@kernel.org>
In-Reply-To: <bd840fac-a698-4961-914e-80b739266e1b@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM7PR04MB7189:EE_
x-ms-office365-filtering-correlation-id: b11b5c73-a677-4120-86d7-08ddb316b69d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aCtIT1BNVTh3bHZTQ3lPRStBODdEdUJhazJpQ04vL2R2Ymx5dExjdHBqK2p1?=
 =?utf-8?B?eEd6OVhQc2o2TXl2Qm1FYUtvRUdNekFtLzRtdGN5dXlzSlBHT1huTHg3dUxp?=
 =?utf-8?B?RkxBY0U3NzF2MkQxai9VN3NnRzYxN1FqcXNST29UWFRTQkE2UXhtcWFsNVpD?=
 =?utf-8?B?NENtVGx6bCtUbXlHL1pJMEdjWFBDcUxhamZwRGRFTER4NTlibzkxS0lRUGF0?=
 =?utf-8?B?VHcveTVMSldablVhOUM1OGlHU0RqNWZWWG4yTWJHWENjRUdqVFh0QnRiY0Qx?=
 =?utf-8?B?L0VEQkNocFhCNklzNkdnWGhhMGZmSG9wbjdTdVhxZXNmRHlublBPV0pRc1Nn?=
 =?utf-8?B?TzdiaXZiMlUwS3pCZEx3Rjg4eEo5Vmp6bzFpRklONHhvVkZFbEhnOGd6L2tp?=
 =?utf-8?B?NFRNdDJuWjhZSVhYejVzTXhLMnhObUdHcWhuTXF6R0RXOWVjNDE5OEdaSmlU?=
 =?utf-8?B?R1cyYktTK0VmcVJwb3dyWVhTWTMwM0wrQjNoQ01mczlhSHhqdU9tUFgxdFIz?=
 =?utf-8?B?NWU5dkE1MEF2Z2FhcXB5V2FhK3pGOFNZYjJuWkI2YXBJQXovdTk0dnEwdk5B?=
 =?utf-8?B?NlkydDJlNWVaMmw4REloZHhHaktqWnJ6NmZFbTVCeUJuNFFNczIweXplS2s1?=
 =?utf-8?B?RGVDY1V5Tjg2KzNRTUFiaHp2Ylg4L0RtZUx0cGQyMXp5S05hTDJ4Y3BIUmNp?=
 =?utf-8?B?V0l3RE0zS1VMbTYwQTE0QXRGTldIWE5UOE1sRng2andEeHorUE5BYjhHVnlm?=
 =?utf-8?B?dDVwdlRzMERWVjU1RVdTZ0FMZVNXRnlaTEFYTElTSHduYWpwNndlRVdxaDB0?=
 =?utf-8?B?K1kzTFo0dmFWMnBTWW5ZMkQ1Mmg2QUFtR1RkNUlJTlIyK0ovS0xLSjdmNGtz?=
 =?utf-8?B?Zlk4U1h2WThjNlJWd1Z1UnlubXI5cVJENEpEMjNxU1NlZGpMVHliRWdqZDU1?=
 =?utf-8?B?OXZuQ2V1R21kRVVidHpEcUdXOHRHMzNCaVBMN0Z5OTc1dHNWeFp0RDBhd0NP?=
 =?utf-8?B?aW5FZmFhSUdpOG51eW4xaHBIbTVDR2FQM0xCMkUrVldyd3NLUVZBaHVrYktV?=
 =?utf-8?B?SzlxUzRhSHE3VUJUYk5hckFML05ZMkluM1hiYklYcCtJaGFETFBKVlVuVWhh?=
 =?utf-8?B?ZldtRFNMSEQ4UkMwMFBRc21lNERSL2d1ei9oa0ZGSUZ5NHQvd0NmMzlwNTFn?=
 =?utf-8?B?emtDUkV5akRveHExRndiTG1ad25qTHpSV0FYMEY1QmlqM2dLemtKaW8yVVp4?=
 =?utf-8?B?Vk1hUWsxbUdFZEhtT2dJTkdpS3BxU2VlR2F5ckxzM3dSQWtPVW1Ta244U3Jx?=
 =?utf-8?B?azNSQTh6M2pMaGhRWlArNkpvaXFEdEoxMnFCYjZkcTJ3SG5qbXJ4eFQ5ZXRM?=
 =?utf-8?B?NzNnMFVJdTFBUXNEL3BvcjJKSzMzcCtPTTNqU2s1TmcyNlZnNFkvaTU0aHBt?=
 =?utf-8?B?RlZiZnlKV29hc2QvdU53aDU3cXpPL2UrbzUxUjQremVDazdJYU9DcHMxa1ZY?=
 =?utf-8?B?MXI0cHk0bTA5bk0wb29RV3U4dUUzQ1lSbllPRHRCd1BnN0dDUkV0WTY4T2FU?=
 =?utf-8?B?V1gycG5SVjZYNTZKSTIxY2ZZRGZTVmgzeHBxT0lkTkhyakNjUEFUL0RBakJH?=
 =?utf-8?B?T0JCbTZNd0pNbTVpWmpyRWRaTjZGUmprNWNPMFpzcGs5bG5ENC9QaWdEdkJx?=
 =?utf-8?B?R0tZNExWcnZQOTdVRm1SckpTNSt2c1IyVjU3QmZUNGp5MmloalNWbC9VTDdj?=
 =?utf-8?B?cFcxTFk4VlRqV0wwd0g4aS9OUEhLVCtvc0RGaTVhSGI3bFRoWkVyLzdqdVA2?=
 =?utf-8?B?RTRWZlBqWGpzVENZbkVUT3VqanZtQmxTRklFTzlsWjB4aS9YL0xxVmswWk12?=
 =?utf-8?B?Q3VZYWIzdWp3ZzZrUlRhU0R5TDNuZmtrNWIxMU52NHdJSno5ODV1ZnF5T3Vh?=
 =?utf-8?B?ZnRBRUN0bVVzc2hpckNuS285bW9OSGdKeGt0b3YzM2tmSTlDZldURmYrRThi?=
 =?utf-8?Q?SmjjdYlsc5yInXT0tc9B6aRXPOUg9M=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SmIzQTRxbmZEQ1pxc3RaN3h0SWYrNENRb0JjM3NZanM2cWY2REphVklqcmtZ?=
 =?utf-8?B?ZTRPLytRNDZWaS8rNkpVSzdvTW1zMzhPUnYvWTlMZE1jQmFxNUx0K2NPSDJJ?=
 =?utf-8?B?dzhrNU43Rk1jS25yczJNZ0x0YlJueExwTnVrOEJpSDAvSXhrWUNqRkw5L3VH?=
 =?utf-8?B?S3paRk9OakcyU0R1OEdYd1F3djJ5emFmOCt0UHUySk0vRXd2aUo2THJYWmpC?=
 =?utf-8?B?QmY2VUFiOGtnUUlTMHVSd2N0UiszV09SenpPZ0lSaDF3UXJsY0U4cGhJbXl1?=
 =?utf-8?B?MmhxazJuNHIyeG5XTldrdGtTUS9NdVN5dTlnL1hKV0JNbWpuZk1tdzlKZzhj?=
 =?utf-8?B?VER4U01VK29aTmdNQWFDL2FzSFk1S1VDVFErNjhPN1h5UVNmWXh6NG1BbEdX?=
 =?utf-8?B?QVBCeGZ3UzBqL3o3ZG1FYWlESUFGZ2V5TFVJY0F2KzN2UnpuOU9YdGlTd1d1?=
 =?utf-8?B?N2h3N21FK0NERDRyNVQzekt1dWJVME42ODNxVHkrT0x0bDZCSTFoTEU4NFF3?=
 =?utf-8?B?NElwQXpXRzJNZTdJVEtsZnR1Z2NPMWdncm4xQ2pxaU1TYjdRNmVuSzJNOGJy?=
 =?utf-8?B?RU85cmdCWk04K21nWi9mVTBYK0doYmpmZWFvU0dPZTRrY01SekY5cGdONEQz?=
 =?utf-8?B?MktOL3p4MEJYcStEcXpVVTlWT3psd2lCTTgvSXFPMnBZdExlK1JVQlQxRHJR?=
 =?utf-8?B?S3dGTEN2YzZselVSSThjTHVQL09PNGJRRlBMeWJrNlBaTU5FUW9NcDJsTXF5?=
 =?utf-8?B?OXpScmJ2dThHZk9ldWRCeVhkZncyVk5leGg3ZDU2c09rUWJVUllpeDVzNmRD?=
 =?utf-8?B?TXg1OTJ3cjlYRE11MWVBN0dOV3ppdzNyeVZ4VzlUVDA1aEtqd1loSDNob2pT?=
 =?utf-8?B?ZzZTS0RxSUVuUmlwY2FLSzkvb1RpQjFWWGVpS3JCSlhpcXZNNE5TdG1oc290?=
 =?utf-8?B?N2NoLzBZRjArRDJxL210SHhLUDdsNmgwWjJOckNSYTZVRjlhQjZTeERPT000?=
 =?utf-8?B?a2hKUGNIOVdJa05HMDRnZXVQRGROb3hnUithUlVoS2lQTVN1OFBQSG9wbWhs?=
 =?utf-8?B?bXlWS1FuZjJOTkRHbGpac1l0Z0pQcEdWSXZ6RnZNR3RDemk5QzNiUUJkeVh4?=
 =?utf-8?B?ZVhyUkpEd1k3dkRpbWhFN1pDcWlaZytILzBVOUNQaTJFZHQ3SnBpME8vaWtl?=
 =?utf-8?B?VE00WHAxT1M2NE5KMUtEK2tKSld0Ym5BZFRvazRMWWpBZjUrNEFmamppb3dn?=
 =?utf-8?B?S25PQnk2NVF2MFo1eTVMNUlMZWpoUGNDd2lrc0NpZTVPMXBWVS9QRmJ5WHMr?=
 =?utf-8?B?eHZ2U1U2NXd6K050SlRrZlpQWGVQV2VpbEpJZHV5djhKWGVpMEQ0T0NEZWFU?=
 =?utf-8?B?UXBqV2d3b1RsdGJlN1FhTE5rNndsTDY0cjNScmFhck16c1ZHVUhDbGcvYy9D?=
 =?utf-8?B?ZXFIb2JONEJUcndoVjNLNW95L0ZXdkhieTZLTUFEL2xiOTVkTEw0RDRxV0xo?=
 =?utf-8?B?bU9pVjJQR3lrV21vV29hV21kTE1iWjlTR1ZoQ1lmUURLREttUDF1WjMzQ29h?=
 =?utf-8?B?bTlWSkhxekw1S0pIZFIrblhaS3pZcWxjQmhsTGVZWm9iUVI5eEJhenJ3aDIv?=
 =?utf-8?B?dmhvQ1ppTS9COStPM1lSeXd2a011azdqWTJVc3pOdjlKem53YlhlU1lEcnVC?=
 =?utf-8?B?U09nekVtWFk0dXVjS0lPRVBLTUZTT1hmZlNQdVR5bXZoRTQxTUQ5eWZKZnBI?=
 =?utf-8?B?SGJhaDdLcEp0QXBWOE1SRGtyT0NyN252cWJmVVI1RWRVcjBNN1U5MCtTaVJ3?=
 =?utf-8?B?L2NwWDFUSFNWMmFXNmNyUldzNis5MkovQmRIM296TUVjWUE5UEJReUhOUC8y?=
 =?utf-8?B?cXdxM3FPS0pBc0hWVTJjMzNJVWJETFdOSzd3cWkvTUpnYzNnc2xjN1YyL3dw?=
 =?utf-8?B?cWw0T3AzVjN5NmtiM3Q2S0pSZDhmNVI0TlNwVThhRXM4eFpDU3pHbVhtd09q?=
 =?utf-8?B?U0RoUFc4TFg5dzUzc3B5dXVSTVhsdDJCbi9GTXMzSEcrTmhoRXdzQStVRFhN?=
 =?utf-8?B?Z01XRWdRTmVJNUcwb3JPQm1iWERhRGZTcGwzQTllUWNQZDk5aWs4MCtFelVO?=
 =?utf-8?Q?aIO8=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b11b5c73-a677-4120-86d7-08ddb316b69d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 12:00:29.0314
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 86B9ZSDb8Jf93Z9V9ur6U6ZWFiJC/60HqfTAaXItPb2W50qlVe77saIzI0t/3XlAz4VTULYHisIJZN6xq3fzaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7189

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDEvM10gZHQtYmluZGluZ3M6IHJlbW90ZXByb2M6IGZz
bCxpbXgtcnByb2M6DQo+IEFkZCBzdXBwb3J0IGZvciBpLk1YOTUNCj4gDQo+IE9uIDA2LzA2LzIw
MjUgMDM6NTUsIFBlbmcgRmFuIChPU1MpIHdyb3RlOg0KPiA+ICAgIGZzbCxlbnRyeS1hZGRyZXNz
Og0KPiA+ICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMy
DQo+ID4gICAgICBkZXNjcmlwdGlvbjoNCj4gPiBAQCAtNzgsNiArODUsMTIgQEAgcHJvcGVydGll
czoNCj4gPiAgICAgIGRlc2NyaXB0aW9uOg0KPiA+ICAgICAgICBQaGFuZGxlIHRvIElPTVVYQyBH
UFIgYmxvY2sgd2hpY2ggcHJvdmlkZSBhY2Nlc3MgdG8gQ003DQo+IENQVVdBSVQgYml0Lg0KPiA+
DQo+ID4gKyAgZnNsLGxtbS1pZDoNCj4gPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwj
L2RlZmluaXRpb25zL3VpbnQzMg0KPiA+ICsgICAgZGVzY3JpcHRpb246DQo+ID4gKyAgICAgIFRo
aXMgcHJvcGVydHkgaXMgdG8gc3BlY2lmeSB0aGUgTG9naWNhbCBNYWNoaW5lIElEIG9mIHRoZSBy
ZW1vdGUNCj4gcHJvY2Vzc29yDQo+ID4gKyAgICAgIGluIFNvQyB3aGljaCBzdXBwb3J0cyBTeXN0
ZW0gTWFuYWdlcg0KPiANCj4gQXMgZXhwbGFpbmVkIG9uIElSQywgbm9uZSBvZiBhYm92ZSBhcmUg
c3VpdGFibGUgZm9yIERULCBiZWNhdXNlIHRoZXNlDQo+IGFyZSBzb2Mgc3BlY2lmaWMuIEFsc28s
IHBvc3QgdXBzdHJlYW0geW91ciBEVFMsIHNvIHdlIHdpbGwgc2VlIGNvbXBsZXRlDQo+IHBpY3R1
cmUgaW5zdGVhZCBvZiBndWVzc2luZyBzdWNoIHRoaW5ncy4NCg0KSSBzZWUuIEkgd2lsbCBpbmNs
dWRlIGR0cyBpbiBWMy4NCg0KRm9yIGxtbS1pZCwgYW5kIGNwdS1pZCwgYWZ0ZXIgZGlzY3Vzc2lu
ZyB3aXRoIEZyYW5rLCBJIHdpbGwgcmVtb3ZlDQp0aGVtIGZyb20gYmluZGluZyBwYXRjaC4NCg0K
VGhhbmtzLA0KUGVuZy4NCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg==
