Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012066.outbound.protection.outlook.com [52.101.66.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54F9273804;
	Fri, 24 Oct 2025 02:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761274331; cv=fail; b=tksOYsHwL5A+DeGhZyMq9IGvVaL+2tLUWOsGdjV/b9WLn35oG6mX2e62brI/2e8du36GBmq+2iHhYCQkdw2RzTMunx89lspIqYhEWtIOQ//wZHB9lBUA5SBBLH8lTqV28xuMTFCTBuovl/E/MSfbNykess+n7Ufv3p5bw61KJkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761274331; c=relaxed/simple;
	bh=ubPGUSA/U+ZOw1gfPc8BkZeJlxaEckkX6PUzue4SoY0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=O/Ytguc3CqsCjB9Q2KQm/x3KlA1sCsazhKkUYo6gQ/t5MBJHH7HuvU7LBciLSEhaNwhqpAo1/+YhghcmOxx6MR3jyW84nfvA31b3TQWtAF1QzgczEVUtHW08hnBEO7BDiX85WOqZT2GjAEb0utba3TbalI7yx21efpbzTUYVP7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jEJZ70S6; arc=fail smtp.client-ip=52.101.66.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jEJZ70S6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gjIIRD6d7jn+/dV1juLHvMQOfoTL9ZUS3PVU2s9rDZxbuxj3thv3z/AXzROCKJqO+u1FZMWzFwyDLAfCF2y59EBb4Xykr9KI/OZZkz4xUqs5QKdBM95SxMNKPDGm3r0dcSwM9TT6ImT1cIhHoZ4Xl3zNHPS20kXuam6e+KKzm/H0+5pFfHzaY+sA2aYspjjiHPSnHW89cejSSitvdJVx8G7ynwH9/bOQ/3KGUPTUIhZQEu9qPJ0ctlWMT/SY0yBD4w+gw26ezzVRl3QozirBcJqc/x1Fx7Qi8UWRT0dR8JPSA4YPj5TgwbRUPLa+GHqtl27+B41m2+INfjPzbbffNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCzrP28pdGHGSnbUbMxIJ/pi16pVmqX/w7SQCH5Sb44=;
 b=PfB2674K5rBTy2cGwfTHUaBpx8om06DAygZJOMZJ676ODyqBtezgm5RwNWlFGx30qQjyXeaCG6LCkZn69YKbFUta7KSR7tw/MNYHF/IWAHnK5kqcefpW89OEw9lUAJNFqd69KYZNDPYpf2d3wcOrDqlM7SHDpKarSBZ7Lu29uwWMBhP0l4UjdiNPG9h4vUQsF6GbJ+kIUYmi2W/wG7/f3pEkG2Bccw2Bm7hTp98TyiDVni0BTqzD6yxp0QD6fLV1JwOsEhVyNpBU6twOpDsz1CUQQe6X+rX3TG3ltR5CDJoCqjKzHRiOG5MFRxDfmmzd0hCqBozVOv5DKLU8Gar5lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCzrP28pdGHGSnbUbMxIJ/pi16pVmqX/w7SQCH5Sb44=;
 b=jEJZ70S6fKveMxRs2oK1J3yEZoJ56+3xI5VyqsBWlpt9x8oPE7a1oxD5fKqcriRFbXExlwbm65v1een8V6CXFzb83i7u++MkNGjGtgye/WfSDH9fIiNzxgveu3Ux1SSlu8B2lGT8QeX/o4yeELFmX8JNx+vE+objjuBcEgfUEvlj2fwGXOvQf1L6bDy9Vf40wYkXXPy69Y1oJEOIZbH+4pOqNlJM7noEOETpcrQk2xbRvdwXxSnL7s3+DJZ7V8LgWLyYMLqfLCpUeEtcsfwAAj/tJzJmy8J4meGwVCihwiJt4BzaFqp/tJcVHW1SzQzoguB8zBL7PpQqniYp18fopA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8197.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 02:52:07 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 02:52:07 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 24 Oct 2025 10:51:31 +0800
Subject: [PATCH v4 4/4] remoteproc: imx_rproc: Remove the assignement to
 method
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-imx_rproc_c4-v4-4-af83ed3fdbba@nxp.com>
References: <20251024-imx_rproc_c4-v4-0-af83ed3fdbba@nxp.com>
In-Reply-To: <20251024-imx_rproc_c4-v4-0-af83ed3fdbba@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761274300; l=3509;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=ubPGUSA/U+ZOw1gfPc8BkZeJlxaEckkX6PUzue4SoY0=;
 b=MHqIY0+GT/UuVpf7VRPIans5WfahNDSewM59cQs6XB2fRpdc+a4nMGALyGCd5+2gx8yYfJD5B
 PcktJcXdcn8Cmquqi5X2uQGmC26/dE0/BgLT6yiK+8UfhBdz1/qDf2U
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: 745c854a-98b1-40b9-90ac-08de12a8516c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eGs1ZXFsMitTc3kwZWJPazZrRGlneXQ2eUVrRGV3TFhwL2JCUENsb2VqQ09P?=
 =?utf-8?B?ODFLK21uTks2TER3YitTMWhWdUc5RUdjZlNEUTM5UTJYNEt5Mnd4YmdyS2VL?=
 =?utf-8?B?YzBkcER3TFR0UWo2MzdMbTJDSVlPZ2I0Z2ExM3JlZEZzOEE5ZzVlVklyNGdS?=
 =?utf-8?B?MVpRYk1PUG91eEZseFZWdVRNTGtNeXl3ZnhndXMvaWdtVWtVR085MW5BSk1Y?=
 =?utf-8?B?YzdmRFNVakJYWGNRR0FNb1hmcXhyOURLeTZhUnZJUkNjcG96QjMyME8xUU1V?=
 =?utf-8?B?T2ltakkrUG9YZExrY1dnTVVKSE9TRXdGTUlWZEZ4OXF6NGJMRVowbVVxNWdw?=
 =?utf-8?B?VVhUeHZSSThiWXg1L3hFbytjQnZTQ1FVSlFkMnVidmNnY1RFOUFWYi9ldjdD?=
 =?utf-8?B?RUR2NFBzRDMyZy85RnV5aENWZUVaVDlwNFE4SmVMeGQ3b0Z3NUlvcWtZU0pw?=
 =?utf-8?B?SVcvVHp0ODBvSkZySEdOcmVyemhGVHBITkNVdTBraGdlK2F3SDlWUHdXbG9x?=
 =?utf-8?B?RTI2dlp5RW14dTdEYXFYS0QxVWZ0aDVwMDE3U3VZRzR2bi9yai9rRUxQRGwv?=
 =?utf-8?B?dVBlV2JTR2JoSWZiLzFzSGtneFpLWnJwdVM1UFA2d1pqS25sUGo5MVZyQmpD?=
 =?utf-8?B?MjBIWXYzaUZ6RlZsbjY5dFNYdE5HM05TZFBoTEs3QmNyN3BxYWd2NThDTjRR?=
 =?utf-8?B?WFlBclJqNm8weVVIbWZhaHF5NzMrcE5OSkdBVXNWTXlUNFlRNmV0L2EzQi9N?=
 =?utf-8?B?NkdWeitHWlRsT28rZXdhakZHcVpmV0hER2I1SnVSMDk1bm1ENU85RjljcVQ2?=
 =?utf-8?B?NlJBaSsyZndSWWl0U1c0WnBMbFY4aC9kWThTR0w3N293MFRsTURLZndtL015?=
 =?utf-8?B?NmdxWkpNb0U2N3ZhcFgrTFVOcFYwbDRWcGdoaURVN3RlTXZMa2dSNnBESWdq?=
 =?utf-8?B?c2s3RFFNV1JFbGNtQk05Z2xqYklIOVJEN1RKMzZZRnVERm9oMkVsM0oyQUZ1?=
 =?utf-8?B?OGZYeThxaXNjWU8rZ1ZCclAzN0tjd3FMQmRDMFdkcDVYakFMb3FCKzJ3MDFI?=
 =?utf-8?B?dlBZbG8wOGZicmowenAzT2FuM0I5UUhFY1hyV2lmNkF4TTJZZm0xRnd3bUJO?=
 =?utf-8?B?bTJpZ05oQWllYktLSUgyTUR2MUpaanp6S0NjUFhtU1VkQnBHVjVTWnN6QlN4?=
 =?utf-8?B?ZlNmMGw5RlFlVElMdDJaQVVKV21yY2lUaDlBeXNkVXBUaFdPQ2JNMEhYOVNx?=
 =?utf-8?B?Z0wvQmNEK2dSemlPME11L2lvYnlob0RPMnduSDllK09uTC8wTkVNOE9GSW5F?=
 =?utf-8?B?QTRyZUJsQnByMnA3QTJRZ2tKN0FBRFlucXdVOUNuSHRGZmJLK0oxVW1vMVFR?=
 =?utf-8?B?cmh3cXFHUCtyV1VnZEo3c1VUQnNhUE1HRFdMTjY5M05Kc0hWMFJoZ2VRRGJr?=
 =?utf-8?B?UGVTSEpDR0ZtcHdNc2NhYkt6clp4ZFc4VGpxL21Na21jUWw4LzJvb1pIVzNi?=
 =?utf-8?B?cXVjb3hRWWVmdEM4U1VySFEyaTMzT0dOZWNvV09Dc0tBaWJHb1Z3bUdiZU1o?=
 =?utf-8?B?U1pxRTZSMWxnOFRiZGorMmppaHlZZ2o4Wkk3TWhseWVkbXpoSVNWME8rSHVU?=
 =?utf-8?B?V2hnZHdSTjl1RDBPWG0vd1o1MFZUWTd2eFh4NEFMMkdZZmI3VmFNRkdaSFVD?=
 =?utf-8?B?Z0N5Q05RZlVVOTVuUzJFL2JSdDdBdzl0WlMyT0hFU2pQU0Y2QW9Dd2laSC9P?=
 =?utf-8?B?U1FKOWNELzUyKzBsR1RzVlkwMlpTV2RlY3Z2VGFsems3T29YK2lHUy9wRjkz?=
 =?utf-8?B?bEtxb0JVcGJuMDNrV3dJSFRtMDhlbWxSOStjVHpSMzBuU1NFN2VRWHhwVjlW?=
 =?utf-8?B?Qjhrc2xnZzJTVnFZOHdGUlhhWC9TNFJIVWNxaVBlRjdUMW9kNlE0WDdsRklp?=
 =?utf-8?B?QzYydW9vbEVrb2R5ZXNZWFlITE85Ym9ZbFdHN2tidi9RcWJDRGY4NThDbnNs?=
 =?utf-8?B?TW92L01FWk9iU3Bvc296U0dhQ1ZSU3UwcTd2djNhWTdvcThyMnFONzNKZjB5?=
 =?utf-8?Q?tbdXnn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHlyWXluL0owbHdLNjQ0ZUdLUnZUVGpVYngrYnVYbFp3UkNDRlpTeFdWWjR2?=
 =?utf-8?B?cmViQ1p6dUYrdThtSFJKeXN4enA0SmFGbTl2UnpJbmFBMnVWdlI3dmtBcFF2?=
 =?utf-8?B?bWV2QXRuWHEvTEwzTU11a2JsWVVQQ0ZNcitzS3RQdE0xSVErSXlrWHpwd3BP?=
 =?utf-8?B?aUNJeDFLb1lwNW5oWko0djFua3lwYTRtZ2tUM0k2dnlyWU50ZXphVCtMU2hp?=
 =?utf-8?B?MU53aXQ2RWlvT21TanJGKzlJenU1NWVjMTJvUnV0TU52MThpUHRRemZ5dkU3?=
 =?utf-8?B?MnJIOWhvMTNTeW5kZy9kQllIU0FYbWFxQjFzdkdrWXJYbUVoS1lrK1p3RVB3?=
 =?utf-8?B?TjNXWHNwYWZRbkcwL0FVdHh5VzEyM3pUbmE4ZkVBZmNhTUhRSm5jQkRqRG11?=
 =?utf-8?B?bTdpdmJqSVZLanZ4NUhxcWRzM25ndmxkZFNCRHhVc1F6azFUWEZ6SmV6NzFW?=
 =?utf-8?B?bUNrWGdXd252YVA5Y1RTQ1gzSVJUOTdRcGI0ZVhaTzh4bXY2bzFmY0FvL0pK?=
 =?utf-8?B?OWlidE5FZEJwcWVacWJnUlphYWtkS09sdVZ6KzdhLzlIb05Wd3N2dnJPRmNZ?=
 =?utf-8?B?aGlMd3dxejZMb0tvcjJ0b01nRkVpZ000dGozMkxETU1KdWpXOENxajdGS1pO?=
 =?utf-8?B?bEFKd1hETGh0NytFTVdyNHdwT3d1SVVNYkpYcVFhckd2SVhlV2hHQXlPUnZv?=
 =?utf-8?B?OGRqTzNpSEFneFZKYStnTGZTckNCWU00Y2dGRjRaOEx0eEdPRzN1Y2g3clc3?=
 =?utf-8?B?QzFVVjkxSDAvSGNNWjEySlB3bGI2Q0JCUk95YndoZDZIb2pvbzJpSDlUNzZM?=
 =?utf-8?B?d21VeURhYkw4N0thYlgzdFpkb2h0cmt1K0lSeW5DNnNvTTRCNXFQYmZsZGNs?=
 =?utf-8?B?R2hTa1pwdktCSWdsTEt5TFhyMHVSQ3l0b0xYYXpBMEk4L0ZSSnhxSURLTlZF?=
 =?utf-8?B?eGpEVVk5azkwVTJIeldCVHNkMFNYa3hpUFVLdmFtOGhHQWhkTEc1Q0lIcU1q?=
 =?utf-8?B?NTBMWFZ6b1I3UHo0L3JteUEyQXBvZGZMeHIyV0ovWTYzUmdNeldPZ3JWclky?=
 =?utf-8?B?T1orazlZRkMzNXdERTVrT0tBR3F4c3B6a2xFWkhnYlFMTktlbGl1dlQ0Z1VT?=
 =?utf-8?B?cEZ0K0VURk9sb25Xc2tWelRHVG9sUHFMRE9DVjFwajhSNzVqQWc2cmtHNXlM?=
 =?utf-8?B?UmxNNytpeXZ1aVpDNUpDSWlJbUdCbndVRTRZTTZveDJXVlEvYUNycXdYNVE3?=
 =?utf-8?B?Y0FRNWJtTXY4S2ZCdm5CSzFLRmE3cWVzWENScFNCSlRVWWN6QlFmQTJ3UkVj?=
 =?utf-8?B?eGMxSHdGVTZYUWN6dTQwWWhZQUx5NDVVMW9Hc29xNjJ1VlNZVkJCZVFXTWpN?=
 =?utf-8?B?aVQya3k2bk9vaE9DanlGd3QvZUUxbHpYK2JRc3pld1lHNG1xSWhRVWpoRS9y?=
 =?utf-8?B?ZTdncHRJTHo1R1lKWlVJVFkrYytaZ3dsN1NlcytCMldtU044ZXlvdW16bDUy?=
 =?utf-8?B?RlRJWjJJQThTZDhLb29pNmJLSEhJeGI0ZHIwZUl3cmd1T29xeTJwNjI4Z2U0?=
 =?utf-8?B?MXJCbHcvVlgzTUNvZDI3cXg1Uk44RjJScFEzNTdheWtQcWYzL2VSOVpNNUt1?=
 =?utf-8?B?OWxwNFdVdUZnck9wc04yLzlWYk9uU21RZzUrR25sNlZKY01DZnNQck5sbUZG?=
 =?utf-8?B?eC90Y1NjNEY3RjFvdDFjQ3l2bGtPUTVSTjlMYWNONU85TDdoR0hJM2c0Yldl?=
 =?utf-8?B?ZDk0cUpQZjFsTS9OK1ducGRYTVA4TnhwZDJReTdnbnFoSENITmEyenp0VHJl?=
 =?utf-8?B?S3JLV0poUldkQlBXdGQ5SVhPSnVpSWN6QVVNVTRhNUlKQlhEcENOZVBNWGZh?=
 =?utf-8?B?clVJMW1JNkJJMTZCZ2J3UWZDVGlsTE1IT2s2YnF6UFRDNFVNR1diSzh6U2lN?=
 =?utf-8?B?MXJHbmJMR0NKUlgzYk84eDBoUVV2S3EwNllBb0l5NmpZQTdvWjlzbGdISXBQ?=
 =?utf-8?B?bFJVRTVqaU94LzQ2bUxaWUZ2QXhyRFZmWGxyMmdpeFBFTi85eFJIR1RnMVJZ?=
 =?utf-8?B?bEduVTlRV1h6RUtqaUZ5ampXNzRsSktTaHNVc1UvcVZRL1JHTXVzc0lSTU9O?=
 =?utf-8?Q?3MmI8P3+mUZLwfFQm7dpzgb84?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 745c854a-98b1-40b9-90ac-08de12a8516c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 02:52:06.8834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n8lsqq/kPKu2s1PtHFnR4GYEE+ljiI8Shm6R2LEH+6SmimKw0kum7sn4rhwJAaJzmLG6V6CIUpuQ+DTHKVCENg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8197

'method' is no longer used in imx_rproc.c, so remove the assignment.
But imx_dsp_rproc.c is still using 'method', so still keep the field
in struct imx_rrpoc_dcfg.

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 25f5cb4d414eabed7a166eb2a8ae5e20b6b4f667..02e155e967942d745de4ccd96f9008e4211f9b36 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1176,7 +1176,6 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
 	.gpr_wait	= IMX8M_GPR22_CM7_CPUWAIT,
 	.att		= imx_rproc_att_imx8mn,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
-	.method		= IMX_RPROC_MMIO,
 	.ops		= &imx_rproc_ops_mmio,
 	.flags		= IMX_RPROC_NEED_CLKS,
 };
