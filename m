Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013021.outbound.protection.outlook.com [40.107.159.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29825224B1B;
	Thu, 21 Aug 2025 09:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755769912; cv=fail; b=jU/DwKlRLo+c0x5Hx+y6UOCYNGRq28Nq0pVhSJ1RGZiXn9MH3uomOQqdOG5Dn+T+7t65SqEdqAzLsbbUorMnCp4MTS9qjlkOVGSyXPMionSkKLF/JbK4i/NdbvvpWnQGUxT9pD/1i3BSPYgZVCGJ8s8zlSOTxiDaFSZ/F0PwkFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755769912; c=relaxed/simple;
	bh=6AZOLHtCC92HgZSwvlYEa/WDrxKUckVFrc7x6TGKBNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DrdI4FJCo8BZN+evyBRfQuomTbWAkC+OU7bMcQoWaW4WcqGSZ0V2WsVtDa7ZyTGjMjzN4Nl7rXj/9UwOuAptXrrmZ/vxYduu9t8xtpVC2JZy5f8F96hSteWlfZjKdj9R5fFNUuuzUmNoo/dJCGFTzhiv26VB/BbjrUbaLCWDDE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=v+prr1Ge; arc=fail smtp.client-ip=40.107.159.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="v+prr1Ge"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RMwFPKxuumspFnXZPYI87+M1fv8vYJo3iadSFEFUYY5+a9cB9G+qpmI7L3anXeiN20HubL6G17p6MTiSDr/9ByXQmL4b4a/nAi9i7AvYJUeVuHNWKzfi8iJE4nqI/fF7cToB1qBvC9RtYXK+gohI+z76DzR99Aii/ePqMqH5RecVw3QwDBuIu4BM5DcfT2e3VtnHPJ2SBK2U0R/KPizGDZbHWAxamcc6eeLpy07iiqBr1DjqEqkANeGJM59Y3m46Oz7jW5caBEacGokpt7nqi2o9PHf9qmw1zFLimrJeZt7JgxCg6KXnJC1gh0zbDobnUjlBdUWkTCGl1k6Bmv0UBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+zLHkYC4FcV+3KDc0Sq0+/X4YhPXcqIwAQnrN3af5Y=;
 b=DoMTOu7aHFXNK8KH0H0SS0zKAYwHMvvWmuEoR+hoP7jKB596E8lotg5+wjuVdsdlHThXOtKXxOhNOTWXR2mkO+iS7OARUz9EdrB6jMSoQUYPaZT6Z5rgqeXUccTStcZ+TQ6IRyBc/JFZ+MnazUx7QCQxwyUmDYIswG4BK1cTd0zNWZgDgF/oX898L8M81KVDZPoJqOsPX9MJlOi82ePyvpqSdNlvPMmy/2up+QI9CJoEuPQJyY45SBrsnZFcjZ/+Xai/dCTMc4LRSOUb4n9nKmTJXwgB8xT4UmlWgX9GE6xR6W7OJtcTidOUjJ+QkIzxggkIps2BLNTkkBEKjr3uNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+zLHkYC4FcV+3KDc0Sq0+/X4YhPXcqIwAQnrN3af5Y=;
 b=v+prr1Ge0idEFwRbnwlLXygzykuNiFFr+7Hcumgi21wXKKj75E8CNDMyAAtAk0Cv73CXQ6MTWopYVUu9xouenxV5iItbQXh0GFwpPMRvOeUOqVnpJ28XvHNqnMsBLRz+rMX2h+0bMiexZL/blvJRa/hedV85K2qnJPIBJtqSksw5dHgdMSCI5mns8WbmBOUMwuC0L6bj6y7PY6shWLgNlBpYsNAi8at/GznkvniGqXWHGOqBc9g3txk7qjypbVuDRCM3ATDPiGv4j21Kesg2bALoXrdiuw7F2pTgkLegL0M3UZ4+yW2VStb++3wELBPAIstOEXxYax/v0f7NHvBVRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PR3PR04MB7387.eurprd04.prod.outlook.com (2603:10a6:102:91::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Thu, 21 Aug
 2025 09:51:46 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 09:51:46 +0000
Date: Thu, 21 Aug 2025 19:02:52 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH 2/4] remoteproc: imx_rproc: Populate devices under
 "rpmsg" subnode
Message-ID: <20250821110252.GC19763@nxa18884-linux.ap.freescale.net>
References: <20250818204420.794554-1-shenwei.wang@nxp.com>
 <20250818204420.794554-3-shenwei.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818204420.794554-3-shenwei.wang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PR3PR04MB7387:EE_
X-MS-Office365-Filtering-Correlation-Id: 75540db8-94ac-4858-07be-08dde0985746
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|19092799006|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8JuJBGEyG90Y8roSV3A1yxXdszCZcr7WFZhHR8zxBjQVjyb42ABjuIbz4fzT?=
 =?us-ascii?Q?MD0M/68npAWh4CRMSs0BnlW9T+anESNdkQ34bV1mX8MmYmERq9jVEVYaHq7i?=
 =?us-ascii?Q?xjg2FNxJJt46RxV6IGEiahgkOnw9egBWbrgDIOF37qneSNFDwcCd96jcJ1gX?=
 =?us-ascii?Q?Z+KYEanFUPUKywC322P7w16PuGrX9zr7qhQBX8G1BtlCQF8UOIdQoFkJCE+Q?=
 =?us-ascii?Q?rcg078n7A/Bz9y1jtA+V5lZUTCE6Axzm6grGm+mQsC8H39hI9vthxsNDNULo?=
 =?us-ascii?Q?pCH9lK+g1ETrjFAVwo8T5gBfVjrafsXPYiTMEVKe16vj4ATg1wsaWEUEanbx?=
 =?us-ascii?Q?gwE5iw6DucfJdQoNL9Icz+dD482OP35yryg4Q5ZzpGRnLOXP5EtaTJbrvnF2?=
 =?us-ascii?Q?GXLSHlet36wTSC5FLYHb2pEyuuI7n1D7PVzvOijr8ClJQxmLo5CnQ/g0WZgq?=
 =?us-ascii?Q?0s4KNtxUNz34H9TYBylqpBugxW5bE8R0yiTyi1riA74EksqWJaF0we9kxSSU?=
 =?us-ascii?Q?GtSsQoyvkB0WkQOlLJk999qhb9KdjwEM0lT7crHVKctlvUKX0BIfP3Y6PjiU?=
 =?us-ascii?Q?a7axudzj526moGCmNbaTo0ZpAwF/Y3F/kbbQAjk/CuWCblvvbcQHM+5aSmLj?=
 =?us-ascii?Q?/lzng33KAcov0Aeuzh3uk1NFmgR8fAhWium6eoydPxH/DozxTg14wou9weH3?=
 =?us-ascii?Q?k04dQmXhXdVfJY3w9wI+188JG9dNf+goxqZDM8kJS41/1VHXgaJwXTm74e4+?=
 =?us-ascii?Q?eD55KMHxY6hOsccAxziwkj78nyIqRQJlRxY/4rPX99/tStHHqDOywYpD7nqA?=
 =?us-ascii?Q?H323ZSencQFLguN65QEPs2ZIJF0CQ6pEp2HFL4GDCSehUHk2+kW0wECJ0XfD?=
 =?us-ascii?Q?1Dd25XwzF+6//s8JWWxIJa5DQNujUdM1ysgf6RoYdSAtL0X+Nc1QO/sdC//h?=
 =?us-ascii?Q?EEX1h+2nr06poFS5wOhDegZ50/692oXs7JO0CqAYRJ+8fX6O52ABhQAF5I4b?=
 =?us-ascii?Q?wEp0UQB6SObWqHrOsQHsDMxRHOkaGmftOc9uxUTdmj11TbgIfVBQ2cFv7wrh?=
 =?us-ascii?Q?Bz1cazCRW2s3Skb5mEawzLM77kDnxQ8Z4M6Ct1XlCBw/bt49VFdzRcApzFeE?=
 =?us-ascii?Q?ekCYsQwX7QrcFhHHbQxzwQTQ6UTmPrLlgbyQeZyS9I4DqCaOPMrZ/nUXVT88?=
 =?us-ascii?Q?uEAmkt6u9w8woPo5S7U2GmgFZXEza58+1KMEeQ+IZWkecU+cOr+gCbcAGMD8?=
 =?us-ascii?Q?VGcix27QooZBmxINIrRSX+YTxhbfLQ3jF7p3vQwYbxJDS0NbEdD0OFgAlQDu?=
 =?us-ascii?Q?Ed+oMJhaGxKHLONELXamGjV8hINGBssrAxIDgtA1GGimwmvOjTxXvH97m8xz?=
 =?us-ascii?Q?tdp3RLl5Js1tBBtMrv6Jf1OzI+mlrLOqLVgMFpVZSOyzmpcmYJSf3fzKqFz0?=
 =?us-ascii?Q?w+gTVZ0ZFFwMvcxIMmpUEDY13I+SvMX6rX7JZGkYL5X2U64+YWY9nw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/xZgP7oPlH8kf3bOYoSCbVloKlm1pQM7bFDyoczjKsF4o5G+yNap1IJoGhcF?=
 =?us-ascii?Q?k/16xt8nLL/XKhWO92QyRczglURvP9z+3DqXT8y2QspxUbQkAzJ6JEK7z4An?=
 =?us-ascii?Q?Wvh+dIpCQJDUmJkXT1pEDK63IN3k+/meQ6AdStKAvZMQdkGoCMHM5U2T2MuA?=
 =?us-ascii?Q?sZLF6sCG1vohYSf4SPIpbhibe7oRSpt7UAe1ZjE8oKjfwEOV5NyQV+FeCocz?=
 =?us-ascii?Q?WPuonLjgApqa62OS3aKHkj7CcVRRE9nD8adGPC4oDxyHl5y537mIGEa7+IT1?=
 =?us-ascii?Q?wbekzFW+D9bk7PdCSJDLfMi0oI4TpOTegHJ1pbUE+nGcldavdb2gwwg6VAMp?=
 =?us-ascii?Q?KD4cY8v2GKw+uhBY6y6XfDZ+4BRYy5BrfZU0u6PA4SnNWvQHEWpvQlgBx7gz?=
 =?us-ascii?Q?D3s0Fu/gouxN0lrwkjZr3A+mtdbgDdQmnMx9ZMw9wIZEiZ8ocIw47qB27/Ng?=
 =?us-ascii?Q?7zeUDfKqrSSinmu9SO4HYLDfcLNBfq1MMF+5p58+MZg0BUEelD1RUpDD4Wb7?=
 =?us-ascii?Q?Ex5CXn+iHXCXlKyPa7VZ5S8JWmz+b7vrAWIoDjqRQtjjzi7asOW+uT9gWir5?=
 =?us-ascii?Q?dXJ2S+altmb/R6GNVz9P8mrz7lM9JfSPcsmCaibf8lwSOTfXdVjo85hSqjCj?=
 =?us-ascii?Q?4jgJuZDyMpp7hZJ7silW5nSjUocavNAiXZLlvQnmTVwAdKLNIPhEjHkAHXEM?=
 =?us-ascii?Q?+PdbzEuOXRvJ7bJb0L4GqMPSxcDYn/Oj4faGP06Nig3N7nCRW5ginB1JUXky?=
 =?us-ascii?Q?Oj3iGyVwf6CFUOeusFInOwTbN5g59HB+odimcCiYiJKFduEP3t/lTjrks1qs?=
 =?us-ascii?Q?QQBJrZHF6Dc4nW1HCB6IC5DrfHTySgdqkmM41LEyRMWRptTeCLBIrxhN6+rX?=
 =?us-ascii?Q?MtI1A7F6a9agbb7WETO30J1skQC/o3E35mWH6CTPesCP4Fg7zKccChe1HtYY?=
 =?us-ascii?Q?Kojf7q9QJDlW5dF5j63Hy5Ch+aeOwX/kno1bBNZmaJCF1n+LEK8tYeTBlWQT?=
 =?us-ascii?Q?O9FP89ye9Hf6iH81S9uDjlSBipqKUC78a+mP9pdK4E7mZ+BlnuKhDW49ffuQ?=
 =?us-ascii?Q?n1zQFvk7cokIdVb0UuA+iHUSaaRuBB6LJ+1rdN/syntegmmkYOYNzXOMPgmg?=
 =?us-ascii?Q?r5b0OH7T8BggRi8eMf6oEAWXBMVoqIu2ZeoiKDvH6ZXB5k7sKolcPk3WtPwl?=
 =?us-ascii?Q?kqYbJCOlLC5zIccyUsLH3t9FCuaGwkUEntq4+ZxxNdpLQRe+/Ot1GKInLZTo?=
 =?us-ascii?Q?y8N4Sy5t/afMNVU7UPwS0zihZKBff2ohfU69URiddnOLomGcPSvSW68tbR39?=
 =?us-ascii?Q?ewXU6cdTE1pYxZFO5dmi6yszL+UP9ZUb8nPV+DAQjwa+8nFE85sJSEQnrK2r?=
 =?us-ascii?Q?Gq+rDTUUxJ3LuCNUEKcU/jqmjQ+jcR5F/SM3Yy6SnradU+1tLiiUexqBsrne?=
 =?us-ascii?Q?NhG5ned1pbsplsSeTvYxf/0L0p7FfN7ifOXzSHvhjsPjWGcFMYsy5Iu2/u88?=
 =?us-ascii?Q?GEmVsg0lLoL+lAPRKtCIM1MEiEXknJ3uJltnG7yUlLPFpCJkv1aBwrBLfNsM?=
 =?us-ascii?Q?dALypy0x9sR/4SEEbm3G2/HLTMYGiCe8X+66DP+y?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75540db8-94ac-4858-07be-08dde0985746
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 09:51:46.3955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T+40YUgKZe8msLcYB+Q5nCHwuQ/cI8DkAURllKLGkPVy6kdIT3I4YNiUACNXjYR7vaomn4b5iD1e0HwGCdEfzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7387

Hi Shenwei,

On Mon, Aug 18, 2025 at 03:44:18PM -0500, Shenwei Wang wrote:
>Register the RPMsg channel driver and populate remote devices defined
>under the "rpmsg" subnode upon receiving their notification messages.
>
>The following illustrates the expected DTS layout structure:
>
>	cm33: remoteproc-cm33 {
>		compatible = "fsl,imx8ulp-cm33";
>
>		rpmsg {
>			rpmsg-io-channel {
>				gpio@0 {
>					compatible = "fsl,imx-rpmsg-gpio";
>					reg = <0>;
>				};
>
>				gpio@1 {
>					compatible = "fsl,imx-rpmsg-gpio";
>					reg = <1>;
>				};
>
>				...
>			};
>
>			rpmsg-i2c-channel {
>				i2c@0 {
>					compatible = "fsl,imx-rpmsg-i2c";
>					reg = <0>;
>				};
>			};
>
>			...
>		};

Need dt-binding maintainers to review the binding part first.
Good to see this feature, so I will still give a look on the driver changes.

>	};
>
>Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
>---
> drivers/remoteproc/imx_rproc.c | 125 +++++++++++++++++++++++++++++++++
> include/linux/imx_rpmsg.h      |  55 +++++++++++++++
> 2 files changed, 180 insertions(+)
> create mode 100644 include/linux/imx_rpmsg.h
>
>diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
>index a6eef0080ca9..9b3396f3f1ec 100644
>--- a/drivers/remoteproc/imx_rproc.c
>+++ b/drivers/remoteproc/imx_rproc.c
>@@ -8,6 +8,7 @@
> #include <linux/clk.h>
> #include <linux/err.h>
> #include <linux/firmware/imx/sci.h>
>+#include <linux/imx_rpmsg.h>
> #include <linux/interrupt.h>
> #include <linux/kernel.h>
> #include <linux/mailbox_client.h>
>@@ -15,6 +16,8 @@
> #include <linux/module.h>
> #include <linux/of.h>
> #include <linux/of_address.h>
>+#include <linux/of_irq.h>
>+#include <linux/of_platform.h>
> #include <linux/of_reserved_mem.h>
> #include <linux/platform_device.h>
> #include <linux/pm_domain.h>
>@@ -22,6 +25,7 @@
> #include <linux/reboot.h>
> #include <linux/regmap.h>
> #include <linux/remoteproc.h>
>+#include <linux/rpmsg.h>
> #include <linux/workqueue.h>
> 
> #include "imx_rproc.h"
>@@ -1084,6 +1088,126 @@ static int imx_rproc_sys_off_handler(struct sys_off_data *data)
> 	return NOTIFY_DONE;
> }
> 

