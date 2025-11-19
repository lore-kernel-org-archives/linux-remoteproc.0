Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011047.outbound.protection.outlook.com [52.101.65.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5EE2FB094;
	Wed, 19 Nov 2025 04:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763526170; cv=fail; b=bsZj9aUF8cCwXpTq28bEiBUi5sVh4Y2sYoZT0OSzIofvWBuX8y81rdcN58EKi/Yc9FJpXrkzOT9NUlx38S6qUZ65EKjJwt1rFMHxprKrjl32G59ccSc5YXtk6Rro6unkJwld5VY6n9wqPoMytKJll5An+L642kgMCAy2aJ/fB6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763526170; c=relaxed/simple;
	bh=20bvPCn1BIpf1Wg1pzFM659Gz0cAUYExqPmZ29/1Jmc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=dXfndYqxHodGCNYujgkmrrbKzxlY1+f1YiYAmN0hhHfVt3Vl+v2qHXNLvThctxQQ4PBZf2XhwBYCUcvRBcLpaSfnUCn2zpRMrD4jRVyV3Saj3J4zJ0dLjFtXA0X6/JrcO6SLZVW3nRb7yl8kcDBRA5vgZ1N0py+p7xzBgpuywks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=X0j0VVcG; arc=fail smtp.client-ip=52.101.65.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="X0j0VVcG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X4u03Rq4oV+LaHXg5l9w28Nkq/fmEjkl3gPE8pdF7yNjJ/BmJkFqEQDdMF/RrwUm7Sjuh2E4PWUDywgqN1pK0A5MyqWwGafKLvXJTYhXpNCiOn0h3RDjZzayeBgBWEbr4mYGBkGKJ72KxJ68D+hcoPiEv7cm0fXpRv97lpP+EUi30krCIgFIg+8p5+xp/iGV58JCnxrGonHiXCeUqunhLIcl+/ZNiQAGvQ0FwkM7inEslJrWY8CBwny3FpYapM592meNoRkOZnxDEZ26G9hIcOcmVb+Qby84dzJgwYuqpxKeIR8EtaDnBJWHCBb4IUS7X4XH61VFS9wvyX/IA9aLMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/p/yqsMHZhWKnZlfANxUcEBPdqNnSFo8xIg8MPc61i8=;
 b=kxXV1sMmR2XMRo1o0PiOoFk6YvCy4cLG+0mCBDhpcMhX9D5bcWgXd9AuQBKGyFeEWMRO1SO+E6r7qFkjrQTuPRkkjLYbKOETKRlPz8JLZxJ/Mu+0jBjBm+AQmYjRfbOPUHzWaZt34sHWT2apqxd1xMJhYeK2zojda90VGwMFm0snGN/O9NrzI3exOT8HWS0fDoIT9avjdbZY7WwnbKtRyjWVy6f+nSCDHT8YV5zXEANS0cR552KxuS0ZD61RMhhZbhhKooJNqXYwbm0B6qFu+CnaB4Q8QwgF1fvZTUt+Z4TnJzDtixKYVndPuNygyof9mDjhXlNIX+KafXXIUvqKfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/p/yqsMHZhWKnZlfANxUcEBPdqNnSFo8xIg8MPc61i8=;
 b=X0j0VVcGYndmSaV9dMQxpQ/pd2npsZxYrOD36Gt1jijGlNMWibrPER5pvWwPkELT6Ahcwys+LP9Os/iO53p+9sjvI/LXoei2JdoBZFQFWJRXiKr+pfWRHCgQ8G0TdZns0uuvNZmC+NNWWOzaERXMJbXAv2iQGGrj7FfD5sX/iATN5HWyg1lhRXg/por6RYxCT3SeQddrOfm9fnU4k09VCIlJTawik5FcOGHeN5xE8UyCQAnpcnrlxhVN89sLQdPHRTM1LgwBuOseYNNBUOh7Y4hQNpleUotAyV9XXtFj/1EaSORF5Hx4lXlNzMrubSGYurJAcbBIJOavH/3zjy0NzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA6PR04MB11949.eurprd04.prod.outlook.com (2603:10a6:102:514::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 04:22:45 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9320.013; Wed, 19 Nov 2025
 04:22:44 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 19 Nov 2025 12:21:54 +0800
Subject: [PATCH v4 09/12] remoteproc: imx_dsp_rproc: Simplify
 IMX_RPROC_SCU_API switch case
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-imx-dsp-2025-11-19-v4-9-adafd342d07b@nxp.com>
References: <20251119-imx-dsp-2025-11-19-v4-0-adafd342d07b@nxp.com>
In-Reply-To: <20251119-imx-dsp-2025-11-19-v4-0-adafd342d07b@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA6PR04MB11949:EE_
X-MS-Office365-Filtering-Correlation-Id: b71530ec-88ba-4dc7-4e72-08de27234970
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S0FXdWEvWXZJN0ZBMkdDWmZoN0YyS2ZQdnhuK1ZyUkxsZ1RsdWlFREFpSWdR?=
 =?utf-8?B?UGlISjFHY3pBR2NWSFM5UUZjY0FNcWJueDFNcHNXRENMSFpYcTMxemRIbHpI?=
 =?utf-8?B?bDdTS0UwY0lsSVBGWDBsQnFBbVBTd05NVGJuNmsrb0JFM1g1T2puMUl0QWdX?=
 =?utf-8?B?QXBtb25QSEJnWHZjYWxaVjBSNlBiYnBhVU4rb1k1OXI4N3NXN0NobWxyN2Fh?=
 =?utf-8?B?bkpGSnVLSXZlZThjTGpSNmhuTVdBZDhOenpmS1lBM0MxTTIxN2ZDMmtlY3VN?=
 =?utf-8?B?WDFZa0htbk9YSjhFR0RZQ3lZR3V1cjUrTElNanNzRFcrZzZGMkpFenplZE93?=
 =?utf-8?B?Y2k2YVJWZmtPa0lzTXdheThQUlZRYm4zYkoySnBzMU5TZmR5WnFQQUJwL1hm?=
 =?utf-8?B?b202Zzh6TWtYK0wvRS9la1p4NGh4eXA0ZkgrNGRhOUxvMW1sRXRjT3dMUkRM?=
 =?utf-8?B?WEpaYXF4VTI0UDJERTZJanR4UytRRDJKTTdxc2t1QVg5T3duTmp3eWRmRjc4?=
 =?utf-8?B?czFhZFV1cDUxSmpUSHZwak8raXpyQzB0WmxDV1I3ZGZNZnFZZFVad3pycTlk?=
 =?utf-8?B?ejVrZHp5TVZJQzhRMUxjQkd5NWRJV2pSZ1pZRm15d2I2MHlrTW9xVWxXTU05?=
 =?utf-8?B?a1lNeTJRUllUcTB1Qktwc0hZL2RpYUhiNE9iTTRweFltNlZsNjFVRzJxZmRw?=
 =?utf-8?B?dW9qdkFXY0RVWU42aGtybzBmSUJzZTNBdHRlaktaWHhXOUF2SkdZbTZEdXI2?=
 =?utf-8?B?WksxZG15b2hxbUlDeGdTYXA5WnFRbTNLYzRGTGR1TGtoS3NheEpqOGNaVFFG?=
 =?utf-8?B?SjJrT1pUNzRpYlFaSmRUWDVaU3o5L0FoMTFOaFB1QUtZQ241Z3V3SXlwRUtQ?=
 =?utf-8?B?V1lNZWk2Y2U5UExtRU8wMWkxdUl1Um8xbkJGMWhYTXljckx4enJzSHJCOVhp?=
 =?utf-8?B?QjRudTh2ZzlwZ3ppa2NUQXc1VVRoL3pYL3F1V1ZWMllrUWE3NWIrdXUrdnlG?=
 =?utf-8?B?RFZTTjhOd2pKWmQzdytqOTJtLzhOcXlRbDRjSnpBb0p5TExLMW1Bb05VdEpS?=
 =?utf-8?B?bHZiRFluQ2xYZWxzRzlTRWxxYUJHMVYxZm5jRmR3Tk8xaUNJOVhDa052N0lx?=
 =?utf-8?B?dURzRFl6M2VVOHZ6TEcrQ3E3Ty9aZkg5M0QrQTZnSk1RTGk0TkhHTzliSlB5?=
 =?utf-8?B?L1h3ZEFMSjVDQ0wvWHZuVFFCczhyV0Q4SEd3YXB4MWE1ZGdIaDhGRDhkZFll?=
 =?utf-8?B?bGJJMTh1NEEwYU9hdnR3N0F6RXBZcEV1TkpEelZzRmwxYnpJVGMvbTA4K2Ro?=
 =?utf-8?B?eXIvdm5rQXYxY3JDdmNQOU1jTWoxd2F4c2lTbjBRWjBudmR5RSs1d2d1RDJP?=
 =?utf-8?B?dWpaUVRsb2hMTUtXak9LaGl4eFF6bE5wbzBKa1pYajgzeThMVzdtQW5oc3li?=
 =?utf-8?B?UUJpQ1p2L3JpRDd0RUZHVmxBczl2ckV6b1YvMENsQXlMUEQ1Q0FrL010aGhK?=
 =?utf-8?B?V1Q3dlJhSnVtSWZFQ2plVWxEYkYxSnF1akVVbUNCRmF6WGJzc0pVUkNzcE9t?=
 =?utf-8?B?cTN6b1FFRG03WGFpeHZYRmFRa29mSzZva2JFZFprbk5hN0k3a0lUclUyc0lY?=
 =?utf-8?B?cXdGck9qeHlGOGc2ajZQc2Vzc1plbUVId01NSFA4Q3ZGMzg3MlBvaE1pOGli?=
 =?utf-8?B?MVlwVEhhUXZ2b1czQWY5d1RWU3NDdTRLL0tKTkJ1WUNjdG55ckdlU01FQ2g4?=
 =?utf-8?B?RFhBb3ZtQ3hKaXhpd2VzY2xuY0taV0dZZzEvdnlZcUJReHk3NG9qU1pxNUNP?=
 =?utf-8?B?YzB2OUVYV0lkRlNTQjZiL2EySlJYRGpqZmVwMXEwZnlwOVFjWnNDMUErVGdI?=
 =?utf-8?B?RmFqSkVzSVFZa05najUxQmtsM3hLK0dha29JQVh5bUFZSHFTOE5FU0ZYdDhJ?=
 =?utf-8?B?ekl2cDlLVEM1Yk83ak1iRVhBTVM0YWRxOFVvTEFCaXZuY2xjdCs4TW9NODZZ?=
 =?utf-8?B?ekluNnFMMktzRERjZ3I0ZlQwVHNJZW1VSDVvMWkrNUIzQjVNcUtjLzhOR3g2?=
 =?utf-8?B?SUYvVnZEd2ZwU1pwUFRldnQrYXBLWXM2N3oyUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFV0alR4YkppVUZFV3BtZ2MyTTcwNnVYc0dpdy9RSlRDeXVQUUdIeXYyU1VT?=
 =?utf-8?B?SW5SbkFwdnRzUkM3a2luSzR4MjNrNXVlYmt4NWlhQlNMU3FDdTM0YndkeGdn?=
 =?utf-8?B?ZFNoZW9GTWNFdDlFcXBWSkxneWtIRXpTbThJbzEvR2tXL3drMzI4d2VKbzdE?=
 =?utf-8?B?VDlaRkg2Z2YvbEE1MVJaVXVTa3VyM0QyTWJRWG40NTNqQTJVUzNOdkZzYXVx?=
 =?utf-8?B?ZGdxSFhRYVdvQkdSN3RvU3VpOUNKaDRzdldLSVRDdDRDRVRkaHU5a3ROSmYw?=
 =?utf-8?B?UnFCOEF5enlZS3pJVjA4M2FSbVp1ODkrcHZscjdjNHhwS1ZNb3BqTWpZMHBa?=
 =?utf-8?B?blcvb1V4WjBSNWlEajErMlRHY0NWMzVLeWVpZzAyME1kaWhMWld5eGhRZ3M1?=
 =?utf-8?B?dWNhU2gwc21YY0N1emxTMDZYSFBuZHJlZkpYL21XSG1ZSmlUOFlPRm4xQW9l?=
 =?utf-8?B?R0VtcWYzeTh1blNSb0svakZqMGtOWmlQVzU1TEtZZ3V3WkluekI4c1ZUNEE2?=
 =?utf-8?B?b0lVOC9UMDRVWVNPbGtaU2xPc2Ztak1wSlFINm5uOTdqOWx5dGttTEQxSXZK?=
 =?utf-8?B?VU5TMkRjWkdMOTRiWjlXTm9KUUxGNWdHN2E3cjFQM3NyaWhabDM0R2hhV3Q3?=
 =?utf-8?B?d0VpTG4vQk9pWGJWTk1IUk8zUlBOL2NJSU5ZMnpydCtxYmJiSmpTR0F5c0g4?=
 =?utf-8?B?OXZPSnZPanJqcUFxUStkMi9SOVVSeTBESUZMOEo5UkdUVFpOVGg0cHJ4NVY1?=
 =?utf-8?B?SUFpUW9udlB0dGZFNk9Zbmt5S3VqU2FCRTM5VTNOaVpaVHlwWUdSaFdrR21w?=
 =?utf-8?B?NjdkN1dWeFRYek5zQW5ZVGxpOWVsd0d2TXVBTFFWL25HQ2NiMkh3VWJ0SWl1?=
 =?utf-8?B?TGM3OE8xWTZXWXkxKzBta0h1RkxwNjd1QXJjQU5WeUFPRnhGeHJIOVVjM3JI?=
 =?utf-8?B?WjUzMjdkYk56TTljUElBVFhBRVd2UXRvNGpJV0dFR3lPeCs5YVRNeTlSMzIy?=
 =?utf-8?B?V3dyb2hicnNRT0UvRkk0dFNqZ0FnV0dWNmJka29Zem53ZnNIRnVEamFKeTZq?=
 =?utf-8?B?QllBS0puVWZOcVllQ2ozRzIwRkRLSTRrY0svZmxFTmp4blNmL3lpaHlxNlov?=
 =?utf-8?B?QVFQVE1ERkl1RjZ0NitGZXRrOGEvcmUxcWVyOHF0dlhMOWF3STRDalBoVlVU?=
 =?utf-8?B?ckw0eTUvK1Z2L1U4S055dkdhQVdEcWYxQklEL29lR2pETGgwWGROS20xWEUw?=
 =?utf-8?B?VEdkdXpLY08zc3FEeFJuTlpFMmJHY3Y1UWxYWXd4QzV4R1VSdlJTZ29TNU9y?=
 =?utf-8?B?TnpqdzZYUlY5b2hraklNVEJxL2dGOW5HMXo2cTdBZnFxVWZuMUlHTzl4L2Zv?=
 =?utf-8?B?QXppQTJYeExkRGtnRGV1Tzdza09nTG5lQnQ1SzJSR2k1R2RPb0NsSzRscSsr?=
 =?utf-8?B?b1J5NUlvU3NkWXViRnV3Q0trd3hWSlJkOXphWEhoWmZYTmFxNWhJRUdENkJM?=
 =?utf-8?B?ZU1Sem81ZVNnZ1c5ZHJkaEVrWmlBZjQyYXVwZTRHaFFWaXMyZ1JYd2E3Q3Fy?=
 =?utf-8?B?bERxTC82L2lPRU4vVkVpS2VBQVluQWxtOHUzUmRVRDViZFd1cGYxdkQ5aFNM?=
 =?utf-8?B?ZFVXem9rZ29MNk9sTDJ4UlRBbmNUS2ozU0lQdmRqeFkzaGthR25RNWc0bEpN?=
 =?utf-8?B?NEJwUURhR1AwVzlVRTZsRFVsZnByZjJmSzdyVEJGR2xxQ1M1QXR5eTJCQ1Uz?=
 =?utf-8?B?aFAybHFzVkI3NmtuRnd6VWRzVkZBRElYa2diaDByQXBkemRWdW9yYVJVNVNQ?=
 =?utf-8?B?QTJBbkVWVlpCK2NadFBGY1Y2RDdGRHVySW03K2syQjFPc0lwOHBVVWZ4OTVJ?=
 =?utf-8?B?S00rZWtWK0ZZMGJocVlRZnVYNE1QYzR5YlZCa0JlRkJnclJmbTFnNjlXV0h6?=
 =?utf-8?B?NHdjZU56NjMxakF3TlVvZG9PckhnODZDM3dHVEIxdlc3N285NU4xeXRQZmRU?=
 =?utf-8?B?ZVZzNHJmeVk3M1VFbEY1NU5aRy9NNWFLVzEwSGh3Z1NSUVhISXlsQ2Y1MytV?=
 =?utf-8?B?UXA2LzNnSHROVzVGbTZHRGxhb1RWWkRaVHBKQUppQnBGWUF3ek9IWGl3Y04v?=
 =?utf-8?Q?ulnMw2CE44GQNsm3VpBQAyGse?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b71530ec-88ba-4dc7-4e72-08de27234970
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 04:22:44.5548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AEk4PzmZ+b5JxfW/L7wyoPycbBnYL9DSWk6uf6G0yfl1guH0M3M7D4GurwJhpFvpFZfMh86JKTI906MykjgpcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11949

From: Peng Fan <peng.fan@nxp.com>

Introduce imx_dsp_rproc_scu_api_{start, stop, detect_mode}() helper
functions for i.MX variants using IMX_RPROC_SCU_API to manage remote
processors.

Allows the removal of the IMX_RPROC_SCU_API switch-case blocks from
imx_dsp_rproc_[start,stop,detect_mode](), resulting in cleaner and more
maintainable code.

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Tested-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 48 +++++++++++++++++++++++---------------
 drivers/remoteproc/imx_rproc.h     |  2 --
 2 files changed, 29 insertions(+), 21 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 71776816c3508a86bf7b8a09ac45827a83a7bb3a..91d041c15ac19f527f48c8189421f71fb7c9745e 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -346,6 +346,13 @@ static int imx_dsp_rproc_mmio_start(struct rproc *rproc)
 	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_start);
 }
 
