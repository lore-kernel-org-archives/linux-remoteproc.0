Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010045.outbound.protection.outlook.com [40.93.198.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8453E246774;
	Sat, 11 Apr 2026 14:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775918911; cv=fail; b=AtCHRb8AdLJDLQlUYh/OCjrby5HMtJ9d7WWjOHOEtuL0E8R31W3c0uI00eDps53Y6IpirEOHaBOMGiNdoSkqinjPQc9iWkET/bUeDJr03TQO0cLJWBtUSKk0zQ7qSgtpEES6fSi9inC31sU8ZkD4m0TZ0prgctK3n0TT8O5Eq+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775918911; c=relaxed/simple;
	bh=yTb0twOSkhgH6DCM7BHMK1/qspIDQTQATVdUokHrO3g=;
	h=From:To:CC:In-Reply-To:References:Subject:Message-ID:Date:
	 MIME-Version:Content-Type; b=JqD+m29WIl/4p8gzfKZH4/364TwdRu2588jg91YwekSBLsko1p4Dtd07kzIV3z/YVEagTR3VbKz6XNvEVut9LXBBmvTXfymeuprSp4+v8xasHWoqofyUqn/DX+1a5Exa5tuWljOSf6j+TEVfjXr50D+zbA9qrUrENHjtKzrjCdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=PZLaqfPh; arc=fail smtp.client-ip=40.93.198.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PZLaqfPh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e73iSxyde1QhRTcGhLe5vRtzVzem4uSXWqeH1EYvMUAsfXdDKHaCx/fIDdy/CTHR+GZ7yQFt7e7M4uKR6+xi38U00dIUKLzXzjh5ANEO4ESvMzlh0ubMW8oF9TfZX+5tSEAWuYR9lGLOJmesqN6BxM+s3RRhI9peFEMgvlYYKr700aoXb9/0evcS79nJgLY7A127G6AKiVL9qCS4B505wupo4oyOFdjivKZEOP4blyF+AZejkCSXcCIIc/yVB8NnKQcxWx/hH0OZjyD5T0c12HfREQ03LL70bpz1V7VdMiXBA/jmgJqZ5BDuHh4bbids+HOXPJTpqdiYa33RjiaHAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UTUCzXr8nujP1lREr7vzja7hu0tKyNVQZ/nWgP+L+4k=;
 b=OAcKkQbRyDt71ue0vJDKqN3t5+cL4N6XoHI+grZxz72Glh4vpFB7Md2EfR6OyQM1s87TuUF+OMOZSVuLq3etT3DUjJak6H0z/AJdRnNBd7/DBsQkKG8595D5Av1ogSpSBKADdp7nHvcaAn1+q2h37sUmZJcRa73oX8kow5BkIXhd4l17wSPIa1alMc2AwgZZr2oRdgiUhYSNN2eOueDSnmqatkvEmkmF92OZMHWOE2tX21bMjmVwb3NxNBj3nFjFOttSvWKn/KBT/8JI7QR/VyEWET7yIXbJzOBJqfAcv+s1kVQjDuO+FMSW7hXYuHbsT/1+uOcipWhSKwkGz9wKVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTUCzXr8nujP1lREr7vzja7hu0tKyNVQZ/nWgP+L+4k=;
 b=PZLaqfPhZADNB6L5r2JM0Gwe/l1PevjB6jmW1FxqOkL1sjZGV3rPmRBYER+4/Uwe/t2LrTodS5odAAcE4HGaDkAsUASdSo6HMIzKkJisysq3nYA/MNoCRCKR5/bwpNrb25hfh1P1hhawCHLJuulBmImYhvRGc1lLUTnoVh+mFRM=
Received: from CH0PR08CA0025.namprd08.prod.outlook.com (2603:10b6:610:33::30)
 by SJ2PR10MB7059.namprd10.prod.outlook.com (2603:10b6:a03:4d2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.42; Sat, 11 Apr
 2026 14:48:27 +0000
Received: from CH1PEPF0000A347.namprd04.prod.outlook.com
 (2603:10b6:610:33:cafe::fd) by CH0PR08CA0025.outlook.office365.com
 (2603:10b6:610:33::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.46 via Frontend Transport; Sat,
 11 Apr 2026 14:47:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000A347.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Sat, 11 Apr 2026 14:48:26 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 11 Apr
 2026 09:48:25 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 11 Apr
 2026 09:48:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sat, 11 Apr 2026 09:48:25 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63BEmEFV1983903;
	Sat, 11 Apr 2026 09:48:20 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Suman
 Anna" <s-anna@ti.com>, Nishanth Menon <nm@ti.com>, Tero Kristo
	<kristo@kernel.org>, "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
CC: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>,
	Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, "Kendall
 Willis" <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
References: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
Subject: Re: (subset) [PATCH v3 0/7] arm64: dts: ti: k3-am62a7-sk: Split
 r5f memory region
Message-ID: <177591886114.88632.3713559346133832075.b4-ty@b4>
Date: Sat, 11 Apr 2026 20:17:41 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1547; i=vigneshr@ti.com;
 h=from:subject:message-id; bh=yTb0twOSkhgH6DCM7BHMK1/qspIDQTQATVdUokHrO3g=;
 b=owGbwMvMwCHG7GTPG/5e9jrjabUkhsxb8XpsDRYVjtPX+V2sX//L4HDB9a/6cUm1RkdePnW4Y
 MhRkba/o5SFQYyDQVZMkSWAbdcsqxSLxxEViVth5rAygQxh4OIUgInMYmX4n3lhff4Wtv9Jh0pj
 P+hUKrDsMzL9tStxUvAGt7C80nVJiQz/DOWu+vG+1yn9Y602QTA8X9rTcv9LiQPPI/vL2h+bPi7
 gBgA=
X-Developer-Key: i=vigneshr@ti.com; a=openpgp;
 fpr=4A5A711E8E7E44F9F12F2CFAF903332F551A78E9
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A347:EE_|SJ2PR10MB7059:EE_
X-MS-Office365-Filtering-Correlation-Id: 46bc7847-3fb1-47c3-5632-08de97d96345
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	fzaQSWBQRsNVSgxnAApnP9oC4nGsoDZ1CawnLgZ92RyO3qGZ/cfHq8qsmuTzIWkW2e6cSwOKoSiMFag3wX96su2P53QchUVDcNX8obPJ0I8+dlcS6W/h48NT7OVgICN25JvtMkFuk15PTr+MqSXeofhmAv63a9vRCOMrefw7zQq8MQnJ9V6hDen1/Tae+s1xm65rpRcSt9cNM4p0gVDQRBw7F3xqhnnretGq5NBrki+82KY6rhGOwq/rg5CKGzy1Ndo8OxhLfd2vUOU46b488mMDEILrtfZnpS5zAGeVtskM5XPOJ27d0cTt7V+1u3UdrvBixwrBXQYh5RbRwxWq1RsYQs85JkGxY8GBowLnDYW7fRqoH92GR7EzSPntmHLx+slEiS2RGGHsco9CJ8eK8UICFk8IMHG+M6hhmhV69+RLg2HW7+DTn9+aWPX17UU78uNENmtbPReM/TZYLUz2Yh7NGopO5ANqmBNRwznXg8Bo0Vc9BuMMXzxl2NKQl5ewJL6r6nS/70EqFiLktxLVTIEe8iCm6/6cynnp5AU2Y1xLmjdAr8cR6sz4KFGATTGGAPUtdjLUMW0mwh1nfhKaskrVoxcULd7Jyi95i1ZOLtMGhLqvlDZg6MJTeRLxW8hfEYHE/3EnM03uYFWrIG7fXCuLkJZgkqaBlBDitxD016aaiTJqGM38qfwjcY3LlW2/m7nmFnL8ahoohMBVnehyv5zpM7SBpue8JmIRArUZ9V8KwXgWahLvFkettDlXg4fqHjoy7o4M4Ld/b0C8KrimHQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8z/PHtTsR7C57Cal1K0rYY75p43/I4MWjNUzbxcuybeP6+Pq48eNLexILQE3PrWniKgcNhbiuXGlO4aPcc9M4lhjR0fFyDDIJmk4U3WE6I7UsMZtKFK7x/coIGxmdSDvqYJgWQHWxLIK3IzBi48Y4PnRJgoAjbXjnb7/tit6uZ/9JwylkFYQY+3KzB+JpRym0jFng2+YK4XPj1V+4lfaXAJv+3lguPnNMVxzfrc4mqVnj6FBj1KqrNGOAELLp1g7B6ux/NwTrLpOeaOza2tRjZcOV3T8IF42nRbZlHrvdmmU9L5f/bRTJ39bxuLsYmtkj1cdH3rk6QjxnCOV4b+AR9TlTXmINpN6VyyoApiok1cy76wwG6ZtP1uWmsQwGJ4Dj4HwCIeaYOjCLtc5v+sYlnV7P8NTz+9wx4mUND7XOysfPXWqUgCzdzHfDSizzEZO
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 14:48:26.1294
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46bc7847-3fb1-47c3-5632-08de97d96345
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A347.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7059

Hi Markus Schneider-Pargmann (TI),

On Wed, 18 Mar 2026 16:13:06 +0100, Markus Schneider-Pargmann (TI) wrote:
> arm64: dts: ti: k3-am62a7-sk: Split r5f memory region
> 
> Hi,
> 
> Split the firmware memory region in more specific parts so it is better
> described where which information is stored. Specifically the LPM metadata
> region is important as bootloader software like U-Boot has to know where
> that data is to be able to read that data and resume from RAM.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[3/7] arm64: dts: ti: k3: Use memory-region-names for r5f
      commit: 8fcd12e26db9e9b2128f0d813972f76a9c846eef

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
--
Vignesh


