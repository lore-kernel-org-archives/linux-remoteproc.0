Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010064.outbound.protection.outlook.com [52.101.69.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C85284888;
	Wed, 17 Sep 2025 13:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758115182; cv=fail; b=AIJV46kXS8oG06+WuFdNF8WvyiFKRhD2WdslOQpDxHZxa0BwqSr8F4kF6mpI7Gfd+/JeHe0nrd6fuf/75rbcFL+93qiSlaX21YbGznpzHE068aoRkgTk9fFuFRLPCM8auUlG9At/0Mz5RzMG+RFHmGLX48K/8TPav9aylckKSr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758115182; c=relaxed/simple;
	bh=r9HS4Lf8btudB5xUR6y4pdMGyx+Gh8nhvz2cnlYT1C4=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=pP1hHl5pt8TxVpd0+rQHB5d4kZaWqxoYcLTjg3ETOSTk3AxiVoDZT2n0ENiCpJCPpMAuAkIqcrZIrEIdvH0I4L9lGXUIsi2H2e2OhFbFrK0o/tfFUtYAjDFXnI/KeyNtFe/m+AvU75dLBXjBmkJR5UeYv5o1f9+N5dfFFa0TB14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kL0BST61; arc=fail smtp.client-ip=52.101.69.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kL0BST61"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vnIyk4llt1ePXh7eBtCXGZQldP6uIP/NZugCE8Jtx00yI+euj7SFDHqklnUtffhJ0pfxekKtDMGUrSuvJ7GHUZ26jhlIME6K/upYd3vaWJky8QD/OdKKuvluS59+iVgGLLyYXAQc0uAuGhGvPZu+dNttteV4Gmvo9MEQeJqjvJHDUR/ysGhhMViwkutyD2/OrvbgFEMeMXqqjlFW1bQzM3DMeu9zaOLdQ2esiUYTZSVyEknK4KIngpQLJ/mb1NSxYQr7IYUV3BwCZvo/u+y1HYjbp2HrpzC0dRh9nhDYJWPZE44fvxblrxQzZrVMF0mumOHkN+NRz99vSzrTh3swDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRdVy3sOnLifv3wzlsgY/4oVFYPRC3m0uCA3mf1EzNc=;
 b=Uhc9phkOnwZDqlLKk9c/3CZIeQDIRgyw3E3cL+2Ah3VAO9EKy/9VTOdpop6x8NWPlm33sAMx62tamwur8likVHir4s04Y/pnzYR35LudT3FWa8BFJDNsgc1fRYg1O8VSiNsegessOJZ/t2lBg0vozTzxZhHsK880iTkn4Q4uoD6h9ZKr67+33F0LIJHkvgVfTUe+74qAlvrq7FRVbnB7UfnjmVpWf3gBqEhByRUHH9/b7M2h70Vp9XQvhll33ZdQ9DSGyNPdjgFnSBhlQg6kCDnZQkJF43wboJg0Uq4K7sTVV7utYevIsKElcdVeUwibX0N4x1HV+BE+a0v1a7FLzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRdVy3sOnLifv3wzlsgY/4oVFYPRC3m0uCA3mf1EzNc=;
 b=kL0BST61I16BYoM24hYGqpdyiuIsxOvlB3C4h6Xdtg9885nvlTSd9V+hGzuct2bXuuIttcfT+It8gdzm+JRgsqnlMXersw82qzVlb1M03gk6OvKGGHa1NqR/h6k2U8YkWfXDE3NN1xMh54KJEVPiKnsAk0hxKBdSYVaK63O4jvlNaDrBQpstH+bJZyQtqchzW5mnKuNRo2QFEOquUFX7Mj7Q65Pi+ajzogmjZ4+W8J2PNUSRFaR8UYGzsqCBvocu5of8Iy3txi0MgoBhuBm97IsS07qhecOCxFOvZas40cO2zp7jnAAvNATfNm/xmTZ7ozJct8AUhYAQlrIy21Locw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8325.eurprd04.prod.outlook.com (2603:10a6:20b:3f6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 13:19:37 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 13:19:37 +0000
From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 0/6] remoteproc: imx_rproc: Use device managed API to clean
 up the driver
Date: Wed, 17 Sep 2025 21:19:12 +0800
Message-Id: <20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFC1ymgC/3XMQQ6CMBCF4auQrq1pxwrUlfcwhpR2kFlASWsaD
 OHuFjYaE5fvJd+/sIiBMLJLsbCAiSL5MQ95KJjtzfhATi5vBgLOQsuS0zA3YQreNhY4tNq4qq6
 hU45lMgXsaN5zt3vePcWnD6+9nuT2/gklyQV3ypYdKqO0PF3HeTpaP7Atk+CbVj8UMgVTCoTWi
 kq7D13X9Q30FNx94QAAAA==
X-Change-ID: 20250916-imx_rproc_c2-2b9ad7882f4d
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Hiago De Franco <hiago.franco@toradex.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758115170; l=1334;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=r9HS4Lf8btudB5xUR6y4pdMGyx+Gh8nhvz2cnlYT1C4=;
 b=vYcnWBFSn2lzw9Ir9AMelWrG6rh0JVDg8TFDXwNwrp/OLkOtPCax/hlcotNw8XeJRs0Ja6BMz
 sYprIB1A9zoBIdXlIuQ8mzuhqF72DhYff4/ZCRkOHKanQuvjbIIeWE3
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG3P274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::28)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8325:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c57977e-ae15-4139-e16f-08ddf5ecd995
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|19092799006|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b2t0bkN2N1BqUG90RzBoVWR2TklOUExnMmgycm5sMDJkYjE2T0I0NEZnWFdi?=
 =?utf-8?B?OHZNSzFwRXJkeldlWjVpTWxjZENXYSsyOU9KR0ZYa0FtM0hFUkxteDBIQ1ky?=
 =?utf-8?B?dkNnRzRWOGQ5b3ZzVENSTUppd0x6L0FITlpaL3BQSDVUZW91SzJsWUw2OGpv?=
 =?utf-8?B?WFB3MmJGZ2JzMGc4aG9ubGpLSS8wb1BwM2JqbmllYVMxL3ZFTUhER20vWmpB?=
 =?utf-8?B?TG9IdENOTWFOZ1NxRzhwT0Rsem90Q0w0VFM1dlBUd1JkNjQ2TEJ5WWhJMTZ2?=
 =?utf-8?B?cFpKbFF4Zmd0NzdqNDNhWXV3QUkrRFQ4LzVIT2ZwOWlkVlAyd3VSYkx3UWQx?=
 =?utf-8?B?eXVsVnAxZHcvaUNacm5kL2hGbkJGbkg2N0YzS3BtalRGeVZGbG5QbHl6QldK?=
 =?utf-8?B?cDc4c1NMYW5VTEEzYmdjZXFKOUJrU3VHZWZkNnBiUjZFVXUzTm1hTlF2UmZR?=
 =?utf-8?B?MWwwOTk3Vm9iTUhBWnZ5RlpMU3dqK2VJVTNoM2xkM1pNY2NxWkI3Zisvakwr?=
 =?utf-8?B?a2FVMElXcjBDNkxVbVUxbkJWb0pDdHUrNmRPMEhzaFZhcnE3cXVZZThFeVAv?=
 =?utf-8?B?NXBnYjRYUDAwVnNNZEhQMjkzQURramIxVC9DNDZXT1c5bCtiWWl4SDdHQXly?=
 =?utf-8?B?UHQ3bWwrT29UVkp0QjdySHoxcHkyUzhSdlNLNVZoWTErKy9MZDd4TUdGTTJs?=
 =?utf-8?B?U1lFb0lsYXkvbHBVNFl4Q2w4d3ZJcERITCtpNncwL0JKWUhvS3Y5VTNGMkZo?=
 =?utf-8?B?c0N3VGJWaHA0bzJlTk1mUXNLK1g0NWcyYjNyc25kdXhPY3NLTDBZVGpFdW5a?=
 =?utf-8?B?UWtadVdwaTk0Zlp1ZTJNdU9wSmdoWFZjQzZFcXM2cEtMdGZELzZLVldob0J3?=
 =?utf-8?B?Z2ZzQTJEcHNJVU1nTENyaE5yaDN5RmhoSFBXUVZxQzBLUnBBSTUvQkloVDUv?=
 =?utf-8?B?R3NJOU1RcVdjbVBuUk50YUxKMUUwVU4vOUNQZ2kxRXAweHhSb3Z6L1VpR0JN?=
 =?utf-8?B?b1E4Ukw5YjYyck9vZndmQVI0QTdEVWV3SlFrWnFuL0k1b0s5bjRrU2xkQnB0?=
 =?utf-8?B?dmV1ZExaVWtkalNpQzBWVVA5SDVFV0EyVnRkVGNDcThSMDBQL2JPbDNhQm1v?=
 =?utf-8?B?bVJYd1ROQ2RhMkhYRVNxUFVzYXd1NEZQaGRxZGNlN2xlNGUvbG9DMG55QzBL?=
 =?utf-8?B?Sm5FYXdFSklOaGdwcnA1dERMREpaaGFQOFBTZ3dSTDBRNzFDYmtYT1g0d2dk?=
 =?utf-8?B?T0lQVjBmL3BVY0RScSs1RVZteEhpQ2UvbHhVZURkQ3A1QXBUSHRadmVVNnFT?=
 =?utf-8?B?dEJGRml2cG9QdThLYUZad0p0MUxzbWdnWldVWmFoSXo1SkZ4R3NNcUtlSmpI?=
 =?utf-8?B?NC9maXdNQzR3dGJNazVxWWczdHpYL2JTY1Jqa1l4NzNlTUNzWDNrQWpsZm56?=
 =?utf-8?B?UDZBUG1ldEJvMmIxelRjeXlQdndDKzZ3NkZCOGVWSTJCRWlNTitCZ1pxeVND?=
 =?utf-8?B?SENhSWhBd1ZrVkJyWG5yRkVaZFY0Z2FxbzFIdVRTYlBhYnhRSUM5SERSWnZp?=
 =?utf-8?B?Wkc0ejVlU3BDTUtDR1R2M2cyeGNGeXE3OC83OW9FYkw5NGhDZzhaRVc1T1li?=
 =?utf-8?B?WkNIa0RxOW9vWUJOcHhsVHp4b1hiYWFidll2M2JXcVJiYUtGYWVwa3NXT0FC?=
 =?utf-8?B?VnVNakc4QVA5M2tqalZiM3VaUDJGcVZHL0FwVm9odXBrRTlGVTY5QTQxdDEw?=
 =?utf-8?B?ZDMrcktNa0VMSytpR016U01hSC9HbXlxZi9UTU9MQXBuRUxXTVc4aWxrZkpS?=
 =?utf-8?B?R2RpWXhTSUR0NnVQeVZEN2Y4Q1MwYWg4L09zN2hua3BiVnhRYTYvUm12bnds?=
 =?utf-8?B?Q1h3NXp5NjliSmNCR24xdTE1emZ5NDBzOWdlTFRueVdCa1hydy9WQWVWQ0Fj?=
 =?utf-8?B?aGNtVmVYekJNQ1hhUUZtcVVuT3FxUDI0V25RRW9SR1NOS3FkR21zcWpTM3lE?=
 =?utf-8?B?cy9DSmY5djB3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(19092799006)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjVaR3o1OWpQQWg5cS9QaHFnZ0lQaDBSZVRKN0gwdStSZkszNHYvR3pJS1Yv?=
 =?utf-8?B?Rmd4V0V6LytWblRtVFJkYkJFUHIrUTlUdlpOOUNxVkY0cXArY0YxcTUvZ0pp?=
 =?utf-8?B?Ym5PeEdaU0pMVkthNjBoYWYzdzhxWWRBWHp2ZmIzRDJPd2xnMHNHcjc2N0Np?=
 =?utf-8?B?ajRXa0pjcnk3SDQ1eFBNbXNNa0lrMzJqQjNlNWZ0clc0b3BYQnFSTGZBNzRO?=
 =?utf-8?B?bjZRY2VDdldJYzRIczZvYWh3Zm5Ya1BUb2tpTFlkY090NzJVNVovdVlrWHZi?=
 =?utf-8?B?MmdmOFlKV0VyNWltdGZCMG4weTdCMGUxN0VaUk5TdEp6MHFBMGlGbmJDRzgw?=
 =?utf-8?B?a2x3WE5mcTNBRUpWSDl3a0daVTVCdllpUDRxa1Q3T1dXaW02SW5udkhUZlkr?=
 =?utf-8?B?SlNMRHlvKzdkUVV3MFR2cFRVMm5abGZMRHdlZWxVSGc2UE14R2gxQ1NiSlRy?=
 =?utf-8?B?QWVCZDFVTzBmUk1wTGZHZk5SZkxDQUFweC9ET0JVdkJPWVZaV3JYQjZVSncw?=
 =?utf-8?B?NnlGdEQ2dStDRU9wcmt6N0ZDRUpXKy9jd29mT1N3dlFoc3hod05DdE43S3M1?=
 =?utf-8?B?QjNPVTROTyswL1NkNXAwLzRDS1Y3dkFSSG9jU3Q4MmdHWWxCTHVnRUtibWNH?=
 =?utf-8?B?aTk0cnFDSCtnbjVRV3lENkloN0tWTXp6VDdTRTZxSHZHelhSdUxSeWpJQjRN?=
 =?utf-8?B?K2RPMGNWUlcwZW9ZV3ptOHdPM0RqVi9CaC9tWXhEZmpnU1FWQklkalJySE1r?=
 =?utf-8?B?a05tZVl5aEJqa0VmanVibE1LcCtwS01uYTVJUmpHM2JiRnNsZXFQWCt2ZWlH?=
 =?utf-8?B?VlFlTmFpQ2kxSFR5OGZJcjdkdTdFV2R5YStrMnBZWDlFeHR6Qms5cHJBdFpN?=
 =?utf-8?B?SFNzMHhXYlkzenlyUDROR1Rzem41OVZFYzVGa3lhcTFKMVA3Nm1yTDBadUk0?=
 =?utf-8?B?b3lIUDd0MFpiNDJkeUNYUEZWbHpHczQvNXg2NXNVUnNKbk5IeEpXaEoyN3F3?=
 =?utf-8?B?aXNZcFlDM3lhZ1JWZTM5dVNBQUEvVmJyY0RrWjNQRmpFYk9nSE5JV2FHZ0xI?=
 =?utf-8?B?TTMxTnlxamhUeHBDYXJZampLWWVuZlpZOHl6SUdKOC9uMmJ1U3B5em9MRlpL?=
 =?utf-8?B?NzdWcEhtaUJmbkNxazVDbVI3eXAydDRxenY2b2NySWk0QzlhTzVMWk8xNTlR?=
 =?utf-8?B?U1dFdjVONjkvaEVQQTB1YWVNVHIyYmhGTXlpZGhHWi9ld1ZUUllEU3VSeGhv?=
 =?utf-8?B?SDVuS0xqRXRzN0U0SGx3T29JWnRPU3pnU0IwTFFlNjM5WncvTzk2Zmg4dGxT?=
 =?utf-8?B?T1RPWSt2alpVSHlsWDdGZDFtY1lNZWFwNDdMN3E0emExUFpEMm42c0Q4eUo4?=
 =?utf-8?B?MkxpWnUwUWVCSXdkZ29CK1dSRWlCNjVmb0JGOWxZOURTSFJWeHJJYmIzNEdG?=
 =?utf-8?B?VkpmalNzejdEcmUzN3Y2VGE1SFpYUkY0UWFJUk9iNnZSazNqY3lxTkNnemM3?=
 =?utf-8?B?eDFkN2FwMjQ3TEYrdjF4cGpYekpuU1YybU85bzUxT1R4L3RGNStzK2srOHRI?=
 =?utf-8?B?QTE2dEUxaTdWdEZ0RWJrZnlFVDJzdEw3b3NVelcwS0xoNmZPUkEyN0JaSit1?=
 =?utf-8?B?bk1scS9qdnhDRkZhWlhiNkxYUGdNUWpMQjIwOUJRZ2M5NTFSWjBBakEvaHZH?=
 =?utf-8?B?NWJWbzlBbmxnYU9nZzBKc3AwQWFvcXpWeHEzdjZ1aUlWUG1NdEtPQlhlL0Nt?=
 =?utf-8?B?bG9oNGJzUkxEb25lY2dyY0dkdXU0cmg1Yk1NLzFtcFpnOHFsOE1HdjdFSXNX?=
 =?utf-8?B?SHZIWGRyRkd3TFlNNmNXSVZsNElVd1VlOGNSV1pIS3pqSElReUR6cEprREJo?=
 =?utf-8?B?aHhJYUlNQTN0VnlQU1BMYkw2NHpIdGhxTG9VclJhbXVCcGxwQ2VBNFhxVWgr?=
 =?utf-8?B?SU9EekYxUUw2SEFHZXNsLzRkZ2lHR1RYUHhLMWE2TDFicFhCTmk4Q3ZJQVJF?=
 =?utf-8?B?UmhML0hpM3BPYjF5NUhuZmZvS1Z6MjBZWSt5KzU3dXZLaDNrRUJVYVhKb2RZ?=
 =?utf-8?B?WFpvSkhrZnExZkxlVlNnZWkvQ2Irb2dwVXZwVWVsN3BJanBxQ2I3cGI1ZFNq?=
 =?utf-8?Q?R0qVxF12/8PPXeQL+VZAuSPoh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c57977e-ae15-4139-e16f-08ddf5ecd995
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 13:19:37.0059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uc2tNjfM+cBI9hKU8fKkgqXcazJFZVPy4BH1i/f8St5GKkht1eFxWkIxgRb2MJV/ATCqd48oYnRUb5Ajhrvibg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8325

