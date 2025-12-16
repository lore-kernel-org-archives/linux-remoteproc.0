Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013004.outbound.protection.outlook.com [40.107.159.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D7D158538;
	Tue, 16 Dec 2025 01:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765849919; cv=fail; b=vBVoyxd98GFMMmMz0dOCbMQgaXS4E7UXTWPbWf1hCULJJggbm52ZP19maK8pDPvPEUYvG6F214/RuExeVXX3hXYKY8tax+UZGMq0/zCwVj+ii9LjMb1322PeYGQDVQcIObE14L2oSab6lIJZ4s+rFdHnpgSERoHNhJoyqnBLp2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765849919; c=relaxed/simple;
	bh=rfkbhzfrT4mPf9YbNx5t9XV5ts3y3mXocJt+QMrydM4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rgsP+3eZvlSnw4QNXDNpXf9Ykf+OcScAqg3lnqFDTIkJ/f8x5DcNAB3Bm9Q3ydU/T/m/qjYJF5ifNgz6H6gRXsImrH24/vvzZcyQgllcPSvGPTN5m5QgA8w6CEF+1LEZGHwyWUNOEib6G607KP6WCjgeiwru2ZObkbJJ7OHzDeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XgEkAZxh; arc=fail smtp.client-ip=40.107.159.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XgEkAZxh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQVtsFjXEGBd6gZzklMLRr9k3DPx8iMn7uwbT2IcBRIWS3MA3rsssg77DYkZK3aEREbeJJ0OBqj8rxK1JEq5HCyYZSazbPrWUQ/msiXpumtuOFsQCGV3F7ud93/jNQt3MfRhNpy0mvcJ0rRKznCE/teNWdH250zmAslEI0Z8VJpwbNtP3UVW9HgDS5uOMLC5pO/5Vkc2Z5n3cihvXJERpXU3pdY+ZeDeIr9TGXOrSlC0qmgSWuwFNPNW80FJTCX+TjFb2HLR7mGGf+8qRxxKeGT5NkraktYUCLu2T9IqtS0o2Cla4y3YUF03Mk7ZIxs1Bab3iCWw5+X+ctLKJJGh9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ApV1Lg88oshQfkk5aoP3oR/19EebLBecgpwofb7fxA=;
 b=l5TJKdp3mJGSpaZohtvbBRJVNqtEsbLwI9ds+TnvtND+fx/wVQ8PO7adNbDiaS5q7PorswROzztOIOQNb+T/rw6JxxmR08ZzjhI1KM6dGiw1Oj9pE9SkH4+dI0z2PnOBucH6l+0s4mcGg+yTZlkwwwXj0u/zkoXZm8LKcn+mPsT2xZ1lHJ6zr5PlvEbCfyeD0ZywMjox+rAAy7U/ewz8cZhPb48dNckP5l5vVFURfGCUA6ATC7Waj/kaaW8BhytfCl446X5TD99pLk9xhVPuCA9ERFojHAZ+19XMTjD0u+/vn78iuLGjNGQmfwWxqWpq4Kw+SkUXM3ODNImMq3JkRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ApV1Lg88oshQfkk5aoP3oR/19EebLBecgpwofb7fxA=;
 b=XgEkAZxhpKGzDwgfxSz0XSukEllN4rlV4N8KnuImIT90kAMZ57aR25nPSu5vfrNQ8bR/Yh4Ggw+kaTb/Qw9NsJFB/ITeQoyjzUsvc6SJGN6klUcOu9iDfyg4qpm7arkmxDUq3CiX/lkylwFt4S/O35axwpRJ199BuNcrmWfP8BFzM3PrYzNvVWjvl/1ezajF2yPByWWee4D5T9OTXKtm8m1328aopThIyt4IidnsAFcQTTs2Lkj5VwRnSGdBa2Cc9UAAmXP8rtNukMxFyoPHt1FVA6+5kePObl6czW3rU2gFHh6epp+KzjHQH4pwFi76/1vGURz9zdSa8Vq5uQoYBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM0PR04MB6915.eurprd04.prod.outlook.com (2603:10a6:208:187::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 01:51:48 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 01:51:48 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 16 Dec 2025 09:51:02 +0800
Subject: [PATCH v4 4/5] remoteproc: imx_rproc: Add support for System
 Manager API
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-imx95-rproc-2025-12-15-v4-4-bf1064ea8daf@nxp.com>
References: <20251216-imx95-rproc-2025-12-15-v4-0-bf1064ea8daf@nxp.com>
In-Reply-To: <20251216-imx95-rproc-2025-12-15-v4-0-bf1064ea8daf@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR03CA0120.apcprd03.prod.outlook.com
 (2603:1096:4:91::24) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM0PR04MB6915:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ba18a26-874f-421b-4721-08de3c45ac90
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cHJWUTZybUIrTjMwbHFrV3dXL1FGSUdiNlBLUnRJa2grY0xxd01vaTJxaDNN?=
 =?utf-8?B?ZTRIM2tXR2ZKaHBsZTIxN1d2azVXV0pMemRNZ2xSKzJjcXk0dlpXaEFZVEFi?=
 =?utf-8?B?MTk5TVpuelNvLzM2VXZCeEkxSmZjTnZnS1VnYld5czAxTXJ2eGdZdlhmV1ZK?=
 =?utf-8?B?QTFLeFdNaENuUTFtZDR3L21GK1kwTUxFVng0T1d3QXUvWGRDRHpINzA5ZXps?=
 =?utf-8?B?TUp1dlhubGlZRjE0WnVGN0RSYmRybFRZQlVwazlLY2ErYlRHd3N2SEhJbmNM?=
 =?utf-8?B?SEc3NCs5NnpwazlVYWt4bnN3Q0hZRWpQdy9GWjBIVGYzV1RRSEZsTmUyK2Ft?=
 =?utf-8?B?Y0NVdUxWVy9GajFzV0RGSXNHclRiNUxrYXdCRmg1ZkFtN2MxbzRNbW53MlRH?=
 =?utf-8?B?UTFMdGFnT0hKbUliZ0tQZFU2NWMxamRJUVhRSk1aTmp2RVhoOU5CVVhMMFV2?=
 =?utf-8?B?SXVaZ3hmSk9lK1FkVjQxeW55SmhBVHBmRStiaDI4TER4V2ViNUJwMkhSMGVy?=
 =?utf-8?B?SHJxaFdGVTcxcklLV2tBQXhtQkJ4M2liNkZlc1lyMWRsSCtFWitRUTBiNzZl?=
 =?utf-8?B?cFZtT1ZVa01KZldwcTl6ZjVNQ0RaYUlHZ1ZyZDJTL08zQ0Y1YTlDcGVCdjk0?=
 =?utf-8?B?bHUxTVlyWlRkckFyd3U5TmJuVmkwUGx3SndPc1gyYUxwZkdScXpSTGdOZmNv?=
 =?utf-8?B?Q2dINElabExrUDNpZ1FyQnNrMmdad2Y1ZDJjdWFOb1kwanZkN0F0anN1UGV5?=
 =?utf-8?B?Y0NScEhCYmtXSjF0em1YZjM5Tkc4NER2TGNoRVJEU3VDOWpNeWsvRHJkaTNC?=
 =?utf-8?B?NzhNcGF0ZXhkeWh0UE5Jc2x3bmJzRTlxdDFrZHZDSHFvMitPR1VhZ1dNUkRu?=
 =?utf-8?B?MXNWWHRXSXRTeXNPY0srMlcxa2hGQ1MwNGNDN3RheTZ1QXlaRlpPK0xRR0dP?=
 =?utf-8?B?NmEzcGV6TUw1S3R0T0xsbGFmbTA4VENZT0hVU1RrT1JkUzBtV1JkRVEzenFM?=
 =?utf-8?B?U2NTNmRFclRYb0VBeUNkSVVPK1l5OHQwRThYVVIyRVRoMzJtTGdydHlyTVF1?=
 =?utf-8?B?bndPYzAwZG1La3dEcERhejR4TytTdUNqaEhUTXFLV2V5L2ZJM2dlQnVjZDZI?=
 =?utf-8?B?NzlCS1BjdEZub1ZZTE84WnpjNFZ6TmZLWlVud0xwdWVVTGFQcnZmUGlOV05p?=
 =?utf-8?B?dFdHM0Z4bXJ2VHNnL0VEcklEZ2dxSDluUDNhY3lybXdSWkRGeDdURUcwd3B4?=
 =?utf-8?B?NS9McmdIZy84c0VrYUJCckFpU0V3TG9EL1JTVnB6U1lHOE9zcmNMcGNYTGUy?=
 =?utf-8?B?Y3VmaG9HTlhQYkhDZHN1M0xha3VQdUpQZzFDMVpBR0dNZzJCeHhZY3BDZmJm?=
 =?utf-8?B?YWZ6YUZ1NUNUb090YnhqYW14RXVvRjk2Um51Ujh2NjFCYjhzVmdUaUVidUVt?=
 =?utf-8?B?UXpITVJwTk9YOFJtajY1enVQTGIzV2pSTkRyK0V0bUtIZk03aUd3RjhWbmNy?=
 =?utf-8?B?L0J2VHFaWU9ZOVJ0ODVUK3ZudjBkbWtwdEJ4VHFwMTUyMGt3bUp2NTBzRnQr?=
 =?utf-8?B?R3AyZlZibjdFV2pPckhmVkxsa1FnVlZjQnp2clBLNTBJUGtBMktCNXRiNFNy?=
 =?utf-8?B?MDdRNGRFdWZrMjVrandKUGtYYVhiWStqV1cyMjU3WkJKejZZazNXUkVabWtC?=
 =?utf-8?B?U09rbkdSZmh4eFZoSmU3Zm5oMHVEVUhpSmo1bGJXbExGTDBWZXBQQ2Q3bFg4?=
 =?utf-8?B?ZVdycjZORmV3dGlVbWo4dEl3ejQxN2Y1OGoveVk1NXVuUjYwcVQrcGl1NDFs?=
 =?utf-8?B?dHpTdjlERTQyeUh6K1BOU2lxV3BVaHdMMFEycW5yMU5VMWFBT1V5KytJSncr?=
 =?utf-8?B?dXhPdVR3YTA5R1pacGVSY01yKzdpOExKZjR6Njl4UzhZM0QzLzNHSWtPdGhh?=
 =?utf-8?B?QXlPU1ZMMjQzN2VRa2RwUWhaaHpuVTJyUWFqcFd2VHB4QUdIb0cwT1hzOFhL?=
 =?utf-8?B?eE9vMXFTbm5rMVg3dGduckkxT0hsRm1DYWFBN1hDUUl5QXRkSDRSeVNRZy9N?=
 =?utf-8?B?NjIzR1ZrQS82RjN2OHVFYXEySmVHRnlRYmtUUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVhIWXdjbnAxbUNoV2JUd3NZRTJGOUh4bzB0M2Z4ZmFyc3lWY2ZXZ3RhNktE?=
 =?utf-8?B?TkJBeWx2cnNzVk1SV3dmOHJaUVpBMWxlVTdGWGIwdzY2TXFmdFJwZFkvaUFn?=
 =?utf-8?B?ZVlnUU5VM1JRd3FQRFk3aEpnYWtKUTdEbmZxTzVWQjBkeDQxNUk5R0Y4QmI3?=
 =?utf-8?B?ancvUitsNUVWYWhCR2xOaHJQN2Q1TDNjNXZmQVhuZXBHejlmWFJKM1F4ZXFv?=
 =?utf-8?B?QWxOSHhkTkQ5NGJYTXpEcitpKzZkT2gyMzZkYTZ2RGZ3cHB6Mk5qVTVlbmRQ?=
 =?utf-8?B?QmJqa1Z2YVJLTHhnT0dzc05DdWZmQUp0Mmp1bklQZ01HQjNuSm9CeHgrOW1G?=
 =?utf-8?B?czRxVlJlY0VEMHhKN1l3d2paU2xGcEpodjRLK0dqOEpZQmNpRHRyMTRlWks3?=
 =?utf-8?B?bktYdnJ2S3VRcjdXRkRWQ1JlMWd0UEhhY012YUppWE9WNHY3ZWhXMzRoeTZa?=
 =?utf-8?B?MUJyT3NtZlp4OEFJdmVFWFZsdG4vck5UbVY4MEdyQlhtSFd0R1dxYkdVaDdS?=
 =?utf-8?B?QjMySHdjaE9rM2dWY0M1SXhpM0s0S09DYzBVK0tLa3FqT2pWUXhtQzBxNE5h?=
 =?utf-8?B?NzZLUXVGeDdGdFBFRGhUZDFUeEdiNXZiSFkzTGdRK3JiZU5UVURSeW1mVlVo?=
 =?utf-8?B?S1dONHVweklUOHRkbXJaRHVyZWRNd3VyYmJFa1htMlN0UVBpekNOVWRicThz?=
 =?utf-8?B?TmdCc3BKVnpRVzU1QUFFUGoxVUVqbFZBRExrY1FrZ1JiZzdwMDlNeUJndG45?=
 =?utf-8?B?UWRiSDNUU2xyQTJzYVd4RTNyVklJVXBxeWhZa0Jsc045bWFtYzZId2ZoTlF6?=
 =?utf-8?B?OHkwVEkvdTcyZHZhVEw0M01YSjlnenZxMTlXdDZ0ZiswMjlZSFJLWktoaTJj?=
 =?utf-8?B?dFpnek85cDVndXBQUzc2YWx5ZXI5RXlHaWM5ZjhKdExYWnVIWU92ZVZPMlcx?=
 =?utf-8?B?SG1GZ2hQZmRrbHJ3c3FoTlZzZkZwMnFtOE56OXlxRCtmRjVONkcxbXR3Z0NY?=
 =?utf-8?B?Vm1nM3VIMTAvbzdpUWFnZVcxQXAzYXNVNUo3ZXVGei9DamsvUXZ2NTk1dkoz?=
 =?utf-8?B?dTBnOTVVVG1PQkVsWkdlMkJmd3hldFRrNnQvcHZXWEJ3WEM3RWFjM2NzSzVP?=
 =?utf-8?B?UUhTSE1wdVAxVlRJQzBFOWw2RC9VNlVGR2FnTTl5US9VZWxBYVIvNEgzTnhl?=
 =?utf-8?B?eDlDQ3ZxK0s4d0xpSDRVUWlQSTJycHhBSW9lMHBkWVlpTW1TTjJNVzNGdTFM?=
 =?utf-8?B?M0xNQ2I0cU5CQ3dxd3VIQ3ViT2pLdExqREdMWjZvRXk1dDFtUEhuMGMyMkcr?=
 =?utf-8?B?MHZlSXc2MDlmSk0rZENiMlBFZzR0aDcxbEJEQUtCRExGdlprakttTllLd2FB?=
 =?utf-8?B?a1paM2Q4dm1iUkJkakJ4OTVFWGpDQXMvMCtBK2NyOUJJRTBFcDZJS2IvNkk2?=
 =?utf-8?B?Z1JqMGNDdXZZWnlleXFXcnQrajNYWTJhMmdCMTZycTRjR20wdytNc2NCdm56?=
 =?utf-8?B?citIU0dTandmYWpQY1oxelcvQzVzVmZQSU9iMm1JRS9xakUzUzFWYlFWSlh2?=
 =?utf-8?B?TGhDTkNGSlFLQ3ZrNmJuTFpZYXZJS2haNXFGc0dvUXdBYlNPTWhJVUVTQW9q?=
 =?utf-8?B?YTNZT1FEdkRZdXo4cWlnaGlNUUxoL3NpeVUzQktKeEp1UWpxa2YxUENveEtK?=
 =?utf-8?B?ZW9UbVd6Qmxna2xQTFVpMmxZckdnRDhpWlp0WWFHWVN1ZE92d0wzRWIyMENw?=
 =?utf-8?B?eEVhL1FlaW9yeG5RR05zTFFNUWVZNnpnV1Nqalh3cExzR2g0UCszSElKK0Zo?=
 =?utf-8?B?SHdwcDZhMXZtc3h6eWVTdlZRN2ltY2Y5M0xSMHhZVzN6VURjNnFIdnU0L0tw?=
 =?utf-8?B?RWRlYXZKRW1raHBPQmpzU1UrM01yS0RxN0t5NFY4cG85VWY0Z1h4ektMWTNC?=
 =?utf-8?B?cDI5enBsVzNaWUFJdVkvVkVZNytPRDFLZGxFSElrZG1IdGxjS1VoTGVZWldU?=
 =?utf-8?B?VW5mQVBRdUdGVk5oT1ZXZExjVVBSOHJkbEdmSUY1a3g0eTFiTXU2bEMvbUVY?=
 =?utf-8?B?YXFseXkzV0FuOFE0aWlPWitXdWZ3M2xQaFBPQzMwZDZqYmZOVkJjWEs3a2hh?=
 =?utf-8?Q?WHRwh2+daDGte8hCOFK+6gDBE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba18a26-874f-421b-4721-08de3c45ac90
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 01:51:48.0117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5OX7CfJUupXy+8fpZM13YVvdw3kh1B1eP0gNC0SAyfw1UMb9SqRD2X4wod2d8UVWSMvtd//QQbMkTSVjRa1HaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6915

From: Peng Fan <peng.fan@nxp.com>

i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
one Cortex-M7 core. The System Control Management Interface(SCMI)
firmware runs on the M33 core. The i.MX95 SCMI firmware named System
Manager(SM) includes vendor extension protocols, Logical Machine
Management(LMM) protocol and CPU protocol and etc.

Depending on SM configuration, M7 can be used as follows:
 (1) M7 in a separate Logical Machine (LM) from A55 cores, that Linux
     can't control
 (2) M7 in a separate LM from A55 cores that Linux can control using LMM
     protocol.
 (3) M7 runs in same Logical Machine as A55 cores, so Linux can control it
     using CPU protocol

So extend the driver to using LMM and CPU protocol to manage the M7 core.
 - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(the ID
   is fixed as 1 in SM firmware if M7 is in a separate LM),
   if Linux LM ID equals M7 LM ID(linux and M7 in same LM), use CPU
   protocol to start/stop. Otherwise, use LMM protocol to start/stop.
   Whether using CPU or LMM protocol to start/stop, the M7 status
   detection could use CPU protocol to detect started or not. So
   in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
   status of M7.
 - For above case (1) and (2), Use SCMI_IMX_LMM_POWER_ON to detect whether
   the M7 LM is under control of A55 LM.
 - For above case , after using SCMI_IMX_LMM_POWER_ON to check
   permission, SCMI_IMX_LMM_SHUTDOWN API should be called to shutdown
   the M7 LM to save power only when M7 LM is going to be started by
   remoteproc framework. Otherwise bypass SCMI_IMX_LMM_SHUTDOWN API if
   M7 LM is started before booting Linux.

Current setup relies on pre-Linux software(U-Boot) to do M7 TCM ECC
initialization. In future, we could add the support in Linux to decouple
U-Boot and Linux.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/Kconfig     |   2 +
 drivers/remoteproc/imx_rproc.c | 193 +++++++++++++++++++++++++++++++++++++++++
 drivers/remoteproc/imx_rproc.h |   3 +
 3 files changed, 198 insertions(+)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 48a0d3a69ed08057716f1e7ea950899f60bbe0cf..ee54436fea5ad08a9c198ce74d44ce7a9aa206de 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -27,6 +27,8 @@ config IMX_REMOTEPROC
 	tristate "i.MX remoteproc support"
 	depends on ARCH_MXC
 	depends on HAVE_ARM_SMCCC
+	depends on IMX_SCMI_CPU_DRV || !IMX_SCMI_CPU_DRV
+	depends on IMX_SCMI_LMM_DRV || !IMX_SCMI_LMM_DRV
 	select MAILBOX
 	help
 	  Say y here to support iMX's remote processors via the remote
diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 35585235c683e6327c3e6db65d5d33253ffba327..55e555f2b5dd63e7d82996437e792a8152c91521 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -8,6 +8,7 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/firmware/imx/sci.h>
+#include <linux/firmware/imx/sm.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mailbox_client.h>
@@ -22,6 +23,7 @@
 #include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
+#include <linux/scmi_imx_protocol.h>
 #include <linux/workqueue.h>
 
 #include "imx_rproc.h"
@@ -92,8 +94,12 @@ struct imx_rproc_mem {
 #define ATT_CORE_MASK   0xffff
 #define ATT_CORE(I)     BIT((I))
 
+/* Linux has permission to handle the Logical Machine of remote cores */
+#define IMX_RPROC_FLAGS_SM_LMM_AVAIL	BIT(0)
+
 static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
 static void imx_rproc_free_mbox(void *data);
+static int imx_rproc_sm_detect_mode(struct rproc *rproc);
 
 struct imx_rproc {
 	struct device			*dev;
@@ -117,6 +123,11 @@ struct imx_rproc {
 	u32				core_index;
 	struct dev_pm_domain_list	*pd_list;
 	const struct imx_rproc_plat_ops	*ops;
+	/*
+	 * For i.MX System Manager based systems
+	 * BIT 0: IMX_RPROC_FLAGS_SM_LMM_AVAIL(RPROC LM is under Linux control )
+	 */
+	u32				flags;
 };
 
 static const struct imx_rproc_att imx_rproc_att_imx93[] = {
@@ -313,6 +324,44 @@ static int imx_rproc_scu_api_start(struct rproc *rproc)
 	return imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, true, priv->entry);
 }
 
+static int imx_rproc_sm_cpu_start(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	int ret;
+
+	ret = scmi_imx_cpu_reset_vector_set(dcfg->cpuid, 0, true, false, false);
+	if (ret) {
+		dev_err(priv->dev, "Failed to set reset vector cpuid(%u): %d\n", dcfg->cpuid, ret);
+		return ret;
+	}
+
+	return scmi_imx_cpu_start(dcfg->cpuid, true);
+}
+
+static int imx_rproc_sm_lmm_start(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	struct device *dev = priv->dev;
+	int ret;
+
+	ret = scmi_imx_lmm_reset_vector_set(dcfg->lmid, dcfg->cpuid, 0, 0);
+	if (ret) {
+		dev_err(dev, "Failed to set reset vector lmid(%u), cpuid(%u): %d\n",
+			dcfg->lmid, dcfg->cpuid, ret);
+		return ret;
+	}
+
+	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_BOOT, 0);
+	if (ret) {
+		dev_err(dev, "Failed to boot lmm(%d): %d\n", dcfg->lmid, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int imx_rproc_start(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -369,6 +418,25 @@ static int imx_rproc_scu_api_stop(struct rproc *rproc)
 	return imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, false, priv->entry);
 }
 
+static int imx_rproc_sm_cpu_stop(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+
+	return scmi_imx_cpu_start(dcfg->cpuid, false);
+}
+
+static int imx_rproc_sm_lmm_stop(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+
+	if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
+		return -EACCES;
+
+	return scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
+}
+
 static int imx_rproc_stop(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -485,6 +553,33 @@ static int imx_rproc_mem_release(struct rproc *rproc,
 	return 0;
 }
 
+static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	int ret;
+
+	/*
+	 * IMX_RPROC_FLAGS_SM_LMM_AVAIL not set indicates Linux is not able
+	 * to start/stop rproc LM, then if rproc is not in detached state,
+	 * prepare should fail. If in detached state, this is in rproc_attach()
+	 * path.
+	 */
+	if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
+		return rproc->state == RPROC_DETACHED ? 0 : -EACCES;
+
+	/* Power on the Logical Machine to make sure TCM is available. */
+	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
+	if (ret) {
+		dev_err(priv->dev, "Failed to power on lmm(%d): %d\n", dcfg->lmid, ret);
+		return ret;
+	}
+
+	dev_info(priv->dev, "lmm(%d) powered on by Linux\n", dcfg->lmid);
+
+	return 0;
+}
+
 static int imx_rproc_prepare(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -980,6 +1075,104 @@ static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
 	return 0;
 }
 
+static const struct imx_rproc_plat_ops imx_rproc_ops_sm_lmm = {
+	.detect_mode	= imx_rproc_sm_detect_mode,
+	.prepare	= imx_rproc_sm_lmm_prepare,
+	.start		= imx_rproc_sm_lmm_start,
+	.stop		= imx_rproc_sm_lmm_stop,
+};
+
+static const struct imx_rproc_plat_ops imx_rproc_ops_sm_cpu = {
+	.detect_mode	= imx_rproc_sm_detect_mode,
+	.start		= imx_rproc_sm_cpu_start,
+	.stop		= imx_rproc_sm_cpu_stop,
+};
+
+static int imx_rproc_sm_lmm_check(struct rproc *rproc, bool started)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	struct device *dev = priv->dev;
+	int ret;
+
+	/*
+	 * Use power on to do permission check. If rproc is in different LM,
+	 * and linux has permission to handle the LM, set IMX_RPROC_FLAGS_SM_LMM_AVAIL.
+	 */
+	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
+	if (ret) {
+		if (ret == -EACCES) {
+			/*
+			 * rproc LM is booted before Linux and not under Linux Control, so only
+			 * do IPC between RPROC and Linux, not return failure
+			 */
+			dev_info(dev, "lmm(%d) not under Linux Control\n", dcfg->lmid);
+			return 0;
+		}
+
+		dev_err(dev, "power on lmm(%d) failed: %d\n", dcfg->lmid, ret);
+		return ret;
+	}
+
+	priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
+
+	/* rproc was started before boot Linux and under control of Linux, directly return */
+	if (started)
+		return 0;
+
+	/* else shutdown the LM to save power */
+	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
+	if (ret) {
+		priv->flags &= ~IMX_RPROC_FLAGS_SM_LMM_AVAIL;
+		dev_err(dev, "shutdown lmm(%d) failed: %d\n", dcfg->lmid, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int imx_rproc_sm_detect_mode(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	struct device *dev = priv->dev;
+	struct scmi_imx_lmm_info info;
+	bool started = false;
+	int ret;
+
+	ret = scmi_imx_cpu_started(dcfg->cpuid, &started);
+	if (ret) {
+		dev_err(dev, "Failed to detect cpu(%d) status: %d\n", dcfg->cpuid, ret);
+		return ret;
+	}
+
+	if (started)
+		priv->rproc->state = RPROC_DETACHED;
+
+	/* Get current Linux Logical Machine ID */
+	ret = scmi_imx_lmm_info(LMM_ID_DISCOVER, &info);
+	if (ret) {
+		dev_err(dev, "Failed to get current LMM ID err: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * Check whether rproc is in the same LM as host core(running Linux)
+	 * If yes, use CPU protocol API to manage rproc.
+	 * If no, use Logical Machine API to manage rproc.
+	 */
+	if (dcfg->lmid == info.lmid) {
+		priv->ops = &imx_rproc_ops_sm_cpu;
+		dev_info(dev, "Using CPU Protocol OPS\n");
+		return 0;
+	}
+
+	priv->ops = &imx_rproc_ops_sm_lmm;
+	dev_info(dev, "Using LMM Protocol OPS\n");
+
+	return imx_rproc_sm_lmm_check(rproc, started);
+}
+
 static int imx_rproc_detect_mode(struct imx_rproc *priv)
 {
 	/*
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index 37417568a0ade2ae4d6a4e3d0f139ea52b185254..d37e6f90548cec727b4aeb874680b42af85bdbb4 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -38,6 +38,9 @@ struct imx_rproc_dcfg {
 	size_t				att_size;
 	u32				flags;
 	const struct imx_rproc_plat_ops	*ops;
+	/* For System Manager(SM) based SoCs */
+	u32				cpuid; /* ID of the remote core */
+	u32				lmid;  /* ID of the Logcial Machine */
 };
 
 #endif /* _IMX_RPROC_H */

-- 
2.37.1

