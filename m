Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011007.outbound.protection.outlook.com [52.101.62.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7908C169AD2;
	Wed, 29 Apr 2026 04:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777436920; cv=fail; b=JApuXWgHajmt/vStt9s2Y66KEcU387DNHu9+pHz4rM7nX36JmrsglpthWmgBitLXwNOXd1cVuh7afppPiIyQdj0TV12dlMnQ50ybTdkZWHr/x694ka8d/NtTMOLOehuAouxSrF42SzpDAiLe/7qHoYLSTeItF/whpa5PE3BFf+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777436920; c=relaxed/simple;
	bh=zpf79PEMiDFcLFy80ngJH6MhWRl/V6bbtp47O63FGRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aR+ghEji9WZ6yHRH59ZqrOF+78HuuZZIIS54PCfJ0YYxjWo8Hf+jAE37QNpDmjSjSFeXaO8L6oRbsIxJCXXZAG2RGC5rFZlhIfBhwtiZeIjzeS0fXrsxMtU6OhQd7uhVJ8W2dr8QjM0MoQ/voJKYoGCYRSg9HRN3TXAu2vSBlCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MNYevA7d; arc=fail smtp.client-ip=52.101.62.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MNYevA7d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qfRY+CHof8uj7CeLGUEY3ohuTamwcbUdRgwNNs2POvfFe7HG845jzPblY50j6aszXZDRdf5Y6TOjBTIU7B+PTGu/EFe91hOSDHUZrEiG+qnPfPxsIlxLY4NyiOjrhkiK/vtqN48Rza7S+cTdh0U27IUoFoP405tYlbXD7CHZZPu1mAEKD5kurwYDtnU7Sfi7cahwtCmeJGnZSIiZArne7C+zaPp1fz7SXuHn/e5fJpge1vj1mNaEEZ6l08VRMkEC4iB3qdnR/1UHEbzOtcZgP2fRdpuIwh8v5YwIaajYKNfO7FQa17GzW/79E7BpLhASXXh7lM4o8uGuYpQmOdtOfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpf79PEMiDFcLFy80ngJH6MhWRl/V6bbtp47O63FGRQ=;
 b=ABLAk/7l8HGusr0YwLbJYZ3urYxXWTdCMz6QAMeM/0R5Wq8YrWfPE4Fo9pbEc003H//hm3Mglkjo6lu1pYBCQHRaT3QCn7TieDUgU+C3YBHr7croUwdv0SJ86C0RNOsqvFToF6o0UepJeeZlU22ifrMSyJi5g+PDRx7cpO+IeQS6yB7t3O0spL2O4hLqwKU2QygasBOFPmXU9upzbheSaxaWbWZTZ6neUsaFQRgsE+wVmVbcAtBRcKmWX7i7tR7KOKyMiTWwxHMO8eX3NO61l0E90qg3phefTDRrf3N49YoBVznOjfenvF3UsNlE1yHjCaUJ7ZGlPDJHzwOfSWFNtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpf79PEMiDFcLFy80ngJH6MhWRl/V6bbtp47O63FGRQ=;
 b=MNYevA7d/iIZshsAveb6To4Uk2k3rpuluyu/qzv9LXr5+SbbwaHIi10bKpy669oTEtUmVtJHPvXNygjE+xQkaEf6HwkWoHIimEL8mccTP7YQ8AAavAfKe9La5Hv74sNPfXjLmgkv4ab2h5/LKBY+79xW2N/Bi6Vy24qPceqho7Q=
Received: from SJ0PR13CA0180.namprd13.prod.outlook.com (2603:10b6:a03:2c7::35)
 by PH7PR10MB5813.namprd10.prod.outlook.com (2603:10b6:510:132::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 29 Apr
 2026 04:28:35 +0000
Received: from SJ5PEPF00000205.namprd05.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::bc) by SJ0PR13CA0180.outlook.office365.com
 (2603:10b6:a03:2c7::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Wed,
 29 Apr 2026 04:28:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF00000205.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 04:28:35 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 23:28:28 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 23:28:28 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Apr 2026 23:28:28 -0500
Received: from [10.24.50.162] (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63T4SPRC2346763;
	Tue, 28 Apr 2026 23:28:26 -0500
Message-ID: <5c3ea9d8-063f-40be-9db1-479a1cd6ef56@ti.com>
Date: Wed, 29 Apr 2026 09:58:25 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] remoteproc: xlnx: check remote core state
To: Tanmay Shah <tanmay.shah@amd.com>, <michal.simek@amd.com>,
	<andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-remoteproc@vger.kernel.org>
References: <20260428221855.313752-1-tanmay.shah@amd.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <20260428221855.313752-1-tanmay.shah@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000205:EE_|PH7PR10MB5813:EE_
X-MS-Office365-Filtering-Correlation-Id: cc7b206a-896c-406b-98bd-08dea5a7c718
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OuQuGqh/gPlm2ephpjudRJ3MAHCS6b8gUrzh0Up3rf93qqkpK/9qgFkrVlI14fH8aVaGHEkiYMqttpB5eKNGEjuCq5800QYLLhJ3rwqJ1Dkyd7jFBSHKUSCFcmNMxiuZxJykfvj4PxYgGwYrabe8lqdYbyEFsOY0Pih5hiWjD/+CUb50CFUL9Gh4I8ndVlA5W6+BqsGmvso4DNiHZ4y7LUThvOE3uN5g3eMpsJ1JsyJcUcv/KyL6l+qm4T4RQ9YMkYc8H2CQwtcnSNjibrHbzbNPr0C1ImXk0Q8Gmr8fZzTkQL3pAm3p4FU10t/bd2hFqhrALT+PO7Ua6+NU9JdBaywTii4XhvW6o6kFH4aBldUrZrhOWxI9DLuClNiqlhgpHrGMCsg7mDa3b7RlgWVjhP11X/viPfYPPkHV0psNzqaCre8b5uafwA6Py9ARzFZWaDJTZZZG1d92HrYadMXr/scQCiYJCepTtx4k47M0UEWDurVmVwz6+fd8y80f9IUbwT7zl+J1OF1c63JTXUWfIYmzjVU0P0m5eFnOOGTTivP8SezVCobbeJSs2W8KQd4HX7YTu2414Odz2xlt5oj5hcrNSFXHMU6UnWJfLO16eKpu38n/6VesvAz+ZqcHHrofbNu4taukZLQ0CdQKsL9Rjlq2HGRZ1gG7lEGKlWgWLJeEA3DazwATINbfWeQ11cnU+4TWQR0onmUgSD+OL/TDXO1TvYSmtwi2i/InT7EULsnbK4YnLnhHi1uyTYXeYXyOcdasSmAPmSCj1o5iEHFvSw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ATgCPepjKPs4sj7vawl6d4verjCMbgfKJl3qnU+rIEtwkG17jjmpNeuW3ISGfqAajSHvimkoEHnNqYJtIe3aYxp5pVaF+5PHNlzEwxeG3wK5vp/D9iZk7j4A8dzL9wpjhOMxEuZdw1XEeIA+xWR4Nsxh67yB/jUdHI/vAp0diSN+lto7qgzSZ3rnEseYEpjqmXKvsnqdJZpozAdvfGh14c6c0NROlqmRhKFFbAdMVFs6DasbJSRtqzufgeads2K4d6Hw/sxmjtQFgvhGPeMWX4f6UYUtBnQPYdIcL7Z9eAPPiXR2CksW6lQMUQxhDE3Xw7el8fnthqyskSOv2SQ2ZOA3FdO0lS31NvKVFvYkYa6lWVRKAViMJB1CsqXDchitLxoqvMwLO2+SU5RiqTTpdso3nfgpwuspMRByi/VpsqLyqRyQ+EJjd1bfEyH9+eWh
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 04:28:35.0354
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc7b206a-896c-406b-98bd-08dea5a7c718
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000205.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5813


On 29/04/26 03:48, Tanmay Shah wrote:
> The remote state is set to RPROC_DETACHED if the resource table is found
> in the memory. However, this can be wrong if the remote is not started,
> but firmware is still loaded in the memory. Use PM_GET_NODE_STATUS call
> to the firmware to request the state of the RPU node. If the RPU is
> actually out of reset and running, only then move the remote state to
> RPROC_DETACHED, otherwise keep the remote state to RPROC_OFFLINE.
>
> Fixes: bca4b02ef92e ("remoteproc: xlnx: Add attach detach support")
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>


Reviewed-by: Beleswar Padhi <b-padhi@ti.com>

Thanks,
Beleswar

[...]

