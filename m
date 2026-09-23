Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011035.outbound.protection.outlook.com [52.101.65.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BDD4F93A4;
	Wed, 23 Sep 2026 18:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790189000; cv=fail; b=aaSDTEJjQfhVUfaSCwJ+o//qrseSMyXv3y0aGtH7KPxsWPx+Vyuk0Tspf3wMBrCVzEQNo6YN9w+V7Ma2IjaELgQxYzPG7+1XO1A70vqPgI43Bsl6rHHk5oOBUVB6TCRDldlIj4zaHViujO+Bhw4XSQfjLLZVnr0+xhz4pq9Pk9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790189000; c=relaxed/simple;
	bh=5T4X3XjUQNfO6llP2yIL8XtX63dLX+4AAKV+bmJVAc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A1CfCHvOas15Cw3O0X0kZfA5t4f/aUq3nASA5r0NmHCf9bkYqUqDZuHLxaZ9xYcoTm9Ej3+F/w2XYpTrABbC7w5yV25QigFRaxe/CzFX/boNNnjQtGr8SXDfhfFLnr3Sc76eE/baWqIleiqw9jq2686MAy2/IWpX+KhL2Z/gL9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=snFMSetQ; arc=fail smtp.client-ip=52.101.65.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="snFMSetQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GYGxui3ql2ihfmxN6+8wJrr+GHBusS0YNp7G/Qlrpf1rtVsBBwqrmgrdFl/aD4Lu8yuO/RiDLqnDoNTjuNmUBdwCSWHSGNb3xjD+Oo3GYy0m3Yz6ytDit18krQW6Tv4lTiqYU9Rnz1lhslRcX6ztv3DJT91fqeiIDK4VJqvcmfkB2Gsx504GU1Cfz8QqYm97h2E8HsNEzV3ClPP1dRH/34Yh8yTXGnkuHQ8ThM0raNST2WgNU/zI1obWMLdUhNhFeXroAdil3Vk5v9x23thncebb3K8NmG7mVt7TjKaAg7ltixgfibjSUOeiCcpH9i2h7kVSuBLXqCHoWa3n3B2mZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1p8capPolRuCNktzj/mo4Pt1tL7iG/2JVUU8TctD/zA=;
 b=WiMqh+AYu+kE1G22IaHWwG3y9U7ArNsMGNfAsk0mFbJtn8Ippnq4om/89DeXLdXyIhtlkKQ5OttzYgqyyCDjPanqv433OH4e5sGUBoZWM1gWI6AqGcHT7JFGyW4MktKxnRWOrirtxgR5O4gTtLsD8rfQYOxME+zBOwMnH+9aGLE5CJi5/av+vZeVeUCS9+Swnm0HGG4kTDLi9phoIzcpJmjg/NjyNoRQB4XjDCg/K0rkNGGnyBS+6Sv5OgpzrLXJ4GaTsqfS2xORPZgZOmqvrKg9vK/kHUx6GtCDwqQKftN04kczrQQQvRlzh/isAGtZm/GBWOc+sbblnNcHHabeFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1p8capPolRuCNktzj/mo4Pt1tL7iG/2JVUU8TctD/zA=;
 b=snFMSetQSqQXktS+Uepgb+vOCTFQROSDnlm+2shBp7D3XkJAbz9qzMVM+3aGj47Ne/OPBp5ZUpTGDMZidJIzLo1SRzLJybVgvKLxC1oKnZS2eT+BI6NZ/ijZdEei4VYia7P7bi1U/r7H5mAEHzcFHD379UNb0YthjcOqtx17S6aTu6jgFzN5Zo63T0+JXdE47RGlNwEOIhGU3T6ecAePbw1EKPK84oR+iJCYYFVLwXMgnAozEMIJt/fvoHlMEV6ZtpgXPsWyDJjEiVjl4wq6a72HpsHu8Sw0S9Njm5UVU47KAxBZOW2i4ubmPtiaIg94Y2JWe/al12MP/bn6DkBXOg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com (2603:10a6:800:12c::22)
 by AM8PR04MB7298.eurprd04.prod.outlook.com (2603:10a6:20b:1df::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 18:43:16 +0000
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4]) by VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 18:43:16 +0000
From: Shenwei Wang <shenwei.wang@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	b-padhi@ti.com,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v16 1/5] docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
Date: Wed, 23 Sep 2026 13:42:28 -0500
Message-ID: <20260923184255.299034-2-shenwei.wang@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
References: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0114.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::8) To VI1PR04MB7135.eurprd04.prod.outlook.com
 (2603:10a6:800:12c::22)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7135:EE_|AM8PR04MB7298:EE_
