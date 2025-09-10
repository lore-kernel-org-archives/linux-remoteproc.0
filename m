Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013035.outbound.protection.outlook.com [52.101.83.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E935E3093C7;
	Wed, 10 Sep 2025 07:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757488357; cv=fail; b=O+GGEDYnkYqLMlzG/QLkHUFS1H9Ed/m9cPhFlcCTjDOkG8k5VJFEnAxbOyLU3bSoK2L3Ka0fR2ldoDiAxQHLI6NOy6bluwWbS7Qjj1PooJxcIBJ+pugEmTHQT5o7vJMgi0OhroUoFydvJFAwi8n56tRkZEH/YdeXU0X1AErxaEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757488357; c=relaxed/simple;
	bh=8/aZ8qjJZahIT0NKJek5f3HJpuX9oelkHbxCYT1uLQA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=tzHdi6/ZXX6WLyuotbFxRpsznYwpvWM3wI8uYSbq+qYLW340o7tODNqifUIOrtiIqYiVtMGNt19PilsebsPrtql392+qzldGk8ENnzFSzZ5Lpzwu3ANetJ/BoXkv6FONPExuEqAiDrhpbBXBXF4YwTy9ZwDZognXEk1T3o0HEN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Zjz2yhhx; arc=fail smtp.client-ip=52.101.83.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Zjz2yhhx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ziz0pjMAqL3ljyYc1UtpmJaZqr30HBZQQNj1w7L5A5L8aHyzTrPB8d9XAme7iazflkCcTLm+LNBmvM2tK+UCRA+gmdVNw7x8h3fPvJXWx/RclkDC9wHIr+F/qhoRVjkj4X7BtWs+TWjDicj4UgxluCH2EdqJ/ezvfIAWEalh7ejVrk3aCLKU51i3sdg22bqYaIzGn4L7khdatKSluAKo7FJ68061lDfICNls1nFbYZP9ibMxjaxvXyjeIc2aMhlMRF8JCWerxH1jebK56dDvuellJ/BNassb82Y50Up6gYQ/XOqrdbHPNopPvFZA8ppilYt2P87ui6rLeCMptMHn8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9bdmQ9MmODDgHDgRwN3HuyeWeFJNaZrX2/WQ344XWs=;
 b=w4NZ18OzDrUyDwF51A7WoDa9QPj5GsS2P6XcBScZiLPyBtXjOXJ/2ug/4vqIi942eqaAiR5XpfAOSwXsdT7TXmL+MqoH42p+PAviwRudMlSHmnjbaImh6cjMjwWjUd2y2uzIhNA8tT6MLDR9+VODKZUxSf8gvzd+Qi+rbKa4AW83mbDtZMBnk6WNt9gy6LKld3Yfl1dut+Etxk6nl7G3n6x/cMbTryVQ5+YRrm4rZBZVFnSAOr+LLfg4ssTng6dGOSCxa4opWO1m7HmOuly3yab/aS+36khR37nqMiH/e/ympTtiJk8qnJDU5DKLdMoqykIqNu4JrEZFWBvov9Hmcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9bdmQ9MmODDgHDgRwN3HuyeWeFJNaZrX2/WQ344XWs=;
 b=Zjz2yhhxfs4dLyKUUU28HSjU6yymf1+/dnuCq0wOEVczJIoWolwZPDLxm+NInhXygRAy4TKFRxWMj0ETHRy+T2VbiOzdH/oO15GKb76nbsrZuP8ZDulDjdzhokSFLYpytj8b3FLt7LBPxHZBpgKJVHsjGaPeoSm9zbKNe04ZEXUXAsmZdfgDH6Xt2bZaBJcdywgUi3tGCSfvM5PAXQ1zZYj57nhAAsttvSRy4HNeWOzEJtjhqrmf4akDrOYGpfTW/ZCTgqipYo+C41YHlJHhp9a4wrFPu0Gxe4uy51qPYt1GzZbSRFUHUI+eH0WM5E00EaBsMkhXn3MNs1i+ZRQgig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS1PR04MB9358.eurprd04.prod.outlook.com (2603:10a6:20b:4dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Wed, 10 Sep
 2025 07:12:31 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9115.010; Wed, 10 Sep 2025
 07:12:31 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Wed, 10 Sep 2025 15:11:49 +0800
Subject: [PATCH v2 5/6] remoteproc: imx_rproc: Simplify IMX_RPROC_SMC
 switch case
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-imx-rproc-cleanup-v2-5-10386685b8a9@nxp.com>
References: <20250910-imx-rproc-cleanup-v2-0-10386685b8a9@nxp.com>
In-Reply-To: <20250910-imx-rproc-cleanup-v2-0-10386685b8a9@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Frank Li <frank.li@nxp.com>
Cc: Hiago De Franco <hiago.franco@toradex.com>, 
 linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757488317; l=5519;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=8/aZ8qjJZahIT0NKJek5f3HJpuX9oelkHbxCYT1uLQA=;
 b=VWMDvLd+pb3dviNX89gSYI0Z0gVlIPvjiGqbCf5EUEXTwB0JQnFzho5uT8gL1M1cemu4e/Pbr
 pJjDst6qI7OBSuWsgXSheMuDud4u1IuOAaq6NM9CH0Y2UK8lswA/DA9
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::18) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS1PR04MB9358:EE_
X-MS-Office365-Filtering-Correlation-Id: 71605327-c9ef-423a-375a-08ddf039684e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qmt0K05NSzhFS1FaMVAydWEydit3U2ZmUXc5YnRYUVRNbzBCQ3lZNTdDV0dt?=
 =?utf-8?B?bitWaVlUSy9uOWw4V0NZODIrd0R5Z002QjJ5cWNPN1ZkKzRqRXFRcU1nYmox?=
 =?utf-8?B?VEdCNGt5RXFTVFJmTWhtSkszYWV2R1B1dFVOU2tGd0FHUTJQWWJVdmRVMXF3?=
 =?utf-8?B?V3JoaStQaDFqWWUvVE51Mk4wSkhXdUZQVU5aSW9SUUhNSDE1TGpTRjlDYkps?=
 =?utf-8?B?VUJlemZGYkp6eXYrYTJJSlN4VDNNS0ZPS3RXMXIrdDBLWXN0a0ZNVDZtRHJ1?=
 =?utf-8?B?Y1JXTDlBeVRzUUFoVFo4OXlCSm1RbjllTHdNT0E0WlpTNWZwN2N2N2dzekZU?=
 =?utf-8?B?dGlLcDNxNngxQXBOS1UvU1J3dHB1UnJJdzhyMlQ5Q3g0a1l6bkVkVjZ1bDF2?=
 =?utf-8?B?dHg4ZzlGclFRRHdrMUUxMmdZMnJFNGV6T2dqa2g0a2QzVWtTRGdaQ3k1TzFX?=
 =?utf-8?B?NEcwQVE3cWxTcjdBUEJRL3IxdmxtTjVIRTNMckg5N01oK1k3TlJiTUQzT1NS?=
 =?utf-8?B?SW5EK21tbjBRdzhzY3M1T1RpZi85RGVWOWgrR1dpQ1JoeUJYQzBlT2UzQ0RF?=
 =?utf-8?B?WnRHUkVjb0o5NnRqYzBuTG01dmY3RmZ3Z3pTQkVCNHZ2TU9zL25NTmNydHkr?=
 =?utf-8?B?dVBxQ2I0citlbFBxQnhMd0xzb25IVkNjYlJBTTgxbW5lbEFqMHdocHltcm9N?=
 =?utf-8?B?NkJYWE5zNnRVTmZzRUcrWEJMNWpCVlhyc0lNbnV5c21FRGxIR1pFaTh1YTlU?=
 =?utf-8?B?L0JIR3ZoQXN6bE8zTWM4NkppNnpvSTY1ajRKOS9PME5YWE1kR2lkVk9xNWd0?=
 =?utf-8?B?emZNVjdyRzJ4dVU2cHA1M2RXMUVLbGxJOVEzeG92cUtOellPc01MS0s1dmd0?=
 =?utf-8?B?VlVNQ0wxbThXN24razNtWWdCaG9HZzNuekFYcjFzWUpiNVNwUjAxOE9rcWNs?=
 =?utf-8?B?T2tQNVFabUhzOHFCaHdKYXNuejE0SHkvREZOSmpRMVM4L0owc003ZUJTSk54?=
 =?utf-8?B?V2VNeFJqRHE5U1ozTEU1d1dCWG5CNmlNODlTQU5lVjVEZFdnelJHZElwUytW?=
 =?utf-8?B?VGRHWVlPUm1wUUQwT1RIYzUxb2hJMjFDcm85ckNFdU8reTdvWWNROWxTdzRX?=
 =?utf-8?B?Unl5RnVIWkk5VEREQUQvZ3Q5NHN4T1N2V3NmZEVFSlVWeEZhZjJxSGtBSXZW?=
 =?utf-8?B?a0toeVVlTlU1cjhoOEE2SHRzRjhOL21KTjYxZjNRT1NsVkw5OHlPazNmVStt?=
 =?utf-8?B?bFdURWM3YUs2UDVDeGtjZGVGU0htaDlGVGJoVFJLT0x4UC9BM3JXak15aHJU?=
 =?utf-8?B?Y293dkVLVnk1TFVaV1hFbmNjdWkzaHhJV1plQ1orMzR2bSs4OVgvL0syT2ZF?=
 =?utf-8?B?TmRCUWNieXAyVXB6dkJSaW5CeDlBVVRTMVVpT0FYM2p4WTB2OG03OGU3ZjJ5?=
 =?utf-8?B?b1J2NEc0Z0Q0S1F6TkphaThzK00yS1p1RXh6d0krUnlmelF6ekxudUhhNUo3?=
 =?utf-8?B?cFBZdHV4YzZOcFNnbWVMMHROekhDZ3B6ZkY0Z2libWRRS3M2RU9od0lQSlB5?=
 =?utf-8?B?TDFicUhiMmRLWmpaeWRva3FaODhwQTljWDk3ZlM0ampreXZPbVNpZWVpUFFH?=
 =?utf-8?B?bVQ2Nk5EY283cCtBTmgyNUVsc3oxTjZKbk9xQ0lFOTZGR3BCSXE3LzM5VkVo?=
 =?utf-8?B?V3NQeWcwR3ZibEp5YmpGRDNGYUZlYUp2enhZMXRESldTaDhOYWRET2Z2MEtI?=
 =?utf-8?B?YkF6NXpEQ2IzYlpxbFJ3UGVUMmxJeXRYaUN1dytRLzJyM0xZMUY1VFZOWGZl?=
 =?utf-8?B?RUVweFlTYUVLdFhuZXRJTkQ0UEpFUDZvMmk4QzVwYXVod1FWOHBQaFZ2QjR6?=
 =?utf-8?B?ajlWZmlST1JxdXB3N0VUR0lxT2JUenM3K0hZMUFobG94R2NRUThQRkZTaXIz?=
 =?utf-8?B?eHRaU2VaU0hGNjEyK2ZnK1plY1djR2NpS2hCSEJ4MFlzM25LR1N3Y2szNmhP?=
 =?utf-8?Q?pk4GqaLh+YwsHn9lr6VMAfLnC/N4Zk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yy9Way85dmEvWG9rQ3RORjdYdmlIWWMxMTFkWUhYQnBIbzdhbmNWWEoyV2xa?=
 =?utf-8?B?NVNZRUFJTmFJYkFSeWFQSDZPRWRXRTNKWmdLa0dlR096ditqRFBMRzBIUkVr?=
 =?utf-8?B?dFZpN0pEeSszWTM4eVpycktJeFJjWVF1NG9STTJnZE5EMEhSVmRJTlNVRTlI?=
 =?utf-8?B?eFhUb1QzUDNwZ0k0VmRZTzZqRlQ0cERpMVdNRGtWUW5KUHdENmZWUTRMRlhl?=
 =?utf-8?B?d0FVNHdyTlU3MStXYUFQMU95RThYK0tZTWQvTS9tV29GSWJrMFpPcCtQWVp6?=
 =?utf-8?B?eUZaNC9kWkJwS2tDQmZSeHdJNk5zMkxCbHBCYjRJYTlPclJSYm9ZSUNWcFNu?=
 =?utf-8?B?RldxWjZwVjM4OHdqcGJkdGxOb2h2Y3M0NnVoVFc2dHdpNGN0TDZDSW5FUCsv?=
 =?utf-8?B?a1hsbE9UU2dPS1pnTGE5b2lOYnQranhYZ0VhWWZqOEdZOUJaUEEvMEY2N01D?=
 =?utf-8?B?cEpqOHVsa3ZkV2lWY2NCVWpsWWNoUmQrUU5HR3NZMmJXN0ZjVXNVTTN5SlBk?=
 =?utf-8?B?ODdrdkZJSHdLTGpTb2NMSFBvNi81TmlTb1ZBem9NVGxtYUc1YTArMko1Q0lv?=
 =?utf-8?B?cFB5YTJ0eDAxekxMa2Y0d2YzSVcrN3NqM2pEeEhrazFTZDJXbHNiOGlTQUpL?=
 =?utf-8?B?elNHWTNIU241Ym95QnZTV1gwK2llcWxXQ1JZeUJwbU1zTC9GWDJ6NThXYzBs?=
 =?utf-8?B?bmM2YzEvcHdnRG9NMGR6OHJTMFdSaktjUDhLSzBUWWtCQ0hNdUgyQkFvd3dU?=
 =?utf-8?B?cnZHSytlMHh6R01GNHBsSjE0enE1UlZ1dFRHaTQxcXNnb1QwcGR3VFZIUEJp?=
 =?utf-8?B?eCtsdytSbk4vaWdXVGs2TGtKa1U3SnE5RVZZdmpFNHpzTUNzWFd4dE9CN040?=
 =?utf-8?B?MU5wQ0s1UU52SStNejJ6NXNEbmpock1NRnBKYUdZRG9DcVNtRWhUNldseUpE?=
 =?utf-8?B?SkZJTkovSWJ6V1J0ZUdrVmc1T3BmaDFrK3R6eDllK3psblptM2tuVzIzTDN5?=
 =?utf-8?B?dkdtTzJTU1JWbGF2b29kUEVWaVE3dTRNRVVhbU1FTkdQS3NFV0tFSnNrZlpz?=
 =?utf-8?B?ak0rRDkyR1FNNmhqM1dHMWVXQWJxVmZVUG85RzVqMzJ6a0tqSUJRbDA4YkJq?=
 =?utf-8?B?TmIyS1ZhSzRjR2FSS2lhMUFDUnljUXNCTDhHTERjUWZ5WjBuY3B4Ui9VSVZX?=
 =?utf-8?B?ZlEzN3JjU3RJZkVPZWJkOFhSUGc5dUhzLzBWWU9RSWxUVFVrVHI2V0pWd1Ez?=
 =?utf-8?B?UzFvakVhNFF5WWtwQkpwMDUxVjBRUHVTYnlBL2ZZS3FtNVp6NGhMa2p2RW5W?=
 =?utf-8?B?MFhLcTU1UE9pQllQdmRQMlJ4M241Q0VYTVIveG1jOE9OS2VGQnhVTllUcTZJ?=
 =?utf-8?B?ZUVJeTNaSDZsSXg3OGRKcXlRc0hrKzFuKy9RMTVKUlNWNEJoQWJZeWUrT0JU?=
 =?utf-8?B?WFNXNlphSUtsWUNrdVcvUXY5bXpJcjltZ3VwSEtqTDBJODBEcnp1TURVeDZ0?=
 =?utf-8?B?V0x3ZjVBQ1JEelBkTXNwTTNFUWZLK1VlMzM0akx3NURBUkpwajdFekJtYUF2?=
 =?utf-8?B?SzBSN2czMGkwa3NZSVVmTVVqUGltTnBVY0x5RE1BNFp2U1RUNmZLUlkrY2ta?=
 =?utf-8?B?K3FzZFJwS3ozWnROZFJQOEVvK2NIRDg3UE93b3E3KzR0TExkbVkwcm0wT3h2?=
 =?utf-8?B?V1NIOGZsMmRaSHQ4NXprWTkwcHkvYTdIOHI3aHozL2JhNXJVdkg1L1lacTFF?=
 =?utf-8?B?UTIyNi80Y0pnb0ZzNkJ1dWN6NXdvcEpxTmdPc2pJNTZqdXBtcXQ4T2ZCdWFw?=
 =?utf-8?B?WDVaOFRrUjhtZkJjN0lTZTRmSEhVd0lVbHcvbWhqZnNOQitQd0hBVzlYZ1ZB?=
 =?utf-8?B?ekowTUpSWlQxRXRFdFpKZi9UdlI5NlhFZHpkbFZ1MTJGd3VHK05lb3hYSkdn?=
 =?utf-8?B?Si82cmhwdmdFeU1rSFBmMkZrcXU3dzMxUmlwd2UxNTlOMXBBVFZlOFlCMlMy?=
 =?utf-8?B?UEE2WXhXQTRqY3ROZ1c1R2xPOHdZQlNsb0ZWNnQvQU9PbjZYVG1VVXZLelFI?=
 =?utf-8?B?VitQYXRFOERRcThzaXIxWTBzaUo2b3hBUjNKSlNXcTZpLzNVcTdoQUtFYzR2?=
 =?utf-8?Q?uJg0ij5pL/KGWwvN+f3ulIQ3K?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71605327-c9ef-423a-375a-08ddf039684e
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:12:31.5186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oAL0ZZlAqJWwIGBGIEWMPx5ojrUjJselKsVacw0hYA3rffLjBdQnDUin/g2afNLVdFa84W4FI8lcxMm6cyyUQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9358

Introduce imx_rproc_arm_smc_{start, stop, detect_mode}() helper functions
for all i.MX variants using IMX_RPROC_SMC to manage remote processors.

This allows the removal of the IMX_RPROC_SMC switch-case blocks from
imx_rproc_start(), imx_rproc_stop(), and imx_rproc_detect_mode(), resulting
in cleaner and more maintainable code.

Since this is the last switch in imx_rproc_{start,stop}{}, remove
the switch-case.

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 69 ++++++++++++++++++++++++++----------------
 1 file changed, 43 insertions(+), 26 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index ea34080970c6a5a9b035ef0d389014b8268660a9..5fa729f4286f6ac939357c32fef41d7d97e5f860 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -285,6 +285,15 @@ static const struct imx_rproc_att imx_rproc_att_imx6sx[] = {
 	{ 0x80000000, 0x80000000, 0x60000000, 0 },
 };
 
+static int imx_rproc_arm_smc_start(struct rproc *rproc)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_START, 0, 0, 0, 0, 0, 0, &res);
+
+	return res.a0;
+}
+
 static int imx_rproc_mmio_start(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -308,7 +317,6 @@ static int imx_rproc_start(struct rproc *rproc)
 	struct imx_rproc *priv = rproc->priv;
 	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct device *dev = priv->dev;
-	struct arm_smccc_res res;
 	int ret;
 
 	ret = imx_rproc_xtr_mbox_init(rproc, true);
@@ -320,14 +328,7 @@ static int imx_rproc_start(struct rproc *rproc)
 		goto start_ret;
 	}
 
