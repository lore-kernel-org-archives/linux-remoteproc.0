Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011017.outbound.protection.outlook.com [40.107.130.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EE732ED3F;
	Fri, 31 Oct 2025 09:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761901749; cv=fail; b=cb8hcE6SK2YaM87333uU8d5/FtabMjLv7jD6cfMYv6VEUG2kVSlYPejfzmmDHJE6UNfIpo1hbLzpJrC+JFM3VZt0t59GSNaygmjwncBEN76GnPLWqfth2VE/smGgb0smXhf8S30yzzrzowzbzZ9Tk+r9PCpUwTeDZlV6SziFqeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761901749; c=relaxed/simple;
	bh=ch0qifwT/Pt8FQBZ5noAwwdXf77N4VJw8KW65uwCMls=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=mrw0DoebnXO1twWZ2E8G52waEmXtco3E7K8CjH+hASsjEVIcE5n32rZDgjQ8s7XfpxvCkBleOdv89H1b5Cnh4D+oXXjgB0n7+Elr/M/FGjAPOR3NkYyLE1qoQMsPY9e1MNNoA06GdZ5j+vDeXOFt3Hky1M5fYpNk+FsQPatTc5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gaVejE92; arc=fail smtp.client-ip=40.107.130.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gaVejE92"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XEwMK7C/ELRB1I168hZ3rJH0ShQ5dN3dUX5QhVSQIoPN7VNbNPcbWitAhVgDz/j7lvg4hmaHUqxx/bv1MfXUXwuKGgxYIB1Uqs4nRwj+U9eC3Khdm4LAY/MKM06kbP9iW9IbevIoUp1m8/iawSrM3WlPzIYOXBJHEs8JMQw3xjYKiOzUAlkq3SqcVYwi0NBBtPOPLGozC2cDuKSlVJS36ys6kzhWBHDOAdPnw2058SFyxyjPvsHvbJ8Dg7Uic6/umpfpR5YkuRdREHgWxC7bBaaxVzHeHQ6YQ+ulk1iF4O36jC8eTri8HCZBz9RyO58GV0YUdnSpgBQzNpiQyy/rDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ka3ykOu/j55SY8FjTzPQouTLl15Cs6mEZywfN97swuA=;
 b=LAJB2yysjtWhq6RI8jrL1/WNkwUDPJPDdevMy+bvGzuM+qSunk4rPUtrD17SuaUnP1EBuxBlOYgzTFFEwvLUf+jR62bYXZANrMAbPITwn6TItn3YjRFGaYp5iHSOej+YCROZlkTs21B7mpoxNvns2oQ8ucrBVN4ZShGCahbsZbuPBp8jSaac1VcV7Hm+M1clZNKW/SjxWh6jsRO1GLgTv5izQwwOmAfO/BbE5dbRF1gCYk4JvE4KTD2NDlPlQcXamBxuzm2TGfHNOr31qMFElHxQraM3u2giAyR4lGa3ZiRbK+IEU1jptZsxVKl2z05+EdSSCNgsquHzFirdX8F7jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ka3ykOu/j55SY8FjTzPQouTLl15Cs6mEZywfN97swuA=;
 b=gaVejE92xMJN5ZCvCGxEEu4HfLO/celb6WjLYWRW7bBmqha7q00zGqU7m8DAV7Z0xFJ8lKhPUDNtzbE8LYPaU87FPZQabt6F20OLjO+EG9cSWGlS+3bD7E45V4f0LODykzRNCb26URKsClRDijSLV6R2Mn+pEOt+cCLW8fwFpxYBITdlxuh8uDuYzVBJmw+cc/hOzduRGTt5O+5cMOiC/UuTHVy7aOZWvs2qPo3ceCy84ERDTdkMVubXR9hKVOBWRgbj+Q1oIFsCkFTc+zc0l8md4Cn1gg9BSBByKQ8gBEMQRoFlpA17B5h6Ewl4so5E5QGLWFBtblRVQeD26jN95A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by MRWPR04MB11495.eurprd04.prod.outlook.com (2603:10a6:501:78::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 09:09:03 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 09:09:03 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 31 Oct 2025 17:08:30 +0800
Subject: [PATCH 01/11] remoteproc: imx_dsp_rproc: simplify power domain
 attach and error handling
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-imx-dsp-2025-10-31-v1-1-282f66f55804@nxp.com>
References: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
In-Reply-To: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761901729; l=2633;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=ch0qifwT/Pt8FQBZ5noAwwdXf77N4VJw8KW65uwCMls=;
 b=hDUXuPRxu8Y3MOeJTyxHmk/gzF/7RFMa1HjRfAGSfxcQWoCa59Hs/Aw+5jZWTKNLlvIsdkZjA
 NCTkwJpXRE1AJLnsR9wQiT6LO1Y1HmMFzq2b0E4rhx839EodjZ5cQk5
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2P153CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|MRWPR04MB11495:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f9edf70-c64c-4b1d-3ed2-08de185d233f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|19092799006|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eHBWbFd1WUhFWEVCMVRMZloxZXRQRWZoeXpKdk1mczRYL2Q5WVJzTEZxNm5q?=
 =?utf-8?B?cDdIQzJ1MFc0dzIvNnJFYSs4V2YrS1dlTVdtTjBNUDREQ3JwYzF2SG82d2dv?=
 =?utf-8?B?cWE3dk51anBLczkxYU5SZWp6eU52djFzeUxzNmFCS25ZeG5YWXdDQUlLQ0gz?=
 =?utf-8?B?SlNpd1N5RGZOVE1iRmpxRm9IQkhlcmJCSXpEcFlLTUliLys3N2Nsd3hEQ1ps?=
 =?utf-8?B?UmZGU3lOMjZxc0xkSHl4TVVGUXBTdmdSWlYwNXl4WDIzWWd5S0JGZlRpS21a?=
 =?utf-8?B?aTJuMTlIUGVhd3h1VFBlVHo0cWJvTjFVMmgvTGt3Ulk2dHRvcEhZN08xS0RP?=
 =?utf-8?B?RWRGTlBkZWhBVVkrSmpBcGRUL3FSYVlwOWhiZnRGdS8xRVh4eGRtS1BSLytw?=
 =?utf-8?B?SnF6UlRFblRBZExVcTFhRzJKaGJCNFFybnA5cWhDemdWalAvM2hJOThpMWJH?=
 =?utf-8?B?aS9HNjI5a01DeCthMEk1L0dUL2R0cUpuRWJkMlYzcEd6QjFlVktncXYvS1BK?=
 =?utf-8?B?cGs1TW9qajdCdko5SXJwRWVSTWgrWkxhQU10MXpDSnVDV1FPdUliSDNDbzgz?=
 =?utf-8?B?TjJCZFY3ZkZiTCs3bjVjR2hhb3N6T3dOR3E1ZThTT0R4WkRIMDY1UmtrUTI4?=
 =?utf-8?B?MzdsNFhTZFNyR0NRVlNMLzRWcXRTSEprMGkzS3RQRHY4S2FGNkpvTjJFaUpV?=
 =?utf-8?B?dFpGbE9EVHA2dHNrYkFwcmpZRDBMYi9haFRzdS9MOTFiZ3pwb2VtdmJaUzYz?=
 =?utf-8?B?RXY4SHpQQ1BWV1RLT3A5VzZNUjBIR0tIQUhEdTA5OFlXaUorSXhDTk0wTTJa?=
 =?utf-8?B?V1liY0hISkIxRCtJWjJXSTY3SlZqQkRmeiswUWsyZFRJbTdIUUd4V3UvaG1u?=
 =?utf-8?B?aTRuckdhS2piSDNJVUtDdVRwc0R0WEtmRjdITmVoUXVRenhRUXh2N0YzZWpa?=
 =?utf-8?B?MENENUViTjhncFdLN25wY2JWeDFjWUFpWkJsaTBEVmZ5V2R4ZWtvOVJ3K0sv?=
 =?utf-8?B?SHIwZGFaV09SY01mT0EzRllyZDVVdExpN1BBL2taWGh0VlNwcXlzcXRYSTlx?=
 =?utf-8?B?TTFsYXh6K2dTZWdMNEhvanlMSUtyM1d0UDZJbG9BVkVzSHdMN252UU1sd3Bj?=
 =?utf-8?B?QUdGVW1KRXM5S0c5bG5RVEdmUkVVeXdZeWVVcmNPTzlkWm03OHJNL3Y3ZHlM?=
 =?utf-8?B?TE16L204cjYyYzVHUkJBa0w0MHFMaDZuM0t1ek95cXRvRFo5UTJhajhKMlU5?=
 =?utf-8?B?dU5wMlNZSWxIeXB3MDZTTi9GRTl1OEFpUmtNOG1IWnppd25SMEdVdTFqSE9u?=
 =?utf-8?B?MEF3YnJaUG83ZG9SS3Bnb1dQWmpwcm9LRjRRd0c1bTdQMEd5Y3F5SFpWVG5Q?=
 =?utf-8?B?THBNOHF2dGdDUTJYSUYzcG9icjdmRlAvNUVPNjFQTHp4T0g1SFlsUmYyQlVy?=
 =?utf-8?B?dmExQk1wYVJUZ2tJMWsweTBjdjR0Nkl6YktSaVRyK24veEd1M2liUzFHQitt?=
 =?utf-8?B?b1BZTnFvRkQ1R21NK3oyM3ZFQyttbmdLVWhJSVMwTEcyQUgyQS9PdTdNZmFX?=
 =?utf-8?B?ZnVMVmNVM1FWZUlLSCt1T3FYWmFCZTM4KzI2NEpiVk1MRGErUlB3cSsyTXlh?=
 =?utf-8?B?bVQvRmxER3pSc0RFWERhWEZzdGs2QitzYy9rcCtkc3VGQ01SSVVMejZ5Y1lL?=
 =?utf-8?B?V0wrQlBDM1NEODFoS2R0MFNoOGR3czB5YUZEb0U3c1BkRzVCTXFLVlJ5SFQr?=
 =?utf-8?B?NG8wT3hscVJaVDZWTi83SFFsbzZXa3ZkNlZoT20vaXlwMmlvTE13WlNMSUlu?=
 =?utf-8?B?RDJXRndIMDN2VEI4RFAyL1NMbHFTRjMyWkl4M1l2dE5ZSzlBa29Bd0ZQUkYx?=
 =?utf-8?B?RUJqNWl3Y2FFb0k1WjQ3eXdvS0w2bnNMeURsYjdVWUI2czNhYTBicjFFMnBr?=
 =?utf-8?B?RUVMZktnRzZHWVlmdkNaVmJvKzdYbXdNd0tIM04zeVUxbE1jd0QxR0R2Zk1R?=
 =?utf-8?B?aDIxSXcxNTBXT2RaaFFITEI3amZremRpWm5YS0ZVR1BOWTRJNzZnRS93L0l6?=
 =?utf-8?B?RUpTWGh6L1NNNmlEVXV0ai9jeWZIZnJlbFJsZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(19092799006)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGR2MnhrRE1FY3VRWlBMK0QzN3prWlpNZUNmMzhYZEFZeVBnZEhueHRvTU0x?=
 =?utf-8?B?VWNqZ1hUMEVheDZFRUpsT0JUMDhIRVUwZTliaHVkMmhiazl6WmN4ZGtTSWFu?=
 =?utf-8?B?TE9hdUlXVDdua1VmNC9PVThINHRiaUVvcURtMkF0ZC90R2ozUUFOODNwWnRF?=
 =?utf-8?B?c3ZxT3VxUGxqY0I3eGY0SG0vdERaSUlKUkpGSEFCTmF2b3ZnY3NEQ2Q3cDBu?=
 =?utf-8?B?bjdhZlQ2NXJhWXVIcXlUV3RrbWJQekRNem1pbk55c1AzSDJPTGFvOHAxZ3JV?=
 =?utf-8?B?UkZKVHFoOEtNL0tUSVN4OXVOdStRUUI2K3BMWHRCNW8yN29QSEJPd3EzUmVx?=
 =?utf-8?B?aEpEcE1mcFRSWGlBYXY3c3didDNreU92bEFraUp1RU1qZGZObjJTam1xNGdM?=
 =?utf-8?B?cGNDbUNlOTNWU0pDS2VxSzlRV0hXV0tFdEFaUmRQNFFaTlFBM0czbGxnMnUx?=
 =?utf-8?B?cnh0WkZmZjNKQmM5TC81KzYvVG03V2h0dGdSdDNlSzJGU0pGb25aTENkdHZL?=
 =?utf-8?B?UXg2eUJkUk5CblpQMDdmSEFyT1FJMmNBWlJHR3hTc0kwencxUTFkK0l2ck1J?=
 =?utf-8?B?Vm9LQm5UbHoxUEM1Wmd0aHo4K0JhVjRjODhNd1VuZVJudVBvK0VJYkZ5Snpv?=
 =?utf-8?B?MlF2d1BqUnpmNEhpem13dkwzU2RBd29Bd094UHdQYzEwYmg2SWkzZ1lBOFBi?=
 =?utf-8?B?NUFVajVENUw0MTQ4OSsrTHY3NTQzaDlXaFlkenhRRnZIVnJldDVHS01OK2d0?=
 =?utf-8?B?cWRLdWxrUCtwUytOcWtPZFpOc2ZBY1lWaUNkRmZYL1NtdCtqTkFhamVtWHZT?=
 =?utf-8?B?WGRxOWI1bk1NMFJENnFDUWs2K0IrQmJkbXZSYks0UkR1UXJONTVsTUpFaFNI?=
 =?utf-8?B?Z3EzVVltN3lBQVVybEd4UEdTSlNSRkhIbG0xSmdGYWpMSUFvOVdPWjBjbVJx?=
 =?utf-8?B?ZjczcnVqUTlwLzNkYXdJSDgrRzNsbXRRNDQvUlNETVJkRXUvNGRGWlZEVkEy?=
 =?utf-8?B?U3F6blZzeFhJL2psSkNhcXRmanozNER5SjRtWFhic2hFL0puUllGMThNaDVM?=
 =?utf-8?B?amRhVUxTb1RIWm8rNk5uUE1rSnF4aXZOQTVLcFNqQlkvcjVnOE1TcUFwSjZ0?=
 =?utf-8?B?dXZzT29uMGIyaVNYNG4yS3FsZGx4VHRsMTVrUTFxT0JlVUQ4cUUzQWpNYnc0?=
 =?utf-8?B?YlJvbzB6ck9oZUNObVNzVkN4QzlCNWh2WFVkbkZmU0NoWE9mQi9mWk1nNXk4?=
 =?utf-8?B?SlJVa25MSVo0VVNIWnB6eTdFQUVoS05PM01UL1Bhb1VBSjliRjRzR2tqZUww?=
 =?utf-8?B?SW03aWdEVEgvb0dFaEpHUmVEMkdnVmNiMTVCSHBXUGJVT0dsUnhLeWt6cmFk?=
 =?utf-8?B?UlY0NTNNWVdqRStvUEdtcFYvTFhFUnBxeDFudEl5eUZJYlhSNkpWbE5HeEh5?=
 =?utf-8?B?Y1hqOGlnc2dlVW4yckdQRG1PNUpWQVIvRGQwL1VHNzZJeXRzY1BTTWhXQW81?=
 =?utf-8?B?ZDlFcXZDcVlBSlRDcTVlMDVMbFpoazNwdk8vaDluNUczZVZTWHdqQnFQVjU3?=
 =?utf-8?B?TS9zQk5hR20xYzU2cHZRMzNhWnorK1hCdXhVWi96MEE5QmhUYk52SDEwMnRM?=
 =?utf-8?B?Nm0yejNuMTdmOGtiL3I4RDNmRCtjcWduM3p1cW1DVzhZK2RFaktnT0I2MnBN?=
 =?utf-8?B?QkVvVWp1dzZzMlJTQndBZ2twQ2JidFB4TG90Yk1paTJickdqSUh5N1hXTTJJ?=
 =?utf-8?B?VGtEdHZUZEU5dlZPOTN5Wm5ZdDZLNFF5NStuZ3VLQ1pZb1NRb3hiMkh1UEpt?=
 =?utf-8?B?NFo1WVRCV2xwbVYwVGFPcmo3QUVZcTU0bjNBSDhHWis2WUx5eURIMXROOVZs?=
 =?utf-8?B?VkpjMUFSZDVEWmNXODB5Z09YS2IveHZEeFFjaWVRVEw1OWtMN3k2ZkpqNDhS?=
 =?utf-8?B?cUh3bUlrQWFybE5hZ0M4czlrZEdxOGZtNFF0NUNKYXFLUEFVbnAxQU5HOVYw?=
 =?utf-8?B?UUttMm9MbUpsSXU2aURRU3JBd2Z0T0FXVkd3c1VWeTRJWjRQcXdMaFJyR1E1?=
 =?utf-8?B?TGVZY1F0Tm5wN2FyNHRNaGMwajNSeE5POHNnQ2J0Sy96cEh2U29BN1c3UTc0?=
 =?utf-8?Q?6QMkq7isH1+4Uu9mwHIXKk/bR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f9edf70-c64c-4b1d-3ed2-08de185d233f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 09:09:03.7510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qjG+Ol81TP0icntn50XhOY/L0WreleeRnfL9BlOhjugGSOCMbZ0D6IqL5No+Q2baKlwIkSX6LYWxyvyewV32MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11495

Refactor imx_dsp_attach_pm_domains() to use devm_pm_domain_attach_list()
directly, removing manual detach logic and simplifying resource management.

Also replace verbose error handling in imx_dsp_rproc_probe() with
dev_err_probe() for cleaner and more consistent error reporting.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 6e78a01755c7bdc28cd93f00fe6f74affc3d96b0..c466363debbebe8f91b908b3bffaa32e9bf8b9a6 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -1062,14 +1062,12 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
 static int imx_dsp_attach_pm_domains(struct imx_dsp_rproc *priv)
 {
 	struct device *dev = priv->rproc->dev.parent;
-	int ret;
 
 	/* A single PM domain is already attached. */
 	if (dev->pm_domain)
 		return 0;
 
-	ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
-	return ret < 0 ? ret : 0;
+	return devm_pm_domain_attach_list(dev, NULL, &priv->pd_list);
 }
 
 /**
@@ -1186,35 +1184,25 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
 
 	/* There are multiple power domains required by DSP on some platform */
 	ret = imx_dsp_attach_pm_domains(priv);
-	if (ret) {
-		dev_err(dev, "failed on imx_dsp_attach_pm_domains\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed on imx_dsp_attach_pm_domains\n");
+
 	/* Get clocks */
 	ret = imx_dsp_rproc_clk_get(priv);
-	if (ret) {
-		dev_err(dev, "failed on imx_dsp_rproc_clk_get\n");
-		goto err_detach_domains;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed on imx_dsp_rproc_clk_get\n");
 
 	init_completion(&priv->pm_comp);
 	rproc->auto_boot = false;
 	ret = rproc_add(rproc);
-	if (ret) {
-		dev_err(dev, "rproc_add failed\n");
-		goto err_detach_domains;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "rproc_add failed\n");
 
 	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
 
 	pm_runtime_enable(dev);
 
 	return 0;
-
-err_detach_domains:
-	dev_pm_domain_detach_list(priv->pd_list);
-
-	return ret;
 }
 
 static void imx_dsp_rproc_remove(struct platform_device *pdev)
@@ -1224,7 +1212,6 @@ static void imx_dsp_rproc_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	rproc_del(rproc);
-	dev_pm_domain_detach_list(priv->pd_list);
 }
 
 /* pm runtime functions */

-- 
2.37.1