X-MS-Office365-Filtering-Correlation-Id: cd946cc3-0334-46b8-6e53-08df19a28807
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|19092799006|7416014|376014|1800799024|921020|6133799003|3023799007|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3G+LbWeGwFnjddCpVxX8JY1GBLpT20MWJHtx5oXOKrVyPuCnmvP0xVJoo8ftTya2lQ93kkq9wlBQNmeazzT7YQofBTv8FEGKpNulmrrMMA0mm0M2vygWS2j5bRBEQDf+ep82cOoSP8Chf3qq8zacMG/YtnAJ0lMxvH9ngT4oL18KECBrMM2Sq8vxqYFKKKY5ECmAYU4tv63qvLl7VwxbcRu4V16N2y2x8+/FY/rHjJ4xnhL398YQ8pM4Fb2jckRGIhGJwYtLq5rroJx6MwyOkouB51dkUPO/W69FraiebgY4FAkix2frumoSe6MlyK5hOCpbR4DiEWx4vfvpPWbQ/FkE+eMNEml9tIMyFDDmfsYV/qePt027nVJ0HaROBD8TuC9xai19U7D7zNavinkdPhdyLfIF2lpfTTmCR6zBasc/T5s0hyElu0f1+6xuimdz77JV956q1EAwOkD1pe/+N80GgJj3ulY62DBhyBpw4HAarICbvahO8dXbisZ4EnOJMGqiMhQBb6YvyqamqSaAaaWEBmDi9w6NZRZl8e0N7pqKVEwFhfzgjarNu4wHDB8wepW2xAOvCyzNylEwmq+nu9L640JyxYzzyNd9xhfFRxC7BE4wBICkCzC6CB8g39JXKqu5tUKl88tg1NnY59xR1umYGFm7RfrI2jQ2PnHl0tvGVEV/mx5xCWgMCX+Bx6xLSTChOOenVNeL2gjxe6OCew==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7135.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(7416014)(376014)(1800799024)(921020)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PUdAxW+LRucG4yEVM7fNETVtvNU5r0x9ZkhDLWbilYStwngSJELmbLmypGz+?=
 =?us-ascii?Q?anvqcGDRdH+2cF3cQii08dLYJLpZ8PxhzGIwvt3a0+leQyhVC46j0MRbom7Z?=
 =?us-ascii?Q?jgqhE8kba58b9lTtNuB2Sh+dpCL7bEKQdCnsYSFxcRttuE9Ajhg39k/BgavB?=
 =?us-ascii?Q?PK3w3PUF6+j4lGy7la3hWY+QHMBbYJRPHCAsi9JyB46SyJ9srdZxosYjr1OV?=
 =?us-ascii?Q?HCas8GdsKyXq0Zi7Kz9aw04Rx3nnaqeYGUmqyzgJz47fbiKrPqnQFdhyoOkV?=
 =?us-ascii?Q?+MaTo7ieg73e2Lq7XIcTQYMP3QS1FLI2/ndo0+Qf+VsVa7XHl7VTM8p75gwd?=
 =?us-ascii?Q?GHGouefI8JtCCP+Dgd2mxAS4b4lXXOOjMfiNwUT2zkvuwmWk/pyupGnqU7/B?=
 =?us-ascii?Q?T4+vW/KpXFBgtcW31czvMYJJyUOj4+6DKu8goDa+901kD/CoxwkDAlaZvuya?=
 =?us-ascii?Q?NrNkRFd3H7ycMxlwJxoS6q4wVQk//rmUKUKV5LL13bwdinPN4h7T+oyori7x?=
 =?us-ascii?Q?0z+RKMlwRs2c3PiyqfjnIu/HPc3/BfoBJ53T5EpgOrRd7+ImG9APNYXtz/Hv?=
 =?us-ascii?Q?XlWeSx25q0By565JvUinbeJ0hlCvsiWUKtSEZjnDijJLyzNepmOIY/OgqVpm?=
 =?us-ascii?Q?cTIqwKHZrWQl3gUmJSbGijunyB2M1AOo/YSrBmAQ7ZBj5Z5adxM8CfFKLAos?=
 =?us-ascii?Q?ngIld2NYWqd2tPHXl56cXTBN/G0VBdudUVSanRPxqWJc2NHt2TARQMC5Hm3M?=
 =?us-ascii?Q?UMwPdC6w85/KfgBOiALI2FgkF87nmnxK3TdCeR8bMiZgRR8ePLWuQhsSSTzi?=
 =?us-ascii?Q?busQlmz88c473mTrblvMySKtXhKKsaSO1KgSv43QeKrItHTtv8dErSzcMpDR?=
 =?us-ascii?Q?M9jIKx+LAAKuSOBA7y/4+F3nmjmwJBBdd8ZWuZDD2NRrD4U+XE2B8if6+xhn?=
 =?us-ascii?Q?Qx9HI3P3NaDkA2KUn19T6AwcwkK+TPKNtAykaZnGtctwLzPa+XF0xrn3Jlun?=
 =?us-ascii?Q?w5/2wjk14XurCKvA5pwZEdgBjbkgy1N2S74atm6nHk8i6AZGe5gOX7CzCnuw?=
 =?us-ascii?Q?C/N5yQUwVDVKElGv2KvLtW8XDmQXDF20KlBRzZgbBUNjnKP013vQ4V7rjCpm?=
 =?us-ascii?Q?XzQh+NaZUXBmKMgjAJUOlyPwMw2D1xSKRUpEIvK4NtjS9AiXLOIuDjJlYwWr?=
 =?us-ascii?Q?Sm0Ksoo+fPh7S3NxohWCA39EVHEaEiHqfgrl7tBtKF7pJKy1odzZ3vxFiZyg?=
 =?us-ascii?Q?v6YHqTsgvkg1o+DnhPxaHcssMfojeAP57cAqNGzNpNK9DH6JDFaqPyipREbt?=
 =?us-ascii?Q?gP6UD/LsHzvH+7gZEkawff0Z+Io7ZMmgROMJ9Rl9xVCwPLqVpMG9jiGg2Ith?=
 =?us-ascii?Q?MDzAhrlcO6cVGOP+jy5+FOTx0tP5L8/r/41kyt+6JHwX18VDTu2q3BKbJfgC?=
 =?us-ascii?Q?ZTDZ+HNiy/x6uODhGHTMPJp+S4sVBawOOnTLa03El5W9NStJsI35zNWzk50K?=
 =?us-ascii?Q?2zX75fuO2d/qfEkSkoHYV8GrfXuJrmy9YjBLpGonpvGkpQFgX6TrhFb70ReZ?=
 =?us-ascii?Q?ZOBKvEqHllriYiJ3x9hX20yc2s9msa0jkpHqWYyX+a/yHI/FDNpe9raIDIri?=
 =?us-ascii?Q?dLP+tyiPpkJR+5+wQpfh6vtzdnmbins8/IGDzjtItcgNjRBK33NE2Oi5idrq?=
 =?us-ascii?Q?CTz8dhIb/AHaCGbvzQDD7KdDq67vAl4+va+cuDiADOmmuJ6+ufxdgGgUjXlT?=
 =?us-ascii?Q?S7Um+uO2QyzfLn1A1wK9xn97MmBNx1gxrTzdUlgZcesCzxpkhrei?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd946cc3-0334-46b8-6e53-08df19a28807
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 18:43:16.8617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r0hQi2v1wjktangxIHnaJ9oN3Iz/sNWBURWmJS5xt629MdRBEEKoJg7Z42Bi4/RHCJJNg6NdeBUNssEuTncTKvrVgHYqJ3jeojUlqnX9IJKb+Lvi1MxUisxPRk8ZfUZg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7298

