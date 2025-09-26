Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010052.outbound.protection.outlook.com [52.101.84.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415542EDD44;
	Fri, 26 Sep 2025 12:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758890031; cv=fail; b=CqeLLkFqpWOa7s/ZIuEERHaMcwSHIZj4hyORtR+ADBA2+AGGZ3ACnxbqpDttSsM1ESytwkuObnAbTNsL/L7IIRCKWvx+cETBaps/icBmqhWiErgR/rGPOvXTcw7AC4YTdiVMUoaBQp4Wdq+5sZTfk76O5cNee2kkv33ZvLel1y4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758890031; c=relaxed/simple;
	bh=DWo+F7eXklLy8taAu1Ps4GKjzVE10wW8RHF+0r9U11g=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=b4iG42ixrfphe/dfE1awuuoCC3fYnqZp9DJrXOFAIJJ6QhLhR4zRZUCNXLLnmMkXmPajD1hFTQFd/5LsQXKfi524+qjFzC5BkuQzD7gkTRD1iABcLEtdg+wFXhdU6EqO0vocP43o1aEgd1rODvODq4UUp5bs1J0o2k9lI14hltM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MzhKyAN7; arc=fail smtp.client-ip=52.101.84.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MzhKyAN7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GRN39ev/MAewZ9gKI1IBCSfaw17jC2/2iE/QCntECJ0YDdbXzNLoKGMnU/lbsEGMLLjiCYEAZCVIwkK7TocGNjszmRcYllxOtConQCKK9THjJuDrXGSgJctHHP4+Q5CyUr6f9UNclpj0pcWyfwiyZbJqKDT6OoI2K9lRfev4YNMi/IHp/35g9we2O6cZG3Ypo8PU9wE6O7MnhjCzu+Kb3YeyyjXPR302yhJxwLgsa8Crz3Lado6m9PjPe0ZJt6lZtSAjuzWzvd9bUWADtLK8xZDRuBl6DAtgoUWDsxVjwC1Pzbkby5tZKp7YUaXAexyG5jYBq/K7sBs/ID9jRNBY9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XKFbKc/q+tHJVO8SxloqO4qgJzHGKoTOydIrsIqaA4U=;
 b=SJjDxXBjhzdzzd7VtwYeevpggBh5iF2Bp8Bl4AwnA0CQAElv+yghwHgdgr1NVpUpoaJsIJSiwlUyztyBeVed8dtox6w88bmdtjW9XyFumU2FxDALescalM3ii/sobRMDoYrtW7i6fr5G1UqUzLVnaT7Sf1+NbPEVbpe7IOibTBwEqS5TxjiT0E2yB/lR9vKxh+x+NLbIIsRQz+GokcCLf1UubNjNXN4V3t7v3z9TcFrNri9JRHUutXAfYQ63cXrz3k1rf5nWSnuYeWaQRIaMJD4XEtqbz7kXv5wplRQOBTofPZeRzMrKIwTiW1wnnlj5hxekXTZoBTL6Lc50nSZDOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKFbKc/q+tHJVO8SxloqO4qgJzHGKoTOydIrsIqaA4U=;
 b=MzhKyAN7PZGbfWO/IeJLTjDhZ7hAiIELLRaSikOIkS5itI5zexC/DTahXIPP0obEYr1tFGTZc5T6cfMaQOYeDx1iPvA9BJ+BKk8KIkO+MQ/jxPx1mvUzU7FWyuTuMBW4mBM4XlvXy9DZz4Bj3ob/C/FdbORukmGmeQ/8jxdb5V+aLc6/HaQYzqTO/bY12h8vjANb+2Jsq+500fdEFMB0niworP1DFrU68eerao0fMedVNmbZIxwNy6WZivi8gBqt8cuSBywJGMs0IzFao9/QXERY7mVQSF2mjTiTaNUNMA76j3hoGzUtu5RSonG9PqZM2FBX1VG13ktAHYtujZQvPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB9646.eurprd04.prod.outlook.com (2603:10a6:10:30a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.13; Fri, 26 Sep
 2025 12:33:47 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 12:33:47 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 26 Sep 2025 20:33:16 +0800
Subject: [PATCH v3 2/6] remoteproc: imx_rproc: Use
 devm_add_action_or_reset() for workqueue cleanup
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-imx_rproc_v3-v3-2-4c0ec279cc5f@nxp.com>
References: <20250926-imx_rproc_v3-v3-0-4c0ec279cc5f@nxp.com>
In-Reply-To: <20250926-imx_rproc_v3-v3-0-4c0ec279cc5f@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Hiago De Franco <hiago.franco@toradex.com>, Frank Li <Frank.Li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758890010; l=2199;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=DWo+F7eXklLy8taAu1Ps4GKjzVE10wW8RHF+0r9U11g=;
 b=7mbAE6ce0u+8sFK9WWdoJVpjPG1uu8aQFemAn4Wg9LIgEz6EN0LSanocenpUIa3t22bgPi4h6
 doWbyuEBYA/CfD2gUi53PGzEDDhxv/2zsso5ivTJDD8RmONO04b9B/+
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR03CA0115.apcprd03.prod.outlook.com
 (2603:1096:4:91::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB9646:EE_
X-MS-Office365-Filtering-Correlation-Id: b1cac4fc-cc8a-42f7-a8b7-08ddfcf8f080
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rlk1L0FzTXN3WDFDcFBkNnlSS25vc0hyZEs2aWZMSEQ2S3ZiZ3BkbzdxTGhN?=
 =?utf-8?B?aWhZRXZpdFNJYjlkWHI2dFlyQU5CMVBwNUJLOUxBMitKK3JhOFBuYk9hWjNI?=
 =?utf-8?B?R3pwT1VjYnJKMnBGVmdkZGszcVNVRjdQRUdJdVlVOFRKTVpVYmc3NzBCNjg5?=
 =?utf-8?B?ZXN2TXhJMXV0VXpyZ2NMMVFlS3F2dHlXaGlBMUZZZXoxL3kxd0F0bFdEV2JC?=
 =?utf-8?B?VWpMdlVwd1ZLbEROeFRpeWMwTDFMNDRtNElobGZObmo5b3luOSsrTlpvOHlS?=
 =?utf-8?B?Z0krR1RnRi9hV0xxUHEwL09jRVc2TzY4cE44cHBHM0NqVEJVWmhhNTRuQkYz?=
 =?utf-8?B?b2hPZnZQZmFqMG1ncm95QzFFQWdDUXYvZVowZVp2WEZaSHVud0U4SHBaaTlq?=
 =?utf-8?B?SVk5WkdhS1V1RzNsRUtqY0k4anQwSXMxMTRGZEJwZ3lOOC9DOUF6NVdZWDJ2?=
 =?utf-8?B?UUJEeWVnSkpqOGRjMXVzNkRUdVhGYzFaZStiY3hCMzRvVEFpM3N3b3k3VmFB?=
 =?utf-8?B?SFFhS0xhbVVVaXRwSm9NaE5JYjFyQjZXZjd5OGdGaDFYQWJCRXd3eURLYWQz?=
 =?utf-8?B?MTJuS29Ha3ZOcFE5TENKVFZ1ZUI3QWVEYk81ZGNnbkZFaVRZU0tPejlzM1dt?=
 =?utf-8?B?aHV2V0NDVXRxcGdwdmRLbDBlYTd4ZTBVdmtHRHdxU3ZNL2FKcHpGdlFaMW4y?=
 =?utf-8?B?OVRLbDhWQjduNDRtaXZDY042NmcvcHlwZ2dDUHNJeWhTbWZLMy9RbmljendC?=
 =?utf-8?B?VG50WVM5SFBnei9NMDFjMkZnamN3dmlCdmQ0eXdPWGd3TXZFL3ZSc3ptT2wz?=
 =?utf-8?B?SGNEWEx6L0dnOXIySWtjWFE0cktrc0RQSzlZZUNFdXdVbnpnV01OUWNBMHVZ?=
 =?utf-8?B?YnpqNFp2V1FNbWZqR1JDMkxZUllQOVcwQzdRK1R1eEpPUnJUbkVKaTQzUFYr?=
 =?utf-8?B?UXZ5eEU0MEYrSVhoOFB4ZzhDODUzREIwcEw1amdLYlJLRlBQaEZQaFhRLzNL?=
 =?utf-8?B?OTU5VFpRSWhId0UzRmFSc08rcFVaL1FJVXhEL2lKUDNvckZGc1NiQ1JOSEg5?=
 =?utf-8?B?S3RnVzB4ZW9Ob3NGRnRhRmhKU1UxZDl6QWZhSG5nMUZ3L2FZWExzUGxZR1R4?=
 =?utf-8?B?TzVERWNncytqOEluWWUxd0NDVklaYnZkb28ra0syZzNVelB5TzI5Y0RXaytL?=
 =?utf-8?B?NWxqRWRFOGFVdnNMUitvUVY2Y2dhNGpNZk44bFoxUVJwbHNLbWw2SUxEY296?=
 =?utf-8?B?QkZ6MW84b0E4aWtzS09Id1k3Zmk4S1JFaVFnMzN5aVdWVThnM0doNXlJaG1v?=
 =?utf-8?B?L0t5Ym10Y055UStuZWp4TXpVMk5rVllxbTdxdEdZUDR5bVhBK3VkbmdXZ2tt?=
 =?utf-8?B?bkVyOUFiYkFlVVdDM29PSWx0b2s1Y2t0cjlhTCtIK0tYeWN3UVo3bUcyV2NZ?=
 =?utf-8?B?TnVJN3pFcU52WCsrclRRb1Y0QlA5Wm8rc0lpdXZ2TnFPTnN2TzBrYmZmVEhW?=
 =?utf-8?B?SVl1NVZsQm9Ramo2WTRZV3kxQXJvWnNzblkrY09uRWZTanZ6NGgzbG02djJR?=
 =?utf-8?B?NDRKNFlYYUc4c0dnZDVPQ3l2Qlg0cjIxK01aSXhROXAvZDdmK3hBVXRuYk50?=
 =?utf-8?B?elpGWm1nQXorbzZUTnVrLzlHOVB2ajZmNXEza3hEVGc1VUowdGRaRVRGV25R?=
 =?utf-8?B?L3dwQTNIKzgrZWNPemV6RC92aWlXQ3FabzVMMXVDaWNraXQxVzcyUUR6NTZM?=
 =?utf-8?B?MnlFRlJlQ0hIZTlSRjBtdjR2NTZhZ1dQNmhuS2w1MG5LM0k0ZDhuUTk4YjJw?=
 =?utf-8?B?T3I5VS9vb1hCWjJibjdCRkhzUUdMeGhzVnVTS09CQ1VuOHhsWm1wMHplVUU3?=
 =?utf-8?B?dGxON3N6VGhSK05Fa3VleEczTjVmQStGWUtqWDhXcWROSFRCVmV0WVZpd29Q?=
 =?utf-8?B?SDhTSW1EZGh3czlBL1pSWEJZSXpQcUFsSy85aytFZW9BaGVCV21rdVJ6SVNr?=
 =?utf-8?B?N25kWWxPMmpNZmkwVzhQeHFzYzkrQml6UHRxNG4rUXdjdUdKRG9QMW9uaWdG?=
 =?utf-8?B?cDhHZ1hTQ3NCd0I3N2UvcWFrRVY1alUwakd5Zz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y29OUmRLZ2pqT0l5T1ovOGd4cnhHWjJyZ0Z4WXZPZFNaSENMakVDKzR1by9z?=
 =?utf-8?B?R0ZMbWNPTCtlTlM4aVdESElSRVoxR2FwTmI3bVphZXZIOTlxc1M1YStwaXVP?=
 =?utf-8?B?Qy9XTmhLbFVIVHIwN0FvSlI3QVlETi9PWXc2WVpFUTFFMDlKQVdoQ25VQmFI?=
 =?utf-8?B?WWUrVVk0ZmVVL3pxZWpxT2dYbkh0ajF0Z3dxWEpCL1VoOEJnOWZaQ1ZDeUhP?=
 =?utf-8?B?U2V5SGRpaEtYb1I5aXozWDlCdklVc1FnRUdkRS94ekMyQWswSndYekk1Nyty?=
 =?utf-8?B?VHV6aVE5Z2xReFpKUDA3QitQUkhBL3lIQ2NHdnU4TEZWMFE5YTNzNWdnWlBu?=
 =?utf-8?B?TjZNa1dvd3UydjV4cnNQUDlGTjVZOFdUdW5GQzBWR3FtY2pCUEllc2dHOVR6?=
 =?utf-8?B?bjRSWlpSQXNxVXppcjdQQnlzenNFOVZHWDNadmpQQnBLZk1iWCtrTWtlNUg3?=
 =?utf-8?B?OHQ1VDRmd3FwZm9IRVZUeGRrMkxZYno0V053M0J4bWtITTZRcXB5YVZnMDhF?=
 =?utf-8?B?TnY4ejdpTVlkUEg4VEM3VWNCdkxCb0dOZk9CWmNzYktraERITk9xVUw1OHJQ?=
 =?utf-8?B?MVFweDZUdndpQm1NS0psWnNpaUVDa3NWbWlIL0hqNW94QlNhdGxUQnAwY2pl?=
 =?utf-8?B?NWFVK2pTWk85WFVQKytBQ1ZhYTBGeG9xdnZTMEdrM1RWM2tOV0oycEVUNmVF?=
 =?utf-8?B?UEVzK0NBUjJMWGZrUmJoOXV6aExxdnFCdEVreDU3YjlVK2xVQ3pjeTJoUEV2?=
 =?utf-8?B?clFTYWtwMlRadStwUm56TjA0eW55VXRpQm1DR2NpN1VPMlV6d2RrMENIRWhK?=
 =?utf-8?B?SFQ2NFJpa0dpYmdpalJEUWhvdmxyRUxzRTJUQUp2L2tqbGRJZ1EzWVU4d2Qy?=
 =?utf-8?B?OUhNcjBmb1Rwekt1aitBTVZ3NDVGWVlOMysxVFZUMXVDNW1tWHlvZ1lpUFd6?=
 =?utf-8?B?cEh1SitpdTZBUDYveGJIbFFJeDVXMno4cnlRbXJ1eEVVbWFPOEhsazREQmhL?=
 =?utf-8?B?SExudmFKOHFiOVc5R1E3bWd3QWFmYnZvUk5xZmM2ZE5tS1p6b3FSRmlmdW41?=
 =?utf-8?B?anJPS09FS3VXb1kvaktibVFodkNzZG1NOVJzSXNFb1pLVTUzdG1wQzRoYi9V?=
 =?utf-8?B?MDVvRTAzdnh5LzhiZGMydklLTGRHMWtieEV2K0NBdmFEeHlPcUcvRTAzSDhx?=
 =?utf-8?B?YnRxSFR2NzM1all3aUNsQ01Uemw0WmpnL0RJOTR0ejk3TDBPQVBTNEk0U2FL?=
 =?utf-8?B?N3QwK3FZclVDTlpMQlVwU2tFOFQ0WEY2a0MyZFo4VU4xenFxNjVCQkVpUW1Q?=
 =?utf-8?B?citTZ1FLM2FEMjB5eU5FcWxOc3JKSGxXV1ZTSDFqdzBRTlcxakZpS3VpRlRu?=
 =?utf-8?B?T2tmdWllekRBMTM5LzRJYmJCb3g2THNaRG9DTG1Rby9DbEI0cHExWUU5MXMr?=
 =?utf-8?B?eUpkUjgySERxeER5czdNVTdCUkF0R2E3aEZoV1plcFBtWHBSSjF3dWNSWjMr?=
 =?utf-8?B?MVU5RVViWjFHV0xiRzh3TlducXdRMVcweVNsQWtjdGYrV203Szl4UXRMRkJz?=
 =?utf-8?B?QlRZaUs3VFZ3RFZGbHN4V1ZaU3JEOEJNTG1IN3lteE16NDU1S21Tc1l2and2?=
 =?utf-8?B?dkgySzk1dDNtanZLT1Z1WVlnUXdTWm5TVXBqRnVHUHdEQTkyMjIrOWpPbDNC?=
 =?utf-8?B?Zi9vazVwcCtCL2djTDQxcys4MkZpb0tzUUFEaFphZUpFN1NyazFYb1BPUDhz?=
 =?utf-8?B?UFFIeFA0dEhMTzZZUVhEVEUyWk9zQlJMNk1VTnlHdWoxcFh4OXlCemRFZ2Jt?=
 =?utf-8?B?ZGFITDBsdGdkVEFldDgyeCtDNUE0U3JmZnhrbkNXSWM1SnRCT3lVRnN6WDFU?=
 =?utf-8?B?NTl1a0h3QjJsa092UlgybkszSWR6OFg1L2J0V2t2VklQTkJjcmFEbXR2WHJX?=
 =?utf-8?B?cHVMWGNvTUlVejAvOTRDd2RQM284V0dySXpjMFJYMkQ2ZkdjY3lqNWxHM1Vl?=
 =?utf-8?B?WVM5ak5ORElKS3FYTnJYdlFyMFRSUU1XSTR5dzVCUjZSV2Vjd21tNFJNWWZj?=
 =?utf-8?B?dHpyaVVIZFJlUlkvVEg2dCtMNkwxSmxPcDgza2x6VU9NdXJlZHkwbXRMZzNC?=
 =?utf-8?Q?hMMAoqh/htIwKKz9lCkIpLiA0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1cac4fc-cc8a-42f7-a8b7-08ddfcf8f080
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 12:33:47.5387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PFyS1n/pb5nu0NAvYa/i6Fdpp6CCN1pKjgSjYB81aRd4W2DfKh62qKYrr2jXPRUKaN+5NOnJnNR8xdLN9c/kdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9646

Replace manual destroy_workqueue() calls in error and remove paths with a
devm_add_action_or_reset() helper. Ensure the workqueue is properly
cleaned up with the device lifecycle, and simplify error handling in probe
by removing now-unnecessary labels and cleanup steps.

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 8424e6ea5569b9ba6b07525643ce795faaeb2898..9c44ce56f1ab044ca5dccfeb0aaa0f7cd810aab1 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1046,6 +1046,13 @@ static int imx_rproc_sys_off_handler(struct sys_off_data *data)
 	return NOTIFY_DONE;
 }
 
+static void imx_rproc_destroy_workqueue(void *data)
+{
+	struct workqueue_struct *workqueue = data;
+
+	destroy_workqueue(workqueue);
+}
+
 static int imx_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1077,11 +1084,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
+	ret = devm_add_action_or_reset(dev, imx_rproc_destroy_workqueue, priv->workqueue);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add devm destroy workqueue action\n");
+
 	INIT_WORK(&priv->rproc_work, imx_rproc_vq_work);
 
 	ret = imx_rproc_xtr_mbox_init(rproc, true);
 	if (ret)
-		goto err_put_wkq;
+		return ret;
 
 	ret = imx_rproc_addr_init(priv, pdev);
 	if (ret) {
@@ -1152,8 +1163,6 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	imx_rproc_put_scu(rproc);
 err_put_mbox:
 	imx_rproc_free_mbox(rproc);
-err_put_wkq:
-	destroy_workqueue(priv->workqueue);
 
 	return ret;
 }
@@ -1171,7 +1180,6 @@ static void imx_rproc_remove(struct platform_device *pdev)
 	rproc_del(rproc);
 	imx_rproc_put_scu(rproc);
 	imx_rproc_free_mbox(rproc);
-	destroy_workqueue(priv->workqueue);
 }
 
 static const struct imx_rproc_plat_ops imx_rproc_ops_arm_smc = {

-- 
2.37.1

