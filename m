Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011030.outbound.protection.outlook.com [52.101.70.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0FB307AD0;
	Mon,  8 Sep 2025 13:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757336899; cv=fail; b=G/U1YTTkvQp/sXEqp8SATwvQjPw2I1Jv6rQlhGFaYtvvZIoyQ7mlE2e1+c+nGtfy3SrQ/h5uELT5+UG6EPSZ5lsrD5Y2QAjWVav5FdoaxWnPB2MxvKvja6dyYSs3oGplug3jrrC0CvuWaWqgqG4OepfmY9A4BdL0hSn53Tzv8cs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757336899; c=relaxed/simple;
	bh=7w3iAi6f4aYkcaMGArtpSXI/cChNvqwhfeHn1v7YspI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=dYNPQvwQZtEmm6hBjUCA9xPAyWKqDmKxEpUg1OVN8JKileKwWyqtfH2bEXzwJ7KOmQ27inE+VJUVircspc/oslBUUSeewHcCAstzlEY69B5MM8d14KcoLP9eMgqbVdgSYAU1uEAvKZEPwmOaySxTuxLNXR+Nhsx2CHCLQ5xLWRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=e0uhr7mZ; arc=fail smtp.client-ip=52.101.70.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="e0uhr7mZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5Tv4XfXZh8PX97oKcVqyMX6ks+UUc0lMGQ73H6sFX0eZG36iK+svArLEjiR6yXjYjOMxauKqPkKeefNWzJvEN1rrUHViJwBraFV9wExH6PKTpuzUm1MOED/b3dQ6TkkjgO2r0cnKv3qiTH9lFyY39ziDlNe59JnOoqTb16WPxFOxf98romaFg+sEgmIYfNX8TJXC67GAmwrJl73BYK0poelU/j5wUu+HNapeQYP2ajXT0Owwbwu/2QVRimrT830qq+zkr+RYcQNeaPCIpSUL9I0vRTTn5TeBf+OS+6/Jt8NfrM2dt5FqcTnPZ/zzat4L+kvQzcau7ZhOCNPLXvpfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eL5tvCq04Na4/Dobc6ipo3/3LL4Y5NHhUhyGiRZAApU=;
 b=YIua6zb1MzooVzROBX/r6PRt5z+STdJZdVgf1UgnITAYo1CG3X2LCpyiUVtJ9KemOWmD1sPw34pvsu/LyC5V4w0x3zf7aAy5TgPFE2l+AbA5LhtpIRL6fY5jjsXwFtRcA+Rgtt1aVzuOh5vySYE9hb8PKuZg2pxfPBKqPFQU1zegEOjNb1iGqOk6nRe22cN4fSTIELzSLdkXWrNw632le6XHmOqjVAeCZHw8AxWmN3kpxQ/6fVifqzmZ+Ya1kjtbWannQn0arwNNZz6j/pyf25yvDg9umedQA8mJpM12/SjplkeuaFum6/aaDnWw1vPp5Uh6D7IVPsZX8q8fjP67Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eL5tvCq04Na4/Dobc6ipo3/3LL4Y5NHhUhyGiRZAApU=;
 b=e0uhr7mZZWhNQ4RyqrZ2fcyftaBf0qgsenZz+eD8wAMIUVH1oex0cBntUqtZtEv0f9RxFtNMju4sHh9ifw1kSy+4HiWQVU0XI+PoZyep/A5/IBs+wnAvSHx5gbbfGaYdig2Q0D1/HkId/Nz+flegHhhEbhNJEaaXUD1iSpudgH8Yvms0+BGZxfOsOnpJ6zBPS+0wiOYdysyPMGlJEgcwr32/UhGQSFjLIWP9nOmf8Zn7JZpDA4VwrVch/nQSni6tyCQmjRglkPHjprQPgqPOC8M759PQVKRtxsbmJddxq4gc9nrjxCD0GwsoYRYpvbjc3IG6a75a6HF/IQqvB1EBjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB8918.eurprd04.prod.outlook.com (2603:10a6:10:2e1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.13; Mon, 8 Sep
 2025 13:08:15 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9115.010; Mon, 8 Sep 2025
 13:08:15 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Mon, 08 Sep 2025 21:07:34 +0800
Subject: [PATCH 1/6] remoteproc: imx_rproc: Introduce
 start/stop/detect_mode ops for imx_rproc_dcfg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-imx-rproc-cleanup-v1-1-e838cb14436c@nxp.com>
References: <20250908-imx-rproc-cleanup-v1-0-e838cb14436c@nxp.com>
In-Reply-To: <20250908-imx-rproc-cleanup-v1-0-e838cb14436c@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Frank Li <frank.li@nxp.com>
Cc: Hiago De Franco <hiago.franco@toradex.com>, 
 linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757336884; l=2900;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=7w3iAi6f4aYkcaMGArtpSXI/cChNvqwhfeHn1v7YspI=;
 b=i2CpGDb5Nugw1PoLwiZHRyJZoi0dhE5EdAGx22a+e/vD7RAJNUxdoCu12/nLqoaJh4UBVLTaQ
 EIWcJQ1eRvEAHlHaiwdrWInEJLLI2rXJ4pE7/zOFrH5ZCmOrLeYmZBf
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU2PR04MB8918:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ed2a457-19e6-409e-7d81-08ddeed8c573
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|1800799024|366016|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Sjk0dERtSEtNcG90TXk2aWN4TDFyOVRhem5TRS9qYnBlWjgyVkhuNnpYb3Rl?=
 =?utf-8?B?Rk9veitCZ2hISzFPeUp6aVo5eWZmUmJjUGk3eEtwYUdPd1dEK1Vyd3h0VDd6?=
 =?utf-8?B?VFNFVldSalV6NkI1VlF2dzA4dGZHaWozT045QWYyb2JkRTgxWE5RTk9US00x?=
 =?utf-8?B?MENJL05qV2IxaFcxODJoVjFxYSt0djhvL21aS00vNHlVL3RWVkhjM1VCS3dB?=
 =?utf-8?B?T3Zrc29oY0dMTk5SVzh6UVltdWtBUURzREtGcFlpSDJaWlNRY2EvTEJZQ1JO?=
 =?utf-8?B?VGdWSE9ZQUg5ZWNNK3R1SWh5Z1c0d2JJRzQybFVkR0FkRnovSW42LytYdXU2?=
 =?utf-8?B?bkprMDU2ZlI4OHd4QzlDeE9JYmFhUkszOFJJTU5vVzhzdXVjeDBaVE5kRWgw?=
 =?utf-8?B?UnNoUHVJRGxXSVhoWSt3TVVJRGlNUi9CSjAxdnNLUkhBdDBYQW9GRGIybjdH?=
 =?utf-8?B?QTFXNFZWM2s3REpvUitOb3JmNFVnRCtJRm5yenJsWFllQVpoT3FvaHF0MCt5?=
 =?utf-8?B?cW1XYzRIUWlqeDZRTHp6bW1XUE9EdVRyMVVlLzUycGQrMmFHTjhZTmUreXlq?=
 =?utf-8?B?UWpHb0p3MGQzZXgvOHVwWG93aFNYSUZoQkROc3cyYjhOVUFxNEgzeHdkNlQ2?=
 =?utf-8?B?WFBCQlZaOTFKelJVbGZHa2NGSjlBSThJdGVsamJVYnBpaTR3WjRDY0hWbmVF?=
 =?utf-8?B?cEZVM0xLQmNOTmErcGpNSHRJWTB0Ykl0RVFaUDRlU1FaOVRkRWZpakxMbHht?=
 =?utf-8?B?WllsV0dGMm5qVFNOMHIxanZrdWpTMEc0YXlVSE04Snl0cXhzTEhYSFVCczNy?=
 =?utf-8?B?SEJVbTlUK2tUaTN0T0ZoVEtpTXI1am5DRlQ2UnA4STVmVFZwU2RMblRranpP?=
 =?utf-8?B?WXYzQkVOVzh0Mko5aWNiSTBjbjFPaDFjYlowT3F5TVpCLzF6a1kzZ3Q4K2Yx?=
 =?utf-8?B?SWMxbFVCRHVOMGRLS0twS1VkYTBKdXhBU3JvbWFzSFZlSnBOS3FrMmU0azdW?=
 =?utf-8?B?bGpFWGJHdXVjRmRzb3IrWk0yRmdHbXFrQVRaTjVIWDh5RFhibDRQdnFpRjBw?=
 =?utf-8?B?VnRXMHBhN3hQRVZUVUlYdWF1b2gwaC9iNzc3V1k1dmU4YU9jUUJWZ2hkMTNl?=
 =?utf-8?B?VG5uRUxxK2k4dGR4NkVjTXFMdzVHRmczQzNzbXo0M0p0dkp5S0RTRUJFTXQ1?=
 =?utf-8?B?dVYwVVhvb0NIb2FkZGxHMVlBWnJEa0RsSjVFQk91NFdXaEhRc0xncnRlcHlp?=
 =?utf-8?B?RzBtMTNyQzQ2SFdCemZGK2VSSDJuTEVsbWcvVzNJSE42SUNXQXBMSmVncnhz?=
 =?utf-8?B?enBTdFNueVpOSUk2UVNHdlMzVzZyZXplUnA2L3JOeHZNN0QvcTRHTFdnZE1R?=
 =?utf-8?B?TmVqRjZwek8raFZIcHhjb2RrV2duUFoxbjh0WGNzdDRRNDVGZlo5MUZnZk1P?=
 =?utf-8?B?V2RQWWdpNHpaalJRQUdHTGExTjdDdHJ0elBPWUJhTXNHYlpjY2EwUXNQdnFr?=
 =?utf-8?B?ZWtYWmIrK295ellGM1Zoa2ZiQm0xQ0FEeTdqMW1CbGJ1djkySmNpZ0xHV01V?=
 =?utf-8?B?alNydjRYMmNPS1d4ampiY2U1cEdRTlhaTXpUQmtSSzdpOWlGdTJDR002VE1w?=
 =?utf-8?B?T1hpOXFmT0VxWDdjNVlhZng0OFlNZzhzcUVvMU1IR0lWUWdYdVVKQmFYVFd1?=
 =?utf-8?B?V0hyYldHVDRQLzVjYVhkOHFTU1FYNEpJQ3RWYzFad3JOa3NsWVN4NDVZd3cx?=
 =?utf-8?B?c2lLUlFxbEdtNUdobWNBc2o1S3RCSTNvUkQ0MFhYTHJxeW1TblFrYjBVTEkw?=
 =?utf-8?B?K25aTzQvNk0reHRyUHNncTRnYk5JLzN4N2lWdlJlbFRtUjZML0JaOWJ3QW5C?=
 =?utf-8?B?azhhbzRlK0FzSzZycVBaTEx2eTNINEZ6WTBLZERYU3UyazFxblRtb0Y3ZWRL?=
 =?utf-8?B?WUtIZEV4SG1LTU16T2Jhai9pY0EwSWRuNEpCbEhaTkp6VHRNR2FsZjhDQTR1?=
 =?utf-8?B?bk9EL2ZEYkR3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(366016)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUMza1NhTERnTzgraHBRQlkzQ0d6MitreHF5Wm8vQUcyanNFVWRLdDU1TVo0?=
 =?utf-8?B?aTY3bit6cEt3cSt0R0NUSjVqQ1cvaVduaHpoUHVwMG5rS2dmQUs2WUpVck81?=
 =?utf-8?B?MGlGNmZPTTQ1ajVPRjhGakRlbWd3clBJMko0RW5BVHZIQmowRk56ZUF0blVh?=
 =?utf-8?B?Vk9kNkZmdGhwSUYrVlNnaHY3TnZ6Z0YwVTVUeDdzN1dZM3JMYVFjQnpjaFJM?=
 =?utf-8?B?ZU1NRWlzSXpPWmVsRXM1VnFtQ2VnRXBLUVBZMVlGV01aSDladEFFR0FET0FU?=
 =?utf-8?B?VUo5VVpkRjI4bS9Ybzd3TGkyU1p6WmxUckgrK0tMQ3lhYk9udDJhVGxDbXFw?=
 =?utf-8?B?WnA1dVhUdmFOc1NxS3VMVmVKR3VTRXdQMGVicGhuYzlSdndYSmw1S3lDUlBX?=
 =?utf-8?B?cTZnN1FCYTRlajRraS92ZEE5K1VjNzdHYmh2MnZLaXNrenNWK1dVVEF1V3A2?=
 =?utf-8?B?U3R0VUlHOWZMVUZPYUZxQVhENTdOc2FTcS9mSDBaZEtBQ0tDYnRwZThzdmVV?=
 =?utf-8?B?MmRKVHRETk1pT015TENIZkhYZ2RmQ0hkK3dkMm1OUmdqaDI1dFNrdlcxNGo2?=
 =?utf-8?B?Nnd2WSt6OVJ2SlgzQm9CdWxUUjc1WWpVNHE3UVNkQmlzV3JISEhYejE5WnRo?=
 =?utf-8?B?VkRSMHRHVXZsbXU2dnUxcXlndi9sL1Q5T0QzT29ubWxzcWFrbHlzQzYwd2d6?=
 =?utf-8?B?cWJ0U0NTbDBNd0E1YWlVYkt6dDdpaFVkdU5MSkl2RmY1Mk1IeFBzZCsyVUpM?=
 =?utf-8?B?czE0ZlFtQUh1eGtobzFReFp2b1E4a3Biak5ZSHhHRUhKb1h0T3BHRkt6d2E0?=
 =?utf-8?B?WTZVbC80UWRUbVBkZGkyQk9MT0FTZ3QvYVJ5R2tDK2VVbzVQaDUyR3E1bVUw?=
 =?utf-8?B?U1BHT1NyeFJ2T283Qm9xYjc4Y2diUndRY3REc1VQTVA3bzdCN2MrMm5BM1ZK?=
 =?utf-8?B?d1haTjZ0a1pqSVlaenBCSzU1a2FQOVY3Rk5tSk9ZZXM2WkFnaG9QaFlxTitr?=
 =?utf-8?B?SEpiNXN3ckNTTXhlRytzYWdKVElUWlNJcGhMNkgvaFp6Z2lsTmtmcGZOQ3Vo?=
 =?utf-8?B?elhYaGF3cXF6MU1MMk1GOUk3VWxsLzNoK3I2L3MrMWFsMkVqZ1V1Q3hKWUc2?=
 =?utf-8?B?UG9UNWFycXZKRmVpL1VWQkNEdHNHSWtVYng4QmtQZW42b1JndEFVSnB2VGpI?=
 =?utf-8?B?elZTcW9odjZuWWw5QkdyRWJHR0F6T3hpRVJLckpKKytBSkVrUGJScHRlTzBt?=
 =?utf-8?B?WmhSMXFDdU9KaWxFK2xqekpYNWdzYXM2a003OHJxN1h2R1NLY0J3ZG02UWJy?=
 =?utf-8?B?NWx4N1RINUpBcVBzVmtsUWVzblJkVXNFNjlXelc1U2V3a3dTMjVLQjMyUHRM?=
 =?utf-8?B?VVlVTUhGcEhxak9idzh0ZmFPaWhFSEFmcTR0R1BGdEkvakFPWXYxUGdtVHdQ?=
 =?utf-8?B?SWQyOWZhTDZ3UFl5QUNYM2lyK2x3dzRzUDVqY050QVUyUEJFZDJVczlzNzZO?=
 =?utf-8?B?MDhKNE40a3VialU2T09NUGZKaUNVMGFjVUZldktsYzhMYjB0OW9vNEZYeTdO?=
 =?utf-8?B?dFV3RCt1eU5IU0IrSU1sS2V5bG1pdGwzMllTWWxUMUNYUXpFQnBZaGpPREVJ?=
 =?utf-8?B?UXRxRmtLZ2lZR1Zua3dadFg5cGM2dG1EdEhieGxSNERsd0pYMHE2QUc2c3o3?=
 =?utf-8?B?bWJFOWVVdlNLaitiZm5yUlgzNXd1LzJUbGtFRE5rdGFJOGI2cjlvTjZBZHZE?=
 =?utf-8?B?c2JDVWxEVFVoN0hDTzZCZy9wZjZzYTZtUUt0Q0VZbHYxQWw2RkVUTlNTMDg5?=
 =?utf-8?B?WkpwbnJmSG1kNklhbWx0cHM3S284eE9CQTc0Wm92UE9MVSszVUt4di8wTE9r?=
 =?utf-8?B?Z3A3azROQTZzMHZDZ21heWprd1BqTktjUGszQS9qc1Z1b1RDc2dkRStFc0dt?=
 =?utf-8?B?UFlPcFJWUUtFRm5FWHZZcjhnVW9YWHhtQ29GY1F0UGxPUU1RUW8xUldBWDBG?=
 =?utf-8?B?SlNvMnlkbXlLU2JTUlJWM01mK1B5bXlYaHZTcFVqY0xMZXYzT3lFcExZNFRL?=
 =?utf-8?B?VWRycmtSeGE5R0FBOExpbTcrZUVLbmFoYWVKYzh2M0Foa3JleEExZkxxU3Js?=
 =?utf-8?Q?TDkfgNMnEd71yHayejH0RrxYY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed2a457-19e6-409e-7d81-08ddeed8c573
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 13:08:15.0913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vFxHfx5OZvf7k1tz/fxn6VGFdytYNWRB/S3mdeHkMela6ZhxxEfwuewSRhQqo3WWFJL1b1/9qxee4vW+2Dsy3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8918

Simplify the logic in imx_rproc_start(), imx_rproc_stop() and
imx_rproc_detect_mode(), introduce start, stop and detect_mode ops for the
imx_rproc_dcfg structure. Allows each platform to provide its own
implementation of start/stop/detect_mode operations, and prepares to
eliminate the need for multiple switch-case statements.

Improves code readability and maintainability by encapsulating
platform-specific behavior.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 15 +++++++++++++++
 drivers/remoteproc/imx_rproc.h |  7 +++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index a6eef0080ca9e46efe60dcb3878b9efdbdc0f08e..5cdc5045e57566e817170ed3c708dad6108d2e46 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -376,6 +376,11 @@ static int imx_rproc_start(struct rproc *rproc)
 	if (ret)
 		return ret;
 
+	if (dcfg->ops && dcfg->ops->start) {
+		ret = dcfg->ops->start(rproc);
+		goto start_ret;
+	}
+
 	switch (dcfg->method) {
 	case IMX_RPROC_MMIO:
 		if (priv->gpr) {
@@ -398,6 +403,7 @@ static int imx_rproc_start(struct rproc *rproc)
 		return -EOPNOTSUPP;
 	}
 
+start_ret:
 	if (ret)
 		dev_err(dev, "Failed to enable remote core!\n");
 
@@ -412,6 +418,11 @@ static int imx_rproc_stop(struct rproc *rproc)
 	struct arm_smccc_res res;
 	int ret;
 
+	if (dcfg->ops && dcfg->ops->stop) {
+		ret = dcfg->ops->stop(rproc);
+		goto stop_ret;
+	}
+
 	switch (dcfg->method) {
 	case IMX_RPROC_MMIO:
 		if (priv->gpr) {
@@ -440,6 +451,7 @@ static int imx_rproc_stop(struct rproc *rproc)
 		return -EOPNOTSUPP;
 	}
 
+stop_ret:
 	if (ret)
 		dev_err(dev, "Failed to stop remote core\n");
 	else
@@ -933,6 +945,9 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 	u32 val;
 	u8 pt;
 
+	if (dcfg->ops && dcfg->ops->detect_mode)
+		return dcfg->ops->detect_mode(priv->rproc);
+
 	switch (dcfg->method) {
 	case IMX_RPROC_NONE:
 		priv->rproc->state = RPROC_DETACHED;
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index cfd38d37e1467d1d9e6f89be146c0b53262b92a0..3a9adaaf048b396102feeb45488cd2ff125a807a 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -31,6 +31,12 @@ enum imx_rproc_method {
 /* dcfg flags */
 #define IMX_RPROC_NEED_SYSTEM_OFF	BIT(0)
 
+struct imx_rproc_plat_ops {
+	int (*start)(struct rproc *rproc);
+	int (*stop)(struct rproc *rproc);
+	int (*detect_mode)(struct rproc *rproc);
+};
+
 struct imx_rproc_dcfg {
 	u32				src_reg;
 	u32				src_mask;
@@ -42,6 +48,7 @@ struct imx_rproc_dcfg {
 	size_t				att_size;
 	enum imx_rproc_method		method;
 	u32				flags;
+	const struct imx_rproc_plat_ops	*ops;
 };
 
 #endif /* _IMX_RPROC_H */

-- 
2.37.1

