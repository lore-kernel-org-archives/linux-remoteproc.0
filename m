Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013020.outbound.protection.outlook.com [40.107.162.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E4C188000;
	Wed,  4 Jun 2025 02:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749004578; cv=fail; b=mBuibuR/d9zDEQ7bn3CV75PpsBspNz04PYaAb1cpnb04HnLENLOOtN0ykwAiBNTMIhOFxfoAcIB/mYiKc0UERpimisEl8ZNjg2LcBBs2uhA2JYvQKjRjMHUdFM69xnQLmNuvIQG8KCYJ31bTw/3srNRDE8NxdsjLO/JvBmJek/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749004578; c=relaxed/simple;
	bh=KwIc+o15agHNhH8KLl1OL8j32TuidThpxfKokxY7N2I=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=RO9aa9DF0TMW8+uUD3PWdmP2d8ZkQHhwA5E32xi8lDWsNjt6ak36vANN8OdAGgqs74HKYH558Z+MD0UPvbc9e9lhZlb7vYwHl74vxA78Ea7GIGRvYs2QLVlb9epYRMyKGD+3pUxFU1ZH7G1xT++wz2Nkn0wp2QTeHsQfzLVGYvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iUV3F81J; arc=fail smtp.client-ip=40.107.162.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iUV3F81J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qr1iCRypncAlxD6bgivS+9YqVBh6zg8xrUXQ7GJY1w+4X7gOAf2suK8puaLCtbfHTLGvHoaUNB1bTL70I5nE2PxWkVJp/amyTTvvhAgOLYBapozD2PlSNL3REWoFmGNw70jP78Q3qrrxOofcpITCdLMCp6J+SXu1j83ThdzL7bFBnn3Fao+qtfjUt8vvWfM57uqtvINzkji+IIoTw5+A73ru4LXo/80sMVsgELwXPl63NkWTaEBvc6enmIvKlhN7GvpkN4flV8xS/mdl6vXkXb02hTzldaO43oeQwsOQT88oFqcfoEg/SC/kNO7+qwWe+wj/1PK+CaSJLq9Q1CiV0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrV0l/Iqc7z2hrnjop3urGden4CmlDPAUdI26qfq42Y=;
 b=ew/FdjK6Xtskh7bmeQ9agTp8ipD37g76ubxAWNoJDJGwJyR5GHNZOs4hR2tHgbEc46NJrbvIKWHBAgu2fR1sYYcLL+eJGKhfB7SwKWUfTQPy8aFz00YSKip22M3m9kPfcMssC0PR/LR8JSTEZW2WYDF8nxXBLltoMR6D8+enSGrbzyHef7elhCU7Zu+0tkFMNp/LQP9bDqLdaV8xzd0dBwUfmA7R9mTnTt01yaxlFzXCk1UaQuIQHjcmLPtVUcEjE1K8UzJeTowJW5d+WOSWGWGacr/DWbKROujxuKE1uo0xjGRF3j0pylRAYLa6ijlzqow38yhW5F9wKlpJ4Uh/Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IrV0l/Iqc7z2hrnjop3urGden4CmlDPAUdI26qfq42Y=;
 b=iUV3F81JRgqwa75SkcLUUTftHoJGKAtzg/oKSa0wO9LpiT0iqIBzz0KrN1gBAOv1Xg2c59CCJzoY54gVnBtTwwQSpNEMrHGLFo8anoWgWWNF5CxH1B3xQo7M+JKK8MQPpLq3rcBB7LXbCRq4AelxHK1OigC3Ep0xhzoOqtt64iie4gs+hSPh+78GFAOmlzZ6UxePg5Y1i8zLCnw3F9bjXXxXDMeSfOEAVfAz7h6QWLNSR8yS8Kb0Qxg6a1HZssfDmvunEzBP8NS9mOXSw+RablaHO5YX3Lempc816Bckh4oNI65C3PSf51ampaUBJYiPFcrjz+o612R1pJda/u0Hqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB9440.eurprd04.prod.outlook.com (2603:10a6:102:2ac::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 4 Jun
 2025 02:36:13 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 02:36:13 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 04 Jun 2025 10:33:45 +0800
Subject: [PATCH 3/3] remoteproc: imx_rproc: Add support for i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-imx95-rproc-1-v1-3-a6e5f512731c@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749004455; l=1312;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=tbsPQSwSoF9VtPnXwfuM7ODeuruZvO9JjkPQna5HH9E=;
 b=8LQJyUNEWq5hhm3jcudinAaPlUZIfkyyNgcGnIpk1Rcnhl4r6Lsm3H8d4cKN9ulsrAl/pwMIP
 H/dazY+k6kzAiSF+Bxz172KPqm6XWf4ogYllHGXsC4DDVahJ5o21IoH
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
X-MS-Office365-Filtering-Correlation-Id: 31488535-86dc-4efa-d4bd-08dda31092ce
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MkdNUGxOdElYcXJtcDJCWVIvYmMzZ0hRekJUekp1NmNDNjJNZ0E3a0Rmcjd1?=
 =?utf-8?B?WkhRVWRKeThVWitNMGV4OWpEZXF3RUUrZjRaczJmKzIyYVZDUmk0OVV0QktB?=
 =?utf-8?B?NEtlaGc2SHpsbGZFMFdES2JlUHBFTE4ydnhoSkNTVmIrR0FKSSttSEVNNU1U?=
 =?utf-8?B?K1ZQcmlPbGZTZm1oQm1hTWszL0F6SkdXWjFrQXJaWFk5Q2xMT3FhdnJtUG8r?=
 =?utf-8?B?NDhUSHRTMTRrMlRIMW5lQnZrVVVDWVBQeEE3V2k2eTBqMXNTRGJXTUFweHM5?=
 =?utf-8?B?MG0yV2h6Z1B3RkpaSS9na1B0bFJhMzQyQi9EaThtVVAzWE0ydXRVS3F5Y2xI?=
 =?utf-8?B?ZEptQUdnZVhTakp6Mys1UHFXSjlQSVdYU1F4WmJvM21vZDlTc0dNUzhRYytx?=
 =?utf-8?B?M04wWExsK253dWRUcnNmNGpTREd5VGtsNXVNMjdZZkozVldGTUhQejNJaUFI?=
 =?utf-8?B?WW9TQlI2TVR6MjltOS9idlB1NlNyTGFRNVhhZEF4YzBEMytlK2picXc0MjJj?=
 =?utf-8?B?OTFTelVyUXFZR0VyUXpqNFNIaHFVTDFkNHV2VG1LSkZtVGVlRG8rdEwwNDIr?=
 =?utf-8?B?VWI2Sm5TQXFram55N2xLelBJUU1rRGVRa3RhdUZJdDIyUVVrUHl1WjdnRXcw?=
 =?utf-8?B?NDRQeklhMXJHODAxaDczbDlLeG9OWHZvQWFGVG41SElOWUJtMjZwdVBGS1Nm?=
 =?utf-8?B?TGZab09UeDRMUVZabCtpRG1xNWVvaWlnMzlHMlZENmdGZ05mcmdIdUtxVG9M?=
 =?utf-8?B?c0t4RHJQQU83ZlN4K0RkSUtXQlJMby9ONWdKQmJ2ZGVJSFBGaG5CcFdVMUsv?=
 =?utf-8?B?MlZEU05EN0Mzd0ZGdUJxZE1GUGxRdm96R0haSVpnb1FEVUhoU1MvdWovRnN1?=
 =?utf-8?B?bVN3Zjk2c1g5WDczZGw3Q3RhZzRVeHpoMzJ2clM3TG5US3lCQ2dvQmJ3YnNv?=
 =?utf-8?B?TmZRVG5HVWxZVWtBMUFjanNaZ2tNY1NYUUpLZG5yNzBmcEZHQlhBWVBQVE94?=
 =?utf-8?B?anNkaXBPQXNtc05UVThLNGRrdWcwUnhSODV3Z1N2V3pKa2lsMnBCZmU4eUkw?=
 =?utf-8?B?TW5KWmlPaFUzRHFJcGMxU043MDlzTUVpMXdhRU43MGdrM2lOaHpKSUxvS2w4?=
 =?utf-8?B?UHM5UWVPU05reEFaMDZramRMRkRkTUdEVWJDSXRDSXhDQWwydzM0VUVWdnVN?=
 =?utf-8?B?b1BRaklKNkNSRXJxYVJkTklhTmRsNWVpNVF1UVVRNUorY2d0c1N6eU5tUTRW?=
 =?utf-8?B?UnZlR1QyMGEyYWVwZXhTbnFMaWRzeUR3eXlWMWlHUFBYWUJxNVRka01laC9n?=
 =?utf-8?B?M0twdXU3ZjlOMCtXTXE0NEdOT0JNaXJsTkYrTkRHUVlyVEQ2L1RGRFM5YUhC?=
 =?utf-8?B?ZkJzcEJLNVZXNDRyY3ZtVHRhTEpUMEloN00vdWcwdFhUMzBjTjh2NDJxSm5r?=
 =?utf-8?B?Ni9vcWd3d0R5WjZxU3JNR0J1WG1xbkY1Q0NSd0o1ZEwyV2h0THJCWFpON2NT?=
 =?utf-8?B?STVSUExzOTZ2QytqOHVTVDBRM2wyQnlBK3l2QjU3aWJ4UTI2dnlLYkE1RFY0?=
 =?utf-8?B?M1FuOVJUemFlSkoxR1F6MGU4dmo1bCtHRm92VmRpZGMxdzZBczlTSE1MaWNK?=
 =?utf-8?B?Ymkra2lrL1VFb1hSVU9ONC93SFliU3M4M2JiODNIelZIeWowT1V5WjdlWG80?=
 =?utf-8?B?c01hK2tlSEtxUDF3UHZLUitucGVObUlxUmRmeUxweFY2R0xyVlZSWHpWTUwx?=
 =?utf-8?B?WlNadkRHaURnYlRyYklLU3RBbmdST21GUFVoeTRXblhwZkQxQmJoNWxJNFds?=
 =?utf-8?B?OUR2QlZPcW1FWjhndjBqUm5DWXlFMkxlMHNLZkx5b0xlMVp2WWJJbmloNDRv?=
 =?utf-8?B?bFRNamJCQU1vUUc5UFhWVXpoQi9xNU5OR1VVbXVhZDBNL2trT2xNRnV5QlhR?=
 =?utf-8?B?Q2NvSmF1RndjSy9HaU1wUmFNTlM5Q2ZLc0hIbFA5NDh0VGpUYmZHVVMyYS9C?=
 =?utf-8?Q?PJf0srqAAD48U0KQkLun2EV19PE9Og=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0hXeGNMeEMvMzFXdHBvYVpjejZMbjlUZXZxUm1YU1RLQWJUMTlMTkg0U2pr?=
 =?utf-8?B?VHdYMVNlZEJMM0dVUG5qdkYwNmpUNzBLL0d6cUNuTHBuVWEvTFlLMEFRNmVY?=
 =?utf-8?B?QmszazhrczdyZXNvQ0RITWxkaC8vdFluYVc3ei9zVDlicGZOV3Ivb0hZaEVJ?=
 =?utf-8?B?YnlqTDZIbnRUV0tFQ2UrVWVGSGwycy8rSnd5WnJLODZVNFJ3QlB1QnMvSzZI?=
 =?utf-8?B?bUkvaVo0K0VLZDZ2UzVsbHNhbzhnVVR4MUgzQjhQd3NDS1RrdGxISndHNnZy?=
 =?utf-8?B?cHJrLzl2MmErYVVVL0tBQml1amlzclV3QUcxeW9OSFRhQ3lETEF2LzBrUFp0?=
 =?utf-8?B?NmFDM1liNzBTcmpybUx0WW9ZSS9nZitPb05lZzc0ZlpFV05IRm83OVlqMFB5?=
 =?utf-8?B?Y1NuNk5iWkxBSmRSZWFmcXdPK3VXK2RhWVBjNW95aGdrb0x1OTFqbzZ6eFRX?=
 =?utf-8?B?STV6dGlQNm0zS3hBNlBtODFXQ1ZTMndLUHRScHkrd2NpUm1yWWFSSGt4OUov?=
 =?utf-8?B?RjZnb1hiVWROaTJVR2owMEVZSHdsQytQRGZWclN1KzhLVVhTdmJ6eU1BeDda?=
 =?utf-8?B?NysxS2RTWmlpU3ZhclhrODUzdHZKQjBjemx1ZVIzVktabGdsUFUvQlJZVjdo?=
 =?utf-8?B?WWRSQ25jdDdlWXZuaWlWTDYzUnBnQndwUTFMbTljd1FhcVJtamVtYXFzVEcz?=
 =?utf-8?B?MkZGcHpBRmF4Q3hsencvN2l4dzlzc1l1UmovdVZDRjMyYllWeEFpRisxMHlQ?=
 =?utf-8?B?eU9DUk5mT201TzE0eFZ3b3J3ZUpqU2RZdlBMMlJ2K21EZjBKYXA1L3VoREJp?=
 =?utf-8?B?WlVpZTJHNy9PSzRDWDhVRjF0ZFMrczlTa1NpcHlPRTNvcDkwV1JxVWF4eGI0?=
 =?utf-8?B?ZlFOOHU5cnliYnVBc29KZFFHaFpYWVdFbWNyNm10TkdvZlRYN0E2NFl0cnk2?=
 =?utf-8?B?S0YzYnlHMGhhTVRKWXdKR0JQamRqT3prK1RXSm1SWnpab2tTTGVvTmdjbDQr?=
 =?utf-8?B?czJaU1MzRzVsKzZod0VwUkVrMklZZG5HcUVYRmhYeWgyVzZFYTFvQThBUWs3?=
 =?utf-8?B?N2tFM0p4RE0yaEhHc3ZJL2lFbnB1RFFMV0JjSmM1dkxjRllVbmVZQ1RWajhO?=
 =?utf-8?B?MldWamtOMENxdDVJTTYrWEFKZllqTGlpYkJqNUdsSENmWmZIVDJKQlY2eTQv?=
 =?utf-8?B?aFcvOElaYjFiSW15SVBJdVMzMUNPdkc0UndkNnpxd2JnUUcrYU0ycjFlKzFu?=
 =?utf-8?B?R1lSNkl4MzZlVDhTU3VNL1J4ZG5vcmo3Rkp5cWVrTTFaR05Ha3VmVW9hRHdU?=
 =?utf-8?B?UTEzallzakM0ZW5vYzVLWnhwTlRlTmhwMGNaeVJyKzFZWEFTdE5tNy9zWHUx?=
 =?utf-8?B?eGthdkdIS0tsVm8zd0JENWFQVkRXV0MyditUdjhhTE1xaXdqd25PK01FKzd1?=
 =?utf-8?B?aWZCNEQ4SGxIbURMdlVsYXRXZVluNE95Rk4rM2pESXpLYy9QT3lCVnoxdzJ3?=
 =?utf-8?B?eis0M1NsbkJDVE43VEVxQ3NHL1ZyOUdYc096bW9sMnRQRmp4bVFBQUNicDYz?=
 =?utf-8?B?cm53dUhnUklkQXR2bjBXS3RqU0F5R2dhTUtCemFnd00xRyt5MHFmUHd2OXVK?=
 =?utf-8?B?RHc4UjE1US9ZRHZrOVRyZW5LbEhXRVg5MDBENFNnQW9ocWtvU0hNclV4NFpM?=
 =?utf-8?B?V3k3OE95VkpPN2FmWStwL0IzZVREK3hqQnc0Qms2NjJkRG1PUlhYR0lYeTNJ?=
 =?utf-8?B?RFlIU1I2UnBSUWx4dnJ2OW9mUW12V1g3cW1FaVNQVEgxMTBlS0piL3EwQ3F1?=
 =?utf-8?B?VDJVQ1RIc2poOXNtbStISkc5cVhIeWVSUHVGbGZNeWVTMEdtN2xWZ2ErajNH?=
 =?utf-8?B?V2JBZk9ScGtYN0Zsai96clVqcEdMUWxqRHNTcFNEbG5EUTJQZmxzVmxRaEht?=
 =?utf-8?B?bENJdHM5bzZDQks5RGFtNTZiVlltNmtxcFp3cDRvVCtNM0paU2h1eWFtWDcx?=
 =?utf-8?B?Yy9OZzFHUElYdlVHZWh3Si9NNzB5YVVlaDlxR0c3Y0pWS0hEai8vT2JCK09p?=
 =?utf-8?B?ZzZzVjltbFpDMlIrSEFPaThLVThFSmJaaEFSM3NVNDVZbUVQczFEWFU3UDNO?=
 =?utf-8?Q?zqNPBXwkpX0EQBC7Er5R0WAYW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31488535-86dc-4efa-d4bd-08dda31092ce
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 02:36:13.6263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SpTfOO72+NtQbCLF2Kjw0R/lOfSPF3CG40Xpd+Vaf8IcMBx5hKOCI6+ZOazF7vysxdXQDE9izDppVJ1hG9g/Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9440

From: Peng Fan <peng.fan@nxp.com>

Add imx_rproc_cfg_imx95_m7 and address(TCM and DDR) mapping
Add i.MX95 of_device_id entry

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 0649faa98725db99366946c65edf5b7daff78316..53354c634d8a2e03e6064830cca4ead66e2eebdf 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -386,6 +386,12 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
 	.method		= IMX_RPROC_SMC,
 };
 
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx95_m7 = {
+	.att		= imx_rproc_att_imx95_m7,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx95_m7),
+	.method		= IMX_RPROC_SM,
+};
+
 static int imx_rproc_start(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -1327,6 +1333,7 @@ static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx8qm-cm4", .data = &imx_rproc_cfg_imx8qm },
 	{ .compatible = "fsl,imx8ulp-cm33", .data = &imx_rproc_cfg_imx8ulp },
 	{ .compatible = "fsl,imx93-cm33", .data = &imx_rproc_cfg_imx93 },
+	{ .compatible = "fsl,imx95-cm7", .data = &imx_rproc_cfg_imx95_m7 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, imx_rproc_of_match);

-- 
2.37.1