-	switch (dcfg->method) {
-	case IMX_RPROC_SMC:
-		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_START, 0, 0, 0, 0, 0, 0, &res);
-		ret = res.a0;
-		break;
-	default:
-		return -EOPNOTSUPP;
-	}
+	return -EOPNOTSUPP;
 
 start_ret:
 	if (ret)
@@ -336,6 +337,18 @@ static int imx_rproc_start(struct rproc *rproc)
 	return ret;
 }
 
+static int imx_rproc_arm_smc_stop(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_STOP, 0, 0, 0, 0, 0, 0, &res);
+	if (res.a1)
+		dev_info(priv->dev, "Not in wfi, force stopped\n");
+
+	return res.a0;
+}
+
 static int imx_rproc_mmio_stop(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -365,7 +378,6 @@ static int imx_rproc_stop(struct rproc *rproc)
 	struct imx_rproc *priv = rproc->priv;
 	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct device *dev = priv->dev;
-	struct arm_smccc_res res;
 	int ret;
 
 	if (dcfg->ops && dcfg->ops->stop) {
@@ -373,16 +385,7 @@ static int imx_rproc_stop(struct rproc *rproc)
 		goto stop_ret;
 	}
 
-	switch (dcfg->method) {
-	case IMX_RPROC_SMC:
-		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_STOP, 0, 0, 0, 0, 0, 0, &res);
-		ret = res.a0;
-		if (res.a1)
-			dev_info(dev, "Not in wfi, force stopped\n");
-		break;
-	default:
-		return -EOPNOTSUPP;
-	}
+	return -EOPNOTSUPP;
 
 stop_ret:
 	if (ret)
