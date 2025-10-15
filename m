Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011001.outbound.protection.outlook.com [40.107.130.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8133824DFF4;
	Wed, 15 Oct 2025 13:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760536422; cv=fail; b=WREktuif9Aa24CuOcmyj70e8o5KtqfEEL9aQcsh/ISm+ic+c3quf0Ep66dPU36cg7sKoNaUQNj1sxNmy02jGOaFkMpOBGoQaxMwKxzpUyQ5SKtl2kOrGQXvoWRGh+Qg0Xj2Hvx8v67Lh0NVS1DesO3Wpkwab4joPf72TnbxALkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760536422; c=relaxed/simple;
	bh=5GLklcwCsvLbHAnje6wsmnXbCBTThJSW3FcavgEBCbE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jqXKPI2R3Lr3wy47GIg4S2RC8xnIR/nrnh8p9H3BP3A3AwD2wE9WGHjtX9mPzLVCTmlkFESXuNpZQL5jsufc2eoo2/ZLh1xVBjF9p5pcKbINLnE2ZcI7VWE0RmJNIhjpe9lgOoqlxVa/+vkdYrllPHfpy7X0lXzvoRRyxz3VCV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=b95oJXM8; arc=fail smtp.client-ip=40.107.130.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="b95oJXM8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gIJRJPQvc7jXIsYAfSG2joU9MVJ54rsYTlN71Zb4O0P/EMbQDo83FujuRQXLg+84DbIH0crxNvqVDZhLaJrS5iE/TB0FRiHX6e6aWvMa3CNCirtp+97qr47k5nTmA49G/AbOTAuym5yaZf8zHJoD5MfGMwISJHAQ86Z+pWCg2S+wWa1MdxwN/8fCwBP3MlqSEBL1h3S2AeDeKGQVfjcPZquJlQ5mjsml1Y+ZfLNN56qZVB0aFI4ZzmNjVcqFvmKBbLMAkFR55L1PiCr2nP6XX8xaf+aC0s9szarIkhmjNHitk1qYJMcOYHLmNzeiT39Ht7w+guCby79tspnInT5QdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7yeIISqZ9Z/ukeUlf0apOZ1LrGm2yA4GNhjMk8AhetQ=;
 b=Vr2fNNWJEt1jUYDjGMkLYCD+GLStylSBvwIgldWZesvbtUEK7c46rxpNYWnxS/s3+pqzSE7dJMKVmUVfp+9FJY0FOek/NZbeffVyg08JHzSn7NmybYPO1qDVtiSOoBvB18g6GOfMsEhaP1o3fptInOsXk2/3Ta8H/E/HGRXxKw98misAkzTmlodmUQZIhY6DmZNgATcn+G9U0nSeqp7KvzTU33o5wAIUDfLlj0Ze4a8Kr52HavDEydeocnIrf4V4/vaG8w2LPoZqOupviEhHtV106ll3ZlVm+MfdmuM25nUbsZ6BFL4nQCnEE20IO8JushQUB2FNAKn61TFD05CyYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yeIISqZ9Z/ukeUlf0apOZ1LrGm2yA4GNhjMk8AhetQ=;
 b=b95oJXM8pSMN+dbSNULgk8TSeja7X6zR44M7ZHLAsbQq4hZD5N25pWycmNYehuOm/aZ0s/GRI5HNxWEuoI/7jANUr7Cu4LnOWjRZXKbGrWzq89qBmJBpbG2LsGwsU/IAHj+4Ew6sobcxOuWplsvPp2XJ1QteKu7qrcgOPs4kEQqKMBedeqrTAqX0UAjmMt7QAFbM49iJC4OAozpt11MyXoC5tnLs2TFdH41jTZ+HqWESo1yWL/QgBGa4vWsD1z8c1HL6BSinmC0T4+7WHcbnozX4qZqGklpBQW2POTj1TWKXV3n//O65Plx0VBsqKwjkDzaxSyl1T/xJxqpr7nHfog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBBPR04MB7612.eurprd04.prod.outlook.com (2603:10a6:10:202::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 13:53:37 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 13:53:37 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Wed, 15 Oct 2025 21:52:57 +0800
Subject: [PATCH v3 3/5] remoteproc: imx_rproc: Enable PM runtime support
 unconditionally
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-imx-rproc-c3_1-v3-3-b4baa247358d@nxp.com>
References: <20251015-imx-rproc-c3_1-v3-0-b4baa247358d@nxp.com>
In-Reply-To: <20251015-imx-rproc-c3_1-v3-0-b4baa247358d@nxp.com>
To: Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760536394; l=1988;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=5GLklcwCsvLbHAnje6wsmnXbCBTThJSW3FcavgEBCbE=;
 b=Dpuxd4tQijQ4sFmZIHd5X84UJ2PEdWufrYTp1OAKmI28UOa3B+rq2/9qpFMgPWH1/ccw6UWum
 divYGPFDZSkBUukMvidxBxidtUl+lzX+QH5+E46S6qh4fu5vHbH/2dF
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR02CA0110.apcprd02.prod.outlook.com
 (2603:1096:4:92::26) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DBBPR04MB7612:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c837ecd-f67f-42b2-d329-08de0bf23d7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|52116014|376014|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V3lKbDlUZzlVN1M2V0I1clBkZ1QydEFCdWNwQjZFem5XQmlndE44TGhPUENJ?=
 =?utf-8?B?YS9DNHVNcjBCNUkxK1dMTUszNjNydDJ0MngvWWtaMjkwTkFxV25HTHNOeEdj?=
 =?utf-8?B?U3RKci9sS1VkWi9mMVV5NGJhZ3ZmcU5ldGFpQ0ppMUY3RW14VzE5N2UrWnV6?=
 =?utf-8?B?cHNUVXUzaFRYWFQ4TnFnR2pCTmhPOW1pS1dsRHdTd2M0cTRIc0YzeWppbUJS?=
 =?utf-8?B?eHpjTTFXUFl2dG0vSmVsa0tQTGRWdDNVNTh4bk9UNlRiZnlGL0tTU3hRM1pw?=
 =?utf-8?B?L0lLdnFQTm5pL2l5VFlzaFFMalVvQkVXQXg5Rm84bDlBcmhTbHlSSWxhMzhI?=
 =?utf-8?B?bmFnSnBxNmpMWVQ4QlFlZjBnVEFZTGRjZHl3d0N2cWdTcEEvM041MjJERFd2?=
 =?utf-8?B?MFV3NWFLMlpvRGNXd2lhbUhvbUthNlFpNXRRdUdkTmlYVEtrVW0rQ2JnbHQy?=
 =?utf-8?B?QllwQTliTU51SFdhRVBhQjFPYnlBdUV6QXBPQVE0TVBxUFlUU1NPRDI1L0ZT?=
 =?utf-8?B?SE1SaGMrOFgwUTZDVll3MnNaOXVVdzM3UzhYdi9SUUFDWC9xRVl1blA5eEZE?=
 =?utf-8?B?MEpKWG96VURqQjNPQ2cwcS9rTVFycGxxZVJ6WlgxNmc1d0JiZWdpd3dwNTly?=
 =?utf-8?B?OVFkVHFrazY2Q0RVWVpEdW5zdDBHaXdLNDZFVEFIbWlXUy9DVnVTanBQQTVU?=
 =?utf-8?B?RENjSk51RkVSNHFhRFREUGNkWDlNa3p0OXBzRGxTblNEd0NxL2pPbWtURHZJ?=
 =?utf-8?B?VDFaaktqc0IvSkZVK3FvNHZETU1xa1dZNnE1ZjRIY25NTzVkTDZhb3BCUzhX?=
 =?utf-8?B?UVdBSkdacStKbUVJWk9wdWowWStOUEtOaXAwNEV0TjhpWUpCZ3ZqOHhBSjA5?=
 =?utf-8?B?VmJEeTU3RWNhYkJpNFdqdkFzZ0FRbDg2SWNNRjhDaW5IR1BSanh3ZjNTdjhv?=
 =?utf-8?B?R1BuWFZMeTJ4NWFDMmxUZmhPM0R6ZXJsU2xRSlA3ZFRJOGh1bDBNT28rUUlh?=
 =?utf-8?B?WGJXaHRuZnVHSHJGQzJQNVRBU3dvaFRYcHhDR3RWYnIxRitqWXNuWVlsVWF1?=
 =?utf-8?B?aVYwY1ErTGpOVENLc1o5SmpET2ltSGpRcEtjSXp1aGl4cy9XRDFUdlFwcDl0?=
 =?utf-8?B?blAzcDlYTjI0c3FVRDNBUVRGRUkvSk1kWDVvYWMvNzYzY3grUFR2SzIzZE81?=
 =?utf-8?B?Wm9wVUVybHpOTk1QOVNaaEhlNG5tWDhkdVdaZHA0NS9uNFByWEJoaEFLL1J5?=
 =?utf-8?B?c1duZkN3RmluUC94WStVMnBWRDdMQ3pub0FSYUdXK1daUU96S05XQU5MajZB?=
 =?utf-8?B?TGVDWDR3RzdyNGRqZGhXQzJ5U1NQazhMTmRXYjZNeVJ5cUtDb05vMjRPampQ?=
 =?utf-8?B?bC9XeXZVTnJTVVhiVXRmTURMZ1RMMWJxK1dKaDhIYlZqd0dWWTBBdFozZEVh?=
 =?utf-8?B?N200anNrckNWSGpDU0MyalEyeFBDdEhrM0d2bmhlSWd3UWZoTXp5aThnSW1D?=
 =?utf-8?B?WmswcVZsUDEweExYMlZTNUJSTnRXNTg1Vll1MWxHMm1kYVd5NFQ3VjEybzBC?=
 =?utf-8?B?dzk3ZGNxL2tMMDNIZzJyVWZyWkw2VERuL0xkNUg5OEovMFdSQkJVZmF0NWJy?=
 =?utf-8?B?dTljWGljc3J3MStYM3BDY2ZFVGRNRmVtbXkzZVNxbzQ4NXV5RklsZUJXQWR1?=
 =?utf-8?B?ZVBvNGMxVUI4MG9IeDh0UHo3NE9wR28yTENrSDAvNU1pY3I5SnNlQ1NibVZ2?=
 =?utf-8?B?R1d4SnNrMU9OVytuM0puMTFzSjJWVVVXMTNMRytrdFdYcmZrbEVrTDZ3dDU3?=
 =?utf-8?B?ek9wU0FtZ29tTVduKzk2ZlFIR0lMRFprZG9zSHBhbTVORUlleFlwTTFlVmhD?=
 =?utf-8?B?bzlNekFaUFFjZ0VKT0dmeG53cnNmWWE2L3pic1NyK0REcm1QVWlXRUhER2lV?=
 =?utf-8?B?aUdPUEdiSVhHUnd2Vkg5R3YySHdOZmJxcVF6RVd2YWZMWjlRdnNmcUw1OWtj?=
 =?utf-8?B?dklHNkRQRVBOQVdlUkZ4WjJjelVsbGFOUGRmL3JxQmNqYTBQcjcxWHc5MDcz?=
 =?utf-8?Q?0jQzrQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(52116014)(376014)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUFnV1Nzb01uSXo0MkFHeFNZOWZ0NXhFWC95WnlkMmpaYkNJZWZvWjJkYmgz?=
 =?utf-8?B?WGpoN2hMQU9FWlFOUkI5WWZmekoydnIrMU1ybHNmN3YrdnlkV04zbHlzdCtk?=
 =?utf-8?B?ejR2YlJDR2ZJWmE0TlB0ZGV2cmRCUm9iRjZ4dEE0M3NBaHNsMzMxRnhWUjgr?=
 =?utf-8?B?Sk5rL1dqN2cvVTNYY29DYkFvcHlTMTJTNmQwK1VZbWR6QlU4ZjBudnJ3ZnZT?=
 =?utf-8?B?am9KdUNxUUprazlXR2F1NnNJanFSb1hOek1BR3ZBUlBMTUxVTm1CY0pUSCsr?=
 =?utf-8?B?emd2Z1hUR3kyVVhjSWZ5M29DVU5GY1NTaUdab3NqNFhhN3lCdEgydVhaZHU5?=
 =?utf-8?B?R3BUYURDN3k2VUJQZ3FKcXdZMXIxOWsxa29XSDl4NlBUSDArRTJPaUxKUkRu?=
 =?utf-8?B?bzU3ZVVvODcxQWlMdFVGaXlqR3U4bTFsMi82L3R2dUp3QWkwa0FRVmwxYUxj?=
 =?utf-8?B?YjdKeFJHaDV3b0dwZFZzRTNNeERhajdoLzZ5STJmeUdocVkxT3QrWDlEdHRt?=
 =?utf-8?B?NEkxQWFyY01kVGNuRkRXRHlKcTVPY01LTmtiTnY3aTBnVUZRdUpsUmc5dHQx?=
 =?utf-8?B?S2R0dXF5TEdJaFdmT2Y0Yjl3SjVVc01OOVpRbGs4bkRvUUpyb1pTNSsvbnJj?=
 =?utf-8?B?QkNCclVhR2NqNWZUb3lHMHdaWVhJaEZvcDlMNGZaOFREWEdmdFFnOFc3QkVa?=
 =?utf-8?B?VkdJVWw3cTQ1MFZ3SjJEdjNZUXYzdGhNejcwdFc5b0pMSWg2eTJOaHlqTGo0?=
 =?utf-8?B?L2NvcEhORU1memhnS1pMam41SkZJQ1VyZFdZaDNVcXlQWVhZaWs3ZXdPK0xO?=
 =?utf-8?B?bUl6WEoxOWN2R0pVRkdFM1ZJMytObzFkWmh5MFhGZ1dDeFRoOUtBRjh0L2wr?=
 =?utf-8?B?VlR0dHNQL21aR3lIcGdnMk5TNFF5NHlkZ1dvTmkrOEJtQXhaTjR2SWZrVnl6?=
 =?utf-8?B?OTNCTHplSC9HNVdXMmduREJlSWxoTE1td3g4NEFZdFpFdzIzUDZmTEs3bWhO?=
 =?utf-8?B?UWtOMW44S0ZiNXN0cHk2cVR2WGhNNWY4eEUrRk8rb0xUbHBQbEZ5VENkcitr?=
 =?utf-8?B?aXc3RmJ4dC9KVHlaV3NtYWN4MUx6ZGw4MmxveG1yeWJYbGdxVnk0c2NZM2dn?=
 =?utf-8?B?dUdwYnF2N2FmcGhWenB1OUVOS2FOeDFBdmFFTmhLTytNYWdzTmU0bHk2dkF3?=
 =?utf-8?B?cEt4M2lpL2ZPNHVPUGxZUFZSWW1JNVdxTGIwZk1mWXl5WDFVQ3NuOFhCb2Zs?=
 =?utf-8?B?RXlMM2VWdHhpVWZhWGRmdzVyMlRHTFpYbkpuSkFyMXVLK3JEQXU3d2RDZjV1?=
 =?utf-8?B?eWtxWW1pQ2F0STdKeDdYRVpUanFwanUrYVNjYVdoWXNERUVNUHl3MzJ1Z3ZL?=
 =?utf-8?B?eGlWTG0zQWpiZ1ZsVXBQMldmcjNNb09FeDRRMkJOc2JzZ2N4OWxIWitWNStn?=
 =?utf-8?B?c3Y0SWROOHVGdFViRXYwMGkrV1RhQnNqSGVJZFppTzE5RTdvU0NKYjJvRVBJ?=
 =?utf-8?B?M2tIUlFGS3VJUG1ld1pqRVlqWFRZVG1UQ29BckpjWkZnbWJpQ0N6SnVjdVRq?=
 =?utf-8?B?RWgxbVd1WUxtK0VUcDg0UU1SQjNGcytmNEF3NjF4VVZwSE9VRkVFSkJSU29H?=
 =?utf-8?B?b3NBSmJsc3RMREVGem1uQk9rcERYVVBSaEI3bEJKVHdGMFBRaGltMTRhTWhs?=
 =?utf-8?B?T0ZERXluZkttb2xITG92SExzRmI5bmNkMFJOVytGa1dhaU9VTzlwbDhKaXZU?=
 =?utf-8?B?cktLaDJwL29icUxVWEhBa1RiaGVEYTUvQmFoOXUxTm56dUlXeWRQVzhiMkFP?=
 =?utf-8?B?czBqR3ZPSjZlekxtZ0FLM0M5ZE44SnVzMFVKeFN6NjFUbUJUSkpzNEhvZVdz?=
 =?utf-8?B?R3FFRGNreHYrNXZZMi9yUHNEQlNnZDVYeE84NWR5Z2VnQ2hINmo4ZzlwYXcv?=
 =?utf-8?B?RE02OXNCL3VNSTN4NXFFU2M1UzNwWjZrM09ER3gzMXJ6RkhPdHlMc2FySkNk?=
 =?utf-8?B?V1lpTlkwYVdjUERSempkRWFIeVlPYmJ6anAvcU1pWERZMWtZYktKY1ZzSWgy?=
 =?utf-8?B?cUZaRlNINHN6QjZGa05lekRKRW5XdUEyeHZhVjJHTE1mMktNVXpBcUsyKzVU?=
 =?utf-8?Q?uUtQaF3VSJqzQfgLAhjJqkO9N?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c837ecd-f67f-42b2-d329-08de0bf23d7e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 13:53:37.6838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XlYR7sMhix1TEYOl+HH5LCaAudtIh7aOSJ8nYXSIrz0GymoMGirgljqI4EMhEfRyXv6tFuuD54+CScxvJ0NVWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7612

PM runtime support is safe and applicable across all i.MX platforms, not
just those using the SCU API. Remove the conditional check and enable PM
runtime unconditionally to simplify the code and ensure consistent power
management behavior.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 820b0cd5adbb17ce5665e7ec2786bca23f1a67ea..25f5cb4d414eabed7a166eb2a8ae5e20b6b4f667 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1119,12 +1119,10 @@ static int imx_rproc_probe(struct platform_device *pdev)
 			return dev_err_probe(dev, ret, "register restart handler failure\n");
 	}
 
