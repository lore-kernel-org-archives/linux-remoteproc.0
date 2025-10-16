Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010031.outbound.protection.outlook.com [52.101.84.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EC831CA7D;
	Thu, 16 Oct 2025 11:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760615314; cv=fail; b=mjtb8M/OsWv+4z5ls3NElbU5RS7zrOxztGk1txd+mB4YuAwfGFznNyCNGRZwn2q1IIFsTgSIrZINrsDB90MAdWx03EhyWe2v4O2MRgtqCepy8ofqW2kwXrqXjY7HI5H1/XJE1tZuJ+wKGyF81j6/Qyk/jq7yix284EyUAw5bwH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760615314; c=relaxed/simple;
	bh=VZ8OcvABssu2wQyity8uAVxcaEcUetHRlkOiRxmjpE4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=p/BHRvqYxVfhZsAVe5FG4oVVf/E8fij+bdfkUWs1bMbqvW0RmEgZ3kiyMYqAV9Z4InOb9JAm7EMI/Tn9INwlRMBPjbIgtyn4h+57skLpSrnJyKj2e1WX6j6hSwyyreSzwct5jXP+Ow1eGkx9PbsLYQ/q5TizOJTb+a6KISoJ2p4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lpMyjSXD; arc=fail smtp.client-ip=52.101.84.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lpMyjSXD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eT+6cn18xKII7+tb4uSTAfsx/S9FYXnQ26bAUqJ1QYFH/P3Qfewxz8h/MfTqmKz2u1hg+LMZVN/GgRn1yzDNXo8Usjb4WwFIclbfQSldGf3zB8ZJRO4q6b9pGAkbJzTGt1tPltET2K5+K+Oykq0r0ZjrPDV/TxQTfGO4hHTyBqH5akuVtxwZ+R+cwE4lrLGcivZKUZKKqZp1+ixatLO1/n/ZUWmkI7qGBdWVxMIndihHA8m0WRDlM0law/B1AMPznrbdZ4jhs3jix56vYj+JmnKSe+KfLF6aiFv9yiGwJxBjTeYR4iZROD3osF9kYwzjV4l+Gv1izPwJkR1fMOv0wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XHIIAKcsflIf4tkJmlUdlFuC3RX80ToRE+QNliuX6U=;
 b=dOzPxBS9IohZjsQQDWnH59J4ghUKnIVpJJIWUIuqwdGq2lvcrz9s1xQPoqmDHyG1oGyiy4muu4u6x2G8Ndlb3fRRiLXY8qiy93Jw4jn7c9gt/DsJHwgaYB4e3t5+oftnleqhtjbo1ATGt97wVgjACRXGZ8vlcclYZuvO6cymYOhg+QrQjPrmUtA/Ct/asGHD+rPsL0Za1Z/AX1F0zy79GyrMTgPYfrJMvntVyPzliJJdJpicBZ+2zHB+AnVDL2vg0xw8sxV3K3lENE1JfOUekbyyi9QZmNmrvaaQnA+ULjI5FekWBl08WrYby7x5HTmNykJzBnWWi+DYL6NcuW5fsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XHIIAKcsflIf4tkJmlUdlFuC3RX80ToRE+QNliuX6U=;
 b=lpMyjSXDCHSc3hzxoeCVGA+Qj41v0X7CllU72G/fDUInEGVavbNnC82UpUn8dMZlIkoYDd3QtT2YIBn6R1w6qN5pjSCXSe6prZSOTNdhjhUktuKReyBbXdI8MJfHgu/tJK9jd5EF5rVZrBomgzjHSl23whiXLTa7XkDhCyMvkVnJAD7h/lxlJDH5iq0chgqhxxMIaY8mWkZQMgPuJ0PJSvFzq7e8k055l785NvmyFjW47Rcl/riBetXrAIX1jAOrKLoWHTC7txtWDv0kElsP5XjBSC68nx2N6lRuRCP+9i29R4mB69gnfftVXAVqUyVubAF+QozCTjIZjFRE8c7RkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB9065.eurprd04.prod.outlook.com (2603:10a6:10:2f0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 11:48:31 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 11:48:31 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 16 Oct 2025 19:47:59 +0800
Subject: [PATCH v3 2/4] remoteproc: core: Sort header includes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-rproc-cleanup-v3-v3-2-774083716e8a@nxp.com>
References: <20251016-rproc-cleanup-v3-v3-0-774083716e8a@nxp.com>
In-Reply-To: <20251016-rproc-cleanup-v3-v3-0-774083716e8a@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Andrew Davis <afd@ti.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760615296; l=1872;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=VZ8OcvABssu2wQyity8uAVxcaEcUetHRlkOiRxmjpE4=;
 b=ZMGxWkTGhhtgFKVhoroT1VLwAnTQy488JqD1HEMWxwlSmBYCQxPBSfR9aI/o6/3w3csopSeog
 pzhl1324azxC4IMISu2OrRWTb+0TB+srhIC4jafYRKZF4mxjfYqH8yF
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR04CA0195.apcprd04.prod.outlook.com
 (2603:1096:4:14::33) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU2PR04MB9065:EE_
X-MS-Office365-Filtering-Correlation-Id: 959144d2-1a83-4cb5-4f96-08de0ca9ed93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dWJDbFVTcnRvdXlzZ0x1b1RIMUtobmQ5cDAra3VsZFk2Rm9QWnJCcmxSNTgv?=
 =?utf-8?B?SHNJanNKemo2UkxJa002eWZMdnRiQ282Wm5vRERlU1NkbC9ibVU1ZGRpYXdK?=
 =?utf-8?B?bjRMbjRmeEx6WDB1Yy9ucXZwamMrOXUwZ3lwMkQ4cG5EUXIzU215YnNSMHhN?=
 =?utf-8?B?UlAvclowNnRjaG1RVGxMWTM1eVdncG9DVm1VdzU2UG5xdUgzRU9vZWh5UjBz?=
 =?utf-8?B?U0tobC8xUUFoYllMSFRkK1llT1VZSFRjTHVsOHlqMjZvRk9YaTQrRkNEWUM1?=
 =?utf-8?B?ZVpWb0s0MExmY0lpWXJlMVlrcW1FRm9sVkpBdzErZzBtRnBaTXJqZzBndm14?=
 =?utf-8?B?SHptTVhzZWlWejRHMTJQRGE1U0R2TkpBYkkwMzB6MHh0WjR5alk0Q04vUmRT?=
 =?utf-8?B?bGU0VGdTMHJBTFFSVkN3ODhHVFY0V1ptYUtjNVA0bTVQci8rdlN3Zm9HckYy?=
 =?utf-8?B?WXU1SG14emdXUU8yekhuZThNVTBUSTV4UnFXbG9uR2hYeWkwOS93aVVhbDV4?=
 =?utf-8?B?ajRJUU8xWkdYektNL3RyaUozSFBJTnB5TzQ4Z09lMkF2T2RaRTRpZEpwNWJO?=
 =?utf-8?B?NEgraG00ek94YkgzV0tpMGJ5blBBZzcveHFSSkdtc1E2SHhlWDN5MTAxbDl2?=
 =?utf-8?B?STA4WlNzaXBOTnZqbitESXRvVEVJYVozMG00UUJkbDdIMmV2djYxT2dST0JB?=
 =?utf-8?B?M3JVNG5ZMVp0Q1ladFNiMXF3T0c2NWQ1UTRJUzNPUmNoQStjb1FIN0ZYcjlr?=
 =?utf-8?B?NUlnSzI1dXdwSUhPeThCZFk2SkwvdW1ZMTBsWkZXQUhKY1M3WTVOUmVPMlIr?=
 =?utf-8?B?c3RTbjBUMkR6MC81YjJhbURMZ1Q0Y3l3a3VYNnRHUGNzblJrSU9qUDJJd1J4?=
 =?utf-8?B?bUVQUS9sMHBac3J1RzVxN1EzbUE4a3JKaFVBNlIvSzRXZFNOT2ZZbkpkUlZm?=
 =?utf-8?B?anlic1g5QVlaMzA3dmRiM2hvcldxa09GcXBFYjRNRGJQWE14eHBvOWZNMEZG?=
 =?utf-8?B?YkZyNktXZko2SDZCdDVlTEx4Vk53NHVsdjRLSW9xcWxNbkQ2VnlLOTV5S2py?=
 =?utf-8?B?amk1eEhQLzBTQzBqK3ZMY2FvL294dW5yUVFpTTJSU2ZLTXgxclBEV2pOUVZT?=
 =?utf-8?B?N1RPeENjZDFSd3JZNHpORm9wNDY0L2tnMHJXVURiU2E0VlEwV2xyaDArb1Jo?=
 =?utf-8?B?RnNFaytTM2tDb01PcnVoSFZoOEhnSEg2ai81NWtLcVo4eHlsejhYYVVqR3Jv?=
 =?utf-8?B?MlA4Z1FGdGRERXJ6aGpqVyszU2ZvT2FLbXE2K2kxT05iK0svUUZLOTFmTjRQ?=
 =?utf-8?B?LzRUYXZacDE0ZVR5RE42UGNJbFlmT2NqaXBNMG9walJEVTlQR1FYZXg1OFZI?=
 =?utf-8?B?QjBTUVAxak9jaUJrZGhZTytYN2FrcUpmeFZsZ1dRLytjRzZxa25tMUdSSkow?=
 =?utf-8?B?NTlrOWdBRG9pT0QxS0o1cEYwN3JpeXR0T2VDTEx6eE5ZY2J3S2dkU3N1Y3JJ?=
 =?utf-8?B?bGRKTSsxRTA3eEJLUzZReCtSdWJGMUQvVDJCTm4wYXZkRGZuUnM1ZUZ4U2Ft?=
 =?utf-8?B?VVpxQXZ1dlVaRFVjY0lPYmRGb0diV0l5U2VCK1dpQTI1SlNiUzJQdjAvU3lY?=
 =?utf-8?B?RjF4SW56WUZEUEhDZVpYZXpHMUtTWlJTVUdCY040ZzUzaGxTbXUxNGVHZjl1?=
 =?utf-8?B?dmJCTlhlMFdJMVM3NitzU1FER20wcTR5N0M1eSs3ZmhGVGR3VDI1OURGVTBN?=
 =?utf-8?B?c1pYRlMxRFdaSFZYenBNUmhHRkV4SEQ3Rk1adWplOTNjb3kvTUZIdFVZbkJw?=
 =?utf-8?B?bEpKWGV5UzYyVTYvZmUvMCt3ejNFb0M4dTJLSUFGWEk5T3B4Q1lNRERJWXRS?=
 =?utf-8?B?NkNYMld3WGJaVTBwNlFwc2pKTlpPdFBwYXZ5OHZpSzF6a3dpeVJSblI2ZFps?=
 =?utf-8?B?Sk5ROGIyOEJZcDBwbEErTkhDRlA0QTZab1BKYkN5S0pvSjJ0aDAxa3BiOFFK?=
 =?utf-8?B?VS9KRy96dEpUeUlxU085WnpSb3hyMEdpLzRNMmh2YXo2SkRCMzRiZkREK3Ew?=
 =?utf-8?Q?FgeDBe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2V2RGtoN0prbGVsSVl4eFVvRzVmRWxIUTcrdzdqS093emxjWHhRQUMyK29v?=
 =?utf-8?B?bG1OcUpKQmlFQzF3cncvVndBbmdHelBGeEFRajJmYzhtcndqZmtkMGtvbXg4?=
 =?utf-8?B?dURuVlVhWHltWTBBKzdzdGU0aTVmK0Fic090ZjZBOWtpQ3BMTHQ2Zktnby9E?=
 =?utf-8?B?OEF1Q1h1Ymd5RjFpSmYrdm9BeVpJYnV0aUpJdXlvSXhEcFFJa2tuQjFERnFJ?=
 =?utf-8?B?YkFsOE1iYXJTMXl2M1lUYjNOTDQ2S3llMWwvQm9abW0vdTB0Mi9vUEZUd3lO?=
 =?utf-8?B?dDdXdGU2M1ZnM3kzZlJMK2c3K0kwZjJaRXFUYnBFLzRuSUxrRkxBODRxVnNw?=
 =?utf-8?B?M2VubmJuaEUra0xBSUZoYWE3MVVhZEZSRjZyVlFMSFRDcGNXVlRFRi9FZktK?=
 =?utf-8?B?eTlhYlpBM000eDBlUnNJQ2FVMEJuTVc5UGxDZXlmeTFvWnJXT3lUQ2h4UzRu?=
 =?utf-8?B?eHUwSHB3dW5wRlVjYlpRQUdLb2ozZVZRa1BEZFl5NFpScmJMVHpld1UyK3ov?=
 =?utf-8?B?OWFyYjQ5N0FhcTVMeFN6WUt6TTJyQUkvVDRTZDc0OU1DQTVUZlp4T0Uyb3RI?=
 =?utf-8?B?UWpHYjZPOVBORVFCUjBRWnFkWUFIUTlrcHRQV0luWjFoSURLWndMYXlWS1VP?=
 =?utf-8?B?TjRWanVRb1dZVUlxRFY0eFloaHdNSmd4bUFBL1dlTTFtUURjVTh1MzlKbFlD?=
 =?utf-8?B?MGJTcGpsMkJFalYrdi9TRzNxOENTWGJBcklZNlZvSlh2NnRnTlFOdkl0c1BL?=
 =?utf-8?B?NlhxMmFPMmYyQnZKbDVlS2Q3aVRmT3h5dWZCZG5selJKZkVhdlVzTjNGRUhS?=
 =?utf-8?B?bFRiSjlHaU8xYTZBQzBuOWxBZEMwQVRaN0pOcTJhdUVWcC9XbnZ3a0p2U1ZX?=
 =?utf-8?B?TUt0WGlDOXpIQ3Y1cVArWG5hY3Nrb0pBem1qdml4RFpzWjFXVEVIeW80VW82?=
 =?utf-8?B?ejZSYUtzRkVpNzVCNzczU1d1UVRuS0dSdW1CT0ZLSmV2aEJjUVc0SGliZzdi?=
 =?utf-8?B?aGJ4OEszZVJXcnVad3plb0crTklMdEJiaFFObW5lY0IxQXNucXhKV0p3RVpJ?=
 =?utf-8?B?MHpoc2JFTHRPbkQwL2dvVXU4N3o3amNUdms4cktEZU9ueXJzUU5qbW1QQUdH?=
 =?utf-8?B?RVgyQVB6Tlg0SGs5SzR2NzUwVGhON1pCRkdOWnMvU0lzU01jdVc4RlZ1ZDcv?=
 =?utf-8?B?ZDRkRXNXbTM0cG5PbUlLNG1ndlhmTzVrUTA1VzIvOHMxeUNUalB0Q0YxWTgx?=
 =?utf-8?B?bnpkVm5UTU05ZWd0YzVWRXpsNEVKZ2N2RmtsRHg1a3Zpb1QydUpDNWg0TXFX?=
 =?utf-8?B?WjkwbEs4bFo0ekRSL1Iydm9pTzFMeCtudGZIdG50ZHQ2d3pldnY3cFdzYXly?=
 =?utf-8?B?R2tyRVd2V0liS2VIWGNiOHllTXN2elFhcjdRTjBxb2pZZXErKzNybks1aHFZ?=
 =?utf-8?B?Y1BTanBPb0tKMGdMRmRvWll0cmVUanBhZ1Vkc2ZDMENDenRIMzV1clZ6eWJ4?=
 =?utf-8?B?UlFtTmtrWFk5Z2s2Z3pwcW1JWGc1cEdib0FrRDJxUys5dTh2RExaZjZEOVZB?=
 =?utf-8?B?OFdGOVdSdTFZNDlRZWYwOHlYamVUOWdwR1Bhb0c1LzByQlJiZ3ZBZjdXeXA3?=
 =?utf-8?B?WEVpK2RjZEdiZnk2azg5V0xkekI5RHV0VyswTXRCbDNlQkc2L1VQa1k5eGNn?=
 =?utf-8?B?MkZsb1ZiNnN5cmU2VTFzSUs0OTJ4ZTE1NXlYUzFkQ3dCOXV4MThySXI3SklW?=
 =?utf-8?B?bVlqQXd1NlJEQ0ZRVnN4VGNWUk8xdVd3aEZCZzd5SHBtN0NBR0FBWFZOb0Jz?=
 =?utf-8?B?WW1tbWtOZnBBT2tWeFZ6Rk9xaUdmQy9DU1VjSitWRmhZYUFSN1ZUV2NDT2p0?=
 =?utf-8?B?Ny80TVNtdXpJUnMrWUdQQmg5VXVQOVJHVm1UVmFqVXVkZlpGcFQ1VmplRVJM?=
 =?utf-8?B?a3BTT3Y1WlUzdHRsRGdScXpaOEtDY28yNnUwVU5iNjV4WVNJd005TDFhQTVp?=
 =?utf-8?B?NTlGdW5XbnJRQjl1T0NFbDVJSWJkL0s1aklFeXYzSFpxdFJ3N2I0WHplZlow?=
 =?utf-8?B?Y29JYi9mVWpKczRrTGZYSityekJaL0RwZUFZZnpKVWJBMFBiZXpDOUk2cGtm?=
 =?utf-8?Q?rZXpjHvKIuh23+IpQSdWEaY/w?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 959144d2-1a83-4cb5-4f96-08de0ca9ed93
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 11:48:30.9351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1BEf+JXPNd5pDJQGHvVn/rokzlJ1ZwG8wzwhAFn9NoqE3IkdcpTACj1CEKWxXVG0FRQIMwzcfi1o/LDXESvKgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9065

Reordered the header includes in drivers/remoteproc/remoteproc_core.c
to follow alphabetical order to simplify future maintenance.

No functional changes.

Acked-by: Andrew Davis <afd@ti.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/remoteproc_core.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 29bbaa349e340eedd122fb553004f7e6a5c46e55..f7d21e99d171667d925de769db003c4e13fe8fe8 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -16,29 +16,29 @@
 
 #define pr_fmt(fmt)    "%s: " fmt, __func__
 
+#include <asm/byteorder.h>
+#include <linux/crc32.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
 #include <linux/device.h>
-#include <linux/panic_notifier.h>
-#include <linux/slab.h>
-#include <linux/mutex.h>
 #include <linux/dma-mapping.h>
+#include <linux/elf.h>
 #include <linux/firmware.h>
-#include <linux/string.h>
-#include <linux/debugfs.h>
-#include <linux/rculist.h>
-#include <linux/remoteproc.h>
-#include <linux/iommu.h>
 #include <linux/idr.h>
-#include <linux/elf.h>
-#include <linux/crc32.h>
+#include <linux/iommu.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of_platform.h>
 #include <linux/of_reserved_mem.h>
+#include <linux/panic_notifier.h>
+#include <linux/platform_device.h>
+#include <linux/rculist.h>
+#include <linux/remoteproc.h>
+#include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/virtio_ids.h>
 #include <linux/virtio_ring.h>
-#include <asm/byteorder.h>
-#include <linux/platform_device.h>
 
 #include "remoteproc_internal.h"
 

-- 
2.37.1

