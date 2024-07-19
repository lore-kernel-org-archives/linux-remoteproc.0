Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011057.outbound.protection.outlook.com [52.101.65.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C298002A;
	Fri, 19 Jul 2024 08:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721378416; cv=fail; b=CWuiQE1wGmZX2HDvbxjzLoQLqDNTzEz3qrwOeVVVu8dDV7ToxLgm34z0oEvlqAQYuhATfSnJzJvUmB8DIYzqq+YiM1VIAZw/Oi4hKwAqj+HiowsjwFxa7sr4/A5o6BXnRe+FSb/msYMB2wWAwvz49+bcdQ6I+vKlIGYCgdypEiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721378416; c=relaxed/simple;
	bh=rlUw6E9WN9JlbR6sIv2jpD4O1qh5dSmpbHeKOPorMg4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=bGzWZc1LHSgdDVhVHi/mMoroFrqmawHnB2B0xTfMDIJ2iSsagoOXDUb3qSNPa19AsaAaIMQEvZJUCdbN0TjIv+4RxM4Ip5OgIFZ0LNJblcQnq0ahJ6L/QJddFF3jAi6agqrCA6ob9/O4kGKEakQ576xVQTI0mMAQ9rmM9aanGxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RRWd57XG; arc=fail smtp.client-ip=52.101.65.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RRWd57XG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fuB6ii/wRT5hjyvV1PrHdMrX8qUrrQB5G31uzqawLlEfc6a+5HAoS1FVFVMAQ/jIhTttA9ZWWmk23FYzhdRqLCrBjKYnHUZRZlaok4Qj5D5aPHHQ0lS+oSbQmo1XybPrztgRYbEgSx+u9kpJ/ocu512Y9H8c+91tWQoaIMUrcaACanf0siRPD7rJYTWb0DZJsKM48qmhc0UOcIHin4zc4Pif1lBIQNfbjcK2+PrTWVHdqoKbJnHNp2t8UR1iXFrkYI1abHNvkEDEFIL1wVedu19ITkN0t68MkvZuh14h91nDntG8FS7JyeLEkNawuar4iFt7H+cw/68umW0GLQuZKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNSxgizy+rrvrZ17tCcZ6RNMk2PwDZ358yswXzx4I5s=;
 b=Wg4EFsoy0NXOvepJtRo+zcSfzSeM9CrZ8i+UEr6zPVqEdL/7AU5ekwmPhyIc1PsbyPtdq0kifWqJQi33hRVEn9BogIBO/IzP3yer/11M8VnizkKUW84DODCvVqtyMUnwXVnjFktyl8cHaVn+hFgykwv6cJ3E/21diLeK3ZTT11rCAEoyNm9ZxZgooLcwXfODDInf3T/fnLkEl98Z0aYeYwlZr+Wh2XRKSu/LfKZCkE7B3q7yTvSccBQrcVWruYZbRb7CTh2acyBCpRmbc3uLjI2A+adfJu7d5ulwV+0avrXHKQ4Drd8nKAvxHeb+mp6Q/i2HQVvKb1G1zKihZP6seQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNSxgizy+rrvrZ17tCcZ6RNMk2PwDZ358yswXzx4I5s=;
 b=RRWd57XGcaI1NkCkXTjRyTKGxfnw5kMK7FHQZO8x/o2AbMXfDsVLiNhDyUF0SwwLeRppD3/qqzIi74kSgsJAZytMNDz8Bd5SpRDeE0ka3XrIHJJmhu2fBpbuEJW3ni6daKz6LAx9NoVeWaDPUQiM+uc9514pjVAlg4Xne4tOL7c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB6812.eurprd04.prod.outlook.com (2603:10a6:10:f8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Fri, 19 Jul
 2024 08:40:11 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7762.020; Fri, 19 Jul 2024
 08:40:11 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 19 Jul 2024 16:49:04 +0800
Subject: [PATCH v2 2/2] remoteproc: imx_rproc: handle system off for
 i.MX7ULP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240719-imx_rproc-v2-2-cd8549aa3f1f@nxp.com>
References: <20240719-imx_rproc-v2-0-cd8549aa3f1f@nxp.com>
In-Reply-To: <20240719-imx_rproc-v2-0-cd8549aa3f1f@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>, Marek Vasut <marex@denx.de>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721378951; l=2895;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=9u+mOLa/UKnpD74PoVrTGFSC490GJBGP44V6TiFNVYA=;
 b=XhxP2n+9b5iHTZSeqM2AsJF3TXHNyn5hV0SXTABeJWtoTt3L2zA2e1oSOT98AEeRblWGi1ItN
 Xi/qe1DBDnLCTdNHe6R4uhrY7dT2UC3WAFA/fH74+5GyvCC8DPXmyEy
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR03CA0129.apcprd03.prod.outlook.com
 (2603:1096:4:91::33) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB8PR04MB6812:EE_
X-MS-Office365-Filtering-Correlation-Id: de398837-d19f-4d89-b55f-08dca7ce6701
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SmxxckJ0R1FRdTRtRjIrR3FKSXpHaUJkN3R5R0RPWkxleUdRNkllVkZXODlh?=
 =?utf-8?B?Yk8vcjNjc1JJWlBEMW42bWZFYzZBazBxZU1jbGIzMm9lUEc3dnpzTEFtTC85?=
 =?utf-8?B?MTR4Wmc0dldHY1FsNHllY0VPblMyR1hCVzNNOU54SGFMcXFYSFlCQmI5ZnZV?=
 =?utf-8?B?T1dJeENwOGdpd1VOeE5qVU9JUVdndmJLdmcyVXJBbldQSWExbzBUejFXTWZS?=
 =?utf-8?B?NDdrWEZqZHlkZ3krd2F4dEpYWHArMzc0d1gwSjI4R1FlM2VVRUdTQjBpOEZT?=
 =?utf-8?B?d0pMZ2JXT1FKN3FJMzRuUFViVSttMnJKYWFGYVkrNm5wb1IreFB6aW4xVk1m?=
 =?utf-8?B?OVpzdS9WcDBUcU1aNTB0U2tHQUxCQkE0TWpBTTc1RVNtdnJSYWEyY2JCZEh4?=
 =?utf-8?B?ZjVneW55VkhqL1hRMTM4SGpvSDNOREMzQTMzbkhGVjJodDNwNmY2NlVOcmhI?=
 =?utf-8?B?QnZqQmpGL2R5cHJCZUgxbC80MUZSMmtWV25PR2htYjdiNkdqVHJZOUlCUFo1?=
 =?utf-8?B?aTQ1QVF3VGl1anVXODNWTlJIK05ZdVVCY3lOcEhGWXIwWjlZWTQvYzlvMTR5?=
 =?utf-8?B?RCtDdElaZkVlZkRCM0tUbWtCMlk0SW9xVm5wait2aHF1eTdxcVUySG9UWTF2?=
 =?utf-8?B?SGFzUlF6Yi9yZi9YNlB4UDYwYTA3ajFKMHlyR0R0ZUhMdi9pNG1LMFFWaExQ?=
 =?utf-8?B?RVJYSUhBc0JtS1pmcUk4b3BtRU1sdUdNVlgzc25OMEF4ZFBIcEM5K2pqSkps?=
 =?utf-8?B?WGZJRklNRTZLd0FCbGhjYjBhWWVXYk5tUWtDZE03Z29aK3NuWDk3RDh4S2pJ?=
 =?utf-8?B?eEVVTU1odldXRCtjRzhWMlZpekRwU3FVZGVESzk0YWVUMEllOVJ6R1ZWTFRE?=
 =?utf-8?B?R3ZKbnRSbVg3elIwZUxkUmNrTXNZaXB6WFRDdTlwdzRPM0pNc0tqSU8vYktt?=
 =?utf-8?B?UGEyUzJndUpOcjNKMHB4M0w1Q1ZZZkVvSHFlVGtyZUhiODk1TFp3OGlQTGhD?=
 =?utf-8?B?WnRHeTFpVFB4Wk1TOE42VGtiRGtwWStldlNYWHl0eVhmcDZCb0R5WkFzWktj?=
 =?utf-8?B?amRBWGVOVFR5eEcrMFhoeXorQWQ1Wnh2cUU5Mjd4SmcyNG5wLzk5QnN0blZT?=
 =?utf-8?B?dzk2Zkh1eldJUWkrTFJmVzFGTDA2WTRlZWZ5Q1VSaHZ0Ykc4MjB6ZjlERDVp?=
 =?utf-8?B?Q0d4YkU2aHhpekFaSGFWZkZkYmRaazNCQ1RXNVNPbXEreG1tUVV1UkY0Smxl?=
 =?utf-8?B?alZTL3NmVFhiazRuRUdDeWxiYTRYQzhYOU1NemI0ZzNMMUptR3hnZjU1NHlz?=
 =?utf-8?B?SGNkd1lEeVBheEJrVlZZc2ZQMkQyd2ltbk4rZGR5emVoRllXY0lLdjErcWJK?=
 =?utf-8?B?bkhHc0Y3cU9sVmV1b1dJeEV0dFp1TXlPVFdqRWk2cXcrcTlZQmhkcGovL2xE?=
 =?utf-8?B?MnovaW5yeHVucmsra21aWnNoUEVmdXBhNjhLcTNnTElGZHRGQjlWaGFRMHUw?=
 =?utf-8?B?dGR1V3ZHRmxiY09ISTlIdC9lK0c2ZjFWeDdtSUU4cmltUnpXZFhZaXJ3Yk1D?=
 =?utf-8?B?dXBWTm9QM09zTnU4YlE1THFjM1VHOHhtOXFncFRsRi9VbDZlS0s2QnhlL3FE?=
 =?utf-8?B?bkd5R1ZXY3JJZTROQU9BQzBtaFF6bjBHRkN5eUF0SXNIalpiVkFERTJid1l1?=
 =?utf-8?B?MGovQmFsaHkyekJaUmZPeDRCL3FrZFF3NGQ1NFRTTW9qRlcybHhJRDlIUSsz?=
 =?utf-8?B?YStWZzk0MVJwVkVLRGZnc1dyWXdqd2FFbDNhQkd0S3BIaDRpemcxWEtTSUpT?=
 =?utf-8?B?ejhBb3ltT0dZOXYydHFnVVV1QlBUVXNzOEZsV3hHVkJ4Um9wS1BDYWhMR3Fs?=
 =?utf-8?B?QmJiN3lQVVhGWWlpV3VhY3Zoa2tTZjhKMUxwSEpMeFhjaVE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHBlS0FTRVJxQld6VENraGxPcHdTL2FXN29PTmxEZnhNZlRXTTlBMnNIbnhp?=
 =?utf-8?B?dk1mWkp4TkY1MWVTb1BoVWdzOXI4cytSTkNOQzkyYTlzbm8xeXFTQXFNM24r?=
 =?utf-8?B?SVo0Z21mTkh6Y3ZBcWE3SFluV1FLK0tkcGk0TWl5MTJmSjBiUE8yUUpDaERP?=
 =?utf-8?B?Q2xINWN4eEhIWVdEak9tenJQVEg4U0tXMmZjSjZhUXZOOE1WMVltT0M4Zlly?=
 =?utf-8?B?Ynpzb0R1Wjk2WFRLQnlJa3VrNmVjdEtKNko5ekxwWm9qWWRFUzRORVEraFBE?=
 =?utf-8?B?bmpYY3lZbVI2RXZPMFNzYTQ5aGhyK3NKaTg4Y1loa2RmcG5GUHdHelhwU3lB?=
 =?utf-8?B?NzJIaEJhdU5vNUE5M1lxYzlob0swaDBBalhFSStYdlcyRmVLYnhvaXJRdGdT?=
 =?utf-8?B?a29OTHJESXJsb0lGenc5OEhDY1hSZ0JxLy94bGlTOHFGNEZHVU5QRlNQMW5S?=
 =?utf-8?B?V2hBK01TK1Z6NDJCMFhkUFJ0RmdpZG01Rk1EbHU2MnpEWHloUDZDYVRFRWFF?=
 =?utf-8?B?QVlMTGlYejFzUkxEUitDcmF1RDFDR2VibUdHREwrcmFPdlJJaC96blljTWJY?=
 =?utf-8?B?YTliQUsvSDIzd1ZPQzdrUmdtNzZMNWRmdE9ESWN3WDMxWXQ2a3NFVDZOS3F0?=
 =?utf-8?B?dDhqMEt6SmF1TmxxWmtsR3NTNEJ5UjRseUVxWGcyYTBndlJueTV4Vy9JNUsr?=
 =?utf-8?B?SlJOSjlEM2xPWHhZY1RHbitFRFFscmtxaitUUDkxUGtLRTBYOEVpTVU3TE5K?=
 =?utf-8?B?Z1d6dVZReWV5Wll6T3FxWkljTjBUdmNzaHEweW1DNHgxT0NIdk9PTmZJaWpt?=
 =?utf-8?B?czNOZVVJbFZkeWJqWEdzMkMzT2ZxejVnWnRuOTFmUjE0RnM3ZkgxUlY0UXFR?=
 =?utf-8?B?aHdvdW5iVXpxaXhuUHZsaVdUb05aVnB2UmpLVnovNTBPYUsvbjA5RzhsU2NV?=
 =?utf-8?B?NU9JL3ZpVUZWUkxiRFdxSHMyVXFZMy9NOG8vd0VaWngxcjVvSGxFQkU4eDZ1?=
 =?utf-8?B?ckY1N2VycFRSV3o2Y2lqVzY2UU52Vkl0MWc2TmhhN2s5VjVOMEFxczZVWGZU?=
 =?utf-8?B?OEk1VUh5SkMxOU1TQjNzVWptd3VQdW5wWE5oNW9URVNSTXBJNVhFMEJZbytx?=
 =?utf-8?B?b2FSU2JVZk5USDgwM3RLblFiODNCWHN6MW5MTEZmU3NSVHIrcEV5b3hTWnYz?=
 =?utf-8?B?dzhQZnNSdHo3TFFENXF6S3hQbkZwMzZTVDBFTVFVMnJ1V3dYdyt6Z0xQZFVr?=
 =?utf-8?B?bm1mRTdrKzFyelFHejZyUWxUNzZrbUhjaWVvRDhkaUZEejkxRWhjTEl0ZnJw?=
 =?utf-8?B?MmZyV0R0UkZjdGlUaXczVlkyKy9pcGFJY29hVkRLMHcwTUNPWnZpMFdjNllJ?=
 =?utf-8?B?dkR3WXVJUGgwQ3FIall4c1lxVnNXYXNrOStnWklWMVVwYmlQRFlWbGNwVitn?=
 =?utf-8?B?aXNrN3hHWi9WeDdjajh2ZjExczRPVzdISmQ4SEJ6RGpQUVFYT3pxMkQydFFP?=
 =?utf-8?B?T2YyWXF4cC9HY0dqc2YvZmc5bXppWUZUSFZFNWZNa0NhQTdSUjJKUTJFcG0v?=
 =?utf-8?B?U01IZGM1SGNrS1FNNU9XRFB2azYzN0l3M0s2alpPMHR0ekYxYXkzRWV1UmN5?=
 =?utf-8?B?Z1FwN3B4RWdKUHVWTXBpTXJFWWVKTXVtRDZGNjIyTVAxNmtjSUhpMktQT3Nk?=
 =?utf-8?B?QTYzdjNKbjJFUlRDMzljU1ZjS1BlbFNIMmphM0VDVU1Vb2Q1c1ZpbHJZRE5n?=
 =?utf-8?B?S0ozUVlySUk4a1NRM3dxNG5uMVRJWUxEWDIwWVFqN1NabitBSFVmMnNsZmg3?=
 =?utf-8?B?Um44Vi83S1g2OGtoQ1c2NUVrZXg2dHpFSlFIYTNHczlNZjRSdUdyR3UzdGNo?=
 =?utf-8?B?K04xZnFmMmhCNXpLeXVZKzUxTzQ2OFlLUGZtQy9ocXhOZU1jRm1EcGxBQmNy?=
 =?utf-8?B?NStCd3poNE5EQm51VWZZS3IrQkJoamExZVMvNnpVTkNqSy9XbHlTM051d3Zo?=
 =?utf-8?B?YXkzbUV3SlduMU4rOW54VXRPYUtTSW43NzlvT1BuNlcvUFlHd2tsWisxWEVl?=
 =?utf-8?B?WFNyUytPVWxRL2ltN1VpS25TYm9nZjBvenhTOTFiZnQ4aXhVaVI3VjZRb0V0?=
 =?utf-8?Q?FzZzUTPCuOeiqvPY/08km6oLW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de398837-d19f-4d89-b55f-08dca7ce6701
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 08:40:11.3926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0p2FcKPldASIKuu9L6Z3AzTCIxkaN5LIbNUCuQrd656Bnrnc3E/sJivVbXXdTdx9h3AjuFvV1mzsPyDOo1+QJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6812

From: Peng Fan <peng.fan@nxp.com>

The i.MX7ULP Cortex-A7 is under control of Cortex-M4. The i.MX7ULP Linux
poweroff and restart rely on rpmsg driver to send a message to Cortex-M4
firmware. Then Cortex-A7 could poweroff or restart by Cortex-M4 to
configure the i.MX7ULP power controller properly.

However the reboot and restart kernel common code use atomic notifier,
so with blocking tx mailbox will trigger kernel dump, because of
blocking mailbox will use wait_for_completion_timeout. In such case,
linux no need to wait for completion.

Current patch is to use non-blocking tx mailbox channel when system
is going to poweroff or restart.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 01cf1dfb2e87..e1abf110abc9 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -18,6 +18,7 @@
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
 #include <linux/workqueue.h>
@@ -114,6 +115,7 @@ struct imx_rproc {
 	u32				entry;		/* cpu start address */
 	u32				core_index;
 	struct dev_pm_domain_list	*pd_list;
+	struct sys_off_data		data;
 };
 
 static const struct imx_rproc_att imx_rproc_att_imx93[] = {
@@ -1050,6 +1052,22 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
 	return 0;
 }
 
+static int imx_rproc_sys_off_handler(struct sys_off_data *data)
+{
+	struct rproc *rproc = data->cb_data;
+	int ret;
+
+	imx_rproc_free_mbox(rproc);
+
+	ret = imx_rproc_xtr_mbox_init(rproc, false);
+	if (ret) {
+		dev_err(&rproc->dev, "Failed to request non-blocking mbox\n");
+		return NOTIFY_BAD;
+	}
+
+	return NOTIFY_DONE;
+}
+
 static int imx_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1104,6 +1122,24 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	if (rproc->state != RPROC_DETACHED)
 		rproc->auto_boot = of_property_read_bool(np, "fsl,auto-boot");
 
+	if (of_device_is_compatible(dev->of_node, "fsl,imx7ulp-cm4")) {
+		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF_PREPARE,
+						    SYS_OFF_PRIO_DEFAULT,
+						    imx_rproc_sys_off_handler, rproc);
+		if (ret) {
+			dev_err(dev, "register power off handler failure\n");
+			goto err_put_clk;
+		}
+
+		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_RESTART_PREPARE,
+						    SYS_OFF_PRIO_DEFAULT,
+						    imx_rproc_sys_off_handler, rproc);
+		if (ret) {
+			dev_err(dev, "register restart handler failure\n");
+			goto err_put_clk;
+		}
+	}
+
 	ret = rproc_add(rproc);
 	if (ret) {
 		dev_err(dev, "rproc_add failed\n");

-- 
2.37.1

