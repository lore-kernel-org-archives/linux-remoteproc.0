Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792515044;
	b=YMSQdC/6efGtnV3yAntHt9RD8OGFrJTer0mhjZDZOm1KxdqrPUOig5x5MiSWyfxNOW8W
	 OhtwpIJW6WWyswNhHFHqVjoCKP+Nd6dQqypZfZwV2G3ooFEEYd2iYCtwM3ShcxaLkQc8B
	 mDyEA1HVBrbyrBM6yAQZGi8Qd7MKOP/Z3vlJIaXXyNL+tyP5Fvtdh6jozTB4be2+o0lTP
	 ogILZiQn8h/INgos/cq0Qnua2sPXDhxnLknWfR4iw82uQEFJ6yJAV3LzOr530SfbXpTko
	 K2g4rRrxlUn0RXKgYIqQ56JJFAL/L/5EmDQB9H3WFNDwshRC3qM+HuBuOMDnztYvH9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515044;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
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
	bh=pZiPdQu9vRyRLyCokWBgNE52aOngd3+oCKazPJ0SwcA=;
	b=EAaAOwUlcIMRa4stSPOs1BGbhvAZkloNT6/CasfQ+GieB/4Yd8jeJfhAGe4PjX3ajU+K
	 joIGvaTTa+JJf3beBd7AAjNarGwpuOonjrGRsiVTPLzXEHmJwv/64NCNfrfGt6HZzMvjw
	 8r/gB3KPtsojP7+uUAedw28p0tC9d33Hrd2g6BPCVKGkx7TJdDSUdQJ0UCpJ59AuLdOdR
	 L2hQJmzrjAkNhzoDXIU9mVihQchP9VS7gUzlavLNPWsvwJfOUe2FaxT+HOj+NSSG/JksU
	 NnSDShuNj4CBed6QBBSTA0uNLBITPIBLw2vRDgVqZYjpNUdx8QElK3TgimfkFeK4tKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=JyHMo6Yj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.38
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013038.outbound.protection.outlook.com [52.101.83.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A9960A2614;
	Tue, 20 Oct 2026 16:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1A9960A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=JyHMo6Yj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vztJg6+brZE5Zht1ntIESPXxhr6aUaZABSajHDL5m5eTv9MNswc4CXZweAyl7NCna5RdSIyrwaeaYXFP4Wz631/RRVh/YF+EwKIBrSzq3C97R0aM2kz93JTd+21h+MGJa5vpp2woP6JBteygBBFHHEVR8qJcVrfug6Xli6mqETnP4GTZEtVDNaxJA2aWUDhg58CwJN/0NU84A5O5KP3Lq0GA+/5kpuYjtxoQfcHr8UHz3mqqULEkViJZAwAiE+Zm8BKgTYWyfYZgzZ2IMXBDDDe1gUFZq1KoG+2Z4NrVulsg4hNBwpGEH4tTv4k6U30el2Uz6abXHDh1frDgb+gk4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZiPdQu9vRyRLyCokWBgNE52aOngd3+oCKazPJ0SwcA=;
 b=LLzGzJQJlLOVDTAK+FKRseEk3G/K35+IV6lmhJr3afcUnp9PtH5PvgPWOZhyL81FQ6q6xuK167nNAv7/JcFbUgx0WicDDti5ABmy+xTP9PScolITBn9/slHUDZhkJMBfznOzyRlzmxMkbmder+pX3+pEQ8lcvBwPD11wcQDSlVw1JtKKWcUTcL/XjzKxpVUaj6vMH/7805tERTMQ7oJc5RU4Rd6VwDPqQcVRzMspIndfB1GRa5GNCHVaPf7N0Agew8X/OPplUXLhuUwsyrWjiq/8OWPwkeBdYnVJZl9JqT/4IpgqlI3Ar6fiHVGuR00Txj3yDNEZ034N7OZq4OjwXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZiPdQu9vRyRLyCokWBgNE52aOngd3+oCKazPJ0SwcA=;
 b=JyHMo6YjfHq7VWIDPXJH4wrkNRcc3wIWmqgZWQvvCAQf53mXCgJqU33pWqKdUE8Pt137sf6YSOJPjR9CSB45GztL94U3QqNU/qPCbz0z+4Heq5Y5wIVzJD9PQbYmzVrCcvMHYTR8Ziz/82NpR6ji7c+oDYNX6LM/ngP/n+73iYqQ90OEZnqxvhsVUd0TaytGtJUlx90Sr1go3sEfxOlfkjQLWdC7Ttkc4T9k068fW3aIYyvVfNWb2wn5+zaZUYftmKVWJ+6gChW97tuRqlM18Zaw1lXj9WDshX4De7SCadIJi8u8q/LiM6a0Run0w/VRk/XSWTHNX7oWTbbK029fPA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI0PR04MB10341.eurprd04.prod.outlook.com (2603:10a6:800:217::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 16:50:38 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 16:50:38 +0000
From: Frank.Li@oss.nxp.com
Date: Tue, 20 Oct 2026 12:50:22 -0400
Subject: [PATCH v7 2/3] remoteproc: imx_rpoc: use memory-region-names to
 avoid hidden ABI
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-memory-region-name-v7-2-1413d5928340@nxp.com>
References: <20261020-memory-region-name-v7-0-1413d5928340@nxp.com>
In-Reply-To: <20261020-memory-region-name-v7-0-1413d5928340@nxp.com>
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
 Frank Li <Frank.Li@nxp.com>, Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792515024; l=2768;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=W0d7anE7nCAyJxKpO3peRlzVfdFhwdqNw6YnAHfL4Ws=;
 b=w2COjKNnMlzGXc32h+tIiarlbwGiTbdjXLnicPDEtAulJcFyAnpZDBIinkyaC61OndXXDJYdE
 Vy5eaPLIyJ5DKhmkjUfIg6Ttha6riBXoGKN9uKlIOpcRzp7jI8sPXon
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DM6PR02CA0124.namprd02.prod.outlook.com
 (2603:10b6:5:1b4::26) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI0PR04MB10341:EE_
X-MS-Office365-Filtering-Correlation-Id: 3161b0d3-f72e-4c68-0f93-08df2eca44ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|19092799006|56012099006|260925021311599003|260925022911599003|5023799004|260925021911599003|11063799006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	nb40RfJN2zUDKvnf6OeeMcuvN+nz/KLadl/ctxYbRmqFG06Vx0SWAwfnR7Cg1KHjlrnnjbDObJJJRi5kOeYF6tFYOzzsgrXBZuJpNYRs/aeBW+uxYIPq3PV6/Lft1jdL7ZKuB04UG7T/Zq3BYADx2ur/3XoNSnQDiPPhNudBtG7quHRpRc8bfCwIksOfb2XduK4auIux09pnbk0rpvEnhZ3g1qGF1DUlTC1KcwPdbmPaDoaRbb6hkpTqCzkwu6iwV1ykT7XFZqnW1dIO/d9r4EkHNby5GAXVXGDng7D6QpD3GikXc5PFfE2njujKrfb9cGVkUj9KR9tRHO1gfbePFdArVmF2rN9ayYjoeKky1Y8RCKuVcsRN1s5YX9mS2q2UxKRuSR4dZ9M2jsEf/ezbKFu5stmgtCzLzXHA//rjxVnhnXzFMaCXGuCo4Cy6IcqQTBkB2V6p4kaauj8L9BtZm0usIghTIHnCjnRXtsOaba0sIxRsrQZ3bfNZ1bnMTxkX6P6fLfC5p0PlVy88HyhyTETnKU9iFs0NW1RxAaEpq8ZrOEwuw2Mq4HP8/xz2yysH33rD0Du7zxAv+Wq8GxT9GMjblDXjDJD728e5vjVVz9dhQP5jhQhiA+yIrYTUhYVa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(19092799006)(56012099006)(260925021311599003)(260925022911599003)(5023799004)(260925021911599003)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejRGSVBmTW1qV0dUbFREeGNrdHZzNGRpS0pGeW0wTEE4T1JTRjA4ZXYxakNt?=
 =?utf-8?B?aVdzRzMwdE90anRMOVVOUUF6OHU4aFl5ei9EV2NRNkxVRjdjQXg1bTNnVVl0?=
 =?utf-8?B?ME04ME00ZHJXSU5zaGlnU2U0L3JidzhiTGpVTjJSMTNXZ1g5Q0hIUlhlZkM5?=
 =?utf-8?B?ZTg3WElGMnVtTkdRVGVnVkhlYmlLVjBWYnllc2t2VGVEbzMxL05vWERqT2tP?=
 =?utf-8?B?QWQ3ZFNneTRFQ0FyTlN4N0lpcnRia3VjTDk2ZlVqQjY3TG5DYXljK2x3TE1H?=
 =?utf-8?B?TktGOHZwRmlRQy9IM2MyU2pnTVE3RDlxTFpNWSsxVUwwa1h3cHlvT1UzdXBP?=
 =?utf-8?B?Tk9Bb0QzL0w1c3NnSWVGVjFPaXJvNmEvY0FFMUt0aGdDU0JEc0Qwc2V0cGZI?=
 =?utf-8?B?N09pZlBBekUzcC95R3hTcTNLLzZLMHVmelNUZGo5TTZ4VzhzWU1YYXVJLzZr?=
 =?utf-8?B?eUFSSFlwTlZVb3EzWmROKzhucFdIclNnK0p3VWhJeGZ0WlJOeDNnRlc3WDU5?=
 =?utf-8?B?b3J3VnMxVVI3SnFpZ0dNWEkwVFQ3VXBDNEkzMmtpZHh0YytIYjFnc1YzRzQ0?=
 =?utf-8?B?MXZHbmNpeFM1R1NmSUhlR3QxdXl6emJnZDJoQ2NuRnJ0ckdPRjFsbFZXajB6?=
 =?utf-8?B?STNpT0dmdGZnMm51NkRCN0pva2FHRjUxSlU3bStpY3IyVENJM3VpeDg0RlYy?=
 =?utf-8?B?dGhKckNiNGttVUc5ODZhTEFEeDBhUitEVUhybHFJelBJZ09NOEk1TUNYYjg3?=
 =?utf-8?B?eERuTWdQTm5TWEQydGN1N0o5QVRIU1ZoVWNMN0lpaWtEN3R4dlhMOThhcXBE?=
 =?utf-8?B?bjBEZ21iNDZPRXp2S2NRWnN4M0ZuR1lCelRnZ0JRbEJOVGZwTUhuVFNBN3pT?=
 =?utf-8?B?eUdVdU5iVmM5ak5KRnJGeTgvZHpPVGxXUTNybWd5Y3RVdmpWQTRMUTZ5NXI1?=
 =?utf-8?B?RDJYSTNkbktWRkFlekloa2htR1MrMklTak55SHJSN3VCSVRVVXVvRVRoeGsv?=
 =?utf-8?B?UjBacGMyNk9ySVBJbnlTS0NOWkJ4eGVweWdMNjA1RExBcHpReVgvTzd3Z3JW?=
 =?utf-8?B?NUZtQTJ0cS9iVVEvMjNJMXZnNU1MdkZ6c1JnayttckcyQkJsS1F4V3NQejMz?=
 =?utf-8?B?OGdsR1pIa0RZRE9DQzNsSGQ2aVZUZ0JwUFBhcEtiTENPbzhmdUhZQXJPdllN?=
 =?utf-8?B?TE53QnBKOVZNUXpNZSswUU4rZ2VsNEtyVGpVK0xnd1FKSUtzcGJFeXJ1dU0z?=
 =?utf-8?B?TDhjZXU0aFljUENidXRsbU91dlhveGwyUEVEalE5ZTNwTjFNY3FJRnViUU5W?=
 =?utf-8?B?SmZYQ1RDTkcyZE8vT1U3bTV1QmhUaHMwdGVQaUNMRnJIRVlVeEpHZVJReWYw?=
 =?utf-8?B?bjRHNnk1eTNnbW1EY0Jrc1lacElYb3R0eG9WdTdZVzdzS0hmaWpJZG9LK0xO?=
 =?utf-8?B?RnYrTG9Ld0dyTWt6VnhTWlp2WG5tWjR6eHNucXE3MlM2dUY1SHc5TlR4cWJJ?=
 =?utf-8?B?ZkFPTDI4amZab1FYTEZOM2RobkxoUXBucWNYNWR2Qkd4cHJwMFlrL1ljUFJl?=
 =?utf-8?B?TU1OS2dqM01yLzBvN2FVS2dFWnpYT284TDZMZi95NjBKM1kvK1p4WW9NOXFE?=
 =?utf-8?B?dmxDWmVOU2FNMjFPRmp3czlSTXVaWCtOdno2WEc3KzRYeDBmS1JkaFh0LzlU?=
 =?utf-8?B?U0ljSkpnTlViTi9LbmhvWDJ0YzMyL1JjbUp2RE5MaDNtVkIvUEFiVnRrRVE0?=
 =?utf-8?B?RDFGQXRsTm01ZEQ0OFM4NVlTL3NxSU44MnA3OWlEY0x4U3lsaDRGNjJaZnFG?=
 =?utf-8?B?NXVUVWUvajVTSU9TeTBhQ2pNdHppL2tCSU4rMk04L1pkUkQ0aU9VcWJUSUt3?=
 =?utf-8?B?NWhrYUs5c0xNUDYrWkwwSWtnSTlxUVpCZ2dIMkpTWmpYQWhMZXBGVExYdHdu?=
 =?utf-8?B?NURoSU1nUGdGSUFDeGRJUXhOZFZjeW43UllBc2NCRjl1b29iVU5PcExjeFlv?=
 =?utf-8?B?eWF5ZmVITkVvVDdBK0d0RThFeGJPKzgwV3V6MzdFSVFiQk9qNy93RTZidURo?=
 =?utf-8?B?ajlrYzlOSnBpaTl3bmFVc1kxaFpITmZWVjBUQUxOKzFPalo0TzdScjQybDVR?=
 =?utf-8?B?bTdFTWNPOE1pNEU3SmRnY0ZnRzJ2SjQwRFV4NGJBbVFtZEF6V0k4TFpGdWF1?=
 =?utf-8?B?Mmh5Ukdtc1VmRy80T1IvVnFxeUE1engxdXVCSXZaR1pHWU1RZmh5OCtvZnk2?=
 =?utf-8?B?Wks0dmpYanhpT2pJVVZ0OENhMVZSUWZUeEN1NlB0MmY2bmdXRTFhb3QwQURz?=
 =?utf-8?B?WStJcXUwUS9hUDEySnl1WEZVRkd3YytuSUdicEJ6dkx5UkVyblBiUjNXc3Fj?=
 =?utf-8?Q?zK5GUy6DrsEJI45/xYtczAL3UCzQfF0wYEC8k?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3161b0d3-f72e-4c68-0f93-08df2eca44ab
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 16:50:38.0907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NxM7EWAHNzeKt7GZOPUm8frS+I7XlbET6YT1Ka7y0UCj2r7UxqoZv0VlEsrz3T9B49MbURDNLmo3/bO4JbuaHXER61uJKy13imhWyIy7u8qDs0cmC+cVx8wiKgQ7+Ka7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10341

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
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Francesco Valla <francesco@valla.it>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 581bb07f5893f..1647726893d1a 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -635,6 +635,25 @@ static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
 	return 0;
 }
 
+static int imx_rproc_rmem_to_resource(struct device_node *np,
+				      int index,
+				      struct resource *res)
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
 static int imx_rproc_prepare(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -648,7 +667,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
 		int err;
 		struct resource res;
 
-		err = of_reserved_mem_region_to_resource(np, i++, &res);
+		err = imx_rproc_rmem_to_resource(np, i++, &res);
 		if (err)
 			break;
 
@@ -823,11 +842,20 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
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

-- 
2.43.0

