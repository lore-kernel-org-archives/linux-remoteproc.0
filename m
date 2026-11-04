Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793792240;
	b=mV7XjDqLg8yaxVNVn1YCLVZ78fHPoD9yYjDMbe69OTM8iVf0LRuMWy56+fvU7++o2D0y
	 k0iJAeyUFS1SJ1fqFFaJqkXTflSon59SitinKehL8/rt+VpDL0NkXniXmnH51rc2tLGqt
	 X+QRpZ2LnQ4NmcDGY/aKDCKC/aIm4ZOzdk5S8gxQ9v8siKAlwzX2mkM5XjmdvJug7rLAu
	 wA+lwDrPx0GW4uXZLt/ppHCyMGh77oNaOloegG9OscMu2GmcUlbyB2fQjKuZwjj6XtOyt
	 1qKzZWJHOS99v1UIr/w9A/BZHkVoGKg3sOQC7X0+urSMoEkWFiXAo3hIZ/IO6Fj83kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792240;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=rB3JPEd0ue8CmcRIUrA4S0aKhjQuQL9RmdzqUqrvRpU=;
	b=iho0UVv2eZJbUaMMzYW/VRQYBj/Pk4ccGmTZGhiF63IcKqHiufKZPErl7nGGhn3PhoWF
	 k5yw0GLh0vyb1Iw88+AMHmGggkYuBkHWJBIcIMw8Fdl38s94w7Sn+yl+KatQAMmHOV/B1
	 efR9lEWv7awbRsr+sp7keASWqBbsQZNqDCdcHgEuHDeoYICUjRbZLUPmapJNqi25IBlL2
	 SwzlMJZHrqdRFQZ0pCeuosfzDZTs2CW9AfbAYO+b/lxonf9TSfGW1iQiBrw2hh+iVDCQD
	 lLYVHaHSuagpGauuNUOy47r/7U9I8hicwgy8Stpo9+XEvzoRnTU8TL5BvqTLfZtpu9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=XDUAA8Mz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.55
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011055.outbound.protection.outlook.com [40.107.130.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AA4606D82C;
	Wed,  4 Nov 2026 11:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0AA4606D82C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=XDUAA8Mz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s/1AvUcEUbCU0ttr4+7ptkPrBDFwOz/1gyMo+l3DxAC2/cNaCbR/67opRQjJt2ffbDRQT6Km3AumRCgdKsLp0CE2quis51vfH47ZFVkIbgdjgi6mLMWiKf7b6xFQ5mTyVvu7nmNsLUXhe4yHk7X39ULnx8lim3aY398zXaYDnB+ZH+xO/jNdO0STIapdYwaxSpKI58rfrA2lN/YSoMMujKeZPNudxbBG/tO05R4aO6f2BKzPUqtqLcE11VpW7RdQd426bUoPwqVMcSbMvI9mMVMOEAvhkwCKM70yQlEjPi4AI3nwy/SSDP9qH5e371hQ+W7StY4uuhIXGzUmgh0AqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rB3JPEd0ue8CmcRIUrA4S0aKhjQuQL9RmdzqUqrvRpU=;
 b=iMKUviM+CkD8TbFcfREVPsJEYDRZTKptpG/evmesqkwLZ+8AdDZUkqOU9M/ZkqPmtf+4gMWwo+rDAqXiWseuMknYVIESRjwaTYkDxHYxvgJpxyP3d5nHSlMV0rjQN5OzJuZl7bj3hire6+ykg6lmXHFKaT+jD8PODrkJq15FFIUQ5P4+3aYlX/40jJNHeevmUUGigon+iZtezbjpE1gO1G+3SQCF0+Ughilcl8uV06/eJLGDJBo4MMogxYPQy2ewNH0WjtZR+LWO8JkvqLoHV7WJh9L1BGCq3+fq7jVt4RVw6H2IwHYfOaoVJNu2sa2K+CtlsTecaOXFD25GDeCReA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rB3JPEd0ue8CmcRIUrA4S0aKhjQuQL9RmdzqUqrvRpU=;
 b=XDUAA8MznyFbthv8hto0NAffaMZsPVt9OSzC82Rxi2eeiK5f0FA44psjze/iEmLXPDqtVf9K8rZ4SgKf00erfS/KpBlRTKyPlnU69ya6LFeJUOTJ6v0vaUkRAKN4PKfDtqmHNQ/5DTDQyqyDVCa+VMEKeegrkO3a9Dx+XFVxSyMfHIZiDXYbQiQ9w7ufIlW2iykrKLd7YJH780hD5FRxI1gCgk4Dobc6KGtr5sI8Nb/X743RVwdcQc7/KwBssLk+yMWM8omuTwlvAZ5yjsK+CkEvT+EEl3MjjXSeQtKGI7I0amU/PBg/AP0HQ983sZ+m3zCfCndMbbLevqvIMTn7Lg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS1PR04MB9264.eurprd04.prod.outlook.com (2603:10a6:20b:4c4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 11:37:17 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 11:37:17 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rpmsg: qcom_glink_rpm: Convert subsys_platform_driver()
Date: Wed,  4 Nov 2026 19:33:58 +0800
Message-ID: <20261104113358.1634256-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:196::14) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS1PR04MB9264:EE_
X-MS-Office365-Filtering-Correlation-Id: b2ccb6e9-7bca-476b-04e3-08df3a67fa8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|376014|10067099003|18002099003|56012099006|11063799006|261009223027099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	iVY78lKuAphqm0Qn/vodYNzKqvBBWyeAGk9KeWRUwz9xkY+V5VXNokcOQVeowcigBdjXQPLwpv6H84FsFrldymTGKhcPxfZk3O345Zc6hz5aKmQWqGU5coekrFayIhPNJM1jCU8R+vglhzWl/k98S5YjgWrqX1u2POTX4sZfoxrbhdcEVEa5Ne1RwqobedPzUT6wMb1H8rCh2x9kTU1XuF0X8uo5XmIAwCeNHLuT+EcOATAWFMKWUYNraHqPUkTCXMyWP+f3sy6+maNesu06C860v9cSR145fAzZsN4jJZU2c/WkTF8Eg8YD/3+gnNvM0HwlJCXNxynaPwA4LG2ELI9rGjlpJ//4MtVNemZZpB668hPGLs7+Ofbd947FREmmPz80gQgTD8DVAJISPv9Zyzege5yqdQNZdJoL5ZS+ejqdKcLvAT5g1iCyHTHpWhKtMe0eO0/DCfxQqhyc0a8MeUoaK2YWT0S/g7QVzwLRyB0Ka3kdyVeTIPedbF3UY+Au6M6WCKY2kjmpL4J6IHXOzl4suTEEAWhpe+JICZ6EFwmqDLG3j1Os7UdgElu+LoKJr3PmdoyBm00B2uwyk6sy5CBGj09VebyNGHLE4EEPgbji5dk13wV1S2VdpL2g4Q0qXw6VEwTCTVh4VAjtrqsI06/z/A9WIihFhJaH7jtT9oY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(376014)(10067099003)(18002099003)(56012099006)(11063799006)(261009223027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8b0r5kJgoTZyAhh6XVfnbCsSG1pCvlY7hKvaSYmvoTHmsMLso2ID9z4U5V79?=
 =?us-ascii?Q?Q+Xjj9rzZ4jF+IGXMRiIJHGxKDJLolNfY6rKfg9AK6tNs5eAvEIYb4qoCkM0?=
 =?us-ascii?Q?nfhZQj8MslgN0ygTTzExqNj09RTpuvuB+nJsBz477/p2MH/v/JINT95+djHw?=
 =?us-ascii?Q?cc+PLwedc2+/pKnXBniEdoy1hZoNkIx4iUoApX3vnRSKLk32FAZJYDPzzres?=
 =?us-ascii?Q?RROHqyDAMBN/lwsaqOf3jkzi8m9sboTSL4NwWYLTFm8rwM8JuqKSATJV8PH/?=
 =?us-ascii?Q?UNHiR2/ZrQtQGi4sD89oC++ehtYBTcC1ucHEXCM/VOnYW97q92KbU7F3Ss6e?=
 =?us-ascii?Q?U28CC9OBn8wADvz65H9gK9yaZ2his2sgnyl6R7N6VKXMvVE5wKl79y/+czf2?=
 =?us-ascii?Q?j10D6BoEWatCTy7sNFIWFyM4nuV8iJFiGdJ9gA46zjj1yWyNx428904kOSbE?=
 =?us-ascii?Q?gNU4ESrWsN+F/b47MXym2aZ74VVqlBE2l6y6YNzQjNlNqAh889A9xzeO/vai?=
 =?us-ascii?Q?B/0H3DsnvwuAro3WdfdcByGTwMKkyYUFCij5sf4vz+CARku9UUolH68XaLBk?=
 =?us-ascii?Q?8GlOCPKI4PswNb9/rtPmFcOrsvD4mOrx2Opz+2lu3w8CtOWg9W/yL9dTetP8?=
 =?us-ascii?Q?pXqQ2qn27vUtIqCJ2s2k7C4j5zRhy4t43Z+GeV0n4bw0eEF7qsAkIapkjoQp?=
 =?us-ascii?Q?i9qqKuH2Abj31auaih+9snp3gEdCRwrosSyzWHUf2Vuq/tp4rf1YavOnBwE8?=
 =?us-ascii?Q?yOt9P8KI3RwXLa6CZM1lVNmMg+05tkBqOs12Wx6rFGZBVaJTMGuldkbCG1GS?=
 =?us-ascii?Q?4ZDr5euXfukOP45ZV/vHBL37IYNvYMtFxbFAmfmzQ4VeyqnbuhdWpfjHbziS?=
 =?us-ascii?Q?KZ/VEMuYHprWVVp4bu5wsB+yita271FINuWn8P1W91MfgESP6nzGrxMP78Gw?=
 =?us-ascii?Q?YD6GjQ+xH9fxvt++aTYsOSipaGtd7x46SYkDoeBCdz592selnJkBW8mXpIfw?=
 =?us-ascii?Q?OHLCExzCUhfbfP9U26WBs7CoiOnCWERI0pJvDB1IeVw/tTL1REAiKSzI6WXU?=
 =?us-ascii?Q?5fhVxxX8LQ1MqHGXHvJ/Dwn2hd5Bdq6EKeHH728bLSTlbXov1PHM2JSH3ykG?=
 =?us-ascii?Q?nV4MPUJodfwpxTrXJ7BIJsaHVy3IGCE2hOmr+rtVdHFjDfZ5SLdcbAOg5phE?=
 =?us-ascii?Q?jEiowQ3S0z+GpvKrExY8VeY6/LCa5s6j9y9hT0+1MnsVhqeltaVWh8pQXQI9?=
 =?us-ascii?Q?g01G61QMUMaDJc7doKQwSjs/tXtrhX7a9TaOPgoDIOZmEZimFlJcy9zFLCbI?=
 =?us-ascii?Q?pGIyWNBoHaXgMy2BTY7Fx4LIXQQc7qVpMQBvrsU1TBZMuz2eP2re3mu0ZM/V?=
 =?us-ascii?Q?2NJ8znWsmMxXhJZtOSe18xaKbEHczEnGK44gFuWujxyiNvjg9NmRIdYGHqm0?=
 =?us-ascii?Q?ecOmhDi2VsHDaX9x5j5agJw03QfIX3h7yq7nLw7rylcoLimY+MdWgHGkoM91?=
 =?us-ascii?Q?yqh21GSroOOkKlF8BDgz6PGjZ80IPaQ5PkO6pHKIHZEVH1dyVd2Mjriyp5PW?=
 =?us-ascii?Q?V25FFfMl99wwDBGDbYVfhbEfOMO8bXevIVoyQ6RUbpHIpLTP1JsmrE70ByYX?=
 =?us-ascii?Q?rGsCtlcypPcOxhNpFufjEuukdQM9JOl0jVqGuXFoTW4ThWkwE+SXmI1hEGgw?=
 =?us-ascii?Q?g3aLqM7ssViMTfkMdUJBDPzA+DQNCM9LJgRPOE4yPyuW8iLc1mL9RfoAGYkm?=
 =?us-ascii?Q?sBbMx1uCfmIvKcntglQEPw8olpCKCdFYo0D673LNzSfFcCM0/8kY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2ccb6e9-7bca-476b-04e3-08df3a67fa8e
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:37:17.0611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k9/QMOy6hGYQJrxK/zlwoiOMtEgj2aDhmdbI9ZlRzr6sS2qpaDgSKREoCzo5COvTQ9iKpMEttO/XrE1krYKuMPCO8By7tMif7iEyHvdWg7p0HQ0KnrBunZSs2boUfbHi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9264

From: Peng Fan <peng.fan@nxp.com>

Replace the open-coded subsys_initcall()/module_exit() platform driver
registration with subsys_platform_driver().

No functional change.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/rpmsg/qcom_glink_rpm.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_rpm.c b/drivers/rpmsg/qcom_glink_rpm.c
index e3ba2c63a5fc..7f1338757e84 100644
--- a/drivers/rpmsg/qcom_glink_rpm.c
+++ b/drivers/rpmsg/qcom_glink_rpm.c
@@ -387,18 +387,7 @@ static struct platform_driver glink_rpm_driver = {
 		.of_match_table = glink_rpm_of_match,
 	},
 };
-
-static int __init glink_rpm_init(void)
-{
-	return platform_driver_register(&glink_rpm_driver);
-}
-subsys_initcall(glink_rpm_init);
-
-static void __exit glink_rpm_exit(void)
-{
-	platform_driver_unregister(&glink_rpm_driver);
-}
-module_exit(glink_rpm_exit);
+subsys_platform_driver(glink_rpm_driver);
 
 MODULE_AUTHOR("Bjorn Andersson <bjorn.andersson@linaro.org>");
 MODULE_DESCRIPTION("Qualcomm GLINK RPM driver");
-- 
2.51.0

