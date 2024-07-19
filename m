Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012039.outbound.protection.outlook.com [52.101.66.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ABD208BA;
	Fri, 19 Jul 2024 08:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721377645; cv=fail; b=XLdND3K+CAkZcPVATqqadsw3MEX0F+9E46w6bukpxU6oagIAGsndeLO13ph4kmnMzvSUs9tdAbClspDVUfl0f83d6a7RnEPn1MDFsIBtZBnG/QvHQ3YI10epYSZEUkmQtV8oBd6VLkqRLWIeJ62Ut/3Afzq6F3ralnxjCl/8Pf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721377645; c=relaxed/simple;
	bh=dVK3fvGuX5nK99e+OKbLute9nqlUuvlfHp7mS0PGmIM=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=KXXAkt7exZmpbzv/kcItkF7ng6Y8R/wCgEKE/2nhh2y+z3riap0oveFr7hTJ2YytwiMCQEwxYGU1M7C+d/GPeLDou9i9R0Dh/SYFWTto4btiCtELk9lpi7Z07U27CNbh0Rxob35sOIpGvtZn/9GwAe8fqAZH+pSR/ILaNhzBhfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SbeGHXgn; arc=fail smtp.client-ip=52.101.66.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SbeGHXgn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c3/gk7p/OitmDIj0lPRQ0HemZBYeE+0XE0bInO8L4Lv2Dtg9hPYfYtQB/6KP9QRxEOgdF8ENnxyU/9XsU1VeGOofX8AIaZOrNW+DOE45dFruOgEPwwDPGWNuygnq8BSh/yIXCcn32U3blz5D9aAM6/p3vdfsWmFE7WL3NE++YP9l9bG1yHRTn27HwIoZBdD0isveHAvuzMZoJWQOJ90kYwokIsLPCDUXSWR2GlP5eVdTAZRvLQSOLWEQVUyB5sf10EulIDG/6i+X/Watl3spfRFmDyO5W5eeXzogxOw8aYVeyCcblVhbUjGLMDLeH3+jP1+BsBwduPnWXQE8kbddRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gBQoesDgGB23iJGurQAR8i0YMmxObfc9IgbKCpkb6hc=;
 b=dZM2DroFoDI3FiBDU47T3uvgD/OXiFaiAAdhC/t74cL619WHiKJyFBTem36578pyPzEPRc9wxsqKV0556xrz/tGl0vEzP/mQuaM+bBu2Q1yZpsOPT9lUU8k4I5aGdl40GtMlhKHaUczBQc2okaslS+8CPZH5989Ekd7LMLxz176OuBPyQnCAeVVVCDrvKh1FWYzLOF7hdPHWmUX+C3ZiSTfTzx+ffkElxIvUpi3ptOD1/jAo1FNN/Qid0ybJ9lZYZU5L4CiNyi7ZkBINtSyGLhNVkzZ8TXT0cJyFARMcS6dNxSTrJV/+fE6QcHUx40XD7hXy35ItJMZSaWUQYc52IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gBQoesDgGB23iJGurQAR8i0YMmxObfc9IgbKCpkb6hc=;
 b=SbeGHXgnaGl17osd5a93ADWLV8ISd/hdPMhY74cfX804+ngL+agvO2MjCICAcW2jkLSl0sY0sgceTvrDrVhfNl7gRQagZ0jFAVuV7aRU3ZXueuqUwdVLOAfA3UwcDV/Ol2ioRKA+1xtA+07fquFKDKnShn5vUXUWAiP9iloXifg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10993.eurprd04.prod.outlook.com (2603:10a6:150:226::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.31; Fri, 19 Jul
 2024 08:27:18 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7762.020; Fri, 19 Jul 2024
 08:27:18 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v2 0/4] remoteproc: imx_rproc: various patches for misc
Date: Fri, 19 Jul 2024 16:36:10 +0800
Message-Id: <20240719-imx_rproc-v2-0-10d0268c7eb1@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHolmmYC/23MQQ7CIBCF4as0sxYDg0jjynuYxrQU7CwKBAypa
 bi72LXL/+Xl2yHbRDbDrdsh2UKZgm+Bpw7MMvqXZTS3BuR44Vogo3V7ppiCYaicHCetpFE9tH9
 M1tF2WI+h9UL5HdLnoIv4rf+UIhhnejLuqiXOEvu73+LZhBWGWusX5MM1m6AAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>, Marek Vasut <marex@denx.de>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Terry Lv <terry.lv@nxp.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721378185; l=1334;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=dVK3fvGuX5nK99e+OKbLute9nqlUuvlfHp7mS0PGmIM=;
 b=ZCKaH7u3y2wUu6OfOZg1mMFSjOmMUq0g3zuHQ7qzgIQqPHMaXlIsy13iWnVqPc4OJVnltEOBd
 vqqMeMZlESVB2FGZ86N9vObGccS0aob17r8q+UFefT3MejiWtve+1gL
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR06CA0232.apcprd06.prod.outlook.com
 (2603:1096:4:ac::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB10993:EE_
X-MS-Office365-Filtering-Correlation-Id: b588fb0e-a922-4727-a130-08dca7cc9a0d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZkJTQ0QwcWw0REpTNUhUL2VES2pTNFlzOVFPUVp1VFlFdm92WjMxWFdjeHA0?=
 =?utf-8?B?VG9pdGRxblFvQVkzMC9DdDNjenJmMC9va1VYbjU3NWM4S0V6YW5Wa292Um9v?=
 =?utf-8?B?Q0ptc3hKWHNjRGdQRjYyMzVKQXV2TkJNMVoxTjV6SGNXNndhWVRwNzdrQ29K?=
 =?utf-8?B?L0dUeU5OU1QzZnR2L3FHTkpQUmZzSmtscnZPd0tDbXpsMys5eGxLbUlBU2Nh?=
 =?utf-8?B?YlFNZ2dySE1xSGhLdkdRbTJZc0U5QStRK1B3NWR4TFNEdmdkVTNKSnhTM2or?=
 =?utf-8?B?empxM1ZmQmUzVEtxM2F6Qjl4RHVsb2FSbHZpY0QvM1NXamo3ekFndUExTHRU?=
 =?utf-8?B?anJGNFBtVFQ1RXBaVzdFN1VHd3NXRERrTXJ0M0sxV0RzQmFyZ2lWTXdsWEow?=
 =?utf-8?B?UXdtaVNTU2QxNkZaR0VRVWJ2Q0VTREtaNW9DTXN6TUs5ZWdDbml6SmU3Lzdl?=
 =?utf-8?B?Ykw1QkN2WXN4VnFsTFd0Y0ROR21tSUdqMjRJQ2J3QnBEenhTNDlzaCtaVkww?=
 =?utf-8?B?bGFQTTAvaE8rakdYcU9kelZ1N2dHdWhIanpObWZBM1J5bmdYNGdEd1drTzBr?=
 =?utf-8?B?YTRZdGFwd1Q1c2IyMmFyR0tteTE5TEo0UG9Qb2dYNnl5Sy8zN3lXam5VM1FZ?=
 =?utf-8?B?Ynp2ZmZvaGRCaXgzQmJIYlVPNFhFaThIV3h5Ykkyb3RUeFRWYnVaYktQMFFH?=
 =?utf-8?B?NUc1cmVVV3VINm9EU0wyYW5ZYlNBUFowbS9SUWF1cVZVWGxXaS9xZzNwZHZk?=
 =?utf-8?B?aE5IUUJTRFZjNnRLUTFBWHZ5OC9lRjJyTXk4R1ZkUzlDbE1lenNNZjJHOElG?=
 =?utf-8?B?RUsydFZPWktpSTB4bjZQbUV2UXorOU5DWUZGQ3FVMENBVEVDNXRiOXlQMG9a?=
 =?utf-8?B?c3l1aEZBM1lNVDhSQi9FM3dRRWF1UzdDYWNGOUZzdkZwdUp1TzQ4VndRY1dG?=
 =?utf-8?B?OURnTDB2MGMxd2RNN1hEK29YdjFycFc5K09RMWlnamVHZExFc1EyenI1WXBj?=
 =?utf-8?B?cTFaWElSakRWMmVJcWt1VUsvN3VhTjUxSlFuSzZMVENhM0RaTGl0SHRCWUd2?=
 =?utf-8?B?Q2czcFNrcWZsdHM2ODhJc3lyaU14c01jWU5TZ2FIK0syNXUrMXd3dGhOR0t2?=
 =?utf-8?B?L0xZV2lUM3dSS3ZjNFZrMWJoWGJacHRsYUdvM0IyNHJ0NHY5ZUhwWTFjT3hU?=
 =?utf-8?B?NHVnR0NqSzBjUlFaV0J2d3BrSFlEVFplYzl4YXhacm5ROWhldTErRUcvM0ha?=
 =?utf-8?B?SmRMc0toMjBmQ3J2L1NPSWJXcmpNajN3OXowRWp1S01pOHZva1RUT216dCtZ?=
 =?utf-8?B?dTgwa2MyQW5NdXprVVJFaTRFajQyN2NsZGZ5SXp3NGFSay9FeUgyVlBKbElx?=
 =?utf-8?B?UUR5eVdnUWVzQXVNNXcxNWN3ZWhGQUhWbkRBUEoxdUZTMytGQ0x4RStnY0lt?=
 =?utf-8?B?UWpSbkNzejB2c3F5V0QxVE11N1FFMCtUaEFWcmk4N24wSU92U1lXSTREL0lD?=
 =?utf-8?B?QWV1cExoakU3R0NkMVg4b3lVTHFlNW5SY05HTll2eG1RclNhcnBscXU0RWhT?=
 =?utf-8?B?M0tKNk11MVhHMllKZkNHYjkyZnBFcUhVV0NBdk4wU0NIZ3RhYTBiUVYrd0Jq?=
 =?utf-8?B?dzQzcmRscVBWQUJsVHBubk1tWTVKVmpZeloyYWNsanozMm53Uk0xTnZpNXJZ?=
 =?utf-8?B?SDZmdmhEOTRsV2VSNTE5WWNLOGo5K2xhTXZDVUs2YWcwK3ZwU3hnVjFEKzZT?=
 =?utf-8?B?NHRzQ2k5cTIyRm01eS9QcFhCd3lWOC8ycnl4OUJHaDZFYUU2T2tBbmtNbmJJ?=
 =?utf-8?Q?uKBrjRxdkHe4yFO/EB7WZoMPLqIH5pySw4pE0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXlUT092ZnVYejNNNHNmVEhQQlpEa1lOSmlHMHc5S0EzTHVQa051aXpZdmVm?=
 =?utf-8?B?Ny9SWXVIL2N5YlJmc2U5amVna0w5a3JhVVZQUzNBNGxCTGVMdjZReGRlM3Ri?=
 =?utf-8?B?b2RVNVhvNE9vRzBXYTBKM2xaR21LTWpDZVUzZXpveTJVT2dMbkZiYVlMS24r?=
 =?utf-8?B?TWU3bkxManBXd2poYm4waG8zZ3BTdU5PcHBQM3hEWlZCbnpjdWlZdzh6ZUNL?=
 =?utf-8?B?R2FWVUZBbWpUY0UzVEpYWmhKVWpPWG1PQ0xVMkhhTkdFT0Z5Q1dOWTFFdFl0?=
 =?utf-8?B?VFJDdERpWW14NkNGK0xxaW5oeUd4cVhoeFFaaEFsNUNobko1SkZZa1c5VWdV?=
 =?utf-8?B?azg4VGhaN3BTamsrQkZPZWJKc3ZGZ1ExMWRBYW0xZFBrWWNQUDYzUEJ3aVhv?=
 =?utf-8?B?eEJuUnYwMHB0T3N3VjFtZGRtd1BYbXEzRVdIT1JPNWt6WWxrS0dKcGVRQXRl?=
 =?utf-8?B?ajBCc0prZHI3a1lNdDJYSHFYaEczYk1qVUJNUFhndktlMHZ5NzRHR1R4eVZ6?=
 =?utf-8?B?YXFIN0JuRng2UzZQTXg2TnlycEZteURIMm9sMEJOZlU0d2ZiUTU0b2dPRTgv?=
 =?utf-8?B?a292eTBNTTY1UENKak1FNUZMOE15R3RLUlBseHJnMnFCc2s2cmdXVTJqcDho?=
 =?utf-8?B?LzBpVGVlRHRTNTJyTldkVnBlcWljQXZLVkg0dmpZWWZ2OTVnSW5lTVhGNllj?=
 =?utf-8?B?ZlBOdHJmQW9OaXhneEx0SWlLRGdvZURaMWtzU1FYeXBZNXlBSk5PSkQ5YVlD?=
 =?utf-8?B?V0hmN0k5VEoyZ1F2bnFDaUw5Rzcvc3JoNkpNanNyNUM1bUJnWTkxTDhEQytO?=
 =?utf-8?B?TGQzSUQxMC9QUWhtbUNyaGs4SlZkR0NkZVE5eEFiMEZiaEdwTVQya0Z3VSs1?=
 =?utf-8?B?aDBSaFUySHJidzdBTmxTWjUrRGsyb0ZncjJacDJtOEEwcDliMjJuYkFJS29S?=
 =?utf-8?B?YTlRNXlLdDYvYUJkQUdaMzluanVmVUV4NjNhSUtwVCtEOUlJcmlNMVhIdUJo?=
 =?utf-8?B?STh1UjlHVW9zd1gydFlVOEV2UEhFQnlXM1BvRFhRd3lyVXA2NFd4NHRuWHRk?=
 =?utf-8?B?NzBVNzQ0NUFuZXhBNFhGbUVhcVNjSGhWd1RCamN6YUFrR1pxS3Q5MjdMcS9G?=
 =?utf-8?B?bUFkUXFQMUI1R0Y1RzNvNjNUZVIxdXNJaW9qRkowaFRJOHJwNXorSG5BYW0w?=
 =?utf-8?B?NkNlcE1VUmw5RFhNeUJTNXdYQjlBZ1R6WmUyTDVqNm5hbmdVbXlYbkdhUWZG?=
 =?utf-8?B?azdXcVVxYVN4NXJTbjk3Tm14TXF6VVZabFl6OWJmWG9lU0xUM1RiYWpBYW0z?=
 =?utf-8?B?VnY1TGRwM21wbm4xZzN0a0Fhd1hteEZtcW1hcytySFRLUnVxZWFVZC94SGRS?=
 =?utf-8?B?VUQvS0N0emw0cVNvNFB0a3ZJYVFCeSttN0tlZDdMZlk4MjVNNEJnQmtSUTd4?=
 =?utf-8?B?anE1MFNjWE9aWDM5d3gzRlA2VmhUcXVDM1BWUG1QN3Y3b3NxRDh4T3A3WERz?=
 =?utf-8?B?OVJycG9TdHdZV1FMZGIzUTNmY1c3VlM2NFkyR0ZtYTMzRm9mdFVxR1FWUHBK?=
 =?utf-8?B?NStKdzlSY0tUWGVzTCt2b1BzUWtvVWxvcXBKQllZZkNtR0pWTDNKS2U4RWVX?=
 =?utf-8?B?MjRPRG01OXVEQ1VxUlUxV25VUEVzNlY1MXJBVkIxcnpTVlNOUWtDTzFZQ0Vo?=
 =?utf-8?B?VnVKcmIreGRUdk9zMlNyRU1OeTNReWt1MWxGR2pOaE9QOGFtY215YUVkM3ZG?=
 =?utf-8?B?OUJ4bWE0Zk8zdXFrL2YvTkNZdHd1cVZ3U3NsTGFXbU1Jdk95WWFNcjRSUEJr?=
 =?utf-8?B?bThheTloWUZzN0tSRENWYkFSb0dtSjBNTVpTUmVZVnVybmRydjFUWk8wZnNN?=
 =?utf-8?B?elBIeUlnNjZYbU8wVmpnUHliRlU5VTM1VVIvQUVhdlRhY2EzZmVqSGJ2M1Ra?=
 =?utf-8?B?TzZLcmhmYUhmdUFuTkZzYndvdnFBSEZrbnlLWnpDUk1JNFk1eExIbll2L1V5?=
 =?utf-8?B?STBuR3BsY2VNYXQ5NVkreFlldStldDRMeC9oMW1lK3ZtVDBBQnkyWlNEMEVT?=
 =?utf-8?B?N0RudnU4VVg2N2hGQ1YwdGUzbXZKQVg4WjBSUitYUmF6OTFxa252cUYwYlpk?=
 =?utf-8?Q?1IY1ZXy5rUxiwHs/dY17NEVpq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b588fb0e-a922-4727-a130-08dca7cc9a0d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 08:27:18.2676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KUlhGt+54WD97bybji3+pG1ySZmY13GKBVcwAwWuhQb434ePtJzLkTwxia0ErM21Ro9ls3m7pedLVEzoAol+ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10993

This patchset is to upstream a few patches that in NXP downstream for
quite sometime. For patches directly cherry-picked from NXP downstream,
I keep the R-b tags.

Patch 1 is a minor fix to DDR alias.
Patch 2 was sent out before,
https://patchwork.kernel.org/project/linux-remoteproc/patch/20220111033333.403448-1-peng.fan@oss.nxp.com/#25144792
this is just a resend
Patch 3 is to avoid mu interrupt trigger earlier.
Patch 4 is merge small area to support elf that has large section

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v2:
- Add R-b for patch 1,2,4
- Add Fixes tag for patch 3
- Drop downstream R-b tag
- Drop patch 5,6 which will be in a new patchset for 7ULP
- Link to v1: https://lore.kernel.org/r/20240712-imx_rproc-v1-0-7bcf6732d328@nxp.com

---
Peng Fan (4):
      remoteproc: imx_rproc: correct ddr alias for i.MX8M
      remoteproc: imx_rproc: use imx specific hook for find_loaded_rsc_table
      remoteproc: imx_rproc: initialize workqueue earlier
      remoteproc: imx_rproc: merge TCML/U

 drivers/remoteproc/imx_rproc.c | 37 +++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 16 deletions(-)
---
base-commit: f477dd6eede3ecedc8963478571d99ec3bf3f762
change-id: 20240712-imx_rproc-25f3ab753c58

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