-	if (dcfg->method == IMX_RPROC_SCU_API) {
-		pm_runtime_enable(dev);
-		ret = pm_runtime_resume_and_get(dev);
-		if (ret)
-			return dev_err_probe(dev, ret, "pm_runtime get failed\n");
-	}
+	pm_runtime_enable(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "pm_runtime get failed\n");
 
 	ret = devm_rproc_add(dev, rproc);
 	if (ret) {
@@ -1135,10 +1133,8 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	return 0;
 
 err_put_pm:
-	if (dcfg->method == IMX_RPROC_SCU_API) {
-		pm_runtime_disable(dev);
-		pm_runtime_put_noidle(dev);
-	}
+	pm_runtime_disable(dev);
+	pm_runtime_put_noidle(dev);
 
 	return ret;
 }
@@ -1148,10 +1144,8 @@ static void imx_rproc_remove(struct platform_device *pdev)
 	struct rproc *rproc = platform_get_drvdata(pdev);
 	struct imx_rproc *priv = rproc->priv;
 
-	if (priv->dcfg->method == IMX_RPROC_SCU_API) {
-		pm_runtime_disable(priv->dev);
-		pm_runtime_put_noidle(priv->dev);
-	}
+	pm_runtime_disable(priv->dev);
+	pm_runtime_put_noidle(priv->dev);
 }
 
 static const struct imx_rproc_plat_ops imx_rproc_ops_arm_smc = {

-- 
2.37.1

