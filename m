Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792785190;
	b=ffp77KnHN4RZEyf8IQAoCLto9TtuVPczPC8/bP/63FI83TLMI67fTXW0MxK8WSQEHUAE
	 7wfiwNIYTO9vh+wQNw0tNLv9sC6tNjDA8fJ/xOD1N2HrPHMeFLJ0260VhqAnSkdDxfeM/
	 xihsLVpiE/2EC4CmAXbmeGmhonXMcIRuFWQWI5T9ICYxWxPQo6pfIaCuTNelahhfz4vBE
	 H8L/6Y7guIzcN2vARfpwsTMc281mG/SZZKMGttrK8wBHO2WnE9OeXy2Fl8ndJ04m0CPAf
	 Hs7q2eIpUaxje9WRCvMiZQUlzER0o/XDvP+tL0KRN/S/rCjzx9IhuFCV7+Ywu7G2m1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785190;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Subject:Date:
	 Message-Id:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
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
	bh=zLCzWPtC4E2zaprB/kxKagaQplE86Lemdu07vV7BvaU=;
	b=LabqDvcsxCQ8qx1FblN7z2ffEXVaMw7pSqdhK++hzTvgE9RWlHkvZr9ILBqtP2Qu3fcv
	 QaHtmIj79q6zvd0ZMrO4uD5rro71hmYO3WccMOPObn5t8meg/N32Z+RBlrNh9oErtKceK
	 ZmkwRBGZp5Fe2l4XNhU/kX68n8APLw+AlVkO0DPEg8E8txW7k1Hj30sbrtiY9WqeAXuJy
	 AJhjhcgaXhFkvaB5jE9gQh3ez/lM0kvL41q+o8JgEfcmQL4/wRUTFyvpr7qc+ut9koFnK
	 3w8SytODMbcv0d4+lDtwQYM9qKEkKKnuq9JZyWObYWD6DWqlTZxHIRUHwo3OJES50Tg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=nkQ4XplS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.2
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013002.outbound.protection.outlook.com [40.107.159.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7699606A320;
	Fri, 23 Oct 2026 19:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7699606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=nkQ4XplS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HsGEQqhCXhHfAYJaOWEcyPtqUeo8hrzxLAkx/Qff+SXerjjKBtmKatbCS08rn8nwd/ppTb417p+2oy4Dv8NpMuPPlaqVNNksyUI265GoJR3gN9uPBKvNGB+O1xDaCiJd/vYIl8yE25wTSbsxszvgaPThlhHobWjR3yzscyg7Pw4P5si/B5bFfF0KeyTrXEmIOcrY8YbTbAPYt+MAV0Yorlj074oOq7FfvCS7x92oImLz2TkUTBPMKiQ7cFDX8Uzg0mMgYPAeOC3w9WwbKuV2xhY2HURECDD5VjQ59wf2r0ANKWFc5PyDTzwMk8dsP08F/yF6ECUHfECJBpl32bpmiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zLCzWPtC4E2zaprB/kxKagaQplE86Lemdu07vV7BvaU=;
 b=NHOmSD63pDjnr7fo3u7DxYJngk6P9WD6O1/c9HU65LxQNxOcZpuQdH6dFHWizAbZHNrwT2TmzR6mOHr/TAQEHL+w25RpFtP01JQdFzDeTN1EaKMY2n8La8h1F5JwbO6hqKR2r6ptMaCGO06uLv/GY1HciXohko34LpyLimE9or2R1UlH3KouQqyiHeQENOJvnabnsXZ14VwRtWr5hPGrNtTWRd6SKtQcv+7ASuMbqcZgyEFUKniHyWawpNB8n80wOcIdJZRJnPMFnG/gLQQ22mF2z3OnzWAN89YFtjVD46CqxTJ8lPIF55EZvl1iR6L21A3X6xE90Diso5xUbSZJuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLCzWPtC4E2zaprB/kxKagaQplE86Lemdu07vV7BvaU=;
 b=nkQ4XplSDmKn7PIhrEit1piiORY368QSsAqACYm3dLeXYL/vJN0QOak7OWMMbOKojcCpD+TOXKtx/HnjoWMIwIS+Sy6Kixb1qTlGn3qXmtC+36jq62QyFMXs0ZRTrBfST/pbUevaV7bV5g/uOIIdVS4BbAKNnawJOgt5155FWAvNJ5ShTPKvBVWJOHQj2Buzjr0Wu98qxZVpGTg0MN2m7pEomI9REn2C9N589XVZbz3TOpRf4UpQ3A8mP9CnfvtSXv6/BLZjRG//nAg7g7TSOMsYBWOtgxlSKf0G+oXSHP4bpasvTnodgy8Thb/NTNXvNKIWxintBHHKEY7WI8FJiQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DBBPR04MB7978.eurprd04.prod.outlook.com (2603:10a6:10:1e9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 19:53:05 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 19:53:05 +0000
From: Frank.Li@oss.nxp.com
Subject: [PATCH v9 0/2] remoteproc: imx_rpoc: use memory-region-names to
 avoid implicit ABI.
Date: Fri, 23 Oct 2026 15:52:48 -0400
Message-Id: <20261023-memory-region-name-v9-0-ad597887dfe9@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABC722oC/23P32rDIBQG8FcpXs+hxr+92nuUXqg5aR0kKdpJR
 8m779ixkUDAmw+Pv+/4JAVygkKOhyfJUFNJ84TBvR1IvPrpAjT1mIlgQjPHFR1hnPM3zXDBSTr
 5EejgFAPwIhjbE3x4yzCkxws9nX9z+QqfEO9NahPXVO6ovFqrbHN/BWavoErKKF4bpZxgEIaP6
 XF7j/NIGl/VP8DZ/oZVIeBD7JQNnfNObwG9BtwuoNsGIHUQYHqtzRYwK0CwXcAgwCXvevyC7ST
 bAnYNiF3AIhBB4eHSK7UClmX5Ad5ME4rIAQAA
X-Change-ID: 20260915-memory-region-name-f950eea2b78d
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792785180; l=3275;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=XhkY8uQwBFQZ2afum904Rl9z83QpVcj55N1YVJLN8As=;
 b=quIwNqFtdPP0uQYbJ6DTnpYHV0HwErC00lcvSArg1EYG/BwVi/q6KE3eKWSM4MOwmWYuvSYgI
 /miV5CyrXGGBsY9XbjFMuKeE7ocp05AMUEpTvXeFxesGR/vR0m8JVPp
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P221CA0019.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::15) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DBBPR04MB7978:EE_
X-MS-Office365-Filtering-Correlation-Id: dfb692a8-a0d3-48f1-84fc-08df313f40eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|19092799006|376014|7416014|1800799024|18002099003|10067099003|11063799006|56012099006|5023799004|261009223027099003|261022105027099003|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	vDGhyW4uCamJMcdIyfi7+AsyEtfYANq0FCJxtkKbG/Xp2cwKxmUXpB8jQ5RLEOtYoO2l2g5eVFin4oYGa683xt8l0yUGduYr8AcC9LoAtcYTd0XwQtAO+el256dgzF1xGLmIwOt+bobE6MNvL24LZ7mksl0QpNf/CXRI+H81Pv0M1LyQ2SPTvrlHOzi2Z8H80SxC0Ln2ng4JFAIWXGwYMV4r7ol1bh7jjshCvxbqPsj7zbNBms4s5PihVg96Cb7CLtYQUzoZEdTlqFYZNvIlsNw/2wJL7NlnJnmwj9ZYimUd4xB69cyCXmLp5CmLqdHLEYdcWC7+T8xcp13l/HATNnz01j9UZ4qXDrMQobIRxQzRWqHwcq7IKYWm4vNYJbg4luDqYz/vk1ZJ/5eqW9xQL/s1J6NIJkrQz5EbjGHBZLC4gD6gJZapfhFCxDgVa+135Qxt/L/TP5ekD5iT+Pk/LV+e9r8MeK7DF4l0zm7ML0BYgmZkSNK5IThT3KxBUWhNH+AT9xIOZuak5BEQEGQqxA9XGzfkhFldfp3zFOllLRl0juDMXQIiN9iNNUPw4cU5PUIKGOT5KqoMOIKga2i/jSYRgS0HXnvyQq+b1Tp40jz/rIKNlmxCvBM1cF9yYT7B
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(376014)(7416014)(1800799024)(18002099003)(10067099003)(11063799006)(56012099006)(5023799004)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGxGMVpvZzBuaExrOGk0RTlwNE9jOTFvUDhaZ1hYV2VIUEk2VXFwbEt3c1cx?=
 =?utf-8?B?TFFVUUhuNDRwUDcvRi9zSXh1QU9QdGhGbDZRR1Z3ZnROTkl6c2owQVBDaGxV?=
 =?utf-8?B?eGtaeFZEbWJJUzZHdktoN09WLzR5RnFIOCs1R2dYKzdnQkdBZ1pnMFdRRW85?=
 =?utf-8?B?Q2JKV2E5em1nQm1iWTBNb05WUjJtWlhMQ3NxTFVobVRWZCtETXlnVkV5S0pn?=
 =?utf-8?B?Mm5xOWlXbFhwRTJVbWhIVUdPdk9ZQ25WakZyWEZhR3hBeG1hWjl6R0UvYllz?=
 =?utf-8?B?cHR2YmdUck82ZVlpSzY4ZEhyN3J0L0ZUNUtCTHY2VnlJZitBektRS0Nqb0JZ?=
 =?utf-8?B?ekFyTDdJdW5mWlFqQ0RaZjEveHhQcCtwUVU0SGtZY0F4U3duK3JmbVp1THRw?=
 =?utf-8?B?Y3FKTDFyNTc4NGgvRzJURytrUXU5MG04U0Jkci90SkhseC9YWWU2RmFDdGZp?=
 =?utf-8?B?S0EwaUpwekgwMzVFbVdGalczQkhNQkowbE5QT25VMkFFdnlXUE01ay9rTlZz?=
 =?utf-8?B?NHNsL2ZZb0lPRHVJWHdwV0RqcktCMFlvUis2ZjJPYU84RUFtRUgwRFh5NXR0?=
 =?utf-8?B?TDZFbHpoUFBGc0NBZUpwS3VJT05UUnF2Wk80QzNnejg1V1B3blh2K3lkY3ds?=
 =?utf-8?B?OVU1TjVYWFdVVHhXejZselVCSnhZZ1ZpZWgxUHJsSWFNODJLTVBnV1MvdDg4?=
 =?utf-8?B?cytqOVhvVmZTUzhPNVYrMVBMQkJTMW5sSWJYUHhYSWtwSy9UTjJJcXVPSUtP?=
 =?utf-8?B?OGJodHVncU56Y20wdlFBdzR3dFF4Z2F4ZUtPTlZPSjhEdzNkK2M4cnZZRE8v?=
 =?utf-8?B?Q3Vyc0N0RWMrL3hIcDBmWHdNUjFDcjg2TzFqVTNxUmtEVUpPckVCZE96QW9Z?=
 =?utf-8?B?WE90dGxGb0VOZkxjeS9UZTBkQjlKUlY4eHo4dGlYNjY1NWRYakRWeklXK2h3?=
 =?utf-8?B?SkpDMUQwbndCUmVwMC8xSXF6eVZQVnlNRExSWHN1SEw3Zzl3VTM2bTZFbHVz?=
 =?utf-8?B?dEM0d1dLVHZreER3TDVTdDVyT3BvNDNhUXZBQzdsRnplTXdKY1dxOENPNkF3?=
 =?utf-8?B?WWpYTzlWZzlJalRpTlB2UjlkcEY3YWRjaXN2WFRnOFVyNTdzdDN4M2lBZ3o1?=
 =?utf-8?B?WVVyZ1lmQ1QxSVduOThSdVN5U2dKQzdxSkZVVEZOdU1jeW5HR0hodjQ3RDdD?=
 =?utf-8?B?Y3FqYnFQYWRHMHhDWkpnTXd4TnBySVVyZW93NXVlUXc4K1IyYU1McjBrWFly?=
 =?utf-8?B?VWZlVUxZcFlXRUJGb0NjNndXSlNjclpFTVRrWTk3aHN3UFNyUTVhbDlzanNJ?=
 =?utf-8?B?T2wwdTV4TzF6N2g3bFYrdS9pMWRsei8xc0l1UXN1RXQvRXpmaTdoWkdZbU5o?=
 =?utf-8?B?bk9wc2lScjdGNERHSUNqbFcxdHdHZHBtdXgzZzlZbGVNekcvQlhROHlLUVRt?=
 =?utf-8?B?MEgvNjU1cDhTQk55eVJXemtKaFczd09iVFdhMmo1U1A0YUZwSTNJeTFCaGFO?=
 =?utf-8?B?VlRXRnd1dEN3U1pDNVlLUElod3pFcGU4ZDNUYXQ5eTNXVHprL2R6UXdWSU16?=
 =?utf-8?B?dHNSL0o5NFFMVkI1SUhpbGU1VDdWSWZhb2RzaVkwVkdKNkRPK0Z2bDhIYnJa?=
 =?utf-8?B?dXFSOStXSldaVnFMZXJsTUNpb1pFVEVObWlFUXZjaCs5eW4rN3BTdXBrNjVp?=
 =?utf-8?B?YVVhNjlTcWFpUmVXT0hWd1o1ZFplRTI4Nk1idkd6VWRTemYzcGZnMTcySFpN?=
 =?utf-8?B?eTVzT1JUalBpOEg2UGZSZkdKNE5MNWc1c1VLaUdVQlFwSU1lQ3VuSDcvWUVi?=
 =?utf-8?B?S1ZPV1V0RnRJc1hVZURDaWR3WFlnNmNTTTdmOTk0OGJQaEJ3QVdkd3RmQmE4?=
 =?utf-8?B?NVFVcld1ZUxqb1JkYVc5VGdmZk9MaWlsV3JjSERaNzRUMzh3ZXVHRkVoeDh2?=
 =?utf-8?B?emZnR3Noc0xrZEZ0UHB3bGtUb2k5R3lvY3JHT1JYeUwva0I5M1V6QklhR3Fa?=
 =?utf-8?B?cjQ0bk1hODAzeEtkTE5jMEJPRmxVTWw0SE9aN20rU2gyZmp4cDYwa0dNVTJ4?=
 =?utf-8?B?ODdRcHcxZWtHcDh4SmpDRXBrR3FjUHZjRVBrYWcrMFd6UFF4OGMrZkJMSFZj?=
 =?utf-8?B?UWtLUnlSOGFlVVE0N2NySVNKK3RNR01RZWV4NExCbTJ6K2IxVzJBZXF0WGh5?=
 =?utf-8?B?Z3NuREtmUnhRU0ZEOHVzeUZkOWtnWGZYOW1CZUFDeW1XZk1Fa1FrMk96eXZk?=
 =?utf-8?B?WC9xaVpOK25mcjY1bWNuQ1lLQlAzMmRDQ01nZjFtQThWRHd6ZFNJQTZkNklS?=
 =?utf-8?B?RnBkcFIyWS81ZHJiMjRyOEVGUmJTQ1lWSVpCZTQzRVBORHRtUGVWOThVMEtO?=
 =?utf-8?Q?0RlGT5dd2j+cDAWavVQ8j/uzjf6p1NgjA9EOs?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb692a8-a0d3-48f1-84fc-08df313f40eb
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 19:53:05.3754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f8RmAojXRgZan3j3CJgoUn8wDqgfnsjIEZo9c2zIVu/UAOgZEBHf9o4yjOt7Ebb2MKDFxLVG/Xt1E+2KvueHfNTjHBcv5MbfxtKdeipLlSNnjOFhsp0Yh0eYQJaIY61U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7978

