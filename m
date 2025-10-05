Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013068.outbound.protection.outlook.com [52.101.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B4C28DF2D;
	Sun,  5 Oct 2025 14:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759673711; cv=fail; b=Enbw7ly3timvUp5Kq9TjQMH251+J8yvT6Vc8GX09jMqVngX71+4u3ZG6syNEzfaqsnHG4KLVqOw1FyrybOPOYUaRzEK8qLWXJNRlbSX2m/9whHgCIszpsoHO6lqvSjXSRu/o/4s7ceiHb6UCPE+3jPeR5HI8TbGKGdvePwGRHuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759673711; c=relaxed/simple;
	bh=KA0SkMHsTTmTkN0Yn4ItIaj3a6GcxuFTfoOJBDK4Ihc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=cgsYAc9CRBSuWETnM95ECk6i2lCHrJHFDKAZC5STInckfeiUWeZZRJCFE++z1Qo4yTUATmeABpqx9L7wciDAfZv+vOClKE2g42g3fU2cGanANq0FR1UwcDfxHiZvDqOvbttaAyeb/DO0yp3JUFNgnHXTqvWVfpzYnHYWbxvIFFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PtTNFsZB; arc=fail smtp.client-ip=52.101.72.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PtTNFsZB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=luSlYGPbY3F6oxwcRmDLNSQACKid2TOTjptYjfRZ6xkgklRRpGt7dn0foZqTRQ7mQXJcJtFfJmbANxrDP0CUCcInEPOe8j21oSO3q3bqKgepHqKnhJwQlH4kyKOVmj0FnOmyamtuRdowpaoqB00azXyjcTVln/rM4NUScAeozhnTylLpn9fFaRGsodiAsARIIwWEk5oWtywUl6tDuz8rdvLapVEF6o2p+H/0kJxsTeNbYnVihAj8eLGug6IjVTzvQsL+ec9elDFT6Cb14xKoU8fX53Myjw3qwniaBBokrRXHDR/d3PnIo/QOuwlm6J7g/bEvESoZeKa6Tb5Y6ypW9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+fRfd4w4rGOmjYj2uc2/V9soSG334t8HS4COicz2jvo=;
 b=CAl1Hk3oDcDCVKvr5cQn55t1KISrN9OrtOQ/3wCgrhg/9eWOOHIK3woIUYT5OsE56RM1T3s415e0z7h13OMSssWwRF8g1nXTKcJ0+fQZH1TkFa3NlaFaGomA/eCVJ6osodigVu/nFF0LicbVbHrmPGmEhTpNRbyIB2tS1rMA0/SXzjvmj7HXX02qn7wrcDO7WfdEfkGqMBAY5vdyGpQGZ5YOJE8MxCWXT+1qqyTvM8qIsua7MStfHfQP/N+6zMS89yAzY7UxxO+bP95QrY2MuBhn7mEefY4owlffQZSDLOAmMg9GTr+sylzx2FnB7YKfxTe9zUXCqgvq2ZwoesdOJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+fRfd4w4rGOmjYj2uc2/V9soSG334t8HS4COicz2jvo=;
 b=PtTNFsZB5HW2yUNIFPc0Y7IXHrxFkml01xURLIakbJvNleHfg2MgVdq2LriOJpdyQTGTvw9YbYPBJkbo4wLFeUl+ywl/JCYrj46J2FrCt6m+J37kCAU6HeH36WclX378kQ7MTS0tdMgKi2O0Q48aEn5/KtBSF+dtsaFLLoWa0TTrt1RndQG6kGJfowd2zj8j7Pc4bJ8a/9/EQN8KGkoGfOpE6o5PSGnv6yS1T+dgJgLbkpbkIFASCOrAmrsMqGgDeOXHqyrCqQ+SyjE9As+qhXwd4d/Z/GHPM6GrRF9O7P55e6Ac9MJcuiOMBKMtJwvGiBArf/GrDScNNEfrHu25+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10452.eurprd04.prod.outlook.com (2603:10a6:150:1e7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Sun, 5 Oct
 2025 14:15:02 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9182.017; Sun, 5 Oct 2025
 14:15:02 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Sun, 05 Oct 2025 22:14:30 +0800
Subject: [PATCH 5/6] remoteproc: core: Remove unused export of
 rproc_va_to_pa
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251005-remoteproc-cleanup-v1-5-09a9fdea0063@nxp.com>
References: <20251005-remoteproc-cleanup-v1-0-09a9fdea0063@nxp.com>
In-Reply-To: <20251005-remoteproc-cleanup-v1-0-09a9fdea0063@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Andrew Davis <afd@ti.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759673682; l=1115;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=KA0SkMHsTTmTkN0Yn4ItIaj3a6GcxuFTfoOJBDK4Ihc=;
 b=vn/2PmM/fuXH+0qdxrKegm9mwOjn9/CDRJrSAD/CHpjQfBY3QX7sxYQd0PEHAAZcd91F78SK/
 G8quWMK8EliCCzuN6BSAcQiEIV5fL5RpU8I75CYNFlwH4RxkWny6pfE
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB10452:EE_
X-MS-Office365-Filtering-Correlation-Id: 791535b4-b872-410e-7b1e-08de0419930f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bThLd2g3dG5mVmFnTFlrYnJEcllUYXNEUDZ3eXFXVVJ2YUdSaS9PZ3V0RCs5?=
 =?utf-8?B?dnhBMzgxejBQWS9oN1A1a2xyVmlucCt4cDdSRHN2VHY4N1picXJkSGlROE40?=
 =?utf-8?B?d2tsc0svMFZvTFVxR2Juc0JONzJweVo0azBrMCtjeHl0V3lXL2RYSDF1VUlo?=
 =?utf-8?B?MTA5dUJESDc1endXb2pHZEVRazFUb3ZDUTl0ZGRETC9rRDVTM0dCUHNlc05F?=
 =?utf-8?B?Nk9mY04vMU9FenZmanJaOFplZ1pPVzdKb1laSk9iQ0dicks3R3hiSzRIcC9t?=
 =?utf-8?B?VElMWkFWVGY0MFprOGlvc3hjVWNQa3U0a09rek5nSUttVHN1Wk91NlV1bitr?=
 =?utf-8?B?aXZrZjhqaWQ3WXV5R0JGYzV2dDJ5anU2MmZDY1B6K3dDbFRMWnQxN2w3RWZJ?=
 =?utf-8?B?NUJsc3A5SHd4MmZvbkorNGZpT0RqWjBWekdub3V3Q0J2cWdHSlY2cHFFcWdQ?=
 =?utf-8?B?QmhrLzJWcWtpMnA4UEw0eTVENG5ZajBOakhWM3k3eTAzbzl6RlcrdkJ0cExK?=
 =?utf-8?B?elJFakJKa0ZHOWlCS1pLTVF6QTVBSG01aTJFbm5TT0pBc1l0UkJGdnlLcm9S?=
 =?utf-8?B?dC9zUzZEdXVnZklaR3Z6OUJBamN4TTErbXFoWTJZR0YvdWxFZ1JKbkZOL1ZG?=
 =?utf-8?B?QnhOSjZKRmtJRFpuVEpnckIrdjhIa3B0ck0xeEFZK1B3a3BvaWJMZU5relkv?=
 =?utf-8?B?THYxT1FzbHhyTld4TXJkS2pLOVdPQTRUZkMvR3hpTmRaaGNMdUszZW1uVnpP?=
 =?utf-8?B?dFg1T1dsM2JoMnZvdkxKWFNYWVVQVE5IUmgrenlhQ0xrM2Yva1NQZ0tzM2hu?=
 =?utf-8?B?ZlpOUXhUamhJamZYK0VySkZmUTdiN3lXQmsvNTBBSENkcktUVVBJaDZ1aFZF?=
 =?utf-8?B?SWVxejdVOC9yc3NaQ3ZXcVYvN3NZR1FkckgyMnA4VE55K01COHNmT2lIUURo?=
 =?utf-8?B?R1NKQldFNStDZDl2MVlsUWdzWW11QzNuNmpGTnhsS3A3ZXk4M0FDYjBsc29z?=
 =?utf-8?B?MzZJSCtJOXpYcFhQZ0ljaEk3YndKZ0NSemdFNmJLc2x3T0FZMTNsdjRNOTQz?=
 =?utf-8?B?dmdtY21lQmxrNDc0anZoc1NtcXJSa0ZqbnU5bjF3Z0lUTW1QeHlITWI3MWdp?=
 =?utf-8?B?bVpVZytVSk0vejJQWFhlc0FOSnpnc0pkeU9hbVJSNHVIWTl2MEhQWTVZSlVp?=
 =?utf-8?B?eVdZdzEycm80aFY2bGNMNmkyZUkySkVBZTFzeWJ4cUJHUmxVNUdGZzF3Y0N5?=
 =?utf-8?B?WXZZMFhsMUgySXExbUVrN0RXRnFYYjYyY1dBczBWVzhTU20vVGJ4bWlIRVR4?=
 =?utf-8?B?L25XY3lCaGFCeC9TdytHcjFOK2MwVXI3UkQ5b3lxd21pMm0rVDJaVVdBaVpK?=
 =?utf-8?B?RFFZeDFyOWlRUnVJOGhGTkNESkdaeXlwVjhxNnpyQWlGQ2xVQS82MjdNeERP?=
 =?utf-8?B?MWhYQVVHTGZ4UERYT01aTlNlVmd2Tk0vNlFSZURCbWtwU0ZZVXh2dVd0eUhG?=
 =?utf-8?B?RXQweE1QSWJwM2dFUWtnQ01JVG45NHdzNGdDejI4K0dWdDQyaG9BOHVnUytB?=
 =?utf-8?B?bTg0dnQ5YjUxVlNZU1JkTDE3TnBQUWt0djRMdHRTNkpkUmxwS3VZaFBETkdC?=
 =?utf-8?B?U3p2VkZJUXV3T3VoTWFnWS9vZWsybW1JUy9DbS96cmxwaTlzWFdTV0NVakha?=
 =?utf-8?B?bkIzaGNnOGNNZ2N0YmpHUEh5SVlJTk1KWmdHVjVLOXdwcFhxVWFrSmpTMmpi?=
 =?utf-8?B?VExIZ2NtTjdYNS92cWJLOU1YTWY2NHBNVFBoN3MraW5aWXQwWjBQTEptNzBL?=
 =?utf-8?B?a0F2eHNDaU5iZjRDNHdxaHpRVXZjdUJ1djBKYStLOXArZEZlYU9KWTdyZVMx?=
 =?utf-8?B?QzhWMURDQlJtTXVtWXlWMTAwdENYazQxajRZTnlHcm4xeEM2OE1oVTVVQXR4?=
 =?utf-8?B?cG9UNHRobG5LQmRDMEtuUFBJaGdtOFZFd01paVNYelJIK0JyU1NUblJXQnh3?=
 =?utf-8?B?djhWU3ZiZThjc0lwV2wwcVhXcDNqTFREbTZ1RFovb0dCdFZLeDJNRVh2NnRW?=
 =?utf-8?Q?+JQP7B?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3ByYzBpQU5jZ1pBZkhqT1grSzVIRVJBM1laSGxGc2NMR3N4cGgzbVFRcDla?=
 =?utf-8?B?cVpvdmJSalNWSUVuUHdHaU12NERJOUhTb3Y3SlJhQmFTNys0b045K0dYdmVy?=
 =?utf-8?B?OHBVZ3o5aVp0bXY1THJNemV4dHpVc1FyZ0gzYU9MUjdrbk1CL2UvZ0N1N2d3?=
 =?utf-8?B?SzU5TFNGOVhyUUFxYnZ1NTFGdHJCMGRrcXRzRXJtejcrU09nbHhad3dVaG1n?=
 =?utf-8?B?enV2NU9QMnRBLzgzRmtwODhBTnV4QXo1ZUJEN3BlUkVma0Y2cDlOSlRYR0JL?=
 =?utf-8?B?VDkvd3lpWHFLWnBPS3Q5YXVrTHBIZ3NjSmx0K2xuc1VuM3IyM3FLMU0zN2VY?=
 =?utf-8?B?Z25HSmRyUUg0Yk1OZUU0SGZzcTIzRXRDcVVlM3FBRHZIWmpobloyVTF4SUdv?=
 =?utf-8?B?SWx0RFdjdGZ2dVlwSUhlOTdBMkZOKytoRUpvaXNJcVhVZzlKV3RJd2tBeTFD?=
 =?utf-8?B?WVFuWDZoWUphRjQyQ2wvZW5oOEF5a016VlZnU2QxU0l4YmNkeVlZWmFBV3o3?=
 =?utf-8?B?TXJaQTVDekFUS091UGhEc2lCbFRRUUFwbE5Vd051d2h0eHllQ0trckR5OS9Q?=
 =?utf-8?B?c2FlWktaMTZjZW1YWnYwcVY5Wk5IakkyNllTYnRGaHoxaDdEbzU4dzFLR1FO?=
 =?utf-8?B?WkFTUUpaSHc4empmSi9uNkp6OE1YUzVQa0h4ZTdkeWdUZnU0QVdTdC9sSDJW?=
 =?utf-8?B?M0lINHo2RnlmYVdjS0xpWkV1cmc1R2kzQjFsUUdjSjhqc0d2SGg0OW9DTW5B?=
 =?utf-8?B?UXhLZmFnWGVhY1lJWkZLRHA0RnkweGtvL2hWNDBUdnM0azFDL2EyanJmdEsz?=
 =?utf-8?B?S0VBUldzcGx6dEVrS2hJYkNYWlQwdHEvdUVnL1hYWW1SbThMMjg2emVsb0kv?=
 =?utf-8?B?NDlnVkZXaTFUTmpBTk1hYlF1QTF0RUVFd0tuU0k3Mk5QRzhWMml4bEhhQlZo?=
 =?utf-8?B?YjRDL2NGUVJtM2kzUFF1cTVRb2dGL3NpQU1sRmgySU5QSDBHeE84c1luYU04?=
 =?utf-8?B?S2V2NDJRVWJ6MHllWmZvL1l1cC9ZV1FIVnBPWXlRWDJ1Yk1EbFlGNnN4ZUt1?=
 =?utf-8?B?UzJCUDRKelVWQ2VmSzhlRHNWdjlyS1lMUGI3RDhJcjEvK2VQYXRqZzhqemdt?=
 =?utf-8?B?MkZyb0RVeXUrL2RkNVR4R3pnVk94ZWR0OWdGY1RUU1dyVnZFUEh2SHloam1h?=
 =?utf-8?B?eFpiWjlhbFExVWxFNEhMSHVBQlRsaVFHVlFuODlnQUtoUU1ZYWkzNWp2NHIx?=
 =?utf-8?B?OE5vcHZYbitWa3hrbW9YellDZ1dib3NjMXZXMDFQOHpxbTk5QllUbGJ6RGdj?=
 =?utf-8?B?UlQ1VVYwbldKWG96eHREWitUb3J3bnExaXF6dDAwL0lzdy8zV0JNanMxd1J5?=
 =?utf-8?B?Y1dLaEQ0dmMyQ216WkI3TTREZFBYS08vMzl6RkFHbmxNNFJZZ2VLWTVicXkw?=
 =?utf-8?B?cVpEZ0p4cU0vM3RSWnE3ckpkVlh0TEh6VEw5RDJSKzdCbnVIZlFWTmxSb3Zh?=
 =?utf-8?B?djRSQjJxREhVNml3c1JMY0Zua3lldWFPSEhORFh3Y091UURZeHpoNXhhd2VK?=
 =?utf-8?B?S0MweUtjbU5ZYkY3UVZRQjBQYUpoa0xINUhiVXNmMG05VDVYM1pjem1Scmx1?=
 =?utf-8?B?c3l4d3V0TkFaclg3Qkl0OVI0RmZ0SXlmMDZoRGRnU01xNEtmamlwZS9pMDZl?=
 =?utf-8?B?bFd4OU84bkZPQWJaYVA4bFhEWjFodWgrUndrMStHU0RkRE90YlhicFhpUlpI?=
 =?utf-8?B?M2FoQm8wVElEV3lFRHZpWmRGS2gxY09XYlo0WGNlL0N3VG94Tk5DdjBxM0lu?=
 =?utf-8?B?YSszQnhtV1ljWHpMelM0c2lnWTlxY0JqMHBLQWxmdlNFVDFNN29aRmVQNmxB?=
 =?utf-8?B?eFl2M05uOE0xT01SMTBKRW9yWTN2V3gzeVU3MzVuMW9Jak13YVZkVzNrdEgy?=
 =?utf-8?B?WGFFdUh1eWtIVG9LSnB3dCtMSk9kY0U5SGZobGE4ZmY0M3lES3RvcEdZR3Bp?=
 =?utf-8?B?QXpYRGdFbVE0eUhZVTJObFhHZktnellqQXQ3TnlPL1BQTmQ1LzdnbTE2U0tM?=
 =?utf-8?B?dnZETkd6QjNJTzBsczlnb3Y0bFI5MDUwWktHNCtielBZMXdVcXd2WCtJMFRY?=
 =?utf-8?Q?AmObUg68mPlZGnMKyhIJjYaJD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 791535b4-b872-410e-7b1e-08de0419930f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2025 14:15:02.2217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xuFcpJdDD5K1LIM6ZpmBnobqy9hcBn1j+I25QBVWWyIQYuUdigkgRXeVjrqRoSkud9LNnqC8SpNEI0bLoxClSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10452

commit 086d08725d34 ("remoteproc: create vdev subdevice with specific dma
memory pool") added an export for rproc_va_to_pa. However, since its
introduction, this symbol has not been used by any loadable modules. It
remains only referenced within remoteproc_virtio.c, which is always built
together with remoteproc_core.c.

As such, exporting rproc_va_to_pa is unnecessary, so remove the export.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/remoteproc_core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index dd859378f6ff6dec2728980cc82d31687aa7a3dc..383479d624c89da1c481adc956a169c03b793bcc 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -156,7 +156,6 @@ phys_addr_t rproc_va_to_pa(void *cpu_addr)
 	WARN_ON(!virt_addr_valid(cpu_addr));
 	return virt_to_phys(cpu_addr);
 }
-EXPORT_SYMBOL(rproc_va_to_pa);
 
 /**
  * rproc_da_to_va() - lookup the kernel virtual address for a remoteproc address

-- 
2.37.1

