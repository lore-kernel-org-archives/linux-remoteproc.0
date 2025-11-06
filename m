Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011031.outbound.protection.outlook.com [40.107.130.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F602D7DE8;
	Thu,  6 Nov 2025 03:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762399864; cv=fail; b=aiFISfCbmqrA01xhD8jY3ZdVBHDSVTnV6Llb+V8KXJTPny40Hc5RrvteqboS62iqbbeueiBkc4VwWwEqSGZokTyOWrpQ1RztTR7a8Ia0EWLJJfA6LHklltKgRid/wNlWv1yTg+YZF/lfQLWgJANJSuBFD2bW2EYQolPlmP1eqXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762399864; c=relaxed/simple;
	bh=7bT/qKReJ8+5IC8OjjJeicEqFIHXrjl1U8G8/ppDtRI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZBlYFukXFvRPry0vD/wG/NNfJqsnoUGl79VwyFMcOQItWwFybEtG8kzhYM+DzhdW5STjT6NdIk3JuaFXh/ypgZ/GkrgFph32im1t0fyWOFtrWw8fiiHhx+jyR5f/yOJ0kjjuPkmdMT0HSmnt30SnPljq14tGNNa5q/Mv+rzyZRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QGo0lXho; arc=fail smtp.client-ip=40.107.130.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QGo0lXho"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qIEmW/4hSYOZ6Vs2nScLyoa4aYNK0jkV4WIjY/qYzIqPMd+M8MFLWveT9Cflls0hXKTES+zf3tIVj7Iz1CrgTF6o1bZi3GaJc1U+/xJnzNaYMJ9qYwC7N49rflQ8XOFjG57UGw/+de9HgAPSCi3NID7uwXuJ+IZIdTJXeqC585tAuCeohw/J8mfU5IKeY2MYgg1KIBYnfUcOHeEST4wVTUUe8mQij956gvehoEji0Ha+nzynnVbHrLOkZbBRW5fggeYwmmM4SrI65FPV7evBZL485myYvISBTa5IX/ndp+qLM8p98xz9XQmVjJocbAcReg9MAc/mQsq+ZBTccTp7+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3/aDG6F7xct298dmP1GLLktRHSLN4xNEFVtye0/WJY=;
 b=d/A7g/dFBEsi5OOWaF78w40pMmVnHaGpnjVDdaxiXANggZdPs31OOWiFe2huWdH3REfAFQQeo9epK+cQjYuxURGpq5G8H617O8ESsEGZATnCUfmGvUPe/hyNT9Wowk4wf+q14VlVyIza8g7/fAgkF/6p7SKqUpYwkEv+gJj/UR9pnH/UWLSMTyJzuDSryUXMxH1tZIYkmue8W6AfDi39K+Vvte6ppIb9Bo/UaGv4rzeQx/iA4te150NmWwUY7ETxOTMoxipe/0QxwRhaW8oV5rXxsMBlEUY3Z5rLhUJxH5X2YSplZUKur0woj4JDsQcetsC5v7w6z+OMZ0OFINoNVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3/aDG6F7xct298dmP1GLLktRHSLN4xNEFVtye0/WJY=;
 b=QGo0lXholdx8lCIX4p8sVgZ30pBDAbqr4ggWdl6hhYJwyCpg+6WCZCY1EpsJVZ5b/aItTcsMJMUeDiMSCHGWjITuMJ480+mg85E/o2YG2VAZ/LRIM6Ruyc5oJglFf5zEhsXTtEledKDziegsChoRkzI7hAB9SxJGQZCKwG+GaYJAEFbWY4/vnV75XZ7Ab5G5NtnTo4WpIhnjVTUl2P1w4rSu4slJluNX+5H2IWbWiBI6/S039HpnxYwuuLLA+mJPtBcNO/8S6kL9pbVkVb8EdaSWQhUM5zSZQMCHSTe7epIX9U0SUeGH/w469nceZNxKNBqMNHExr0xE/wS0CjIQaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 03:31:00 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 03:31:00 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 06 Nov 2025 11:30:28 +0800
Subject: [PATCH 02/11] remoteproc: imx_dsp_rproc: Use devm_rproc_add()
 helper
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-imx-dsp-2025-11-06-v1-2-46028bc3459a@nxp.com>
References: <20251106-imx-dsp-2025-11-06-v1-0-46028bc3459a@nxp.com>
In-Reply-To: <20251106-imx-dsp-2025-11-06-v1-0-46028bc3459a@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762399839; l=1309;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=7bT/qKReJ8+5IC8OjjJeicEqFIHXrjl1U8G8/ppDtRI=;
 b=Y/6ytkYKKJDnSAN3SNpEMoYLiVS0sY2LUpFh27F9vPj8iYsc9pJb839AGMj9r3d7BXhduUWwf
 zVngwb6gHo0DL/QlJHPBiDP6Q1EX0c69a7Tr7VUUzKDEBceLLFGZIZ/
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2P153CA0028.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::15)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS1PR04MB9287:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a46c9f3-790b-4553-3e56-08de1ce4e7bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|1800799024|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RldsTEtlMXFkb0hvS09PemJWeXAzZWV3dkZEaXdoSzFvVmNmbTc2ZlBEZlhZ?=
 =?utf-8?B?WDE1VFVLeEJEY09UNnM0K2psNnJka1UybmtnVVFlQVNlNWZtU0NxT2s5THk2?=
 =?utf-8?B?aVV3Qm53emxIcmZkR1pUYUlBRFYxcXhiY1B0UU9MZXBLeitQQjJXY3F1SXVF?=
 =?utf-8?B?V3diNDhVSGZnSDlDZFRvaVpyd1lJbEl4QVQ5Zndlb0wrbE13RG4xSHl3d0lQ?=
 =?utf-8?B?Y3N6dzVuQmRDcm5hSU1qbFdNU3Z4U3pRRHlkYkJDOEJIaFBTZDJYTWJudkNI?=
 =?utf-8?B?OGtOdVkzOU8wNkw1c21hdUJnakx0MFY1bGg4dG00RVBTL0dTR05walVBRFo3?=
 =?utf-8?B?RmRJQXEvTWZ0V1NqWG9oUXVnQTd3Y1FoUzYxUmMxWmVJSzhHZFd6clpNeG10?=
 =?utf-8?B?eWJydm8xUVhyQWM0N3lSTDJrcHZvSjlzV0ZGUWFOZ1hwUHgvTVpXNDNnVE9i?=
 =?utf-8?B?eFhxNnZQUzRna0wrbWkvdzFyZk5BMXdzckw5MzJ3Mi9rR0RlUnRobnh1Z3BQ?=
 =?utf-8?B?bkpVOFJ5TDdqWGxTUVYzQWhZTmkzdFUxZXNlZGdBTXI0M3RSWlNwSkxXQ3po?=
 =?utf-8?B?UGJOS1NNSkxadkFTMlhUZUNiOHhOOVBjTW1keFJBYkRNZUZ6RS9VdmFaMk5X?=
 =?utf-8?B?em9XWFpnSS9aemVnN0NScWt3bU5sYkU2Rlg0cHJJaEJGbktPczA0M2g2OHJE?=
 =?utf-8?B?RThYaitzeWQxUnAyeDUxKzc2V1FMbXdhMXMxNGhFR1NWWkNYUFlNVVhwMDUv?=
 =?utf-8?B?akhYRjl0RjV2akVNZGZMcmNMKzAzbDlTYkEvM1dqZkpaQS9BR29rSEhMQjZY?=
 =?utf-8?B?TkhvdG5KVGx2SmhlcVlyb1RaWEk1ZC9xVStwbStLWkwxNXgwaGkvdExkVFFL?=
 =?utf-8?B?Wk15amxjbkhRbTJLa2RXQzVsZ0dHZWpQRnNab211N1ZEdjBTRURjbEJnaEJy?=
 =?utf-8?B?RlRwaUFoY3J4dzJSV3Bzczh2NE5HeFVrbmsvdmthYTEveWV4K2EvZERjc0Rs?=
 =?utf-8?B?UjBPR3lkbUZBMmZYOXFQeWkya3pxd0IxdVdnN2E2V2VLbTZVRTdiaDU4Mzdm?=
 =?utf-8?B?M216aUtWanRBaFJVY1ltb2gwR284aS9Xb0Q0akJtTEFUalJZVndDSC9jQ2RB?=
 =?utf-8?B?amhURDBNWFBHZUdEOGVqNnpGaDBlbDFQMW5jU1RtYkU3NDBKRHhYMEQ5QmZH?=
 =?utf-8?B?MGtxZFVzYUR1V0ZXby9TdGR4QkxUK0tFMVZrcXpkV21WZ1BkNzBtdnRoNDVi?=
 =?utf-8?B?ODU1b2pkTTN3Yk9QbzJZTmFTMjVISmRvcFN4VXdPbkhMOXovWnFNSVNrY2ZB?=
 =?utf-8?B?VU5tY000aGRYZG02dHg4UC9PTC9qaFlSTEdPNDNaaVVUa0ZnSVk1ZjljTmMr?=
 =?utf-8?B?Y2lPZXBVS0VRUTUwOWtpUFhBTy9VYkhwK0N6WjhZcmFscnpPOXlFcUJ5R2dF?=
 =?utf-8?B?NzJiVzJYSWhnVjQ1bDdvNHpxNG5YdDl2MHM2Vm16WE5ZWHZrYklpcTRtNHE0?=
 =?utf-8?B?NU1ONCt3Y0xaa00zWWJLTmo0MHlFNi8zRjAxS1R2eTBSTTRIbUxJeFh3bGxS?=
 =?utf-8?B?d0QvQkUzTS9RK1ROdFJNaTM0TU1tb3NyUFNta2lpbllBbEtDT2ZINitJMWRJ?=
 =?utf-8?B?dXdzNEdlTUlnYml0SjdKc2U5Mld4RHhDdXk2T2lVS0l1RFFwVUhDQTNJUk1Y?=
 =?utf-8?B?cGVGbTVsNkZXWngyaldnNVROZ01DdUpRV2NPb0h3bElHay9FNkJqb25SQU9i?=
 =?utf-8?B?aWZMaDkyeHhHeVhFY0FUekpXN2Y3Wm1OTSsyT1RWWHJaUzFibjYyYm1CWkxx?=
 =?utf-8?B?d2pjbmpSVEFWRStobGwyZVkvaUd4eUxENGU3UEZuWGJwcmZvWXJHY1NiaWFF?=
 =?utf-8?B?NDkvNm8yUmZBYTczSFhIOTJoV3dMU2hRWmZmVms3TnZLQlE5OUVGbnhlTStT?=
 =?utf-8?B?MkJiSHhJbXNRK1NYQkQ2TnRDNzhmbTEvY2thTGRsZklsME9uTzVyejhmeHUz?=
 =?utf-8?B?aEE1eklMcHZybU1GOFg0RmlZdCtRUHdKWStIQWVndVdnS3lDeEVFSmRSLzJV?=
 =?utf-8?B?VDdIem1ZVXlDRW9YKzBGV0UzUnczR3hJOWtnUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGZHZStRRTZWQmxLdXRqTUVXYm5FWWJXR01wWDM4dVBKTm9nRFdHNHZKeTEw?=
 =?utf-8?B?c1hycXpBdVJOUjRTZ2VYdlFZV3Eva1B6ZWJTZDB6b0NqMzRJU2kxdEVrTE9r?=
 =?utf-8?B?S1NGeDJvZXcrL3BIVm9jS1dJSE9uUjNkOE85K1JGL2diREg2TU9hcmhQUFFQ?=
 =?utf-8?B?dXRyNVc3bG83SkVPSlJFZUNnSmZjR3ZKbGdWeUtrZWRLZlc2enpFNXRSTHNB?=
 =?utf-8?B?RlRnOG5RaEVkL0NZTzFIRk83d21tdjhZZGI0ZVhod3kwYXdpWTJ6QXNGTDlX?=
 =?utf-8?B?cGt2Mld2QzBMa0VyYXgxOXIvcWtOY0ZxNE54cCtSK1R2c041RXBudWJiTTBu?=
 =?utf-8?B?K3NnakF0SGdxR1lYbzJ1YmlYL01lQzBpRzREN2lONERvRCtqWEtVSkxWSjFG?=
 =?utf-8?B?d0dOM09oNnAzSnNOdGNIS0xMS0Y2aXFMTUdaWTRsOEVwRG5HQm1haDlmcUhU?=
 =?utf-8?B?a0lzK3RGRExmTWZzek1aTVlOZnhWSlAyblh2RjladXBHMUlKN0pVUndSOHF4?=
 =?utf-8?B?dXhabnpxQSsxZFhFcUQ3WXZVVXFIdDJ4aUVoN0hrS1RDSi9MSEE1dVV1azhI?=
 =?utf-8?B?d2RmdWVtWElmTmVYN1I2Sm12ZU5sZ0ZZdnc4dW5jYitvWXhOZHpyQms5LzlU?=
 =?utf-8?B?QUgyNFZGODlIMHdmTUY3L0l1SGZWZzRYaWY1NytFVnl6NG5LKytjODUvUTl1?=
 =?utf-8?B?RDFQOENsSEpvK3VOZnk1eW4yMDkrQThsdWV1Q1hjdkZQemFpZmZaOXBaVUo0?=
 =?utf-8?B?UDF3TGt2TnB2L0h2OEZHQzVJUVJ0UCtmalowdjVBeEYxRmh4QlhEejFnVzFD?=
 =?utf-8?B?YWtJZjRWZFc4V2lTZ1VnWC9uSW9LWU9XMHFmeU4vOWZucFlTV0Rad1NGL0VZ?=
 =?utf-8?B?RXA2UVpxZjlpV0g3Z09Fc1pIL3RVK2d2THpjSW5iSTM0WXNtUFhiWFJwejlH?=
 =?utf-8?B?NHVTY0Q2ekVlUkU5NDBDQmFwem13elB2MUlOajU3VWNaMFlhK0d6SExoRDZL?=
 =?utf-8?B?TGtGRkh5OUExYmJkSzB3N2RnMWtiRXZOR1pwQjNpa0g1Zk0yU1VhVm1sNlNy?=
 =?utf-8?B?K1d3QUpIRHFhbHdBYmUrU1F2YVFFL2JFa01ITUUrVzkzYm5WYW9pTlhuR0lX?=
 =?utf-8?B?WFpJSURzbnM1SGRzU1M0SkJ1YlJOQitYeWY4VnhBYkFaaDdYT1lWTGFFSkZ6?=
 =?utf-8?B?TjFBYUc2OXYrdmRwVExGZnVITHU2aWQ1dlZ0MlVjT1NSK1JaeWJzOWQxTzR2?=
 =?utf-8?B?VXlOK1NxeTNSeEZEMk1SZ3VQR0NOcUhueFMwMWNLTzd3Zi9PWlRiZHZtT1J3?=
 =?utf-8?B?aUdpUVJWLzZoQlRNOC93cDZSMFVxSklqZ0NidmJCbDhFTXlaNWdwNjc5NUxm?=
 =?utf-8?B?VWxzWkRsWGN3NzdSQWovN3hiTzFXcXk2VHQra09OV3lkcFpQdzRDWXR6ODZ3?=
 =?utf-8?B?NXlzNjMyWGtFL3Z1cXpRbGIrQTU0U2R0NTJ2RzdVdVQ5TjBBYlJNWmRBc3l2?=
 =?utf-8?B?ZDU2VGt2c0k3M1lDVnBQSmtQWTB5Y0ZIVTY0Vnl1U2t0Q1JPWC9qWUZpM1dz?=
 =?utf-8?B?V2NvTGoyWnNxWlpQVTNIZ1c1RTRITFo2TEFDQ2tMYUhUQ2o5R0xmeXdhTm9U?=
 =?utf-8?B?Vm9TSENvT1YxRWNSdCs4b2plVjBWVE9sb1Y4VWhKd2Z4NUpOUnRCb0lUQkE5?=
 =?utf-8?B?WEpMRVY0WlhBa3hubThhZE4yK2V0VndIblZsUWlXOWwxN3krR21tNHRoSUpn?=
 =?utf-8?B?ODB5eHZGbVZPMngwVUdiK0o1U010czlsVUF3TEdsUWdwQmQvVDBDbW1GTnpt?=
 =?utf-8?B?d0VWbTBjRm1Idk5leFU2YjBDY3lvOTZGODZjVkNLOHN5cWNsVFVaT1hTT3g5?=
 =?utf-8?B?SzF1eDYvYysxYzhtYStpcmZQeEo3MVgvWjZyL2VMdGFOaU01RFV1SjhoN05v?=
 =?utf-8?B?VTZmZkdZRlcxUWhjZGx6Vy9lYis3NWtFeG1iVkhXV1ZFQmd3TURDQlFWV0hz?=
 =?utf-8?B?VVhJUWUySDVBYzUvK25KRmdSbXNvWjZ2VFR2ZkhLazFJL3lRNU96QWR2ZUZL?=
 =?utf-8?B?bUF4TXp6c3l4b1RocTV5aTVrNjB4b3h0dmczeEMxRDNYcWFqL3JkN1A5Z0JN?=
 =?utf-8?Q?kefrUha+phDmmbKuKpe7A53MA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a46c9f3-790b-4553-3e56-08de1ce4e7bd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 03:31:00.0727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xCmghX3xJjBpYu1H20AVLMCU1cASnbanrU0UrybILfJPf0BZmoLuEKSNq7khGQExoNetZVmko9FO1IIP+za3vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9287

Replace manual rproc_add() and cleanup logic with devm_rproc_add(), which
ties the remoteproc lifecycle to the device's lifecycle. This simplifies
error handling and ensures proper cleanup.

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index c466363debbebe8f91b908b3bffaa32e9bf8b9a6..df6a4126538d22ff6e02145edb5ac13c2d72c949 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -1194,7 +1194,7 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
 
 	init_completion(&priv->pm_comp);
 	rproc->auto_boot = false;
-	ret = rproc_add(rproc);
+	ret = devm_rproc_add(dev, rproc);
 	if (ret)
 		return dev_err_probe(dev, ret, "rproc_add failed\n");
 
@@ -1211,7 +1211,6 @@ static void imx_dsp_rproc_remove(struct platform_device *pdev)
 	struct imx_dsp_rproc *priv = rproc->priv;
 
 	pm_runtime_disable(&pdev->dev);
-	rproc_del(rproc);
 }
 
 /* pm runtime functions */

-- 
2.37.1

