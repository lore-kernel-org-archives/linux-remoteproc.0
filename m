Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013038.outbound.protection.outlook.com [52.101.72.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B8727FD43;
	Fri, 31 Oct 2025 02:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761877557; cv=fail; b=Dx9upd934u/WkjtoLFIf/8ISBCMsZo8RwIdt7Jw7MH5Mv9yN1dPIO7sGzqxUKa3sCa7MoZoz6qMRoOTWNMF/7r8Xep/USqxLnS3KgvcQH2ail+DblBCQbbw9QcAkwb7gbqX1aLDnXu3Ex1qOAXB5/jCiFZm5Gzp3jseSihGrBbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761877557; c=relaxed/simple;
	bh=6QQdBe0YOHA2brj2JUMB3O41qgD5aDmxA9QVEn4jgeE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PST5BZna6/iFaNWcSTHvp+f97Dh6dlOS+RtvQK4efj4dAvz0ZrwbNaA/+asH2TbJpldkp2Bx5xvwxgppeQST/SJBCX0g9PB7i91IMp49MAdDGqWwDohgXRrJXraHabU6Ih36RHKASGoxeMBX0Hrj71dcHC7VnIm1NQh7uX/Mamo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PkfnW5y4; arc=fail smtp.client-ip=52.101.72.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PkfnW5y4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KGAE17zRhfZDbh0tkaxL3XHuGRRdW/+XJ9Md6qOCU8RQFUo4QVhfdtZXdRvkrscVA69AGQnx93SrFIfGSXKM0Q1TVG0Q/m135c9q2CtrvvmBH+zqEG05QRiE0AVPkjcAnEKRKyeMoPwFkj7Y+aenBD8Qb9UIgfyhXV0NnQ5bjNpGjxe+j7JZmgE2EKUO/MwULfErGz4ur7VI/RO1/fogeuzulHIwoyvhRR9naFh5fhsth4MXLSW8uEOKFDB/4uu9UN+xA1J2eeA72zbFrv4SCsRUt2I0C2yIrEOLFiEY/RuO1pxB6b+9x5DBNSyoh7WaSlXRCM8BGF1+pZw6tAUUrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CxKTYyO/Nz/KGrPqPvpHft1m361YrQ6HJ2E7cF66Wsg=;
 b=Fi4+fgPDYmIe3FExrCcUGTeTOW5egKkajU2bLfptyO26XTC+PLgBsPz3fmy4iToYVi6oYeQN6YEzSmTEzHi+vIugEFJfotKNCyLW/t1bkHS5gBkC5IYhy7zF8OhvVkFAwHFPenZ7iXhvd/VcEJgVWuYoKqA7G3ksvW1TMu87Q9M2fvFTIRgKbtOTxcH7gmz9Khk59on08twPW8A0Px+kSyZcAMaxSog44L+HTitmW0QeDgF13QIZO8POfAHAI1u3e3hoXSAymG9RHPd/G+gcoFl/dVhtimWkf1CF9NcTvLswv85eONCqL7CZj2sJMnbtuQCYyz9wTNhIySQjNk91Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxKTYyO/Nz/KGrPqPvpHft1m361YrQ6HJ2E7cF66Wsg=;
 b=PkfnW5y4cRIqrcxWCunRn03+lSy7rx/8hzFE4Sye0fNKzVXpx/5gf4YpwKgR/Ptf2Wafq+/4T6N9kfBkp1e+S80DqeHPKpPYigu6+VHE4UMH6sNZeaElPqp4C4UCDATf52Uhdw01u7R4a+NAFG34fJ1QZF+rv3kYb+fftPYG7XmIgrKM299mB924f0SjE0Y6vH137FzZhcqboGuWebX6CMXjpaYpEC+JcGLdnEuQ2bjJ3VcPillureJRvfcxpl56r3gfusQh3qw5AayS5MOwgBxR5/0QseOb6APMqHpQeiC1z+IbIr/0TvFReS6zc/0LrRxit/1N7kIlUKUMemgqvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA6PR04MB11952.eurprd04.prod.outlook.com (2603:10a6:102:51b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 02:25:53 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 02:25:53 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 31 Oct 2025 10:24:56 +0800
Subject: [PATCH v2 5/5] remoteproc: imx_rproc: Add support for i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-imx95-rproc-2025-10-31-v2-5-758b2e547a55@nxp.com>
References: <20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com>
In-Reply-To: <20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Frank Li <frank.li@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761877517; l=2102;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=6QQdBe0YOHA2brj2JUMB3O41qgD5aDmxA9QVEn4jgeE=;
 b=7GmwWeoyin5WR6UwtdWu0OxQry1PRxT8Z9TTHfDOX02sxzzS8qCHbzzkRbbP08WMfLVS/ekmj
 qNIsGxsbakkA/PcjXfSHtFi3L3QMYPIDqnQsKXQ1PzeZOmik41jpUXm
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0155.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::35) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA6PR04MB11952:EE_
X-MS-Office365-Filtering-Correlation-Id: fdc9eae9-3c8b-486f-9dcb-08de1824d05f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eEg2K3dGRTc2SWZ2ZE5CL1Y4WjlHbnlPbkZkMm5kQUFWMis1NGtKT2xvVms5?=
 =?utf-8?B?T1ZJM1ZLNEFTWjZEQS90NG1QeUlvYUJqTVp3WWM5dEVTbkpIRkUvak90UUN2?=
 =?utf-8?B?bWtuRi9tM2pYU001SjREVnRFT0JHaWJOMkIySlhkVWVCWVRZWnhtL0srSytU?=
 =?utf-8?B?S2F5NkpVazNBTWQ2S2FQbldxMDVFUnU2MEhTdzh3cy9rK2xqbThOQVl2MjN0?=
 =?utf-8?B?b2U3QzZnMnZZSEpoU251aklmbW1IMDdSczZPNmFxSUkrU1p4c3UyT3BjajFs?=
 =?utf-8?B?cHYyaEVlRmMrMytMOXlVbDhjSHhyQzdvZ3IwOGVJcjVtaE5qUXk3bzFPK1ZV?=
 =?utf-8?B?QmVMSjkxRmljRHQyTTNKbFJHY3lqK2Rkc1orZVdNelN6VUJhRTVNdnRwbnhp?=
 =?utf-8?B?d3FvQVEwdTBXMDNuU09DcGlFMk1WQ3JmaCs2bEVUcjU5c0luUzhFb3M4S0d5?=
 =?utf-8?B?NGYrTDhvVDZoMFdLYk94aDhaa052cVd0czN2WWVNT0ZTYWt0dzYzeFlISjk2?=
 =?utf-8?B?MzVVWE85aC9BUGNxWHhXL21QZk5aY0h4Q0MyY3Y5VDVyaXdEcU5jd3h2QVhW?=
 =?utf-8?B?TG9WSzFxamxKQ3ZEemc4WDFpcVlZdTNMVFFHZXYwcnZJRVRLSzRQU2thNTcv?=
 =?utf-8?B?NXJHYllyZ3JyT2F0enZKWXBMcXR2cDd1RURieExxTVgxSW1OQ0lrOElxa0Fj?=
 =?utf-8?B?Mnh5Q2JDdUFVQjFqbDh1aGRidUhVbHlmVmF3VWZtd2JEbXcvUFRDUWlwdkty?=
 =?utf-8?B?NVJuWVQ0d3M3SkxNeUlObmdlUytiSHZaZWVJRk0zUGhRamRZSEZyTk5GamVD?=
 =?utf-8?B?bXRhb1FvZUUvYTZvOGNtdHk4R2ZNZHNQc2tRV2JDQi9MaC9ydEtRTlB4Yjl5?=
 =?utf-8?B?MTdzL2VOSUx5b0c5NllPM0p2YWNuUEZORHJBQzNYallTMzg4SHJQZ2VlV0hT?=
 =?utf-8?B?Uk5YbUZmTmZGbXRsanJaQzRyYkQvMVFzRHd4dnFZSExMT1JSalhDRUNjK2JD?=
 =?utf-8?B?eTRvRE51RStKL3hkQXQ0NlRxNGRMQWVoci9ZYXR6d0xRRjBua2FYMjBBdXB3?=
 =?utf-8?B?Y1RzeVplNFRCUVdKaEo2dk1mekRjVXY4TklFcHBIRFpTYlF0MGdmcWQwVHpm?=
 =?utf-8?B?VzlncGhFeFRJZitYUHREdmtHNmkyOVdGS1NROGM1TTNnbHh1ZkljZEZLYWZp?=
 =?utf-8?B?M0p0N25LTENHMlBVWEZPY2xUeCtKVThkYWNiQUhkVWpjbCtEbi9PVjlWR09x?=
 =?utf-8?B?U3FBZ0ZUQXQ4RCtPQTZ2MkdxOVFobVFmaWFZei93bEwxelhXYUdHN2hQYzNl?=
 =?utf-8?B?bXhoc3FXVWF6SjJQaFNlUjdqbmpvcHlFdHpqeU5IZ1V6SzBCd1JBc0xlSGgv?=
 =?utf-8?B?TDNCOENWaE8yQmZVem5RRWg3c3NHWnhrUGlnN2xQYTE0SFdjcnBVaENmZTlI?=
 =?utf-8?B?eWhUazM4VTcwT2RnT0kwcHgwT3Y5N1NJS2lKUTFqOVFzSlovakJiWjZqRlFt?=
 =?utf-8?B?cHRMa3pITXV6eWpHL0lQdEd0aXc2dUxzN2MxdGREY1ZVVWQyT0s5WXA0Wm83?=
 =?utf-8?B?WGVlUWsrVFhNUWRhd29jajdGeXc4bk9HZlJuTXh6UXdQWXNvemtyUytXODd5?=
 =?utf-8?B?cWo4dGdCZUlLV0RKazNwZXRneUJ0WmhRbDFKK1k5SGU4UVEveEwvdHNaYitG?=
 =?utf-8?B?WXNmYi9ocUJNbi9CT2dEcTBxMVZRZjJKb0U0eEFTMUFEYmFoS3lQM1NSeGY1?=
 =?utf-8?B?Y29FNU9tRXRtS29leDlYVlh5QWQrZCtBUG5iR3p4WnJmeG9pdy9EaFNWTjdn?=
 =?utf-8?B?c0RPQ1FTaXpYbzJQU202R1R0OE1Yd2JycWxTa2lpSjV6MWdoYzAyYlg3ZmtE?=
 =?utf-8?B?b3VZYUZjTmFhdS9SK0t0S3FxRC9ZdWxLckdzei9GSzh3SWpSMkFwYm9oZHQ0?=
 =?utf-8?B?THJUWEUvSUFsZlUzdDcyZXJKdjdacmFtRHNuRlA5eERzK0dyMDJUWnRMbzBE?=
 =?utf-8?B?aWxrOTVCZ0l6QUhxUjJzM0VoNlFacDhJN0JSSTUvZWVxbE83NEdCK3hOTlc1?=
 =?utf-8?B?YWZCR0NLU1pTOWJXZGdQWUxIZHo5ZGZLL01kUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3o1RWVNZzc3UTE2RW5vT25Ta1NJVUMvQjNPRi94SlhuNUVVL0hUdWx5UXZn?=
 =?utf-8?B?TW5sVUYwcFUwZkttWXlCQkRwMnB4ZFRtdDBFcDRaOGNIQWJiN1MrazV5eUg0?=
 =?utf-8?B?Sm1neUVBMTk4dzJCM2twSmtuWTFCUStsVTVuNlNGTVhDZzIrOWczd0lIbmhD?=
 =?utf-8?B?bUhZejRlK3NnRXF3NW56Q2tRbzdFNHk0M1NlWFNibDFDR2c2ZWp5c25KOGVB?=
 =?utf-8?B?MU5ockVHSEpaSkJqTDNmUlc0Sk1IaEtUVjB4OEFQMGJRd21sWFdYVkdSZWti?=
 =?utf-8?B?VUdJMmdicHRFeGNRNUJ4d0g2eDYwbk1LWTNOZ2x5eW5Ddlg0a2N3ODFKUG9m?=
 =?utf-8?B?OXZlWUNPK1FiNjBhOXBiQlhwNDl2Nno4VWF0dHR2Z3VjOHB5OGYrbEc3SVRK?=
 =?utf-8?B?QzJmNE5YR1krbHBnRmxtc1RxVGFUODRITEd1RENrbDhVb0hJb0ZtU1FmZnZM?=
 =?utf-8?B?dWpkK05LTFkwakhFSlJSQkNYT2ZJd2pHSXZJLzJHSjdrVHpvMkFjUTVaNjhP?=
 =?utf-8?B?ZVl0UkdnT1A4SUZ1LzRYVWh6ZFVGV25aWlFGRjFwck80ejRNZmJybVZVUzV4?=
 =?utf-8?B?Ni81bWMvajYyQ3JpOE5OM3dmQ21XcnljWHNOYmpMNnhkYitVUUxyTk04WnAr?=
 =?utf-8?B?S3ZNV2VQM29WWVB5N3lhb1Q3cEs0RjFRWWsrVG1maFVmMEg0R1ltd0FZN1lK?=
 =?utf-8?B?NVIxTXpNTXlLSWVmS2k2T2RVOFppZVJ2a3FlVFE2cXIzZFc5UGtvWXZYTEZI?=
 =?utf-8?B?RHVBcFlHenMwL05iSS9HVlNicDlGSjZLTTd3RGo0aDF4RzZSZjZyL2RrTmIz?=
 =?utf-8?B?U3JzTXR1NDdjb09KNkJlSWk1Ri84SkxPMEtMUlQvc3AvYmxtSDFqaTFUU1l1?=
 =?utf-8?B?REllL0djTHRyZGpHOUxFaFFqNnljZE1OYWg4bGJueXJ1MGp3R3NKaVp2WG5P?=
 =?utf-8?B?eHphUWdldmI5R3JKQmg5UEZIOGFOcE8rNVVqZENHZ2lTMzFRSzFYejZxVUF3?=
 =?utf-8?B?bjc0SUZqdmZjZm9UY2JmSGFHWjRTRTlaaGFzRHhWMEJvMEhidWxUdzg3cklk?=
 =?utf-8?B?dlRBeng2WEVSdHAwVlBjQWNNeU1PeEFTbVZXdnFQVi9xOTF1Wk9LMWZKQ1Zq?=
 =?utf-8?B?WHJPT2p1RWwzNGRzckxzbE85YXJVK0ZYYVEwaEYwR0ZhWStsVUhwTUVTa01V?=
 =?utf-8?B?YzI0WXhRWC9aK3ZFMEdiZE9taTZXT2JaSFl1RFZzRXViSjc0RXMzajczaFRk?=
 =?utf-8?B?MUF0NW8xOTh4Nk0wTjkrWmc2VzVsZFV3T3JnU3BXbUtSR3ZyMytYUGx5eVNV?=
 =?utf-8?B?WFAzaERaTlNZclYra1hpaWJpWG5vRVEwU2Zta2xkdVBEZTNzWktwS1Bud3d3?=
 =?utf-8?B?WWZGL2JGcEEyVzdOWEV4UFlnTjEwZXRmMy93KzhxSFhIK3RHazhMNTRhc0tv?=
 =?utf-8?B?TCtDZ3F3cVBXeU9PTjU2MUo5OXk4MmZQcVUzZE9JN3ZLUEVGLzdoemdmY1ZQ?=
 =?utf-8?B?cXNCQTlRdlhKQW5Fa3JHSjZsSUpwSVJzemxZM3lvRkJwSklVVXM3czhtTUlw?=
 =?utf-8?B?L0h6a0lkM0N6TFZKb2pBL1p6d21PTVhWZGFvYVVCTzJtWGFjT3FNR2VpWlRi?=
 =?utf-8?B?M0RMdGF2WlgveFV2eVNHbk9NRm9IL1I5SVA1MGJBV0k3SGdidHhCc2Y4RlFt?=
 =?utf-8?B?TjArWHEzaTdRWE1tTkM5K3hCRURmTG9WcGMvQ1JnZzd5ZVpLY3piYW5BdnZ5?=
 =?utf-8?B?eDd2WC9VZ1o1ejFtS0ZZbEwyMUhiK081QWNQNzdpR05NYTVjUmVZVGJ6OWk3?=
 =?utf-8?B?Yk83akNQYWkvMVl3enpkdDRveGtjdmJ6cjhEb0ZmaVFEOEJMdmJIc21vK2Fu?=
 =?utf-8?B?ZUYrbXVBWWt1eGYzNVlKWjVmTklUK0p6TXFEWURaZ092YzZNZENoTmhadlRr?=
 =?utf-8?B?N0RKdkt3aWQwUzZ1c2tTTmJSZHBBYnIxSFBUc2dUUEF3MmxlclI1UXBtdUhx?=
 =?utf-8?B?MTk1MkZ3aU1DWUhOcm40cjNRNzRhVXI4R3FmSERXNUJIa1hGQWl5ZGpHblZO?=
 =?utf-8?B?aFRNL1JvbG5JcERGaWpCR3dvTUxSMTJ5RU9YMnVRM29WK0kxQVpQOVRVM1ht?=
 =?utf-8?Q?OW825+CYIqkL4IZxJVFxTFM+4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdc9eae9-3c8b-486f-9dcb-08de1824d05f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 02:25:52.9633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kUx51p8trdkVuj3gmjDG3EP1isBQjn1mFwRTuio8n6gXV6n3hO5NKOgDZ4PTsuzRQjmMHhgIlQwJUa/161QfwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11952

Add imx_rproc_cfg_imx95_m7 and address(TCM and DDR) mapping.
Add i.MX95 of_device_id entry.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 1fb17701964ca4ee4b73d343b5ec1be8e2ee5fda..63f6362c0b8a3eebc92f2d631fe694ca7bd4c03b 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -127,6 +127,18 @@ struct imx_rproc {
 	u32				flags;
 };
 
+static const struct imx_rproc_att imx_rproc_att_imx95_m7[] = {
+	/* dev addr , sys addr  , size	    , flags */
+	/* TCM CODE NON-SECURE */
+	{ 0x00000000, 0x203C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
+
+	/* TCM SYS NON-SECURE*/
+	{ 0x20000000, 0x20400000, 0x00040000, ATT_OWN | ATT_IOMEM },
+
+	/* DDR */
+	{ 0x80000000, 0x80000000, 0x50000000, 0 },
+};
+
 static const struct imx_rproc_att imx_rproc_att_imx93[] = {
 	/* dev addr , sys addr  , size	    , flags */
 	/* TCM CODE NON-SECURE */
@@ -1444,6 +1456,15 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
 	.flags		= IMX_RPROC_NEED_CLKS,
 };
 
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx95_m7 = {
+	.att		= imx_rproc_att_imx95_m7,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx95_m7),
+	.ops		= &imx_rproc_ops_sm,
+	/* Must align with System Manager Firmware */
+	.cpuid		= 1,
+	.lmid		= 1,
+};
+
 static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx7ulp-cm4", .data = &imx_rproc_cfg_imx7ulp },
 	{ .compatible = "fsl,imx7d-cm4", .data = &imx_rproc_cfg_imx7d },
@@ -1458,6 +1479,7 @@ static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx8qm-cm4", .data = &imx_rproc_cfg_imx8qm },
 	{ .compatible = "fsl,imx8ulp-cm33", .data = &imx_rproc_cfg_imx8ulp },
 	{ .compatible = "fsl,imx93-cm33", .data = &imx_rproc_cfg_imx93 },
+	{ .compatible = "fsl,imx95-cm7", .data = &imx_rproc_cfg_imx95_m7 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, imx_rproc_of_match);

-- 
2.37.1

