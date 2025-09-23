Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013047.outbound.protection.outlook.com [52.101.83.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83543112D2;
	Tue, 23 Sep 2025 05:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758604636; cv=fail; b=m1oSQ9RUHSFhSUd1HVp4Qo5trGCaXMbvYQyy71m2wX1EFz+OARk+FCGYn/U1RkRaY9tOC8TlZR61ImWpvG7UWC7VmYblKhXB/QfsyMneOaZlG67Q3C2JUj/shqkHPPJ5zQyY7E2mSgMqBe4+irBHJHQbbeYViO0KNUen1Wy4SOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758604636; c=relaxed/simple;
	bh=IuzcQJJFvrEXciS4p0rVadSfybgYxbudeKcH4Gwbh94=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kDQ4k6aeP7gGbxd+sDilcePMXcXVaPdWr5ffFY8dIullVD/0FDIRV4V1Lx4kxmKMFrvetDVkXCFDwak5c98DTfBUg9gW4Oi+f2+nvEO7tm/21SCRTiyOl6wEdjosVz5iTyLooggMKCeWicwlK63HRS7lQZ8zCjvk3Ku78b/Bayw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TavVggG4; arc=fail smtp.client-ip=52.101.83.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TavVggG4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WG0n8f7AWgxbkWnxitZfX+ky1L98LPE6N+/RbjSmpHEa2Jpw3Ujo2UurBfPZexjH9LIq+vPR3fsYJfl+AvhjIWUAXk0at9tCu3hldxVxChAO322+OYRXY1mQPAB3xqkysGuhgqk6mkWDzW3x+qEeyMAD0EKaSN6R/fzZKTxoQ6Qz/IDXT28JMQboL2saKvufrm6rzyyPV4rh3kifLtl0pKGmJXaN0fUb/k1yjIz+HsBeHaLAF1ED9L5BDl7JLlNptb77K5J7wEdB7IgZfUcNCgqX1u3QN37+1tlvzGNYuGgLD4jhQqS86YpqtP6OzxyhhbKaCiDPos4sUg01WgTQsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hk6PH7MIgopDEYCRIvoYjFbSYec9N63Hdt5VAuIQw4U=;
 b=E5ZTtzarivZMpogesy8dxh1PzIOkwO0gpJs50gBBPLOIuJbD6A1sDYpHQhuNJ2zOLXkKDBv/+LLv0bzpj5DCavX1Lh9N1eFeGZ+iNiABFXWOW3oGnvWN2wrZraqc8E4zG8NWgS+AMSn7/fPL2JBpLKVeYccaeTxwYiDnLnEMqj1ZQa5tVza5lndqBZS9QGQNC/+lG5EIo5sLxWildRZRq2ZgQ9NjnLg+FnfEX3vdSnuLnaqZ+R37YI/M9Qpc71QlXMI+FQVj0QvNdBnCpEmam5ImwXiv9NCyXFsQwrruy0xkU8V4jhH2tcxNMk5wT+db5aJ5YqjETySYyKSqcbsgGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hk6PH7MIgopDEYCRIvoYjFbSYec9N63Hdt5VAuIQw4U=;
 b=TavVggG4Hl1phvOwYUMaYyA9aWlj2g9ii0snrfoMBa4+YEjPiA2De/632Gtbq2PkxS269y5yq4kjwzY+lsGed3qewAh1pvKdxa4JYJ0XZW60wlhVw/x9R+WO6zIPiEOhyrsf84j91MmcTtroPicM844Bw5zjHgdWDMkRAgpSODhtN4oFOPbOD6YCbqdyRBe6e4RC79/ap5s9IuqXJvsJ6riOXi98f0IKNt8FP/wBfXnfXh+IBiL0Bx0qfvzsD7eHBQhGOAI/txfWOhkiYvIrzx///Oi3UhToLOWpUraOmUHRJdnxnY9un9/qp0SCishya5f3Sz/myhyoOw9hq2OCEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS4PR04MB9340.eurprd04.prod.outlook.com (2603:10a6:20b:4e8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 05:17:10 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 05:17:10 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Tue, 23 Sep 2025 13:16:35 +0800
Subject: [PATCH v2 3/6] remoteproc: imx_rproc: Use
 devm_add_action_or_reset() for mailbox cleanup
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-imx_rproc_c2-v2-3-d31c437507e5@nxp.com>
References: <20250923-imx_rproc_c2-v2-0-d31c437507e5@nxp.com>
In-Reply-To: <20250923-imx_rproc_c2-v2-0-d31c437507e5@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Hiago De Franco <hiago.franco@toradex.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758604605; l=2739;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=IuzcQJJFvrEXciS4p0rVadSfybgYxbudeKcH4Gwbh94=;
 b=NBq+DKNAP2aSiEfa8QfFZgf/yfexAnidT/YMdR9yB33BBnhpUwv/REGWJMIhKr2JsgFOzfb0I
 bwTNrUhYnpRAfFW71sxoYxo8zvSfOisOIHMS/sn+X5BEWOjItCZNyps
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MA0PR01CA0070.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS4PR04MB9340:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ddaed4f-a469-47ed-3ac0-08ddfa6072a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MXVIQVRRREZQbDBHUzRiQURla2tPTnFEYm1Qb25XdWRKYXFVR1NlVzY3UXRS?=
 =?utf-8?B?V3VNYkpHK1BHNFp1YjZ4YUo1N1BDZk05V2pHL0pwSkhFMWtUN3U2VGx1M1FN?=
 =?utf-8?B?aTlnei9jOHFFazNlbW4vRkNqbTI4L3YvS21LUUJaQ0tXSjl1T3dPU3BtNVI0?=
 =?utf-8?B?SmpqQ3lYUGpNUDZ4Szd0WkxQVTQ2THdiQXZoaFlYaStrYXRVNXZYNHZ2MlA1?=
 =?utf-8?B?VW8wR0tIK2Z4bER2cDBJTStkUGFUVjhIdHkvNEFXa1RnM2xweUpwa2V6QUEx?=
 =?utf-8?B?TGhPYkp3MXIyK3pKSzJld0tFZnZybnRvd2UvOFZ5VS9OSk1Pd0hFc04xaFZB?=
 =?utf-8?B?N1ZFSENxL3BZT05oQWdzbmUwYlN3bU9aNUNBL1lKYlVnVjZYOXFXQURlN0d3?=
 =?utf-8?B?eFdlOEtnUGxGcSs4cjJzdlVYb0Z2OHRVaEgrakxQWmh5ZVVWelFJL3d4S0RQ?=
 =?utf-8?B?SWhCT2tLRTVBSENuWTNycTFxUzMyTkVMY3pEMlRnQkxXMHR5Z29KZ0VVMzRu?=
 =?utf-8?B?TmdUMGd4Sm9XUHpzeGdCdDFtOTc4eUVqaHo5ZVV4OXhtM21FbkpTU0hvMEdP?=
 =?utf-8?B?NFZ5c21IdENyV252NlB5bHFOMkc1NHBsS3RnaTRJNlErbmNzcmFHOFhZd2VE?=
 =?utf-8?B?cjFCQTFxai9Ub05mU3BHUkcrM2V4SW5ibkVMWmpEdEVBTHpZNDJsV20rRjBJ?=
 =?utf-8?B?TnVTSnVmdmpic1FDRHp4SmRZQ3NQeStVaStWVkFYMnA4NktCOFFoVFBlQ2JL?=
 =?utf-8?B?Ym1OR1BFZk9kam55SkZJWXdHTmFOREtpNzZPY3RIMy85WUI5TEphTUJDRHNT?=
 =?utf-8?B?NU12UEpWdWxKZ1ZiSzRtd3Z1N2FUZVVIL01IeDNPbWNEVkpNZXE4d0RkZUhX?=
 =?utf-8?B?cW11d1N5ZitvS1NIZEVsNmJhdkZQbi9jZ2lyendJWjAzWGRwcDZpRC9tVWtk?=
 =?utf-8?B?azJIVXF4MzBpalZndzRoQ1JaSCtVWGxoVW9oK25WRUowRnV2VG15d1pKeDln?=
 =?utf-8?B?V0p6bHRobzlUMnIzZFVrTFdOT1dzR2Q1dUIrSk1DaU9RWEFteEhtN1JwNytk?=
 =?utf-8?B?RTFQOVczM016K1JwS2o3WUJIcW82ay81YzZ5MngzNmZlSzRPTXQ3NjNFR3hw?=
 =?utf-8?B?MEUvYy90MXZCSHJJblZMcWxybEwwSGZmTFdmNjFDcEFKdkVIV2h4WDdFKzhw?=
 =?utf-8?B?MDhCWWVpK3dLNTVLbGZhUXU5cVVqcUxLQ3ZEYnU4UWlWNnlEa1pRT1F5RHdK?=
 =?utf-8?B?b3dibGhvd0dUZ3dMaUtpZm4vYUFKY1BKeFBKMjA2MHhaWm4yQTMzcnlUZ3li?=
 =?utf-8?B?VGN0RUFFdWh1SFBnMlpraDRTYnFHb3c4SGV0NTRmNmp4bVplbjlLMXlpc1FX?=
 =?utf-8?B?WXdVQ0dPeFM0OUtYZVV1TFQ2Z01NRDhONSt4Zm1CbFpibWRJeDVyYy9LTWpI?=
 =?utf-8?B?M0h5U3IxdW45N1VFNGZBRzVoeUdacHdCeTBHL3RhTEs3UmxvZDAvMWtrdy95?=
 =?utf-8?B?VmFqNDNOaXlqZzN4dmRqN2JsajFOMWdoOWhTVHMxVG1acE1aR2Vhc05IZnZo?=
 =?utf-8?B?bVZlVDBYUDZqQUllUVpNaEVKSldWQXA1bW9zYTA1TnpFY1FUeDdCYXdvVVhT?=
 =?utf-8?B?WXdDbHFuQlRTUTg2SkhwSjUrZmFEdmtqaWt4bURQeDhCak5RUHhtUGxXMWNk?=
 =?utf-8?B?bXZrYWFsWXdjeW5vdVM4ZWJWMS9MUS9CcFRCc0lMUm9CWTZNRTRKbzRyU3Ji?=
 =?utf-8?B?dUZDM0E2SXo5cWErN3N0OVE5SjNSVkY3WmFJRnlhck1XNS9CYnBhWVdEOWhH?=
 =?utf-8?B?VSt2TitaVFV5c0djYWcvMVJhTGZSbzY5KzM3RzJ2VDI1dEVjR1BJQnJzNjJY?=
 =?utf-8?B?cWVBelI2ZkpvR0xvQ3F2WDZoTDc2Y0ZPeHM0ZlNQMVp3cTdDdkk4cEt4S3dQ?=
 =?utf-8?B?ZTdob2o3amdSYThlNStOUXJhM0NJY2pkWW5aUWNnUFJpVVQrNXg2bGtIdEwz?=
 =?utf-8?B?YWt1YjlJbnJRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anJLcWZjN2pPZThaQmp0NlJVaDVnTHpZUnhiSGlPMGdOUnJLUkFraGZ5RHls?=
 =?utf-8?B?YWpjWGtkeWFFWExNQWEwL25SaS9MV09jMWlydm4zbHowMGVLNks2dm9EMmtv?=
 =?utf-8?B?T0E5Qk9MV1BYUVBmeDA5ZFM0aTVGUyt0L3g0cWI5dlpybHNPdTBsSnNLU2o0?=
 =?utf-8?B?dHhJRXVBbnRXVWJMYnArLzAvaUJVczlNN3d4MktBUkVmS3Q4Y2FSWnhJZUIr?=
 =?utf-8?B?VjkvWkNZS3Z5b0pBVWtWZXJoVnA1Y2RrdzRKREUrVXFTZDdBN21sa0M4SXVp?=
 =?utf-8?B?bDRXNENrSkw2bk4wMlA0MTVkU0Y0QnVvYm5kOFltbXVyeHR2VFR2aXl0M1V3?=
 =?utf-8?B?dkhxRnN5ODFkcm4rS0x1d3l1Y0g0TFY2N2MwamJ0RWIwZWluT2hvekt4SFBB?=
 =?utf-8?B?TUNqRUpabUxRRzJJQ3I0TTN1d05hYmhYcDVIbnk4RXhjbnlhb25UMHBwYUJn?=
 =?utf-8?B?NFBTcDR1RmVZUkNoaWx3eEN3QmZtQU94b2xpeXRCaGNjWFcrWS9HL3RyaTNn?=
 =?utf-8?B?NkpmeGlKbDdJd1Z1R1pOamlwei9vNHhLNWtoOC9BQk8vVldqUnBiT0dCTEZQ?=
 =?utf-8?B?bkRjWDc2aVlwbGIyOGl4S1dJU1pRdlY2dFo2UFVzVXc3ckd0aDl4UmQwR2Q1?=
 =?utf-8?B?YVZtRHpGRHpTNll6eDNGdFpwWklSQmJtWEtCODR6MGxuMzQ0QzJUODFzck4w?=
 =?utf-8?B?Wm5wcG50RU01K25pSllBLzhYcDE0YXM3c2FJYkRLVjk1SkY3RFQxbGc0SExL?=
 =?utf-8?B?b1NlQXhGSERHRTVadVJEaXF5RzBXNGhlaGJ2Nm80enkwU2hFNnhRT3AwRmNH?=
 =?utf-8?B?bnR4SUFUaDdiWHdRZzZEUDdLUUZFQStWR0ZPUUVxL0Vxbmk0M2ZDS3M5bnZO?=
 =?utf-8?B?Ulp0djdSWk9BenN2NnlZc3g1L2lKN2tWck15akxPY0RDWmtuWmUvb2ozOHgz?=
 =?utf-8?B?eWZXL0U4dVBZblN5MEZiRFo0QWU5OWl0R2RreTJWb1ZUTjFha253Z09RMC8r?=
 =?utf-8?B?MnplbTViMG5ma3VPR3NSc3JISjljeWVvRk1EcmZrZk9wVnNDWUNyTC9GV2Qw?=
 =?utf-8?B?YTdraU9IRy9tT3FnVWNtbFZUUG5WWHcyUFNrU3JObU8wMHdsV1FQRC9EV1Yv?=
 =?utf-8?B?QmpjemtIVTB2dDhTRzU0Mlc5RjJKSGRjMlFDaHJFWGJuUHVOeDlHYVd0Vm5p?=
 =?utf-8?B?S3QrQStiN2dyUlE3MytpVlF1OU5lZTVVdzFFdDJPdlRtM2ZPdDMwWnBHbWxZ?=
 =?utf-8?B?RGp0cGVPQXU1NVNhZk1NcDczYXNnbkhLZjc0cXRRVVBJams1RkxGTXREUy8z?=
 =?utf-8?B?bkNKbTZTLzZubjRzQXNSWnp3dm1iVHhrRFFKTnJmRUNIcXBiZzNzWmxmd2JN?=
 =?utf-8?B?NUVsaTJYZ2NjV3plRkRFNk5DNDMybjJBOHBRdU1Tb1ZaMXdGYktDZk1COXZ1?=
 =?utf-8?B?aWZQNUtnVENiZ2I4d2tKQmNSaWpPeVRvemlxWDdMMnpLbnUwWk81Y2NUU1Y5?=
 =?utf-8?B?OVFRSFc0Z2dGeGhsU2IzVmowVnV1UmVqNmRwellzeHZVWFlCUXkwN1ZXL2dv?=
 =?utf-8?B?ZkNZWEtQRnRtdnV6MjI2d3lGVGNndTRzSmZ6Ylk3Si93YXNiaEorekxqa2gr?=
 =?utf-8?B?Z3JnR1IyMTZJRWs4czFrVTJhUldTVitUeXc4akswNmI0WExlWnlKR2dvcU9O?=
 =?utf-8?B?d1AvVTVhNXJnN3R1blBMb3I1TEI0WlEveGZ5VWZNV1gxRk1BL1dITkxVQ2hP?=
 =?utf-8?B?QmcveDFCMXVSc0lqWE9aOU5YZ21ndks3Nkk0SnVnKzh0VU9Pcnhqeld5NUxD?=
 =?utf-8?B?cW93WE5UajVsNWRHNjhPYnY0YnhXRktkMzArUmsycTZjUU5VcGF2OVpEMGEz?=
 =?utf-8?B?VDlLRS9NT3dxeExkQTVtTEZHZ3VJSjF4NFRyU2JUbFFORVNhMnNkUWpkZ3Nl?=
 =?utf-8?B?dnhMK1EvMkFOQkxNeG5xWkVjZzFmTzF0bk9KUG9kYTE5clllZkZURnNLeXJ5?=
 =?utf-8?B?aTFSK1JOSktOZHgwZU1RUTYzSUIrZzREK3Ird0Zocm10S1owMjR1eWtYRVB4?=
 =?utf-8?B?akFYVklKaFgyMVhhWDZHbkVUOVg3NThmMFhtRFlhUE9SSTk0YW5qU2hHZncz?=
 =?utf-8?Q?iloY89xAkiOzcA/+iUHZrNEDA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ddaed4f-a469-47ed-3ac0-08ddfa6072a9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 05:17:10.5276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlsQpa5n2FPRMp8Ho9ZawGozndSESaxwh1pPATI2BkuwcTPY/03DigWB3PLKRWQNwA1aIuvQzl9AWroPoU0Kng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9340

Convert imx_rproc_free_mbox() to a devm-managed cleanup action using
devm_add_action_or_reset(). Ensure the mailbox resources are freed
automatically with the device lifecycle, simplify error handling and
removing the need for manual cleanup in probe and remove paths.

Also improve error reporting by using dev_err_probe() for consistency and
clarity.

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index cc776f5d75f1f614943c05250877f17537837068..e30b61ee39dacc88f9e938f8c6ffe61fef63dbda 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -93,7 +93,7 @@ struct imx_rproc_mem {
 #define ATT_CORE(I)     BIT((I))
 
 static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
-static void imx_rproc_free_mbox(struct rproc *rproc);
+static void imx_rproc_free_mbox(void *data);
 
 struct imx_rproc {
 	struct device			*dev;
@@ -780,8 +780,9 @@ static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block)
 	return 0;
 }
 
-static void imx_rproc_free_mbox(struct rproc *rproc)
+static void imx_rproc_free_mbox(void *data)
 {
+	struct rproc *rproc = data;
 	struct imx_rproc *priv = rproc->priv;
 
 	if (priv->tx_ch) {
@@ -1101,15 +1102,18 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = devm_add_action_or_reset(dev, imx_rproc_free_mbox, rproc);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to add devm free mbox action: %d\n", ret);
+
 	ret = imx_rproc_addr_init(priv, pdev);
-	if (ret) {
-		dev_err(dev, "failed on imx_rproc_addr_init\n");
-		goto err_put_mbox;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed on imx_rproc_addr_init\n");
 
 	ret = imx_rproc_detect_mode(priv);
 	if (ret)
-		goto err_put_mbox;
+		return dev_err_probe(dev, ret, "failed on detect mode\n");
 
 	ret = imx_rproc_clk_enable(priv);
 	if (ret)
@@ -1174,8 +1178,6 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	clk_disable_unprepare(priv->clk);
 err_put_scu:
 	imx_rproc_put_scu(rproc);
-err_put_mbox:
-	imx_rproc_free_mbox(rproc);
 
 	return ret;
 }
@@ -1188,7 +1190,6 @@ static void imx_rproc_remove(struct platform_device *pdev)
 	clk_disable_unprepare(priv->clk);
 	rproc_del(rproc);
 	imx_rproc_put_scu(rproc);
-	imx_rproc_free_mbox(rproc);
 }
 
 static const struct imx_rproc_plat_ops imx_rproc_ops_arm_smc = {

-- 
2.37.1

