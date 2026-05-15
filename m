Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2114.outbound.protection.partner.outlook.cn [139.219.17.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593D93CF664;
	Fri, 15 May 2026 10:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778839744; cv=fail; b=gpRtHT9RCiB/+kqcPkTGeoXx5Tijr2sZgleg/35+97Ev65ildMhnYh6Y9+C3ONJejZaHQEbM2zTaTpyH3jLHHgC6DZ6troK5U5V914OPs+9q77c81hgIzNUowjQdXKh2QMa//9fBOJoIoMQK53QnfwZpgIlfmoDBYclMDcpyViY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778839744; c=relaxed/simple;
	bh=swcrXP0uA2mlFetr2bBqWD0uP8peYDDNLmypBBTy48Q=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=phdkh16mOUl2oEX17R0Rg6g2e+NpiHlSDE49cnLb1RzPkb9z8Rn3qiDVjm85WrmYNHEAGAZUpVWqk2/D5MOvRhspsk0Q0LGhnWCtuV3Xdf87JScdY5iCI2W/mCjL/d6kSF7zoXvUzQ2bzirc+tg5e1AgAZExJlXNI8zne9dBKVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gLSWJq+Uvy4Sa0wuxjNujYzEtGGV3fNqUcZAoedJpNoyUAOnP4RvQ5b43mQazl5OCHYOsj8o7Crn1F8I+dpShwLs1PzD2vtMx+gpsKp98qxxtYzwH4KegcSUZ2g7E0oTF7p0hEuMy7NDb7H6rIymYtcNT9BgC3ESldJZKVuJwXdg+uW5C1GgdYA0GqTMdahQLS+UeugueUt7pUOeNMQzuYCb4F+vJCmRSMcVxFknCEqTylSR5CSvgu+4O4s119WfxhNXABTmjRa5XLdAd6infZPnbB5JrSnBBmAEMjtpjQgAn7ZmEtWDjkx1P/yLchCYnG62X0kz4DVWoYTFw5bwJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUz1MPGC80uWTN1sU+RurDVZHtuB7yrRo0y2R3VvQdE=;
 b=eq3sKcvKNaG5NZQ+OQmsRCCqNwTqahoORaBkg3KWVtZbNNVygXpU+rhYdSIIdCE+T7n697X8k0T5U1lDsnLRRRGPrLpsgAbW5KC444iqcfAWL8/5amoZNoT0Nu7SQpOMOk1fjMvhZpyKgHxg4RzpsmKALSVT2JHmn9FakOKz8ckLLQQM+6r2pxKsOCPpnjSKf3kPoOmSQQMs9oyNC2STsTjt7MTOZHgdN8HqDuoLmlvwI3KI06VBqVs4mYW7hvcwRQvLZFW9RNDH7nkPdZA90T6Bb4xDvvmOwFU/AySHrWmOvJuMK3jWDA4Oh8h4EvxK214VGHlPpCUbHD2cWrp+kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn (10.2.8.138) by
 NTZPR01MB1002.CHNPR01.prod.partner.outlook.cn (10.2.8.237) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.21; Fri, 15 May 2026 09:54:06 +0000
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 ([fe80::d8e2:3f39:6ae7:bdf2]) by
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn ([fe80::d8e2:3f39:6ae7:bdf2%6])
 with mapi id 15.20.9913.012; Fri, 15 May 2026 09:54:06 +0000
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Xingyu Wu <xingyu.wu@starfivetech.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 0/2] Add hwspinlock driver for StarFive JHB100 SoC
Date: Fri, 15 May 2026 17:53:55 +0800
Message-Id: <20260515095357.75998-1-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0012.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::7) To NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NTZPR01MB0956:EE_|NTZPR01MB1002:EE_
X-MS-Office365-Filtering-Correlation-Id: 95431405-7cae-42af-3076-08deb267e6d3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	YeBltHCYrUBUe/QNXbuYIiIGpJ088j6FNQ3Gwbs+tp0eCeAEH08GIWCGMUoSOPG1q1YlFHR3B1ztQ9CJAdw3u0oB5ulKqlNv1wnD7dWlKgjyyGVjzU1N+GuI7wrKcy2aOKMWTraajLSwHbDoRPG0kEbMJXww1hpRh1PmAR3hUmQGnywNuN+SRrSRnE+gyMYEqgthOQy0x7lUd6vqTD9BytqkeeXfWQHbu/DLcWFi7UqKSvuQy6pIdlRsqhfxELn8ZOa2R5LjeH34h57tWbtcqi9lj0zDz3YYuHUiMa9S3UjUF24O/vwEW0i8GiVp1+zk/Zf/Y9SLszqbCh+HSui8zIZFmudqh5rdTNbhJo7saPRpQZJxKKBE3f71VSzx9MfhnMuTvcp7MUNOcUEXoURAiVwMdanLNbG2PWRgRT3yOLgrlV8uFhb8wg3zWeojl9Ett9NEh2tdokTpDIspOeByst4TqY9k2Nru7vYXsS+pY8OsrvHSGftdMyly0CsFeqmBi9qETI0+AvcJLzvBdYqFt82dI7T/5Tx8Xw1DdcPIEtGCiy2pzzegt72i25kxiwnk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VCiY4bVCUwnXZVU5DyVS+ouGkCPyJUbCstbQSxvi6uzvW72q6pxsTRlmRBD7?=
 =?us-ascii?Q?zqSaGaL2HTYDPBHgpzhgQyf8WP/2KBKYN35s0Z3iZPnRitnAxQQfmO6Q2+2r?=
 =?us-ascii?Q?SZzPUIju7VWUCJQMbQQdgeEbs5DR5FJEUkOKdifgahR3zeNETMVxdAWm6Mui?=
 =?us-ascii?Q?4ucf1G5V/Mz0M54Z+XZMQS2CQIbWVyBUeZLySaFTX/tHI9316hDuBA+57hvP?=
 =?us-ascii?Q?zdtKAAFxi/CzWakfkUg5CZMM149Ytlq8O1Hm/B3lkWxgw12wzMvBlnAH71ma?=
 =?us-ascii?Q?dAH3mpknJpCLw2DYHz4fFfF7LjqKsnTURcuVbktenJKtXtZBOQuZvd3IjPge?=
 =?us-ascii?Q?YayfdzQEMrGWHuGL8i+CsOW9xc5tKWxdT3oeGtx4nX/QyAxah+zPPPoOAVrg?=
 =?us-ascii?Q?Z+TX793iRvjYftUQUtmzvqfRwkZ8G1zCFq1rZI0/KrImDWTbs4gnKxZuJhUz?=
 =?us-ascii?Q?G9DPTI2RFPpFcoMModaaF8WpRICKd2Abtk05StglUmZ2fr6hf6Fd8Q2Hj/Q8?=
 =?us-ascii?Q?pL0YWY1zNj0j/1a3hqDW1K+UTk+S1jpWEax8K0J9gZTMSCc72mEW5cGmP9Fr?=
 =?us-ascii?Q?4CjYI6WxPOvupWqS3ftGk/UAm26L2yNQXkpS0ZwNAZC2A9a/ng4Arfpc40hb?=
 =?us-ascii?Q?SoChDSnihFiwG5/nfZBJ5PcOjDY4vyHYAHwo9d7nNRpX2af/RUqBbp2H2hJN?=
 =?us-ascii?Q?/EJf2jAX2iBQYYkPRG+zwIpc8QfyAkGblIBAKrY65B6gu1lzkCL9uxZAC9VT?=
 =?us-ascii?Q?k9aXL+Jktug97KIR3yteV40vBPzu4JcpZfKMcKPZfVqlUTdPcnpTBh3Vu3KD?=
 =?us-ascii?Q?i5ss3Z2WXI6qTmqTcFn42zab/iryWc7ko9y17WzlB68mZIhwbldaBUFQtEVY?=
 =?us-ascii?Q?3HYp6gP/6ofuoxpY5AbmGREk1VIcVTSEXVuWvhc0JAehIkrEcN20PmId8wBG?=
 =?us-ascii?Q?vfcqNmkA/J/gdGxqrulLVz7br11C4ApO2YYbb9YLI7vRSF4drX5VXhhTMjcD?=
 =?us-ascii?Q?4hbXCsda6Qy1roytxt7lI2EN9O6sopLo4vi7DA1iWL+zvrQf/R0o9ao5YOFP?=
 =?us-ascii?Q?UUDcYEeSkxvS4XmTGeA9umb4f83C9ZyedCjiENsBFKz++0AerrhesfC5kRoU?=
 =?us-ascii?Q?e+tkQUJZUaj/vcuanNma85UeTWf8pgJl9AaUCmk3r6N+dNpXGDSqNXVGS5z4?=
 =?us-ascii?Q?b2ONDTAj/y5nyDdupWY5K02gp1a4T6ivNufTZhwoFL7McYxbLTXxrD3LvknS?=
 =?us-ascii?Q?O9jEkFffMPCjFxBbZII1daB3cDnVkYMObsFIBK97PffNBolTWzscZ6T+ITR5?=
 =?us-ascii?Q?jI525EIMHtoi4WjT4bJ5d7gD2URM1DqcRq/ckhvqUOBJMT+pA7w0qVULDH8J?=
 =?us-ascii?Q?D/KmYCwkkgXx5ywADPaDHHESZJNV9dUV4IfPbmj9B4DUlbwF0FEchgoCszKH?=
 =?us-ascii?Q?ho+pCA1uEoFxGFjGL0+4+hwOATe09pmU/oTM0mayqlDWgRnGvSxsF5Nm4rh6?=
 =?us-ascii?Q?FlGB4YvGEv/6jeHokCSDDX/R7r1HejJzXLnK0sKZw37ct4xfaf7qrGTBPch+?=
 =?us-ascii?Q?mW4sxvc9Y7zzmHKzAsmtkrRHek+6IWheoHHpAzTUxS1c/k+7D8PNs9kQzocy?=
 =?us-ascii?Q?cGsczetdZxYeI1quQJBv4IWbYGkv4N8B7QI9G5FEnNu9i/UpU/KdA0lgo+23?=
 =?us-ascii?Q?77QokDBFat6kZrXsGJoG9At/OJ4+jKrQnCRASB7JrWqjfIk0PDvK12pakfAv?=
 =?us-ascii?Q?zInfxHlBr32xvOt2atvrs8aDdb5S5IQ=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95431405-7cae-42af-3076-08deb267e6d3
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 09:54:05.9256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EA9q2AutJojNaX8LgCIt/pA66HUulbxEbWbHUn9XZpsEYbFMGz1JLYmlwp+3L9uA+EyyMCiK0zO2jUyTGIjZWCSwAbFHzuEZ7nJ/jcmFgRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1002

