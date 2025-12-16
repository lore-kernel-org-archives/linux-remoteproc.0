Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010049.outbound.protection.outlook.com [52.101.69.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96FE274B53;
	Tue, 16 Dec 2025 02:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765852150; cv=fail; b=YPU1EtGVGCwT5Xsbh1TZndOynkHgZ/aOQpnzLixGcg4YqNaZsjbkjJsFyA0K35dTZ+lKmEYH7prksJWbdpH27MgXdpAi2UgLuQ821VzYRfSieZpCtk2MmZ7oJN5+MdJqVwC8KbLi7zmOb1A0XNheF6KpJ5M9GxxIZ17YU/90n/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765852150; c=relaxed/simple;
	bh=aHmJyOU92jdsecTwEgrejXk0URvkrqbGby19YjshqNA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iNviOvkzRI/eVJGIGEwy/TjEKzesyrlfYFpYw5/TwcKv3JyZCbCX4JKZQCyoQAdjVgHFw0kilyL3S+yMPcNfcYvlxX3nIRntalB3xxbYPfeH+TgBeDD5fVsb85cvjut+wz4WMJjQm3TszW8aUrTHtpNBtq8dneHkXF+cieSdFwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HRq2qWHs; arc=fail smtp.client-ip=52.101.69.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HRq2qWHs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8Adb5niQe8N1sIAZ6UD/03wBlca6IuzjPkhiw50X8LEMjeWXMyjS8hFwKLx6GIqy245Y+6N4guokkg4AbgPMl8HBme91OZJV5XZfwPtrBxTuIJXWs/ahhIk176uiL1vRDeQ8GfUlD5ktqBV0mm+oB0Jc9OuqbE/nae2goK+/NPriIXtF/kwjozDkR4JCm+mZCequnM+zeAJd+2TR5uBlUfX4LZLD+QuEsXMwW/ilKJEdPs0mhcSLQRr5DUV7p5kkQHEwqMZJAjgXt/LmI6mURSZBDBeYownP1vHDGR7i1FWV5cZCGuFGlOYk3zt+edEH3PV0PWLuBxmEzN9ekcK3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHmJyOU92jdsecTwEgrejXk0URvkrqbGby19YjshqNA=;
 b=m4Llp0cdyOxP8y6ywy6iUWHj/OaCIgZJyHvPSY8G2OKQF38bX/A6cOBDDeXlGwpwqQvGSHiBMAHryGk8E8yRQs9o6U/a/NaER34pmXjOYo6PmBUNbmlnBIUckHvgdhSf2VkDfD0nGpkpuMtGS7xFSIHO0Z/GIj1crQ5dT6QgqdIPa51OZcTZaTMdrqvYCDVbEpRtXy8/4F5dPFf8+YhrbYrv8TML1trvFV8u6f2aBRaz1P49H7jDLT08xZxwNQ5IocYFKZYN9mfSd+msDesF/lbwzuQI2gUQ1QTdDy5EG+Ijw7xcYn7H3gpwnevTxKkb8hiX31lNXcVcoREmSWwFqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHmJyOU92jdsecTwEgrejXk0URvkrqbGby19YjshqNA=;
 b=HRq2qWHslK3eicPxFgC1+rSMvRieViS5083dJJ5FigOYKdXep7k/KrAcmPuaJEoLUcQ8sXvpoge1xCG7Aktq54sTcquhL8AIdteg9D4TctvOE0EX4JUIn1EYDYy5JUczOROL3HAFiNa3wlaowZbuXdZ3pb5OtkkYP9TQE3HwltaENuFj+lTESksR8v+vMo1VzXDeWT+SPW3fR2gogeIXEmQVD4Oum0Y4i2cl5Tg2IsMyLQxYxykelXKHcrSoDuaZ6SOrApLjur9bN0pA+lkhfl0fGROCxaFmxhOsaySqilPA8juxBS6hlWWnCycBADgMkEnHsM/uVnkVv7/uyxKPJw==
Received: from VE1PR04MB7213.eurprd04.prod.outlook.com (2603:10a6:800:1b3::8)
 by FRWPR04MB11246.eurprd04.prod.outlook.com (2603:10a6:d10:171::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 02:29:03 +0000
Received: from VE1PR04MB7213.eurprd04.prod.outlook.com
 ([fe80::93cb:5423:e3b:9a0d]) by VE1PR04MB7213.eurprd04.prod.outlook.com
 ([fe80::93cb:5423:e3b:9a0d%7]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 02:29:03 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: Iuliana Prodan <iuliana.prodan@nxp.com>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH] remoteproc: imx_rproc: Ues sync handling in rx_callback
 for i.MX7ULP suspend
Thread-Topic: [PATCH] remoteproc: imx_rproc: Ues sync handling in rx_callback
 for i.MX7ULP suspend
Thread-Index: AQHcbZPtmYtmAW/A60uWWYK2pDOcK7UjByuAgACEoAA=
Date: Tue, 16 Dec 2025 02:29:03 +0000
Message-ID:
 <VE1PR04MB72132DBDCD7422B546A2BD3B87AAA@VE1PR04MB7213.eurprd04.prod.outlook.com>
References: <20251215-imx7ulp_rproc-v1-1-4e96cebc4bc6@nxp.com>
 <8c00c09f-da9e-4630-a3d7-586ed29116f3@nxp.com>
In-Reply-To: <8c00c09f-da9e-4630-a3d7-586ed29116f3@nxp.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR04MB7213:EE_|FRWPR04MB11246:EE_
x-ms-office365-filtering-correlation-id: 0c79e94f-455f-4a80-93bc-08de3c4ae12e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|366016|7416014|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?cUlGeDVVNjNvb2RsV3dBYk9TYmtxOTFSK2FRTDlqNlI1OWdTVlZQMXpCREdK?=
 =?utf-8?B?QVpkLzNMYW9aemhmOFNkd2R2N1NDTjRZcFJvVnZSMm5LcTZtWjdKQjBEMm1x?=
 =?utf-8?B?MlIrK3Z4MDhXcC9jUkRUc1B5Sk1TbEdLTldQUEt4Q0VOYkhPTkEzelRVZ2do?=
 =?utf-8?B?TU5lUXU4YjFjRjZabGxyQ3g5NHNUQUNNM0NtL0EwS0UwL0lrR1VjVGJ1WGRz?=
 =?utf-8?B?NEpiVHB6YVpYaXBkVFJ6R3ZXZzRMcUdSYlpUaisrWFdBMFc4VTdTOGN1ZEUw?=
 =?utf-8?B?UDNkNFFWUklZTitTZ0tIL3RpQzZZUDdMVmdHUkZsSURacWp0ZVJDYUxaNGdS?=
 =?utf-8?B?T3QxdTZycDB1aUsrRmRUTHVNM25NNWdBYlIwY013WnllMGJNNkdkcHRGSDR0?=
 =?utf-8?B?aTZSUUpzYjFDbW52WVFZS01lRTRUTjA3NGFuWEY5NEFoNCtWRVQyMUxiaktr?=
 =?utf-8?B?dlJ3Ykgrb2ZYN09ESjJFTzRsaVpBZUE5b3doNlhlV3cycWlHOW5CWU9FQ3Uz?=
 =?utf-8?B?RHZWS3RST0x5ejRtSWFrZnU4cjc0R2JGUm1iSWVxVGJkUkR4Y05IVlREWVlY?=
 =?utf-8?B?R2VOZnRZayt3dFNwVS85bEFZL1I0dFhOTmZ1RG5ZS2JVRVI0RG1JV3IvaTRy?=
 =?utf-8?B?dlBrbWp2WXE3b0hEVTFwci85aVJLdjhacFZlL1NlMlhuRGpTM1ZTU1pjdnY2?=
 =?utf-8?B?eTZ1b1IwU0lOSjFWVk5RYi9RRVRLY3Bib3FmaXIxODZwWG5HaFBTQkw0VGN6?=
 =?utf-8?B?dWtjVDlTZ04zVlRQcmJwaE5oVTFIOUdMNWlCWEZkT1lRRjNpYU0rdFQ5VjJ6?=
 =?utf-8?B?K2UwQUsraU1xN0t6dHhwcXdTTmo1QjEvb0xObXpZdlJraENRVk83SGtQNEU4?=
 =?utf-8?B?OUR6YW1zVmZ5R3BDNzEzMFBqbTgybjY1NWdxazgzc3VsT2RGcmdvOFBsZU9F?=
 =?utf-8?B?c1h3ZloxQTErWjg5NEFxWGorSDZzM29jSHphdi9qcFpQVHNOOHhVME9JaFpm?=
 =?utf-8?B?ZWlxQVhUQmZXdlpNL2Zid3dlQ1hWem5nUHZlSG0xaWtHOENUWXM0K2pPM0o5?=
 =?utf-8?B?WFZXWVZ5aVJuQzRPSXA4TjlUb09CUXZBVEU2aHpSREw1b2t3SmFBL0VmOFY2?=
 =?utf-8?B?clZ0bjF2NCtrb2tNNmRrTDY0ZlY0akZqYjZKL1VYL3hFMWFnZ0Zha2VuR1lx?=
 =?utf-8?B?cmRQZTVxTEhvTVg4cW11c3BiOU1tOTdNdkZGc0RBRnhiemNqY3BnQkpjWklS?=
 =?utf-8?B?bUpGZVVxSU45MmcxWlkwZ1VBUzVSdnZ5MzFIVTIzRDhscFJXLzA3TFY2elI3?=
 =?utf-8?B?VVFodmUwRlYzWlpKTWt2RlVxalRNSEZMYWFEZXlHTVpzN21jUUFmeStUMjhZ?=
 =?utf-8?B?SENKalRaR00yUFNzU2hObG5VcWkxRmNMZWJMNzVkNG5WYU1DdWt1cTNBdTlX?=
 =?utf-8?B?eERNQU56SjNGVWk3T3dVSTlMa1M2VkE0TDBFUEpleDRVY3lRSGpEMGtEd3Vq?=
 =?utf-8?B?MFR5MXh4QXlRR2VFL3hPaSt0UkFzK2xNSFBIekN2OUs3UTJMcURCdnQvS0xa?=
 =?utf-8?B?RUh3Mk5pMHAwYmUvQnBhZ0RIaUpUdE45bU54b2ZLOUtDRFp1dktRVDdsdjVS?=
 =?utf-8?B?a0Z5dEtTR3FQUTBUNVZjZE9BVzd6dm1nRWYvTC9JN1N3MzhRUExpUTBXbTlX?=
 =?utf-8?B?a2oxV0d2bDkwZnN4eGhOcHNrSmZYc3J2WEl6b2luYUVwY0gxZzN3OEtWMlNZ?=
 =?utf-8?B?UDRvRUxhMEFDODFjQnZMUzZxbmhGRkN1QjlhRlNNOGNZYXdLc0pxRDdEa1dW?=
 =?utf-8?B?TlFxRFRUaWxORk1hMHl2eFhGZWRxRldzL2xnVnp1NXgzeWp3cnRnZTlrRTBE?=
 =?utf-8?B?ZUtscytxb21UNE5RaGI3aDVDSU4xRlNtQVV2Sm1nOFVsdllSZVJtWGdWYjQy?=
 =?utf-8?B?ZFF0QU5KaGN1MW1rUDB1MFhXemxGb1NVYStVcUw4VGZ1cms5ZjhwYlVNVm44?=
 =?utf-8?B?WDQ2UndsT05xOWl1WjhlSDl4V2lRRHNFa2hqQUxmaFNiQ0xObUZIK1I5WUpJ?=
 =?utf-8?Q?YndQkt?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7213.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bVBEN2JGajdTTCtzcjZBTzZkYzloNUR2TUd1U0NtR3pCZlZ3bHF4NWtMbm9T?=
 =?utf-8?B?WEhSZDJuY2orS0hvbWZjWWFDR1o4RDY0bFo0RXAxOTRuWjlUTHRpdDBhVWNF?=
 =?utf-8?B?Tlc0cXIxd3lPeE1sQXN1MTMrZDk5eW1aMStDa1Zsa1puN1dkTVpOeUJXKzZr?=
 =?utf-8?B?MnNqT2dvZmFNRjhyK2Y3RUVvbHkrbzdBM1NjaCtFRGxPWjBnNVZCUVIrQkVN?=
 =?utf-8?B?MlVkeHNud3A0SGJFYXFGdWJxOHlKQ2xVbncxR3RIZ1ZrT2RzWDJzV1dOUnVZ?=
 =?utf-8?B?cTdQbWRXOURTSE82T05aZ2dnaXFLbUFKTkZCcmpiOERPM25RSTlIdFhOREQx?=
 =?utf-8?B?cjhNRURlc2Z5dFROMlRHbXVobU5XNk12VDZiK0xiaFFMT2lTRmNhQ2RVMUQx?=
 =?utf-8?B?OG9ndUhGTzJRZnNwYmhEU3B1SnU0a0lKNk9OTmNqOGM0YlRLUStRaExHRGFI?=
 =?utf-8?B?cmVsckc2b2o2Kys4aWNtUGc0YzM0ZUdNUTlqSUR3bkFTTXR6NzNudzVRT21U?=
 =?utf-8?B?M1I5SXJ6TjlTUG1WUzlPWFVHYVN0MnVmdFpDOTVlV2JaMmFHdHV4WHAxQ1dw?=
 =?utf-8?B?VmsvOHRaUTFRODlHS3owZW9Ia1ZIc2JwaForUE1HL3FwMnpaUHlVNkwxa3RZ?=
 =?utf-8?B?OTd4NGkrQmZISFg0OHZkVmRSRDA1c2RuYVpoRVlTd1JJejJKalYxazA5NnY0?=
 =?utf-8?B?TlJzVExNOFZ3TjVVcFErYmFZaG5YY1l5NS9UU1dYWERzQ3RrKzUvMk1iZVZD?=
 =?utf-8?B?dXo5NnFzZkgrbDQrKzlpaU5nMDYzVXhIY0JDeEVudCtzamdzS0tYNGdrMFhD?=
 =?utf-8?B?T3ZBdjVPdlgxVnZ1d3F3eks5WXp4bngxU2JJM3AwOHFzRklDSjlIWXV5RjNo?=
 =?utf-8?B?OXdMNWJCd05pSTR6MGZ4NzhBM3R2U0dMblFyZk1JWmpxQUJldG91UGszVDVh?=
 =?utf-8?B?QjQwR0EwSVphazdyK3NDd0Q1bkR6d0NPdkZnVmRhSGg0L3VuK1JjaEZ1cG5K?=
 =?utf-8?B?cW5XVDJkd1pibXpDTFN2UFN1ZTdkZU5YUEI4a2NDU241a2RiTUZudXlrV1dI?=
 =?utf-8?B?Ny85U0UrdCtNbjFLMmZEZ0RJYUhJMVpvSWw1OG9FcUY1T1VjVWdzSW9YSVNQ?=
 =?utf-8?B?QjM5QjFYNzVBc3JBUSs5MmVRWWltTEFUVGdlcHBYUEVBMGhvRGFHektPMUlW?=
 =?utf-8?B?VDRpc25PNjRreGNyU2RIaVFyQWk4amYvaVlDcnZhekJldWxacTNTdWxZd0V1?=
 =?utf-8?B?NFh3WkxZanZMNm0xZHpuZDFMd1BocVNOVTlpa0MrT3Q0UGpScjdoZDVUcEhw?=
 =?utf-8?B?eFdWZFk2cnU3dVhJd2hBQ28ySjJ0ZnNDeExBQjluK1JlYzZnakExR3FYZ3JB?=
 =?utf-8?B?dklEeGxWZzVtTUZoNXhIMG5WSHZFOGhzN0l4ZnpmQVhRejQ3WTJuSEVNd3Vz?=
 =?utf-8?B?enZwVm50N0lnaDdwTkgwSWpnTTdQTUN5ay9mdGVvbHBtdndnQkVLSlBoRFMy?=
 =?utf-8?B?Zy9USkNPY3hoRFQxMnBkNHJ1d1E5cGxxOG9vbyt4dHc5V21tdjl1N3ptalFq?=
 =?utf-8?B?Z002L1dGcVNDRkZEU2RNWnRkRG8zSHdQUVB5TWNFeVZBd3F3elFIUHRYOFJZ?=
 =?utf-8?B?M3pwdDVnb0tIUzBZVkRUbVJVTEMvNG9PdHdPN3JZZnBMUWtMdVMwN09wY2xK?=
 =?utf-8?B?VEtDTHFJNnpZQTB0ZjhyV3J1VUdNaDZ2N2xDNkpnR2FRS2hZOUlOdmhFd0Vz?=
 =?utf-8?B?WWg0cmw2RGkyNzdBMHZZUmNKc0JHN2VqSmdFYkx3cmhpenFwTDFCZmsveWkr?=
 =?utf-8?B?T04vcHhTbUhCY296TDIweEM2c0RNS2VPZ1JsMm91V2NhYUhZWG5YbWZRV1lG?=
 =?utf-8?B?TThvaVhQcHN0eHlObUJKcFZiQkZIV2t1ZGIxai9aUGdNd0ozczBvaVVKbDVk?=
 =?utf-8?B?RWRRZmE4N0tScE1qbWpOZHplekYvWTVuSjVSOXNPRVp2KzVzWTdPckx6RXpH?=
 =?utf-8?B?ZkNFT1BRejRzVEF0VzR1NzdYSGxYNWhGMStYS2JuSFhjeHVjQ3haV2J3enRl?=
 =?utf-8?B?aFhJLytnY2hiRXF0b3VPWEF4L05JWkRmc3lsbU9CajFaczJQeVovRnZBMnhG?=
 =?utf-8?Q?Ls+o=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7213.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c79e94f-455f-4a80-93bc-08de3c4ae12e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2025 02:29:03.5856
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 75HY9vXp734oM71nVhoKFAcPX7MnEuufxXa2hCKz0MM9VAMnlobvUUqPyM6YXEMPllM/GV//mnbJhITPtFQGOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11246

SEkgTHVsaWFuYSwNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSByZW1vdGVwcm9jOiBpbXhfcnBy
b2M6IFVlcyBzeW5jIGhhbmRsaW5nIGluIHJ4X2NhbGxiYWNrDQo+IGZvciBpLk1YN1VMUCBzdXNw
ZW5kDQo+IA0KPiBPbiAxMi8xNS8yMDI1IDk6MjYgQU0sIEphY2t5IEJhaSB3cm90ZToNCj4gPiBP
biBpLk1YN1VMUCBwbGF0Zm9ybSwgY2VydGFpbiBkcml2ZXJzIHRoYXQgZGVwZW5kIG9uIHJwbXNn
IG1heSBuZWVkIHRvDQo+ID4gc2VuZCBhbiBycG1zZyByZXF1ZXN0IGFuZCByZWNlaXZlIGFuIGFj
a25vd2xlZGdtZW50IGZyb20gdGhlIHJlbW90ZQ0KPiA+IGNvcmUgZHVyaW5nIHRoZSBsYXRlX3N1
c3BlbmQgc3RhZ2UuIEluIHRoZSBjdXJyZW50IGlteF9ycHJvYw0KPiA+IGltcGxlbWVudGF0aW9u
LCByeF9jYWxsYmFjayBkZWZlcnMgbWVzc2FnZSBoYW5kbGluZyB0byBhIHdvcmtxdWV1ZS4NCj4g
PiBIb3dldmVyLCB0aGlzIGRlZmVycmVkIHdvcmsgbWF5IG5vdCBleGVjdXRlIGJlZm9yZSB0aGUg
c3lzdGVtIGVudGVycw0KPiA+IHRoZSBub2lycV9zdXNwZW5kIHN0YWdlLiBXaGVuIHRoYXQgaGFw
cGVucywgcGVuZGluZyBtYWlsYm94IElSUXMgd2lsbA0KPiA+IGNhdXNlIHRoZSBzdXNwZW5kIHNl
cXVlbmNlIHRvIGFib3J0Lg0KPiA+DQo+ID4gVG8gYWRkcmVzcyB0aGlzLCBoYW5kbGUgaW5jb21p
bmcgbWVzc2FnZXMgc3luY2hyb25vdXNseSB3aXRoaW4NCj4gPiByeF9jYWxsYmFjayB3aGVuIHJ1
bm5pbmcgb24gaS5NWDdVTFAuIFRoaXMgZW5zdXJlcyB0aGUgbWVzc2FnZSBpcw0KPiA+IHByb2Nl
c3NlZCBpbW1lZGlhdGVseSwgYWxsb3dzIHRoZSBtYWlsYm94IElSUSB0byBiZSBjbGVhcmVkIGlu
IHRpbWUsDQo+ID4gYW5kIHByZXZlbnRzIHN1c3BlbmQgZmFpbHVyZXMuDQo+ID4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBKYWNreSBCYWkgPHBpbmcuYmFpQG54cC5jb20+DQo+ID4gLS0tDQo+ID4gICBk
cml2ZXJzL3JlbW90ZXByb2MvaW14X3Jwcm9jLmMgfCA0OQ0KPiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrLS0NCj4gPiAgIGRyaXZlcnMvcmVtb3RlcHJvYy9pbXhfcnBy
b2MuaCB8ICAxICsNCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3JlbW90ZXByb2MvaW14
X3Jwcm9jLmMNCj4gPiBiL2RyaXZlcnMvcmVtb3RlcHJvYy9pbXhfcnByb2MuYyBpbmRleA0KPiA+
DQo+IDNiZTg3OTBjMTRhMmNjYzc4OWRkNDA1MDhlYzI3NDAwMGVjMDk5NzguLjExMjdjNTYzODhm
ZDk0ZjI5NmM4MGRiDQo+IDVjMDFhDQo+ID4gNWQ0MzFkNjY5YzRkIDEwMDY0NA0KPiA+IC0tLSBh
L2RyaXZlcnMvcmVtb3RlcHJvYy9pbXhfcnByb2MuYw0KPiA+ICsrKyBiL2RyaXZlcnMvcmVtb3Rl
cHJvYy9pbXhfcnByb2MuYw0KPiA+IEBAIC0yMiw2ICsyMiw3IEBADQo+ID4gICAjaW5jbHVkZSA8
bGludXgvcmVib290Lmg+DQo+ID4gICAjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+DQo+ID4gICAj
aW5jbHVkZSA8bGludXgvcmVtb3RlcHJvYy5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvc3VzcGVu
ZC5oPg0KPiA+ICAgI2luY2x1ZGUgPGxpbnV4L3dvcmtxdWV1ZS5oPg0KPiA+DQo+ID4gICAjaW5j
bHVkZSAiaW14X3Jwcm9jLmgiDQo+ID4gQEAgLTExMSwxMSArMTEyLDEzIEBAIHN0cnVjdCBpbXhf
cnByb2Mgew0KPiA+ICAgCXZvaWQgX19pb21lbQkJCSpyc2NfdGFibGU7DQo+ID4gICAJc3RydWN0
IGlteF9zY19pcGMJCSppcGNfaGFuZGxlOw0KPiA+ICAgCXN0cnVjdCBub3RpZmllcl9ibG9jawkJ
cnByb2NfbmI7DQo+ID4gKwlzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sJCXBtX25iOw0KPiA+ICAgCXUz
MgkJCQlycHJvY19wdDsJLyogcGFydGl0aW9uIGlkICovDQo+ID4gICAJdTMyCQkJCXJzcmNfaWQ7
CS8qIHJlc291cmNlIGlkICovDQo+ID4gICAJdTMyCQkJCWVudHJ5OwkJLyogY3B1IHN0YXJ0IGFk
ZHJlc3MgKi8NCj4gPiAgIAl1MzIJCQkJY29yZV9pbmRleDsNCj4gPiAgIAlzdHJ1Y3QgZGV2X3Bt
X2RvbWFpbl9saXN0CSpwZF9saXN0Ow0KPiA+ICsJYm9vbAkJCQl1c2Vfc3luY19yeDsNCj4gPiAg
IH07DQo+ID4NCj4gPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaW14X3Jwcm9jX2F0dCBpbXhfcnBy
b2NfYXR0X2lteDkzW10gPSB7IEBADQo+ID4gLTcyNSw3ICs3MjgsMTAgQEAgc3RhdGljIHZvaWQg
aW14X3Jwcm9jX3J4X2NhbGxiYWNrKHN0cnVjdCBtYm94X2NsaWVudA0KPiAqY2wsIHZvaWQgKm1z
ZykNCj4gPiAgIAlzdHJ1Y3QgcnByb2MgKnJwcm9jID0gZGV2X2dldF9kcnZkYXRhKGNsLT5kZXYp
Ow0KPiA+ICAgCXN0cnVjdCBpbXhfcnByb2MgKnByaXYgPSBycHJvYy0+cHJpdjsNCj4gPg0KPiA+
IC0JcXVldWVfd29yayhwcml2LT53b3JrcXVldWUsICZwcml2LT5ycHJvY193b3JrKTsNCj4gPiAr
CWlmIChwcml2LT51c2Vfc3luY19yeCkNCj4gPiArCQlpZHJfZm9yX2VhY2goJnJwcm9jLT5ub3Rp
ZnlpZHMsIGlteF9ycHJvY19ub3RpZmllZF9pZHJfY2IsIHJwcm9jKTsNCj4gPiArCWVsc2UNCj4g
PiArCQlxdWV1ZV93b3JrKHByaXYtPndvcmtxdWV1ZSwgJnByaXYtPnJwcm9jX3dvcmspOw0KPiA+
ICAgfQ0KPiA+DQo+ID4gICBzdGF0aWMgaW50IGlteF9ycHJvY194dHJfbWJveF9pbml0KHN0cnVj
dCBycHJvYyAqcnByb2MsIGJvb2wNCj4gPiB0eF9ibG9jaykgQEAgLTEwMDksNiArMTAxNSwzOCBA
QCBzdGF0aWMgaW50DQo+IGlteF9ycHJvY19zeXNfb2ZmX2hhbmRsZXIoc3RydWN0IHN5c19vZmZf
ZGF0YSAqZGF0YSkNCj4gPiAgIAlyZXR1cm4gTk9USUZZX0RPTkU7DQo+ID4gICB9DQo+ID4NCj4g
PiArc3RhdGljIGludCBpbXhfcnByb2NfcG1fbm90aWZ5KHN0cnVjdCBub3RpZmllcl9ibG9jayAq
bmIsDQo+ID4gKwl1bnNpZ25lZCBsb25nIGFjdGlvbiwgdm9pZCAqZGF0YSkNCj4gPiArew0KPiA+
ICsJaW50IHJldDsNCj4gPiArCXN0cnVjdCBpbXhfcnByb2MgKnByaXYgPSBjb250YWluZXJfb2Yo
bmIsIHN0cnVjdCBpbXhfcnByb2MsIHBtX25iKTsNCj4gPiArDQo+ID4gKwlpbXhfcnByb2NfZnJl
ZV9tYm94KHByaXYtPnJwcm9jKTsNCj4gDQo+IEhlcmUgeW91IGZyZWUgbWFpbGJveCB1bmNvbmRp
dGluYWxseS4NCg0KUGxlYXNlIGlnbm9yZSB0aGlzIHBhdGNoLCBjaGFuZ2VzIGlzIG5vdCBwZXJm
ZWN0IGFuZCB0b28gY29tcGxleC4gV2lsbCB0cnkgdG8NCkZpeCB0aGUgaXNzdWUgZnJvbSBtYWls
Ym94Lg0KDQpUaHggZm9yIHlvdXIgY29tbWVudHMuDQoNCkJSDQpKYWNreSBCYWkNCj4gPiArDQo+
ID4gKwlzd2l0Y2ggKGFjdGlvbikgew0KPiA+ICsJY2FzZSBQTV9TVVNQRU5EX1BSRVBBUkU6DQo+
IA0KPiBXaGVuIHN3aXRjaGluZyB0byBzeW5jIG1vZGUsIGFueSBwZW5kaW5nIHdvcmsgaW4gdGhl
IHdvcmtxdWV1ZSBzaG91bGQgYmUNCj4gZmx1c2hlZCB0byBhdm9pZCBwcm9jZXNzaW5nIG1lc3Nh
Z2VzIHR3aWNlLg0KPiA+ICsJCXJldCA9IGlteF9ycHJvY194dHJfbWJveF9pbml0KHByaXYtPnJw
cm9jLCBmYWxzZSk7DQo+ID4gKwkJaWYgKHJldCkgew0KPiA+ICsJCQlkZXZfZXJyKCZwcml2LT5y
cHJvYy0+ZGV2LCAiRmFpbGVkIHRvIHJlcXVlc3Qgbm9uLWJsb2NraW5nDQo+IG1ib3hcbiIpOw0K
PiA+ICsJCQlyZXR1cm4gTk9USUZZX0JBRDsNCj4gPiArCQl9DQo+ID4gKwkJcHJpdi0+dXNlX3N5
bmNfcnggPSB0cnVlOw0KPiA+ICsJCWJyZWFrOw0KPiA+ICsJY2FzZSBQTV9QT1NUX1NVU1BFTkQ6
DQo+ID4gKwkJcmV0ID0gaW14X3Jwcm9jX3h0cl9tYm94X2luaXQocHJpdi0+cnByb2MsIHRydWUp
Ow0KPiA+ICsJCWlmIChyZXQpIHsNCj4gPiArCQkJZGV2X2VycigmcHJpdi0+cnByb2MtPmRldiwg
IkZhaWxlZCB0byByZXF1ZXN0IGJsb2NraW5nDQo+IG1ib3hcbiIpOw0KPiA+ICsJCQlyZXR1cm4g
Tk9USUZZX0JBRDsNCj4gPiArCQl9DQo+IA0KPiBJZiBpbXhfcnByb2NfeHRyX21ib3hfaW5pdCgp
IGZhaWxzIGluIGVpdGhlciBjYXNlLCB0aGUgbWFpbGJveCBjaGFubmVscyByZW1haW4NCj4gZnJl
ZWQgYnV0IHRoZSBmdW5jdGlvbiByZXR1cm5zIE5PVElGWV9CQUQuIFRoZSBzeXN0ZW0gbWF5IGNv
bnRpbnVlIHdpdGgNCj4gZnJlZWQgbWFpbGJveCBjaGFubmVscy4NCj4gDQo+IE9ubHkgZnJlZSB0
aGUgbWFpbGJveCBpZiByZS1pbml0aWFsaXphdGlvbiBzdWNjZWVkcywgb3IgZW5zdXJlIHByb3Bl
ciBjbGVhbnVwIG9uDQo+IGZhaWx1cmUuDQo+IA0KPiA+ICsJCXByaXYtPnVzZV9zeW5jX3J4ID0g
ZmFsc2U7DQo+ID4gKwkJYnJlYWs7DQo+ID4gKwlkZWZhdWx0Og0KPiA+ICsJCWJyZWFrOw0KPiA+
ICsJfQ0KPiA+ICsNCj4gPiArCXJldHVybiBOT1RJRllfT0s7DQo+ID4gK30NCj4gPiArDQo+ID4g
ICBzdGF0aWMgdm9pZCBpbXhfcnByb2NfZGVzdHJveV93b3JrcXVldWUodm9pZCAqZGF0YSkNCj4g
PiAgIHsNCj4gPiAgIAlzdHJ1Y3Qgd29ya3F1ZXVlX3N0cnVjdCAqd29ya3F1ZXVlID0gZGF0YTsg
QEAgLTExMDMsNg0KPiArMTE0MSwxMyBAQA0KPiA+IHN0YXRpYyBpbnQgaW14X3Jwcm9jX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gICAJCQlyZXR1cm4gZGV2X2Vycl9w
cm9iZShkZXYsIHJldCwgInJlZ2lzdGVyIHJlc3RhcnQgaGFuZGxlcg0KPiBmYWlsdXJlXG4iKTsN
Cj4gPiAgIAl9DQo+ID4NCj4gPiArCWlmIChkY2ZnLT5mbGFncyAmIElNWF9SUFJPQ19ORUVEX1BN
X1NZTkMpIHsNCj4gPiArCQlwcml2LT5wbV9uYi5ub3RpZmllcl9jYWxsID0gaW14X3Jwcm9jX3Bt
X25vdGlmeTsNCj4gPiArCQlyZXQgPSByZWdpc3Rlcl9wbV9ub3RpZmllcigmcHJpdi0+cG1fbmIp
Ow0KPiA+ICsJCWlmIChyZXQpDQo+ID4gKwkJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgcmV0
LCAicmVnaXN0ZXIgcG0gbm90aWZpZXIgZmFpbHVyZVxuIik7DQo+ID4gKwl9DQo+ID4gKw0KPiAN
Cj4gVGhlIFBNIG5vdGlmaWVyIGlzIHJlZ2lzdGVyZWQgaW4gcHJvYmUgYnV0IG5ldmVyIHVucmVn
aXN0ZXJlZCBpbiByZW1vdmUgb3INCj4gZXJyb3IgcGF0aHMuDQo+IA0KPiBUaGFua3MsDQo+IEl1
bGlhDQo+IA0KPiA+ICAgCXBtX3J1bnRpbWVfZW5hYmxlKGRldik7DQo+ID4gICAJcmV0ID0gcG1f
cnVudGltZV9yZXN1bWVfYW5kX2dldChkZXYpOw0KPiA+ICAgCWlmIChyZXQpDQo+ID4gQEAgLTEy
MDIsNyArMTI0Nyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaW14X3Jwcm9jX2RjZmcNCj4gaW14
X3Jwcm9jX2NmZ19pbXg4dWxwID0gew0KPiA+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBpbXhfcnBy
b2NfZGNmZyBpbXhfcnByb2NfY2ZnX2lteDd1bHAgPSB7DQo+ID4gICAJLmF0dAkJPSBpbXhfcnBy
b2NfYXR0X2lteDd1bHAsDQo+ID4gICAJLmF0dF9zaXplCT0gQVJSQVlfU0laRShpbXhfcnByb2Nf
YXR0X2lteDd1bHApLA0KPiA+IC0JLmZsYWdzCQk9IElNWF9SUFJPQ19ORUVEX1NZU1RFTV9PRkYs
DQo+ID4gKwkuZmxhZ3MJCT0gSU1YX1JQUk9DX05FRURfU1lTVEVNX09GRiB8DQo+IElNWF9SUFJP
Q19ORUVEX1BNX1NZTkMsDQo+ID4gICB9Ow0KPiA+DQo+ID4gICBzdGF0aWMgY29uc3Qgc3RydWN0
IGlteF9ycHJvY19kY2ZnIGlteF9ycHJvY19jZmdfaW14N2QgPSB7IGRpZmYNCj4gPiAtLWdpdCBh
L2RyaXZlcnMvcmVtb3RlcHJvYy9pbXhfcnByb2MuaA0KPiA+IGIvZHJpdmVycy9yZW1vdGVwcm9j
L2lteF9ycHJvYy5oIGluZGV4DQo+ID4NCj4gMWIyZDlmNGQ2ZDE5ZGNkYzIxNWJlOTdmN2UyYWIz
NDg4MjgxOTE2YS4uMGUzZTQ2MGNlZjRlZDkzNDBmYjQ5NzcNCj4gMTgzZTANCj4gPiAzMTQzYzg0
NzY0YWYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9yZW1vdGVwcm9jL2lteF9ycHJvYy5oDQo+
ID4gKysrIGIvZHJpdmVycy9yZW1vdGVwcm9jL2lteF9ycHJvYy5oDQo+ID4gQEAgLTE4LDYgKzE4
LDcgQEAgc3RydWN0IGlteF9ycHJvY19hdHQgew0KPiA+ICAgLyogZGNmZyBmbGFncyAqLw0KPiA+
ICAgI2RlZmluZSBJTVhfUlBST0NfTkVFRF9TWVNURU1fT0ZGCUJJVCgwKQ0KPiA+ICAgI2RlZmlu
ZSBJTVhfUlBST0NfTkVFRF9DTEtTCQlCSVQoMSkNCj4gPiArI2RlZmluZSBJTVhfUlBST0NfTkVF
RF9QTV9TWU5DCQlCSVQoMikNCj4gPg0KPiA+ICAgc3RydWN0IGlteF9ycHJvY19wbGF0X29wcyB7
DQo+ID4gICAJaW50ICgqc3RhcnQpKHN0cnVjdCBycHJvYyAqcnByb2MpOw0KPiA+DQo+ID4gLS0t
DQo+ID4gYmFzZS1jb21taXQ6IDVjZTc0YmMxYjdjYjI3MzJiMjJmOWM5MzA4MjU0NWJjNjU1ZDY1
NDcNCj4gPiBjaGFuZ2UtaWQ6IDIwMjUxMjExLWlteDd1bHBfcnByb2MtNTc5OTkzMjkyMzliDQo+
ID4NCj4gPiBCZXN0IHJlZ2FyZHMsDQoNCg==