The driver currently derives the memory region type from the referenced
memory node name, creating a implicit DT ABI.

rsc_table: rsc-table@90000000
           ^^^^^^^^
{	ret  = <0x90000000>;
	no-map;
}

m4 {
	...
	memory-region = <&rsc_table>;
}

Current require node name have to be rsc-table, but no any binding doc
to restrict it.

Since memory node names are not constrained by the binding, incorrect names
can silently pass DT validation, as seen in examples using "vdevbuffer"
instead of "vdev0buffer" ([1] and [2]).

Add optional memory-region-names property to define such ABI. To keep
back compactiblity, use "optional".

Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]

Prevous version
https://lore.kernel.org/imx/ail0sH1UhnQBPRkr@SMW015318/

---
Changes in v9:
- s/hidden/implicit/g, sorry, missed at v8
- Link to v8: https://patch.msgid.link/20261022-memory-region-name-v8-0-ce5ce514a550@nxp.com

Changes in v8:
- remove dev_warning
- remove dts patches
- Link to v7: https://patch.msgid.link/20261020-memory-region-name-v7-0-1413d5928340@nxp.com

Changes in v7:
- move imx_rproc_rmem_to_resource() close to caller
- collect Francesco and peng fan's review tag
- Link to v6: https://patch.msgid.link/20261019-memory-region-name-v6-0-2e46b2e7d667@nxp.com

Changes in v6:
- collect rob's review-by tags for binding
- move imx_rproc_rmem_to_resource to c file
- dts move related memory region node into overlay file
- Link to v5: https://patch.msgid.link/20261015-memory-region-name-v5-0-abc358b39a96@nxp.com

Changes in v5:
- fix binding region-memory-names's pattern
- add vdev1vring0 and vdev1vring1 at dts
- collect pan peng's review by tags
- Link to v4: https://patch.msgid.link/20260917-memory-region-name-v4-0-260755920ebf@nxp.com

Change in v3
- rephrase commit message and cover letter to correct descritpion and
reasons.

To: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>

---
Laurentiu Mihalcea (2):
      dt-bindings: remoteproc: imx_rproc: document memory-region-names to avoid implicit ABI
      remoteproc: imx_rpoc: use memory-region-names to avoid implicit ABI

 .../bindings/remoteproc/fsl,imx-rproc.yaml         | 11 ++++++++
 drivers/remoteproc/imx_rproc.c                     | 29 ++++++++++++++++++++--
 2 files changed, 38 insertions(+), 2 deletions(-)
---
base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
change-id: 20260915-memory-region-name-f950eea2b78d

Best regards,
--  
Frank Li <Frank.Li@nxp.com>

