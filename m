Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2100.outbound.protection.partner.outlook.cn [139.219.17.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94234D531;
	Fri, 24 Apr 2026 04:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777006429; cv=fail; b=dP2MaUxBN3y9T1+TpEOl3uJQ3Iv9tCnGLoIHvmdDw7+Fizf2+xJgdjWG0ZpgI87o5OJebe18eexfpxZMtcWk14tgEJV3v93uqudunJ/5qhJ08bPoyU4U9TF3chaXIY40O00EJQkZuYW6AQ3yoQlU5dnC0/y+frcI+ya5Va8y3zE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777006429; c=relaxed/simple;
	bh=C++9BFbILSdS4m1XG1HFJmLLgUWjXTqtAhaCNmECAPU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ivkauGoi40Dgi22hW5PnLSmEq7Wmm0eCDjufhVCsMHKpPjhm77D1UtrI9q5QyWdF9kWGDn+7P2OMOFcbp8q68Sp8iMkdhdRPUTUr5fQEbjcRVjpWgipy+lhoDDHratVa1kPmBWduG3tbfK7vDXzlX4MNsp0AFzVM1TAYDVN1PDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jixvBSqhdBESKYaYByPtR3DsOxl5HWS0MwDW6i9vt4yXKJhV33iwyKEy1RMbi2FFfpt5mRJTecLOWKyXazZ1DaBzjWZLiplCtzjdgiQieg5uxthsez0lTt6JVkWhqDTUjk6OrNZK/31jikRaP/Qv8R2c0UHDbl8XjU6dn2ImMXOzCoc1qGzvMB+JUGBFSXHFjwcE5zrF9JZCN/BOIDmf1MSV+WP2e3irFek7GeKyq+fF1E+NBPtOs9+VF6bwLFe18njAlvWtNeKigkRXZjWhrmwCY+IBxABBnYbYyqH5BUZKmx27QHBOtNNvamcjdeB8xrPNQ8dZ1m/PxtdqDplFpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b0KR6ZEwGloTK2eVPMWfSHBgsLQNx+STCgYgMhUYS+E=;
 b=Jz/Ni8JI2pZNw4YhAhC+h5Wfe9cD/4vVoY+xzH+bSRp7RgY5dTv9f0VS1lpM/8iXNBL772ocCudv9gclRb+Tj0RqMNnMK0z72WGjDalZjuHrulgNJBUDjHeoRlDme8y8xW4TTJS4l0hLMPTIqV+/w3eXGVm5/3xuI7zxfnqoYORp9mbA6QmqJ2gCBbj5UGmP9FSv++vqqdhMgA6eYnuWOumLCbnv1916U7VVrxbQZLX2F7N2JYw34HZGMy4BlBviU4zfr27Jv4St8NXQTjhMFXMJ/PwoZEyEzzS57oOH+KMrMhids6OaIecFOvqsqTfH+7oewpoDqne5WQdXjqeR7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10) by NTZPR01MB0970.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 03:20:35 +0000
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 ([fe80::d8e2:3f39:6ae7:bdf2]) by
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn ([fe80::d8e2:3f39:6ae7:bdf2%6])
 with mapi id 15.20.9846.021; Fri, 24 Apr 2026 03:20:35 +0000
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Xingyu Wu <xingyu.wu@starfivetech.com>,
	Mason Huo <mason.huo@starfivetech.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v1 0/2] Add hwspinlock driver for StarFive JHB100 SoC
Date: Fri, 24 Apr 2026 11:20:24 +0800
Message-Id: <20260424032026.62301-1-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJSPR01CA0010.CHNPR01.prod.partner.outlook.cn
 (10.43.34.150) To NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn (10.2.8.138)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NTZPR01MB0956:EE_|NTZPR01MB0970:EE_
