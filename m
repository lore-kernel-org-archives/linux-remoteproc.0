Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013040.outbound.protection.outlook.com [40.107.162.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296EA46B8;
	Wed,  9 Jul 2025 07:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752045415; cv=fail; b=WY8Grb5DGmsA0HENdK6vdt474ROAWcjOTcKCIWQih/KZow5ks7TlPPDJBoqvOI13QMw/XroX+2Blrxht2c10W4dwdO8zeZHHrfS/AR4RXA1hsEhwnxErU13sgvxay6KLXCL4EjPQ2QVbYZPhtNQPcuMMlUso4eMR6tqrXIleh5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752045415; c=relaxed/simple;
	bh=g2y2dJyGZbyQpon7fiur9KNuZTEWyqyKA35EeEKRclg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WXVOWkNpxQ3eG1TBgp+csCN3JeE88xb/BDnjCt8A1XplXYhrX4hXveDW4M2pS9UcSlejxjyMS/n/OopbF3hqDtw9AIDL40BIOqIMvkSIY8HR7e+h02bCVY9jzv1zlIUwJH4QxEjG9i88uihWyOwVnX6J5oDEBOAdkkBxbaDtqnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=E12En/ep; arc=fail smtp.client-ip=40.107.162.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="E12En/ep"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LdMGCoDr9BcYXGgV6Lq5CgjyL/+T8kDV71Nolr/VNWqoZq1uUWLu66dRjDF2rwAoCIe4YMEfrcb/L8ewtkAumnWA0cInlgxS4eBOAzdBe+FvOag9gPItp/fSxPv697B6bJNYRnVyQQlqHayiC9XysahhJaznv7RKZBTKrZD6OeUvhpLbkxUZrBJ8QD2wt3ouVfU2tJ57kXv//OiOa6kI09McjzlvJUm6HG3+jxHsHF8I/cbDvUv0+7ufA35huG27UgySICE5CCI36soXIbnui6fbzD48gBWlovuKgwhgPcpc6eSw9XxEzkzfQh6j4QF2Gm5PWGgQul5fVkl7D4xZSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=365kPwKT89z3tlHjpKFYcWEam1K+n9f2CrprSU6/uP4=;
 b=tTJ9swgUQSs/dsddGtemaQGb7bH8c/fwEPabvi+rh/KALQoYFa9KwMQEo8LQRMOw4yKYvwZrmutAmbzhWjIuSU8t5NvUFXnKnhNnN+4A0Sv9fbqljkAf1R2a6853Y7wg1w3nqMB4tWgIiz9e7FaQ+vL8NLk2gdUfvwO2fjzfMxhmacgJut/8xNpgm/du1hgUUyMdZ/TOf8duOGhHUiVh8fN8ygHISRw1om/AgidLqwLy24zQoKoS8euDLItJMNpkHBBzimGktAeTsI7umOrLPm8BvKn/ue1mLs1iprAtU2fQveKJDlnDXdI4xNrebpGgKDfD4F9Nsu6lS9A0IRPfRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=365kPwKT89z3tlHjpKFYcWEam1K+n9f2CrprSU6/uP4=;
 b=E12En/ep51QpXcXWAPUVfwE7jwHoFV4vqT6FI1cwcDwTS2QbHcDKnPVivlBKJNv7s3EO/DtuM6rSR57AXMlP8MWv5+uV0O+JDR9YqsW3ypv+znP5+xSfM5CpTAJpgVeJTnRG2tIhN4p/rpCSELY/aMr+NPN/Km+B6ccAeujk/8NloLKoJA8hQFBSK/WIAJuPIoa7uF8UW/MCiwR68H58FFXGV4YDxPhsVDywOrJY2DqbM4v268ChbfKUMNdwRsnPQ4rgIBVkW42IoULKvs/du4PDN2QnuxioC9rVXIn72SdQHa4iMcVhZ0SX4ZGA7eaYLOhb2MPwYUWoE9AZAlCRdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB11052.eurprd04.prod.outlook.com (2603:10a6:800:272::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Wed, 9 Jul
 2025 07:16:49 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 07:16:49 +0000
Date: Wed, 9 Jul 2025 16:26:52 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>,
	Ritesh Kumar <ritesh.kumar@toradex.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: merge ITCM and DTCM regions
Message-ID: <20250709082652.GA15057@nxa18884-linux>
References: <20250703130831.18830-1-hiagofranco@gmail.com>
 <aGgAbwToGhsc5VV9@p14s>
 <20250704190816.kth7bdf34ufc2ht6@hiagonb>
 <aGvyDp36iWv5UQ19@p14s>
 <20250708172953.rbsvk6gy4xuxo42l@hiagonb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708172953.rbsvk6gy4xuxo42l@hiagonb>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA0PR01CA0054.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::6) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI2PR04MB11052:EE_
X-MS-Office365-Filtering-Correlation-Id: d8946282-5952-4422-a113-08ddbeb89192
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qIi1yoNaMC//GiL4l/v5kPpc5KOM91TmBC/NhjfIRNPi2ddwgsNSfGQOWMdf?=
 =?us-ascii?Q?/z1uu4KIa911R+6ax+qkZ1SHPfHKsh2hTXinEIXnIfL3hl6oc9p9enbOrsVm?=
 =?us-ascii?Q?NRLTXMK9lQgyJU4SFj8hqxD+WN0QEUGMx1sQcrBLWERVMaL3ZrmoHRAQjDjn?=
 =?us-ascii?Q?4aHCu/jeGR9pMCRXJ/NdBAC06uqA9cTAHeuJOBNZ+5AEWqBGL0Zwxhfh37A5?=
 =?us-ascii?Q?TxgbPp9U0KOQokeiNkPoXBu4/OyfOQXbJGZH97Khz8KSfnAZCp1lKqQYET28?=
 =?us-ascii?Q?QnSMQA188ffQhdtXczYS+PQPWQTKFrKnuTPBd0eVPHUhhBP3GY5w6o/qHfkC?=
 =?us-ascii?Q?YhQRct9xllcPHOwoK3+gg5dfXQeCUMN/MVbzSLw7+E2olI947P7c6pyt7aAx?=
 =?us-ascii?Q?n0ikNKoYo8pgyir/8YMWK95Zu4nJPyIo16EUanIWWlOQnf52TCdjLS6Lqef4?=
 =?us-ascii?Q?2uFN8667jzT8XkYjFT4+IBbkZOFm0+kGIsgDpi5EoR63dkFBtGqHqOY+lXad?=
 =?us-ascii?Q?XSR/XrRckDyitJ50i9+wHbapTBkCmtsaOgO/V0DS/XgEFXURwOnVliY90E9S?=
 =?us-ascii?Q?nQ/0jJNg03MPzXeC1naNQEAm24Bj+dDQQWB13NDZCWZM9DayYqgHJvd+y7AD?=
 =?us-ascii?Q?ntU1WHU2owPvDZLSUshTODkNMO2EpXz098qhgtCF9Lh5WjcdL419mtUQewks?=
 =?us-ascii?Q?/71IHIGjWA5m11Emj/7GUmAaY0uleeUJ/Of8XEA5pDnrPBOBxvIvZRpvhXt3?=
 =?us-ascii?Q?AxotXZlG+0Dlmyl8+18z1pVSNalS80Q5x7Vrxkr7Pjqgx3Sosh/gEcRpd2pD?=
 =?us-ascii?Q?qQWPwOW/PaEQKH+NFoB4aLiGk7on5lRlp/sJDZPIExXRbppd+stgTtQfT6GZ?=
 =?us-ascii?Q?fKlWffjwZQJciwFLv65eZzeQeMKxbNIBKASuqcsf0hByQQGlaGw+aZFpkiVc?=
 =?us-ascii?Q?gRqOwYb+BFcBv81+El3UxZBJaCrWAOUkYgFSCrQOuUju+LERDu8LV6gV7xL5?=
 =?us-ascii?Q?9k+8bXkK29+XkBpO7bu29J8GQh+qosYIIjxk/qu0MKv5URfhWLlhVnwR6SM9?=
 =?us-ascii?Q?FP1Hn211w8n627O01yA+H6PU813JrmUjjpN/XQWuBPOKgtEx7PdbFadQcUDC?=
 =?us-ascii?Q?CmLlnnnE/dnNOrBcmLoAzpKDQ/BD2yYOCnuoJzGvY58ENbg+aGewnJ3za/Mg?=
 =?us-ascii?Q?dh8mHQcM1Pfen9nzpnxIm0s6THIbtu6wHfiTcDOrEXoazomldTxSx016mvjl?=
 =?us-ascii?Q?GIcx1qVVx73lyvNY05KNTiv6xfaPMRWoKOo/PJgIClWCTZsIrRAh7LEd8C1B?=
 =?us-ascii?Q?JPWEyYoc+Kh53pB+eQgsogYENPHDGgB3eqjsoqq+Pe7Yc5WmXjmJfGQc05cX?=
 =?us-ascii?Q?TN5iQj51PQjN9t82wIgn8ZawTbwWK5MTM9oKFHQoOjwKRIFFXfJOPzUm5bIp?=
 =?us-ascii?Q?Pp8CDJV9Ltc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9k0PKMbcQZYlcEMLBQkn0wAYbY/VB2DoTlrZ5mWoqFVJAVoafgDRehOwBim1?=
 =?us-ascii?Q?aTXLY4MYiAEiX7EpSwvKsWj44RPS8RhaC9EYfNTG5vu1RCWtE3W3/i4lc9d9?=
 =?us-ascii?Q?Re4nHHhlE79YC8eLG6D18j1PmoH7+g9N+HO4oDbgOcsuwKQvD5jsqWpMIeFT?=
 =?us-ascii?Q?qd8hzBy7ntk7zkIuWaoDQ2K//uHdsoRxaFAjHUnfqKRmAkogi6YjHdvQIznC?=
 =?us-ascii?Q?JfPLdk51DO8fJqfU74629qo9VKoR3GKsI6Rep71+cZLDJfWt/vQW6Br9F9o+?=
 =?us-ascii?Q?9VeQuLH4VrFMf+N31hGijlAyTlGDXZmPpApoxT1x8S6/2bfP0grgFrI0kw/+?=
 =?us-ascii?Q?rPbiNyILTVak6PADTov3WhuFH//0EGk2+0+LdrKYcaUSIizEnSX+CkZ1GjO0?=
 =?us-ascii?Q?ONj+UHHofGxMDghBuZyuins9xxTF/iO1CPP1Iy/Pzj3ER2PTxHXhk19tRwmq?=
 =?us-ascii?Q?7GrOxwLggZ3jj/+ArHKpojN5S2M9Buc4DL9i47jshK2vl15VoKuoL9YEa7Fi?=
 =?us-ascii?Q?kM6L/LQYWAacwMy0bDTQczTjPKTVO5WoKWU1VOjykJFQWryMst68kRIvaGed?=
 =?us-ascii?Q?PG5mdsw5g3BMLPCbUJWaAuKxnRpiBZKeF2byx6x7Qpz1SXOx1SQC601uFMyH?=
 =?us-ascii?Q?BI+RaNkgZjD+mzbvOb2VxcDWKoqXICcLruv+ruUMefGFU3K/1b2oJY61LyLc?=
 =?us-ascii?Q?iWVs9y1VIzkFzdTX3LQKjKyRjmCDbgWjYu/+H6irsMVL+4Sg8L4z+IRC7dyE?=
 =?us-ascii?Q?hX0AWOQ7oO/eY/b8lvgFLp+zg9KnwJBs4xGdcEKHKb4hIN3eZvpfI2hUFae9?=
 =?us-ascii?Q?AvXZwNizC4SxxPFltm9FqX9qR4+wQBklujtTgTLeaEgOLSIWuZ1CcZ3WfzIM?=
 =?us-ascii?Q?XVR8r/iQ7K0ROyzYh3iMN8H9wYbOC4/6QN/3L31IT6u82kpDcRwywXI+Zg9d?=
 =?us-ascii?Q?Q00uBzvdgUYfdQBn7vuPBKrYFGNK7x4YJ0rB0BpAmDVITSmY10geNbGo+m6U?=
 =?us-ascii?Q?vAlVmRGsuMPiS0i88vz4ilIYfuCsnA1onI+ucY6z4GlDLk7Ok7Gzo/mQD410?=
 =?us-ascii?Q?Wbbmgfuulk4pjUIeefAATIbdtesAPBHtiUkp6ESi/neHPWG1NSoSee/5/5MY?=
 =?us-ascii?Q?+J9te1iybnZCx4makptWnGsnCCPa/7yZImuTgXvAAsUzD31m7W2CrEl1uOvX?=
 =?us-ascii?Q?DNWYYuG7Nf1QLUaNUb3L6TeKxIC6yMhpwhvEMiwyD+oXnxDap5qtzAszfIGg?=
 =?us-ascii?Q?HmtpZTYj+kIQ64XO7vxFEObh3jEG0xWQOv7j8mzoLr0XmlsQaBmmrPK1FD2R?=
 =?us-ascii?Q?ztt0xDTLCtCfQnrS7uCXeGgDt6t4N54eUXN9Bkrq96bHFenz560+RvbyerXh?=
 =?us-ascii?Q?/ugx9dbS+aLN/31bQ5/TAm0AK2V9WURuzymr20g7gQFZDRLreuCFnzB+7tHt?=
 =?us-ascii?Q?ewVLAM9KvAOlfd5wNIDyyjHsn5fFzT5Bi0uZ1sIgElbvUs1ETm0FIVkwSX3L?=
 =?us-ascii?Q?v8taSzvqc+TmePj7YECStvidRjcftf7vme0wuiWlHuZprQ6GTbnCEDGKRFKk?=
 =?us-ascii?Q?vFqsLCR6kxhI+TbkM6lNUiSDHLrB1k1avZZGva8C?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8946282-5952-4422-a113-08ddbeb89192
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 07:16:49.3404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6jYXtKxQq8PjX4m0ugh7tkU0ivzLnTtFznwHWVjY4iDeB1uq+aj9x1Etk8QY6WPmM+nvV4+rYz71EshRPPYo8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11052

On Tue, Jul 08, 2025 at 02:29:53PM -0300, Hiago De Franco wrote:
>Hi Peng, Mathieu,
>
>On Mon, Jul 07, 2025 at 10:13:02AM -0600, Mathieu Poirier wrote:
>> On Fri, Jul 04, 2025 at 04:08:16PM -0300, Hiago De Franco wrote:
>> > Hi Mathieu,
>> > 
>> > On Fri, Jul 04, 2025 at 10:25:19AM -0600, Mathieu Poirier wrote:
>> > > Good morning,
>> > > 
>> > > On Thu, Jul 03, 2025 at 10:08:31AM -0300, Hiago De Franco wrote:
>> > > > From: Hiago De Franco <hiago.franco@toradex.com>
>> > > > 
>> > > > Merge the contiguous ITCM and DTCM regions into a single region to
>> > > > prevent failures when loading ELF files with large sections:
>> > > > 
>> > > > remoteproc remoteproc0: powering up imx-rproc
>> > > > remoteproc remoteproc0: Booting fw image rproc-imx-rproc-fw, size 151824
>> > > > imx-rproc imx8mp-cm7: Translation failed: da = 0x1f48 len = 0x1fcb0
>> > > > remoteproc remoteproc0: bad phdr da 0x1f48 mem 0x1fcb0
>> > > > remoteproc remoteproc0: Failed to load program segments: -22
>> > > > remoteproc remoteproc0: Boot failed: -22
>> > > > 
>> > > > This approach is the same as commit 8749919defb8 ("remoteproc:
>> > > > imx_rproc: Merge TCML/U").
>> > > > 
>> > > > Suggested-by: Ritesh Kumar <ritesh.kumar@toradex.com>
>> > > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
>> > > > ---
>> > > > Hi,
>> > > > 
>> > > > The ELF I tested had the following data section:
>> > > > 
>> > > > Memory region         Used Size  Region Size  %age Used
>> > > >     m_interrupts:         680 B         1 KB     66.41%
>> > > >           m_text:        6984 B       127 KB      5.37%
>> > > >           m_data:      130224 B       128 KB     99.35%
>> > > >          m_data2:          0 GB        16 MB      0.00%
>> > > > [100%] Built target hello_world_cm7.elf
>> > > > 
>> > > > Which triggered the error. After this patch, remoteproc was able to boot
>> > > > and work fine. Thanks!
>> > > > ---
>> > > >  drivers/remoteproc/imx_rproc.c | 6 ++----
>> > > >  1 file changed, 2 insertions(+), 4 deletions(-)
>> > > > 
>> > > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
>> > > > index 74299af1d7f1..bbf089ef48ee 100644
>> > > > --- a/drivers/remoteproc/imx_rproc.c
>> > > > +++ b/drivers/remoteproc/imx_rproc.c
>> > > > @@ -166,8 +166,8 @@ static const struct imx_rproc_att imx_rproc_att_imx8qxp[] = {
>> > > >  
>> > > >  static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
>> > > >  	/* dev addr , sys addr  , size	    , flags */
>> > > > -	/* ITCM   */
>> > > > -	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
>> > > > +	/* D/ITCM */
>> > > > +	{ 0x00000000, 0x007E0000, 0x00040000, ATT_OWN | ATT_IOMEM },
>> > > >  	/* OCRAM_S */
>> > > >  	{ 0x00180000, 0x00180000, 0x00009000, 0 },
>> > > >  	/* OCRAM */
>> > > > @@ -180,8 +180,6 @@ static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
>> > > >  	{ 0x08000000, 0x08000000, 0x08000000, 0 },
>> > > >  	/* DDR (Code) - alias */
>> > > >  	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
>> > > > -	/* DTCM */
>> > > > -	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN | ATT_IOMEM },
>> > > 
>> > > In commit 8749919defb8 "dev addr" and "sys addr" were both contiguous, but in
>> > > this patch "dev addr" is not.  How will this work with new kernel that use old
>> > > FW images?  Am I missing something?
>> > 
>> > No, you are correct, I think the use case I tested was not good enough.
>> > 
>> > If I understand correctly, this will break older firmware expecting
>> > .data at 0x20000000 because dev_addr is no longer mapped for DTCM entry.
>> > 
>> 
>> Correct.  Older firmware would still expect DTCM at 0x20000000.
>> 
>> 
>> > Do you think it is possible (or reccomend) another approach to fix this
>> > issue? In this case to keep using the TCM, instead of going to OCRAM or
>> > DDR.
>> >
>> 
>> To me the best way to proceed is understand why using the current mapping is a
>> problem.  The changelog describes a failure condition when dealing with large
>> sections but does not indicate _why_ that is happening.  I think that's what
>> needs to be fixed rather than trying to move mappings around.
>
>Thanks for the information you both provided, sorry for the noise, so
>please Mathieu ignore this patch. I will work around this in a different
>way.
>
>By the way, Peng, I noticed the DDR linker from MCUXpresso does not work
>if the firmware is larger than 128KB, since the .data is placed right
>after .text and loaded later to DDR. The imx_rproc driver should instead
>have a way to do the other way around: starting from the firwmare inside
>DDR, we could set PC and stack from M7 to point to DDR and start the
>execution. Probably will be slower, but it would make the DDR case
>possible.

I am not aware of the size limitation if image is built to run in DDR.
It maybe MCUXpresso team just reuse the linker script for TCM and only
update the link address.

You could update the linker script to build larger image.

In final elf, .data is put just after .text, but the related section
loading address should be specified as my understanding. See below,
.data is at 0x20000000 for M7.

xx-gcc -S imx8mn_m7_TCM_rpmsg_lite_str_echo_rtos.elf
There are 20 section headers, starting at offset 0xc998:

Section Headers:
  [Nr] Name              Type            Addr     Off    Size   ES Flg Lk Inf Al
  [ 0]                   NULL            00000000 000000 000000 00      0   0  0
  [ 1] .interrupts       PROGBITS        00000000 001000 000240 00   A  0   0  4
  [ 2] .resource_table   PROGBITS        00000240 001240 000058 00   A  0   0  1
  [ 3] .text             PROGBITS        000002a0 0012a0 0046b0 00  AX  0   0 16
  [ 4] .ARM              ARM_EXIDX       00004950 005950 000008 00  AL  3   0  4
  [ 5] .init_array       INIT_ARRAY      00004958 005958 000004 04  WA  0   0  4
  [ 6] .fini_array       FINI_ARRAY      0000495c 00595c 000004 04  WA  0   0  4
  [ 7] .data             PROGBITS        20000000 006000 00000c 00  WA  0   0  4
  [ 8] .ncache.init      PROGBITS        80000000 00600c 000000 00   W  0   0  1
  [ 9] .ncache           PROGBITS        80000000 00600c 000000 00   W  0   0  1
  [10] .bss              NOBITS          2000000c 00600c 00a4ac 00  WA  0   0  4
  [11] .heap             NOBITS          2000a4b8 00600c 000400 00  WA  0   0  1
  [12] .stack            NOBITS          2000a8b8 00600c 000400 00  WA  0   0  1
  [13] .ARM.attributes   ARM_ATTRIBUTES  00000000 00600c 000030 00      0   0  1
  [14] .debug_line_str   PROGBITS        00000000 00603c 0002b1 01  MS  0   0  1
  [15] .comment          PROGBITS        00000000 0062ed 000055 01  MS  0   0  1
  [16] .debug_frame      PROGBITS        00000000 006344 000260 00      0   0  4
  [17] .symtab           SYMTAB          00000000 0065a4 003cd0 10     18 586  4
  [18] .strtab           STRTAB          00000000 00a274 002664 00      0   0  1
  [19] .shstrtab         STRTAB          00000000 00c8d8 0000bd 00      0   0  1

>
>Correct me if I am wrong, but as my current understanding the DDR linker
>is broken without this change to the driver. Anyway, maybe something for
>a future patch.

If you wanna image in DDR, you could specifiy the address of data section
in your linker script.

But for support ddr elf file, you need patches as below:
https://lore.kernel.org/linux-arm-kernel/CAEnQRZC5t=qmo+OJLW+dqZg4gH9cAN=paWDSGbrJb2AvkKBqxg@mail.gmail.com/T/#ec54c42b70416b002936a643b44b79661dd2a8483
This patchset was rejected, because we need to get stack/pc from .interrupts
section and store to ITCM.

Latest NXP m7 demo has included a new section for stack/pc, but
this will only be public in 2025 Q3 release, for pre-2025-Q3 releases,
still need the upper patchset.

Regards,
Peng

>
>Thanks,
>Hiago.
>
>>  
>> > Thanks,
>> > Hiago.
>> > 
>> > > 
>> > > Thanks,
>> > > Mathieu
>> > > 
>> > > >  	/* OCRAM_S - alias */
>> > > >  	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
>> > > >  	/* OCRAM */
>> > > > -- 
>> > > > 2.39.5
>> > > > 
