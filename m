Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013055.outbound.protection.outlook.com [40.107.162.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CB032E139;
	Fri, 31 Oct 2025 09:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761901790; cv=fail; b=Hb+fsWfU1IqH7tHobF4m1dtq4octalmycRwfGNeKRvE9nSUhafyqgKyKPojqx5WuHRKZYQ27MNvWvasyoMbr4YvC6dvCrdO7MAU1gvIGy6rybeXB8Vsfnn6INu0Rx8lCJi6cpodf03hTfjxVWrQW9NEuvhzAA3C2oJ3N829EOLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761901790; c=relaxed/simple;
	bh=ASF9ewtxnhsHZWFfjAEgwtIXAbL1as5l5GSNwowaqBE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=bnhdiYpxGoBRna1rliTWEd7KPY9LbZkQCYbHunp5osRpPfQPVkIm4xhMHhATg1/k0FhC59U5d6U3wrOPcbNkJxnUKzaplkYBQueM03+u+Oemg7gfdkRio0U6CIFDFm0fnMtscZGUBTqyKriDwVqzjUY6wKt7Lw5SmzkMLO42Vto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FUZbpkl8; arc=fail smtp.client-ip=40.107.162.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FUZbpkl8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lCA1nNI5z2W6+87yQKCPEgv073jezfKj2hP57D/QbfFjZT8rmTlrOaxMnrvLH6QoS5UrsTe85P4IqG9kt9FyEyNct3++JB1QU4lk3wrAc7cmJi+oXiBUNLqzuiFr6WiI3azKhebAl8s1DQBtlzzrRsREJ3eEjiYx0EjljrZYV0hDTgTsHySbMly8m9aH6UaYuf+01eqKlD9GBRq3lhysivLjwfxmn1lMnuI5i02nBC8d1cBR9l91N4uvObJWaQik4A2+X+Erl2WY5RyEqVPLPS/OGdHAJehB8XQGM6+BQq8vdH+Eq/mTU3V80gLOev0kKs6dovX0WQayZqqIrG3lKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3sqegU4U//A6dohScseCufvcIV850AyUuNBrZWAUss=;
 b=KjLqPq4+SU7hYHfRkrZWg/B6rYnuztSfVi/6wyy5s1RNSTS201QN0AGCTD5LTcja7UcszIkLTs777mk9i6SQ+aATZ6iUcnno/d65FzNtv5BJv23JSa8tmizIU5pGZPWto6ca0M/YjwBEEb84/4B0U8LSEqSIXfdndp1wGVyhkKqASlYXmGQpVzXQowR7trPd2HF59mT9eyOxK1bNabMRzlSpqtqOfp1f+OI2iC2BNO9blSc0FgNqbqIFWYyFa31e9T0fSgIgUzHowzbUzNzHRnC8BPNUIpHH8A6DbOTxHdoUJL9jP9Vdl3+wHKM3XM4/O5cAh7JXAuR6ILL3/z2Myw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M3sqegU4U//A6dohScseCufvcIV850AyUuNBrZWAUss=;
 b=FUZbpkl85gx4JLw0XTyWvx22KxBeZXm9HI2BXI2RO6wCHdZ5EWKewnOH3tk9K1tr9NBZySVzXjU+usVFrnfquWb8E8P51hKOmBaBkIBF8M6U9zaRRFkkwELK/Ys27qD/dJFj8uKJoyfyme9ZJ9C3Gd5/tMaarCsMBQVHh0MxGK7V1K6Io7mgJHK0iELx4udyeVY7quW+ZCGvg4irnM3wz/xfDgrh3z2E6lvc7lctkgvviJBDPQg5tWM6XGLpzfhi9MQJVC0J48WACx7y4ueOfsx2O3xWWHVzRllfBkk2sYQ/TgFsacZaZlbRjFiU+uWos9LHwDN5QcRu1nmfXkri9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8093.eurprd04.prod.outlook.com (2603:10a6:102:1c9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 09:09:46 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 09:09:45 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 31 Oct 2025 17:08:39 +0800
Subject: [PATCH 10/11] remoteproc: imx_dsp_rproc: Simplify
 IMX_RPROC_RESET_CONTROLLER switch case
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-imx-dsp-2025-10-31-v1-10-282f66f55804@nxp.com>
References: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
In-Reply-To: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761901729; l=5281;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=ASF9ewtxnhsHZWFfjAEgwtIXAbL1as5l5GSNwowaqBE=;
 b=rmOe+TQyU7rKw7EtOhfyvSJYpxv8FT6ROrlZ3TgU60tOuylTM3ofkg991yls3wDBwQgYDwMbg
 9U1292+++IED1JZOnZNPoMQU/udce+Ag9dn1iMAOUIuERdiaSk/GjBw
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2P153CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8093:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c9a02e2-c9bd-40ef-35de-08de185d3c56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UG5MREdqY2REdkVVa2dCOFF6a2N1SElINkZRam41aVVLMVc5M2FuZEhzYlVm?=
 =?utf-8?B?YWxqWTBERDBNb0xBeU91czYzQ2VMazRTeGFTek5CNXR0TmowZFRhZmEyVWJu?=
 =?utf-8?B?N2hiMExOQ0M1UTA2ZEtKQjJWMG41a0dIb0grS3p4dVMrbzBTMDZKdnd5U2px?=
 =?utf-8?B?VGtDMDVnR2JEQ3A5dEZUbnRMcWl3M0tHN0FmdzRDZXhnZVNCSk94Z1FBL0U0?=
 =?utf-8?B?NTd5STFYMzlLQ2ZyRXFUZVgrTjRMbzdtZUtxQi9TMDY4TkI4VUtZYkl4UGlK?=
 =?utf-8?B?L3lDSlpVTy83M0RhMGNFQnhqalcxdkIycjZuRnJxYStCL2l4b1BWaUtrdGpY?=
 =?utf-8?B?dldDdUZQR3ZMNytHV2J4MlJ2cHdhM0Uxcm82YVE5T2JnZDBrRXFualNTanQ2?=
 =?utf-8?B?L282aExIbDA5bDdZWjNIaGFSVEoyS3p3ZUR1ZFVHa1ZGQlhJaHNhWFBwUTc0?=
 =?utf-8?B?MjFtdXQ1emk2czhkb3BxSzU1c3B2bU1tL1V6OGpjL2dFbnJpVWhXZXI0QzBs?=
 =?utf-8?B?Lzg5NUU0Y1hwYTJ5eU5vMWU0cS84TjBGOEJqQXkwZlJ1YU0wVDdocUNUT2gz?=
 =?utf-8?B?a0RwL25xYmhmR0dCSi93U3RhVEhoeEVwY09hZ21mVGd2V2psL0JPOG5kS2RP?=
 =?utf-8?B?MWorSTJDK0Z6dWMyVHg5QXFEQnBkK04yVWlVWG0vQVREUWQwNU9Hb011MC9P?=
 =?utf-8?B?MFR6ZlFzdzJvZkt2QXhXR1N4Tjhkem45N3dBSlBES0pSTVpndUZSSklqaE9t?=
 =?utf-8?B?M1JTNWl4TjAzcXFGU0J1SmpBQkRvQjJOWFBLT1liSU5MKzlIUFBkRmV4Rllx?=
 =?utf-8?B?bGJaK3VZTW8xeUpaQzFYUVByL0hNbTMyUUVtVHQyeHFWWGNUcC93NXVJUXBS?=
 =?utf-8?B?cTYwUmw0OHNDUFJQbXg2MytIU01wWWw5YW9jK2g1ZGVXeHlqZDk2eitubFpH?=
 =?utf-8?B?ZkxDY1FpTWdma2xRQWhEc1p4WGtlVlRFbnFwOWVYRUhGVm1BYjRWek5OdFFi?=
 =?utf-8?B?VlZLYm9OVjVTVUFUWlpWZmxHVGxlUDNZcUh3ZVBlcDA0dS9xUllsZHdkU0FU?=
 =?utf-8?B?dEhESnJlWHQ5bDJOcDBkYjJiQ3lSMnBIVHZrVFVGM3duRTVSNndBcEsxaDMr?=
 =?utf-8?B?bUVtbGxpZk93bi9qN0hMZDRJaDd0bW5pYmpGc28vMDZTKytya3JCM0owTWNw?=
 =?utf-8?B?bCtRdURBVkNvejhKZzVrb0FTQzJPcFNhQ2JFMUlpZlZJSGFEUUFLMWRHaVVM?=
 =?utf-8?B?cXQzcndTVXE2UEFuNERCemxMNzJMNXdLajYvWktzTjJtbkZIaDQ1ZzkrcnN0?=
 =?utf-8?B?ZlcxWE15N0QzOUtZaVRRV2dWcnBvZm8ya3Jjc0xySS9XbDc2dWQ2eXpuZ1A5?=
 =?utf-8?B?YW1lbWVHOFJlRzJhNDc1cnQxOWNTby8vaVR5SitFNmUxemZPYUIrNEU1S3Z1?=
 =?utf-8?B?SGR6V2Q3dkxBeFhBc25Zd3FROW9QK2czOTRZUzNUTXZxSC9YRnhlUXdvbVR5?=
 =?utf-8?B?WHhvNFZNd2FOQmxYUFBES045WDM5MGlZY0VmSTEzSW4zY0tjYVlLOFh3ekJN?=
 =?utf-8?B?bkxQSGdQcUg2TEl4TThUdzV5ZU1LWWllRmtxZ0ZTQ05MeW5LcSszYkQ4ZWZ3?=
 =?utf-8?B?U1cyMEpsVjBJQUh1OW83OXhjd01pdkNSTmVDSlVvS2pDL3hTNkdEbzFrQUFU?=
 =?utf-8?B?UGh3TlFDYlhuS0ZJVVZveWh5eTdHWlB2N0NDdXJoVXhpY2QxU2pieXBlOFE2?=
 =?utf-8?B?T2tRYk5hRnhnakV0aEZMM0FCTWNBZERXS1BaRGlzMHlzZlA1NmU4eElHSzM0?=
 =?utf-8?B?Nkh0eXlYOWpOa2lrbExyb2c2UllvcVY2Zm1ab0RyQjZDaEJvZHJHa05UbEcx?=
 =?utf-8?B?TDlFcUdRN25zekZsTkNOVUF6bnlGaEwya242WVdEd2hrckdRSU1Bb2VZdUJV?=
 =?utf-8?B?VmlGT3dUbitHQTI4UEV0ZnBCVlRPVmoxVFVUNldYQXZpamppb044RkVPVzc3?=
 =?utf-8?B?WGJvb2V6TE4zcHBWc1MxMWl2bzJyRU81dHBrdEFSQWpDZ3NLcmdFcW9BTENY?=
 =?utf-8?B?MkpqYzkvWi9SY2xYQWZGMGp5Tkcydlhmcm5Bdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXFVN3NjdGZaT1pLN0poek1VMGJsMlNUbVZmLy9OelZaald5SUtma0FHSEFJ?=
 =?utf-8?B?Z1pSRkRIekF4Nm1vV1lJS2JTbFV4a0pJdXVyMlJleEpUZVJhWGFYNFcxTWJQ?=
 =?utf-8?B?bHlEQlVJNEZGbC9jRmxDSEF3SElDK3FnTU5XQmZIa25qem5JOG9teU8waUNs?=
 =?utf-8?B?M01ka1VNWnVWdVJYTkJDRGt6UmYxWmpkK3JuWTUwVEVDOUtNVzBDcGhqbHh6?=
 =?utf-8?B?endLeTcyM0lzejI2OXpyNUU3dXRCbjA5c2VQNENSYXc3RTRvdE0vRnI2WkU1?=
 =?utf-8?B?YjNZaGNIdlRpaTJBWXRhS3RvZ01tVXBmWXBPVUtRRzEraVhNV2Z1SndXZnI3?=
 =?utf-8?B?SnJ2K0RFcXBmS2ZaZW5zNjMrUDZTRTg0NDhsMUFUYkNHVklkSGNGbzJSNW1P?=
 =?utf-8?B?cjhhaDBmR0Nwc29hTTF0NzF3QVVRNFAzVVlrTWNBWVR4MmFLRzZJdVpvZk94?=
 =?utf-8?B?Z1JiVmRTZXF0Q2k3aEE1YTEwbnpOUWFEUnR3N3RqOXU3QWVnYklkVXJGdUdQ?=
 =?utf-8?B?R2FmbG5ON05BZUdZanljT3hrckZkbnVIamFnRnJSc01TcnZQVWpRcDZzczZG?=
 =?utf-8?B?MFp6WWZKM01uc29FOU5PMUxXTy9tR1dGcWhEZWgybHZIZ29hWlBqUWo0aHFl?=
 =?utf-8?B?VFZtVHlNZDF2K3dYZDNUM3JqV3VQZDNHekV0KzIwYS9YZ0pUL2dTcDJra0Mr?=
 =?utf-8?B?WkRwWEwyQXF0L3FaMTVteE5qVXIzM3NmTE5WeWdHaGxmV1J3MXRLR05PVDFY?=
 =?utf-8?B?eDNkMndkWnZPMUplY01nK2ZnSnB6dnNXN2RHbVh4NEo5RFN6bk0vRzMreWRw?=
 =?utf-8?B?K1JxRDNvbzgwMnVhVWdkS1hUcjBzeHFvQU84UTFEaFd3UW9QajlQekIrcmRo?=
 =?utf-8?B?ZGpCcXh0OGs4a3dKTC83WjMwVmE3RkdyaHpqWVdaVjVsM25RVWoxbG0ramV6?=
 =?utf-8?B?aGdkNytOYXFwYi9CeWdrMWRJT0pzK3dYWVRpZnIzUXM3OGFDYlVDRUc5NzRL?=
 =?utf-8?B?N3JBTm9pcytvNmxuNnFNazMxRm5ZVE5XaWZlZ2tZVU9DSVFEVG51a1ZnK21Z?=
 =?utf-8?B?ZTRkZnVHSHRpWnFvN2p2MWNvUWpVekJXYlFkOUNYNXVLN2VYVXdWS1BBSTV2?=
 =?utf-8?B?K1VheDhvWkIrYVRsNkF6L3ViekJXUWxTRUE1ZFUvTmlwS3ZaNHVZVkdaNjly?=
 =?utf-8?B?cjFiNDdHK3lldHZvUndkY3kwWmZ3dVVJRFpXN3hFM1hQMkIrQUR1a01LUm03?=
 =?utf-8?B?cFBXSk5nckQxRVJkOEI2a09ZM0hiUGpEdHZjUHgvMDRldzRVUHZ2cTdJVFpo?=
 =?utf-8?B?K2ZMQW10Rlk4SGdWTEN3TXFyQjRISEFYSDN6QVVxUGFYRlFOSkt6U0Vob2oy?=
 =?utf-8?B?MVlUNUNXMW1vM2ZWK3c4d1ZNazEyTm5Va3JNOHVGc1N5RFBqSzhnZGhJZ0dQ?=
 =?utf-8?B?SHphYXdFUzNVUUFGOGNuR0ltLzNsdGdONXdhTkhvQ2RSbnZtZko1cXdzYWRv?=
 =?utf-8?B?VjRrTkhRQzNnZDBpWXNYZ3dmQnpXVkcwQ0tFclk5dmhzU1B6R2hnSCtlT1Nl?=
 =?utf-8?B?aUVua0U3WkkxSzc3VitlcDFlNGFtTUJJVktMRmNHK2pRZkFnY0J6NDlYQXdF?=
 =?utf-8?B?bHJKSXNuMCswVEdjby9aK21Pdzh0MXd3b0VBRURkSW42Ly8zTnBLcEJqYlkw?=
 =?utf-8?B?RERZb0JBSC9MK2krK2x0NnVlWU1TWEU2dmhNbElGNFRsOW1nUVd6WU1YYldF?=
 =?utf-8?B?VlBoUWY0QStxQkhkU1JaV1lYQ0VkbzQ2TVVnTHBIRFBMZ2QyNnI2c2dabVBx?=
 =?utf-8?B?SGxJMUFEZkpxZVFRaE1IUUJ3Znh3NmpwTk9mOTB1ZUZHdzlVNDU3UFArNE8w?=
 =?utf-8?B?Y1ZNK0FxdEF2K1ZoQ2pPaUNKbDZzMEtDMUNORmNFemVTb0s0RDdaS2dGM0JI?=
 =?utf-8?B?ZTRScE5kY0NUU1JTRUxkNG9EcUVYaldKZHEzVlF5YklkTlg5ajRQM0JiUlRC?=
 =?utf-8?B?bjF6SUlSWEoxeVZiQkRKM291L2VUTFp2VXV2RUpJWFM0amN6ZUJJMUpjSWg4?=
 =?utf-8?B?VlFuMkZXSVUxRXVTSE40OFRTUDdZeEVSZ01YMHN2QnExdHFnWmFweDd1anZF?=
 =?utf-8?Q?xvRtxdVQvRmmAc2MYFqfDihN/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c9a02e2-c9bd-40ef-35de-08de185d3c56
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 09:09:45.8768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XlrL2mqeKFMem3wxUf/yZvvaRoYuGqbhxl5GCA7hE4Ci3Se9ea9p7zgJH1XQBxI1hsq/HhbPBr6WgOUgxhe2KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8093

Introduce imx_dsp_rproc_reset_ctr_{start, stop, detect_mode}() helper
functions for i.MX variants using IMX_RPROC_RESET_CONTROLLER to manage
remote processors.

Allows the removal of the IMX_RPROC_RESET_CONTROLLER switch-case blocks
from imx_dsp_rproc_[start,stop,detect_mode](), resulting in cleaner and
more maintainable code.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 69 +++++++++++++++++++++-----------------
 drivers/remoteproc/imx_rproc.h     |  2 --
 2 files changed, 38 insertions(+), 33 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 56e94754d5c5feba112227c45b0f99a4fe868926..009e08df8fd42e1bf6ca00393e940071d33ec518 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -347,6 +347,13 @@ static int imx_dsp_rproc_mmio_start(struct rproc *rproc)
 	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_start);
 }
 
