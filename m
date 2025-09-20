Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010009.outbound.protection.outlook.com [52.101.84.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B181F8AC8;
	Sat, 20 Sep 2025 13:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758374106; cv=fail; b=HZw3mhLubJlaxWL/OvNjbnjNCVib2hilPuDsMubpBvqr3QkTlZ5AWsq0k4mM7RNR/TD6AXe8ptjEVzr8x1nJ2YVwC1hDvVS4CFYOI6AO9wPuOceKTCnkj6dARgHw6sT/E1lmZ6yfw17Hu8k0mieoywBfsQTgRRrVCwctQACQkJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758374106; c=relaxed/simple;
	bh=dD7JRGsXEwS+ALbx5T5vqhUegtiBk7HUy/QsEIUFT1w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=qkoH3EjAxP9UI19TA+L4Bvqc9BvqagiTVcCixnJR1rt/WVeFYOyohL6s/E1X19eunxZ3hz9DDInBapA5vnfjF/n27UK8oe/bZOBiTiLmdf6XrIA8Gz8R4qGGI2nkLFy58CpI4aULuwrHMmav3iU0KgS8I2Aogbn4kfhWwUKp0mY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=J0vAgMVw; arc=fail smtp.client-ip=52.101.84.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="J0vAgMVw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kq2zPFYrdeIFCTVzTV+CCq+x29/TKfmOrkZ5L/aqLHdP60CkcRXgKVLIyIK3i8u2xRQYtIWUo3buXFRbkfJEMBIh64pul6EA5TZOaVOGHqu++iCgoIYqGLNklFwwh63QFsbLG53vAwA+mvTNNI74PWy+wjEjQQWV78ySbaklvGIxo511q8iiLBqc+kHi3Pk/dVNPQDsk4WMqQB7yV1xEMMYmA3VLH5HkGWU5vSK/oBA9x44EF3no+40WuGjDi3J07d4YU8U3AZAYbQntDGxUnQba/PtbAdsdfrvqbN441kCEi9OBqXzvE9zuYi0bBGod4gyfMiu8nvrYFYruWfMLFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IoMiheYa6EhdKnhBn/Ojo+1qWfXeJdHs2y4k/e67+Jo=;
 b=CLIgSK+7sbz7VNV2eC6qe7cKoZu+qw+sVndUPp4E/3yT49pAStRhLK5CKPMREY7QHKzrgC/wVVrqZDznrE3F73R0/4jKRLrfeBHfs1xkK5J7WZHh2kMjxhHmZohoIJnv1QpiXG/PEvmAsIJof8hYfHHpxPMFrQFlx0b9K5tGfGLe2cRNs3ByFEUa3/7gYRnqrqb39kFcof/qfncTf+MUjpheMpL90XmzX0wIWgLzktV3MV6YXGM7GMjWmnkGOFapM3V42NnxaYW1YNnwk7belxl4BwZ1OlFgZMHPAMTfCjErPQDzAnXrJHGo10N2vygMl2nd3yq+ZEkg+FNFKU6ALQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IoMiheYa6EhdKnhBn/Ojo+1qWfXeJdHs2y4k/e67+Jo=;
 b=J0vAgMVwrg4KDE4EqBnaD6z9mleDp7wbazU4Jq5Ucbgu79PNDy4oLJ9qLHEvuO36mA9cVKgHA6nD16aRo2mi/4u3FqdRxV3PQRZPBsI5Y3mOwWKxj2lLKzfANpzx8mghUvFqxKk72V6bpR/jebyZMsaBES+VWF0hjHPl0xa0ak9/9x8arIHRgdSmsBnNRL7VU5/J9R3/6gqg7fuNiYAXmQuWH9n5ZgfJe+rIV/EgigGGJK/c90wnLSuVGi/KDqP2JE+6MtUGMgwRTJ9eYZixhkr/yEhOzrgnru7q9as9tatVAfVfuXFu4m4kzbGul2tCxi7uXuaRHGSiRfRwWQWL1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.18; Sat, 20 Sep
 2025 13:15:01 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9137.017; Sat, 20 Sep 2025
 13:15:01 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Sat, 20 Sep 2025 21:14:35 +0800
Subject: [PATCH v2 2/5] remoteproc: imx_rproc: Make detach operation
 platform-specific
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-imx_rproc_c2-v2-2-3351c4c96df5@nxp.com>
References: <20250920-imx_rproc_c2-v2-0-3351c4c96df5@nxp.com>
In-Reply-To: <20250920-imx_rproc_c2-v2-0-3351c4c96df5@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758374085; l=2976;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=dD7JRGsXEwS+ALbx5T5vqhUegtiBk7HUy/QsEIUFT1w=;
 b=WoPu6t40zXL0WNQR0UnwFraQrrSpFe4euF1t91U5uh8CyxFgdLkmydxc2drk1XS/pYhZ3Tjjx
 TMCYS9utK6EA3kddyfo0NGwore/5Dp4x4ZB9beSpCzFTzXlMbrB9PeM
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SGXP274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::15)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8833:EE_
X-MS-Office365-Filtering-Correlation-Id: 35f05cb4-d2f9-4d5d-c44d-08ddf847b4cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WEp4VC94L21RRjVtTnhaaWVhVEZGVUo2eGprelZIaTlVS20vRTgzdXZISHkw?=
 =?utf-8?B?WmI5WlhFYVFIeTVHcUtDYjRFOUFrZnBQY0h6b0xtRzZHdzZVUlZsTEF4K0NG?=
 =?utf-8?B?UXcwQlJ0RkJpZEZhLzBHYklBajgzNFJTL0NXVVJoZnIzZGdjQUl6VTVRVzBR?=
 =?utf-8?B?VEdtSWZST0NnVGFvTVozUkFDZlIwb0s2TVlpNmZaMHJvYVpZKy9zUmpoUzBW?=
 =?utf-8?B?TWR4dkJCVGE0YW5hcWdTMXNSRlUyekx5Um5VeTNHWnJWM0NaL1pWTlFBcEd2?=
 =?utf-8?B?MnpxRVhhb3JESC82QkorN2wrbk4wUGpSREFYSkFTeFN0L3ZrNm1oWkFiaW5p?=
 =?utf-8?B?RjdqWC9TaDU0ODdXY0JSTzkrWUJIYzlIZkNZSWxweklvc0xWaGlEQWtYWTBI?=
 =?utf-8?B?dVJjQ2VLZFlQWVhnN3Jrc2hYaE4xTHJqaURoRHFmQU1CMFNJSHlra0s2ZXJn?=
 =?utf-8?B?QWNkUktxUzFUN3ZBNVBEZC9ORGtsbFZ2UFZNbmlqQWwyQXRyQVk4WElhSXRD?=
 =?utf-8?B?S25aY2ZqdjhBaHpuMkVybnRVWDNJTXBQOE84L0ZKc0U5eHRMYVh0Z0xJOFFP?=
 =?utf-8?B?VC9NMmFIZXMwWmZwNC8vblhEanZaS0JreVA3dkF5TmViSjZtMzdrNk5EcXg5?=
 =?utf-8?B?aEFERjcwWWltYUs4SmdUVG11ME1IWHA3WEs2VDlhZTVWL3dnT3NXNXBDdlMr?=
 =?utf-8?B?aUszY2c0bVdYQXVWajFRekdiM1hrL3UzUGZxYlNSVG5oa3JNdGNBbFdYVVFV?=
 =?utf-8?B?bnZmaWY5WnpxWU1mMDhuSnRLU1dlcXdVd1dFclRpaDdjc3cvQ3VrMHNTNDNO?=
 =?utf-8?B?SEI3YjBFYU5peGhhcCtHVjllNDAwUFlMOXp5M0hpUXpQdGVXSnVwbzJmMkVa?=
 =?utf-8?B?VUlSaXE0K3NmVkNub0x0L1M3eCttV2sra0lpSUtLVTFRdE9uSXJHZWE0M01H?=
 =?utf-8?B?WXV1ZThhMFk0VGF2ZzZMSlFiM3RMVFlaTkxoaFRXN1dFWXhSZDFtU0RnNVM3?=
 =?utf-8?B?RTBNV1Z2OU1YTXkyZklrQmg1R3oybjh4bThrVkZneEpyL2pPd1RyVU5xM0p4?=
 =?utf-8?B?aERDNG5aNFNLdjcrZ2J4VzNnSXplbFQyR0JBWUFEb3BuVDV2MXlwdGRCT09Z?=
 =?utf-8?B?WWRDalRxS01zUGp6OE1WaGJmajIxeTB5aXlRNEJwS0dmN3VuUlVVdzUyNlBI?=
 =?utf-8?B?ZTcxQ1NsVUx3TFB1YThWS0JsT1RZblJhMEhneUduREhaWVExQnhQb3FNeWNt?=
 =?utf-8?B?ckJsWExjemZQWWIrTG5hYVJrYWo2WjhobURIbWhFN2dWUitwMHVkK0xCb0h6?=
 =?utf-8?B?YXowQ0h3a3F0VmJoVWQyV1ZZaGZLNDhBTTVlUmhBNVBEUjBLSGdxNE5mZGlu?=
 =?utf-8?B?d21zRnFSSmpvOXBXY2w2ZTVLQjMyc3RXaTNrbGE4SUVZVno2d0RDcWZySUVm?=
 =?utf-8?B?TWFUT20xTHNqN2tzRTFWTWRaaWlQNjBySDdEV2wybU50cVhRYS9OUUQ3ak9I?=
 =?utf-8?B?TjhSNFJDeW51TlRxbGNqeWxELytibXJkVE1XaStCSGFTcGR3UHpWekp0WnpN?=
 =?utf-8?B?dXlnczN4MHlMelFxdCsrbzZia0ozMFVmWitrSElRNk9pRTVvYmRIRU9QbVI3?=
 =?utf-8?B?UmNaYU9jS3ZtMGM0cFp6MHdaeHE3WHlRYS9CVitXdUJZTVJMaVMyVnAzM2Q2?=
 =?utf-8?B?OVRKZHdNZ24xazVLcitWNXg2NDA3ZGxFdXR5bFpDT1cwTDlGOVpBY3NpMGFi?=
 =?utf-8?B?RnEyU3FsN05Za0U3MzRaQ1RJeG1yRGZmQXJUYXdVcmZNSGRqM0h1SW9iYU01?=
 =?utf-8?B?WFd5LzVvN3NtS3Y2NzE2QmpoVzdBcTZnSHErdlkrQzBRcDRLWWs0NkIxU3I3?=
 =?utf-8?B?Q1NrU1JFMkNaYm9zV20xVE5rdzFwdFAzQ0c1eUNRM2hpWDhXSU1aN2ttMzBP?=
 =?utf-8?B?MlpNL2hOWHpRN3J4UkR2MG54MG5iUzJkelZnR3ZCbWhXeE04Vmg5bVpnMzRo?=
 =?utf-8?B?SE9XN0Rtbm9RPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmVGQ3QrMVBEN3M0QnlqNktmSmd2djJlOWQrd0xoK1RjaEpPSUo1RHRpY1hE?=
 =?utf-8?B?Vlk1SnFNaEpTVlFBYVJpQm1RQjA4aGxzcFNyaThzaWxyVHFEL3M2bmxjTGlG?=
 =?utf-8?B?M05BQU50aGR0TU1qZGNHMDFpK1IxMENvNEpHRlJtUUxDK2ZjZ24yTjY4VE85?=
 =?utf-8?B?cjQ4UTJqek1TS3BOVzFNVWx2MGd5RVhHcEdONTFQejVmZXZLMHROcWlWdGI1?=
 =?utf-8?B?T0JwYi90NkIzOXd1Y2VwNGJsWjdIYktQNkhENzNqUDZ1ZlgwcVY5MERkVFBW?=
 =?utf-8?B?dG90L2szbzlac09tSTFkM3NPYmMrWHdWK3ZTMDFXbXNBblBNVi9oWTZUL24w?=
 =?utf-8?B?bXQrOTFXSjdnSCtoV05VSFdpbEJCRzVzZ1g5RlZsbnVDVVkxLzFadGh0MWVK?=
 =?utf-8?B?ZHRVLzJCeFc0VlFlV1RGZXZ5K0FBZkM4M2NDZU9YZS84ZVNlY1RhbUpCL0Vp?=
 =?utf-8?B?aEhObTJVTHZQUWVuM2UzWmFiYk90SHl4STJqSHZhajlJV3NyQWtpTDIwSzI5?=
 =?utf-8?B?UkxiS2JFaEQxK2ZOYWZwdkNuVXZObjZjTER5QVJ2dVM1NXRDcUU4M3JaajFG?=
 =?utf-8?B?ZzhHRkx0TG5MRUwwaWk3OGFCeWtQM0N4ZHVYeXdxMmZ2Tk1IK0pPU0FNczFC?=
 =?utf-8?B?cDJSUzJKR3Znc0lUQ1d2TGc2eFFCSWpBOXB4SXFKY1ZXbkxqc1VvZVNHS1dC?=
 =?utf-8?B?QXgrdTNndTY2QXM5Sklob21YcnBJRm5IdHR3b25KSUE5em1zSXBzRlRuR3o0?=
 =?utf-8?B?bVpIbks0b3BtVndQQ2orbWxJTG14Y1lsczJuN01xTkcwWlhRNm5ZUTMzbXpC?=
 =?utf-8?B?TGVldEs0UE41TGhpTkplYXhhU29BN21OSmJGTHlQdW1ydzJ0SXFQMEs0UDdM?=
 =?utf-8?B?QWdhM0xDZWQyS2N1a3pFa0s0TE92azN2UWwvWm5CeVJQTjI5Y0c2UDVNYVBI?=
 =?utf-8?B?bW5nQklBWldTNEdCQlJGaEsrTFZMR0R2NnYxU285bjhpYmh0a1RReVdNcnpW?=
 =?utf-8?B?ZGJhT0lhSUdTN3RJQXFPVXRrN1dyblhyZGg0Y3hDeUkvS09TZHBoZFA1c092?=
 =?utf-8?B?T3RNaWpDenNydTR3ZUhOT3l2SXpJNmNTeElUbERGQ2tSQjJoL29hQitUUG5q?=
 =?utf-8?B?SGgxbzkzb2dDMGZzRGhBRExRbURwUkY4V0lHQnpGQkx3QUNTZEFVRTZZY2lI?=
 =?utf-8?B?Yk1BcUNrWk04OWZNSDVqN1Mxcy9ERCtXWlpPSUpwbGlEME5yOFZHRkM3emZV?=
 =?utf-8?B?ZzdrZmxTVjNrek9wZ1dTVEdUdGplTTJ0ZzU0YVE5bDhqUXdpQzZBY3BPNXdn?=
 =?utf-8?B?OUE4eGE3SjFPYmloWU1GK2pqK1IxcTkrZFhud3gvNVJydGxCZkx2QlBOR2gx?=
 =?utf-8?B?VmJXZjdkSis4TE9CUVF1VEJDYkVmTkNXTHRXZXVmekxZT3F0YlhseWhvSGtR?=
 =?utf-8?B?UlRib0NONjJLeVNoZk0rVEdiUnBtcERDQ2dmUjU4SUtsUDlXT0xuNDM1WkIw?=
 =?utf-8?B?U2FPSDk4KyttRWttYVBjL3FJdm5NTGIweHMvMTcxZUdYeVh1eUJvem15eFdT?=
 =?utf-8?B?ZW5zdjNTUWtsNlZSekV0Z2NMdzh0UzFETGE1dUdwdU11ZVNvRmpvYjc0NW9i?=
 =?utf-8?B?dFBNL1JDTFFIZXQxMFZRRXJtYW1Ha2dOTXFPV2hvcUdZczhMTlRieTBRU0NE?=
 =?utf-8?B?Y2ZhUkhoSzRycGZ6UFM5Ujl3QVNtU0dVYVl6OEVNcjhSMVV2bUp5YUllRzFm?=
 =?utf-8?B?OVNDTmVvWmI3cTNrSExBVXF2SkJSbndmQUxpL3U0ZGlhVHhuMldoWnVKMUZI?=
 =?utf-8?B?OTBjallIdHIwQ29tVGtJOTFNalZHMFppdlBLOW53NmpNTFh3VklXUUtCb2VZ?=
 =?utf-8?B?Z0VPQ1B3V01NUW9JRm9YN1djSG9PbUdiM2RheTduZzRLbGlLNEw0VVpKZU5q?=
 =?utf-8?B?ZVl6OEdWOUZMOEVhY2pIbWo3RlRqSTJzRTBWeHBWV2tja1kyOVBKVjB4ci9w?=
 =?utf-8?B?eXVvRHdEa202YVBicHF3LzlhMUdOaHZvZXU5OGJCTmtBczM3dENtV2pGNHEz?=
 =?utf-8?B?L1BtVjVqd2g5UzZiZEZBTWdzVkI1SHA0QlM4bG5FWXN4eUhxL3NQWGxyVWtC?=
 =?utf-8?Q?U8MlhwnsiacLinShr/6CGOYed?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35f05cb4-d2f9-4d5d-c44d-08ddf847b4cb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2025 13:15:01.7280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yGh9Jx26Lw8PV7RoPx/YkPWZRes4YTWiH53cO6cLDJkqPJDgObuPvV/N4bXlRQ0Y9TeKQnMGqCTvkE/6HzuSYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8833

