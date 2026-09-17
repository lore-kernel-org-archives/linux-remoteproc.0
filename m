Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010003.outbound.protection.outlook.com [52.101.84.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5B03D9DC8;
	Thu, 17 Sep 2026 18:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669217; cv=fail; b=GaDXOiJCmC9BS+ekPQjFmb8DzhCxz4rldDa0utetkvBS6paKXDncj+OkDYcsr9BpBkd7dJsKOHDfM8NFdWTzB8IZiAyVmlvNskEiF3ZTF+Zf6AscPk2zvfjK7wJTkVzcWIFBkRo4yE8pwsIOM5XVkOJpr2yos51DU/iqTQAIxUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669217; c=relaxed/simple;
	bh=fC/5kqNggSuZuZgGVqaHcr4XLb0hXDo8D8LOGkEMJ2Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kwW1iR5YR0I3n3IrDXSVPcmDHqTqKHyz+vKMvMfYJ44qaZo/wcw+PyNOTAIBuZ67evd/ebgFUqWIc6dAsZnro22IkexQGhrRJgwjT+kbN2/MFZYZ41dOEJPxQkaxAj8yjflCAWn9VDkPUbSrDPQATa6kt7Y04hcarHnrlNRGMHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kMdojkve; arc=fail smtp.client-ip=52.101.84.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kMdojkve"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e+EtbgS/i6x7+hCZTUx3mLwDO+S1AJNqhu3y2PkwSMidZvTL8RFTdiO+LI/N3cz+bnTcbRdIkUBl8qB9CRcwqlnRFztq/4OSWD7lxHKKJc+PIhnUWiYxoqC7NXmnlS/9GNbINVvJ21rFirKEIxTlGeOyj7cM8apUH9JkZ0G4Jb9L5wQ2b0XqKQRaUNdeEH2wDQPTu43cVQrx2iurMz8L0hv8Z+1qnP37C6rGhXGzm0NvlW6jYrvxxb9Q67yqs4zYfHAQ0IWkOMthveYUsGqLIOhAYQ3Mdhz0zCu5Wzul/t1y9MQHV5OTsYqmhebHhodLqm4g7DmRA0dP349DhPIjOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFWqcBw9wshxEvVTZVUtWektOAGqO5kW1wKbOC8OKUA=;
 b=Bnt9rpSMEPlCbeqpfChxXi3T8e+x+X2LnsZ1XHBNjuu3zF/nszPXzll0hq+UyZklMtgqeZdAqYXEJIznZjkuDncXZ1XW8FR6NMsW9QFV1qtP8kQTATdijKzAJtqnWNrgWQvQ/E4Bmk++yzo0wCix5Y8wtosU8EPQxJuo1PGhhyHZiBVDOWGBpHHMq3UGjwXVzPIxRFMJ37j+v4uI7S5l6/KO6CLxC3xzpKe+OW8wew6seB4pAV/SdaFFpS3VBJzNJLlus1/G8LTj7uJBLgjFoeQOaKxZNls9+blh6oKqy604lE0gqvL9G3tD/HKCvIv8n6Sv24XZJlXjAPCPQ5Uz4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFWqcBw9wshxEvVTZVUtWektOAGqO5kW1wKbOC8OKUA=;
 b=kMdojkvearLXWxGfdvA2gsXpw7yQkbIeKt2EaFq/LzIaxO8wFl/BKfvNNp4N5AXiPQ9c3ZlWs/wlVfPp+oLziWhVg/BoCuRS1BNndJSjRTuUgwfcduBRV9ru434T1cbMOVgsvUsZIioPOtwAZbi7ypyt17yx67J92Ak9JVlsfcUrOstzpUy3yxfC8LSTDTuF6bhiu3aME6QRpbYieHcQ+E777ZG+EHhDahmL6AU0/keGg/VyoyDYvYjNuQOKZE5CIm98il3Zrovu8+gUOXzC5Iw3W4LbQrBMXWpRi3xsIMJesnddiqx0WU2hEvZ8MxIC/SkW7TlRRH6EfDuDNPlHKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB11648.eurprd04.prod.outlook.com (2603:10a6:102:50e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Thu, 17 Sep
 2026 18:20:12 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Thu, 17 Sep 2026
 18:20:12 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 17 Sep 2026 14:19:43 -0400
Subject: [PATCH v4 2/4] remoteproc: imx_rpoc: use memory-region-names to
 avoid hidden ABI
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-memory-region-name-v4-2-260755920ebf@nxp.com>
References: <20260917-memory-region-name-v4-0-260755920ebf@nxp.com>
In-Reply-To: <20260917-memory-region-name-v4-0-260755920ebf@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789669196; l=3052;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Ngjy3KwdWIj9I36/28SW6HYUvwtZDlpK9wI8PVgEH88=;
 b=O47aoYr/zHhk/dm7gkyvJt4OkH9CNndCgLXHSFOBUDOoVe8zFa58+/X7IFn4LOCatoj/IMnRH
 YL07cRJBVKgDBET5htxii1krepvVSUB6bLogHSyIatNusw2vqWo5GKM
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: CY5PR22CA0066.namprd22.prod.outlook.com
 (2603:10b6:930:80::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB11648:EE_
X-MS-Office365-Filtering-Correlation-Id: ad4468cd-6d1e-4b66-9c44-08df14e8502e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|19092799006|366016|23010399003|18002099003|22082099003|10067099003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	xrJ/nqZns3U3FvAl3WgwhUBa57LsvnhGrvGCJvDbvFPmszDKcvpiVNoY/XskATym1wyY6383OZFm/anYjO1cyMuPRrBa3edS9jX9zB4VPHALYo2/0DE+15DgFHZy5gTWmnsN0rd4jahFA2VyUzJA97cm/J006zTAjKeM/44g7IKe8OCoereeYDm4mOliBruf/NC7uTEUW4RIDG3stCOjSRo26fH1aihwq1sDuAX5oOKGB+3LtlSxIAYePsFnHqfyXe1MV4PTyXjEadHavR5xwnb4edqnAqByBNWwt/us07i2H7d7pIQHn5rU/P6pYfPrh2COgr9INacQlN3lZ/uFXCXqzBxkGoRfzSI9m8Li0VvILUjOga6m+9F8GmfpsJwtiJgnN75CD3fjDwQaPuwj0JpSzQy6nUw6evpdv2U7QYT8COs3MpWDoLzHuOxkJmPcVP5HRVSrlYo2tsf49FF4CnCBKmGLvxB8RHcwpvtFyy7//FWLZ7Xo1PIePgjx9KE5czmj80dLl2sffek8XjVrTkNGbHfdB6iXxZSkWe44NVdl6RalSa6pyANrLhfP/5s370pkatbrvFOHftiuDBPz5r/gkohuZBBdWl8iyG/B0zPE86+xbLm1CCdxfFb8gTVFJauUg29D7KEIfvSS/x9DICDPpmiYz11X8yUL4+msWiU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(19092799006)(366016)(23010399003)(18002099003)(22082099003)(10067099003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHh4OU5BSXJ2Q3Nid2szaXBBSVlSNE16ZzAyRzBqRTNYZFNLdERaTGJpYTF2?=
 =?utf-8?B?NGFCOTBmcUxtZlN1L2dYbVo0Z2hMVkZ6QjhmeHZTemk5SzlKcWRUbHRuWUlM?=
 =?utf-8?B?TDc4Qjc0dlpQZVVJNWdiZ2pxZG5vVGoxcjlwb1dpMkNIK1RPdHNPaHhka3o4?=
 =?utf-8?B?ZU1TcnBhYkFHRmdYZGNsNHJNbllyeGZvSXVEZGxrdjFRWE56RlNqcFU5cnBU?=
 =?utf-8?B?L1BjdEJmd0xWRFNWWjljeW1UVDZGNW96NzhzUXhzcFhBWWEyM3hIUWxxWVhn?=
 =?utf-8?B?U0JUMlg3Y0Y5UCt3UVlHclJHdzJkZ2docDFzdVE2TjRIOC9lYjlVcEh4RWJF?=
 =?utf-8?B?dGo5bk1EVG9NcFNjTENjYTJGQlhQdWpBM25SUFBnV0UyN28zSnhLSDZjTU1W?=
 =?utf-8?B?TUF1eitsbUUyaVdkejRKVll5aFdYWkFpZXVqbUtmc2p5UEF5N3ZwSzNDMkUv?=
 =?utf-8?B?SXNxRnY3K2RoNUxGd1pqQVhVQ3lhSVgyaFcrQ0ZuSFM0MlQ2dHM1ZnAzUWdP?=
 =?utf-8?B?ZHZpVW1wVkZranR1dVJNbW9QelV0cG9idEFpN3V0ZjIxVXdWVXl6SGFROUY3?=
 =?utf-8?B?YkNDTDgvYVlIN20rZ3RUTVB2RXN3NFhxSzFLKzNmNHdDR0M4M3JRNmJJMms5?=
 =?utf-8?B?eFlHY1ROS0xMempVSXRqM2pPTXZKcWlXQkg5WjVNVXVTWU00cU9nckNTazNB?=
 =?utf-8?B?NmsrTlFtNFVKV0J3N1dZbjErQW82QVB3TExaVjlGUUFSVHJVQlUwdGFwRFBZ?=
 =?utf-8?B?bW1GUE5uMVl5c0JWMW1vNHZENHpjZjZCVmNQZ0dJMm0zNnNZMHVMUHRZTXVV?=
 =?utf-8?B?WkdyUVhTWXJRWUh4emJ5WHB1L1lWZVhOSW1qd01mdWV0bXNldk15bXBFdHFi?=
 =?utf-8?B?RU9xdVlhZklzVEtMQXdSQmVGOS9Zb1Y4UkY5bmNwU3hCTSt0Qm41MDllOG8v?=
 =?utf-8?B?MGRNZ092dE5rQTJBaURJSndkUVN2UUlIdmRtSktCWDRMZFNtMW45Z1oxNjE3?=
 =?utf-8?B?bXBpbDdNcTNUOC9OUXpOcmtTWEZ3SGxjbkVzbTRyZ3hoeUo2elo5TWVTRnd1?=
 =?utf-8?B?b2FRTjRyQmhzQVk0Zmh0dFBOTkJpVmYrTHFPcGdEcWlTK3ppZVFSWE91clNk?=
 =?utf-8?B?cGNMcTQ2Ynd5OEc3QlpqUHJObUVnemRZSWdJdWhzNnlTbEYzSHBPNkdEMkky?=
 =?utf-8?B?VzNHaTg3N2kxc2NxYUQyeWRwZ0gxNlRKamlZcG9SYktSNkNkN1NodTZOa0s5?=
 =?utf-8?B?VVRpUk1aNWtRSTk1RW9EejFqTU82UXJDb2ZlKzRyVWZ3czErM1ljOHJxY3Nk?=
 =?utf-8?B?WjRrWDdMa0lXWXZsb3VaTXRYUTF4TG85QTcyM0xQeDBkMStNbWN3UHN2ZjRw?=
 =?utf-8?B?SWhaeW9NaEVUSCt5TGpQTjNwRUNXVGwyTmZydmdVd2lKamUrVEVUVk9Pd0lm?=
 =?utf-8?B?RkUzcVAxQzFiU3pCSHRRSzBLRkF4RGRHNUxBUVM1aVhxZWh5bjFWZGJBRy9P?=
 =?utf-8?B?NUltM0JWRTQ3dzM0aDJRTW1hWllrS1JzTSthcnpJZ2lub1ZKY0VJUlFTNjV0?=
 =?utf-8?B?VnltM29Ocy9RSmFUNkN3eGdxeEdqdEp0aEFWanpGRjNvckdZdHBaeGJzdnlO?=
 =?utf-8?B?N2dhbGFTQVNWbk1nazI4SjYrd3VqeDlXUTBhSThqSm4xaUQ4VFo2dXNjdEVM?=
 =?utf-8?B?Qkw4RUhFd01PVWhhMlVIQ2ZoRlpjZGFBOEZDR0F4Vnd0eHdrKzNjRFU4UE5a?=
 =?utf-8?B?YnBXNEdwQ0NrUHhUb2gxM2ZVNy80SnBmWWVPZHNXWHFxZ0pYNUFWN2JHVFFY?=
 =?utf-8?B?b21pVVc0dHF0eFg0RG0rVWtZSWF6VFZGRkV5eEg2aHhrWDgvUmRDL0FvMFpR?=
 =?utf-8?B?Nnh0VVpUck5QMHFmdXZqZU8ybnV6RG81MGZGM2EzUTJlNDhNbDAwUE9kb1Rn?=
 =?utf-8?B?OG42a1Z6bGNuZVR4d2c4UVdiVlBGMmdwWGRqK2lDdjBxVmg4bkZTUTVHVlIx?=
 =?utf-8?B?R01NVnBNNTl4UVBxZllWd3BqblRncnViV0N0TnRwV2ZaclYyeGp1RWNxeStM?=
 =?utf-8?B?dWVqdmVhblU2MDh2cmVBejYwT0IzV2pscXhISzJpNXQydkxoVVdLSjVRQmRp?=
 =?utf-8?B?T2pXcXoyMzRwZmcxNG9KQXlVOTYzaTdMYnU3TkVBaXdKRkExWkZmcVp6SnFo?=
 =?utf-8?B?alN1Y0lnOGlqWGtWRVBCV0RGakdDR0JVeXVHSkZKNHpBdTRVSlYrVEZuUG5I?=
 =?utf-8?B?b2pwUmhuTk5yR1U1SmU1ZXlUU1QyUEt3WXdHYkpZNTFseDVPd3lyVUgrWDhQ?=
 =?utf-8?B?R29VUDJWa3NMRzY2UGZlUm05VDV2RERGVzdSQkpZcStJeE1lTW1yUE9lTmFS?=
 =?utf-8?Q?tLdEoLBXAFgfpk+96En7hfi003vYNfnuNqq49?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad4468cd-6d1e-4b66-9c44-08df14e8502e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 18:20:12.1726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1H2PClvZM0C/y+mGmxa7vdABTtMkzzugoYs1ai8SnrkdKW4K9v2vxWYWnX117u9nfpOycdgKB7hpTB3rviPCstFDrr9fJuh0dRf6TJFvMQPEUtbyYGqbA6eHBfOG7Y1h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11648

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The driver currently derives the memory region type from the referenced
memory node name, creating a hidden DT ABI. Since memory node names are
not constrained by the binding, incorrect names can silently pass DT
validation, as seen in examples using "vdevbuffer" instead of
"vdev0buffer" ([1] and [2]).

Parse memory-region-names to identify the expected memory regions and avoid
relying on memory node names as ABI.

Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 13 +++++++++++--
 drivers/remoteproc/imx_rproc.h | 21 +++++++++++++++++++++
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 745ce52cd8226..ce9bdfc1fa985 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -643,7 +643,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
 		int err;
 		struct resource res;
 
-		err = of_reserved_mem_region_to_resource(np, i++, &res);
+		err = imx_rproc_rmem_to_resource(np, i++, &res);
 		if (err)
 			break;
 
@@ -818,11 +818,20 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 	if (nph <= 0)
 		return 0;
 
+	if (!of_property_present(np, "memory-region-names")) {
+		dev_warn(dev, "using node names for carveouts should be avoided\n");
+	} else {
+		if (nph != of_property_count_strings(np, "memory-region-names")) {
+			dev_err(dev, "invalid reserved memory name count\n");
+			return -EINVAL;
+		}
+	}
+
 	/* remap optional addresses */
 	for (a = 0; a < nph; a++) {
 		struct resource res;
 
-		err = of_reserved_mem_region_to_resource(np, a, &res);
+		err = imx_rproc_rmem_to_resource(np, a, &res);
 		if (err) {
 			dev_err(dev, "unable to resolve memory region\n");
 			return err;
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index 0d7d48352a109..3632bc375c711 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -7,6 +7,8 @@
 #ifndef _IMX_RPROC_H
 #define _IMX_RPROC_H
 
+#include <linux/of_reserved_mem.h>
+
 /* address translation table */
 struct imx_rproc_att {
 	u32 da;	/* device address (From Cortex M4 view)*/
@@ -45,4 +47,23 @@ struct imx_rproc_dcfg {
 	u32				reset_vector_mask;
 };
 
+static inline int imx_rproc_rmem_to_resource(struct device_node *np,
+					     int index,
+					     struct resource *res)
+{
+	int ret;
+
+	ret = of_reserved_mem_region_to_resource(np, index, res);
+	if (ret)
+		return ret;
+
+	/* "memory-region-names" is optional */
+	ret = of_property_read_string_index(np, "memory-region-names",
+					    index, &res->name);
+	if (ret == -EINVAL)
+		return 0;
+
+	return ret;
+}
+
 #endif /* _IMX_RPROC_H */

-- 
2.43.0