+static int imx_dsp_rproc_reset_ctrl_start(struct rproc *rproc)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+
+	return reset_control_deassert(priv->run_stall);
+}
+
 static int imx_dsp_rproc_scu_api_start(struct rproc *rproc)
 {
 	struct imx_dsp_rproc *priv = rproc->priv;
@@ -375,13 +382,7 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
 		goto start_ret;
 	}
 
-	switch (dcfg->method) {
-	case IMX_RPROC_RESET_CONTROLLER:
-		ret = reset_control_deassert(priv->run_stall);
-		break;
-	default:
-		return -EOPNOTSUPP;
-	}
+	return -EOPNOTSUPP;
 
 start_ret:
 	if (ret)
@@ -401,6 +402,13 @@ static int imx_dsp_rproc_mmio_stop(struct rproc *rproc)
 	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_stop);
 }
 
+static int imx_dsp_rproc_reset_ctrl_stop(struct rproc *rproc)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+
+	return reset_control_assert(priv->run_stall);
+}
+
 static int imx_dsp_rproc_scu_api_stop(struct rproc *rproc)
 {
 	struct imx_dsp_rproc *priv = rproc->priv;
@@ -430,13 +438,7 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
 		goto stop_ret;
 	}
 
-	switch (dcfg->method) {
-	case IMX_RPROC_RESET_CONTROLLER:
-		ret = reset_control_assert(priv->run_stall);
-		break;
-	default:
-		return -EOPNOTSUPP;
-	}
+	return -EOPNOTSUPP;
 
 stop_ret:
 	if (ret)