Refactor the detach logic to support platform-specific implementations via
the dcfg->ops->detach callback. Allow finer control over detach behavior
depending on the remote processor management method, and make it easier
to add detach support for new SoCs.

The previous hardcoded SCU API detach logic is now moved into a dedicated
imx_rproc_scu_api_detach() function, and registered via the plat ops
structure. The generic imx_rproc_detach() now delegates to the
platform-specific handler if available.

Also, the dcfg->method check with IMX_RPROC_SCU_API is removed.

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 18 +++++++++++++-----
 drivers/remoteproc/imx_rproc.h |  1 +
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index a5fc21982f09d000ff3bc664b52e8ef18a0a6fef..a621a934a7ba5fe454e420d8dd20256d3655d560 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -575,13 +575,9 @@ static int imx_rproc_attach(struct rproc *rproc)
 	return imx_rproc_xtr_mbox_init(rproc, true);
 }
 
-static int imx_rproc_detach(struct rproc *rproc)
+static int imx_rproc_scu_api_detach(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
-	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
-
-	if (dcfg->method != IMX_RPROC_SCU_API)
-		return -EOPNOTSUPP;
 
 	if (imx_sc_rm_is_resource_owned(priv->ipc_handle, priv->rsrc_id))
 		return -EOPNOTSUPP;
@@ -591,6 +587,17 @@ static int imx_rproc_detach(struct rproc *rproc)
 	return 0;
 }
 
+static int imx_rproc_detach(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+
+	if (!dcfg->ops || !dcfg->ops->detach)
+		return -EOPNOTSUPP;
+
+	return dcfg->ops->detach(rproc);
+}
+
 static struct resource_table *imx_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -1155,6 +1162,7 @@ static const struct imx_rproc_plat_ops imx_rproc_ops_mmio = {
 static const struct imx_rproc_plat_ops imx_rproc_ops_scu_api = {
 	.start		= imx_rproc_scu_api_start,
 	.stop		= imx_rproc_scu_api_stop,
+	.detach		= imx_rproc_scu_api_detach,
 	.detect_mode	= imx_rproc_scu_api_detect_mode,
 };
 
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index a9cba623560c85ea37e47401c392c06dada500aa..aeed08bdfb5619c7afd7201589f417cfd6745818 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -35,6 +35,7 @@ enum imx_rproc_method {
 struct imx_rproc_plat_ops {
 	int (*start)(struct rproc *rproc);
 	int (*stop)(struct rproc *rproc);
+	int (*detach)(struct rproc *rproc);
 	int (*detect_mode)(struct rproc *rproc);
 };
 

-- 
2.37.1

