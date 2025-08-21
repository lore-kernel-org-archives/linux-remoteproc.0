Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012003.outbound.protection.outlook.com [52.101.66.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6E92EF651;
	Thu, 21 Aug 2025 09:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755767145; cv=fail; b=P2f94pXCJvbLp53hiKpvE18f0DKvpG2mdDtTylOPLJWHh2K+sy/Lple601DcLg98HoGp0J9Lw7D95ZdGCyQ5S+Gx2VucZ9M6DSOc4ZRQ3ZmSxjbAy8xcXhvrONfhAlL+GAq1XEGorP1V+9kC4dRlzXK5/urdJra4yJqI/Ihemwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755767145; c=relaxed/simple;
	bh=wha/jyjsf+Y7sTidblPclt0H64zN9JUftZtC5biVmgY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=oWfPRx8Ye2PjoVCroTeIc2zSrwz8+o7asFO6oIApN0eNDjI1DhFka/Kw/6O3ASvn+36CyHJLfX9TG/jS28PHiTO6h68ZkB4bBFw0R8IH27b/Ub26riOV5DsQHr6W5EK6kqFv1wHH1C/u+j9V58R0tn9/4tQD21hjm5bgr0douH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LB9EaFX9; arc=fail smtp.client-ip=52.101.66.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LB9EaFX9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NdWgB1J37XfvuGuRUpFNxzcD0guDpEPXs9CN5/O78LN1MHBm9yI5XRRTrA8QDcvn1lMYUDC3fhdRnH968y2QYKQfEWb5J/1impXktojdygur/gtXVw72rxyBCPkcc1LqINuNEzb0VdiOw5Uf2epHSi/EaGGrDKreNB/RWL2dpoxrvfmlWsuZChheqraX1KvA/LjcP32qigR7afDO2A6qN2DQnds2Ub4VakaZCCMmoIlycmW7Vv8uIerHRwbiFqNul5a1qXLG5r54ak44jSKhoLneHAFdHDkii+pEDUlUdeelaN01TJpkuQS2FtOGPOMqTlYFEZXlZrQAqKD/8ubG2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7t8kqqBCbfTYB5sA5NY00Rjc7fnNs65dhhvHTvBagA=;
 b=YEGmqxD+1PwIxt5/0aax7JjrplWPhWPBhwE2n60DmLEtv33c5GqlrRT8g67wx1BsQCMAAVI/Js6wtPqKBik2DHHG6IKQLZ46lTd01bZmNhtLSHJskoh9KwTWx4vLRHnjvhbCrS/WgVZgiCnWUSSkp6IM5KkuR7BM+fAOBUQSe/usobzuf+llLaOPYstyRRadcPakHX7qob+ythUmYK3w4AHX9xu2o+BvgZtNFJXwGsHrz50289/AOB4oKReigGnpZtyAmvDHaH6oTtVLPwxRmjwpYHI0FFnJe4ax6P4XeK6psVhz8kOw4M7iZoAdVcPCouEsG5ntOuWqwNWD9i/56w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7t8kqqBCbfTYB5sA5NY00Rjc7fnNs65dhhvHTvBagA=;
 b=LB9EaFX9iJTVPhAL9WWUEwILtim6CyDFb57Mt4DBm+dDA1XUoZ9Wp5TzLI8tfsPPdnFHHlGDzrUZr6adBbqPiYSxYVJEmh9cA6NvQF49M++TckwLxdr5ndMxIEeL7O8Ii6OFMnP+ZMH8689gy0T1nP52Zurm7wObvlT3PDQWMWO1YMnDgD1JSh+O/CsoEMBCmjsjJGN9P4tldeZQKHJX9z2hkqX97845Jj25fp7qMIY8mVRUAm82Vg0RlW27c35Xqme5v/y0YzIJSC/MJtvo7OBXkbfjfCJqyYygsWpbNJRR/pcjhZrwCWqa5IXbMcV+UxVX1FbylIF1KUkA3/v8QQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI0PR04MB10101.eurprd04.prod.outlook.com (2603:10a6:800:24a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 09:05:40 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 09:05:40 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 21 Aug 2025 17:05:06 +0800
Subject: [PATCH v5 3/3] remoteproc: imx_rproc: Add support for i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-imx95-rproc-1-v5-3-e93191dfac51@nxp.com>
References: <20250821-imx95-rproc-1-v5-0-e93191dfac51@nxp.com>
In-Reply-To: <20250821-imx95-rproc-1-v5-0-e93191dfac51@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755767118; l=2355;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=wha/jyjsf+Y7sTidblPclt0H64zN9JUftZtC5biVmgY=;
 b=bDdNWHpiS3nZjKYXEI3cmEb4HsGDFApPtdayafEbb8creLC+VRwqiiw/kiM+8F4HhLsv8n8a2
 SeOgjX/o98PDcG6TyPp+PeSys+E0JROgB11q8wWMFuMTUL5HtBaAuaN
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::8) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI0PR04MB10101:EE_
X-MS-Office365-Filtering-Correlation-Id: b6f858d2-c2d9-406e-b747-08dde091e6e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|366016|376014|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aWpOT2tVVnJyL1pMZWZqU2JveEs0NkE2cTlmeitsKzBpd3FJNkdhV2xuamhv?=
 =?utf-8?B?ZFBrb2VsU3FNNjVOSFhRSE82blVKRmZNMnBhMk5HMG1pckRSaE53ZXBHN1l1?=
 =?utf-8?B?WmlYTDYwdURySTc2cXVvaUFpSGlvTVZIOWNmaG5md25DZWJUV3pVc1k3WXJO?=
 =?utf-8?B?TGhPSWVaTWxEb3FSYnQyOTl3VnFRYzEwVFZyMzZtTWM4QkpqbWl3TlRRdmFy?=
 =?utf-8?B?NW1pKytaZEFwc3MwZFVHUGF1VVM5OWQzSlRZWnJmeStnd21tSUhqNGVTUTFK?=
 =?utf-8?B?em81RWIrQ1dET3ZwOTYwM3lBWTFoblBnYUtxbENtNjN0RUw4dEJBT0lDTWk2?=
 =?utf-8?B?Qk9PWVVQSGZZMXVKZDV4NU1VNU05R1BVc0orTVdVeHRWVE9aaXpTYnpzQWxF?=
 =?utf-8?B?VnVEZHQzaFdCT1Vvb3BwdGhvdUZOMW5RRFBocDl3NkV6cm5mRks5T2VUSjkx?=
 =?utf-8?B?NjVINlFUSjJ5RnRnam14dHhUTlRHZ3pZeU1xZnZqLzU3aUtDQ2dIbDJoMzlY?=
 =?utf-8?B?VVBLRmlldkMva1NJLzh2LzQzdVJvcXQwNjcyMnpEZ3ZNSXVtWUY3VWsySmlR?=
 =?utf-8?B?MDNXQnlON1doMUxNME1UMlh4NG16ZXJrKytVam0wUjg0ZkZ2cG1CZklYaTUy?=
 =?utf-8?B?UVVoTHIza2hvK2Y2K01aQ2lNSjRrMVhVaFpEV3JBdnBaK0dKdzZwVDZweHNT?=
 =?utf-8?B?TVJnajh3Rk5INFd2QjNKQ2V2Sm9URkpyMWhzQzNkbDVUZHBjZUhsSG9IZ3k5?=
 =?utf-8?B?NE83NGdZYlhHeXI4NFltOFV3TGR2Yi90SjU0aHV6WGpYeWdTcXJvWktZT1Bs?=
 =?utf-8?B?dmtWWTZ0TGRwWnM5b0JqZXhQVTV2MlY5YVZtNVBSWFRVQ3JkWXdXS1FLZ3Bs?=
 =?utf-8?B?Zlg0aTRoQ3ZFNnBCSE9ZbjFIbHkyM3g5ckxPUUYrWm9OMWJleG4wcDNHanVh?=
 =?utf-8?B?K2ZnSzY1N2NZKzRlUHBRdE5FNE5XQjZPRHIxNENoNHpndkFnM0UwZ0RMUnV0?=
 =?utf-8?B?UGZjdzVoWXlRZEtpbVp0dWlIMlVXU3ducVRoVjFFYU0wVVJZYVZhM1EwU3FL?=
 =?utf-8?B?WTRVWm5WU0ZzbTNOVFNteU1SNldnZnpIWFB4NzJkMWkrVGF1UnhudG5wSFk4?=
 =?utf-8?B?VHI4Vjd2enc2eURFbWVlQ3JoK3h5Zjl6WHNLNWNncno1bGIrTW9tRXNWdmFl?=
 =?utf-8?B?ZFJSN0pRREc2VGVXSUxGdlo2YjVMR0tqRGpPT0IwanNpaUtNZGV5YkdRTWY2?=
 =?utf-8?B?SWozNUtqaW1sNVdSeFM0T29TM1NidHNHQzlaVzlYbjdnYW9YTkVYT01saVI2?=
 =?utf-8?B?OUlHU1lHSW5aQ0N0MkhnU1ZpeVlNNXFudVlka21wQzRHUVBiV2R3SFhKblg0?=
 =?utf-8?B?WTdVY09RSEoxODRPNitLVU5FbEd5MW55cHVBODVia0tTQWlDOE5LTVpLcTAw?=
 =?utf-8?B?VzdjbXp4WUFFTFN0Rm02MVZURk9OdHRHSWFvUHBxZ3ZCL3dtR1VOV001RFJD?=
 =?utf-8?B?bkcrdXg5RWVXUG1VZnR0QVdsek1uSmZ0YzVmQ0Y0czdkc0hUWTJjNXRQZUNq?=
 =?utf-8?B?cllUYnFJc2dSQ2lKVTNINFRXK0h2OE1IMHg4VGh0YVlSRGRqNjBHZXA3WGdr?=
 =?utf-8?B?MzRhb0NKWEc0UmpiNWxkbGVZYzZ2aW1YbEdYRUZjSHkzSUVFS0RRZ2VJMjRQ?=
 =?utf-8?B?SWpOUmZPejBVUFZFMmppb3NJOVAvWXgwWUVFQ1BYeFIxZUdzL1VaREdIdUcr?=
 =?utf-8?B?VWVyOWJSZnhrMGpHc3B5cHBDUjc2NmZqL2NKaUdFbTBwTnVzV0VoeDRkN2lV?=
 =?utf-8?B?c0ZPSzQwUDFTRFVacmtQOWpXUFRsWFJQT2N4TUJkWk16NDllY3pjei9Cc1VC?=
 =?utf-8?B?WWlOTGR2MVM0UmdWRVlkZXgwd0RwTXU3RjlBOTF4WmR2ZVFPK2NFdTBKNXEw?=
 =?utf-8?B?NmlTRFB4UFhUQ1VDLzd1NUtGZ0pzZlhtTGpkUmxvcXk2cEwwUkxRdHpJdEZt?=
 =?utf-8?Q?HjICNS4UoK/Gxaa03PVLNGb7WTGik0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(366016)(376014)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WU5jcVB4R3dZUTNHaGQwd3NIbUY1TWoydXhmTVB0SnFqTFdwVEIvallsSTYx?=
 =?utf-8?B?TWxQVnZRaTV1cVpMcFJTTDZnZi82WkdKdTI2eTBVRnIwM3BMV3hwdW0xMTFS?=
 =?utf-8?B?emVrTkl3RldVREgvR0pmTDdLUXRUcUppMmNhMlg4VGptMkwvVDQ3bE9Kb2M0?=
 =?utf-8?B?cUpQUDB4cDJzN2VIeEtKQlpSUHB5ek1RQytpNmlIM2dQN2NKanJrZ0pJajYw?=
 =?utf-8?B?OFBwVVJtWFc1UlhCSS9YY25xU1lVdHdUT0FPbWVvdGxQZTRHMDBmSC90N1lk?=
 =?utf-8?B?OGlNQTJ3UlVxN2ZMSGJoc1Bnd0MxWUsyQVZLL0ZMQisrZURXK0lHMHJBL1lD?=
 =?utf-8?B?MVhMSm5EM2pPOTg0TW92OWtIOUx3czlYNG5sZE1NckJ0RHlOQXlST0xDRnhN?=
 =?utf-8?B?dVhCcThkbi9icXE5RUNlSWQzYWZsRktRUFpBM1ljays5QnU4eE4xaFVNS0k1?=
 =?utf-8?B?TXQyQ0hvRk5Ic0NPcDRFTUF6ck5QYmJYcG4rcjE0Z1hxT2d2bXZ5NW9tM2N6?=
 =?utf-8?B?TEZ2WnlzVnZESEh6em1Gc3Y5V2RTN3RXNjhPWkZpQXRkbXNIQmwxdTExaVpD?=
 =?utf-8?B?NmJGRVNJeUk5NkNpZFlHbVJkamxLQTRmcURWUllwd0RiM3psNVFtZGFDNnVY?=
 =?utf-8?B?amd3Wkpxa1QyZ1FndE95VEliZTRhcnFuejlrVmd0d3ZTTFVWOHBxWDhESlFx?=
 =?utf-8?B?a0tzRUdmaFJCUVpzQ0M0dWZzQ1N5MDhQczZkT0dWWTdhcDBXMkgySzhIamdX?=
 =?utf-8?B?TDdYRmYzZ0FIVkFhVjl1eGlOZ0kreFpUOVRyaHM2OFNuOHRiRXdVc2J6d3Jm?=
 =?utf-8?B?aUwwd01NdmlBbXdUNFJka1RLRWkyNUNuQkllanJhT2JTRmZlS0lrZkxVRkkr?=
 =?utf-8?B?aXpabkdleHpqV1FRa1ZmZktkRU1iaEFVMVNKSERvK0lYWHV1NXI1T2RhODFB?=
 =?utf-8?B?U2RYMVZjdG1mZTZPTElmc2N2QlF0bHViaFFHNXVmS2RKbDliNUVjNnJ4bnpI?=
 =?utf-8?B?bWFWVkZyc3FvY1duQU94dHpxYytmN1pEQzVibzVDbmpNaWYwdEpjdDAzMk9n?=
 =?utf-8?B?YXpkR20xNXozNEJuUmx4RzBtVlFaMGc4N3RnQmhMak1QZDZGb0Y3N25TY1FR?=
 =?utf-8?B?anJGVUVtM3BRWnI1bG5XU0hqUnZkREd2UjRvRCtuRGJpYStUaTMvMXZiMGQ4?=
 =?utf-8?B?WCtXWk5zZ3paWEpyd21QMDMyZ2dQUkJ6TkxNMHhjTzlHbkUyNkJicnVTeUhF?=
 =?utf-8?B?TWw1Um5kQlhiQ1hCM1JCRzMxOUI1WW8wQ2UyV3BSRlNrMi9rZitWV3JhS3hn?=
 =?utf-8?B?QWxuU1QvTjdFUFdtQ2c3SlBOTFBuVGpQUGZOVnRDZU5aYVV0eWZpZUQrU2Nq?=
 =?utf-8?B?Mk1yK24rVGJobXFDVmE1dnpvLzlIejBYTEplcmtQRXdDSTNoeWNPdnpiWkdP?=
 =?utf-8?B?UmU5Ui82NHFxbExZM25tc1FCWEJCaGc1QncyS01IYlBTUE8zUUVPWTZzS0hR?=
 =?utf-8?B?TmRLUU5iT2FWSVZzckVVcGdVMVZDcVo3WGMzUFBSWkMzV1h2Ulc3MEdzOFpC?=
 =?utf-8?B?c0orUjR1cTk3K1JydFZ0SkFldGp0YTc2cDZVSGFFdHJTeFpMdWR0cHAybjcy?=
 =?utf-8?B?bTZzUTBIbmR0b2xldHd5cU5WcXVTY0tWWG1iTk90MzVBZjBoZTNyOC9YUjVD?=
 =?utf-8?B?aTJzS0MybkUwUGsyR0s4QTlHN3RFaFZ1R2p2S3Q3ZHVtbHErNmFSeGdMNW5h?=
 =?utf-8?B?SnJsTy9ITzMxUHBTSkY5RXA3UWNudG9TdE00TEJoRHVVQnlKN3JOUGJKQzc3?=
 =?utf-8?B?cjY4ekFnaVFzaXJvTjdsRlZoYUs0dXlIczlZckFEWVBZTlYydVlFeHVMemlu?=
 =?utf-8?B?ODR6eVU5ZWp0MWk5YXk4eFVwV2N0KzVXVDFPa2VUNlQzcEF4MXRZc2VFcFI3?=
 =?utf-8?B?Q1c3VDB2Q0dYanhrM09VUEhqbUtLYzMva09PQktwZGZtSysvSUdoUTZMc3BW?=
 =?utf-8?B?RHR4Y3oxekZxZVlCdTA0ZENkZFFCclJGeUk0L3NycFRtVEdySCs4Nm5UZ2Vu?=
 =?utf-8?B?TTJOQnE5bXNScDJONzUvRnBJT2JsR1ptVllIODRUN0hSK2YvQWVGL2VBbHAw?=
 =?utf-8?Q?M+cm/nfjXHQwe2z89kVbaW4ro?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f858d2-c2d9-406e-b747-08dde091e6e7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 09:05:40.6434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kY6Ci/cxU8pZ/XqKp7Il1oR3nAppmyFTIz3UUA3i9wJUjKY43g0v/4ET6LjPkbe20UdotmnMXcsKz/aHWV06EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10101

Add imx_rproc_cfg_imx95_m7 and address(TCM and DDR) mapping.
Add i.MX95 of_device_id entry.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 151b9ca34bac2dac9df0ed873f493791f2d1466e..6f83fcdcd8528e6b91269369e23d39a0395fa8d0 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -74,6 +74,10 @@
 
 #define IMX_SC_IRQ_GROUP_REBOOTED	5
 
+/* Must align with System Manager Firmware */
+#define IMX95_M7_CPUID			1
+#define IMX95_M7_LMID			1
+
 /**
  * struct imx_rproc_mem - slim internal memory structure
  * @cpu_addr: MPU virtual address of the memory region
@@ -127,6 +131,18 @@ struct imx_rproc {
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
@@ -373,6 +389,14 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
 	.method		= IMX_RPROC_SMC,
 };
 
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx95_m7 = {
+	.att		= imx_rproc_att_imx95_m7,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx95_m7),
+	.method		= IMX_RPROC_SM,
+	.cpuid		= IMX95_M7_CPUID,
+	.lmid		= IMX95_M7_LMID,
+};
+
 static int imx_rproc_start(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -1338,6 +1362,7 @@ static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx8qm-cm4", .data = &imx_rproc_cfg_imx8qm },
 	{ .compatible = "fsl,imx8ulp-cm33", .data = &imx_rproc_cfg_imx8ulp },
 	{ .compatible = "fsl,imx93-cm33", .data = &imx_rproc_cfg_imx93 },
+	{ .compatible = "fsl,imx95-cm7", .data = &imx_rproc_cfg_imx95_m7 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, imx_rproc_of_match);

-- 
2.37.1

