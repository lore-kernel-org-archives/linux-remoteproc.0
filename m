Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012011.outbound.protection.outlook.com [52.101.66.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D0330C366;
	Wed, 25 Mar 2026 08:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774428914; cv=fail; b=LTUo0B4KdLZi4fvMlhXO63xYstsaJGOstLf1UnFXPzZlgN3LzyXNnf+cIK2qEhP89hUsZqDgzxXKYQttuqiU/efiu4+iCVihg2E+bBTV0HBWI4Pj5dilWzW/P5jbtj1RrDGPsnrMMOTbbIuUUZ+Bhzod0gk8/4YotQYsTjLUIaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774428914; c=relaxed/simple;
	bh=ZHvUrtBtg9Y/JcSEcjjO9fx6OBfA7uTTz9ebVBZ2PkM=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bnKs/OwRwQgrgSgHpqoIyj2axfL4wUUTKchPjAD0SuRvQAZtimRUayeC2J1PMDCJ5soSppEPQCpz+EZA41T96Ddgb54z0nzMJBSevw3OUq7U+Jdz8HcVm0igu6vtYAi/BBhWkIvT8lzwrwwDZop6/tExPmyFn4DarWBSkOP9JfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=AbVE5cKs; arc=fail smtp.client-ip=52.101.66.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="AbVE5cKs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GkVu0ojK+wdpW5rTPkdwGR2J/2SZEPp/TT660v1ciruPl6g6TuvHLdP7eoyErRotfg/zpiTSMYuC/RV7h14DGUiR/k9/p51SBAFjBWE19iP44ig+cKNtMZTzy1ztfzMc31YxmCZ0icVRI0EWQh3uSjsG9ZUjVNl0+uBDmNqL+XG+yyWJAqKhO2F50yFI9BUttv2LNhtj6nXUizH7VPaX8raSX3TeyTWoZupCUARGmp8h9KrCJUHxtnza6QnSmuuXrz3IDQiaTxIp1JM/pADLE0NVJ50HWC3IgR3AGcCWAiI2M4jsIYwkoN4SBO+gtvQTkY+NajW04HJNEMO0A6e7aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHvUrtBtg9Y/JcSEcjjO9fx6OBfA7uTTz9ebVBZ2PkM=;
 b=orBTLt5HkqBPBxlU6L7Si+BR1HqrzAHPoOhGoMRlcdTlARHtgOivmkKjPzB98LRcm5mwvCiXanawk5VT1FhLHCa3NrLK3HySx3Jgkx23jbjakAW67Gyr52cFNjoEVO39W9p1MWRybM37LDoVKY5A5VDX2Ml0Y5TL1A2xSW9ylEFOCaI7S5LXB987divRdWrb7UVTEG9pxGM4AjXro/v0UDQoa7fKT4F89BQk0hAFod+Rzhnn+4sBArRxWhsiLw0HzT3BP+xkesRJJednGSkEr9MMZWrJc1ogEGLXo6wEjFWXaNklqijhpgLAn1fsaaAhihyKnIj6ucSRhEbLoVpkuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHvUrtBtg9Y/JcSEcjjO9fx6OBfA7uTTz9ebVBZ2PkM=;
 b=AbVE5cKsnFqdecdZ9G8uGgYn+l07m3LVQGUU5srOQfemUvXws/lAPvVM6UJA+Ce7cXTY6AEdWn9VI4Id+uqjFkOZBu2g32ee6OoWJlm0XePkMUpKbcnD1F/U3NuqyMXEYiQl5Ur4wDUvdki9jIDIZ0yfgl7WL/ob+IcpZ84YDGMYurceQjYGxpwuUqzIRPPPzv19+aovSpG3o61Fv8z2af7TYdfCj74XfBKrDbVz5InJJ4a9N86NpUx080CEmaqcl7vZRf1IzQjpgdoYcPRxOKEnN0yt2LWa4PTqMg1J6wYSqiIWXJSdiZk5/tGAhomUUcZKu5V2oVzdR93Nz/Sg4w==
Received: from DUZPR01CA0336.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::21) by GV1PR10MB5940.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:5c::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 08:55:06 +0000
Received: from DB5PEPF00014B88.eurprd02.prod.outlook.com
 (2603:10a6:10:4b8:cafe::54) by DUZPR01CA0336.outlook.office365.com
 (2603:10a6:10:4b8::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 08:55:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB5PEPF00014B88.mail.protection.outlook.com (10.167.8.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 25 Mar 2026 08:55:05 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 25 Mar
 2026 09:56:04 +0100
Received: from [192.168.8.15] (10.48.87.74) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 25 Mar
 2026 09:53:26 +0100
Message-ID: <802412f7dfe45c9472d436e4c2c4babc76590894.camel@foss.st.com>
Subject: Re: [PATCH] hwspinlock: fix warning from sparse
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Date: Wed, 25 Mar 2026 09:53:24 +0100
In-Reply-To: <20260323102210.228551-1-antonio.borneo@foss.st.com>
References: <20260323102210.228551-1-antonio.borneo@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B88:EE_|GV1PR10MB5940:EE_
X-MS-Office365-Filtering-Correlation-Id: 441675af-65ab-4bb8-9b7e-08de8a4c35ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	nx4fL27Mfton5ua26iXUp0wklXwQBr3fRsiILrPsY9LwdSzdkNm/Kbt5AfwniUNLu5bwma7y1C9KrF2Xd1GvG15Dsju1z98r1CV3UgMP+bdE2rK+5CJBSVTNSWuEsXBrG1Cj488XjS5tBIZE2c4ayTgSlW4jOGI+EGgQcyFNyN2Bv5znlk34CZkVRriwdFj6lAriJS/VbSpwtz3RX4+PZqXjL8yNTmCYud8i9nEOJCqRzk+LjqaqRvJf29SEOA6RSeZuG2Pe3bbasBTSVirXlKYKaI3N0VaiTkOhwb88l83SGNXylt8IxapQZc8Kocpb3PfJUJ4RlCGsHOEeJg8ABb5LAkSBIv9AyK4jCjvTvh820V+Eq4B+CiQM1hAJIRkKCbjvWrX1ctcLv+p3B0FptFA0/sgeAZQLJowgza7DrDI8MVK+Jn4ekkUCnQ2FfGt9GQwyPRiGHV3fQt1suiC42T/L6fvqIrg0gIW6e7fgYI7derAFdAUcw3NELZOX4/3ceSBWvIx79JxbeI+qCSSSe3H4R/vZCcJM5iZzHiWi+MOF5coSy7jBwV5mN1igRaFsuNxXvd+A+Q9VdRZkAIRRe2F/nEWkMpw3RWQN6dI164TDVECtQhbGcQRcLtY62OzC94BcpCTa+mgPqLQV/w8pBx/LdTnf9OrMsQ7Sc2OuM6uHvu1CiDkzczZlvG07dZoZBKDoLyDGvgd3XlCJevvkoA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cLIN7VYFugE3XsObXVm4PPpsy9XhyNMz2JnODP/xgXP4V/sAkk1R1iA4cH+7jwVWeOxWm6pxMO7jQDBlQ97GSu8UGNCaUWsci+Jhz+sHH1I/yAMA/F4sJnVOMZaA6/LhM+fTv5P7zXZJBpXiJWNh6Yb2xeIN/MlFHGvVvmlOXoK9I+HcKkiAwn/PoA9sg4kIvRtr2SEBnf+NUwMFpby7PtY+E02z8rEXWZataXyaWgsOj5vjQ00+ho9Rt8iqEvjCGturIA9+BmZ76+tCfJZf+Kq2wes8ssIpENXMWHmA++8g10gmiERUkF7ngegWcaZT8xR4xlQKIreW6sz8//UVI1qyd/HjfShLQwe8RRxn4UQr5FGcVlI6ek34dmhU43oOJ35JrQgcZOJCjvnzZLdJ8MFl5C4Jxs8Yuax9TzsHzNFhATyKVRneNDiU3dhlNXKT
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 08:55:05.8839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 441675af-65ab-4bb8-9b7e-08de8a4c35ea
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB5940

On Mon, 2026-03-23 at 11:22 +0100, Antonio Borneo wrote:
> Sparse triggers the following warnings:
>=20
> drivers/hwspinlock/hwspinlock_core.c:392:9: warning: incorrect type in as=
signment (different address spaces)
> drivers/hwspinlock/hwspinlock_core.c:392:9:=C2=A0=C2=A0=C2=A0 expected vo=
id **slot
> drivers/hwspinlock/hwspinlock_core.c:392:9:=C2=A0=C2=A0=C2=A0 got void [n=
oderef] __rcu **
> drivers/hwspinlock/hwspinlock_core.c:392:9: warning: incorrect type in as=
signment (different address spaces)
> drivers/hwspinlock/hwspinlock_core.c:392:9:=C2=A0=C2=A0=C2=A0 expected vo=
id **slot
> drivers/hwspinlock/hwspinlock_core.c:392:9:=C2=A0=C2=A0=C2=A0 got void [n=
oderef] __rcu **
> drivers/hwspinlock/hwspinlock_core.c:393:48: warning: incorrect type in a=
rgument 1 (different address spaces)
> drivers/hwspinlock/hwspinlock_core.c:393:48:=C2=A0=C2=A0=C2=A0 expected v=
oid [noderef] __rcu **slot
> drivers/hwspinlock/hwspinlock_core.c:393:48:=C2=A0=C2=A0=C2=A0 got void *=
*slot
> drivers/hwspinlock/hwspinlock_core.c:397:30: warning: incorrect type in a=
ssignment (different address spaces)
> drivers/hwspinlock/hwspinlock_core.c:397:30:=C2=A0=C2=A0=C2=A0 expected v=
oid **slot
> drivers/hwspinlock/hwspinlock_core.c:397:30:=C2=A0=C2=A0=C2=A0 got void [=
noderef] __rcu **
> drivers/hwspinlock/hwspinlock_core.c:392:9: warning: incorrect type in ar=
gument 1 (different address spaces)
> drivers/hwspinlock/hwspinlock_core.c:392:9:=C2=A0=C2=A0=C2=A0 expected vo=
id [noderef] __rcu **slot
> drivers/hwspinlock/hwspinlock_core.c:392:9:=C2=A0=C2=A0=C2=A0 got void **=
slot
> drivers/hwspinlock/hwspinlock_core.c:392:9: warning: incorrect type in as=
signment (different address spaces)
> drivers/hwspinlock/hwspinlock_core.c:392:9:=C2=A0=C2=A0=C2=A0 expected vo=
id **slot
> drivers/hwspinlock/hwspinlock_core.c:392:9:=C2=A0=C2=A0=C2=A0 got void [n=
oderef] __rcu **
>=20
> all linked to the same missing '__rcu' at declaration of 'slot'.
>=20
> Fix it!
>=20
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
> =C2=A0drivers/hwspinlock/hwspinlock_core.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hw=
spinlock_core.c
> index cc8e952a67727..50a875b2353f8 100644
> --- a/drivers/hwspinlock/hwspinlock_core.c
> +++ b/drivers/hwspinlock/hwspinlock_core.c
> @@ -372,7 +372,7 @@ int of_hwspin_lock_get_id(struct device_node *np, int=
 index)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct of_phandle_args ar=
gs;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct hwspinlock *hwlock=
;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct radix_tree_iter it=
er;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void **slot;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void __rcu **slot;

Please ignore this patch.

While it fixes a minor warning from sparse, the analysis in
http://sashiko.dev/#/patchset/20260323102210.228551-1-antonio.borneo%40foss=
.st.com
highlights a race if provider is unbind, plus I see another race between pr=
ovider and consumer on async probe.

I'm checking to fix such races, addressing at the same time the warning fro=
m sparse.
Merging this patch now will only create unnecessary dependency for backport=
ing in stable.

Regards,
Antonio