@@ -1059,6 +1061,20 @@ static int imx_dsp_rproc_mmio_detect_mode(struct rproc *rproc)
 	return 0;
 }
 
+static int imx_dsp_rproc_reset_ctrl_detect_mode(struct rproc *rproc)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+	struct device *dev = rproc->dev.parent;
+
+	priv->run_stall = devm_reset_control_get_exclusive(dev, "runstall");
+	if (IS_ERR(priv->run_stall)) {
+		dev_err(dev, "Failed to get DSP runstall reset control\n");
+		return PTR_ERR(priv->run_stall);
+	}
+
+	return 0;
+}
+
 static int imx_dsp_rproc_scu_api_detect_mode(struct rproc *rproc)
 {
 	struct imx_dsp_rproc *priv = rproc->priv;
@@ -1082,26 +1098,11 @@ static int imx_dsp_rproc_detect_mode(struct imx_dsp_rproc *priv)
 {
 	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
 	const struct imx_rproc_dcfg *dcfg = dsp_dcfg->dcfg;
-	struct device *dev = priv->rproc->dev.parent;
-	int ret = 0;
 
 	if (dcfg->ops && dcfg->ops->detect_mode)
 		return dcfg->ops->detect_mode(priv->rproc);
 
-	switch (dsp_dcfg->dcfg->method) {
-	case IMX_RPROC_RESET_CONTROLLER:
-		priv->run_stall = devm_reset_control_get_exclusive(dev, "runstall");
-		if (IS_ERR(priv->run_stall)) {
-			dev_err(dev, "Failed to get DSP runstall reset control\n");
-			return PTR_ERR(priv->run_stall);
-		}
-		break;
-	default:
-		ret = -EOPNOTSUPP;
-		break;
-	}
-
-	return ret;
+	return -EOPNOTSUPP;
 }
 
 static const char *imx_dsp_clks_names[DSP_RPROC_CLK_MAX] = {
@@ -1326,6 +1327,12 @@ static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_mmio = {
 	.detect_mode	= imx_dsp_rproc_mmio_detect_mode,
 };
 
+static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_reset_ctrl = {
+	.start		= imx_dsp_rproc_reset_ctrl_start,
+	.stop		= imx_dsp_rproc_reset_ctrl_stop,
+	.detect_mode	= imx_dsp_rproc_reset_ctrl_detect_mode,
+};
+
 static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_scu_api = {
 	.start		= imx_dsp_rproc_scu_api_start,
 	.stop		= imx_dsp_rproc_scu_api_stop,
@@ -1336,7 +1343,7 @@ static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_scu_api = {
 static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8mp = {
 	.att		= imx_dsp_rproc_att_imx8mp,
 	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8mp),
-	.method		= IMX_RPROC_RESET_CONTROLLER,
+	.ops		= &imx_dsp_rproc_ops_reset_ctrl,
 };
 
 static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8mp = {
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index a6b4625e8be76c6eb6a5d8ef45eb5f3aec5fe375..6a7359f05178a937d02b027fe4166319068bd65c 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -20,8 +20,6 @@ enum imx_rproc_method {
 	IMX_RPROC_NONE,
 	/* Through ARM SMCCC */
 	IMX_RPROC_SMC,
-	/* Through Reset Controller API */
-	IMX_RPROC_RESET_CONTROLLER,
 };
 
 /* dcfg flags */

-- 
2.37.1

