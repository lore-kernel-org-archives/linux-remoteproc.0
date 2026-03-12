Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010017.outbound.protection.outlook.com [52.101.84.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F0E30F539;
	Thu, 12 Mar 2026 12:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773318947; cv=fail; b=DtIemgo4l9tm2j/2VOrkiqT7kaOXprW3ouMk1a1YVEDITbcYl5TnTlhF9kL03rdpB1PLcvxxFHUXr2AnF34VcbM3VhUESSONCQl2yr0SIhUvvz38SksfzoCK4hDoC2MR1r5autj/qkVBac0R+j34xW9FbP7wK3a53a8TxRieDi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773318947; c=relaxed/simple;
	bh=8Om/xVWPRZD9jmGxJAXxJaHhc59i6EDlfw0b2+scVd4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=I+Fau4SQneoB5t4OwfYR8Cf+8Z8fGqdmgmiZxaL4UgaTv7ZBPgwB71JYgDxnAiUWm+qH/u+bzVrv7yrKUN2j8QdXrgHigkp7Ar/j3FKH6SuXFca+qTq2hAqhyRqt0Xgs1HrQ1zFMXmSMRpM9oNWNNIzBNpPDcPLqihNQLKQbgZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=A9fHdl4h; arc=fail smtp.client-ip=52.101.84.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="A9fHdl4h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nTTapyiKMGvsYsXGNLeHS6Qvg76Gz7dI3DECpzmAyUaGVjXKHb/8ywOtMYsOn6BQd5/ScOgpF47p2DTXVPUp9A12kk1qq2GFAqOQGg9jyzF9Wzbjcf1gXwFA9HK/AXMlJmSU7DYbsa4BDRrwrTcy1VI37p/UbNoW6aoYKzz6vLsR6ICVeLtQRZbp6BSZp1OAcM8jzfN0HeGrRsCVsWh2guaytPHjZZ0XbNd98WuyLba4pQn6mjkM9yvc54YKSoAabNJwMF3ZhIjnO86R+NWNnN4hG36zNJs4t9iLfAs37ryD5WgsWYpjrUTXUiCp/r/znQr5K3nZufimVFFDkJrksA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hA6R4bJOKky4uPGzXfH6haoX1k/5waQ438UOHHO/WrI=;
 b=L1IZo9QxP0h1wNGMbT6+E6HguGm9sgjbrv00fIuBYU4/+CfNB8EwIHurq6Mkaxnw4DZq7mYiWm0bHlhR2TiQGXyR4wGyEmcSCa+vuL3LXfruHG/cP4M8xvOUwNZU8uWnUGqEnIuZGPG+B6S0da6pmSZGngWYpVNI7kz5V53YiDyuRfJmsZkyYucxoGB9LG/7P7+brh3zNwRhtVXvPjE+Jj9/Il1B9y3Ma1VwXaVRJWF8jbaty3S6F+s+7FKeCaKFrPfb3wIikbNKUk4LFrEHcrBAXHdgdi/VARpN4Hv8UyQOvfXIy+jg3R/8nWOspYzpk6X59dGjWRZnEDcDo+oTZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hA6R4bJOKky4uPGzXfH6haoX1k/5waQ438UOHHO/WrI=;
 b=A9fHdl4hGclnS5SyRznQZus7Gma+sw0MQMm8GjzIjEgXqWG7ZF5nnET+9e1P25ecpvFkMmauiBE9Ch8weKKIXBjXFMcLN+thSeAfcQ69KyAFWX/awt+FhQStU+KsQBWOsUF4JiiDFfP82dyz6/vGte+80YpRdshS/iQuuITtsBrLZVNvwpY2gQxvW4YgCfj28NCqC1dSF481jelHgO2Bms6Dc5l6NjWgrjgS3oNWSFwh5YnlcwRteQpayILVK5JvQ7Ykrl+VK4epmrW+vdZXaWFnM2VfNBXlFP1rbBWzA+zHP1rL1M+V47v1XKFFvI9N1OcyVGXTXcwRmUnqRjKKGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by FRWPR04MB11271.eurprd04.prod.outlook.com (2603:10a6:d10:19c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 12:35:39 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 12:35:39 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 12 Mar 2026 20:36:57 +0800
Subject: [PATCH 2/4] dt-bindings: remoteproc: imx-rproc: Support i.MX94
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-imx943-rproc-v1-2-3e66596592a8@nxp.com>
References: <20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com>
In-Reply-To: <20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR01CA0050.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::21) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|FRWPR04MB11271:EE_
X-MS-Office365-Filtering-Correlation-Id: 297de8ce-ed06-4ef8-3388-08de8033ddfd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|19092799006|366016|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vteyUWPH5DK/B4T8AzWF8hCk2NaQWkRxKBqJyhkYWq0BVcQLr/BcbRxxw5exQum1qfyDQCfl8BVo+vqbYvprQYzCiNs89fHH0HVXGtt+U+AZNe4dF4DwkA5b5QegfTMBrRjfkjqZ6Is9K1LKzE8Y7Ij/5lfTre4KOFnySAcVe8MtVmmxsSTNYlDNYRUso7A84EK8eFt8iiGK8HrtjmkAuV63uA+2U6jqWoj41Iw5ZH6J7YsxrHwHUgbAn8JNT+PrdPOmtYITT7ADExIDk+DENxZhkkcNhExEDK6mrLNonMFAgb1WryXXTG118FFGd+5uHrIg9zAH1oZVJIlsKOilkoqzl61En/tn+uNJHKcvkAfiP/8Rq4xEHpp2SG7ds2FBWjkBdTXJsoil/cqQ+8IqArT44nQ4KoIQRhIw9iewijp9hkzV1ArwjHTFyN7fjTXctafNEA32tOs1H/WW31rg0fLoNCN+bef8F3fmdjay54m6Wu2knVH/El8t3Ps493YiaC1e+zZKoyFDrxt/yZtPdKTlUtejORkQT78YUw+pLLoUNkKp6OaweG1mPEjPN0XDBAbB6R1Xr+twTMGCbFVEpHqAICqWtO0bOYORgp4ak9FWNsTJNcIk6r5KWDeB9TM2mrBqokjLjva5uTNfHjRh7cfI9gZHJ21xA+F1jlA6Z8BEPQfG7ELtTHFTmoKsrLdI6X3XehXw/7mwmy0sHIlE8ZzEf3TqXHjHASZ3HpnfyspeFw/UUywMqKN23THAfyt+xQd0Fgj9TXvS/5O5LOzT1jqT2WyI6DPBaPOxxe3jPl8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(19092799006)(366016)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFlOY1pqVFBCTEQ5RERTcmduenBxdlNBa2s4MFd4eDNEaEExU2NsWEhlN1NX?=
 =?utf-8?B?UjBjNXUxbFJaWnpGclpMNU5xZXh6L1B3YWRsQjFsNjlVUXJQa1hQYjdLZUhi?=
 =?utf-8?B?VmhzZFhRMjRiTERxVS9TSUpLMDFSb2srMGpTS3lLV3FESEdjbmRYWE1Edmxp?=
 =?utf-8?B?L3hWWWQ5MVJQemFmSTdQYldmVkc1bkkydHQzMUt6VVNkNFRZWjFuN3gwaDk3?=
 =?utf-8?B?WGJPZkVTVFl0RXVVeUgvU3pPTFl6QkovN3dpUG9pQllsVitHbFNIcnlraXFK?=
 =?utf-8?B?VjhteExyZEtWZHMrcm9lZXRYQjZMclZab003TWpka3NORDlNRit4WExUaDhM?=
 =?utf-8?B?aDhxVjFoVEpySlJZeFRWblo5NWIyaFd6NkJVd2lOK1VLMzFCNUI5Q00wT1A3?=
 =?utf-8?B?L081S1NwYmIzRWpQZGdza1JDYUQ5c3VnZnFKYmlTNVJyaGhLNURGYWNEUkd0?=
 =?utf-8?B?UGYyVkJHUjlGdEdySktoclgrN2dZM1Zha1NjRURLaVJCc3dFZ1M3cHBWRzY2?=
 =?utf-8?B?R0hGVmgydnlZcU5VeHVDNEwyNHBkdmkweS9DSkdWS2hZOC9FUFBMVkoraUtM?=
 =?utf-8?B?bmcwZ3NVMGtkck9xNStBemxwaFNLK2hxVmkrOCs3T1NEcFlYSXF5QWxVVkxZ?=
 =?utf-8?B?a0lkdEhQSXFaMjRsTlExVmRWUUVXVU1oV3FnT3JycDc2NHRZQWVDbi9oK00w?=
 =?utf-8?B?Tm5XZUNybjhwckh1TFh6QWZRSzlLZDc2RUc4RGN1QVVUeVRsSFp1YTlHbWtz?=
 =?utf-8?B?cjlYZlczUUNIcEpHK3RaQXRWZU5VbUhOdmJqQW9CK3pOUWdDTm5XTURTUVJs?=
 =?utf-8?B?VjNFemwrdDNLY1Y1aWs4TVo4ajFpdmJzWjZzZ1BEazIvb0xNQVhCQ1QvWXpD?=
 =?utf-8?B?WGs5c0NHNy9rUDlsNEpFTVFGU3BtZk5vVEVYWnFHV2NqWkJjTW13c1QzRi9H?=
 =?utf-8?B?TjlNZG0relYrenZBUlRFcWRmbWR2UmlxY0g4ay9Fb1dSaUduelpwcWdiT2M0?=
 =?utf-8?B?VEJ1ZWhIdDhVaTlvdU43TlZobHBtT2hMN3dhYzBOUU10STRncFZPVW9WZUxR?=
 =?utf-8?B?b2J1bVRGTkJtOFBhNzRyN2tpdkNXNmROa2k3VkdFK0t3eE1USkRtcmFCMk9M?=
 =?utf-8?B?KytJYVR5VTZhaWpHTmRObllDYy9XdU9NQ3grWGt4UGpBZHp3ZkllYlBWSjE5?=
 =?utf-8?B?TnByeVF4TmhFUUJtbHNTSzQ5cmFNVC9qSUZ2K3lFVHdFY2w4L09rVFhiNENh?=
 =?utf-8?B?c0VKdGhJNUZvbkw1M21taU9nL2VJU2dzdEhtL1NXZkYxamphV2s3Z3FIVnBp?=
 =?utf-8?B?WHpoSUUvQnBFRTV1c3lyOW1lL0F4cHBMa0dJeElySXFiT1M0TVRXSTM1SVJr?=
 =?utf-8?B?M3lWY0dnYWNKelJXM0FtcjZoZTJvRXJ3b2FseHduaWdFV2hTeXlIMHQwK1JS?=
 =?utf-8?B?d3UvSEtETnBDZVVDT1g4NHl2K2lWUzd2OXZlWkJaSFVGY1d5Z25QZkhYR0Zp?=
 =?utf-8?B?UEZGbEZzcDd5MmJwRUY1dzA2MlcyNzNZYWcvUEdwWHdadFlNZlpSeHV3WUlG?=
 =?utf-8?B?VFQrWm4zOFVEWWJmb2NsTWorM2hnRW0weG1BOFYvYm15ZUpOVTJFbzE4Q254?=
 =?utf-8?B?R3FxZmVTVW1GV3BUNDFlZjJNZVcrSVh0TmRaSlhEb3FJamlGc0tQd2dwa1VI?=
 =?utf-8?B?UmZwVlVkNTQ5aVhLdVJxeFBSa0NXbDBmcTdQSW1CQnNCRjRCK01KcVVkc2tp?=
 =?utf-8?B?blhQbnJSSlBiazJzZ2oxSDFBbW5YTWxwRFd5T3JkMjdzVDVmRDRnNmR3VXFM?=
 =?utf-8?B?djJUU3RXSDlGcFJSTG1laXQwQ2hjWS9CUXRIWldTWlVWcVIvSE5ySk5JazZk?=
 =?utf-8?B?V1J5bTd3MW1HSFZoMGFsNk82UXA2OHZxMzFXQysvQUZRYmVTcEFRcEdTVDlY?=
 =?utf-8?B?ZEdvOWwvZmY0eGFZUnZsT2RZc0hkMStXQ1Y2Z2lvcHhxUC9naHdGMzdwMkJE?=
 =?utf-8?B?aUg5WVRIM0w2R3NMVHpFaFk2YUFkdXlGSTgwTDEyd1ZOT09tTWF5b3hRemxk?=
 =?utf-8?B?TGI1eDdSWDJyQk1CSnVNVVhiMURjOXhHM1RTZnBVV1pXbU8rZ3k1bnhUKzZh?=
 =?utf-8?B?cTNtbGdtbUMxRElvMmVxU1U2MHBpUUhmN0Vzd1BwM1dFNFo2VWo3MFFxUHNp?=
 =?utf-8?B?SVo1ZDFpd2lFYXE5dXQyd3ZYZlZudHN2elova1JGYlpuM1JhemIzVTlLOHNF?=
 =?utf-8?B?NVluUVRqcWlSeXhoeVVYOWVJSWJTYkJuZFErOU8rVElscHgxTE96R0M3ektW?=
 =?utf-8?B?V2FrUUpIbW9pNnhBOEtyZ29FVUtmNkFxWFBacjk0R1pqbVBjMFhsZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 297de8ce-ed06-4ef8-3388-08de8033ddfd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 12:35:39.2582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OZidJGrPXfxJJodQY47Lv8u7zNrPWTNQMyTt+ku0mW0xaK1FiNIssIn/QJknlJRw33fz1Yzh2INyFgavt59XGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11271

From: Peng Fan <peng.fan@nxp.com>

Add compatible string for:
 Cortex-M7 core[0,1] in i.MX94
 Cortex-M33 Sync core in i.MX94

To i.MX94, Cortex-M7 core0 and core1 have different memory view from
Cortex-A55 core, so different compatible string is used.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 683f0c36293c08616621daa79c0b8914b0f48bba..b136b3c3ca3ce9ff92d91f4b8ffc29c614edb66a 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -28,6 +28,9 @@ properties:
       - fsl,imx8qxp-cm4
       - fsl,imx8ulp-cm33
       - fsl,imx93-cm33
+      - fsl,imx94-cm33s
+      - fsl,imx94-cm70
+      - fsl,imx94-cm71
       - fsl,imx95-cm7
 
   clocks:

-- 
2.37.1