+static int imx_dsp_rproc_scu_api_start(struct rproc *rproc)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+
+	return imx_sc_pm_cpu_start(priv->ipc_handle, IMX_SC_R_DSP, true, rproc->bootaddr);
+}
+
 /*
  * Start function for rproc_ops
  *
@@ -368,12 +375,6 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
 	}
 
 	switch (dcfg->method) {
-	case IMX_RPROC_SCU_API:
-		ret = imx_sc_pm_cpu_start(priv->ipc_handle,
-					  IMX_SC_R_DSP,
-					  true,
-					  rproc->bootaddr);
-		break;
 	case IMX_RPROC_RESET_CONTROLLER:
 		ret = reset_control_deassert(priv->run_stall);
 		break;
@@ -398,6 +399,13 @@ static int imx_dsp_rproc_mmio_stop(struct rproc *rproc)
 	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_stop);
 }
 
+static int imx_dsp_rproc_scu_api_stop(struct rproc *rproc)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+
+	return imx_sc_pm_cpu_start(priv->ipc_handle, IMX_SC_R_DSP, false, rproc->bootaddr);
+}
+
 /*
  * Stop function for rproc_ops
  * It clears the REMOTE_IS_READY flags
@@ -421,12 +429,6 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
 	}
 
 	switch (dcfg->method) {
-	case IMX_RPROC_SCU_API:
-		ret = imx_sc_pm_cpu_start(priv->ipc_handle,
-					  IMX_SC_R_DSP,
-					  false,
-					  rproc->bootaddr);
-		break;
 	case IMX_RPROC_RESET_CONTROLLER:
 		ret = reset_control_assert(priv->run_stall);
 		break;
@@ -1055,6 +1057,13 @@ static int imx_dsp_rproc_mmio_detect_mode(struct rproc *rproc)
 	return 0;
 }
 
+static int imx_dsp_rproc_scu_api_detect_mode(struct rproc *rproc)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+
+	return imx_scu_get_handle(&priv->ipc_handle);
+}
+
 /**
  * imx_dsp_rproc_detect_mode() - detect DSP control mode
  * @priv: private data pointer
@@ -1078,11 +1087,6 @@ static int imx_dsp_rproc_detect_mode(struct imx_dsp_rproc *priv)
 		return dcfg->ops->detect_mode(priv->rproc);
 
 	switch (dsp_dcfg->dcfg->method) {
-	case IMX_RPROC_SCU_API:
-		ret = imx_scu_get_handle(&priv->ipc_handle);
-		if (ret)
-			return ret;
-		break;
 	case IMX_RPROC_RESET_CONTROLLER:
 		priv->run_stall = devm_reset_control_get_exclusive(dev, "runstall");
 		if (IS_ERR(priv->run_stall)) {
@@ -1320,6 +1324,12 @@ static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_mmio = {
 	.detect_mode	= imx_dsp_rproc_mmio_detect_mode,
 };
 
+static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_scu_api = {
+	.start		= imx_dsp_rproc_scu_api_start,
+	.stop		= imx_dsp_rproc_scu_api_stop,
+	.detect_mode	= imx_dsp_rproc_scu_api_detect_mode,
+};
+
 /* Specific configuration for i.MX8MP */
 static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8mp = {
 	.att		= imx_dsp_rproc_att_imx8mp,
@@ -1352,7 +1362,7 @@ static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8ulp = {
 static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8qxp = {
 	.att		= imx_dsp_rproc_att_imx8qxp,
 	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8qxp),
-	.method		= IMX_RPROC_SCU_API,
+	.ops		= &imx_dsp_rproc_ops_scu_api,
 };
 
 static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8qxp = {
@@ -1363,7 +1373,7 @@ static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8qxp = {
 static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8qm = {
 	.att		= imx_dsp_rproc_att_imx8qm,
 	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8qm),
-	.method		= IMX_RPROC_SCU_API,
+	.ops		= &imx_dsp_rproc_ops_scu_api,
 };
 
 static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8qm = {
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index 912827c39c0dedeed76c13740efd42a8e7cf9c45..a6b4625e8be76c6eb6a5d8ef45eb5f3aec5fe375 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -20,8 +20,6 @@ enum imx_rproc_method {
 	IMX_RPROC_NONE,
 	/* Through ARM SMCCC */
 	IMX_RPROC_SMC,
-	/* Through System Control Unit API */
-	IMX_RPROC_SCU_API,
 	/* Through Reset Controller API */
 	IMX_RPROC_RESET_CONTROLLER,
 };

-- 
2.37.1

