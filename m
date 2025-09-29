Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010058.outbound.protection.outlook.com [52.101.69.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E38282F5;
	Mon, 29 Sep 2025 02:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759112730; cv=fail; b=RCUs5ZLcw/AgpUWzwJGIdgGUZGt7Ti7EZhr1kjZ2ORUaes/+JAsqTU8ebsS5Q4+NvYF9UTTc0MtpnBXbW3y2OO/Jk2WIp1/7F13AvZarQIrXa4teu7wjiPHHQ3Nm65sJZ5LIKODFbjfU0pZRmuhYoCchsxx25+ujO/TRJrXxQ34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759112730; c=relaxed/simple;
	bh=DueFzDRZxsrdxXnwLR7r+kIlw1uhgHbCkW/uRp/JExQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZkODUfgcCb6T9z3Wd08AUIymhME/q5AO9IAC8+/8ZdppELQxeEmaqS/+y6cbMlyNJn0ObR9IaYhVuJHnH+HTG0WKU9XJu84TN8wp2Af2u6IHE0k+Odwil0JwjWp0WD+7UFTa6QAgFOhiCGGD7akRNdjUP7iQWglljEvZff2o1sc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZPphuKuu; arc=fail smtp.client-ip=52.101.69.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZPphuKuu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EU7k+rK2Zq1NPQ4UmIc68eto8EY7Tn179AUZpG4xDR+B7jr8ocm6/7f+dyrIZtqT6LlSu0nxB35HL8KnZwaVgtcdeWr4FZ5d6RdMPdLMhV+IsNSf/Gn7QGDUb1eA8VlJ3heN2bsXJDpLgdyEekiB+H+wJEQ6M0YqdDra24zT/DGxCaTfQRTiSkucexIfEcdCu8qKUIL5WTNA6Arms4y3/B8qMpmxPYZ9hoza5BItOkz//ryEvm/Je1gMDIEMYg386DMaRcm6/0ZJO1xfK2tIaQ2lFZnEZZPMglZuLr0gnnzcLiUCtaOeKTfRWgrd5wWQldSD/GnkNSZVTi5CrSHI4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jmCCLZmVv3lqA/ZJmtXYIlVXj5TTUVvJPEI49A3nIk=;
 b=iLIwb9SCT4nsnUDonHppvLX6/zM2pIwjQ0YRnHwCEG5UYfwsI5wAX0LGuQB4PC6/0OpAm7kL9MBNUtGw1+ZVgmg+VuBYs5gQAqGX5yrsHViW4pvK6ikT6eY4iKBevRXKfvkF7t/9sBb5PdWtvo2BApXAMMo3Hnni9nNPtmzQfCmQqSCe3v9Y65P2kBNv7XAgdQkTDgspTIrgVgsQoauMvfP+d+qaT6lzFIDoL6M5FZDoIcZUHK2mNQ7zPE7Ru0IvRim+BdyZCQjxhLce1p+m0sDiLmRoxZhXZPQJnUW/nhtJoOvj2b8WwE8UOqM7PPnV6+wvlBoKomBUnK7RIpMlPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jmCCLZmVv3lqA/ZJmtXYIlVXj5TTUVvJPEI49A3nIk=;
 b=ZPphuKuuo6SPxMlXdRleaW1P/xZAIcK1WegkJ41uQbK5dmVC1ZaQHugC53LNvLtlIPYEyrMfYW2yHTPkgjBCA2xQZDd4WWr/OIelweOBG/NafoRZ7i0uzHykLnntdFnuQjn5oDMy8w02gMgluUC4XAC2/LZfmHnwA8gxkV2+oGkQsDMFtcB8EbXKb+28yO+knwUV1oqAaMcs9xRTHHVsSf9hC7f7gUbVGSZgq7b0LIPNU4RzP+XqOE02ddbkZn9M8k89lKjjwmFmIwtobJ8d2lQeomTATlNwKLEjJTySb0HovsjkMLZfYhZ3EHKXi6Q1OgKxCnYM4QRMYVFAu90rvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10753.eurprd04.prod.outlook.com (2603:10a6:150:219::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Mon, 29 Sep
 2025 02:25:21 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 02:25:21 +0000
Date: Mon, 29 Sep 2025 11:37:13 +0800
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
Subject: Re: [PATCH v2 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
Message-ID: <20250929033713.GC29690@nxa18884-linux.ap.freescale.net>
References: <20250922200413.309707-1-shenwei.wang@nxp.com>
 <20250922200413.309707-4-shenwei.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922200413.309707-4-shenwei.wang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:194::22) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB10753:EE_
X-MS-Office365-Filtering-Correlation-Id: dc482aae-94d9-46c9-d5c5-08ddfeff703d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wUYD/zYMEQX/ugsKnQysDrftISBm0TfzPoRG0R/6Yt9So9yTEqgD0Hi/JPXR?=
 =?us-ascii?Q?JbGFwHvJ7C1nDo4YqBsLQpp7lPsVLHqQvxBs+KmcbVb+3RPe0fBabwjW7rXp?=
 =?us-ascii?Q?kKRc88WXWC0qiFrfvGPzgdyV2GOeEg0WDpE5X5dXaMcrcsh13B2lLRcYK5ce?=
 =?us-ascii?Q?ZVRzmh6BxKy8dKTLd0E2dak33cHRMknCZmruQI7+r5Q7G9URQKRN8f16rk9C?=
 =?us-ascii?Q?qS/158W43uB5DgjxqaROMvE0EBEUX/KQR1GDLQbP0pcfD+yTXV3kHFuYmWKx?=
 =?us-ascii?Q?e7AVfvE7bvmfOTsceZrMFuG7GEIp2lVcsjGyCMovL5lytcQQVUsgHAbdz36u?=
 =?us-ascii?Q?CvP+SUQhiOIPPpprp0UkskRTQIVivslG85nAWBzoavv0eugSpEOR1CcPtrPp?=
 =?us-ascii?Q?QOa+jbsB7EQRwVzeyv/GM+pKXAELmYgrQicoY5Q/+rtZaOX062wsfeSm6rRC?=
 =?us-ascii?Q?WZWe5KSyjejKyGUYV1aDa1Zo9wgrYnqMvxLOcOPf8qbm3u0zXqYIDd3RqRLB?=
 =?us-ascii?Q?Q3HeVD/nJmFC28PjB8N31g+5dk7onTcaaqiUXdGDNJ+Ms+nWxYyt8kaWekqs?=
 =?us-ascii?Q?VEj9UCPVqTQeVDuBbdZzmV76EW5UlVIWJYmww8W3MN+tHAokuIosl+bxTyRI?=
 =?us-ascii?Q?9KackoUqra4ngj5igPdBGZlvmHOY83Em/lm1W6EnULlGLs5wMnWoCq3FLmfL?=
 =?us-ascii?Q?hn1ZNYT+Cxz5OPC20A/dKUwo4/COMtcFodb4PKtG5vRuhq3VUw3vpcwHh2/e?=
 =?us-ascii?Q?HQOVd/nuXzA8U+aWuoQ5nwWdWq/RLF1x1FhBa3CIkcixmtsgdY46z3jV1Omq?=
 =?us-ascii?Q?KZr5FB93WnoMsUCjnUhW7zhuIsiGVIOxADXI3GUhbtb5j9PX77bIJebBp1Yg?=
 =?us-ascii?Q?DrHvFVNdblxHF59Zi06MVYkusimYOS52JibV/J5GkrojCRVBcVA+sC5msQ5p?=
 =?us-ascii?Q?jTP8yOO6Jml86fHtE6yXTL6V8abtNyVRWZgSiVCMUOW1S298arWFlYHiAy2Y?=
 =?us-ascii?Q?QmGwCBOIz3vuxMBM4YDEDnYtbLlxNnqoHY0FkrcnQg9pTo3zO5xsKQnkA3GZ?=
 =?us-ascii?Q?wR42onBvg1Gc/l4OeMRl4DHnx2m4fPtQ9cmmeFfaK+5vfwjMUYvk6J5WVVha?=
 =?us-ascii?Q?RME42ekwXVwiZhZOGHxtqo1QN0qa4SuV30cRp/CQz3c5Ly6yc/bM40W0/fQz?=
 =?us-ascii?Q?xLOXGIBoVbDbDeegKR/bNfMY1CDMpdYHY1it4KkZ/zAc9U0J2P/hx+qJcigD?=
 =?us-ascii?Q?E4Uo7HNZreRzlO+NKO/4yS2beZz9z3oJCTMerx+e32ijNK7t/txq7I/iQRqz?=
 =?us-ascii?Q?b+FATXQStwuvj6oQnB79pjjYbJjw47bMBqscwnsXW4I4cCmrkv58uTSZvnzj?=
 =?us-ascii?Q?EtYYKJivnPi/MzR+M2C1MjYyuERRB1a9qaW8ep28Kk7jvG/g8PyHNyl+pn3h?=
 =?us-ascii?Q?ffJRCdpxH1eWjSo70THhIlotafv0n3qvX8CLvr5HML4b1TTh3wNcYOip5V6u?=
 =?us-ascii?Q?Re9td5+gfnS0TY5eizT5PRrubU0ztpaqpYoI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OQ5LttowFul52hh4UEI+oprarTqtQzrfZspRiU2nj7SZnVGtf71bERDFWSZR?=
 =?us-ascii?Q?YU+L2RpCBI3U4chgNO4L+w68kzyW37OhuMZaupErSuAKlJXAS5LbUh4AgvPX?=
 =?us-ascii?Q?EIIk2Os3LCFqNUytGCspY+MqcLB+W2rXvV7P2dMrUeNdThixymV27YG/nZzt?=
 =?us-ascii?Q?3Cc+5mZsbDj7msRnWjpml8wjqidoyJIrjPgWIabJ5h4ZlyUfGOv3JP3pIwHh?=
 =?us-ascii?Q?dUs0V14FzzHgItNauJH8a9dZD+2ZRpenyvj+Jn3tk2qu6Vtlo9mChX7TWxV9?=
 =?us-ascii?Q?ocdlA2bSlTGjPzfZQ4aEq1D1EL2jSIMxUgiX2XL6e/U/dUo4KaVdosU+Q81f?=
 =?us-ascii?Q?F2l7m1EPVW6ljrrABJXEfihzvhdKIwxMbkQe5DWo/WDUdEPpt9+HVIaNmxAZ?=
 =?us-ascii?Q?fMsg+GoG+LMgVeoVyA0ZCTfA7jxOXsxzUv1kr771q0UEtdeassBRq9OTVKVg?=
 =?us-ascii?Q?y80MyB1/0Itfld8oNgdMRdoUu9G6AEmkkhdq6SbzCybFTaFx0l3XXI5bT2Zd?=
 =?us-ascii?Q?qGdzUTM6H0tSNII1b9Hq+wspCO97P7gfqxn/A2dJvZLczQJufcYASSXcpoGI?=
 =?us-ascii?Q?/dAuw7kHNWYusxuprHhXa+PqfcVdAHg6c+ll1UBF6tqJkaLdi0YZA39D+Arq?=
 =?us-ascii?Q?Sf7GjmOSXVGCNg9HOtymRiroAqjE3EIRPLMU8ytMmzk+BossavI6LXg74dRc?=
 =?us-ascii?Q?YWDlHx3UKI5/IAT+ZmoQpcWMXbaRoqlwSqBLT7OT16SeLD488CGurn6kk0G/?=
 =?us-ascii?Q?dv9HYhQ+YPHUBMUso/5ztOJwhfwVnT9KxxQxRlMx1T78z1HKn6+8iXh0C8dN?=
 =?us-ascii?Q?sML13XSuN7aT/4B9TXw0608ODMYVjPRW2ElOxzmWNZGE863JkF1Cda0HNBLN?=
 =?us-ascii?Q?vIBRuRnMyNcBUdmmv5EUoFe30j3D1u1aMhBqwXM3mRD4m91Nd9OUA7prZ3qG?=
 =?us-ascii?Q?KpIN21WDg66R/VREGrj95fKeqlfdr0WCBsHR2aoE6Y7RVhrbWH5yL44T/qin?=
 =?us-ascii?Q?Ok1/Vfaj3SQGpjyN2NrFzRuJzRZ8f5YR2O6DVD+gRtAZt/VR08J/lO+Ornjw?=
 =?us-ascii?Q?a2hsMPeQlaAmVTWVx315YaYw3sd60meYS1RPLPPKbjbyglYh1O9gjM6gK+gb?=
 =?us-ascii?Q?0psbIDrODNReR1jUqj5xylLzA9sKvAeSmzXaUi94PYxOxprUxqtKkX+vUini?=
 =?us-ascii?Q?qJ8OQDtJapXh7Csx03wmmtPcAiLtuJY+2VGTetA6wvelaOiuxfJ7nBPzfKTm?=
 =?us-ascii?Q?pl6opjiQ+VdT9XcOUph5uEtkakglMBGVM1OVkrmszcVW31ucXMPx7KynlW+D?=
 =?us-ascii?Q?FCwEVrJeyJ9HPUshhuaYhqTJU25cjiCShMHjIZwBIvbf+12r0wKT+Zr5ushb?=
 =?us-ascii?Q?+nG+2R1qDj3C8jaY/hnYNOtsE6+A1bBUPMK+VsqRiKrWLyugOyvaGry7dhVZ?=
 =?us-ascii?Q?IE1L0K+D1OzLjapd/BA+8B8SDhSUE+Dj+7Qq4kJyfo3Ut95PGCJpXP5Gujqe?=
 =?us-ascii?Q?N9QT6bgXQylwFl377oiczlncVbhLTItpyIOE6TkHCoIeQs5a3s/WO/Jd4IH+?=
 =?us-ascii?Q?+MsoIFzfgvccY7OH/02m30ax8VEEzAmyp/pQDOKT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc482aae-94d9-46c9-d5c5-08ddfeff703d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 02:25:21.3656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7t1ZxJjK3lIxsesgGgNDkCI1PiApdrAhYUQTWGpIz4Fd31cJRBRr/oBsMn+mHc3UGKk8ba+JYCF/1N8aFUjdBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10753

Hi Shenwei,

On Mon, Sep 22, 2025 at 03:04:12PM -0500, Shenwei Wang wrote:
>On i.MX SoCs, the system may include two processors:
>	- An MCU running an RTOS
>	- An MPU running Linux
>
>These processors communicate via the RPMSG protocol.
>The driver implements the standard GPIO interface, allowing
>the Linux side to control GPIO controllers which reside in
>the remote processor via RPMSG protocol.
>+ */
...
>+
>+#include <linux/err.h>
>+#include <linux/gpio/driver.h>
>+#include <linux/rpmsg/imx_rpmsg.h>
>+#include <linux/init.h>
>+#include <linux/irqdomain.h>
>+#include <linux/of.h>
>+#include <linux/platform_device.h>
>+#include <linux/rpmsg.h>

The included headers should be sorted.

>+
>+#define IMX_RPMSG_GPIO_PER_PORT	32
>+#define RPMSG_TIMEOUT	1000
>+
>+enum gpio_input_trigger_type {
>+	GPIO_RPMSG_TRI_IGNORE,
>+	GPIO_RPMSG_TRI_RISING,
>+	GPIO_RPMSG_TRI_FALLING,
>+	GPIO_RPMSG_TRI_BOTH_EDGE,
>+	GPIO_RPMSG_TRI_LOW_LEVEL,
>+	GPIO_RPMSG_TRI_HIGH_LEVEL,
>+};
>+
>+enum gpio_rpmsg_header_type {
>+	GPIO_RPMSG_SETUP,
>+	GPIO_RPMSG_REPLY,
>+	GPIO_RPMSG_NOTIFY,
>+};
>+
>+enum gpio_rpmsg_header_cmd {
>+	GPIO_RPMSG_INPUT_INIT,
>+	GPIO_RPMSG_OUTPUT_INIT,
>+	GPIO_RPMSG_INPUT_GET,
>+};
>+
>+struct gpio_rpmsg_data {
>+	struct imx_rpmsg_head header;
>+	u8 pin_idx;
>+	u8 port_idx;
>+	union {
>+		u8 event;
>+		u8 retcode;
>+		u8 value;
>+	} out;
>+	union {
>+		u8 wakeup;
>+		u8 value;
>+	} in;
>+} __packed __aligned(8);
>+
>+struct imx_rpmsg_gpio_pin {
>+	u8 irq_shutdown;
>+	u8 irq_unmask;
>+	u8 irq_mask;
>+	u32 irq_wake_enable;
>+	u32 irq_type;
>+	struct gpio_rpmsg_data msg;
>+};
>+
>+struct imx_gpio_rpmsg_info {
>+	struct rpmsg_device *rpdev;
>+	struct gpio_rpmsg_data *notify_msg;
>+	struct gpio_rpmsg_data *reply_msg;
>+	struct completion cmd_complete;
>+	struct mutex lock;
>+	void **port_store;
>+};
>+
>+struct imx_rpmsg_gpio_port {
>+	struct gpio_chip gc;
>+	struct imx_rpmsg_gpio_pin gpio_pins[IMX_RPMSG_GPIO_PER_PORT];
>+	struct imx_gpio_rpmsg_info info;
>+	int idx;
>+};
>+
>+static int gpio_send_message(struct imx_rpmsg_gpio_port *port,
>+			     struct gpio_rpmsg_data *msg,
>+			     bool sync)
>+{
>+	struct imx_gpio_rpmsg_info *info = &port->info;
>+	int err;
>+
>+	if (!info->rpdev) {
>+		dev_dbg(&info->rpdev->dev,
>+			"rpmsg channel not ready, m4 image ready?\n");

"m4 image" -> "remote core" 

>+		return -EINVAL;
>+	}
>+
>+	reinit_completion(&info->cmd_complete);
>+	err = rpmsg_send(info->rpdev->ept, (void *)msg,
>+			 sizeof(struct gpio_rpmsg_data));
>+	if (err) {
>+		dev_err(&info->rpdev->dev, "rpmsg_send failed: %d\n", err);
>+		return err;
>+	}
>+
>+	if (sync) {
>+		err = wait_for_completion_timeout(&info->cmd_complete,
>+						  msecs_to_jiffies(RPMSG_TIMEOUT));
>+		if (!err) {
>+			dev_err(&info->rpdev->dev, "rpmsg_send timeout!\n");
>+			return -ETIMEDOUT;
>+		}
>+
>+		if (info->reply_msg->out.retcode != 0) {
>+			dev_err(&info->rpdev->dev, "rpmsg not ack %d!\n",
>+				info->reply_msg->out.retcode);
>+			return -EINVAL;
>+		}
>+
>+		/* copy the reply message */
>+		memcpy(&port->gpio_pins[info->reply_msg->pin_idx].msg,
>+		       info->reply_msg, sizeof(*info->reply_msg));
>+	}
>+
>+	return 0;
>+}
>+
>+static struct gpio_rpmsg_data *gpio_get_pin_msg(struct imx_rpmsg_gpio_port *port,
>+						unsigned int offset)
>+{
>+	struct gpio_rpmsg_data *msg = &port->gpio_pins[offset].msg;
>+
>+	memset(msg, 0, sizeof(struct gpio_rpmsg_data));
>+
>+	return msg;
>+};
>+
>+static int imx_rpmsg_gpio_get(struct gpio_chip *gc, unsigned int gpio)
>+{
>+	struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
>+	struct gpio_rpmsg_data *msg = NULL;
>+	int ret;
>+
>+	guard(mutex)(&port->info.lock);
>+
>+	msg = gpio_get_pin_msg(port, gpio);
>+	msg->header.cate = IMX_RPMSG_GPIO;
>+	msg->header.major = IMX_RMPSG_MAJOR;
>+	msg->header.minor = IMX_RMPSG_MINOR;
>+	msg->header.type = GPIO_RPMSG_SETUP;
>+	msg->header.cmd = GPIO_RPMSG_INPUT_GET;
>+	msg->pin_idx = gpio;
>+	msg->port_idx = port->idx;
>+
>+	ret = gpio_send_message(port, msg, true);
>+	if (!ret)
>+		ret = !!port->gpio_pins[gpio].msg.in.value;
>+
>+	return ret;
>+}
>+
>+static int imx_rpmsg_gpio_direction_input(struct gpio_chip *gc,
>+					  unsigned int gpio)
>+{
>+	struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
>+	struct gpio_rpmsg_data *msg = NULL;
>+
>+	guard(mutex)(&port->info.lock);
>+
>+	msg = gpio_get_pin_msg(port, gpio);
>+	msg->header.cate = IMX_RPMSG_GPIO;
>+	msg->header.major = IMX_RMPSG_MAJOR;
>+	msg->header.minor = IMX_RMPSG_MINOR;
>+	msg->header.type = GPIO_RPMSG_SETUP;
>+	msg->header.cmd = GPIO_RPMSG_INPUT_INIT;
>+	msg->pin_idx = gpio;
>+	msg->port_idx = port->idx;
>+
>+	msg->out.event = GPIO_RPMSG_TRI_IGNORE;
>+	msg->in.wakeup = 0;
>+
>+	return gpio_send_message(port, msg, true);
>+}
>+
>+static inline void imx_rpmsg_gpio_direction_output_init(struct gpio_chip *gc,
>+		unsigned int gpio, int val, struct gpio_rpmsg_data *msg)
>+{
>+	struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
>+
>+	msg->header.cate = IMX_RPMSG_GPIO;
>+	msg->header.major = IMX_RMPSG_MAJOR;
>+	msg->header.minor = IMX_RMPSG_MINOR;
>+	msg->header.type = GPIO_RPMSG_SETUP;
>+	msg->header.cmd = GPIO_RPMSG_OUTPUT_INIT;
>+	msg->pin_idx = gpio;
>+	msg->port_idx = port->idx;
>+	msg->out.value = val;
>+}
>+
>+static int imx_rpmsg_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>+{
>+	struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
>+	struct gpio_rpmsg_data *msg = NULL;
>+
>+	guard(mutex)(&port->info.lock);
>+
>+	msg = gpio_get_pin_msg(port, gpio);
>+	imx_rpmsg_gpio_direction_output_init(gc, gpio, val, msg);
>+
>+	return gpio_send_message(port, msg, true);
>+}
>+
>+static int imx_rpmsg_gpio_direction_output(struct gpio_chip *gc,
>+					unsigned int gpio, int val)
>+{
>+	struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
>+	struct gpio_rpmsg_data *msg = NULL;
>+
>+	guard(mutex)(&port->info.lock);
>+
>+	msg = gpio_get_pin_msg(port, gpio);
>+	imx_rpmsg_gpio_direction_output_init(gc, gpio, val, msg);
>+
>+	return gpio_send_message(port, msg, true);
>+}
>+
>+static int imx_rpmsg_irq_set_type(struct irq_data *d, u32 type)
>+{
>+	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
>+	u32 gpio_idx = d->hwirq;
>+	int edge = 0;
>+	int ret = 0;
>+
>+	switch (type) {
>+	case IRQ_TYPE_EDGE_RISING:
>+		edge = GPIO_RPMSG_TRI_RISING;
>+		break;
>+	case IRQ_TYPE_EDGE_FALLING:
>+		edge = GPIO_RPMSG_TRI_FALLING;
>+		break;
>+	case IRQ_TYPE_EDGE_BOTH:
>+		edge = GPIO_RPMSG_TRI_BOTH_EDGE;
>+		break;
>+	case IRQ_TYPE_LEVEL_LOW:
>+		edge = GPIO_RPMSG_TRI_LOW_LEVEL;
>+		break;
>+	case IRQ_TYPE_LEVEL_HIGH:
>+		edge = GPIO_RPMSG_TRI_HIGH_LEVEL;
>+		break;
>+	default:
>+		ret = -EINVAL;
>+		break;
>+	}
>+
>+	port->gpio_pins[gpio_idx].irq_type = edge;
>+
>+	return ret;
>+}
>+
>+static int imx_rpmsg_irq_set_wake(struct irq_data *d, u32 enable)
>+{
>+	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
>+	u32 gpio_idx = d->hwirq;
>+
>+	port->gpio_pins[gpio_idx].irq_wake_enable = enable;
>+
>+	return 0;
>+}
>+
>+/*
>+ * This function will be called at:
>+ *  - one interrupt setup.
>+ *  - the end of one interrupt happened
>+ * The gpio over rpmsg driver will not write the real register, so save
>+ * all infos before this function and then send all infos to M core in this
>+ * step.
>+ */
>+static void imx_rpmsg_unmask_irq(struct irq_data *d)
>+{
>+	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
>+	u32 gpio_idx = d->hwirq;
>+
>+	port->gpio_pins[gpio_idx].irq_unmask = 1;
>+}
>+
>+static void imx_rpmsg_mask_irq(struct irq_data *d)
>+{
>+	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
>+	u32 gpio_idx = d->hwirq;
>+	/*
>+	 * No need to implement the callback at A core side.
>+	 * M core will mask interrupt after a interrupt occurred, and then
>+	 * sends a notify to A core.
>+	 * After A core dealt with the notify, A core will send a rpmsg to
>+	 * M core to unmask this interrupt again.
>+	 */
>+	port->gpio_pins[gpio_idx].irq_mask = 1;
>+}
>+
>+static void imx_rpmsg_irq_shutdown(struct irq_data *d)
>+{
>+	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
>+	u32 gpio_idx = d->hwirq;
>+
>+	port->gpio_pins[gpio_idx].irq_shutdown = 1;
>+}
>+
>+static void imx_rpmsg_irq_bus_lock(struct irq_data *d)
>+{
>+	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
>+
>+	mutex_lock(&port->info.lock);
>+}
>+
>+static void imx_rpmsg_irq_bus_sync_unlock(struct irq_data *d)
>+{
>+	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
>+	struct gpio_rpmsg_data *msg = NULL;
>+	u32 gpio_idx = d->hwirq;
>+
>+	if (port == NULL) {
>+		mutex_unlock(&port->info.lock);
>+		return;
>+	}
>+
>+	/*
>+	 * For mask irq, do nothing here.
>+	 * M core will mask interrupt after a interrupt occurred, and then
>+	 * sends a notify to A core.
>+	 * After A core dealt with the notify, A core will send a rpmsg to
>+	 * M core to unmask this interrupt again.
>+	 */
>+
>+	if (port->gpio_pins[gpio_idx].irq_mask && !port->gpio_pins[gpio_idx].irq_unmask) {
>+		port->gpio_pins[gpio_idx].irq_mask = 0;
>+		mutex_unlock(&port->info.lock);
>+		return;
>+	}
>+
>+	msg = gpio_get_pin_msg(port, gpio_idx);
>+	msg->header.cate = IMX_RPMSG_GPIO;
>+	msg->header.major = IMX_RMPSG_MAJOR;
>+	msg->header.minor = IMX_RMPSG_MINOR;
>+	msg->header.type = GPIO_RPMSG_SETUP;
>+	msg->header.cmd = GPIO_RPMSG_INPUT_INIT;
>+	msg->pin_idx = gpio_idx;
>+	msg->port_idx = port->idx;
>+
>+	if (port->gpio_pins[gpio_idx].irq_shutdown) {
>+		msg->out.event = GPIO_RPMSG_TRI_IGNORE;
>+		msg->in.wakeup = 0;
>+		port->gpio_pins[gpio_idx].irq_shutdown = 0;
>+	} else {
>+		 /* if not set irq type, then use low level as trigger type */
>+		msg->out.event = port->gpio_pins[gpio_idx].irq_type;
>+		if (!msg->out.event)
>+			msg->out.event = GPIO_RPMSG_TRI_LOW_LEVEL;
>+		if (port->gpio_pins[gpio_idx].irq_unmask) {
>+			msg->in.wakeup = 0;
>+			port->gpio_pins[gpio_idx].irq_unmask = 0;
>+		} else /* irq set wake */
>+			msg->in.wakeup = port->gpio_pins[gpio_idx].irq_wake_enable;
>+	}
>+
>+	gpio_send_message(port, msg, false);
>+	mutex_unlock(&port->info.lock);
>+}
>+
>+static const struct irq_chip imx_rpmsg_irq_chip = {
>+	.irq_mask = imx_rpmsg_mask_irq,
>+	.irq_unmask = imx_rpmsg_unmask_irq,
>+	.irq_set_wake = imx_rpmsg_irq_set_wake,
>+	.irq_set_type = imx_rpmsg_irq_set_type,
>+	.irq_shutdown = imx_rpmsg_irq_shutdown,
>+	.irq_bus_lock = imx_rpmsg_irq_bus_lock,
>+	.irq_bus_sync_unlock = imx_rpmsg_irq_bus_sync_unlock,
>+	.flags = IRQCHIP_IMMUTABLE,
>+};
>+
>+static int imx_rpmsg_gpio_callback(struct rpmsg_device *rpdev,
>+	void *data, int len, void *priv, u32 src)
>+{
>+	struct gpio_rpmsg_data *msg = (struct gpio_rpmsg_data *)data;
>+	struct imx_rpmsg_gpio_port *port = NULL;
>+	struct imx_rpmsg_driver_data *drvdata;
>+	unsigned long flags;
>+
>+	drvdata = dev_get_drvdata(&rpdev->dev);
>+	if (msg)
>+		port = drvdata->channel_devices[msg->port_idx];
>+
>+	if (!port)
>+		return -ENODEV;
>+
>+	if (msg->header.type == GPIO_RPMSG_REPLY) {
>+		port->info.reply_msg = msg;
>+		complete(&port->info.cmd_complete);
>+	} else if (msg->header.type == GPIO_RPMSG_NOTIFY) {
>+		port->info.notify_msg = msg;
>+		local_irq_save(flags);

Would you explain a bit on why need to disable IRQ on current core.

>+		generic_handle_domain_irq(port->gc.irq.domain, msg->pin_idx);
>+		local_irq_restore(flags);
>+	} else
>+		dev_err(&rpdev->dev, "wrong command type!\n");
>+
>+	return 0;
>+}
>+
>+static void imx_rpmsg_gpio_remove_action(void *data)
>+{
>+	struct imx_rpmsg_gpio_port *port = data;
>+
>+	port->info.port_store[port->idx] = 0;
>+}
>+
>+static int imx_rpmsg_gpio_probe(struct platform_device *pdev)
>+{
>+	struct imx_rpmsg_driver_data *pltdata = pdev->dev.platform_data;
>+	struct device_node *np = pdev->dev.of_node;
>+	struct imx_rpmsg_gpio_port *port;
>+	struct gpio_irq_chip *girq;
>+	struct gpio_chip *gc;
>+	int ret;
>+
>+	if (!pltdata)
>+		return -EPROBE_DEFER;
>+
>+	port = devm_kzalloc(&pdev->dev, sizeof(*port), GFP_KERNEL);
>+	if (!port)
>+		return -ENOMEM;
>+
>+	ret = of_property_read_u32(np, "reg", &port->idx);

"device_property_read_u32" should be better.

>+	if (ret)
>+		return ret;
>+
>+	if (port->idx > MAX_DEV_PER_CHANNEL)
>+		return -EINVAL;
>+
>+	mutex_init(&port->info.lock);
>+	init_completion(&port->info.cmd_complete);
>+	port->info.rpdev = pltdata->rpdev;
>+	port->info.port_store = pltdata->channel_devices;
>+	port->info.port_store[port->idx] = port;
>+	if (!pltdata->rx_callback)
>+		pltdata->rx_callback = imx_rpmsg_gpio_callback;
>+
>+	gc = &port->gc;
>+	gc->owner = THIS_MODULE;
>+	gc->parent = &pltdata->rpdev->dev;
>+	gc->label = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-gpio%d",
>+				   pltdata->rproc_name, port->idx);
>+	gc->ngpio = IMX_RPMSG_GPIO_PER_PORT;
>+	gc->base = -1;
>+
>+	gc->direction_input = imx_rpmsg_gpio_direction_input;
>+	gc->direction_output = imx_rpmsg_gpio_direction_output;
>+	gc->get = imx_rpmsg_gpio_get;
>+	gc->set = imx_rpmsg_gpio_set;
>+
>+	platform_set_drvdata(pdev, port);
>+	girq = &gc->irq;
>+	gpio_irq_chip_set_chip(girq, &imx_rpmsg_irq_chip);
>+	girq->parent_handler = NULL;
>+	girq->num_parents = 0;
>+	girq->parents = NULL;
>+	girq->chip->name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-gpio%d",
>+				 pltdata->rproc_name, port->idx);

Align pltdata->rproc_name with the upper line '('.

>+
>+	devm_add_action_or_reset(&pdev->dev, imx_rpmsg_gpio_remove_action, port);

return value should be checked.

>+
>+	return devm_gpiochip_add_data(&pdev->dev, gc, port);
>+}
>+

Thanks,
Peng
