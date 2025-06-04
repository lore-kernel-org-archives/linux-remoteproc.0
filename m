Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010032.outbound.protection.outlook.com [52.101.69.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1453D154425;
	Wed,  4 Jun 2025 02:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749004562; cv=fail; b=uFFwjtzc+Uy5jNNFBONHc60fa2/sB8Cp7NOTJChwdt6jENFbl/it2FnBk1bqNzFI9lkkwR/RE6fe2m4t3SZCHdmhqYqAktKP8Xfwmp8eWMoFaRVgDFJVihi6hah5jcxVUhdXxky0iYRpl9/VXIwj5GjePzfmaCBeWoKt80AyIb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749004562; c=relaxed/simple;
	bh=PhQYnlIUtha6kVeZLbL4QF5M+LMvMQgPFkGEgTZKTNk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=d9wrnAJrGamATatmDYCq/whJ2TqNCpyB/3zLjULgojVczfDpFBaGPXnrdovTPKK4MNgbkE45/+Yj+eopBJBdCAtgw4XyNfbpBF8ifZha7D3wj4lUkpYbogYDKNBWVaFmxWrDSU97OLfTFxKjEesE5sRNuiWqPPS5bIeqAZOzrN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=w1uhv5WG; arc=fail smtp.client-ip=52.101.69.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="w1uhv5WG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dymPlCaAprpsZF0+wsJxrOLjPvrFHPEgpf8FkeJKIxnm56gFZw7u7azihAL/sJskNp2CKIaQU7aMvUuMwkD/DxZ36GhwBYwyt3dmflIvrl01Ik33IlkHMASfX+EUB6kYvYc+XZc4i1IEyRjg/1NOnaG5zK1w5sZTr5U87kaDb6RKE5dGcAdg1WhzklIqc04Xt8hTK99QdfyzkU3Upa/OrdbhidXMgc8oed5KFo3H0uYLSa9eCwPfP0MglozXGrddn+cr7Nv3AE+UwdWNBxNaizlpejsXdcWbpU+GJgTl0ZY5Izi1u+/7ecsJKLbO8l/0z+e2uFlmrk4LO5JdP/dZHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ToqA+pOHHkrD/xwr9VpXtXytOH8sYHXrG4PrngVSPQk=;
 b=j3FCKZG5Rd8zFwlIgmUqcQ59HeyLY1lqE9mkkmcKZAY7ftVc422CV3TWSHivvNxMrJcfGjaeiKlCVJnIO/yQcdIHt4eHU6BQ5xQv5JTLZoo2SYP8FCCcjg7vqPd3yhdpGLywawzu6A+hhSP/ThuWm+629MVW6hR4hlNdyAbycJYp9R0Tfggu6xG+Fsp+GGPAVjbt+tk7QBZ5Lim4uVXkUrhJcCYi7a0js746qDsCmXdEzmJbpIhzMOGSJtD+N0eC89UfLbfMp1lWodBcVLtVhLwyfyOAQxKp7k4HkF9mrkIzpjYP7ey6HN3h11PakD4yfq8LIAF8vgRz9TzDK5JvwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ToqA+pOHHkrD/xwr9VpXtXytOH8sYHXrG4PrngVSPQk=;
 b=w1uhv5WGnPPuybC9zm8DdYh4K+Kw3D/PVVVoxI4Hxz0cQezcu6nQOsnyS/kKgAjfiIycI7BKrMThSYjQDPCTzSY2ir4qBbDjXZsWugobCU9CMN1YArlALCrgjmz10TZTZYVT2nFUAUmrLg3gQiPPiMqtFVgjwFOM654LkEwXfeWMa2wcCyGO04N6ld9iVRL/O7QKp/H9XVGtbldFpXgOuE6JRpLbRHchg0a28ckoXQtCMXpJyE6zS1kUXr+jmfCpa4EfawB5U1UU9PH1DN3y5ldLmoiqdY0CnflSiyQaFgcWr4OZ/h2j3RzPp9hqN2iuj/AxHyxuTKPI5Jc0/xG//A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB9440.eurprd04.prod.outlook.com (2603:10a6:102:2ac::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 4 Jun
 2025 02:35:57 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 02:35:57 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 04 Jun 2025 10:33:43 +0800
Subject: [PATCH 1/3] dt-bindings: remoteproc: fsl,imx-rproc: Add support
 for i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-imx95-rproc-1-v1-1-a6e5f512731c@nxp.com>
References: <20250604-imx95-rproc-1-v1-0-a6e5f512731c@nxp.com>
In-Reply-To: <20250604-imx95-rproc-1-v1-0-a6e5f512731c@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749004455; l=2529;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=VVnTLxbr2NVqlsL27XH2U3HjQGM/QoTFHPlXLUWriGM=;
 b=zdtB+0dhQFurCkBaFmWIxE2o/9T9mhABo8pm43jww+wmyuSJLrClOsDYbzXUjDpygWJVaimH5
 Els7mzJh3yGCeD4kErG3IFSCKp6ZlK0RzzhdX67yyY36ErigyELVb8l
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SY8P300CA0015.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:29d::24) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB9440:EE_
X-MS-Office365-Filtering-Correlation-Id: 3baa24d2-b868-466e-7ee2-08dda31088e9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OG5zZXNDVHBhaFAvSWRZRS9WQzBwSXp0ZmdUM0RneTBFZ2l3UldCUDhYYlVW?=
 =?utf-8?B?MDFVQXpaeWw5dHRERVFpWEJwS2lodUxhMlVsa3RRUFBmNnFVTko2aWFobGNQ?=
 =?utf-8?B?RW1VVmJGRkRhaHNGMkd0K0ZGUGlhQmY5R1E0VXNGa0hZc05KYllId3ovQUZt?=
 =?utf-8?B?RmhHSGJxOFU1Q2ZKdXhVN1pMZjZKNktoOC81SXM1Nk0zSXBBSVBlZ0hhMksv?=
 =?utf-8?B?RzlOdzVnT2dEeGx6bGEyYVJveHhiRkhPU01BdjhqUXJZNzhCVWZoL05TRkdY?=
 =?utf-8?B?cWo4SVJBNFVaUzd3b0kzSUlXWGp5NGczdW9TTnBvSitGeE9PVFd0aDBLdFBu?=
 =?utf-8?B?QTN5WnQzcXhmOXlxSmlQbFJaOWNvaXJhaDlqNy9icHNlTUE0a1BCbkp1NTlx?=
 =?utf-8?B?VU9MYjNDT1d1R0taZkRkeHNNZVBqVFNUY0RoQ2t4OFdmZkZsZms2a2l3MnY0?=
 =?utf-8?B?V29JcXhySWVnUWYxaHBKajdWME85NE1YUjAwdkFUd00vSGNTempvLzZHSWhI?=
 =?utf-8?B?Z28zenVPK1Z6N0ZvQm8wSlE1elYyZ01aaUhZM1FEV0NUSWgwdHppbnRjNU4r?=
 =?utf-8?B?dlR0UnNYbUVjVkl4VUswQ3A5Y2dseFYwRkQ2VytqZythSGN5M052Q2EzeTBL?=
 =?utf-8?B?Sk9HTEpDbnNMOHRUYTJzWUhXcWg4aEg3dnZZYzZoM3gwR01IVUp4b3J5N2lH?=
 =?utf-8?B?S0FZN3dkeHdMeUlocVE5M0tiV0IyRjc5OU1jQ3dZcXVOMTRNYlVvdG1VQ2dE?=
 =?utf-8?B?RVdwbU5wTURxVVlvMXVEZDFic2s2SEo1THpiZ1dtWmg0ZzFjdXk0SmtmeEFZ?=
 =?utf-8?B?MDJ1ZzluSVFCRXE5WnFwWkxoWWU5WmlFQ0Yzc3BuazdJUkR1bG40VnRrQ0s0?=
 =?utf-8?B?eDBXcnFDN0VodHlCVWRGa2QyNkV6b1UvcG5GV2U2NzdFd3haNC9MMFJHV2pF?=
 =?utf-8?B?bHVjNkFMdnNNeWJGU3o2NERUUDNscmEzbDkwd2g1Z05DMUNzU3pkR09kTlZI?=
 =?utf-8?B?eUdpK3MzcW1idHVPdDNybmZkd0lxK0lsQTJNbWlNNm54UTg2ZzMzUUs5emZn?=
 =?utf-8?B?WUMrWTY2Z1YyUzFRRWlxd2Vkc095OGxlU2sxUGtPQkdXUi8wR1NrNzZ3TEJ6?=
 =?utf-8?B?dGcveUcwZHlGZFRIQzQ2di9SYXE3b0JNV0tXdnhac0llK01nK2x0TnNxMlZU?=
 =?utf-8?B?eGlRaC9KRWRQT1V4d2VlejhWZjREWUM4STEwTkNva01CLzJ4TDBOekt0b05F?=
 =?utf-8?B?VDdQWkJJMW1rY2ViWVZCU25QelkrQXFvRGlaSjFWdE1QanZyTkM1eG1pYzNP?=
 =?utf-8?B?TTVsT0tBWEtxaXlDMHhKNm5VRmoyTXhreklUaGZleUl3Zi93bDZlZm9OOEVn?=
 =?utf-8?B?ZTJ1WGxpRk9JV0VRSTBZaDFJQXd4Wk91dWhJZEkyM3RJYkthb1ovdzBaMFNx?=
 =?utf-8?B?VkhXVkR3eUhDWGtYVUV3ZVZ0aXF2TERGVE9EWFNuZ0U2R3Z2WkdSOUo2VlZr?=
 =?utf-8?B?VzJaeTFPUU1GdDNTTndDaXlPZmhFY3JvSUdoNUxBWVczVVhUNVdHTThsTVlG?=
 =?utf-8?B?R0xEMzl2T1JOeFBNYlkxTkxKNW9PQ1YyMkpPY2JKdGszcFJtb0J0eTRra2Nw?=
 =?utf-8?B?MjhWYjlIVlAwc0lqSEl6a2NvOHB1NzhMVXN1Y3liWTlweDRpbkZLeWRDNDRK?=
 =?utf-8?B?OStiWUw0d2duNjN2ZjlYazYwUy95RjI1SS9YYmY2OUdVcmlTV0F1U3NyK2My?=
 =?utf-8?B?bjNNb3NZNURKdE5yWGRIVU0rcnY4Y2NlT0svZ1ZiYk40Y3R4ZklTejV4TVVu?=
 =?utf-8?B?VFM1djdGZGJXK2ZtYnNqS1REYWFXbVBIUU9VbllQL1FmdGt6TUdZdCtoR3NY?=
 =?utf-8?B?RWVOdGtXVkE2SlZnRnFPWC8yam5TZ2lHSmthOWY0cXB0dTlIcXdsRXk2NzRn?=
 =?utf-8?B?MnRMbHkwU2NyS2JNS090SG1sMzdLVy80ME5CMWFhaFA4UEVYRE0vUjF2bFhU?=
 =?utf-8?Q?GJt1KQFbbT/4o48fKBSKf2lszn6G1A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTk3MGxoZXNENFFXR0tBdzNlVUMwNGsxQndlTDdLRnVvby9Ca0JWNHJQMk04?=
 =?utf-8?B?Q1dROThHMkpCWnltK05vOUtCVXFvWjlZUFAxTFlaMDdMeVZ0QUxadHptUE4z?=
 =?utf-8?B?Nk1HNlJQR0czWFh2ai8wckppUTFlTktOeE94QmEwZzlZUlJHMWhNYUVlcW1X?=
 =?utf-8?B?cWw2czJuUW5QWW02Szc3djRTcmtDcGRkdU1oWUtCcE1CVFBSbXBSOXEyQjVz?=
 =?utf-8?B?SFFiQnNuKzZlVm9lQXRLaWdTdGZFQm5DUVdtR1N2VTJFT0NTaFRQbHhJb3Qr?=
 =?utf-8?B?ZFppcWNTWFJ2T2dzN2xOUGlaOG1zeGI0Tmt4R2xaRVhrbUcraXVVUWZrcWI2?=
 =?utf-8?B?ZjJ5R2xyalhrM24yOVBZR042d3UrdUJQOFdrblZOVjA4OC95WWhoVjlYV1Q1?=
 =?utf-8?B?cWNGOGV5c3ZyVE1lS2hNRHJxUHZUZXYrRW1pakYrUGdEOTE4NWE4RTd3YXdL?=
 =?utf-8?B?R2dKOVVPTlQrQ2I1aGlaWnh5Y2ExYUE4LzR5WUpzZElaWDZFM0dRR0Y5MlFi?=
 =?utf-8?B?dEljTmxOV2kyMVJROHhMUFdaZHQrWVhoM0h5TTZqSlVnSmtOd1lJc2JJRnZk?=
 =?utf-8?B?QWhsOWhvVVZHZEVMejFYcG1ablc0RWtkVjlJRFk5R3NUcmxncDErZ2ZpMVIv?=
 =?utf-8?B?YVRnWjNWL0ZRTENoY0J2by9pS2JTaDB5UDhUWGx4WmQ3SW85N3R1cTVDTGFV?=
 =?utf-8?B?bWk4L2FlTFJMamhKc09jNG9KSlF6ZkpxSm85QklCUEtpMUczNm1WcGNvMko4?=
 =?utf-8?B?eTZudFh0NDhISkkyNkNpVGc0bXFOemlTdDdGWURRYmxaVlpDTStsMnhLK0JN?=
 =?utf-8?B?R0Y1U1g0bjVyajZmcGt6ekxJOW80Y2VxcEJUR293OHF2M3d1ZUw1MFRGVjVY?=
 =?utf-8?B?ZGtYb0hWZGdpN3hRQnhrb2RydTZ5UGpya1RqWW82R0wvR25WcG1VKzdkdTdC?=
 =?utf-8?B?Nm5rQXN2L1RmTkdNNTFsUnlySThlZmdVbXZkTDVBNEoxVHhLbzVmRFVabmRQ?=
 =?utf-8?B?SXZneXpDY1F1SzZuRHdaSEhBUkpNS0hrTE1sWjFVWFhzT2dWblp5WVVOMFF0?=
 =?utf-8?B?ZWtPMUh4MUg0alp4NFhQU3VVVFExS2pwbGRJYTZYYmYxUU5kZjcrK21hYVM2?=
 =?utf-8?B?dHlHSVYvN0YzRVZqS0QxMmtvYUlZOGtuZWRCanZaT1k3Nnd1OXROYVJrREZ0?=
 =?utf-8?B?WjY4UVphRVFKWWhpYm1yc2tHTG1uSDNFbHVkVVZ3Q2szV1FYZVVEdmlVbnV2?=
 =?utf-8?B?WEx6M3BtaFIySlNwcXJOd0YrMWRaUTlGUFNmdmFzVUorTXF3dmliR0s2RlFJ?=
 =?utf-8?B?NVMxZFBRSlE4VW1wR3hlMWhsNjkwekdieW5leXJwUkFiZXNzOFRSTGNPbHIx?=
 =?utf-8?B?cjZSRHBSOG5uek9tOEU5ZVNjVHRxbTRjYlZ0OUwyNmtjUUk2OEdET2JjNk5R?=
 =?utf-8?B?RTc1RFpCRUxVV1Zyb1F3czVVRFc0VlZaZmgzYTcrVlhMNTM5MnJtaHhUVnRx?=
 =?utf-8?B?MEhpdzd4STY2eXZ5UkJ5U1BVbGcwVmxYRmZIMyt5UUViSDg1RnlZdGVUankw?=
 =?utf-8?B?d2hXNEhiWkVsaDFRNlR3dHRnT2NjMC92eVh1ZTNTT1lOdEdTMDFqMWRnVkkv?=
 =?utf-8?B?aTdpZytXZ01TTFdPVjE1NStldlgvcDN2b1YxZ0RMbGpiV3QzbUgvZGd5RDRB?=
 =?utf-8?B?clpybEpXSEUrb0xrTFZKRlVrNjdJR2YzYWNpc2NIWHNjYi9GMWdXdWE2dGRw?=
 =?utf-8?B?dTRuaWk5UmpEeDJXL2lVRU5lbXBXcEloOGp0djdNWHFkTjZzS0dwaXRHUXVx?=
 =?utf-8?B?SVpibytZVWZORXF5ZzF5RWoyQ0NLbFRKR0VMc1ZHbk5Jck5HeW1aYjcwU0Nk?=
 =?utf-8?B?cVFFYk1VajY3bDZYYXc0bGdrQUk2ditlUnF0N0VtcFRPdVR6MTV2bjJQbWNx?=
 =?utf-8?B?V2pRVXFyYXd0cHMrWDBhcVJjR3JQbnd5dGdWYW9TUU1OQmQ0bmg1dFhxTnFy?=
 =?utf-8?B?bFI2R0RQbTcwakY0WlplOUIzbS9NWDlNQzFiSjRvN0Z6SVFpd3UrSXhVUlZX?=
 =?utf-8?B?ZHowa1VqMDdqMjVGalpIZENmSDZ3dGRuM0hZZWRGb1FCbDFRTUtsRVBNOFp0?=
 =?utf-8?Q?jpYMDb8rM0P1RBEsE4VNhNXYi?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3baa24d2-b868-466e-7ee2-08dda31088e9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 02:35:57.1015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oplfv6xNbCkwedt+WEHE40aVTW4KWNvXYETj1hivfHsZG1dKwGAH9adY/Bbm3FF392fw96+VWc+TsvTy2ifIXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9440

