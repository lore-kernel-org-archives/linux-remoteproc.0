Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010016.outbound.protection.outlook.com [52.101.84.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AA5332EC7;
	Fri, 31 Oct 2025 09:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761901771; cv=fail; b=j7Ue2CPnMN4IMQLhtcQGXmlhBJ4BWi2IEBSwQd4klwyl2jLeY960Gbbdz3wL6zF6Rykk/PW3JKFarFY2QAsH1aMnnHccFjfhELjN4pKrEVjZhsitTG3f2W2eyZmYA7jiyf1eQnHtAHJrJqvChNGHblUG4pOQv+SDlvchK6hOvnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761901771; c=relaxed/simple;
	bh=a5bjtYi1dCgVkA6kJZOKMqe6plO4lSpIcgHrVPzVNAQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fP5EzpVsvBDq7O7Na4Te/bazyEi5HjJcJ+iYZEd9EQpyMkb2F4iQCLYXIr5cxSyTBKbj8lX96rgcnS6HYtVxowt9+07FlOJ3IyoN98IiWpYVQ5TQbInP7audY+aXQh4TZM+hG9b7xdbjzzWVwNukQFHv0f6hg/HLL3E5sn8O2GU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YEreZ6op; arc=fail smtp.client-ip=52.101.84.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YEreZ6op"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UAuX4BGAEBOFgApj8IujHfR0WR3zDEGNQbVT8VaqWd13Yj9C/cttEinHPgpEd6MkdpBmhd7t2MDWv/DCD95e1jOfMRnxsjGDavRYhQag3L6oz+kb3wsO0IesQcQL41nWxvudFxRm+Eh6heFc0Vxzyji4XxuHWI+LrIDVGRK3s8VaYg9Z0h9GF8BQg2s0fIaFxpdIyfKH878rahafqR98B0L/+tpCxS5DCzpNJBXvniF/xW4izMvhzlH3Oh4HbBaaqXsFMugVcKwKx73IwpzXONLUPj9j0PZe/h4UaNsislJSGE/PpNptEd/GvXTiq60Ru6GNnLETFZZKoQfAPEmW3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/JuE3n0WDwBu2eoMypY9OssqVbIsm4+tCSEGcBtdldA=;
 b=yIA18ggO5l5oNz2IcW8nGf7nnFyWHgMJTvAZphp+mJxN09TDC3hoFTtYg91CnJHRdGEVCvoyaRHp6ltg8ip5pnHpIPfuvQ7iDn8xG67ss83mYhwbGwCIhaFz4UgBwO0r7Wm8Ad1ijrYd0siKB1ChIiM9BN6T9GoTifhYjKwSHUUvj7zkYbwG14Fz+DdiuEiOcbF2P83BWMB4sJzK1KSEgffHsPyV6GpmT+hJ6ZZs2CM8YQS9qKIPvmv2CRMEDeMW/FmqiZKvQe+ZKwuNA2wC1l//M+jbXXEJ86xP9jewPFIMDT/wIYwuB1n1RHsQeqINrIK22Ttsw13eSvW/2c1tzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JuE3n0WDwBu2eoMypY9OssqVbIsm4+tCSEGcBtdldA=;
 b=YEreZ6op77biPfowHSeZZPMV3y2o5j3iG6Vc3lpLaEooldN1pgBxbQAGBEnfEo2CPR1+8bORYFJwrB1WmjCzdlOeeC9ahRiN2S5XgfWIBC7WI7hLINUwnOcJCPvAHlIXHoNnZsJUWvzLc88bQS3FoPa6bT1JfCABm+rQiJbRGPF5s0CJYQhlD+RgZjd/+CEEISySBq8Bp9jM52U7Za8BBGF7cT/VDD43QGBtctoI5BUgXZbN/Da9z9rAik3Vczv1Jt0nfxZ7hcW9ip72/WHIAB7fkVcySYk2+s/M4JzTMkivfRpdaOq9Ep0Csa32kRj1CTeoqQyUh55bDeFUOYdt6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8093.eurprd04.prod.outlook.com (2603:10a6:102:1c9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 09:09:27 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 09:09:27 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 31 Oct 2025 17:08:35 +0800
Subject: [PATCH 06/11] remoteproc: imx_dsp_rproc: Use
 start/stop/detect_mode ops from imx_rproc_dcfg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-imx-dsp-2025-10-31-v1-6-282f66f55804@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761901729; l=2356;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=a5bjtYi1dCgVkA6kJZOKMqe6plO4lSpIcgHrVPzVNAQ=;
 b=zJCpJcJ+FtQVU4DlcstNQBboHHHNMC246rrcIU5PfOzkrtdv5FTmF0xGDBcIyCNqwDhaEMeNk
 /12f0AW03aRD8DytgAwAVeaFoOpAJyIDYQyaxbKDVG11dLVlmJJIAC/
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8093:EE_
X-MS-Office365-Filtering-Correlation-Id: d4631155-2123-4c97-1a6d-08de185d311a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S3ZrL3NOYTkxWUpjeXg0cE9WZnk3Qk04WUpuRkd3blpRdjdoR1FkcS9NNGYx?=
 =?utf-8?B?WFVaWFVlQkZvTGM2UTV1RjVrZ29VeSt6U3BOY3NRbnFCQVZSNG5USXJ6ZFlu?=
 =?utf-8?B?WGloVjNGc3hsdFExcktSZWJIZW1oUzlFRVRsK0FFRDBhU1l5a29xNW0zUUlL?=
 =?utf-8?B?THhSY2JNY3RGVUpFajV2QmVYSE1LVGJ1Zmx6MkpIdmt1OW9rc2JYWTJoWi95?=
 =?utf-8?B?anVhdjFWR2pQeHgyYlFPWU5PRDlqa0h1SzJCWW84eTBSMHJ2diswY2Rrd1dD?=
 =?utf-8?B?amNKU0JSQjJZYjIwdGVIclhmb1BaT1RtbUxtbDh2dTVnL0JWdjhPSFdUVjVT?=
 =?utf-8?B?VzA5dUVUVDBBNnNGU3ZBNnNPckZuOEx3N0hwRDdkMS9peHNnK05kUGdYNFhB?=
 =?utf-8?B?M2tTK1pVSEhuRmw2K012a2NWZVJsblZVRTluM3dzZE1USm8weGlLV2pRbzI5?=
 =?utf-8?B?akJ5azZwYTFwaDVWdENvTDVQYVl6THltdVczU0M4RFdmcTByNTJHQS9kbmhB?=
 =?utf-8?B?Y3E2Mm94RjA1azJxR0VMT2ZMWE9TMGZUNDFQWTJKdk9INXcwY0UvT2Q3Tmdz?=
 =?utf-8?B?Vm1MUzFDZkJndlVEQkNSZFNqRVh5S29JbzRSVG0rbGhoNUw1QTVDVnAxbHI5?=
 =?utf-8?B?UUhVTklZd3NRb2ZyZ1dWcEdxL1Y4TVZEb1ZJZGxCUlVWZzJhOHp1aUxJenM5?=
 =?utf-8?B?K29sN1NnZ0tvck5uUzh2VXRMaHhwalFFZFE4UFlKNWFKd3hkWkRyZVA3V1B5?=
 =?utf-8?B?LytZcG5YOHFOeExKVU85OVhic29DZlFYVkg4cFhpMXZ4RHhNbm14RlA0cnE4?=
 =?utf-8?B?bzhzc1Nqb2ZVMEQ3NVgwUlFKNGltRXBMclBicXFQQXlxNU5vT0tPTmpZS1kv?=
 =?utf-8?B?czg4RlMwZ0thSC9TQWhSazk3SkwyVXptS2RtU0hTTFJtOURNYXJRT0F0Q0or?=
 =?utf-8?B?OUc1Smd5U2ZQTHlqelBjVEZCWVJOYjdoMHY4cWgrbmlzcklEc3A3ZG1ERUhL?=
 =?utf-8?B?dHJBM242NEJ6YVdVYlhRTWxuTGJvQjFhUDJmUlZPa1R1LzF3ZkE0YitMQ0Jt?=
 =?utf-8?B?eGhIZElsVFlsWGdZOE10UXNBc1ZrbFhyR0w5THlyR2Y4VEt1Tk56NzJjWXpa?=
 =?utf-8?B?OEFNdjJQT09jUnhERFJibmdRS09wczBMN2g1eFVyOTAxcm1pTzZCaWRVK1lH?=
 =?utf-8?B?Y3k5RmUrYTJOR1JQRit6dytoVVRJRDhZM1VYVkJjeWtPUVVjNjYrWlRoUzdF?=
 =?utf-8?B?Y2kzanZlVTdQMEEvSGlxTHVqbVRyTkxZN1RiRDhXSWFnaXpnWW5iaGxtOFF5?=
 =?utf-8?B?TDlJRjQzc2Z0MlBwV0dCc09mV3ZDUGdFM3lCWmtJdFV2blFrSUg3Rms5WDho?=
 =?utf-8?B?QzhNYkV1UkVjcVpxOFZidWFOU3FrcllwbDJ1RjJoZ0R1TE54NHI1NDB1Q2VV?=
 =?utf-8?B?d3lwLzExZEtzL0NRVXlPRUM0bFpPdEFQQkpkMEl0VzV4dm9OYktXdW04UVBT?=
 =?utf-8?B?Zm1wYnpBR2hDamU2czgzZ3JlRmZkUGREdFJyNnVYcGY2SWhZeEdiR3R6N01S?=
 =?utf-8?B?SzhvMHpZY21oMFk2czk5cjU2K1h0UDVkWHE4TWFUTFVQcTYzWU54UmlJbVFN?=
 =?utf-8?B?eW85SjlPZFpCeW5OVzh4RWgyU3g2NE90SjdHLzhYM0tmNk5KbjZ4YzcxcEVz?=
 =?utf-8?B?TDBKQUFXbFZETWNBUDNLTlgvZmRUSHRPYXVscS9mRVdVR1grMjVmSitaR284?=
 =?utf-8?B?YU43bU9UUHVVbENZd043YXBsNFR1R2Y0WG43aWdNV0xPU3NlNEdLcHRmanhD?=
 =?utf-8?B?SUk5TGNzTkJBcUkvczVIOFV4TnM0Z2dwNVdPbHJRMFpmVTV4QlFjVG16ei9l?=
 =?utf-8?B?Q0pJcVU1SHBMcFlGdFU4TEFnWXhQZCtRZDBCMTZlUnJUTFVSSWlRcDJoVzQv?=
 =?utf-8?B?cTltK0YwbjYyUXhkbFp0MUVFZkxSRWtMZmJwZXpYczk0Uk1XTkZxTUwyaGJm?=
 =?utf-8?B?SWlOODVaRTdvb01Nb1RjQ1Z3V2dnTU4weXpCc2ZyVWMrd0ttSUI3Q0FEZlJW?=
 =?utf-8?B?Tk5lVEpxNWxMc3JPUnVjMzk5djJtREhrVG1TZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDBTdkw3bnNKcFk0b1BBUzcvR1hKc2pyWEVFbld1bWcvZG1aMjg2S1VYMlo2?=
 =?utf-8?B?ZnNkZElxc1NWNTVDZ3JydDlVbWlFL2l3MVhqUEV5MGhyTDFWeklicnRoUkc3?=
 =?utf-8?B?bW8xYXM4RTJ6aXdtc2xLNTlMdXZUSnJCVGxjeDg2L1pIWUkxWXo3NFZHMmds?=
 =?utf-8?B?bXJQS3dVa1JYT3k0V3pGbVE1ZWF1V05JQXpjQ0xuV3NmMXI4SXdDSWE3cGw4?=
 =?utf-8?B?OW5Vekx2VEpxVEIrbEFHOTEvU3BLS1VzVXY5ZGY5K09vOUZLQy81SzVRcFhM?=
 =?utf-8?B?WUdkL2Q2YkNJdzdsaUwreStTRzI4aDNWcjhacUE1aXd3dCtsY1BSTk1DaExu?=
 =?utf-8?B?UktOTk1ncVZrOFJnSDFrYXlod2Y0SC9lUERWek1nMTZSK2syZFlzR2tQWlhi?=
 =?utf-8?B?MXVXNDhML0NtVmtrRVlMZ1pNZ3Z6K1B5aGFrcTRVeTJJMUwxM2hablR1RHBS?=
 =?utf-8?B?R0hMUG5BOUpkWWVMcFMrY01JUXhkT2ZQK2xmcndWbmNHMUd4dE1nY0VDQmpT?=
 =?utf-8?B?S3Z2U2NDck5lQVY2R2RuRmtRdVlqSGVMSGswNXVtdk5aRm9ndlAyL2MzMkRh?=
 =?utf-8?B?QUJhOG14eFpvdGNIeWNsaGx5S25RZ2FTVWJkWGJqQ25yVmVERE1HVER4bzdp?=
 =?utf-8?B?bDZsUWNEN25KR3dQOThrTFcrSTZIazVZZHhHTWNOUHkvVHppczFIOXBsMEU5?=
 =?utf-8?B?RmwrRkRnSEF2RHAyT0EycFNDbVRKbmM5VCtXeURGb0JQSkNZK0IvTEZJSFh4?=
 =?utf-8?B?Y2F2Z2VDaFFhOUh6MGxvdzJ0K0xDOWxDOEYxQlZlR3NwcHc1Y0ZDV0hQZzRa?=
 =?utf-8?B?enhyMU01SHlGakljN0I3YlN3eWl6dVh4czJudXRWejZEc2tiYTFsalI3RVlC?=
 =?utf-8?B?WXA4U1R5YnFmQnh6MTRDRHVSUHZmNy9XYTd4OW1halNrWWxzeXVpZnB1WkZE?=
 =?utf-8?B?LzJqOGRDMjFPOVhqTG9wbHdPdnVVTTBqVHJMNTBJOVpaOWdsTUw0Tk1IeUVz?=
 =?utf-8?B?SUFIamgvYnlvOG15MElpYjMxMndjUnpTWTQ3WEIxZWo0K29ERlRNakM5VU8z?=
 =?utf-8?B?THpvTjB5d0U0bmVhWHhoY1F6c3J4T1BBYnlmaXhWR0t1c1JCYTdPVkc4R3Np?=
 =?utf-8?B?Rm5rbXFKa0hPdGcxaHdHOGNrWUdEWGtqSVk3dHZjKzM4VVUzZHoycVRQQ1BU?=
 =?utf-8?B?bjZtZXZCSmhaUjhpV01oL1VyRS9ubDNBbEgyb1o1RjdQV0ZLK1MzWWN5VzF3?=
 =?utf-8?B?eCtnS21BdkRCRE9SWVptNVJuOFI0bTB6VVVXMEZmbTNYalAvN1oxNWFBK2pX?=
 =?utf-8?B?Tmw4R2tXck9TTzd4WjJoZ0ZEWWV2ZjhMQkpsWVpKZHlKY3lReUhKdS9OTkVk?=
 =?utf-8?B?cnhZc1k3RkZmRUFhQnA2d2E1alpUTEJGZ2tLYmRMU1lqTnpEcUQ3ZUJkTWZV?=
 =?utf-8?B?eVdyTitPQjJhMXB1TDRScGhxY0loa1dCWTZnL3RlN3BwVjJSWUtvVlJiUkl2?=
 =?utf-8?B?VzZUZ1RBMGhYaHdrMVpra1hpMkxSVjcyL2g1ZEpFZkNWcnRNV1g3czJTb0ho?=
 =?utf-8?B?dDJmYkMvTVVFMFFTQ0kwWWtnUWlhbnVUVmdxcURKU0M0RXZUNVVVc0J5V3NW?=
 =?utf-8?B?ZmpCWTdvWWpDRWlTbnNtS0Q2OVZMenVYTGsrWXpkbmdoTVJsU051NEhwMGI3?=
 =?utf-8?B?Q1Q4aU5DOFlsOXVqdytBTEp2bFFrZXZncVlXRnUxN3NLZUlOZFZacTQ1UVB3?=
 =?utf-8?B?UjR0OVhycFF2ekt0ZGtUa2hBeEtpOSs2TXFkK0Z4Z3JPY01VNTFCS0JsTnNi?=
 =?utf-8?B?S2RkdUZ5RXgzSkd6UnNUdWhZUlg1MXpVc1hYQmJvK1UyVXRCNEFQdXg0dmlD?=
 =?utf-8?B?VUZWczF2Wnd4YjJCV1ZZZjZoMFY5ZDdwOGlQcVByTUk2Rm1YM3ByVE5WbVZx?=
 =?utf-8?B?aDN1czAzRTdxQ3dFeCtvdE1sTXQ3VUpaS3JNVXBRZFR0Z1diUlYyeTNDK21L?=
 =?utf-8?B?WlRxeG9nakZnNUdkRkVNZ01oanprT0wyMUYvRzlKb1dkcEhvTkJMa3JHZ05j?=
 =?utf-8?B?dFFiUUlZSFMveUtsR0czYUc5REwyandoSHpmdG50Um5ldWpmcFhPazJ5UFpz?=
 =?utf-8?Q?Y07f6XyvsE5YXOBbwXxA+HcaL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4631155-2123-4c97-1a6d-08de185d311a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 09:09:26.9982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HFAbpzmrTE4Gw2leFoFbKpacpj5LoLhmIAtDb+awQYScr2Hyd4xVDLLnEG3IZvZvtsXjByvqBn9Gl85kR2Pmrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8093

Allow each platform to provide its own implementation of start/stop/
detect_mode operations, and prepare to eliminate the need for multiple
switch-case statements.

Improve code readability and maintainability by encapsulating
platform-specific behavior.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 1726aaa1eafb9ac1a913e3e2caea73801b86dc09..833b1bd4019614157f0bedf09bd348caab802eef 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -404,6 +404,11 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
 	struct device *dev = rproc->dev.parent;
 	int ret;
 
+	if (dcfg->ops && dcfg->ops->start) {
+		ret = dcfg->ops->start(rproc);
+		goto start_ret;
+	}
+
 	switch (dcfg->method) {
 	case IMX_RPROC_MMIO:
 		ret = regmap_update_bits(priv->regmap,
@@ -424,6 +429,7 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
 		return -EOPNOTSUPP;
 	}
 
+start_ret:
 	if (ret)
 		dev_err(dev, "Failed to enable remote core!\n");
 	else if (priv->flags & WAIT_FW_READY)
@@ -449,6 +455,11 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
 		return 0;
 	}
 
+	if (dcfg->ops && dcfg->ops->stop) {
+		ret = dcfg->ops->stop(rproc);
+		goto stop_ret;
+	}
+
 	switch (dcfg->method) {
 	case IMX_RPROC_MMIO:
 		ret = regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask,
@@ -467,6 +478,7 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
 		return -EOPNOTSUPP;
 	}
 
+stop_ret:
 	if (ret)
 		dev_err(dev, "Failed to stop remote core\n");
 	else
@@ -1085,10 +1097,14 @@ static int imx_dsp_attach_pm_domains(struct imx_dsp_rproc *priv)
 static int imx_dsp_rproc_detect_mode(struct imx_dsp_rproc *priv)
 {
 	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
+	const struct imx_rproc_dcfg *dcfg = dsp_dcfg->dcfg;
 	struct device *dev = priv->rproc->dev.parent;
 	struct regmap *regmap;
 	int ret = 0;
 
+	if (dcfg->ops && dcfg->ops->detect_mode)
+		return dcfg->ops->detect_mode(priv->rproc);
+
 	switch (dsp_dcfg->dcfg->method) {
 	case IMX_RPROC_SCU_API:
 		ret = imx_scu_get_handle(&priv->ipc_handle);

-- 
2.37.1