X-MS-Office365-Filtering-Correlation-Id: c42b1ddc-5b85-49c5-e585-08dea1b072f4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|18002099003|38350700014|56012099003;
X-Microsoft-Antispam-Message-Info:
	RtVqeb2RKuN6Pj/e0pKUBae3s7yYBUjusocFokNgkNmPZ3/g/vTla+xjOI8K4JpB/LTxEj0EBCFvmy6+FxPU1Eq0YztEDeORVxLKR7b25hfhHJ7lX5pIAdh8jiO3oRU6kl6Okg4hQImV2lTMKVS0pT2XNyqWz1bZK3FgXNsppIrfJ+XQGoCdKpI3tM444hJrvDjRJ3uQ1jg7a6boXwm/y31pCBrWrMDk+9vLe0WZ53vQHJ/o2p376JPE1C5C+pVs9fwvTOlM2TMFq7tcSA/t0s+II3RB0hUZR88lTymljhYA8YdbbfoO6pfKSCc6gsSIoC0LP+LbcMiqPefxoTPYq7NMxjCsLxP1Jj16iDtQstYWvL4Lr/IZF6tjmPUHEppMdNHHGGrklXXisCq5AOMJQmyWdc7VFnDySaJJCM/5QwxkOCyxq9Tuc8L/iQSBgUM/2MWKmT3gWpyHaEQjvGdQFkVHsxwVWZhDSBN+m9/BdEI86N038FiwHuZNPo18QgSYVfQmFL3dNNIBZ3SiWnLWeQ6id13bz47iG+E9xMoFoytRwcq5pd5irSINuNx2bQZEHSeGiW0dJZGyfa0iYK+VZ1d5U2PH/V6nq3e2B754hho=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(18002099003)(38350700014)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vXuGsM874JlXcQ/dpjaThbqE4/SUrcVC8BukyNSf02YzxmDXG1+IQNHkII8S?=
 =?us-ascii?Q?32AHeCYksisC1U7GOEdYRxTwchumXRDo5Aw7GdNsRr0uOcnIi7H3v+ei2zeH?=
 =?us-ascii?Q?2fTHRvBni3gdbYy9aZwuwffFWVYZHGzRXblIQFRUHAC8vkDIs8eON8O13p97?=
 =?us-ascii?Q?YydVHt2/ddM9uMTdtmLRDx3JSsCXZ4e9pgu8O3cHQoS0dAe/c9edw+KRcQnM?=
 =?us-ascii?Q?jGRC9TYYIHExbKUJSy+n0VWxICQVadNXVv9hrS8CnW78Rkx1EcCxTbqWpT50?=
 =?us-ascii?Q?omwz/pHDAdjrphJh+nEHOxqwkl6labboIb+NLo3VsnphQcy21CtQ81RAu31e?=
 =?us-ascii?Q?RCW6h7zTdkbi/EHFLIEkJF9vbs+Lb8HZg6dfB+5JIW4gYKvcjOsxTHnKO1dr?=
 =?us-ascii?Q?KJIaMkOsXW2t5CjZ4DD6bYhnAqdyd9ejMKZ89iQsxZj7Al5DS0O5U3y48RGr?=
 =?us-ascii?Q?W5k+oW0ACskn1RDnxsdCnMtp0Deh+dkWYh/445YZ/OmcBmScUiiID8d8sdQT?=
 =?us-ascii?Q?vR/V3GtNgvVKnSwffl1gEZ8tCS6wsI7/yfl/3GfHV6/nwhicy1+rwq0a7pqA?=
 =?us-ascii?Q?ogezOcha0/Aki52WkAvx5S9hdR9MW3/LXA+JtUDCGaKac0k1Oklp6BxGylYW?=
 =?us-ascii?Q?smdbirSKTIKDnuWUHrA/N2iC77HLAgC+qChEMmhKa6DhinrY0ZtBCgceOpsG?=
 =?us-ascii?Q?QdkAiQt2hi6A8pfdPZLWufS4stsD5VFGonLtVXviBoPWOYYJJuPvRCPLzCMf?=
 =?us-ascii?Q?EdFmW9qucNc5MKqh9HD7UyNpfXlr1n41Ky6QzFs40xCV6Mg5buNfUzMqLku1?=
 =?us-ascii?Q?TEc7wwYiUGdXlXBxHgI9jxJCpwcoJ51qZDRRJe1z4mQVejsMAgQz9OHdcfDd?=
 =?us-ascii?Q?AroJsOD/Nqjo+ermsEROvJhrlvRd42GEBtVwXdKqrkdT09BT8gbJUkUox6CP?=
 =?us-ascii?Q?GX27EWtcROCx8rlIXijUVy+5L/zznRfNebDBwJ5OWjePcr6yHQ21uQibcTXn?=
 =?us-ascii?Q?EyuTOByyqj/5xyzVkir+KBfCaE3ze8P6c/FyPfvlxSQ0lzK+/rN4RwOU/7hD?=
 =?us-ascii?Q?tAmMcCL+DWKKqLXvmPba+IXv57Q0wDIGa5KxFZrycUqpKLgg50uXWWxGvGOB?=
 =?us-ascii?Q?UovJh6kfUBlmEdrG/8JhCCg7DJdYDvrta9G/7ZpKrJCrNhCimOagbeo0wyGF?=
 =?us-ascii?Q?1lJ88eSlWHYFrafiR4ZWu/RhSPSsf9ictg98WH3Qhg9gyD7ZNfhuz56A7m3F?=
 =?us-ascii?Q?GTjxQGpBTgFXlUeysEioGfeAy8twnWgaUIqdWq1Nl6ItGoZjs6tZj2pyOdXP?=
 =?us-ascii?Q?ue/8HgCDPfFralAt/pSo+o2qg5XN73qbtVs6oBTU/SHMIrfHfjDjL9flxtpN?=
 =?us-ascii?Q?oq08Z7Q//fYNORpMLr/8MKV+ahakh0OzPFkNs5lb3pMICygq2w59zi4CvezH?=
 =?us-ascii?Q?EoQypGPr4oJcA6jlkG2XzLScVx8Rz3yZ9bCksS4r8WCzfDoHH2TJei9KTCog?=
 =?us-ascii?Q?mnqyNtF6tBVWZY3jozAV72kkHG+jEwozYPHpK2rXca1ymLU51ZvJA9p16Fk1?=
 =?us-ascii?Q?BaXrkfOwkEP2vZpjXV6B+LWIx3uoTj+isdCW+5l3L9Pm3Kl1bAhCjReMD645?=
 =?us-ascii?Q?h1oOvkhGUpKJGwDYjOWcMu9jJg2C73ciDEJnOq9Zd3BoQeL4QXTyAE7mYuy3?=
 =?us-ascii?Q?psALONrEvGlPeRo54//xhdBHLue7gwXt3fkcrm1i2FwaXz9NVgC8KDR9rqKD?=
 =?us-ascii?Q?KwXvYMe/WkXVxRAz+45irvrG1s86Lek=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c42b1ddc-5b85-49c5-e585-08dea1b072f4
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 03:20:35.0757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NVEphXB6Sq2el06mA9HRD6/O45ay4DkRSu7a0LAd4XWhLtqk7PRDNxQAc21Jd5m8MJenM7Q/rrdqvx6M6idkMab7TtERlp0mpYuhiCTRHMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB0970

This patch serises are to add hardware spinlock driver for the StarFive
JHB100 SoC. The first patch adds documentation for StarFive Hardware
Spinlock. The subsequent patch adds hwspinlock driver and support JHB100
SoC.

The StarFive hwspinlock supports 16 channels for using by secur core and
AP core to restrict access and protect the memory area.

Xingyu Wu (2):
  dt-bindings: hwlock: Add the support of HWspinlock for StarFive JHB100
  hwspinlock: Add StarFive hwspinlock device

 .../hwlock/starfive,jhb100-hwspinlock.yaml    |  40 ++++++
 MAINTAINERS                                   |   6 +
 drivers/hwspinlock/Kconfig                    |   8 ++
 drivers/hwspinlock/Makefile                   |   1 +
 drivers/hwspinlock/starfive_hwspinlock.c      | 130 ++++++++++++++++++
 5 files changed, 185 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwlock/starfive,jhb100-hwspinlock.yaml
 create mode 100644 drivers/hwspinlock/starfive_hwspinlock.c

-- 
2.34.1