@@ -867,6 +870,18 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
 	return 0;
 }
 
+static int imx_rproc_arm_smc_detect_mode(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_STARTED, 0, 0, 0, 0, 0, 0, &res);
+	if (res.a0)
+		priv->rproc->state = RPROC_DETACHED;
+
+	return 0;
+}
+
 static int imx_rproc_mmio_detect_mode(struct rproc *rproc)
 {
 	const struct regmap_config config = { .name = "imx-rproc" };
@@ -981,7 +996,6 @@ static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
 static int imx_rproc_detect_mode(struct imx_rproc *priv)
 {
 	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
-	struct arm_smccc_res res;
 
 	if (dcfg->ops && dcfg->ops->detect_mode)
 		return dcfg->ops->detect_mode(priv->rproc);
@@ -990,11 +1004,6 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 	case IMX_RPROC_NONE:
 		priv->rproc->state = RPROC_DETACHED;
 		return 0;
-	case IMX_RPROC_SMC:
-		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_STARTED, 0, 0, 0, 0, 0, 0, &res);
-		if (res.a0)
-			priv->rproc->state = RPROC_DETACHED;
-		return 0;
 	default:
 		break;
 	}
@@ -1170,6 +1179,12 @@ static void imx_rproc_remove(struct platform_device *pdev)
 	destroy_workqueue(priv->workqueue);
 }
 
+static const struct imx_rproc_plat_ops imx_rproc_ops_arm_smc = {
+	.start		= imx_rproc_arm_smc_start,
+	.stop		= imx_rproc_arm_smc_stop,
+	.detect_mode	= imx_rproc_arm_smc_detect_mode,
+};
+
 static const struct imx_rproc_plat_ops imx_rproc_ops_mmio = {
 	.start		= imx_rproc_mmio_start,
 	.stop		= imx_rproc_mmio_stop,
@@ -1199,6 +1214,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
 	.att		= imx_rproc_att_imx8mn,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
 	.method		= IMX_RPROC_SMC,
+	.ops		= &imx_rproc_ops_arm_smc,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
@@ -1265,6 +1281,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
 	.att		= imx_rproc_att_imx93,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx93),
 	.method		= IMX_RPROC_SMC,
+	.ops		= &imx_rproc_ops_arm_smc,
 };
 
 static const struct of_device_id imx_rproc_of_match[] = {

-- 
2.37.1