@@ -1184,7 +1183,6 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
 	.att		= imx_rproc_att_imx8mn,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
-	.method		= IMX_RPROC_SMC,
 	.ops		= &imx_rproc_ops_arm_smc,
 	.flags		= IMX_RPROC_NEED_CLKS,
 };
@@ -1196,7 +1194,6 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
 	.src_stop	= IMX7D_M4_STOP,
 	.att		= imx_rproc_att_imx8mq,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mq),
-	.method		= IMX_RPROC_MMIO,
 	.ops		= &imx_rproc_ops_mmio,
 	.flags		= IMX_RPROC_NEED_CLKS,
 };
@@ -1204,27 +1201,23 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qm = {
 	.att            = imx_rproc_att_imx8qm,
 	.att_size       = ARRAY_SIZE(imx_rproc_att_imx8qm),
-	.method         = IMX_RPROC_SCU_API,
 	.ops		= &imx_rproc_ops_scu_api,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qxp = {
 	.att		= imx_rproc_att_imx8qxp,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8qxp),
-	.method		= IMX_RPROC_SCU_API,
 	.ops		= &imx_rproc_ops_scu_api,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8ulp = {
 	.att		= imx_rproc_att_imx8ulp,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8ulp),
-	.method		= IMX_RPROC_NONE,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx7ulp = {
 	.att		= imx_rproc_att_imx7ulp,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7ulp),
-	.method		= IMX_RPROC_NONE,
 	.flags		= IMX_RPROC_NEED_SYSTEM_OFF,
 };
 
@@ -1235,7 +1228,6 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
 	.src_stop	= IMX7D_M4_STOP,
 	.att		= imx_rproc_att_imx7d,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7d),
-	.method		= IMX_RPROC_MMIO,
 	.ops		= &imx_rproc_ops_mmio,
 	.flags		= IMX_RPROC_NEED_CLKS,
 };
@@ -1247,7 +1239,6 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
 	.src_stop	= IMX6SX_M4_STOP,
 	.att		= imx_rproc_att_imx6sx,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx6sx),
-	.method		= IMX_RPROC_MMIO,
 	.ops		= &imx_rproc_ops_mmio,
 	.flags		= IMX_RPROC_NEED_CLKS,
 };
@@ -1255,7 +1246,6 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
 	.att		= imx_rproc_att_imx93,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx93),
-	.method		= IMX_RPROC_SMC,
 	.ops		= &imx_rproc_ops_arm_smc,
 	.flags		= IMX_RPROC_NEED_CLKS,
 };

-- 
2.37.1