Just wonder could the changes be moved to drivers/rpmsg?

>+struct imx_rpmsg_driver {
>+	struct rpmsg_driver rpdrv;
>+	void *driver_data;
>+};
>+
>+static char *channel_device_map[][2] = {
>+	{"rpmsg-io-channel", "fsl,imx-rpmsg-gpio"},
>+	{"rpmsg-i2c-channel", "fsl,imx-rpmsg-i2c"},
>+};
>+
>+static int imx_rpmsg_endpoint_cb(struct rpmsg_device *rpdev,
>+	void *data, int len, void *priv, u32 src)
>+{
>+	struct imx_rpmsg_driver_data *drvdata;
>+
>+	drvdata = dev_get_drvdata(&rpdev->dev);
>+	if (drvdata && drvdata->rx_callback)
>+		return drvdata->rx_callback(rpdev, data, len, priv, src);
>+
>+	return 0;
>+}
>+
>+static void imx_rpmsg_endpoint_remove(struct rpmsg_device *rpdev)
>+{
>+	of_platform_depopulate(&rpdev->dev);
>+}
>+
>+static int imx_rpmsg_endpoint_probe(struct rpmsg_device *rpdev)
>+{
>+	struct imx_rpmsg_driver_data *drvdata;
>+	struct imx_rpmsg_driver *imx_rpdrv;
>+	struct device *dev = &rpdev->dev;
>+	struct of_dev_auxdata *auxdata;
>+	struct rpmsg_driver *rpdrv;
>+	int i;
>+
>+	rpdrv = container_of(dev->driver, struct rpmsg_driver, drv);
>+	imx_rpdrv = container_of(rpdrv, struct imx_rpmsg_driver, rpdrv);
>+
>+	if (!imx_rpdrv->driver_data)
>+		return -EINVAL;
>+
>+	drvdata = devm_kmemdup(dev, imx_rpdrv->driver_data, sizeof(*drvdata), GFP_KERNEL);
>+	if (!drvdata)
>+		return -ENOMEM;
>+
>+	i = drvdata->map_idx;
>+	if (i >= ARRAY_SIZE(channel_device_map))
>+		return -ENODEV;
>+
>+	auxdata = devm_kzalloc(dev, sizeof(*auxdata)*2, GFP_KERNEL);
>+	if (!auxdata)
>+		return -ENOMEM;
>+
>+	drvdata->rpdev = rpdev;
>+	auxdata[0].compatible = channel_device_map[i][1];
>+	auxdata[0].platform_data = drvdata;
>+	dev_set_drvdata(dev, drvdata);
>+
>+	of_platform_populate(drvdata->channel_node, NULL, auxdata, dev);
>+	of_node_put(drvdata->channel_node);
>+
>+	return 0;
>+}
>+
>+static int imx_of_rpmsg_node_init(struct platform_device *pdev)
>+{
>+	struct device_node *np __free(device_node), *channel;
>+	struct imx_rpmsg_driver_data *driver_data;
>+	struct imx_rpmsg_driver *rp_driver;
>+	struct rpmsg_device_id *rpdev_id;
>+	int i, ret;
>+
>+	int count = ARRAY_SIZE(channel_device_map);
>+	struct device *dev = &pdev->dev;
>+
>+	np = of_get_child_by_name(dev->of_node, "rpmsg");
>+	if (!np)
>+		return 0;
>+
>+	for (i = 0; i < count; i++) {
>+		ret = -ENOMEM;
>+		channel = of_get_child_by_name(np, channel_device_map[i][0]);
>+		if (!channel)
>+			continue;
>+
>+		rpdev_id = devm_kzalloc(dev, sizeof(*rpdev_id)*2, GFP_KERNEL);

sizeof(*rpdev_id) * 2

>+		if (!rpdev_id)
>+			break;
>+		strscpy(rpdev_id[0].name, channel_device_map[i][0], RPMSG_NAME_SIZE);
>+
>+		rp_driver = devm_kzalloc(dev, sizeof(*rp_driver), GFP_KERNEL);
>+		if (!rp_driver)
>+			break;
>+
>+		driver_data = devm_kzalloc(dev, sizeof(*driver_data), GFP_KERNEL);
>+		if (!driver_data)
>+			break;
>+
>+		ret = 0;
>+		driver_data->rproc_name = dev->of_node->name;
>+		driver_data->channel_node = channel;
>+		driver_data->map_idx = i;
>+
>+		rp_driver->rpdrv.drv.name = channel_device_map[i][0];
>+		rp_driver->rpdrv.id_table = rpdev_id;
>+		rp_driver->rpdrv.probe = imx_rpmsg_endpoint_probe;
>+		rp_driver->rpdrv.remove = imx_rpmsg_endpoint_remove;
>+		rp_driver->rpdrv.callback = imx_rpmsg_endpoint_cb;
>+		rp_driver->driver_data = driver_data;
>+
>+		register_rpmsg_driver(&rp_driver->rpdrv);
>+	}
>+
>+	if ((ret < 0) && channel)
>+		of_node_put(channel);
>+
>+	return ret;
>+}
>+
> static int imx_rproc_probe(struct platform_device *pdev)
> {
> 	struct device *dev = &pdev->dev;
>@@ -1177,6 +1301,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
> 		goto err_put_clk;
> 	}
> 
>+	imx_of_rpmsg_node_init(pdev);

