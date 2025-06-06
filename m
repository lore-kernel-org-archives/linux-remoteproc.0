Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010064.outbound.protection.outlook.com [52.101.84.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3951917F0;
	Fri,  6 Jun 2025 01:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749175021; cv=fail; b=nNiTy5gcrpztXml24A04BZZfqcpKv3LHwo/DcN7qlYMEvTglA70/GOoaV6swFlgl9T9OcAj6St7+VdRyhrJ5fd5Uyj1oGzltiNu1dxIyIZT/iDkSFC7WCDdgfFHM5+k5cjBQuJmiqbbj0ruc4GZ3NqkUgOAgbmrC21uKNn0Nsag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749175021; c=relaxed/simple;
	bh=PhQYnlIUtha6kVeZLbL4QF5M+LMvMQgPFkGEgTZKTNk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=bTOgNBc6Ja+/EXM6C9SCh3k+XUGZaAo8ubr8bnZx/HLmA/14dNhHHppKMTSfTv5XzvKdi5sJ57nmCkJecaskoXldkQEmmiNY6pmkUw+jJodOofcBe/UtcmJQPMqslM6YKwxfqxqOm8yry84B4E8BJ0tmpboOFqCeH/aU9lh8r8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=x5JXynk5; arc=fail smtp.client-ip=52.101.84.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="x5JXynk5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qstVv5WfZHWViPNO+Ejs9XgbtINsFN3RW5YAaKAppp9lYw24E3mAFAL4TwiENDXcL4kTrmTUTDTH3lveg6tRvgxBLD9y2ncCuxyiPWHIasJz2s2k48P38Pn4yoh//OJ/gVEo3Hm5KL8Ce1ExGpkV1QyPhuQO406ztTX5WPQ7gPeHHqPbHOo/PN6ICaRYrmiE85nCfUOtGlafG62+vp/8MjwsVlzp6QhYlarisikfLlVLRKjquHWVNpV070uu2rfllK+ZLLBXPTWvdF8E7JdkeEu/HOHbMlxtPoGwPqU2Fx/afuKD5kQwPD+kJl9X5LM1Dw9tZMbyw3Nd1eVjureAWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ToqA+pOHHkrD/xwr9VpXtXytOH8sYHXrG4PrngVSPQk=;
 b=A+Xx1pKpmaHMhIFPiUNXkP7LDwxBBI/0K1omtFf4DzRYlb8I6whNviK3L3v6Eghv3FYbZvuVaGw8Y9R4qkcQcRbResd8CQsNvKAadIlWD8GJ+LntSKwh5AbkSq6ogEPhgd+5ULaeowJdHjcZGbuP8YRaMn7azROOBoRJ2EDuihOiF/SGUJiPwwtsoVcd3+gBkFU7Hyh+54S4TH4D23cf8l3hzejQRPSKCenMDgbcQy88cLMEM3L+d7Qa8+BfVAf7t2JV3rG6Zr1lMU0A8IuOhZZAnHHlctAwiLBLKqLVMuOBgQyaLDJpBDRqoVW2Z42CWAriphLEDjEX+Xgj4YlrRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ToqA+pOHHkrD/xwr9VpXtXytOH8sYHXrG4PrngVSPQk=;
 b=x5JXynk5yxGgl32OlDjZ639Dfti8agOvvlLIE+QSELk1SLUunbLjnLOJ6NGPpcAC0R1u3oApg+nqZVlGmy1EdDHHm1ZCPLy914Fgqgqxc8uF90Y0DOkLF2C3aJNprN8k/VuwaL8NVEXULGF1/Ak58OoF21QZt5qLCqcPRWtbn7apXiA6+saAkEq3lTbFk72AUSz1YLR7IFfXc5JufOA5fJw2lFMz/ZnAJcGByN7ebBRqrNKtqMQUw/59ookihjxLW3GOQpUomIYhHMapSlFxqN6u3mlj81p0gKOcW7/7jmKezD9s729k+GDe5f/CN1PwEhlIVpoB2w5kUYqXfcVdlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU0PR04MB9657.eurprd04.prod.outlook.com (2603:10a6:10:31c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.39; Fri, 6 Jun
 2025 01:56:56 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8813.018; Fri, 6 Jun 2025
 01:56:56 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 06 Jun 2025 09:55:12 +0800
Subject: [PATCH v2 1/3] dt-bindings: remoteproc: fsl,imx-rproc: Add support
 for i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-imx95-rproc-1-v2-1-a2bd64438be9@nxp.com>
References: <20250606-imx95-rproc-1-v2-0-a2bd64438be9@nxp.com>
In-Reply-To: <20250606-imx95-rproc-1-v2-0-a2bd64438be9@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749174921; l=2529;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=VVnTLxbr2NVqlsL27XH2U3HjQGM/QoTFHPlXLUWriGM=;
 b=xopPythKkfX+PxL6XYPU9SfCBxEntYUUkW9VeS72Ku814zIHveZRtzHouui9yNCRGQotO/0Ir
 CZ1q2qYW2A7DxApoPOA6MLbKn/UB5EQ/xqnu/WhiuDzx7WYCibC9nIC
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2P153CA0053.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::22)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU0PR04MB9657:EE_
X-MS-Office365-Filtering-Correlation-Id: f3b04e80-12dc-45cb-2f23-08dda49d6ab6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YUgzSUduOUV3M3pKOTVVejgwa1g4U3FYamtBNlZuT0YyRzBlUzNGbzJva3o4?=
 =?utf-8?B?T2o1VVBEVUE4K1IrMDlMUDJiOVdxVkxsTlJwVjRoemk2eFdwdlI5Zjh5TjFG?=
 =?utf-8?B?QW9CQkFtcktYZUErSlFRa1ZGcS9BN1RFSnlBWDI2L3FjNnJCMzFDbm8zSEpV?=
 =?utf-8?B?c1VqSFFnZ1BFQ1dlOXBUZTJISWo5QkoyV2VlWVJGRTFRazAwZ200ZW9OREx0?=
 =?utf-8?B?MldpQzdWRHdoaGRDYTUrdnYwOCtydVZobEdHTm9SZmJPLzdjMjJuQ1NXZ3Vs?=
 =?utf-8?B?TW9IbTVMaVhNNFZ5aHJLYTBCRjUvWlJ0WkY5RVJ6ekYyc005Z2xoN1dTVG5E?=
 =?utf-8?B?dnM2S3pkN2o5RnNMRVpzWlJydG1JTWdRYkoyd3RhR2J4MGtQRVVEMW4yNGd6?=
 =?utf-8?B?eGExSm9JZjJKTzdXNEpsbmtBUE9GUHZIbE83cURqZ0hDK0lvR0JwV1BBUlJs?=
 =?utf-8?B?aE1VRGgzQlFVR0VJdEpuNE96YzBySjNIVmJTcDB5OHFPRkpvQ3R1YW1sbDVm?=
 =?utf-8?B?bWFlQVQ0anhVL0tYUlBGby9Ea1FLNUQvTmF4amw2dUhrczRJVmd0QlFzNkk1?=
 =?utf-8?B?dDY4c3ByQ0M4ODdEVlJzNG03YWtZUVlrYk0wcnVvM0xKUlJFSGxmU05vbzh4?=
 =?utf-8?B?dGdIK2Q3RGdyQVB4L1BhWFFTdXhXdUhUMGQ3Sy9OUDROd2ErOXVwS3RaUHd2?=
 =?utf-8?B?Rlh0d09mYXE5a3NTZ09CK2J5VkRzWVhNR0VqNlpZbEo3WlJPbnVPNE55eTB6?=
 =?utf-8?B?Zm4zV2U2UDZUL2ZJdW13OUYzY3VsSDNpU0xXYVdSR3lCQXVta1hMWG15UllC?=
 =?utf-8?B?c2NnbStVTWtxa0twRVovM2E2MDFEMm5RTmRYdWFxZk9XQmVrTXJNUVJ6Qkxy?=
 =?utf-8?B?MXZmZXJYcnFQYmpOMGhHVllCVjlCeEdZTEVWd2NjSUhXcFIvdjF4YzlicW1m?=
 =?utf-8?B?ZFZWSXFKQlBZUWk4eGlTVndsbFZDbUJXY1NjZU8zNzRwR1ROUE9zVmlXbVE0?=
 =?utf-8?B?Rm9CYk1qNkxVMVpJMXhvd1Y3Q0E5UFg1aXZjb2RyN05yRFlTM2RWYnV4NmhC?=
 =?utf-8?B?ZmY2ZW0xRVNvUEhKUm0waDdDaUZ5Z2NpTG9xSEtTMjB2UG5aZGM0V1V0UG1i?=
 =?utf-8?B?MzEvTmg0V29oS041M2ZVMmY2RWlBelRlbHl0NHhqeno3WThxejRiZDRhcHUr?=
 =?utf-8?B?TVZ6Uk9FOFVjQkFvaldJMmRMcGx3UTNhMjEyT1l3UU9PVEE0NEhMMmNMODEw?=
 =?utf-8?B?VlNSa3ZKWmdWVjVjRXRXVmxrTzNOYXpycnNHSkRRKzh6bDYyNE9xeE9nWERi?=
 =?utf-8?B?M0lZNExCQVNKZTdvTkJiVm1SWlRwU0tZNllON0xkeFZ6VUFkVGxXWitkLzNV?=
 =?utf-8?B?RjlsdXM1V0VobVBISnp6QmprS3EyK0lIbFlWWHBtRDFpWkN6L0REWGNCS1Vo?=
 =?utf-8?B?eit0ZE1OWXJFWVF6RWlyZ25vRWxzSGVTeXpZRHVXemVrTWFRWnBUcDBjU2Jk?=
 =?utf-8?B?ZzZYWG14VHJZaUVnN3kxa25zSnQ1aWQ1aWlQcmxnU3hnR1BscVR3S1RTSEJh?=
 =?utf-8?B?VWFIckc1Z3k1S1FEQ1htSzZobG92UmVINEZlVk1Bb2c5ZFBBcTUzYVhpUklJ?=
 =?utf-8?B?dS92M2RJNThZbEQ4ZGJucHRGaWRsbU9oekZYb293cmcrY3ZDYWpGam04eXRV?=
 =?utf-8?B?K2JSRXR1SHNhMTRFWkw5TEdRS1gycWlxNm8wSWoxdDN5QzhhQndJOXErSnpz?=
 =?utf-8?B?YWZFN1k3N3VYbjJBVytJMFFGZXdwbXNlQUorVEh2VmN0eHYwTUVZSVoyK05h?=
 =?utf-8?B?WFRMTUU1b3RoMlVoTjB0emFOKzROU0EvNFQvMTNBOFBJdE5nYXVGNWcvN2Fs?=
 =?utf-8?B?cDYxQmJUSk1JdERXR1dKZFFkdjlHWEtaU0c1SEo4UEsvZ0hOOE9LQjJVSkxV?=
 =?utf-8?B?dS9hQ1RVRjlsTlM5MWEwclNtYlRGTEY1OWZsS0tvb3ZnTVhxNHVMTmpmcnQ4?=
 =?utf-8?Q?lgKe9KC7XG/cSjhnmiYQwo95be+w+A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODBnbkxsWGZwZzBIZHFBbEFwaHR2aUpJTUhFUjJFR1Q0MHBETFZYcG1YODJh?=
 =?utf-8?B?UnZoYjBUazMwSjZPaVdyeTh0ZVAzbk04Y3ZBSzJaSlp4ZjRubzVoRWxuU0xI?=
 =?utf-8?B?a3Q4U2pqengydjdaSXVySk85eGVyZmNCYkRPa1BGSWtoM0wwNU5oRlo1K3JQ?=
 =?utf-8?B?TTRlNEl1SjFWM1pVS2g5N1ZTM1B5L2FEc1Iva3hCb1dja1Q3aWZYWUhGK2t5?=
 =?utf-8?B?ZUhnUVdNSDRvTGExQ1pvK0tXUGFZaGxhY3VHRXNEVU1WM2RCbmFCQmRVMDFH?=
 =?utf-8?B?bkYzMXVnVjV3ek1jMWxsRG1GSnVucTR6SWw5UExRWERDc0t0U2hvVDF5RHAy?=
 =?utf-8?B?TmVJckUvenEvYmtQSEUwSUxidHlqOXBQSzRZUzAvWFRvdW9PekNZaTg0cTVz?=
 =?utf-8?B?cDVEbmEyK1gwdTR6a2d3cFVQVFFyYnJnZW1YS2FDWTZqRFhaN2lldDJnYS9S?=
 =?utf-8?B?MjRjSDlsSlRnNVJoZWxqRk5UYUttTDh6ZHpuOUJHbE5QNzhEcDBodktxQXRn?=
 =?utf-8?B?cUtYalgwVHZMRHUzTGxnVGtWdlJqQnFTbndEVDhJa2U1Y3hObjFPNHNKTEw4?=
 =?utf-8?B?U2hjWmFLcUdORWJQdE1tc0ROOXBXRzI5OUM1elRZeGo0VmwxWitvcTRrZ2xm?=
 =?utf-8?B?Mmk0T2gvS285Ykd2YlpNeExycXNpRnFoSjloZDVoOFlHZGVhUjZTdDQrdnk2?=
 =?utf-8?B?aHlHQnhtVTNmaEZwQVF5SHFFWWduNk5YQkpKbzRkT0RlblhZRjhPMXZuQlpt?=
 =?utf-8?B?R2IyK1NkNkNkKzZBVExwclByZXI2QzZEam5HSXVlUnk4QWRiMmI4elhQVUQ4?=
 =?utf-8?B?bWZmQjY4UjBtVDF6WFpyRHRLM1J6a09mR2lWYjBOZ254NkZxUkpya2xGdUFI?=
 =?utf-8?B?T0F0T0xTRGREVndvdTVJRzlwYjdxTlNtVEpVTFhyT0tjLzYzOFdRc0VRNGNF?=
 =?utf-8?B?RjhhaDNmNU9Hc3k3cWI1NlhacGlwUU9XbVBMbFptcENuNVcySUxOeWMrWnpF?=
 =?utf-8?B?aTJZUHdTbmhieHprMnJSWGdUemNRSGZLRXFjejhlQzhlenYvZXU4MERxN0w0?=
 =?utf-8?B?QjY5dUxwT2tscU9Hb0d1b3h4aEE4VmVtdTUrT0RhZi92ZEVpV1hnVXB5UkxC?=
 =?utf-8?B?V0JUcnJ6SU1vTzJSU3NhTW92aE8yeVU1TW85NUxWWWFxVWlnVURNWXRhMnEz?=
 =?utf-8?B?OFdtRWpiUWxJWEZ1MFphNHE3a3dqc1UwMTE1WE5ITU1LUXp6ZHVSUFRMUTZo?=
 =?utf-8?B?K05nUzFHSVZwVnR2MDViTDZBUFN4N2xTdkp4bytWQW95OTJGdnQ2MDBPR25Y?=
 =?utf-8?B?M2tPY2NWWkFWZTBCRTJrRThOOTZzdlc5UHRhVDhzUjBoLzhkWnhGWEthU0dG?=
 =?utf-8?B?OVh5UDhoYU5mVWRYdW45dmZGcDVqUmNlQ1FLcjlqQjFzeWFsMWVmem8zbHI0?=
 =?utf-8?B?YnZYNDJvdVd2MmJpaVlNSEU4K2xBeW1TTkw1YnV1L0phUnE5Tzl2WXo2Y0cw?=
 =?utf-8?B?UitRWE0wSVFMbWhhR2kwZDMzWUtnV2xCcTJLWXQyckRGbmtpT25xbkhOMzls?=
 =?utf-8?B?T1JSYUtoVUxnSk5SZHRGc3hXQWQ5MUFhTmg5czhUalRhSXpxb2o3T1FqWTk3?=
 =?utf-8?B?QTBCSk5yS1hid1hLbEpxNE5QZkdSTkZXQTE4Z3NFL2c1MWJ1RXVCUk9IN01M?=
 =?utf-8?B?cVl2dy81MUtPaFFuK20zYUEzMXM4MTZ6WEFFNmRyb3BOTWFaVzNjRnBzV05p?=
 =?utf-8?B?THlWWWlwSUt6Z01ESnl4dVFlOTBZUVB2Nm92TEVjbUdmQW9PRTdmK3hia0Ew?=
 =?utf-8?B?V3BpTmdDQWdyVkd6cHg1UWJSR2lCN0RUbVN4aGJBYWYza2ZjWmxHQXNuK1Zt?=
 =?utf-8?B?OXUrRkJTYVRkZ3ZLVnBzUm5Xd0crSW15bnJEaEhjQWcxQ2FKRGhGSjR0bVY5?=
 =?utf-8?B?MTEvMWwzY3ZJcDdtQ2VMVXFTV1RaMXZsUTQvUVpDcHFoSGtEUWI1RUprdFBj?=
 =?utf-8?B?ejQvcWl1TEIzd1BpbXlUZk1aZVlLZXJTUXRlNHBrR1cwMW9hRVBiMEF2b3NU?=
 =?utf-8?B?M3hmUHFXQVBkWGdBMGp5bTJOUFV0U2IyVGkzYjV0eEcvd3JSOXpTQ1ppZ0Jk?=
 =?utf-8?Q?E96a0j83YsHRQSYYt3xubzhul?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3b04e80-12dc-45cb-2f23-08dda49d6ab6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 01:56:56.4856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 723k5FzAQsRtje2MC7jCCQyq0hsCi3Ed+LVhheNJZtmQTjPaFnudQBHP3zRG5cBvt718H/Pja7Gisrm+nb7rkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9657

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