From: Peng Fan <peng.fan@nxp.com>

i.MX95 has a System Manager(SM) core runs the System Control Management
Interface(SCMI) firmware. Vendor extenions are implemented in the
firmware, Logical Machine Management(LMM) protocol to manage
Logical Machines and CPU protocol to manage cores. The documentation
could be found in file drivers/firmware/arm_scmi/vendors/imx/imx95.rst.

Add below to support i.MX95
 - compatible string for i.MX95 M7
 - fsl,lmm-id to indicate the LMM ID of M7 LM
 - fsl,cpu-id to indicate the CPU ID of M7

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../bindings/remoteproc/fsl,imx-rproc.yaml         | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 57d75acb0b5e52ca49d1361176fdebc18a0bf7a2..a3ffab60df52be6f1d7cf4846ca5ba1c40f03bde 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -28,6 +28,7 @@ properties:
       - fsl,imx8qxp-cm4
       - fsl,imx8ulp-cm33
       - fsl,imx93-cm33
+      - fsl,imx95-cm7
 
   clocks:
     maxItems: 1
@@ -68,6 +69,12 @@ properties:
       Indicate whether need to load the default firmware and start the remote
       processor automatically.
 
+  fsl,cpu-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      This property is to specify the CPU ID of the remote processor
+      in SoC which supports System Manager
+
   fsl,entry-address:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
@@ -78,6 +85,12 @@ properties:
     description:
       Phandle to IOMUXC GPR block which provide access to CM7 CPUWAIT bit.
 
+  fsl,lmm-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      This property is to specify the Logical Machine ID of the remote processor
+      in SoC which supports System Manager
+
   fsl,resource-id:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
@@ -114,6 +127,20 @@ allOf:
       properties:
         power-domains: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx95-cm7
+    then:
+      required:
+        - fsl,lmm-id
+        - fsl,cpu-id
+    else:
+      properties:
+        fsl,lmm-id: false
+        fsl,cpu-id: false
+
 additionalProperties: false
 
 examples:

-- 
2.37.1

