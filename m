Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792477008;
	b=ot88Yp24khLzyHQwrXqJ+a8QuI8HlZpH+Toce7aJ/+Xe9k6uoq+2n0Lb7j8NaBhhgl13
	 xwL9hs6eGkXJ/2RQWW0yji/zb6W2169HKfXnU0TuY+voaD1bLw7wwBWYGYrPE2YkDbZ7l
	 Jqd+nL7PMvqdSGcF0Etsay496gaLZ1fwlD/x7g2krdX2oqbFGjRQHfRJPMntouiYShVQq
	 kiIxTIMUcukISazDgLtPmYY1kbhBlVFLHakZ6qOlG3CUtkg7MXW77ou7mNRHHfDfM/edm
	 Fp5we8buylkhz8QrMFAhkDfXOtg5tqAkq/EZT3XmDDnHnAcAbx/ZosrzBn8bB5nPVgA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792477008;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=15gpbQJaROHhKAWjdlM4SFUSfhXN2/k7Qz9trFS0NdQ=;
	b=C1fxFE1fPFTJaHMRpxvsSrjuGyUQxCgqM6+8Ew796dRw3A+iMLFtlWR6cElwsV74VFtC
	 3T3jqfdXyqs9AMP3AdvFgS9DcjC5vJm+sRLpxJni1iX2+4cgXy/2HzZ/MBfC8OUfwfnF+
	 xr9moE0qBBtykIe28jjHzUbCzc5yhDe+mq7arWqS38oOCoQArmjFg+aVpA7zRPnlSqBj9
	 aZLI+whXwY+AMjcWkyuSP0llFZndjlCsnkdlO9TfYTkz8pOHC/DFB9jrP7wRHJgV0Asn4
	 FcNMu2O6+cR2Ffv020gDNOXstRIVfuGU00V3GHGnCS6VdmdrLq/5iy73PifrvcBbc9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=lwOfuw4m;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.5
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010005.outbound.protection.outlook.com [52.101.69.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ACA606A319;
	Tue, 20 Oct 2026 06:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8ACA606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=lwOfuw4m
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wL8G0/oYunTHc1ajzC88KK8Fvssg3ny/f2S0UTY/P/HWx+k+KqNI1JeGXhKPeDw9zLS8E9aJ9DsoM7NuGF1iti4FSavpWsJtEibrE5I9XYFeTj+UYcNaYC2mMtMclZCbKL4rFsRaCISQqiLB9HgM6GV3HFoZOxxTWzTU9mgWLZ6pshnkYnD1b+atjj+70ypX2bS/jt4IJX0wkFIsgE5yLeqgae7DJR3ZWFjoyD0IuLEtcovBlK2l0oIJD1EmxV7MsL8+IGw1OBR0qcf6EAFQRSZnwjSSPHOqX+1mGhC3HrN35E3shF6nKzPpk2ukodfc/zQrxnXYJsg0vC1qQM826Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15gpbQJaROHhKAWjdlM4SFUSfhXN2/k7Qz9trFS0NdQ=;
 b=kmkbgwwoB41aRHY4rdnho4tDrDgQOFJDuzmVRt1dXWGpD3AlPw9+0CA7fXy+Ggh2KXKjC89iRBe1a6zeTXg25SIEnaAbf9/PHppWQmMjH04VVYJziz2wPIXXs0BWTLSqoiRxuj6SFclrlbektKbBl7PlODCvN/qJAosYb9oj1hXWYeWO3FaDRKV+ODvlGaTvE+6OXCichqsyfobHNpf7nWh3kTdFha+QhXGkMHciPSmF0+vuJUjRYkMRzqCFdzcK69DgLBvkKXnOW99f599xgeicdmKvWqzqEnx7h7F65vLNIfCXQl3QAh0YS0JGlykB5ZWxkdejG2X2cBKTPzEilw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15gpbQJaROHhKAWjdlM4SFUSfhXN2/k7Qz9trFS0NdQ=;
 b=lwOfuw4mIViH62NBJ+9zFlkvECiH+FuGGPUJy+yKWyFsmzmVu9hj3N29MhlclNgR8cS8Xfdrd/Zp8rDamPfgwnGgjBDGg5b1LrBMbNveoJ/MazATn629oQ/NBlAdqkKGAnXn0LOXr6i26lHDGgp5B4z+0vGdhqcYQV8EjO//NMFvCIwV5NXId3TFKe4oUreBq+gG/6coH968QpEzz+J2rWkHVE1i7qKcVZP8xo/vxxk5FKpQ0iHU2vVP2Pkqy02z0HAW39x3l6oejYlivCOwFz0vBQ0bufDpoX1b8jXIQP0GNjv3WNkONXytEnEcvug+piKcR+snIC3abuG/7rn3QQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM0PR04MB917899.eurprd04.prod.outlook.com (2603:10a6:20b:7fc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Tue, 20 Oct
 2026 06:16:44 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 06:16:44 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Frank.Li@oss.nxp.com
Cc: Peng Fan <peng.fan@oss.nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: remoteproc: imx_rproc: document memory-region-names to avoid hidden ABI
Date: Tue, 20 Oct 2026 14:13:55 +0800
Message-ID: <20261020061358.188550-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261019-memory-region-name-v6-1-2e46b2e7d667@nxp.com>
References:
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0034.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::17) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM0PR04MB917899:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e432011-7f1a-49e3-a637-08df2e71b6c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|19092799006|23010399003|56012099006|11063799006|5023799004|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RFDvcTEiAh6R1DdFw5MUUEvkiKrTV+ixR6SxKJ7AQBBr9snq7fGRwE5N8xWa0+0KJAifHkMhKfIOH8b6nIozvSvQ0D9/uKqPu/xmLMMzKpJUcAvqf1mcozLFSFRNcgL3+nrLOtTHRf797UDO73GLjqg57YabnzHLgkr01Xd/SI4wKIScHYB90BmPLwDFPhVTEBNax4QToEbESTjJd8akvLjcDbhf0oqjKh8klrWB42exIBjySmwgRztWc0GhPcOJE+MkyBouKwJzm0dUdfdCXkqJHqPGF/RO4tmUvjUOKU4+3u5NzoWJzmm3/Xgo3YMFM+GCc3gDeEubRz4OqILC14mo0mIqEOa7JS8Zswiyg0opBRAPFu6gOG9cv6VGeTPMftkqh6OlIARAfn8F8DfOqvvcbfpkazcgLSnqqxwyMr8rK8YfXGDkONQh40s/PbBVOm88z8Gabv41HjrtN+erzdXiIPbKuJDSbaTMoRGLqFk2QwTcYXYCnQlOn7LbEOFXhTtUVV/ABeHBXxOSyvEgR+kHd11aOwnvn3rqJNopLzDipiX3KEp0ZKnoHq0RZT6YfaugcslYunK6YVf4KlJ/hD2ZXoqQbsh6+G2R3hgvRyh1Dbx8S343C8qxFqsT4Xaa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(19092799006)(23010399003)(56012099006)(11063799006)(5023799004)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmNYLzhRSzlnVWM4eXhuRDBXdmVGdUIzZ3VQSGhvU29JWElTMTVVTnpEK1BY?=
 =?utf-8?B?UXovVVRmaGx5R2dOd1pYUFJVMWF6TVovbUdNbFIxd0dwM3FoL09VbWNNUHFJ?=
 =?utf-8?B?Q3JiVXhnZjg2Q0tpeHJ6Sk5teGNWYzRuc1VoaU9MMU4rcDh2TUF2Rmt2MC9O?=
 =?utf-8?B?VHVlZjl4dlY4TTgxY3FaV0tGWGJic0kxbmF2dzd1dnV1UzkyV1MwOU12RmNF?=
 =?utf-8?B?b0R5S1I2a25uSTFLcm1pdkRsS0d0azczdnN1WlYxZ0xZZHhFd2NjL25OQ0xN?=
 =?utf-8?B?MFozY1BRbjJpZTg2ZUoxQmIwQXRQeUd4UmZEMndmM0haSVYyb0FJVDRYQjI1?=
 =?utf-8?B?R1FtRmkxV1lPQnIzdjV3bmVCNkRHT2dZd1J0QW84NHFySm1oN0pyYjRkNmY4?=
 =?utf-8?B?b3pDaFNUc2RKQU1JMGpMUzdKOTcwRnVCaU1kWHRYTzhnd05hRkNzcVJ2WUM0?=
 =?utf-8?B?a3dZUTZRcFVUeEI0NXMwVVdURzFiN1FxWFBpNGIxdWxFUzZlWkdpWEduSmIv?=
 =?utf-8?B?VXFIWE53YlcrRVhyZzNDK2lRdDh6ZjAvQUlLZ28rY3dSNFBmNDNNUUtGN3dN?=
 =?utf-8?B?dW01c3MzbUZWd0RsUEdiYmk3b3VPVFNaY2VzS2tzRG5lTy9uRUhQQTAwUWxS?=
 =?utf-8?B?R0xPRzVsMFJIVDkybkZpL2tYNEFUVUtrc1FJSnNLQjIybjhkaDMybzF2YnNr?=
 =?utf-8?B?RzFkV3ZTRnJUMXhFcDVKbW9NT21CSkpWQ0huSVNuSWxwRWpXVm1paGJMSWQr?=
 =?utf-8?B?QTgvZ1lBVmdrNmF3YzMzd2dJdXQ0UFZTUTlFeUhqL00veGI2SFBaL0lOZjR1?=
 =?utf-8?B?RDRTK3lFdVZ0b2JFWjF6d25WZkxGVTVCMFF5OVlMbHU1aWl0QnUxamUvOXBZ?=
 =?utf-8?B?SCt2bDZuZzhoSHUwNnZaZ1VFZUgxbUhsVnlLaGh2dE01aDd2UGRON28vQVZE?=
 =?utf-8?B?eUhTejhZWWF6OFN1QmRicGtscHVxZEpXZ25jQkl2andnMmcvaDBONTAzbHBr?=
 =?utf-8?B?SmtlZnlLdkJ3N0VGVDQyMXUwaEdXTEhEWWkzMkVWazU0MGx1L1RLTWJmL1Fz?=
 =?utf-8?B?ZmtMcHlldUUzUW80NDcrQU1PRVhYM2ZzaWtSbHp2VE9PN0lsRGF6akt5d2x4?=
 =?utf-8?B?TGMwVnl6Wk5iODMxSjB4cnF0QTh0ZlZEWERBV0l1T2VlOFVpMnIyeDl2dzB1?=
 =?utf-8?B?a3BaTEZpUjlrckdsQWZ0MkREOE5CbHB1dVRoN0d6TTd1VXpGd2pZSjhiUGxv?=
 =?utf-8?B?c3FaTFlyVEdqNExXZHVyQzJ2R1c2MXltL0hBVnEvTGJjQ3JDNVBqQmZGOEhX?=
 =?utf-8?B?SzFMMmhGMEJxYnhBaHJyS29UWEc5MndnR01iODZJUm0zLzJKVUgvQWtvLzh3?=
 =?utf-8?B?NTZza2ozSEdsSkxwd3FFTXRMRklnV1NoMEwyVlBLM0R2K2dhYmRxaGdmSllv?=
 =?utf-8?B?bkJzUXBuOC9TRzNUNUloUlk0bWd0MHY5UFJrdHljOUozaXlUNEVTUGpUaWc3?=
 =?utf-8?B?SVNDSk44bmdBRm5FbUY3UGlVZWoxVE93SlA1RWJ2ZmxZdTg0eU5MZ01aYVJ1?=
 =?utf-8?B?Q1FReVJtNzBqVW1GVTdFaGVzcUZaWWV1SXQ3eWo3ZVlkVFpObVl4QUJSOU1x?=
 =?utf-8?B?WnMvbzN2TXRVYi9ROCsvcjBzc0pHQlU2bTdLTEJUMGhGSXlMMEJiOXVJUW5l?=
 =?utf-8?B?SmhqcnRncGZPUFBTSEpuZk5RYnJtVkNwMmEwQ2tsOGljYkFtOWVSY3JDaTd6?=
 =?utf-8?B?aHd6SkFlVFJFWEd2M1VqMjZCMzFadk9TRGNJMzBoaGtuSFY4ZGU0MkhybkZY?=
 =?utf-8?B?dTBJbUNvL3U4NUVLdnhvb2p4OHRadk5XYi95WGUzRDF6Q0ZuaFcrWmZoRUZB?=
 =?utf-8?B?MnNxaGNCYUI1NnNocjJZcklxZ1lhMVI1TGN5NmVpUVFNZ212RzQ5RnpYaHlY?=
 =?utf-8?B?Uk5lL3RFWXBSUVhNM1NEUis5amVabk40NHF4NWs0OW01SldmelRLemtmRVhk?=
 =?utf-8?B?L2ppdlV3T20vK3R6aGRBZmMwOW1GNWZwbXVlNTJTSTlveUE5MVJBeWdoWEcy?=
 =?utf-8?B?cWFtUkt6bDlwT2doSnROSXlGWjhFQm8rZjh1cWJnczhvaktOQUVBUi9NVlBu?=
 =?utf-8?B?NHp0b3lsemlFUEo2OWJhRldQV2R3MytHWlc1UXZlbEFXTEVoaDAwUUp6Z2pt?=
 =?utf-8?B?OGtFam9Eczdhb0lSdzN0L3lGck5BQUtKMnk5eWNSZ2Z1MklCZ3pHdkVUbmNK?=
 =?utf-8?B?aWpzZCtoOFJFdVJTdE1lbTI0Tmk4ZXlKWlR1N2ZUZWU5WXh3bjdob2dPTDlH?=
 =?utf-8?B?SUhSSTNtdDJCZGl3MFRleWl6UHpHR1FKdFBZK3dOMC9zMDh0NzVvaWZuR2o3?=
 =?utf-8?Q?4Cb9P+lLLLvk7m3ZcndZiNtllSy9bQJaNuZ/4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e432011-7f1a-49e3-a637-08df2e71b6c5
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 06:16:44.5055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lmfQY/yP3E5FkzW0+bL5c0IFmWEaih/je5cdGR83nNNeFWUNeSxFDrGlIc72mS6nfZTraEk7JHPXtvgM0cxgRDQjT6ahuLd3z+EVRkw+344ygF5LQagq7Jm3FrJHB5lT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB917899

On Mon, 19 Oct 2026 14:55:48 -0400 Frank.Li@oss.nxp.com wrote:

> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Document the optional memory-region-names property.
>  
> The driver currently derives the memory region type from the referenced
> memory node name, creating a hidden DT ABI. Since memory node names are
> not constrained by the binding, incorrect names can silently pass DT
> validation, as seen in examples using "vdevbuffer" instead of
> "vdev0buffer" ([1] and [2]).
> 
> Add memory-region-names to explicitly identify the expected memory regions
> and avoid relying on memory node names as ABI.
> 
> Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
> Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
