Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010031.outbound.protection.outlook.com [52.101.84.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAC331B800;
	Thu, 16 Oct 2025 11:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760615312; cv=fail; b=uG20tA3KtgwCKfgnm+5KWOY37C6rM9XZnzRKknuSonpPXvi0KSeTS2gEPO5lsg8ydXb0ZTrbX4L37w+fDSrm07zYwzDlF9Rnje4WUrob2ObwZ1aMKBC1c7+atFcmlB96ysmfDl2cXwlUJ9GoLxybtjGgQq5fIm10uuvFVfrYJk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760615312; c=relaxed/simple;
	bh=yoVpJPTdU/i/TNzxdnEfAWBJvr1Ur9JemL+2eiz5LrI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=J8gYeuaZJFN48MBDJGv/7o7Xl4lDSMKF7KRmBgBOWlZngNIOoAzJcSqzLdED6OsUZvCFQIKUtzD4cqI4ETdahU5mP+sPaY/MrvIIpAor+5rrjaHUAGHP+rwyAtjz8+ieeWeLyBk5pkNS/VHW872jM+VBMZhplrL4RG9ROvdUfD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FSZX+5EF; arc=fail smtp.client-ip=52.101.84.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FSZX+5EF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S38TvCx4vcvjK0YkSdHGozkIRQk1g5/lyYZyErMHaPfRP2Ffj0HLDeGV3G6ZOWE2hAv38Uvo/BmqhUFH0hNZFEDK54cjMoKPVD68HtyudKeicfjtPw3Ht8ZaX6veSwhFz9w2oUACoL+ib6hytvIYFFNyoK+r0l7kBHeYGZZ16slut4ulP6To4QgDcQeqzgXP2wv59Qn9CsSTX/a8PDd8tQSLeMuYB7BiL0th3tWYn+D4ohtF7MnVCfSyT7aFBrMD4pOQ4C65h8/7/vPKAujb//F6zt5BZlyDvucFIRuG4ANkRNjdaSd5JbgeupPhzjSWWZruaTl4mwmDRPAwi1A3eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1CWtMUJTSq3ryJ3+WUXXxd2M0SlEQvvJYsgRAIE4PA=;
 b=LzmVNe6J72iwxf2YgUEiDdMKwPKu07UkJ1fcADCMFl52MN816F6L/nSnc0JOcJ9NXt9IPcuP427syghJuxJ0x6ZVwZCLlEQFJ1wNS5YwQ5NymzCrEBjImPxJwPSFQ6uPYa5c1IrRvc+sJHRdi6QgKmxlIZmkHzEAJNtHL9lbkhZVwNJ6EJpoIxVKypT0ICwRbBPTgSBdtWMYgiVeO9YlGhP0K23Ss08svm+VmHJae66nCQE2GUqz8Y3ITmuJykqGpJnmXZ9c2lHn2ZYT/bf4DQuthVhCHcaDThCrRGjkDZfheWJ8eOAvpgEx0S+LlYx/WhsarQS+PBxn+NYRy1MRBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1CWtMUJTSq3ryJ3+WUXXxd2M0SlEQvvJYsgRAIE4PA=;
 b=FSZX+5EFv9T1jvuYqa6ATNpONSkZjSlq6vbFWFsTjvGOoW33lzFb1BCs8ht7eIk/8M3asoyHrIdcI4D0eItxi9a14yyeVSw3QFTXShsZ7/zV01FtbE8JpmXu7pk71b2/WtIhhGq8HwGfL2oJW6uvYfA0WScunNraJl7cIivJBDvMvg7THOMyV7uH/u+zDRYFatRv0+fcBNyVVo/o8CMfILuIcB6w/UhYfSuoTh4RcHDCFXDXsRcoTg92KbKA37pfAGCUj0xXfEHnOTqxF7yaHLLuUarRL9Lfw98rCGfg3+1TaT7DpY5biS0OYguJPp9WlUXnbGJV38BHL44yXof1aQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB9065.eurprd04.prod.outlook.com (2603:10a6:10:2f0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 11:48:27 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 11:48:27 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 16 Oct 2025 19:47:58 +0800
Subject: [PATCH v3 1/4] remoteproc: core: Drop redundant initialization of
 'ret' in rproc_shutdown()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-rproc-cleanup-v3-v3-1-774083716e8a@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760615296; l=904;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=yoVpJPTdU/i/TNzxdnEfAWBJvr1Ur9JemL+2eiz5LrI=;
 b=MLKTUjFMr4WLbtqTQD4UI7bd4iF3QyMq0Fma9Kl0gV2C4n5rYZpfycNoxapGt8sD4Sfzt790l
 ZIcrXtDh7PoDXsdWVwk+C34IOLx82FeU9+7MmVfQhxIkuaOmtB9l1xj
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
X-MS-Office365-Filtering-Correlation-Id: 714725f7-bf0b-4f7f-9654-08de0ca9eb65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZXJyUFAveXZ1cFBhckR0TENmWHhkSDdYTTRxMk55aEhBN0xNNEZ5WVFlU0xl?=
 =?utf-8?B?b0dwcHdWdmVMRmRxTGc0WDRZL0xBSzRFTm4vSklxODJYUE1sU2F1TlJWdDZj?=
 =?utf-8?B?Ykt2SGRrMVpVQVNXYitWKzJ3WlpRc21NdExyMFc4TURqNWtVc2UrSjRtMTl0?=
 =?utf-8?B?czBKazNOOGxucU9pY0lYM01YOHBjbmtETVBNMHJMM0VFbWRtaGJMZ1k1bHZH?=
 =?utf-8?B?UlE0REwyKzBZS3N1cUwxSnREWWRsdWIrbFdRZm5Ga2pkbEFMTmNHMHNkT2w1?=
 =?utf-8?B?UWJSTUZFeStEZUpFZ3FQcDdrOUVJanpYOC9EZzN3QU90L2FjeC91RFNsc000?=
 =?utf-8?B?VkJld2F3aU9jTFFUdzJTT2Z1OU1WTVc5MGI1UU52OUJIRnk2ZU5tUzBjWHBj?=
 =?utf-8?B?bHdUaGF4RVJ6QkZkS2tRdmRXL203NUJQOUw5d2p6RGJybUJaMWFSYzdhanVH?=
 =?utf-8?B?eVpBL3IzMElYcUFuaDNkS3IxWFhRTFhHZmZhdC9mVzlac0hPZjJwdlh0eURs?=
 =?utf-8?B?V1QwYzhkc1h5WksyNG9McE1FM2xlRC9FWG1vREVwZzd0ZjEyMzRENjZUUlFs?=
 =?utf-8?B?blM2dFJtUmhxb3IrRnAvTmYrTlN5WWxwbytCSnkrc1ozVjVPMTBiUXFnMFl5?=
 =?utf-8?B?cGR3cHprUmJjTDNUWHc4OGZ2TEFGajQrK0pObmZPTVpxa01qdEw2bXBIMlpG?=
 =?utf-8?B?ZkZhUjNiVThwTm9MVEo2bElhSVRzMUQ0Z3R0TU5MQjNWTGZXbUhxWlNleUZr?=
 =?utf-8?B?eTU1N3BjekFJOWNDa1N2TmNOSFhlV3JWQUZMZUZ3cVRzYW5DOVA4MFB4Vmxx?=
 =?utf-8?B?OFdmSmdkSERqK0Z1Z1pnTGV6bjg4UTQ3bXQ4dSt3amcvR2sxdzZaL1p5YzI2?=
 =?utf-8?B?cTEzOSt4RjNTaVR3UlVZa1g0MmJKaFJKbmYxTC85SFprcUFsU0xuWWtKS3Vt?=
 =?utf-8?B?WDZBOW1jNlc5OVFTM1JCUkxmays2MnBmQTRwak9jcEFnT1krcXV2YmJwRnV0?=
 =?utf-8?B?N3dWbkwrZ29HbWExV29qekZKd1g0ZWpJVlRRU2JJZjRtR2o2OVVrU1d2QURT?=
 =?utf-8?B?dHdoNWFMby91WkMxQmFvdmYvSFNrQ0I5WEJhcnlscVhVMUFjVEZCaWxoME9U?=
 =?utf-8?B?d1lHUDBZeDRneEVXeFNzSk5jTGh6NjVQQnZLM2JZZUdXTXhkbmppRnAwQTd4?=
 =?utf-8?B?VEdWblJXb2lIL2h3TFVRY0o2TEMvcGJTTG1kQWNya3RMZlcyMzNnZm92Ky9H?=
 =?utf-8?B?WUNqY1M1KzBtQlZvd3BUNC9LRWk1bG9XY2JueUJybzg0MlNmR0lmRmxic2Ix?=
 =?utf-8?B?OUY0VVQxdXZJUTBHWXNaNVBINlFKa0o3ak5OdGR4SUtROUNGN2FWamNZR1VJ?=
 =?utf-8?B?MzVqWkJnbS9iMXBHMW1EQXkvZlhsZlhWa0swZjJNRnVMOENTTEYrN0NFUGFZ?=
 =?utf-8?B?UnoreXFwVEdoWEh2TWVtbFBoR0lSWXlQMVRxK3A0T2VmR1BCSVJiZ2RSeitR?=
 =?utf-8?B?QjlhRFZwYWZxcGZTS0o3c3J3b0dBZ3prSlpFMksyak42VVRobDE2UWl0OGdI?=
 =?utf-8?B?NWl6VTR1UStEZUdZZXJYWS85N0dNSkxVb0dxOG45dnFXSzlWRDBiSXpGbXA1?=
 =?utf-8?B?WHhGKzluYkRpWURYZXEyMnpaV3VqRU9uQnFGTTZyS2VORHVEWGRWdnZTN3E3?=
 =?utf-8?B?MFN0azNycWl3UW9IKzFBSnlwT3pscW4xa0k5dURyNU50eVVnZThpVnlLaC9w?=
 =?utf-8?B?TDN2ZXgxK2F6Q3lhQzJDWkR4UkR5T3NmanN5YmhwY0ZaeEhHM2t5dGI0OUlF?=
 =?utf-8?B?Z2xXVUs4S05lSXN2ZU8xeXVuYitJQmNxeGt4RmxPb1lKYnFLWDd4RVI2U2Zk?=
 =?utf-8?B?N21vNUxWSnphV3Y2aDF3NWpjWW5yTzI0RGN3dDdRem5NRFdsWHlabU0yaVVO?=
 =?utf-8?B?MVE1MjAvSkxrYTlKNzBHOWN3S2J4Y3hSSmNKaDJBMmc5aXNJY3JLSldrYmx1?=
 =?utf-8?B?YnNxK0ZLbUJNcFIvaWVWSnUybStOMGpGMVBGL2d2TmNXeWpkVEE0Qk41MUZp?=
 =?utf-8?Q?WRste1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2NwY0hpc3ByTmwwTWphT2phaU5vOURnelhPemljRjRGY3c3N0d2aUYvRFh2?=
 =?utf-8?B?a0haRitjanNHTjN5QjhPc1EyWEF0ZjRWNVdTRjFuREluVFVFNnBjTFQ5UVlZ?=
 =?utf-8?B?Y1N5b3lhdzkyYXp3WG5ocEJnVVFYeHVqNXk0QWt0aWRDZnh4SitzR1IyTmlJ?=
 =?utf-8?B?dnlVYklNbTFhNzl5RndqN2ZDdGQ5emM2Nm5aM1k3VklIWkJPRDI3QWNhMjNI?=
 =?utf-8?B?SC9zWnVWWDF5VWxmemJqb204N3ZBOVFpNHZkNU9ad0pVK1EwWHRhcmdTUzV0?=
 =?utf-8?B?TGNNT3FiL1JzWURnanRMUnNXMGM1TmdkVHhBa1dVUlVqcURvTWs3cDB6R0ZD?=
 =?utf-8?B?Z3hIRWZlajVlbHNTZW51MWR3MXV1djVnSWgrWTFaTmhUWFJtZEswelRBZGt0?=
 =?utf-8?B?VEtMTDhlZmhtcGpNZWpCNFBHK3c1RzJhb0RUSldobVZUdHBGNmZLYkwyODFC?=
 =?utf-8?B?WmNneVR5TENEWTZ4dlRWN3lmakJ6Z2VpN0cxY0V1bDJObjVhcXlLNUw0VjNC?=
 =?utf-8?B?dUJpaGU1b1JMZ0RjQU15RFpZMEdJbUUxY0pBNmVpNmk4OTg0WndmUVA5MlB6?=
 =?utf-8?B?czlERU5vZ2picnNZYVkzZG0vTU5sdDBHYWpKa09QbjB2V0ZjSGp0SU53bms3?=
 =?utf-8?B?RklBa2xXRFFWbGN0ZzRMOWtFd0FZYkJWc0F0bFBDb3ZtckYrS05FR2tJejR6?=
 =?utf-8?B?L3d6dEV3amlpamw5bktGcmhtVnJObHZESlNhUExGcXQrN3JjM0UvSGFwMEps?=
 =?utf-8?B?ZEJ3b1IzK2NYNDIzdTF1eGJFMzY4MlpmdDJzNDd4NE5IU2tuanZ5ZnBxL3dI?=
 =?utf-8?B?ZUF1YnlidFgvMXFjaGw4U2pCWXZCT3ByNUgxZEh2YStDbWxtSGlDNkpIcmEz?=
 =?utf-8?B?akVxL09ZYTY0OS9UVk9TMllhNTNsdDhTRWUzcmt0TDk5VklsUVd5YVdWdWpw?=
 =?utf-8?B?ZVROTDdURy82S01vaEJ0ckVoNyt1b1VXSXprQzFJcU1PRVI3dW93eXY2Unow?=
 =?utf-8?B?Y1BVZWxKSm9vYVIwSjg0eFF2bGJYL3JwUS9qSk9CMWFlUU1aSGdzaktzdlBZ?=
 =?utf-8?B?WkF6V1F1TUdQR2t6bjFESkN5cVhvdFRCcEVKZmMxL2hHZ1NqdjZYajhZMmZQ?=
 =?utf-8?B?Y0ViU3dSRlZTMlJxR1R6NEEvOW0ybFFTMDEzZkw5UENSZEJVODZKeE8wRUlq?=
 =?utf-8?B?LzN0bWdsc0h6MXozSVdmK1NLbFZ1SURkRk5SZ3gzYzZSc1RaOEtoczdVbUl4?=
 =?utf-8?B?N0ZRM1RqQWRCQXBZU21UZTN2Sk5mb3YyZXl5UVp2dDMwdGRycStFYkxVbWNU?=
 =?utf-8?B?b1FZalVYM1FmeFMyeVUzYnplRXhuWnovWjRsSW56VklITyt1TGRock1QSENQ?=
 =?utf-8?B?cW5Jb21nQTNxckt2V0FSakhtVG9wK0NrcElpSDVDVFB1aW5QejhlYWpES2hU?=
 =?utf-8?B?TVYrWDlMcHdtMmhBN3QyWnFwdER5SzM4aitWNnhXaWJYZDkzRzk3aHBaYkFV?=
 =?utf-8?B?Q1laNmlxMjNFdXNBUjM4c0d3YW1jbzJPOWxjamhwTU80RW1ZWFFEZDZjaWVv?=
 =?utf-8?B?cE1Pc3c5WTJLNS9xeFJKcmNzL0YwaHFMK003cTBSeEkyUXRNNHJHNHQ1WDlS?=
 =?utf-8?B?K1BoR3ZYTXJpME9QeU9vbWdnZkpmUUgrVnZZNlJ2SS9Iams2amRVc3FPa29H?=
 =?utf-8?B?aG9LZ3NEbzkxYTNkdzJ5dE5zYmVWWlpRc0pPTWg4a2FoQnphK2ZoN2kwZUh3?=
 =?utf-8?B?U3gxVmxUdndEMzFCRlcwcVUwYlE4aGN0MEpvVzdqb2VPMStGY1N6SXByS3lx?=
 =?utf-8?B?UkczS2tiaWExcmdoTVNyQ09lOXF3cFZYWXl4VUZic3JRbFA5WFQ1eXFYTG1O?=
 =?utf-8?B?OHhDazNmTnU4cHRGV3ovOWhscmZUOVhUd0JnRjR4Y2NvVHQzQWZjTmk4S2xL?=
 =?utf-8?B?QjNSSDJyM0lyMmlTQTZ1dlo5WUtSL1dKSmhDVUdDRTFmdngyYXdkWE1FVGpp?=
 =?utf-8?B?OXJjQlF5TTAvbVVoN2RteXF4SFMwQ3JlcldPVXYzRjlPTDBSemd5aXQrWHZW?=
 =?utf-8?B?V3lkWk9QdVVGQVgycXJSYzlYSVZ5TUozRmMvbWtsanNCQXZMblRKV0Z4UkYy?=
 =?utf-8?Q?UvULDCQpLhCsHj8DXswcyR1WI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 714725f7-bf0b-4f7f-9654-08de0ca9eb65
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 11:48:27.2846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 51ZUf6mLwatVGbEkuPNCnhOrAegHWUHGB0oKVo5fJP+rgxu30rj8F5yKoNhK0bvFSp0hfDiDDmn/Z6U3z+5N6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9065

The variable ret is immediately assigned the return value of
mutex_lock_interruptible(), making its prior initialization to zero
unnecessary. Remove the redundant assignment

No functional changes.

Acked-by: Andrew Davis <afd@ti.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/remoteproc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 82567210052893a501e7591204af1feb07befb22..29bbaa349e340eedd122fb553004f7e6a5c46e55 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1989,7 +1989,7 @@ EXPORT_SYMBOL(rproc_boot);
 int rproc_shutdown(struct rproc *rproc)
 {
 	struct device *dev = &rproc->dev;
-	int ret = 0;
+	int ret;
 
 	ret = mutex_lock_interruptible(&rproc->lock);
 	if (ret) {

-- 
2.37.1