This patch serises are to add hardware spinlock driver for the StarFive
JHB100 SoC. The first patch adds documentation for StarFive Hardware
Spinlock. The subsequent patch adds hwspinlock driver and support JHB100
SoC.

The StarFive hwspinlock supports 16 channels for using by secur core and 
AP core to restrict access and protect the memory area.

Changes since v1:
- Simplified the subject.
- Added 'StarFive JHB100' in documentation title.
- Modified the name of example.
- Added the property of 'clocks'.

v1: https://lore.kernel.org/all/20260424032026.62301-1-xingyu.wu@starfivetech.com/

Xingyu Wu (2):
  dt-bindings: hwlock: Add StarFive JHB100 HW lock
  hwspinlock: Add StarFive hwspinlock device

 .../hwlock/starfive,jhb100-hwspinlock.yaml    |  43 ++++++
 MAINTAINERS                                   |   6 +
 drivers/hwspinlock/Kconfig                    |   8 ++
 drivers/hwspinlock/Makefile                   |   1 +
 drivers/hwspinlock/starfive_hwspinlock.c      | 130 ++++++++++++++++++
 5 files changed, 188 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwlock/starfive,jhb100-hwspinlock.yaml
 create mode 100644 drivers/hwspinlock/starfive_hwspinlock.c

-- 
2.34.1

