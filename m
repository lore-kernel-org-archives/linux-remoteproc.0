Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013068.outbound.protection.outlook.com [52.101.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F14D292938;
	Sun,  5 Oct 2025 14:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759673714; cv=fail; b=RmvwO1IfECKnSj8com00cROAAouYB9n6Xhv5DExXUtOCGD1QcGVaMgQtXyCyLstRyWsDV0l0ojfSMmSFIwKxBmBrv2pyB9S1YkvBhFG/UIp5i/qcE5I2QLp6F7Q63QMc1tXl4hdWpeKAZNFDOVTjPr/vQ+n94oa508Onk1PQvgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759673714; c=relaxed/simple;
	bh=u0I9HnKhmATwQND0ngMpUwbnylSsoi1syJFcCpBLHew=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rkDFciSMAqV8Va8D9xL+OO/Gtzs1gKMyu2QYFEcr2NGgKXUEmXtnkruFhfXIlF6He/PBgVQXb0BolF2j7X250J+XGi/zgtDY0jFNH96fq1NEKe9v4lOvQBkPEUteaTX345eyyIguaRgq1YvayuLFnEjOWiM+utBFQtSFQrdOwbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=E05zhYWK; arc=fail smtp.client-ip=52.101.72.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="E05zhYWK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VxGx4Wurix4CXuviApVngrbSB9sUSuENXRoBNXwuOpumLZ6C+Uc54aHkxYNWo3yaXMKUM8AtbgM/xOdU6NvIL8CDDeN89/bEylw856P9tvOw/EpiRLgw7913tG1JoWZMEyEAlebXjsQNgGm3fkSrum8apvakqloYpoK0Jg0GpdkEI/p5SsBLKfSaTAIhh+bJWfhbyw5wzsPon1D9W3B3M5slU7VMisa3HNex8Spm6FTHLHP7xO1G9MCCxkx2hQ6ET030nKx4Xp5wGEsK8pqfoLDBdNUVCUc9uw05/1DH7V6CdhGY/cHFtkYUX6qevrKF97OixZTRNK3BfF3WsG51Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAzS0umrcJwjIangRZ80uucUKtpmO90IGAr9mj7FgRc=;
 b=tvvwcV2IB+2/qv2L7yk9XLO99ysTZTnT9wDEv8duXL6xIyl0EFJOFHr8vBNuJV62lMfrfc0lpL12DbA7xVvlz6m/TeMkZWpV/RjfHjqzOGtEkdVTOlTiIsYALDQ+0M9xKFqf/qoAmmgA81WidgUCtY3X2YKwg53rWXHgL2ki4roACFEfs6XAhwfGRzEcvgEGX4LirF+s4wqGY1SxZvegbt+pzToHPluOd8uydKUDAoHECKWH1WDXf2A2bQMJ2cOz2pGOuyShEFrS8ZfNW2PMilVnXvI82ffFEBA+GuJmg3H+prEPXZaoiYk8XiYe5xPCHyP/sZgWrWPDSp9bIa0A2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAzS0umrcJwjIangRZ80uucUKtpmO90IGAr9mj7FgRc=;
 b=E05zhYWKcY6OOkwHTyoQDgbXXgRDsk8VTNZbZGstsURrN1BZxzZwpUPkZXg84lswwC7522TSSJzz+IIgirifMmIk5SpAGDPUz7yYxME6dQ+cuX6GmpZGYewmTEdChG4ASvGJx9s6JS8s5jI5RtntwG3vjmbB+ojZB6o1N5V7vmmt+s4pzjWKX0i73taVlQj/J+cDkKK0GuQiKTQEuLl+VWNSx3h3gqoGPRg1yS1/d4smu7SKBdy73WRTamLZytNyyuEqZVnpx+UvLhzXdXfNyyJmYMcw+SDSNSmk9yOS4PmAKkiQxgXkhs2Y083e636YzSTOtaKRFVwutMIeV82hZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10452.eurprd04.prod.outlook.com (2603:10a6:150:1e7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Sun, 5 Oct
 2025 14:15:05 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9182.017; Sun, 5 Oct 2025
 14:15:05 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Sun, 05 Oct 2025 22:14:31 +0800
Subject: [PATCH 6/6] remoteproc: core: Consolidate bool flags into 1-bit
 bitfields
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251005-remoteproc-cleanup-v1-6-09a9fdea0063@nxp.com>
References: <20251005-remoteproc-cleanup-v1-0-09a9fdea0063@nxp.com>
In-Reply-To: <20251005-remoteproc-cleanup-v1-0-09a9fdea0063@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Andrew Davis <afd@ti.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759673682; l=3014;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=u0I9HnKhmATwQND0ngMpUwbnylSsoi1syJFcCpBLHew=;
 b=46x5oklkR7Ce7f1buRZr0gOdJKvndX6c3e/iqp4npNX+RA55o2NOF3w3qOOF5ztG4JANrW/uW
 IX7wta22EwEBIJ4UNecqA60UJLV3TE33GUkNbEhuf/CT1ePr3wzHHyi
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
X-MS-Office365-Filtering-Correlation-Id: a9a04457-7179-4217-7c7f-08de041994ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q2pCM05lSm5jMm9LbE44MUJNckhwS1NGZTQ2cURpWk5yUjNBNmlnNUdodkI2?=
 =?utf-8?B?RExGRWt3MjBORTgvVDZyTW1aaWswL2J2ODM5VnVIaS9YeWtDeFcyazQ3Z0lk?=
 =?utf-8?B?YU53SnpIMjNTL20vbk14Nk5BZzJCM1J6KzJqVkkwU2NpUy91MUlDV3ZyT0to?=
 =?utf-8?B?T0hqeFpKWHVSWXY1VDZRNzBBTllmRFZ0aDdsTlhqdVhjNlE3T3hzVzNrNDI5?=
 =?utf-8?B?V002L0x3b3lQMVN5V2pTZUpESS9UQnNPRkptSTBOZDlobDZSb282d0VKRFV3?=
 =?utf-8?B?VnIwYndEM2tzTkpRdGNIUUhGNjN0ZVEvdXRlTjV4TDBqV0VhejgxQ2RSZU9R?=
 =?utf-8?B?NXVxUlgyMm5QL05kblNBVXpnbXlFMTBRTDJvZ2Fpakh4Q3ZvRkVoUzlGb1hK?=
 =?utf-8?B?eG5VQmxOemhZOGUzTm9hMzc2VU5lbVJlN3BaaVg1QS9lM0t0K3RGMmJpcmJ4?=
 =?utf-8?B?NjZSUnA3eEV5b0pFbksyQnBmUUMwcTNhOHN1RkFYaGxPRFdnNTFBK0hCZXhT?=
 =?utf-8?B?YytnOWR2eDRiMDRtVFRMWGRZblZIZ2JHV1QxdHJmMFpRZnRVNmRyZmVLRjZT?=
 =?utf-8?B?S0dOOGVrNFVPejVYaUdNaDg1ZWFZWWdaU1RuMDZlZ2JSY080SlozZzhxYmJK?=
 =?utf-8?B?QTJlSW5sMFZCdlZCdkZYNDM1enJXQlNPRkhuRXJDbUdQZUJIckgzVEIzdVIv?=
 =?utf-8?B?M2s1TWZtaW9vS2ZzZXZCK0p2Z3lxOUl4cC9mOER1blpGVWJsZ1Y3ak1OMzZ2?=
 =?utf-8?B?WTR3dk11dUk2T2FSUmFQeFBoUWIrWXdhby93V1ROTWdISFlSNDJLUXFtdThO?=
 =?utf-8?B?QmcyOXY3OHY1cm85K0lQMGtNN1pNMmFreU9sVDZqUFMrZk5HVjIvYTA5OXEw?=
 =?utf-8?B?RFlQS1N6Z2lXQVU2NjNweWRkQlZOOHltazBkbmNKM1J1RTdZNVBadTFpOHJs?=
 =?utf-8?B?RHQ2U2pocVVPTTMzeWI4VEJLenBWaUczUGxKc3FpMGxTWG42b05YTEJtd080?=
 =?utf-8?B?OTlwbFI5SytycVcxaFZPNWhlUHVndEcrdWxnbVlrVU56dnpZOHNjZ0VRNWlL?=
 =?utf-8?B?d2UwekpyUkg2NzZheUdHeXBDUTEvNkt6MXdnb2VyU3JYN0FUVUxPWjRST0dz?=
 =?utf-8?B?cWo5Y2NCZmYvWit6RVgyczdZSUM4OGpHZ2dXb1FaK3NLRUhQeTBOSzc4WEdP?=
 =?utf-8?B?OGVmWCtGaitJdDdOMzlmcTJ0cWsweTFqVXJxaHdrRk5KdHlCZysyOVRkTmg4?=
 =?utf-8?B?c3NHeXZ1VGluTk9sK1VHdXJnT2xjNmExRkNuZDVoZFRNaWhHWVdUWWIybzNo?=
 =?utf-8?B?SUppUWlxM0F0Sy9STWkrV1RJdGJXRXRTbFJyd0NoVmZBYmtSUjFJM0NLbkJY?=
 =?utf-8?B?VDlvYkZvcU1rK1RqSGx4S1EwOWY0UDRlYXVZcE81UEdqQjJ1SzVuRmxUL05X?=
 =?utf-8?B?L2JNcnlCMVJINEliM2hpUU14MnQrb3pGbjhSdEoxMjJuWElVcFJpR1pra2VI?=
 =?utf-8?B?S1h5NEFQZFN2NXk1REdxUTJ5TEw1Tmd2MTNqT2pBWktoNEJpSXUyL2pLeDlE?=
 =?utf-8?B?aFlpRFJIbzFNbjAveXh6Nk5ya3NWTDJLV2RLUVlDL1Y4V1FpQWZ1WGhRZGYx?=
 =?utf-8?B?aXdKNDJ0Szhqb2VrNE1KQTBiYTExZ25NaVhLcUtRZFJVeDVFNlZiMkhaZ1d2?=
 =?utf-8?B?VHl0SGIvOUdLYk5abnlEYXYwRTFkOHFnUGpIMTAvbDlmZmQvREFwdnNLU0lB?=
 =?utf-8?B?b1lBWGplQmFHbTM5dzhMMS9CbC8yRnFQMERJL0hBcU5vSHZGMFpZd0FPOXB6?=
 =?utf-8?B?dTE5T05YeDUwV25mejhMeGtCQTl4Sm1keXA4L1c1emlDQVl4alpuQXgraUYv?=
 =?utf-8?B?dlZuU2pGSnpWa2QxVEt0TUFYWWcyY3RLc21MT2hRRTJYbE9TRHBYdlppL3Vo?=
 =?utf-8?B?dllhMmk2NW0wd2FsazZRNU1JVkY3dW1SQXVRT0piVzl1RjJqS2hwS3FOZGNp?=
 =?utf-8?B?L1IwelEwV2d4R0VMaGFzRWFkUm5CbHFTWUJoMXJBUzNIcm9TRlUwM2N4RUNQ?=
 =?utf-8?Q?VrRp6q?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0x0YWFWVmlUaDVHWTJGVytnS3BtbEVJeThOR3VXUEszL3l1WDJkWG9LZC9X?=
 =?utf-8?B?QVRwR2xhMmo5RksyR2VmdHpkM2s0V050eVJJTzh2Z29uaUlHTFNDNFRndDRI?=
 =?utf-8?B?ZFBLOHBEU2ZiTjhJbVRSb2tqbStlNjJZTHJEUkF5M09EUGV6cVNaSTdxbnFT?=
 =?utf-8?B?MkdQcUt4NlQvMG9pdlZvNUVmK0p3WjJpaVhSUmNpUktVVFFTVGNVaEs5dnFC?=
 =?utf-8?B?SlVucmpLWDlZeTI0b3JRODFtWXBwSCtlMkhvb3FPdDZ1T2E5eEsxZi9uVk9z?=
 =?utf-8?B?UmVYTlBacG4zdWZXQVVlSTlsWjZGZGhuanFySHBad2Rha1VnbjkvMjFKUkJY?=
 =?utf-8?B?dFFDeWNDaGEzSUZFQzM4QkR3VTV2UFFYSHV3VjRneU1FVGNWeDRaelNrakFH?=
 =?utf-8?B?QUw5T3ZDdlpnUDlMekNuTy81UnArRGpWRGZrOU5rbkxSaDJXRzJXenM2cW9W?=
 =?utf-8?B?RWtsSjlseTR4R0ZUb3pIUnA0RVlaalhpRTR2L2Q1Mnh5bHlWZlByZStRRHhs?=
 =?utf-8?B?L3M0UERFK3VpRXlTdVZhNWJqM25TL0FGS0VKYUFuc2V4U1BkQVgwWkdiaTMr?=
 =?utf-8?B?dU94bitwOHVySUZEVEhCSkVjWEU2WlkwS3NwRUxXYmF1UW1lSzQ5TCtHK1Va?=
 =?utf-8?B?bC9yZW03SkcwZ3ZTZENML1ZQR0ZGUW9mS0d0Z0ZZVG5jSGpiWjkwMXJSYTZJ?=
 =?utf-8?B?MnA3WWdFVkZ4dEVLSCtSSjdYa0R0S29nN3kvUHZhNVFxbVJHVEFNNHVpZElC?=
 =?utf-8?B?b3ZIM2R2Mk9wNlJ5RnRSWTB0R1pmNzVCVVNGMXdMVXZ4WHlHRDhERm44SDZo?=
 =?utf-8?B?VUtUcnVyMWo3Y3hhN29MSFdNTUdCQ1ROUm40S0l3REs3Skl1U2ptYXR1bDVX?=
 =?utf-8?B?TURwVG9qVXVVbmJzYmRXZkcxUys1Ym0rZ1RwZmpFTlJpVmhqbDhKYXZuMVlr?=
 =?utf-8?B?QXA3Y1QxRTMwcHYrcEkvSGNiLzYwNTRGVlI4TUxVMGZQUVIxNXBnY0VIdndw?=
 =?utf-8?B?ZitwUGRpZmN2bkNlZnpRc1grb3JCNEI0aGJ2MUdrNGVqQzRMSU1OdTFabmR5?=
 =?utf-8?B?dTdNd3NEMFNzVjVUdzRWRmNZV2sxK0lmM0E0STJVVDVZczdPYksyRktlWUNM?=
 =?utf-8?B?SytEcy9zNTlSWExrN2JacEFZekhTZmdKYUNzZk50bk5vSFRGbXFhZlliR1Yy?=
 =?utf-8?B?QWQyNVhCSGw5NXNKaXNhTXBDUXFTcFhOK2FUbzRza0lweGRBNEljT2Rna3BG?=
 =?utf-8?B?YjF6L0RybE1wcUYyelBQMnNFVExObjl0dmF1K0RsaGZONWFkSlpHTUVWSkVv?=
 =?utf-8?B?ejZJYmVDMU9sY3dhMGcxSldFeVpiUmRrRERjK3k5QkNKRVJWYU1rczloVmdn?=
 =?utf-8?B?azBjSG91REdvb0gwVWtYWDFGaG43ZzVKekZuTE03eDRBZUQ3cUlsKzhiNFJL?=
 =?utf-8?B?YmMxVHVaQjZpQmQwdGNTY3dMdGdBY3dNbjJSRDg5WFl6VkNWRzZkUm1SZytQ?=
 =?utf-8?B?Sm9VWkhrSG00eXA1dnp0SXZSUDNKOFVTc3pFcVMzWmlVTlBrbFJ4VzBtMThu?=
 =?utf-8?B?M3UvSEFpQ0pFb2VwTzlqVm5yTkxyeHgvcjdFUnV3TE0zZmxtRUwxeFF0ZVZS?=
 =?utf-8?B?ZWJOWkFNYVR0b0N0dUZFbWVpbEhFUEJiaWNTV0dndHRINWR5bzgxM2ExbjFI?=
 =?utf-8?B?Nnh2bXc3S1h5V3NoRUpjZ1ZUV2FoSlBxSkFqMlZQMlNNNk9EV3FSck5CeDhz?=
 =?utf-8?B?Q294bUpkWDZjV0hBUlFsOG9ONkYva251M3JERXljNUhVekk1Y3dpV3VUMFI1?=
 =?utf-8?B?eWhDYnAvN2xqRk5xbm5FVWRQRnV4ODhSaThWYk9kbGJKelFyYVdKNlhnQWdM?=
 =?utf-8?B?QWx5RDZDeFdNK0Qva3ZyQzUvZEYxcXZUYy9UVWhOM3BZN01VeVhDNGI4VDhv?=
 =?utf-8?B?eWlpRys5RTRERzBkNU4xb3NjTUx0NHRQMzc4a2FldURzWksxUGZjTlRMdEM3?=
 =?utf-8?B?T0xnQjNKb0djekx3Sy8yY281cjRwbzF0KzArTGxzZFBaWnUzbDZwckdqa21a?=
 =?utf-8?B?QlFXRGh5U0NOUmpFU0JkNFZ0NHJMV3JKREVRR1lhL3B1ck1SaG9BdG5ZUzMv?=
 =?utf-8?Q?qa4i/141dcuHgCq4NjSscFkul?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a04457-7179-4217-7c7f-08de041994ac
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2025 14:15:04.9447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ow9d1c9EVuFAz0vIkr+iisPaWgk6BxHASdJFi+1z7DEaD/WrMkA7yI+cb+7Vga+MnNq2xCYHDOmGh2rQOK6PgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10452

Per Documentation/process/coding-style.rst rule 17 regarding the use of
bool types:
If a structure has many true/false values, consider consolidating them into
a bitfield with 1-bit members, or using an appropriate fixed-width type
such as u8.

This commit replaces multiple bool members in struct rproc with 1-bit
bitfields and groups them together. This change reduces the overall size of
struct rproc from 0x4d8 to 0x4c8 on ARM64.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 include/linux/remoteproc.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index b4795698d8c2a4e80ccafbe632436c4dfb636a1e..d8468a96edfbd82f4011881c10f59bf7c12e9c1a 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -528,21 +528,21 @@ enum rproc_features {
  * @index: index of this rproc device
  * @crash_handler: workqueue for handling a crash
  * @crash_cnt: crash counter
- * @recovery_disabled: flag that state if recovery was disabled
  * @max_notifyid: largest allocated notify id.
  * @table_ptr: pointer to the resource table in effect
  * @clean_table: copy of the resource table without modifications.  Used
  *		 when a remote processor is attached or detached from the core
  * @cached_table: copy of the resource table
  * @table_sz: size of @cached_table
- * @has_iommu: flag to indicate if remote processor is behind an MMU
- * @auto_boot: flag to indicate if remote processor should be auto-started
- * @sysfs_read_only: flag to make remoteproc sysfs files read only
  * @dump_segments: list of segments in the firmware
  * @nb_vdev: number of vdev currently handled by rproc
  * @elf_class: firmware ELF class
  * @elf_machine: firmware ELF machine
  * @cdev: character device of the rproc
+ * @recovery_disabled: flag that state if recovery was disabled
+ * @has_iommu: flag to indicate if remote processor is behind an MMU
+ * @auto_boot: flag to indicate if remote processor should be auto-started
+ * @sysfs_read_only: flag to make remoteproc sysfs files read only
  * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
  * @features: indicate remoteproc features
  */
@@ -570,21 +570,21 @@ struct rproc {
 	int index;
 	struct work_struct crash_handler;
 	unsigned int crash_cnt;
-	bool recovery_disabled;
 	int max_notifyid;
 	struct resource_table *table_ptr;
 	struct resource_table *clean_table;
 	struct resource_table *cached_table;
 	size_t table_sz;
-	bool has_iommu;
-	bool auto_boot;
-	bool sysfs_read_only;
 	struct list_head dump_segments;
 	int nb_vdev;
 	u8 elf_class;
 	u16 elf_machine;
 	struct cdev cdev;
-	bool cdev_put_on_release;
+	bool recovery_disabled :1;
+	bool has_iommu :1;
+	bool auto_boot :1;
+	bool sysfs_read_only :1;
+	bool cdev_put_on_release :1;
 	DECLARE_BITMAP(features, RPROC_MAX_FEATURES);
 };
 

-- 
2.37.1

