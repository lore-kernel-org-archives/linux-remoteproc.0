Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011049.outbound.protection.outlook.com [52.101.70.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179D72F25E9;
	Thu, 18 Sep 2025 11:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758196307; cv=fail; b=t79+iDmhtc+2++BLN2nnqqVBxA+aC2V06atBfpkB97kn7Gz23pa7HJFdzFQhOpaeqQBuFPnwlQJ0iAWZ++vli2FN69nhcA8By2kXnCF/4fYWbmgakHjHxTMBR8pWatsKJKbND3rPm5JyykXPJAjQo9g4bBCahswbVBqko+iYvk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758196307; c=relaxed/simple;
	bh=SbWMFrbev3tKsCeyw9uhccyaftraBTbYypluzgc6Eyc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Rer1oHDcS+1uMn1VaKLi313faja7zlGYA7M/Dqt8AkBygaD8fv08SRYGcY3eQyh3K7caWiFDtPnnDPx1PCLEVx0KkdV5dFawoHD7vVqi204EQQIa1s28QXYXsKJwEo4XTPcPgsOXGAeuMQAZD4G5lrMEemkf3pgGWwxQY6pAFOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=memDKDns; arc=fail smtp.client-ip=52.101.70.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="memDKDns"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S1K7llZApoItpu333NhwrPC6ngj/ht44Iw9FwDzpTzUCsq2NkEFJ2DEBthkUki/LDY2JMKDU85Gwly5lIkZ/ZBS3aYiUqbfIK4YkoHq8yxm8Fa+9C3LSJYRQvdfAel0MHbI2MAsUkpMEOTQosNqHkPGxRgX1yimJetSYDrYqwZe+C1gijY9XfyqnOQKzsNMxprgXuGYwNi6iPaiIZnSL8n7od9e5j+AqucsGKGeltdMP3YnMdMfsMPT9JBii5u2OKDDm2TF5Hq65Rq/Q0XRXfJB08FpEx+JGdnuk/IW/TvwmyS4OjUa4EeFXEsfxIGB6nIyfqtmFVnr+C2xRK+K8BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=phRGegFEwSQBHSJz+vr2j9yXfsPXBbKwN7i8qOwIfTo=;
 b=EHo1WyDeZgt8zn9dN7kgnLa0FXE0kJ8fM8A+9fHLuyUe1m6iUYuW22Sk7Zj3ajCSN2u9kwygq3CZWLeKS/FevDqYyqbANCnDB30lRZffvBTGATwN8L9TH9+zxT0lCZKYIB7DZTVivBt4cZW7A3yfnooTsQs2Lf8Lc0yZDdcDYqly4iNH526DoEr4u6vmfOmcxZNe/JWS2+eskFlgoPrynsvzAdZ87ZEsM9+2DBH0cRNAEQevD1MxJajnTMwRT5iS7lf8gv7v/L8GdIhbzvf690IY1gldTsrE2kayp7RcnsbZ2ZPduO6f6Kl6IlVzTSKJnya3QgIv4XrUAf2WTVgb1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=phRGegFEwSQBHSJz+vr2j9yXfsPXBbKwN7i8qOwIfTo=;
 b=memDKDnsjlRkA+3XgIifzrZzcbQX4In+bJ2dySDuCRyhtciNFTWMeIDLr38qeubXEwS5pqghsuV1Lpctk/bp7qX2Qi4ys6n+xCGX9QCkg1Uj3woZfXZlZwC7rlXfUCcFGbY0yUiAuaF/XtuD4+VhC36+VZwaqM+tO1K8VXvAlSBPn+YlAor1W3oMJRN70udHSZb84tU57TxulVucGaxo6nOgRCSNyKVbm3fHOAygz3X2zNVzL4Z9lfha1tC/CYW0lO1KucNqSEH36KANsUoC9FGOvohLzMPSBxvIDY9HJFzAjCCDMtELLT47DhUFO+z5iUOCg6P+0BSiafsEtV9AvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10450.eurprd04.prod.outlook.com (2603:10a6:150:1e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 11:51:42 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 11:51:42 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 18 Sep 2025 19:51:17 +0800
Subject: [PATCH 2/5] remoteproc: imx_rproc: Make detach operation
 platform-specific
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-imx_rproc_c2-v1-2-deec8183185f@nxp.com>
References: <20250918-imx_rproc_c2-v1-0-deec8183185f@nxp.com>
In-Reply-To: <20250918-imx_rproc_c2-v1-0-deec8183185f@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758196288; l=2882;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=SbWMFrbev3tKsCeyw9uhccyaftraBTbYypluzgc6Eyc=;
 b=86QzNOMSu4EVtvVzGOxIInDpBYWobjKWj7I4LZcVGo6lskZu7FVR+nVhbVewvhagdg3qitBFn
 GXbS/2H1rfSD5x4U+iKdNCCX7CSiy+1CRLT3vcOu+youSD6H1NCTAk2
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR06CA0235.apcprd06.prod.outlook.com
 (2603:1096:4:ac::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB10450:EE_
X-MS-Office365-Filtering-Correlation-Id: a6ce0dc2-e452-41e5-0a15-08ddf6a9bc29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c3JSUUFkbFVaWnduTGNDeE9kZ3FZYXlaRTdYcS9lZ084ck42SWxibkEzVU9W?=
 =?utf-8?B?L0FyU05LQmVvcStyUUN4QzYyaXJILzRBU2R4azhIc2taRTJjRDFvTlV4VzN4?=
 =?utf-8?B?OURCZXlINnB6UlZSSkdQdDYvQVVNRWgwcjErNFF3RjNPbmwrSXNWcngxcVJU?=
 =?utf-8?B?cXpPRUxPcjNWdytOT3pTZ2RPSWtDYUpDUUNIOFlaK3hHRmZUWW1rNVo4Tzdl?=
 =?utf-8?B?Q3JHOU9lbzFhbHdaOTYvaTU2Tk9QL0s5NzR3b0U0dTlYbXhyQVhMUW9pMzFH?=
 =?utf-8?B?b213T0ZEdi9hSEdnd1hBQ0xtc24zTnc1UUVoNmFMQ1JqQTYvcm94ZFhPTmd4?=
 =?utf-8?B?WmlDWU9saUZ0b3U1RFB4SFRvRk4rakU1R1Awbmt2aGZUbDhYVDFaV3Fkbkd6?=
 =?utf-8?B?aUNYWE05RS9jYXA1V0xiMkpKdlY3T1VlclVjNEtqSE9DK1RxM0NFbVE5eWE1?=
 =?utf-8?B?K1B5d3RJUnhUem1jVldkS0swZzF1ckdsdm5vYVFQK0xSaWlibDdGOHFXUWhD?=
 =?utf-8?B?cXRVSWs0ZkRxVENTOUZnbXhoaUROck5nOVhqU21VaXdHR3NDb3ZKbll0dzky?=
 =?utf-8?B?ajNUOXNCQS84V3d6eXFrVjZWVXNRQ0lGRTJuaE9CeU5sQ01MVDk2RlltTjhv?=
 =?utf-8?B?cTMrL0xOOWRCakVLWkx5MUhDQnU4TDdlNm9tN2UwNkhHUUJ3aTgxVURCRTN2?=
 =?utf-8?B?a2RGN0hoeWZCM2VPRkZqUEoyUFhDZDluSGllM2lWcEQ4QlVaaHVoNnNaeG1q?=
 =?utf-8?B?dzlzTGphZHZFY0hBQ0EraGxWUDFxbk90eFNOaitoMXYrQXNpQ01qdElMRzZ5?=
 =?utf-8?B?NHRadEd1QWN0WTg3YllkL1Ftc1BjMVNXMTdRMmJiTnlFcXdvZEJ1RmtIMmlE?=
 =?utf-8?B?TXQ1cllBTXRQNFBlakMwbEVIb2tEaktqOFQ4ZUtnK25uRStrV0NYc0s0cHBT?=
 =?utf-8?B?SWhIMCtPTVJvUndKRC9sMk1reEpZc2NpWjdoVFFDOXdyTmtpZU5XWHE3Nlo5?=
 =?utf-8?B?VFRoU01vclVrYkFvaEMzY1N5WFpjT05VRzVhd2xaQmdYUStpWjJDR1VVR3Y1?=
 =?utf-8?B?b3pCSzBMdFpnZlFWcWV4djRSS2pCTVlNMEIyTXpnOW0zak1oem8xUXJwSnhE?=
 =?utf-8?B?WFBoWmhFZGoyN3QxK1F5UzFQWG5CN3E2MkhrZmZJUzR3TWlpZDlsVzBwMy9L?=
 =?utf-8?B?TG1Td3pPRUVPOTU2ZTAzVnBUVllKNnltTzRqRlc0TFJmNmN3SytwenY2RmQ0?=
 =?utf-8?B?K2tZelVQUHVGWG1KNHBJeE1vTjI1ZnBWK1owZG1aK0V6bmJ6ZE5ac2J4UWdp?=
 =?utf-8?B?cVZPT3BPOGJ4bW5mVFFqRk1hcEZQaStuS3BTbnUva0N3K0U0dnZqc3lZS212?=
 =?utf-8?B?MFdGdWhPenJYTWJoNUR1SVJmbEwwaGpMbmsrTDkyZkxmb1c3V2ZxNWtYbDJp?=
 =?utf-8?B?cm5xbUVNS2Q0UUQyaTVzT3N4Misrc0MrdDdLMmtKRVZuMzl6WjJFRFBYdVBQ?=
 =?utf-8?B?UTR3aUg1azIxMFZFblFRNk5hUlV0dzRRUmZXTW5HbzdUVU1rYnhwOTBvQVFU?=
 =?utf-8?B?NTNVam5GQzByQ0hIUEVldXgrdSttempTN09KbnNPNng5OWs3NHFmQkdlOVJl?=
 =?utf-8?B?ZFdXU3VzNDNJejBYaDJIVzNnQU1vdE1uVzVyclJIRWZFdit5MnZ0bzROVlgy?=
 =?utf-8?B?bXZ3Ukc5N2FzK01iVDAwUVNJTFRxY25ubnRVUk1mUWh6TW8xWEo0Tnd0WXha?=
 =?utf-8?B?L2dzY3FjV0RkWlFKN3Q4WU1kczZGdXJQSGZoRUpsYk15SzB1K2lpTnVtNVYr?=
 =?utf-8?B?WS9uQU5sZmZLcjVlaFMrQUFKSkdwL1FrT0JEQm5HL1V2SmFPenNqYVUzK21u?=
 =?utf-8?B?TW4xeDVWQm5DQjNQYWlETXM0aDdkOTRIZElXeFNUREwyZEJZTE1CeEFLV3NE?=
 =?utf-8?B?amtvd2wvSFRVbEZhN2hBOGtyek94NmsyKzhFNGxHb1RsL0hINDhjbzQ0WHhp?=
 =?utf-8?B?MXI4UktCbFpnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmtzaXA1NGdnZzQ2K3hvVEQwL1krbGtxN3ZaaVZER044Y2E3bnk2ZFdNVHJi?=
 =?utf-8?B?eUVjTmtPOTA0Yk15K2wyVHJqM0NTdjgwRmpqSEFCb0QxR3hIRXBER0VLZDEv?=
 =?utf-8?B?dDNKNytHY1c1SDJpcnVZS1k3NkpVVHdjWkpaVG1jeUo2d2xOOUMxWnJCbTY5?=
 =?utf-8?B?eVFWYmpYSU9zSk11V1Rsb20yNUoyRnkvdXcxYitQT2NERU8wYXlHY2xvQm9r?=
 =?utf-8?B?TXRoRGhQZG5aYWd0a3FndUFlbkZ2UDcybmg1RlFwU1hXK3kxN1QyeFpUblNp?=
 =?utf-8?B?WHFLM1lBYmFENU1iUllybGhZSjF6VVZxTi95NUpxNnJDNHFmaGxTbEVrQlor?=
 =?utf-8?B?RUE3anJLSFl1Zlgyay91Q0VPWTZCTnNIRlpNczEwbjBXWU4vMTFBSjlFSTg5?=
 =?utf-8?B?YWdQOUw4QlZoZDJERndlWVZhSGh6cFRxeklnZkZGUHVVY2lybzY1VUgxcUFz?=
 =?utf-8?B?eEViSDVWcmJ3M0xpZmpyclhvV3p0SW9rUzIveWtHQWhrY04rVEhEcG5sSXBP?=
 =?utf-8?B?Z3AvdDErNjBYNmNpSURwL09rNjFYOGtMM0xoMGNOMllyS21XRFhQTngyQXNY?=
 =?utf-8?B?REtWek1OSkdLdktZQ25LNmpGdjBRTFpucldLZWdxZEIzamg3dXBJVFkzUFZy?=
 =?utf-8?B?NjMrQmJPZjcyYmc3SkMvN04rT05tY0p1YW9jclAwQjdCdmxwMGJsQzNKMEQ5?=
 =?utf-8?B?c3JwcEVhZ25ZcFBiWnBwYWs3ZGpKV2plc1Q0LzlWWmw4alI2RmU4TUwwNnhN?=
 =?utf-8?B?K0QveGxHVjRtNVJxb0ZPTkk1ZEJjMVlYTEtodXo2YjhRcGp4OUt3eEZja25z?=
 =?utf-8?B?ODNDdENtaWZ6SHMwM29XNlpEcTQzdmEwSGdQZXR3b09MdGVUTFNJcmxiaHMw?=
 =?utf-8?B?dktTaVFOK1Q0YXpHUEV4U1JtWk1XQlZFQy9lTWtzbVRJTnNTaXkrTE9XZUR6?=
 =?utf-8?B?SjdjMEZFUHN2OThDNGhZcXJTQnp4S0s4WUozRkxXQkZLRzZ2dk9mdXpQVDFo?=
 =?utf-8?B?cFhkaTF2ZXpNTWxkc2lKYXp5MXlLQzUzWkJQN1ovTC9rQUdNMkc1T2ZyOGcx?=
 =?utf-8?B?NUx6L3BEWE9uV3p5cUZiNFNTbVMzb0ZOMWpSbWFFMVREU3A2cms2Wk96dmxO?=
 =?utf-8?B?SVgzMXpTNHFzL3FXREJNeVlyWTZtblNXRE9ud2tvQ2Q1YzN5OTdScHgwYVRJ?=
 =?utf-8?B?aW9iOGJ1cW5oeXhVNkFNUEJqaEhFbklpQlF3OEQyK3ozL3RuZXM2N3pQRTRH?=
 =?utf-8?B?T09VQXhXS2FZQXJOci9SSkZCazMzTm1WVE5Cc05reUt3NXVXSG8wTVo0ZzVN?=
 =?utf-8?B?OWsyRUVSNGMwMmY3cmF0MUZGemR5bVIwOXpkSDBBUkhBVUh4c0NJR2tyVkxi?=
 =?utf-8?B?Z21MWnhiaDFieVVINEhPSmR0eEpTNGdSVVNnV2xDalFDTHhDK25Oa0hlcEZU?=
 =?utf-8?B?cGFnanVJOEpVVGlwRFltWERZT3hockx3dnJOdXhNZXR2dWdTL0FxdXRPbm9r?=
 =?utf-8?B?R1FYeE5GYjltaDNrTVVCeXplL0RNclI4Y3IrVVlZa3I3VEtVSGliTndXcmtD?=
 =?utf-8?B?bi9XZmx5bXdkaXRhQWovbFZQRXhvektYOUNUc3NQWkRwTFJxWFBzenJNME5j?=
 =?utf-8?B?a1RHZUp5NnZKbjlHZlhDWTdReVJpcUduNDhRdkVvdEpNbHlUc3NVVDV4UHZo?=
 =?utf-8?B?ODErQlRlNFM4ckszSEN3aGF0QTQxblBwQnNFcFdoaElDSDZwMTk5KzBEVDRR?=
 =?utf-8?B?cUpyMnJBQ1ZXckxiSDl6cHJsSHJTKzhoRzVQVjFkaWFoTm01N2VJSlRWaFlL?=
 =?utf-8?B?cjJHMVJPa0RmTTJtMG1qYmk2TDBmSElZWG5FR1VCZnI0Z0RNZXMyajQ0ZEtz?=
 =?utf-8?B?cnozSEJGVDVlQ2FVUFVnK2FlY3hTdWlVK2JSM21vTGxQY1FpM1ZrV2VFc01q?=
 =?utf-8?B?STZleWJTOXhQS3lGYUVKU2g2ditJRGdHQkdETWJIa3FTTXBoaVQ0em4zdmpj?=
 =?utf-8?B?aWhxUVZsUjFSQmViTDIydit6anBXc2VoSFppWlpBeUhVT2JDcGxVdDIvSmlZ?=
 =?utf-8?B?akxlTGhUTmFjaVk0cTlOWmw2U3hNcS9IOHdvVGVQMHAxQUtsUWtUZDYyYUpL?=
 =?utf-8?Q?SidS3vO+dGRROnSmySU3pVt6B?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ce0dc2-e452-41e5-0a15-08ddf6a9bc29
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 11:51:42.5570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q9uZI2X4FgiKLBLPEmlMHgK0fycRT84lJoYdsctL5cWCZOcB3G1OyVAFyFnbxLFWuMhYCzHPNmrSjFFKru4mXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10450

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

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 18 +++++++++++++-----
 drivers/remoteproc/imx_rproc.h |  1 +
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 71617b20f9d0ae698e7f655aae22e8895434f32c..74c958d44611b66e024180d69d71daac5a2f9e76 100644
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
@@ -1152,6 +1159,7 @@ static const struct imx_rproc_plat_ops imx_rproc_ops_mmio = {
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