blank line

> 	return 0;
> 
> err_put_clk:
>diff --git a/include/linux/imx_rpmsg.h b/include/linux/imx_rpmsg.h

This file should be put under include/linux/rpmsg/

>new file mode 100644
>index 000000000000..300ada6237be
>--- /dev/null
>+++ b/include/linux/imx_rpmsg.h
>@@ -0,0 +1,55 @@
>+/* SPDX-License-Identifier: GPL-2.0 */
>+/*
>+ * Copyright (C) 2025 NXP.

Copyright 2025 NXP

>+ *
>+ * This program is free software; you can redistribute it and/or modify
>+ * it under the terms of the GNU General Public License version 2 as
>+ * published by the Free Software Foundation.

Drop this duplicated License

>+ */
>+
>+/*
>+ * @file linux/imx_rpmsg.h
>+ *
>+ * @brief Global header file for iMX RPMSG
>+ *
>+ * @ingroup RPMSG
>+ */
>+#ifndef __LINUX_IMX_RPMSG_H__
>+#define __LINUX_IMX_RPMSG_H__
>+
>+#include <linux/completion.h>
>+#include <linux/mutex.h>

The including headers should be completed for what used in this file.

>+
>+/* Category define */
>+#define IMX_RMPSG_LIFECYCLE	1
>+#define IMX_RPMSG_PMIC		2
>+#define IMX_RPMSG_AUDIO		3
>+#define IMX_RPMSG_KEY		4
>+#define IMX_RPMSG_GPIO		5
>+#define IMX_RPMSG_RTC		6
>+#define IMX_RPMSG_SENSOR	7
>+/* rpmsg version */
>+#define IMX_RMPSG_MAJOR		1
>+#define IMX_RMPSG_MINOR		0
>+
>+#define MAX_DEV_PER_CHANNEL	10
>+
>+struct imx_rpmsg_head {
>+	u8 cate;
>+	u8 major;
>+	u8 minor;
>+	u8 type;
>+	u8 cmd;
>+	u8 reserved[5];
>+} __packed;

A comment should be added to describe each member.

Regards,
Peng
