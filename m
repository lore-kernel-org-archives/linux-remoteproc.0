Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013016.outbound.protection.outlook.com [52.101.72.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4404347FC0;
	Tue, 11 Nov 2025 01:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762825312; cv=fail; b=RQgB6ZaJXvE9uZVEz39g3H5SW3ZOdZp4ZlvABszHzAAlmRx916QsBthlt66BZhQAy4gZmtX9uX39ln0yHKcmytZFIeu7dIJHTS3XtDpOJgu0Vax0VdgjWwTkB11uZVFxA1OGhj2cv3SgJ7qWAVlKHHKDSBwE7qhjFS6U139vz+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762825312; c=relaxed/simple;
	bh=mOlgX3Swl4qR4KQcDPR/11i9MUxU/mYJnKcWYOzlQH4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Scf4fcINihu2DAyHNNmXt+7hKwlbBFaLuUGozbQVumYzBJ1bPTf0Y8eBC4d/QI6IlN/hesfPh4TK3epR8ZumIQrB0UBGgPL0HtSomdjqacvRMENcMKLoRoy4wNdDylkKIAjiFJiOSLpSRnsX2Hp9BTbTL7g3unzQZt4LbZEN41c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hU/POmDT; arc=fail smtp.client-ip=52.101.72.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hU/POmDT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CCIMXSWxee7HceGhLNGXEoshOz3fl0e9c+EOcH37JE7qED/XNbdpLBFVDW+Sldwr+thoHdVy7kdZ03PbTbH7xwHovISQB8b373V/Lchgst0Sy5hrwELuCnhftD+K0njTUgz19nhk792ybBJc5reA0MGrC2CaK2bO8TzSsFbaAEWjjozexSrkZSKrpfZWqv15YA/C7b8QG9NT6+TPCzoHYOBdtn7VNyBaORUQZ77w3LE0KFPtMUwRQhVZ0Ya7XpeC9sdv2c0Y4OzRPyIBLPxOmR5J0RX24MhOCatBxhSOhJXYdeDi1+W5ROV/oQpX11PwmJeMKKL4sYmWKW/dHqdnCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xd/wCzE5XxnpiqfQb3I2kE59FcV5SwtyBwHo2LaB9G8=;
 b=blNCcJ2WnMiRvAHsfUSbVlu49UjmtuQRzYIic1aHhvBhg9zakuWYmqsZa12D/TndS4bWwFYRS6pXVB5wnMJb1Nl6AtRAjAWJoIS0rfxmNJxzunlpRnzjRdwEluD/q0onItdf3ZuONEyol0ztbxOaf4w15kbvjRLINd/fJQi5DNNc+xJ/6EQQfi99Xrzf+N5Qt8iQeR6I+Z4GHllbEiW0LwiqqSJRfo7x/qnqq4anCM4ZY71GozNkongQWASwaIUbzIq3HHxNUz1WWbalbNuR/rpyHdfEggpiAEArN0eF+CCHS8AktgQNVZd9AKRCxZRt5kxd3hgMwMaHU2KWPWRUzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xd/wCzE5XxnpiqfQb3I2kE59FcV5SwtyBwHo2LaB9G8=;
 b=hU/POmDTPW0W04VLP1mLLBQWVBk2UlXLhzR4BoKd46CwIThlgXhssMWZllLt+jykVjaq0ENnOhDOI3yXP0fDFnl7w3NWcMgena+Y7V0wRxVTViOJTvgHTK5gG+S3+PHzMRIimy0u6IklX8jmBhyk/eZl8qbWCRC0smB6sln2nWbyfE/vLGSPkYW2snEN9Q1lkdsLkjnsP6IxVJ+5/aLHIVZZw0vq8OCZR22W7iRAwEKn6gaKF1U3TMpqCzpE1XJ0feWZlxl+krmMuluEti5FJi6Uj7mhYoilNrCOnkfFgEPvuZqkZLMHjdwddnMj8I4wwwzhpjLNV7eoSMimMqMg+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8039.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 01:41:46 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:41:46 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 11 Nov 2025 09:41:15 +0800
Subject: [PATCH v3 04/11] remoteproc: imx_dsp_rproc: Use dev_err_probe()
 for firmware and mode errors
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-imx-dsp-2025-11-11-v3-4-d05dcba737fa@nxp.com>
References: <20251111-imx-dsp-2025-11-11-v3-0-d05dcba737fa@nxp.com>
In-Reply-To: <20251111-imx-dsp-2025-11-11-v3-0-d05dcba737fa@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::10) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8039:EE_
X-MS-Office365-Filtering-Correlation-Id: cf382c08-91a7-4fa2-f6fb-08de20c379b9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QzRGUS9xV3E0UjhqT2xtOWc3MnYrODNQVXRVaE5GeFl0cXBzOU5IOU14OFBU?=
 =?utf-8?B?QW9KdFh2b1JXbXRHb29idzZTQ25vbHZwMkJxN08ybDUyT1ZMSG5vcDNYdDlI?=
 =?utf-8?B?d1htUzQvOXJyeXM4MGhObE9vb0NHOWhQR2lWYnVxZzBKQVlnWnV1NUdmaXpV?=
 =?utf-8?B?RzVMY1dKWmVjVlV0UU5xTUVHekwrSko4M2VPZ3U4V204RGIyeG8yTWJMQUtT?=
 =?utf-8?B?T3dEQjIrdVdPaGhvVjM1dzVUZzcwU2orMWFsMzUvaTQvTjVrc3V0bk5GU3A4?=
 =?utf-8?B?ZnppbjBnQlZtYVY0TXFUSFltNEVvYm9TUU5wMjRSU2sra3NBUFNyT3N0Rkdr?=
 =?utf-8?B?RE5JM2oxeStXTENjM1VDeHA3a1lhalNZcnZ0VWNyTWJCNDU1Rm14c0JxRmk0?=
 =?utf-8?B?TUdia3BxZ1I3NXF3UXFtMDIxclJsWjhtZDh4ZmNicGhWV1FsSEV0OERkWk9S?=
 =?utf-8?B?VkkrT25ud1Jpd2FmVUpyRlhNb3l1a0l4QnRldGFxZU1Id2ZEUVlScndoL3dq?=
 =?utf-8?B?QjlGRnVwOGJ1WDZqZzBLaStlQnFQdzRPampVcEdvMmRJYVpZckliTnlJcnBV?=
 =?utf-8?B?dEI5dG1nOHV3NmlvM1dHeEZGS0VFYmJyMUhmQzNKb3JnSU1pZ3VSMktQV1lm?=
 =?utf-8?B?QjJRMm0xZDNBYjlMN1RQekpLOWpJV1pNUHVSNDJteCt2dmVpbEdMSzVCenpF?=
 =?utf-8?B?Y2lIa3cvejZtNWRDdWpnUXZXMy9uUnhocm1CMzFWN2s3ZHNibnRjMFZiTU1T?=
 =?utf-8?B?ZldIS0VJOGdpa1RUNURtN1pRQ2xzcDV5d3I1cWpVeGREa1JWUkJnMmpPbHRk?=
 =?utf-8?B?Tk1LQUZlR1R5RHRsUnlQVlB3WGVZVTRnb1BJTERPNWk4cTA4RXRqcVFONGFw?=
 =?utf-8?B?bE41dmU2T0dHbUJYMU5ISDhyQWcrTlg0dzhZNm1yLzF1aXAvWkJNUlBtNFE2?=
 =?utf-8?B?TFZNaHRhMXJObmUrUE5sRlZtWXg1QmJEZGJYRElSazhTWHY5TnR0UGYwMCtF?=
 =?utf-8?B?NmFSZ2FWQ3RvSit0cjJsV2s3SWFpd1p3WTN0VzUydWlhNHpQbUtLVWpQOXQ4?=
 =?utf-8?B?K3l3cERab2J1QjNTWVpaWUpvYzVRZDBFak1sZkpxbllld1M2UjhYZlRieUM0?=
 =?utf-8?B?b1NDZm1wK2FYUmN3VTRjNys2aUVWeUo2cFFPVGFEcTEyQnlNR3NVNlZvd0Q1?=
 =?utf-8?B?STRZeUtXSUI2VEtOUVZ3aWNJQ2h0TTRGWHJrQmhnb1RHOVpVMXdaR0ZKSmMw?=
 =?utf-8?B?MG5EWGNWbVRWdUVWL1pZbko0a1YrYXUrUEJ1OEI0Q2lFMy9OWUhiWUlhUlZr?=
 =?utf-8?B?VVc1RllFNUFGUWlsQ0U4Tmd5VjUyd2xqQVdNMG4wMWtISHk4ZWYxM3hHdGJ4?=
 =?utf-8?B?R1NZTERaVkpRZFpzUkp4WVRXVUZLVXNaYUc2SEN1Y0o2dk1INUJ5OGtoVFgz?=
 =?utf-8?B?NHZFanBnOVhLcENnY284UUNaTUtSQmM2S3NDcG9FcStpOEJRZXQxMkVCK2l1?=
 =?utf-8?B?Z0hWYlQrR0ZuUWcyWVF1aFFZd0ZaUHVaTjlVTVVVc240MnpFSkYrRUtIdGk0?=
 =?utf-8?B?YmRvSjVaZlJvOG1CUEdXRXk5MDNVN1E5WVA0Um53RVZScDRPZ1pRVWx3dHBz?=
 =?utf-8?B?cTVGN0xSRzFldWZ6VUJhUmJSVVBQTkthZ1VrM2Rpc2MxcjhMTDd1Z1VMYytW?=
 =?utf-8?B?aVpieXlmZDZCN0lFcE1mdmEvL1o0V2F3bmVYU2trd01UakxiZTQwWi9mL0l3?=
 =?utf-8?B?OEtQZGhOT2JIQ1c0YS9Nb1dTQWRHdzBNYktUTFJFc3N3Z01RcXRqdnMycFNO?=
 =?utf-8?B?NEh0TmZkVDU5aStlT3ZyZ0U1VEJ5K2hPMkxXUUlxakozZGNRNlRZYXBJdGRQ?=
 =?utf-8?B?aGpGaG8yU0hMb0lWbVRmQjdJa2pZTjd3Z3NZeHBSS0ZHMkZjSHVnNWVFTjNF?=
 =?utf-8?B?aXRXUjhuZTlJc2V1MEZhaU84RFVVSWFCak5Icm9qNGtTT1hncTZWSDNVWkdx?=
 =?utf-8?B?WGJqNjUreWZPYjF2WUVjblFFZ0ZRMCtWbkZsN2ZKOHNYeGdEZUkvNU8rRUJv?=
 =?utf-8?Q?phrFRI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0orWjhTQ1FqN2VReU9CbWgwa3lYVHEzQzh2L0FjdzFnSFJyZ2VEOGV2UXNy?=
 =?utf-8?B?aW15U3YvOTVhdFIxQlJrYmNXWFovYXpDZkVTSmpHTEo1bEptUCsreDdYN3k3?=
 =?utf-8?B?aTk3a1E3bEdadGpxcmEzVnRuaHdFOW5lL0dVK0g0OVVEK1NPZkJzWEI2MXM2?=
 =?utf-8?B?Y0ZkTGV4OWRTM2hCVTluN0NFcGJLV1R3Tm5PQ0xGM0VuWVA1SmJNRGVNZzNy?=
 =?utf-8?B?aUZPSVNGcVUweTFkREU4WnpWZkJNblBVZVJrcEEyaGc5ZWhRMmdjTmJWemZC?=
 =?utf-8?B?a1pKTFdLY0d2b2ZOdzFOcVlVdTJQaDNJY1dZbjFxbW9sb2IwT3A0czRaOGQ2?=
 =?utf-8?B?RnNKdnNQejdscUxoaTZFNjUxUngyUDR0UDdFVWpOMk9Qb245eStTeCsrMTIx?=
 =?utf-8?B?cjRDcjlQY2FtYUl3OXVvaXpMTlcrL3MxcVU4RlBRMFVsbEh6ckZjL1hnSzJC?=
 =?utf-8?B?dktiamtPMlRNdVdaM1oxaDRSTjdONFEwZU9IcjBEUTZ5OCtpUTBEb1JFdENx?=
 =?utf-8?B?L2dOdmMxZjE4ZFZBRy9lYmpraWJEUm5Fak5MMGpobEZpa0FMTWQwSkl2UVZo?=
 =?utf-8?B?MDBqN0czSGhNQWhyN0V6SVdHcHRza0c0RTY2WDJJWEJYdENndXg5MG9SV05O?=
 =?utf-8?B?dXd5RkI2eVlQWmtHMHVDeFdWZ0dWckhZR1BuRW5OQmJzNE5IZDFyUzZvUDlM?=
 =?utf-8?B?d2RsZkJWTlVUL2ZXV1pSSGV6RWlEV0VKekNtMXAxWmw0SStaMzIzVjBaaWVO?=
 =?utf-8?B?dWFGcG16VURFdnplKzdJV0FMWitNdFVTOUNNSlcreVNOTVVXbngwU2EvTHg2?=
 =?utf-8?B?ZmRqNlZsZHQ3bVczVnR0RjRyRWtZTjY2M05sbWNDQ2NqRGJjM3BSRjUxT2V1?=
 =?utf-8?B?Nm9zZ2o1NmQ0emFYcGFMRWRhYlNZTVIyTzNVRFFQVjdTdURESW5QeEFZTW1G?=
 =?utf-8?B?cThGMFExclBua2FoZzJyaDhLMmpYMUJRQndDaElpYmZWRjlMdUI0L0tZSlRa?=
 =?utf-8?B?YnBpeVV0ZFFCUGl0dGhlL0lXSnhhYytEb294dGFZV0tUYjdqWnlxTHozL1Nl?=
 =?utf-8?B?N0tUSnd0YVNHTmFWV05LZHRsaWZpK3I3N01La0JTT0paaUlIQXZmM3BZcGFr?=
 =?utf-8?B?ekExcEhYa3p0MWFQa1FhTFk2YjVOS1NFZVBFZnV5VFA1QTVkeTlFMm55aDNK?=
 =?utf-8?B?VThXWFpYTkRkcFE3Rzl6K1BNSnN6cjVrUU8wTm9OQkpjV1VoQ0g0OWpwRXRI?=
 =?utf-8?B?Sy9aUXBmbVZzZEtSVm9RMXdQV3BTNTltaVVpMlBhRnNPU2lIT1RUalJublVB?=
 =?utf-8?B?VnhoZEVsTGtiMmNoRmY1U3pJa2NlTHBjWmY2cUw5QUlzK1VPS3ZoNTNjeWpo?=
 =?utf-8?B?REd0TXpjODBwMVorbkJOWXRNUnRmMmtwOGJqWENEMGpQbUV1aWxhVXZ5UFQ0?=
 =?utf-8?B?Q1h5TFljSU1TY3MyQjMrVzhoMGpzRDNSY3FzK0NUY3pjZ1VSRFdiQW1vQU52?=
 =?utf-8?B?Wm91VTFiL2ZBUjlHWDk1R0NxTG43c3MyTE04R1lIMXhJSFRvbzBLZnFYR09x?=
 =?utf-8?B?YlhjT1FyanhSdUE5cnBTemo1ZkxMdFY4RjV6dkVIcmsrNWR1Rll3anA3b2pP?=
 =?utf-8?B?d3RpNEdXSHBKSFZ6a0R0bnFiL0dVWEJzdUdzaGkzNU53akttcGJmcVExcGxU?=
 =?utf-8?B?V0NZbktIU2IvL05ZaXZRK0luSjJVN2FOS1RNb0VSZHBKVkNhN25kT1RmK3Rm?=
 =?utf-8?B?ZFdPaHR6cWRWeW9PakJGT0oxazNKYTA1ejRSK0xsaEdsQnhwU2t2VDBmQkY0?=
 =?utf-8?B?VUZ5SkFibVZucGExcHplNmcrcmV0VUVSNllsS08zM2ttc1NybVZOa3ZvTm9r?=
 =?utf-8?B?RVd1WGg3QUlMY0xpK1Avdy92cEMwWXNxR3llQ0dYUmIyNFdSMjJRM2lIbVlR?=
 =?utf-8?B?TFFjUk5ibmsvWE4vRkZYRHZVTnI1ODNXSnJJNWgvVjZZMU82cGpaYlRIdWtU?=
 =?utf-8?B?dm9scThPMThlajlaWnY2U3MxVkdsRjhNVVdoTzhrV2pTeUhhVit1Z3hPM1hP?=
 =?utf-8?B?cFd1Z1pYVnBmeVVqcnlHV1loQkw0SFYweFFiVEx3aitmR21BWlB5R3l6cDY3?=
 =?utf-8?Q?CLBi48FpCEN9Btpjx7xJboX7E?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf382c08-91a7-4fa2-f6fb-08de20c379b9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:41:46.7864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HVAWFav0P8GhmBSi0K9FL4y8YU7zrB7e3yJKbEDYgS9wytL3RvCshZj3C3Hf48prZUV3Bq/hyr4pAskBvU+79Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8039

From: Peng Fan <peng.fan@nxp.com>

Use dev_err_probe() to simplify the code. No functional change.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index f5d0aec52c56664d6074272e276edb0c4175c9ea..87f4a026c05fbf1c9371058290b2d33cb94b9e54 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -1150,11 +1150,8 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
-	if (ret) {
-		dev_err(dev, "failed to parse firmware-name property, ret = %d\n",
-			ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to parse firmware-name property\n");
 
 	rproc = devm_rproc_alloc(dev, "imx-dsp-rproc", &imx_dsp_rproc_ops,
 				 fw_name, sizeof(*priv));
@@ -1177,10 +1174,8 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
 	INIT_WORK(&priv->rproc_work, imx_dsp_rproc_vq_work);
 
 	ret = imx_dsp_rproc_detect_mode(priv);
-	if (ret) {
-		dev_err(dev, "failed on imx_dsp_rproc_detect_mode\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed on imx_dsp_rproc_detect_mode\n");
 
 	/* There are multiple power domains required by DSP on some platform */
 	ret = imx_dsp_attach_pm_domains(priv);

-- 
2.37.1