This is the 2nd series to cleanup the driver.

Patch 1:
Fix the runtime usage. This is not critical bug fix, so it could be
defered to 6.18.

Patch 2-6:
Use devres managed API to cleanup the error handling path and remove path.

Tested on
i.MX8MP-EVK, i.MX8MM-EVK, i.MX93-11x11-EVK, i.MX8QXP-MEK, and i.MX8ULP-EVK.

There is still a 3rd patchset to do further cleanup. After this patchset
get reviewed, the 3rd patchset will be posted out to list.

Thanks to Daniel and Frank for the internal reviewing.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (6):
      remoteproc: imx_rproc: Fix runtime PM cleanup order and error handling
      remoteproc: imx_rproc: Use devm_add_action_or_reset() for workqueue cleanup
      remoteproc: imx_rproc: Use devm_add_action_or_reset() for mailbox cleanup
      remoteproc: imx_rproc: Use devm_clk_get_enabled() and simplify cleanup
      remoteproc: imx_rproc: Use devm_add_action_or_reset() for scu cleanup
      remoteproc: imx_rproc: Use devm_rproc_add() helper

 drivers/remoteproc/imx_rproc.c | 128 ++++++++++++++++++-----------------------
 1 file changed, 57 insertions(+), 71 deletions(-)
---
base-commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
change-id: 20250916-imx_rproc_c2-2b9ad7882f4d

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