From: Shenwei Wang <shenwei.wang@nxp.com>

Describes the gpio rpmsg transport protocol over the rpmsg bus between
the remote system and Linux.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 Documentation/driver-api/gpio/gpio-rpmsg.rst | 242 +++++++++++++++++++
 Documentation/driver-api/gpio/index.rst      |   1 +
 2 files changed, 243 insertions(+)
 create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst

diff --git a/Documentation/driver-api/gpio/gpio-rpmsg.rst b/Documentation/driver-api/gpio/gpio-rpmsg.rst
new file mode 100644
index 000000000000..9af75cc759ba
--- /dev/null
+++ b/Documentation/driver-api/gpio/gpio-rpmsg.rst
@@ -0,0 +1,242 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+GPIO RPMSG (Remote Processor Messaging) Protocol
+================================================
+
+The GPIO RPMSG transport protocol is used for communication and interaction
+with GPIO controllers on remote processors via the RPMSG bus.
+
+Message Format
+--------------
+
+The out message to the remote consists of a 8-byte packet with the
+following layout:
+
+.. code-block:: none
+
+   +------+------+------+------+------+------+------+------+
+   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
+   |     cmd     |    line     |           value           |
+   +------+------+------+------+------+------+------+------+
+
+- **cmd**: Little endian. Command type.
+
+- **line**: Little endian. The GPIO line (pin) index.
+
+- **value**: Little endian. See details in the command description below.
+
+
+The in message from the remote has the following layout:
+
+.. code-block:: none
+
+   +------+--------+--------+
+   | 0x00 |  0x01  |  0x02  |
+   | type |     payload     |
+   +------+--------+--------+
+
+- **type**: Message types.
+  - 0: Command reply messages.
+  - 1: Interrupt messages.
+
+- **payload**: See details below.
+
+GPIO Commands
+-------------
+
+Commands are specified in the **Cmd** field.
+
+The SEND message is always sent from Linux to the remote firmware. Each
+SEND corresponds to a single REPLY message. The GPIO driver should
+serialize messages and determine whether a REPLY message is required. If a
+REPLY message is expected but not received within the specified timeout
+period (currently 1 second in the Linux driver), the driver should return
+-ETIMEDOUT.
+
+GET_DIRECTION (Cmd=2)
+~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +------+------+------+------+------+------+------+------+
+   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
+   |      2      |    line     |             0             |
+   +------+------+------+------+------+------+------+------+
+
+**Reply:**
+
+.. code-block:: none
+
+   +------+--------+--------+
+   | 0x00 |  0x01  |  0x02  |
+   |   0  | status | value  |
+   +------+--------+--------+
+
+- **status**:
+
+  - 0: Ok
+  - 1: Error
+
+- **value**: Direction.
+
+  - 0: None
+  - 1: Output
+  - 2: Input
+
+
+SET_DIRECTION (Cmd=3)
+~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +------+------+------+------+------+------+------+------+
+   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
+   |      3      |    line     |           value           |
+   +------+------+------+------+------+------+------+------+
+
+- **value**: Direction.
+
+  - 0: None
+  - 1: Output
+  - 2: Input
+
+**Reply:**
+
+.. code-block:: none
+
+   +------+--------+--------+
+   | 0x00 |  0x01  |  0x02  |
+   |   0  | status |    0   |
+   +------+--------+--------+
+
+- **status**:
+
+  - 0: Ok
+  - 1: Error
+
+
+GET_VALUE (Cmd=4)
+~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +------+------+------+------+------+------+------+------+
+   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
+   |      4      |    line     |             0             |
+   +------+------+------+------+------+------+------+------+
+
+**Reply:**
+
+.. code-block:: none
+
+   +------+--------+--------+
+   | 0x00 |  0x01  |  0x02  |
+   |   0  | status | value  |
+   +------+--------+--------+
+
+- **status**:
+
+  - 0: Ok
+  - 1: Error
+
+- **value**: Level.
+
+  - 0: Low
+  - 1: High
+
+
+SET_VALUE (Cmd=5)
+~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +------+------+------+------+------+------+------+------+
+   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
+   |      5      |    line     |           value           |
+   +------+------+------+------+------+------+------+------+
+
+- **value**: Output level.
+
+  - 0: Low
+  - 1: High
+
+**Reply:**
+
+.. code-block:: none
+
+   +------+--------+--------+
+   | 0x00 |  0x01  |  0x02  |
+   |   0  | status |    0   |
+   +------+--------+--------+
+
+- **status**:
+
+  - 0: Ok
+  - 1: Error
+
+
+SET_IRQ_TYPE (Cmd=6)
+~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +------+------+------+------+------+------+------+------+
+   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
+   |      6      |    line     |           value           |
+   +------+------+------+------+------+------+------+------+
+
+- **value**: IRQ types.
+
+  - 0: Interrupt disabled
+  - 1: Rising edge trigger
+  - 2: Falling edge trigger
+  - 3: Both edge trigger
+  - 4: High level trigger
+  - 8: Low level trigger
+
+**Reply:**
+
+.. code-block:: none
+
+   +------+--------+--------+
+   | 0x00 |  0x01  |  0x02  |
+   |   0  | status |    0   |
+   +------+--------+--------+
+
+- **status**:
+
+  - 0: Ok
+  - 1: Error
+
+
+Interrupt Messages
+------------------
+
+Interrupt messages are sent by the remote core and they have
+**Type=1 (GPIO_RPMSG_NOTIFY)**:
+
+When a GPIO line asserts an interrupt on the remote processor, the firmware
+should immediately mask the corresponding interrupt source and send a
+notification message to the Linux. Upon completion of the interrupt
+handling on the Linux side, the driver should issue a
+command **SET_IRQ_TYPE** to the firmware to unmask the interrupt.
+
+.. code-block:: none
+
+   +------+------+--------+
+   | 0x00 | 0x01 |  0x02  |
+   |   1  |     line      |
+   +------+------+--------+
+
+- **line**: Little endian. The GPIO line (pin) index.
+
diff --git a/Documentation/driver-api/gpio/index.rst b/Documentation/driver-api/gpio/index.rst
index bee58f709b9a..e5eb1f82f01f 100644
--- a/Documentation/driver-api/gpio/index.rst
+++ b/Documentation/driver-api/gpio/index.rst
@@ -16,6 +16,7 @@ Contents:
    drivers-on-gpio
    bt8xxgpio
    pca953x
+   gpio-rpmsg
 
 Core
 ====
-- 
2.43.0

