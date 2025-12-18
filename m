Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013070.outbound.protection.outlook.com [52.101.83.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1CB2FBE0F;
	Thu, 18 Dec 2025 05:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766037089; cv=fail; b=FeYCK+XDG/HXoBqOlz9KeUWuipou63nCTk8aWfTBoscvt1xUpb8zt7tzqNLw4b4ImA+AZAiaKiy+5pNA8KRmjuJCD9V7PhY0cMrCaldSF8rVVja/PIpyR+L0fYbhTEXcXcdY68ijCO4LUmpLTFW3L1BjVLAJUunrPZOIM79IJpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766037089; c=relaxed/simple;
	bh=bzeAW9xEyo2YRpcMGIhz+5P7BqxKZSwNBQQ5O1M8IyA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BOkpsgX+k+OlYsOVitVOpoJAWEMxnNkLe5ckmTRfsB5BbRMtzjRYlot4dpwC027YMPzymNNNmScY0A4itvZjxGJfnNy3tvvhi4coyG7eIQ7aiBN6ZIbzdT5kGb0TN0fdcjKbL+L96RgpsTQVAiGAzlKJXaRx3gYArAgzahiWRSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=t8g+Tuo+; arc=fail smtp.client-ip=52.101.83.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="t8g+Tuo+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S3pp3510NAjTtqG6RFOywR3Yytv6aeDU0aZo9SokC5V6AEopFWPIA2WIOAMsccipOEjMgrdmD38+PNgGxYPx0A/nibt7DCQbwLYNOR5E4Ezyh63kJQImgRM5EiCjKmSae//uCnkUyQAYKg+0vHo3g4wAFpu1bpXDYx5nFkVtCkKSZvUP3lFJ/0nOzakDKvEXSwgVTlSTC5AVoZ7WmruqwMQINknk5Wv7dn9KgJ4KCnNBvM6ZU1/0R6qBw0vhQcL1qBbeuEesfeQhuKkq0yr/ZAuj0EASwfqxllL4Rv02utWt2LHuOW3+jeg2uA8GVkJNbIcUHNoQSEPBe7ugHGG1oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0LyeR8Qd1ryAPrxWiBCi9lAA7UeImFYOD1pLfDWiQE=;
 b=g/3CD6rR9hvRQbqU4PYP7EH6+jDeHu/rhT87Qj7aiFLa33zvuGF99ipQ2mK8TlSOEqfdXtzuLnSwCTsYOHaR1jy88T61csK9ix2NL8RH3a6iw0ixfQKiioB63t2+EoCsHfQPqT3UNqI5ERhauRZv/h1qbZBR161D/Y4+8P03a4xiwbpPifc+nITMHa71ZGCpNmtcDjKJHeRqfmx+VknCXxAN1/aAUJHAsseuKX2E7SM5nFh8hNWS8YVskAt/GIxOYro3+aqLf2MXPaAXqIvfPDsImA7Po3JkVEwwaaIHyTaGoWeeFVQMAcWhTjFfiWTzs4qjhfOamER/+FHxSHhNbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0LyeR8Qd1ryAPrxWiBCi9lAA7UeImFYOD1pLfDWiQE=;
 b=t8g+Tuo+ccjSV9+bkhzSiLaAuETaiabGgh2Z6J/jA247vrR8pMBkeZ+1mctFrBonvxGGG0M6LBANDQbOBq7CZPhkUrNhBaRmHxn5o9Km2EIxAWThzngCguHtZONylUV4Mm/50T4CqJMsSndPw1W7bjLTlxEJVZOvO9vjycDRsfQ8C36IDhrYvEIbnz/Pum1hR1f3tfmJ7AKbg7IKhQF4yCA+Syjty3RA3JoXjEskPwek3c127SKgTyLA2qeVPmrXTuIZpSo0RuuIdb/FkJuZ38ZCQvLIXJAaZBPNbjFKPFrqbkx+KmVbODCb1vss8yjXdIV7Vdxfa1dTUAajIVARSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by PAWPR04MB9839.eurprd04.prod.outlook.com (2603:10a6:102:38b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 05:18:25 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 05:18:25 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 18 Dec 2025 13:17:38 +0800
Subject: [PATCH v5 4/5] remoteproc: imx_rproc: Add support for System
 Manager API
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-imx95-rproc-2025-12-18-v5-4-b56a27d4158f@nxp.com>
References: <20251218-imx95-rproc-2025-12-18-v5-0-b56a27d4158f@nxp.com>
In-Reply-To: <20251218-imx95-rproc-2025-12-18-v5-0-b56a27d4158f@nxp.com>
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
X-ClientProxiedBy: SGBP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::36)
 To DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|PAWPR04MB9839:EE_
X-MS-Office365-Filtering-Correlation-Id: 32dc875b-8674-447b-4ca1-08de3df4dea4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|19092799006|376014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YzhITTRMSzljSi8xMjB3Z3JMb3UrYkN1ZEc3RWo1dm4zMVlwc0Z4SzVsejJy?=
 =?utf-8?B?SEMzc0RVN3o2dlo2SjVUcXU5c1daMUtvY1QwcXpiYlNJN2svbGI0WGNrLzYx?=
 =?utf-8?B?QUhINWZvNk92WlhYaEM0VnVqQ0tjR0VTdlpXelJXNEJCMXZJaFdURU5rTjdm?=
 =?utf-8?B?aEhVeFpINTBhSGpERGs0dTQ5VnpPWmdBNndHYlRVMDhHMjJMdHRJRU9jZDR5?=
 =?utf-8?B?NmZsTWpudDE2YzNvUlk5Z2IrR2JjVmJpcGV0NFB2d1orekZocTRnY25YenJW?=
 =?utf-8?B?TUpMekF0T3h4QkZYT3hSamlTMFlDNG9wVlA5blpVQ0UzQlBaYnF1SmlsbXdo?=
 =?utf-8?B?K3FIN1NCWmpEM1MxTEJWblBwM2lzZmpLbi92R0o3cVAxZDA1MWJSS3BvNURL?=
 =?utf-8?B?blJmREFpWkdCMll6MkxWVzR1SU9aMjl3aGdDSHpQamtnYjZRSVpCVzRNcVk0?=
 =?utf-8?B?OGlZRVBLOVljRGhtcEgrc1ZSTy9FM2didm1SZEZIa2pxQkx5Q3VCM21DcTF5?=
 =?utf-8?B?a1pjL1NLY09pcTZRWHE4RjIzTHpiWUZnaXBESFhyYnVVYVpuQUtGTGZiM1NV?=
 =?utf-8?B?dmpYNE4xSUM0L1d6T0h3Uy9NbFovQjZxNUFkYjMvWTMyK01jVFptZFV4bWVE?=
 =?utf-8?B?a09YUVd3dUdvRlVmcEdpeXVtdkREdkZ5ODh2THJDOWQ1SFpsOExRUnlDamRm?=
 =?utf-8?B?dStaS0VGT2NoQmdSODhSU2daM1hwYlhnU0pocUxwR1FQbXZteUN1WE5VdEp6?=
 =?utf-8?B?aXZ2S0ZkTnU1T2FYMGNFNFEvNlQ0ZWhSd0d0NzM2cnRSNEdzYzJmMDZjSE85?=
 =?utf-8?B?Y2pYem91dHhrVXE5NHBVMDB5QllxVHhMMENRZ2RZNmEwRUJIL1RqekNkYmlv?=
 =?utf-8?B?bCthVXlaSmZqdy9VUTk5emxwMHZDaE04WDdjNHlCWng3ZFpzUDdmQUhKd2k5?=
 =?utf-8?B?YTBTbnlta0JhbzlNR0cyUEgwWUNZL2ZnWWJmR2srN2lUR2J4NDdMUWRUZ0g1?=
 =?utf-8?B?RW1zcW1EalczWnNaNkhaRXB0d045RmJ3SnRhdlNrV3UwOHh4WDNtWWU3Sm9F?=
 =?utf-8?B?QUgwQXdPc3dLcHR4L25BMWFnVGVrYk5tazgyL0tEbHpPZEEvZ0h4NzA4SWVz?=
 =?utf-8?B?RXg2YUZvWGVydGQ3L3RzbmV1ZUkxVWxPd0oxS0JmbmpGeWoyNHBCU0oyVTNz?=
 =?utf-8?B?c092ZmdhZjBWaDUrVnczWDBxMlBZbml2bXhTZ0pJQkxjTy9KYy9OYzJaVy9k?=
 =?utf-8?B?elM3QmJva3ZvM1NWZnhjOG5QZC82Vm1QS2c1Y2tOLy9yM2RUY3hjVGMwcnFF?=
 =?utf-8?B?Q2xwbkFhazkwb1R0YWpPenpsR0tkNHVjV01vR0NSSHFETkJlV2czd3VpUUtH?=
 =?utf-8?B?MVpLWnN3TWRHVkowRmxLd0lLakNSaGFKNGphZE00QzJaNThRbEFxekppSVRW?=
 =?utf-8?B?SzNLUnU2cmQwT3dVeE14NW0vazVNS2dyNVZCZkFHT3k0Q0hueFJWMkh4MHB3?=
 =?utf-8?B?WVhFMmdvRkdxSloydTVRcmNSTTNXZXpSVk4yOVJ2YkVFVjM3MjJaNHNzYSs0?=
 =?utf-8?B?cUppdGdNTnlwNENYSHU4ZkFLdk9NeXV1VFpNMHJqUGtoMlZUZkM3VW9XbVc1?=
 =?utf-8?B?WmFjeXFhcHBhNG54dCs4S2d3M0llL2VqZnh1akorZ0lvT3RWQ2F3cXN2ZTJN?=
 =?utf-8?B?cW5Zcnc4b1hZc2dncnVDa0QzeXhEekRucm5PaXZqcWhCak8wMlJXRkNWTVNh?=
 =?utf-8?B?ZUJKU1diK25sUlAyQ0ZKMi81RUprOVZHbm9YdGcvWUtPYTAvTzN1MVIrdTJp?=
 =?utf-8?B?anRaSFB0d0x2TEpkL0t4VEFTNWZJVnBtMnRqMVVvdjZoUkVZTnFGblpZNDdq?=
 =?utf-8?B?MmRud0VJVlhvYXh3NS81N245TzJFZGJRSGdXN0pRUTl5UUN4TXdqN2IwWUlV?=
 =?utf-8?B?bVoyK2E2MGFZTnFBWWxxaXRpOEYyekhMQ3oyd1JEeEhCRGtMZVdGQ1psSTNr?=
 =?utf-8?B?bjYyWkJqd2VjNEwwRWROUldiQTNmdUtnbjBzNW5vbVJ3TXZlMG5GVFNvejRY?=
 =?utf-8?B?K09CYU0zbTIrL0FoMlZCYmF0cWlkbW5tWStVQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(19092799006)(376014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzNpVFN5K01IN3ptKzNVY3ZhNVQyYlc4MklUUURHZnV0T1ZjRy9TdnNqc255?=
 =?utf-8?B?OCtNcTlWSDE1QW4zOWxsNVJVVnllMFFXVWg4SnI0VVBNajdWME1EeU9PaVdF?=
 =?utf-8?B?Y1hydWxCb1FpeEVaWk90cFdQMFk1YTd0QmJPUVl5RHR3ZmlXRWNqaFN5Q2xC?=
 =?utf-8?B?S3EwZkN4VTEydHUwUXZjSytLbHR4bzJEQzZwY1BYRCtHMm8wNHpYQ2l4U0Ux?=
 =?utf-8?B?YTFXMUhINjdkL3czOFl6R1d5bjF0YVJEQUxscGNibFpVemZBZXNxRFBEaTFa?=
 =?utf-8?B?Ukcrb0pzRHhXazI4UlczVGh4VWJydWFZWFpkWG5ISWVDbCtFcnU5MFV1YVgv?=
 =?utf-8?B?b0JzU3I3anB0bWs3Y1BYVEwxUEUvUFovVjNscDNKc1hESHdUV2QyL3dsTVBa?=
 =?utf-8?B?eE55K250VStZcGFCUTc3M3RhZHF4aWNMc2xaT0ViQ3FLajNzSmtHZkZJOWEx?=
 =?utf-8?B?N3BvTkJUTHYvVEx1VGxFRm9jVjVTUk5xanp1MEN5cE5SYWhOQksraXoxSjFT?=
 =?utf-8?B?RHo0MmZmZlRqMGVhUGt0bFczVm9XMkFEM1l3cEc2K3ZhbFBPVVpaTEZ2OEZv?=
 =?utf-8?B?WW4weDYzUlR3QWZwWHlGekxucjRLMXVTbmJ2ampIclgrMXcrYnlvU1ZvL0hS?=
 =?utf-8?B?UURsMDNhbytBM2pOSzhmY09iSUdZekZlVWtmTStpc01HVTM3Z040OVRhOWJv?=
 =?utf-8?B?WU1OMEc2SHVnN1VlM2N3WVJRNTBOdGV6Z0gyN1NpeURUcHVtZkhTN3BUY1hl?=
 =?utf-8?B?MlNPSVpCK0VsZnlkU0lITnNSSWgwczFUeXJYbEl2UlZyNHlBTUk5YkRqVHli?=
 =?utf-8?B?KzNON2QvcnBTZ05kSGs1QXFHcXVxdnYzWkNtOHk2UkhuMmZOb0VwaDhJZlVi?=
 =?utf-8?B?MGJaT3hQMHZoMzNMWjk0M0kzVUQ0djBKc2Rnb040dWR5U1d3OGo5REN2dzBT?=
 =?utf-8?B?ZEF1anNnMzJkbnlZVVVxa2NtQ3BsMFNzQTFTLzIwTGRSTmd4U1lIbFRDMk1Y?=
 =?utf-8?B?TmVmNFliSlVxbjMwVHZzVGM3dXVJY2lVM3hITklaaFVIZFFIVjE0U1c4Yktn?=
 =?utf-8?B?Q25DSzdhdmR6N0FuMGdHdnpkaGhwT3ZVNUZKaHg5UEt4WllNUnRtRUJTcVQ5?=
 =?utf-8?B?V2Q1ZlRicjkvYTFCWm5Najk0RHFPK091YWN6NWZleUxDQ3FJRjRlcDBZZVZV?=
 =?utf-8?B?MmFJSDdQZGd0aUFDY21hSUpTTDFReVZZSlZNenlxcDJYcUQ1Yk0vK3hrV2Rw?=
 =?utf-8?B?Mlh0SENaQVgwOC9QZjNGeWxyUURRWWFmNSt5Tk1nSFI1THNCbjREU3h3czNX?=
 =?utf-8?B?SlZyQWIzaWV2dUVYNWtTem5Db3c0NHk3YVFQbkpnTDExWS94QlRXY1IrMFhN?=
 =?utf-8?B?NTY3VFAzbGZqK0hUckduc3VyREdBbWpwSGtYdXE3WU9oaVFhdFBIZkZ2ZFA2?=
 =?utf-8?B?a1M5UnMvMGdiLzVWWkFZRmcyRUxXUzVINnZ0N1h5QXhRcG9PRDRkQmZoLzJ6?=
 =?utf-8?B?b3MwV1d1Zk40ZTUySlRKajMzQmI0dkp4eHRLR0RuVFltckdHOUJMTDNKaHZo?=
 =?utf-8?B?Q211SUNLeWZGK29QQU5TNFNrNmdXaTdlMEFTd2NFSytoOCtxRXRWQTA5Q0Ri?=
 =?utf-8?B?UDFHTGpycVhNbWxUY0t1N09jejlNdTI2SitrWFJVSjR2VThJYkxaSzJPZzAz?=
 =?utf-8?B?cXMvblZ6SmsxQ3RDMGVyTFd4MFo2MEhmdEVkSnNEZ08rbFF3TkNkZHhmd2N0?=
 =?utf-8?B?eUUwczkrMllVQThwSTBneW5IMU5IM0NQNERFanNpU1lUUXNDZzdXVUp4YWdh?=
 =?utf-8?B?amduYVcydk5CYVVieDR0S1RtdFltYk5GSUFsNDIxdnpUNlRtR21WNTNkcW5Z?=
 =?utf-8?B?ZXNEMjZvcDI5bnFrejRNZVlEZHdvSTlOaXZDQUs2ZXUrVURzMU5rWklWN3dC?=
 =?utf-8?B?YXN6R21Va2trb3FtWXRYV0p2MUJud3plaEJ3bXZHWWNxQkhyYWpSbHZ0SmhY?=
 =?utf-8?B?NTQrTmJ4NnhpR1BvSEZzKzExSTJPbFBMRytHa2VhVzRWT3pmNmNrdFJFUGZG?=
 =?utf-8?B?ejJxRktlcG9TMXc2Ritlb0JEM3Z1bFFwOEZLcTR5b2NSbHZHcXEyY1ZWVzg4?=
 =?utf-8?Q?vP1lFV+TkNIUvR+ww7B5dfYxE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32dc875b-8674-447b-4ca1-08de3df4dea4
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 05:18:25.1550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HpkZFSHDtcZ5AeK1CQ9duCTI9fwY43Dm7Kb+O3LZaMsf1HVfyd5bocvpdye60XyXQ9/inab+gd2PJm/vDTapVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9839

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

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/Kconfig     |   2 +
 drivers/remoteproc/imx_rproc.c | 198 +++++++++++++++++++++++++++++++++++++++++
 drivers/remoteproc/imx_rproc.h |   3 +
 3 files changed, 203 insertions(+)

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
index b0857a1a9660503ee7cd5473c06dacb5262286b8..ae3183ad996462ad0815889a2291d320ce7a1e8f 100644
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
@@ -92,9 +94,16 @@ struct imx_rproc_mem {
 #define ATT_CORE_MASK   0xffff
 #define ATT_CORE(I)     BIT((I))
 
+/* Linux has permission to handle the Logical Machine of remote cores */
+#define IMX_RPROC_FLAGS_SM_LMM_AVAIL	BIT(0)
+
 static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
 static void imx_rproc_free_mbox(void *data);
 
+/* Forward declarations for platform operations */
+static const struct imx_rproc_plat_ops imx_rproc_ops_sm_lmm;
+static const struct imx_rproc_plat_ops imx_rproc_ops_sm_cpu;
+
 struct imx_rproc {
 	struct device			*dev;
 	struct regmap			*regmap;
@@ -117,6 +126,11 @@ struct imx_rproc {
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
@@ -313,6 +327,44 @@ static int imx_rproc_scu_api_start(struct rproc *rproc)
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
@@ -369,6 +421,25 @@ static int imx_rproc_scu_api_stop(struct rproc *rproc)
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
@@ -485,6 +556,33 @@ static int imx_rproc_mem_release(struct rproc *rproc,
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
@@ -980,6 +1078,93 @@ static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
 	return 0;
 }
 
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
+
+	/* rproc was started before boot Linux and under control of Linux, directly return */
+	if (started) {
+		priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
+		return 0;
+	}
+
+	/* else shutdown the LM to save power */
+	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
+	if (ret) {
+		dev_err(dev, "shutdown lmm(%d) failed: %d\n", dcfg->lmid, ret);
+		return ret;
+	}
+
+	priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
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
@@ -1155,6 +1340,19 @@ static const struct imx_rproc_plat_ops imx_rproc_ops_scu_api = {
 	.detect_mode	= imx_rproc_scu_api_detect_mode,
 };
 
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
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
 	.src_reg	= IMX7D_SRC_SCR,
 	.src_mask	= IMX7D_M4_RST_MASK,
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

