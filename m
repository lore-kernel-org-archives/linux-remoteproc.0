Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793679282;
	b=PmMertNxwCsQLH+axGRuyj7UccaHsPJabSrUrTrI5MP7ZQUMedtbe/Ls8BL0Mh/ESy9Z
	 pf/VEtkp67XkUAy+k+doN0Wd3do+/KKh185SCsHJ7RuRKfkhUdsVZFczfTagyZFOgGvzl
	 WGJWLn/4ETXOv8y211hCHImP1/WZL+4Vgf++8TyLDxz9fhm/Nvr018I3zgq/1i/mr1ef1
	 ViBtHpNrU3FytpfrKu8LSqGw7tWIeo/wcpvbjAcyK0BwsUq+LGYpwFFtt057U/s1Mh5ko
	 pdADeAGne2dJHPumrjCqKDBMVwoIJTkDap1xMDg2blqD4cMrakUSHS7W+VibozEgIrQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793679282;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:CC:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0RCnJK6oD8DfSh9++ojzJceg8tsAXRPOVbC5TregUkU=;
	b=a/pKQ1UizKt/hzuP78zzxCzBTK+c90pfXgEfwyi7VCtjQOg5t+1WtLm87XnYVHtf0eyb
	 UO6uJfCnM2pU9+YJy+sfs+0lUSnIV1O5MwhvBv3T6WKZZn1sZmA/QK0M14Kfe5ZbeykpW
	 GRLulkU2JExz6dghP04Q1HpqO50nb2m47/h62MYAtlvERTrbLrVRtwYZamy4H884Lgzd/
	 SvpVZ5GFSDq2EY3cZUSvZSN/vEVpQnimnTM6QlwaLAt56u8XmMc7ul5mWbNH8b5a0TXd2
	 Yp9ZF15Ji7+JvlR+RnNs4n3zPff6dxZnqMPv4VUvMy7Y9jv9sUKSObuw14R7GwyqD2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b="RTKvimr/";
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=mndsdnjT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118CB606A332;
	Tue,  3 Nov 2026 04:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 118CB606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=RTKvimr/;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=mndsdnjT
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A31h32f2264789;
	Mon, 2 Nov 2026 22:14:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=0RCnJK6oD8DfSh9++ojzJceg8tsAXRPOVbC5TregU
	kU=; b=RTKvimr/uJMtxWd9HM56uZTQqoGDu7FPCssX/aU2uLb55ENvS9OrmbRV6
	uSl06EvRVuRmLl67ND6pE9JRWICjv6YMIgK4D2aTcZEE1wQnj3w9fyg8coW04xdC
	+Pebfh2VB781JICc+fthfm0fCCS04wT5Ih+xlNjxiU7f+GFEHW9zNOl043qSYeqs
	SUIqEjAg4L8npdbHRF/FJ2ybKwRDsiRQ2IdiWQmRZnke3GJL2/InIr7FYC2Kt43K
	7CLOhS9PF/lJxDQMyc4thBICGRprk0royRPh3KpWPtF+aI8liZo/vaUSyMwaDGIe
	6HXop+mtZBhgpexjmSxcaC9Owbveg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012017.outbound.protection.outlook.com [52.101.43.17])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hprvb54ak-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Nov 2026 22:14:26 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L5WlQldAwMEZXU+4jIKtdMw+uW+fAKbu/fJ7xnJHqjYwvGq1bt0W0jdYRWO1gPwaRX06ofSDC1biCTSlpugGBErDFJKE5g14DOsWyfHHWeycH6EML2MK2qsGyxuH4SijWH5IXYcIhUTrPLkS7NSfpvvXxGJstjJIyUW2rDApEEqUpt07ZxvBA6Rg77+A5ZM9GDRerKi9GJghdxCJleB7UpqXJ6vAx5W1MJQfyJxkWrn6Y/gUHCtbIPzdItRDipBsymbcxIFHe6Cx7UGaQqy1ya/8MqsiQKysu/PRG0AM+trfobiA5kJHmlJsXRrqWbvEoBYSPFh8jbWwn7tPPyE1BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0RCnJK6oD8DfSh9++ojzJceg8tsAXRPOVbC5TregUkU=;
 b=XV1uMBiu7Z9V05zDMvXU6Lbwwnw/BUcgtqygG9b/RhrScE065aVMwnm0ciROWwiMIScX7nnTsg0Ho+JXqIEZfxpRd3cNrKJ4qH2AA+BLZz4tkz74hxujT6lb2dFN3oXWj6KFudFvKCXB8cG5fX1d3lyk8+bbOpYSfbdiYmEt5DfIKbgtGAeI0fQJehYJ127o2aXx/+WG4E5QFl7lRugh4EgpF7KcVkaWUBQsIEvm+HLHTDK1g8N1GHAP1uN1/zWbOW4JRdYbpQZKeAgOGgyOtanoNoMOmREqjTxmBj/LZTqHOKhWWkDC7F28Wgx30UUqWg83BsKOu4A6KOELyge2kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RCnJK6oD8DfSh9++ojzJceg8tsAXRPOVbC5TregUkU=;
 b=mndsdnjT6whls9S0wqtV3CsCDv2z8kus6EYR6QhsFWfPtZbkW8u3SKuJ2Ho59iASij/pwfu2wC/UDmlkIN5y5GlwYlflOnFhioiGiDDIgvNSu3ZULY9hIycTdOMUK8y6Sqym3xmXgPGtw4zmRUniTDX0fHYIM7gt9iY0TJ6ir1I=
Received: from DS7PR07CA0019.namprd07.prod.outlook.com (2603:10b6:5:3af::7) by
 IA1PR10MB262904.namprd10.prod.outlook.com (2603:10b6:208:5b4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 04:14:23 +0000
Received: from DS4PEPF000001C5.namprd21.prod.outlook.com
 (2603:10b6:5:3af:cafe::3a) by DS7PR07CA0019.outlook.office365.com
 (2603:10b6:5:3af::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Tue, 3
 Nov 2026 04:14:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS4PEPF000001C5.mail.protection.outlook.com (10.167.23.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.0 via Frontend Transport; Tue, 3 Nov 2026 04:14:22 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 2 Nov
 2026 22:14:14 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 2 Nov
 2026 22:14:14 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 2 Nov 2026 22:14:14 -0600
Received: from [10.24.50.162] (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6A34ECP73407858;
	Mon, 2 Nov 2026 22:14:12 -0600
Message-ID: <a840ce03-6c00-43ef-b854-afd6db2f24f4@ti.com>
Date: Tue, 3 Nov 2026 09:44:11 +0530
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] remoteproc: Merge ti_sci_dev and ti_sci_proc
 abstraction
To: Sidd <sid9.karanam@gmail.com>
CC: <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
References: <20261014103241.3847-1-sid9.karanam@gmail.com>
 <20261014103241.3847-3-sid9.karanam@gmail.com>
 <d18e3659-e001-4f44-92ce-c7e3c1660263@ti.com>
 <CABM86px_9=4sHAqCm6wEhRsaT7zwxyitN6ewmjQa7ODzqk-qtg@mail.gmail.com>
 <76ae6bad-648b-4e49-bb8a-7ba1fc1a40fe@ti.com>
 <CABM86pyCt6kQ30kj4EhGFj1JLYDOBw8_MsDzfppLQPL0uEHAcA@mail.gmail.com>
 <ee8730eb-b9d1-4eaa-b8cf-2fd8e38566aa@ti.com>
 <CABM86pw_gQP=5fYSQPOUHBRP3PW32PL9=1CS2DCXi6L-kev-0w@mail.gmail.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <CABM86pw_gQP=5fYSQPOUHBRP3PW32PL9=1CS2DCXi6L-kev-0w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PEPF000001C5:EE_|IA1PR10MB262904:EE_
X-MS-Office365-Filtering-Correlation-Id: ca5cce41-7e73-4447-78e9-08df3960f0c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|261102123227099003|261026121527099003|261021121427099003|261102130727099003|4143699003|5023799004|56012099006|261009223027099003|261021135927099003|261021123027099003|261028144727099003|261022105027099003|261022075727099003|261022113327099003|261026140227099003|10067099003|22082099003|18002099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	JPGawHYKB8ZWN7BkTYmEa0JCC7mEazhG7No95zodPJiyAoy3u91LBZn/xmPGv06sH3wdQUS1hf1Ggg5nsxXOVFa1WRFjpEawmOXOkPz+PZAksBiqoXKToYi5+wQ+IMK48PDbdwFFR4py6YOSSyJBc42SOwUt+r+cpThm6mtJQq9SvnbK12DEodWpzz6jZjkd2QgH9L5lJOOVH81KHqZkR1EHi55MXoYdJx5P/ov1qyF2sig4sbtjGZ9yqrpe5jBLjlovRQRjkpVImLHsP/f5adwtqnYsHl2sai+NU8Isy/VIUyKeFDkxTUWAEtI4VqZ5SqqiXYlR0WgwAwRKxMwfyVm69GyZnhdgd1+NArDD9TincakwLOp/W33SE3yMlPQoO71CEKnw9OvE0n0s3fzjlpQythNg8eIRSBmvOCvxitosFetjdrOUKsVF1egtgNBSS+6elLB5K40I43nY4wu4OGOrVqgTDyrjgbI9X3tnvuu1I3ONbbgnh2g+fgYuK+Y9vtkIP3gwOrwnkV4TvYxb4DNVL9Lh17/ntYBA1n2iM+LI9Q07XX8EHb1qJAT1KFITtxpbqgyllCXwvwE12d//BlrYWsDnTqJHL6DE7qvUrrVSkXjNSlnTlc1uY3UpJyu/jbF1MYUCn2Dk7ri6ycixBw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(261102123227099003)(261026121527099003)(261021121427099003)(261102130727099003)(4143699003)(5023799004)(56012099006)(261009223027099003)(261021135927099003)(261021123027099003)(261028144727099003)(261022105027099003)(261022075727099003)(261022113327099003)(261026140227099003)(10067099003)(22082099003)(18002099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XhuEVnBY644puukOupRK/SNk5CqG/8RX7Yp5dekUya2LhgDNB1/+NTLxkK07ThkgtENZhq1y+8kMd+DEunXq/BN6j55OfYUpEH9P8MVy0NoakB5WF4Bk//cqxfZWb6JBIm7FT0I9PCTvNe1/meRx69421N48i32bzrBUnYCN7xCE+KL6/aBH42B+J+DFvLStR/YV2G/uB5+0+xOwD2koMxzi2I3w4xNQC4b3GWoaMB3Zv54SKWSuFh2cFPI4BH1SYEefXjDzC+MACeBq0SE6HeFA/ol2yPSZj+9doLK8UcgHx1x6gGkfGG/vjoo76fMy+nxbUdKOcMzn+0n7+iXeN23SAGnGCpCWeL6tgsIXUZeObzXpbQD/TU9y22Lq0nlfjHYO9NyUvChkA95iQVP4vIO2d8fzd9viBhBny3MwRNaedCPz5dQOXtPkzUHyqsOC
X-Exchange-RoutingPolicyChecked:
	oC19LJYnDcwfOPkVSt3QKUwyPTzvcw4T9AQW4ZTlRVKjmUs3qvpsPAiKvXCtXNxuifdtT0nqMjfwFoCIZPefxVPPluYCp/LAyHfzM0lE4CRpPCaUw7mRnaDVuETObKufxFnAWpwDK/HCvBL5mDa8UpWHzYyRWOVtEI8eX4wtU8QQg2gRWnYZoJ8Ia6lwEBNG7c/mqeqtBYRQy7wZDoV/uTLIL69QfhUWkJyYILHGLxdNTbmumKV4DGGRndvWI05FAUffEkqkcuytENGvFpkhXRMqArRt/Biej1394TyribqszuJeAzvH6C7tWkTpmqJapeOieY+2ykuGDZghu/m66Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 04:14:22.8151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca5cce41-7e73-4447-78e9-08df3960f0c0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS4PEPF000001C5.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB262904
X-Authority-Analysis: v=2.4 cv=BN8mP1QG c=1 sm=1 tr=0 ts=6ae95fa2 cx=c_pps
 a=E+RN6GuJaivtKjsQX17oSA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8 a=LZPmGAOOYTAB-S2BCpQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 0tyviV3HvbvcWMVog37iAqsyYJov70bV
X-Proofpoint-GUID: 0tyviV3HvbvcWMVog37iAqsyYJov70bV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAxNiBTYWx0ZWRfX8mhpH/TDUetU
 al7sf71cd6ZCmcoZrQ8DthX2qChF1aA+T75u8wD+J+vp67fYDgiis1ck19M+nMTJP2pBxOZ+ajb
 W8vVk7en2htsjSGWzIb1/LJFqc2d3qVKe2+wd4vlu3igk+u0Vw970g6z8fWQyScmTAaGtqblnuu
 Fj9SFJTqQS+r6R5J7ySQ9OADcYbzGVMLid6mzcco/FNSi/5K01SVrris4WYbMaNddo7PGG9QTZa
 aofsZ86KzUh9w7Ubwxt5cv48pTeU3qBxf9wClr7a8b2NwXSHSCSqJuh1plIy/IXnF0B9h9GrRg4
 1m8M4hWKSnBGloCJlyPh+Mqh2s4x1MvCafVJEJkLZj9d9cfW+e9+25CsRZUbiPIQXZJIfpu4JjC
 ZEOzBINdT4I8wocR1DvoRNcL0K8LIdxsA7OmRZAVHYkBnjruq9rktz1xi5lexsaOi2nfVwum8uD
 llreQhERQXUJbB0IQYQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAxNiBTYWx0ZWRfX6o0f+CsMwfEs
 jhl5be9SC0vxlKUdBP2TT1Toj2W7RvBiXvHbDplXcMadUyvXdWL18qFeQInfg4y/cPaT3PXnAht
 tnx1zj7bj9em8bCLNqtCKc+F8TXJAfc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030016


On 30/10/26 17:19, Sidd wrote:
>>  Function needs to be renamed.
> I assume that you are talking about k3_release_tsp right? If so then
> my reasoning for not renaming the function is that logically it is
> still only calling proc_ops->set_config(...), just through an
> abstraction via ti_sci_ctrl's helper instead. Do I still need to
> rename the function to something like k3_release_tsc instead?


Yes please do rename. It matches the prefix with all other
similar functions.

Thanks,
Beleswar

>
> Thanks,
> Siddharth
>
> On Thu, Oct 29, 2026 at 6:35 PM Padhi, Beleswar <b-padhi@ti.com> wrote:
>>
>> On 10/29/2026 4:30 PM, Sidd wrote:
>>>> Yes this information is good to mention in cover-letter and
>>>> diffstat section of patches. But you have mentioned it in the commit
>>>> message of the patch which lives forever in the tree after merge.
>>>> Cover-letters and texts in diffstat section are not merged into tree
>>>> and are just archived in lore if you want to get back to it someday.
>>> Oh right so I don't need to mention the "original thread" related text
>>> in the commit message right (just the cover letter)?
>>
>> Yes exactly.
>>
>> Thanks,
>> Beleswar
>>
>>> Thanks,
>>> Siddharth
>>>
>>> On Thu, Oct 29, 2026 at 4:16 PM Beleswar Prasad Padhi <b-padhi@ti.com> wrote:
>>>> On 29/10/26 15:54, Sidd wrote:
>>>>>> You can put this changelog in diffstat. We may not need this info in
>>>>>> commit message.
>>>>> I have mentioned what v1 was about and the changes this brings as
>>>>> Andrew told me to do so (I had unfortunately replied only to him so I
>>>>> think other members were not able to view that, so he recommended that
>>>>> I mention that in the cover letter).
>>>> Yes this information is good to mention in cover-letter and
>>>> diffstat section of patches. But you have mentioned it in the commit
>>>> message of the patch which lives forever in the tree after merge.
>>>> Cover-letters and texts in diffstat section are not merged into tree
>>>> and are just archived in lore if you want to get back to it someday.
>>>>
>>>> Example of changelog in cover-letter:
>>>> https://lore.kernel.org/all/20260930200158.174118-1-b-padhi@ti.com/
>>>>
>>>> Example of changelog in patch diffstat:
>>>> https://lore.kernel.org/all/20260930200158.174118-3-b-padhi@ti.com/
>>>>
>>>> Thanks,
>>>> Beleswar
>>>>
>>>>>> Since a RFC is posted, you can drop this part of the text and just
>>>>>> mention we could switch to pm runtime calls in the future.
>>>>> Sure thing.
>>>>>
>>>>>> Here and everywhere else, can you add an empty line before return
>>>>>> statement? No hard and fast rule, but this has been followed
>>>>>> throughout the existing TI remoteproc drivers.
>>>>> No problem, I'll fix those issues.
>>>>>
>>>>> Thanks,
>>>>> Siddharth
>>>>>
>>>>> On Thu, Oct 29, 2026 at 2:03 PM Padhi, Beleswar <b-padhi@ti.com> wrote:
>>>>>> Hi Siddharth,
>>>>>>
>>>>>> On 10/14/2026 4:02 PM, Siddharth Karanam wrote:
>>>>>>> The previous version of the patch had a new header ti_sci_dev.h,
>>>>>>> that mirrors ti_sci_proc.h in terms of the struct decl and
>>>>>>> its helper function structure, with the goal of abstracting
>>>>>>> all ti_sci_handle's members like ti_sci_dev_ops from being
>>>>>>> invoked directly in the driver code.
>>>>>>>
>>>>>>> Upon discussing in the original patch thread, it seemed
>>>>>>> better to combine ti_sci_proc.h and ti_sci_dev.h's structs
>>>>>>> and merge all their helpers into a single header. That is
>>>>>>> what ti_sci_ctrl.h aims to do: It has the union of tsd
>>>>>>> (ti_sci_dev) and tsp (ti_sci_proc) and both their helper
>>>>>>> functions are prefixed with ti_sci_ctrl_dev and
>>>>>>> ti_sci_ctrl_proc respectively.
>>>>>> You can put this changelog in diffstat. We may not need this info in
>>>>>> commit message.
>>>>>>
>>>>>>> The goal of the patch is to maintain a single source
>>>>>>> of origin for all ti_sci_dev/proc_ops call sites. Any stray calls
>>>>>>> to dev_ops/proc_ops function pointer members in driver code should
>>>>>>> eventually be abstracted through this header.
>>>>>>>
>>>>>>> In the future we can try to abstract tsd's dev_ops even further
>>>>>>> through pm_runtime, but there are some roadblocks that
>>>>>> Since a RFC is posted, you can drop this part of the text and just
>>>>>> mention we could switch to pm runtime calls in the future.
>>>>>>
>>>>>>> I am unaware of, so that warranties a different patch.
>>>>>>>
>>>>>>> Signed-off-by: Siddharth Karanam <sid9.karanam@gmail.com>
>>>>>>> ---
>>>>>>>    drivers/remoteproc/ti_k3_common.c         |  17 +--
>>>>>>>    drivers/remoteproc/ti_k3_common.h         |   6 +-
>>>>>>>    drivers/remoteproc/ti_k3_dsp_remoteproc.c |  26 ++--
>>>>>>>    drivers/remoteproc/ti_k3_m4_remoteproc.c  |  24 ++-
>>>>>>>    drivers/remoteproc/ti_k3_r5_remoteproc.c  |  58 +++----
>>>>>>>    drivers/remoteproc/ti_sci_ctrl.h          | 177 ++++++++++++++++++++++
>>>>>>>    drivers/remoteproc/ti_sci_dev.h           |  82 ----------
>>>>>>>    drivers/remoteproc/ti_sci_proc.h          | 130 ----------------
>>>>>>>    8 files changed, 231 insertions(+), 289 deletions(-)
>>>>>>>    create mode 100644 drivers/remoteproc/ti_sci_ctrl.h
>>>>>>>    delete mode 100644 drivers/remoteproc/ti_sci_dev.h
>>>>>>>    delete mode 100644 drivers/remoteproc/ti_sci_proc.h
>>>>>>>
>>>>>>> diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
>>>>>>> index befa9a9bea3a..f778ae545bde 100644
>>>>>>> --- a/drivers/remoteproc/ti_k3_common.c
>>>>>>> +++ b/drivers/remoteproc/ti_k3_common.c
>>>>>>> @@ -32,8 +32,7 @@
>>>>>>>
>>>>>>>    #include "omap_remoteproc.h"
>>>>>>>    #include "remoteproc_internal.h"
>>>>>>> -#include "ti_sci_dev.h"
>>>>>>> -#include "ti_sci_proc.h"
>>>>>>> +#include "ti_sci_ctrl.h"
>>>>>>>    #include "ti_k3_common.h"
>>>>>>>
>>>>>>>    /**
>>>>>>> @@ -121,7 +120,7 @@ int k3_rproc_reset(struct k3_rproc *kproc)
>>>>>>>                if (ret)
>>>>>>>                        dev_err(dev, "local-reset assert failed (%pe)\n", ERR_PTR(ret));
>>>>>>>        } else {
>>>>>>> -             ret = ti_sci_dev_put_device(kproc->tsd);
>>>>>>> +             ret = ti_sci_ctrl_dev_put_device(kproc->tsc);
>>>>>>>                if (ret)
>>>>>>>                        dev_err(dev, "module-reset assert failed (%pe)\n", ERR_PTR(ret));
>>>>>>>        }
>>>>>>> @@ -140,11 +139,11 @@ int k3_rproc_release(struct k3_rproc *kproc)
>>>>>>>                ret = reset_control_deassert(kproc->reset);
>>>>>>>                if (ret) {
>>>>>>>                        dev_err(dev, "local-reset deassert failed, (%pe)\n", ERR_PTR(ret));
>>>>>>> -                     if (ti_sci_dev_put_device(kproc->tsd))
>>>>>>> +                     if (ti_sci_ctrl_dev_put_device(kproc->tsc))
>>>>>>>                                dev_warn(dev, "module-reset assert back failed\n");
>>>>>>>                }
>>>>>>>        } else {
>>>>>>> -             ret = ti_sci_dev_get_device(kproc->tsd);
>>>>>>> +             ret = ti_sci_ctrl_dev_get_device(kproc->tsc);
>>>>>>>                if (ret)
>>>>>>>                        dev_err(dev, "module-reset deassert failed (%pe)\n", ERR_PTR(ret));
>>>>>>>        }
>>>>>>> @@ -221,7 +220,7 @@ int k3_rproc_prepare(struct rproc *rproc)
>>>>>>>                }
>>>>>>>        }
>>>>>>>
>>>>>>> -     ret = ti_sci_dev_get_device(kproc->tsd);
>>>>>>> +     ret = ti_sci_ctrl_dev_get_device(kproc->tsc);
>>>>>>>        if (ret) {
>>>>>>>                dev_err(dev, "could not deassert module-reset for internal RAM loading\n");
>>>>>>>                return ret;
>>>>>>> @@ -250,7 +249,7 @@ int k3_rproc_unprepare(struct rproc *rproc)
>>>>>>>        if (rproc->state == RPROC_DETACHED)
>>>>>>>                return 0;
>>>>>>>
>>>>>>> -     ret = ti_sci_dev_put_device(kproc->tsd);
>>>>>>> +     ret = ti_sci_ctrl_dev_put_device(kproc->tsc);
>>>>>>>        if (ret) {
>>>>>>>                dev_err(dev, "module-reset assert failed\n");
>>>>>>>                return ret;
>>>>>>> @@ -528,9 +527,9 @@ EXPORT_SYMBOL_GPL(k3_reserved_mem_init);
>>>>>>>
>>>>>>>    void k3_release_tsp(void *data)
>>>>>> Function needs to be renamed.
>>>>>>
>>>>>>>    {
>>>>>>> -     struct ti_sci_proc *tsp = data;
>>>>>>> +     struct ti_sci_ctrl *tsc = data;
>>>>>>>
>>>>>>> -     ti_sci_proc_release(tsp);
>>>>>>> +     ti_sci_ctrl_proc_release(tsc);
>>>>>>>    }
>>>>>>>    EXPORT_SYMBOL_GPL(k3_release_tsp);
>>>>>>>
>>>>>>> diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
>>>>>>> index 7ba0903ebe0a..f4b9bb0fa0f0 100644
>>>>>>> --- a/drivers/remoteproc/ti_k3_common.h
>>>>>>> +++ b/drivers/remoteproc/ti_k3_common.h
>>>>>>> @@ -71,8 +71,7 @@ struct k3_rproc_dev_data {
>>>>>>>     * @num_rmems: number of reserved memory regions
>>>>>>>     * @reset: reset control handle
>>>>>>>     * @data: pointer to DSP-specific device data
>>>>>>> - * @tsp: TI-SCI processor control handle
>>>>>>> - * @tsd: TI-SCI device control handle
>>>>>>> + * @tsc: TI-SCI control handle
>>>>>>>     * @ti_sci: TI-SCI handle
>>>>>>>     * @mbox: mailbox channel handle
>>>>>>>     * @client: mailbox client to request the mailbox channel
>>>>>>> @@ -87,8 +86,7 @@ struct k3_rproc {
>>>>>>>        int num_rmems;
>>>>>>>        struct reset_control *reset;
>>>>>>>        const struct k3_rproc_dev_data *data;
>>>>>>> -     struct ti_sci_proc *tsp;
>>>>>>> -     struct ti_sci_dev *tsd;
>>>>>>> +     struct ti_sci_ctrl *tsc;
>>>>>>>        const struct ti_sci_handle *ti_sci;
>>>>>>>        struct mbox_chan *mbox;
>>>>>>>        struct mbox_client client;
>>>>>>> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
>>>>>>> index b6042fe7bae7..6cbf21c82e85 100644
>>>>>>> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
>>>>>>> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
>>>>>>> @@ -19,8 +19,7 @@
>>>>>>>
>>>>>>>    #include "omap_remoteproc.h"
>>>>>>>    #include "remoteproc_internal.h"
>>>>>>> -#include "ti_sci_dev.h"
>>>>>>> -#include "ti_sci_proc.h"
>>>>>>> +#include "ti_sci_ctrl.h"
>>>>>>>    #include "ti_k3_common.h"
>>>>>>>
>>>>>>>    /*
>>>>>>> @@ -45,7 +44,7 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
>>>>>>>        }
>>>>>>>
>>>>>>>        dev_dbg(dev, "booting DSP core using boot addr = 0x%x\n", boot_addr);
>>>>>>> -     ret = ti_sci_proc_set_config(kproc->tsp, boot_addr, 0, 0);
>>>>>>> +     ret = ti_sci_ctrl_proc_set_config(kproc->tsc, boot_addr, 0, 0);
>>>>>>>        if (ret)
>>>>>>>                return ret;
>>>>>>>
>>>>>>> @@ -115,22 +114,17 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
>>>>>>>                return dev_err_probe(dev, PTR_ERR(kproc->reset),
>>>>>>>                                     "failed to get reset\n");
>>>>>>>
>>>>>>> -     kproc->tsp = ti_sci_proc_of_get_tsp(dev, kproc->ti_sci);
>>>>>>> -     if (IS_ERR(kproc->tsp))
>>>>>>> -             return dev_err_probe(dev, PTR_ERR(kproc->tsp),
>>>>>>> -                                  "failed to construct ti-sci proc control\n");
>>>>>>> +     kproc->tsc = ti_sci_ctrl_of_get(dev, kproc->ti_sci);
>>>>>>> +     if (IS_ERR(kproc->tsc))
>>>>>>> +             return dev_err_probe(dev, PTR_ERR(kproc->tsc),
>>>>>>> +                                  "failed to get construct ti-sci control\n");
>>>>>>>
>>>>>>> -     kproc->tsd = ti_sci_dev_of_get_tsd(dev, kproc->ti_sci);
>>>>>>> -     if (IS_ERR(kproc->tsd))
>>>>>>> -             return dev_err_probe(dev, PTR_ERR(kproc->tsd),
>>>>>>> -                                  "failed to construct ti-sci dev control\n");
>>>>>>> -
>>>>>>> -     ret = ti_sci_proc_request(kproc->tsp);
>>>>>>> +     ret = ti_sci_ctrl_proc_request(kproc->tsc);
>>>>>>>        if (ret < 0) {
>>>>>>> -             dev_err_probe(dev, ret, "ti_sci_proc_request failed\n");
>>>>>>> +             dev_err_probe(dev, ret, "ti_sci_ctrl_proc_request failed\n");
>>>>>>>                return ret;
>>>>>>>        }
>>>>>>> -     ret = devm_add_action_or_reset(dev, k3_release_tsp, kproc->tsp);
>>>>>>> +     ret = devm_add_action_or_reset(dev, k3_release_tsp, kproc->tsc);
>>>>>>>        if (ret)
>>>>>>>                return ret;
>>>>>>>
>>>>>>> @@ -142,7 +136,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
>>>>>>>        if (ret)
>>>>>>>                return dev_err_probe(dev, ret, "reserved memory init failed\n");
>>>>>>>
>>>>>>> -     ret = ti_sci_dev_is_on(kproc->tsd, NULL, &p_state);
>>>>>>> +     ret = ti_sci_ctrl_dev_is_on(kproc->tsc, NULL, &p_state);
>>>>>>>        if (ret)
>>>>>>>                return dev_err_probe(dev, ret, "failed to get initial state, mode cannot be determined\n");
>>>>>>>
>>>>>>> diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
>>>>>>> index ddf8cb9974ca..9c789a92d083 100644
>>>>>>> --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
>>>>>>> +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
>>>>>>> @@ -18,8 +18,7 @@
>>>>>>>
>>>>>>>    #include "omap_remoteproc.h"
>>>>>>>    #include "remoteproc_internal.h"
>>>>>>> -#include "ti_sci_dev.h"
>>>>>>> -#include "ti_sci_proc.h"
>>>>>>> +#include "ti_sci_ctrl.h"
>>>>>>>    #include "ti_k3_common.h"
>>>>>>>
>>>>>>>    static const struct rproc_ops k3_m4_rproc_ops = {
>>>>>>> @@ -75,20 +74,15 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
>>>>>>>        if (IS_ERR(kproc->reset))
>>>>>>>                return dev_err_probe(dev, PTR_ERR(kproc->reset), "failed to get reset\n");
>>>>>>>
>>>>>>> -     kproc->tsp = ti_sci_proc_of_get_tsp(dev, kproc->ti_sci);
>>>>>>> -     if (IS_ERR(kproc->tsp))
>>>>>>> -             return dev_err_probe(dev, PTR_ERR(kproc->tsp),
>>>>>>> -                                  "failed to construct ti-sci proc control\n");
>>>>>>> +     kproc->tsc = ti_sci_ctrl_of_get(dev, kproc->ti_sci);
>>>>>>> +     if (IS_ERR(kproc->tsc))
>>>>>>> +             return dev_err_probe(dev, PTR_ERR(kproc->tsc),
>>>>>>> +                                  "failed to construct ti-sci control\n");
>>>>>>>
>>>>>>> -     kproc->tsd = ti_sci_dev_of_get_tsd(dev, kproc->ti_sci);
>>>>>>> -     if (IS_ERR(kproc->tsd))
>>>>>>> -             return dev_err_probe(dev, PTR_ERR(kproc->tsd),
>>>>>>> -                                  "failed to construct ti-sci dev control\n");
>>>>>>> -
>>>>>>> -     ret = ti_sci_proc_request(kproc->tsp);
>>>>>>> +     ret = ti_sci_ctrl_proc_request(kproc->tsc);
>>>>>>>        if (ret < 0)
>>>>>>> -             return dev_err_probe(dev, ret, "ti_sci_proc_request failed\n");
>>>>>>> -     ret = devm_add_action_or_reset(dev, k3_release_tsp, kproc->tsp);
>>>>>>> +             return dev_err_probe(dev, ret, "ti_sci_ctrl_proc_request failed\n");
>>>>>>> +     ret = devm_add_action_or_reset(dev, k3_release_tsp, kproc->tsc);
>>>>>>>        if (ret)
>>>>>>>                return ret;
>>>>>>>
>>>>>>> @@ -100,7 +94,7 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
>>>>>>>        if (ret)
>>>>>>>                return dev_err_probe(dev, ret, "reserved memory init failed\n");
>>>>>>>
>>>>>>> -     ret = ti_sci_dev_is_on(kproc->tsd, &r_state, &p_state);
>>>>>>> +     ret = ti_sci_ctrl_dev_is_on(kproc->tsc, &r_state, &p_state);
>>>>>>>        if (ret)
>>>>>>>                return dev_err_probe(dev, ret,
>>>>>>>                                     "failed to get initial state, mode cannot be determined\n");
>>>>>>> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>>>>>>> index a387848ac400..caeeb18581d0 100644
>>>>>>> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
>>>>>>> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>>>>>>> @@ -25,8 +25,7 @@
>>>>>>>
>>>>>>>    #include "omap_remoteproc.h"
>>>>>>>    #include "remoteproc_internal.h"
>>>>>>> -#include "ti_sci_dev.h"
>>>>>>> -#include "ti_sci_proc.h"
>>>>>>> +#include "ti_sci_ctrl.h"
>>>>>>>    #include "ti_k3_common.h"
>>>>>>>
>>>>>>>    /* This address can either be for ATCM or BTCM with the other at address 0x0 */
>>>>>>> @@ -141,7 +140,7 @@ static int k3_r5_split_reset(struct k3_rproc *kproc)
>>>>>>>                return ret;
>>>>>>>        }
>>>>>>>
>>>>>>> -     ret = ti_sci_dev_put_device(kproc->tsd);
>>>>>>> +     ret = ti_sci_ctrl_dev_put_device(kproc->tsc);
>>>>>>>        if (ret) {
>>>>>>>                dev_err(kproc->dev, "module-reset assert failed, ret = %d\n",
>>>>>>>                        ret);
>>>>>>> @@ -156,7 +155,7 @@ static int k3_r5_split_release(struct k3_rproc *kproc)
>>>>>>>    {
>>>>>>>        int ret;
>>>>>>>
>>>>>>> -     ret = ti_sci_dev_get_device(kproc->tsd);
>>>>>>> +     ret = ti_sci_ctrl_dev_get_device(kproc->tsc);
>>>>>>>        if (ret) {
>>>>>>>                dev_err(kproc->dev, "module-reset deassert failed, ret = %d\n",
>>>>>>>                        ret);
>>>>>>> @@ -167,7 +166,7 @@ static int k3_r5_split_release(struct k3_rproc *kproc)
>>>>>>>        if (ret) {
>>>>>>>                dev_err(kproc->dev, "local-reset deassert failed, ret = %d\n",
>>>>>>>                        ret);
>>>>>>> -             if (ti_sci_dev_put_device(kproc->tsd))
>>>>>>> +             if (ti_sci_ctrl_dev_put_device(kproc->tsc))
>>>>>>>                        dev_warn(kproc->dev, "module-reset assert back failed\n");
>>>>>>>        }
>>>>>>>
>>>>>>> @@ -194,7 +193,7 @@ static int k3_r5_lockstep_reset(struct k3_r5_cluster *cluster)
>>>>>>>        /* disable PSC modules on all applicable cores */
>>>>>>>        list_for_each_entry(core, &cluster->cores, elem) {
>>>>>>>                kproc = core->kproc;
>>>>>>> -             ret = ti_sci_dev_put_device(kproc->tsd);
>>>>>>> +             ret = ti_sci_ctrl_dev_put_device(kproc->tsc);
>>>>>>>                if (ret) {
>>>>>>>                        dev_err(core->dev, "module-reset assert failed, ret = %d\n",
>>>>>>>                                ret);
>>>>>>> @@ -207,7 +206,7 @@ static int k3_r5_lockstep_reset(struct k3_r5_cluster *cluster)
>>>>>>>    unroll_module_reset:
>>>>>>>        list_for_each_entry_continue_reverse(core, &cluster->cores, elem) {
>>>>>>>                kproc = core->kproc;
>>>>>>> -             if (ti_sci_dev_put_device(kproc->tsd))
>>>>>>> +             if (ti_sci_ctrl_dev_put_device(kproc->tsc))
>>>>>>>                        dev_warn(core->dev, "module-reset assert back failed\n");
>>>>>>>        }
>>>>>>>        core = list_last_entry(&cluster->cores, struct k3_r5_core, elem);
>>>>>>> @@ -229,7 +228,7 @@ static int k3_r5_lockstep_release(struct k3_r5_cluster *cluster)
>>>>>>>        /* enable PSC modules on all applicable cores */
>>>>>>>        list_for_each_entry_reverse(core, &cluster->cores, elem) {
>>>>>>>                kproc = core->kproc;
>>>>>>> -             ret = ti_sci_dev_get_device(kproc->tsd);
>>>>>>> +             ret = ti_sci_ctrl_dev_get_device(kproc->tsc);
>>>>>>>                if (ret) {
>>>>>>>                        dev_err(core->dev, "module-reset deassert failed, ret = %d\n",
>>>>>>>                                ret);
>>>>>>> @@ -259,7 +258,7 @@ static int k3_r5_lockstep_release(struct k3_r5_cluster *cluster)
>>>>>>>    unroll_module_reset:
>>>>>>>        list_for_each_entry_from(core, &cluster->cores, elem) {
>>>>>>>                kproc = core->kproc;
>>>>>>> -             if (ti_sci_dev_put_device(kproc->tsd))
>>>>>>> +             if (ti_sci_ctrl_dev_put_device(kproc->tsc))
>>>>>>>                        dev_warn(core->dev, "module-reset assert back failed\n");
>>>>>>>        }
>>>>>>>
>>>>>>> @@ -268,13 +267,13 @@ static int k3_r5_lockstep_release(struct k3_r5_cluster *cluster)
>>>>>>>
>>>>>>>    static inline int k3_r5_core_halt(struct k3_rproc *kproc)
>>>>>>>    {
>>>>>>> -     return ti_sci_proc_set_control(kproc->tsp,
>>>>>>> +     return ti_sci_ctrl_proc_set_control(kproc->tsc,
>>>>>>>                                       PROC_BOOT_CTRL_FLAG_R5_CORE_HALT, 0);
>>>>>>>    }
>>>>>>>
>>>>>>>    static inline int k3_r5_core_run(struct k3_rproc *kproc)
>>>>>>>    {
>>>>>>> -     return ti_sci_proc_set_control(kproc->tsp,
>>>>>>> +     return ti_sci_ctrl_proc_set_control(kproc->tsc,
>>>>>>>                                       0, PROC_BOOT_CTRL_FLAG_R5_CORE_HALT);
>>>>>>>    }
>>>>>>>
>>>>>>> @@ -328,7 +327,7 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
>>>>>>>                }
>>>>>>>        }
>>>>>>>
>>>>>>> -     ret = ti_sci_proc_get_status(kproc->tsp, &boot_vec, &cfg, &ctrl, &stat);
>>>>>>> +     ret = ti_sci_ctrl_proc_get_status(kproc->tsc, &boot_vec, &cfg, &ctrl, &stat);
>>>>>>>        if (ret < 0)
>>>>>>>                return ret;
>>>>>>>        mem_init_dis = !!(cfg & PROC_BOOT_CFG_FLAG_R5_MEM_INIT_DIS);
>>>>>>> @@ -469,7 +468,7 @@ static int k3_r5_rproc_start(struct rproc *rproc)
>>>>>>>        dev_dbg(dev, "booting R5F core using boot addr = 0x%x\n", boot_addr);
>>>>>>>
>>>>>>>        /* boot vector need not be programmed for Core1 in LockStep mode */
>>>>>>> -     ret = ti_sci_proc_set_config(kproc->tsp, boot_addr, 0, 0);
>>>>>>> +     ret = ti_sci_ctrl_proc_set_config(kproc->tsc, boot_addr, 0, 0);
>>>>>>>        if (ret)
>>>>>>>                return ret;
>>>>>>>
>>>>>>> @@ -612,7 +611,7 @@ static const struct rproc_ops k3_r5_rproc_ops = {
>>>>>>>     * by the System Processor.
>>>>>>>     *
>>>>>>>     * This function is used to pre-configure these settings for each R5F core, and
>>>>>>> - * the configuration is all done through various ti_sci_proc functions that
>>>>>>> + * the configuration is all done through various ti_sci_ctrl functions that
>>>>>>>     * communicate with the System Processor. The function also ensures that both
>>>>>>>     * the cores are halted before the .prepare() step.
>>>>>>>     *
>>>>>>> @@ -654,7 +653,7 @@ static int k3_r5_rproc_configure(struct k3_rproc *kproc)
>>>>>>>                core = kproc->priv;
>>>>>>>        }
>>>>>>>
>>>>>>> -     ret = ti_sci_proc_get_status(core->kproc->tsp, &boot_vec, &cfg, &ctrl,
>>>>>>> +     ret = ti_sci_ctrl_proc_get_status(core->kproc->tsc, &boot_vec, &cfg, &ctrl,
>>>>>>>                                     &stat);
>>>>>> Here and everywhere else, fix the parantheses alignment:
>>>>>>
>>>>>> 258 +CHECK: Alignment should match open parenthesis
>>>>>> 259 +#374: FILE: drivers/remoteproc/ti_k3_r5_remoteproc.c:652:
>>>>>> 260 ++      ret = ti_sci_ctrl_proc_get_status(core->kproc->tsc,
>>>>>> &boot_vec, &cfg, &ctrl,
>>>>>> 261 +                                    &stat);
>>>>>>
>>>>>>>        if (ret < 0)
>>>>>>>                return ret;
>>>>>>> @@ -732,7 +731,7 @@ static int k3_r5_rproc_configure(struct k3_rproc *kproc)
>>>>>>>                                clr_cfg &= ~PROC_BOOT_CFG_FLAG_R5_LOCKSTEP;
>>>>>>>                                clr_cfg &= ~PROC_BOOT_CFG_FLAG_R5_TEINIT;
>>>>>>>                        }
>>>>>>> -                     ret = ti_sci_proc_set_config(temp->kproc->tsp, boot_vec,
>>>>>>> +                     ret = ti_sci_ctrl_proc_set_config(temp->kproc->tsc, boot_vec,
>>>>>>>                                                     set_cfg, clr_cfg);
>>>>>>>                        if (ret)
>>>>>>>                                goto out;
>>>>>>> @@ -740,14 +739,14 @@ static int k3_r5_rproc_configure(struct k3_rproc *kproc)
>>>>>>>
>>>>>>>                set_cfg = PROC_BOOT_CFG_FLAG_R5_LOCKSTEP;
>>>>>>>                clr_cfg = 0;
>>>>>>> -             ret = ti_sci_proc_set_config(core->kproc->tsp, boot_vec,
>>>>>>> +             ret = ti_sci_ctrl_proc_set_config(core->kproc->tsc, boot_vec,
>>>>>>>                                             set_cfg, clr_cfg);
>>>>>>>        } else {
>>>>>>>                ret = k3_r5_core_halt(core->kproc);
>>>>>>>                if (ret)
>>>>>>>                        goto out;
>>>>>>>
>>>>>>> -             ret = ti_sci_proc_set_config(core->kproc->tsp, boot_vec,
>>>>>>> +             ret = ti_sci_ctrl_proc_set_config(core->kproc->tsc, boot_vec,
>>>>>>>                                             set_cfg, clr_cfg);
>>>>>>>        }
>>>>>>>
>>>>>>> @@ -821,7 +820,7 @@ static int k3_r5_rproc_configure_mode(struct k3_rproc *kproc)
>>>>>>>
>>>>>>>        core0 = list_first_entry(&cluster->cores, struct k3_r5_core, elem);
>>>>>>>
>>>>>>> -     ret = ti_sci_dev_is_on(kproc->tsd, &r_state, &c_state);
>>>>>>> +     ret = ti_sci_ctrl_dev_is_on(kproc->tsc, &r_state, &c_state);
>>>>>>>        if (ret) {
>>>>>>>                dev_err(cdev, "failed to get initial state, mode cannot be determined, ret = %d\n",
>>>>>>>                        ret);
>>>>>>> @@ -845,7 +844,7 @@ static int k3_r5_rproc_configure_mode(struct k3_rproc *kproc)
>>>>>>>         */
>>>>>>>        core->released_from_reset = c_state;
>>>>>>>
>>>>>>> -     ret = ti_sci_proc_get_status(kproc->tsp, &boot_vec, &cfg, &ctrl,
>>>>>>> +     ret = ti_sci_ctrl_proc_get_status(kproc->tsc, &boot_vec, &cfg, &ctrl,
>>>>>>>                                     &stat);
>>>>>>>        if (ret < 0) {
>>>>>>>                dev_err(cdev, "failed to get initial processor status, ret = %d\n",
>>>>>>> @@ -1065,17 +1064,10 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>>>>>>>                        goto out;
>>>>>>>                }
>>>>>>>
>>>>>>> -             kproc->tsp = ti_sci_proc_of_get_tsp(cdev, kproc->ti_sci);
>>>>>>> -             if (IS_ERR(kproc->tsp)) {
>>>>>>> -                     ret = dev_err_probe(cdev, PTR_ERR(kproc->tsp),
>>>>>>> -                                         "failed to construct ti-sci proc control\n");
>>>>>>> -                     goto out;
>>>>>>> -             }
>>>>>>> -
>>>>>>> -             kproc->tsd = ti_sci_dev_of_get_tsd(cdev, kproc->ti_sci);
>>>>>>> -             if (IS_ERR(kproc->tsd)) {
>>>>>>> -                     ret = dev_err_probe(cdev, PTR_ERR(kproc->tsd),
>>>>>>> -                                         "failed to construct ti-sci dev control\n");
>>>>>>> +             kproc->tsc = ti_sci_ctrl_of_get(cdev, kproc->ti_sci);
>>>>>>> +             if (IS_ERR(kproc->tsc)) {
>>>>>>> +                     ret = dev_err_probe(cdev, PTR_ERR(kproc->tsc),
>>>>>>> +                                         "failed to construct ti-sci control\n");
>>>>>>>                        goto out;
>>>>>>>                }
>>>>>>>
>>>>>>> @@ -1086,13 +1078,13 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>>>>>>>                        goto out;
>>>>>>>                }
>>>>>>>
>>>>>>> -             ret = ti_sci_proc_request(kproc->tsp);
>>>>>>> +             ret = ti_sci_ctrl_proc_request(kproc->tsc);
>>>>>>>                if (ret < 0) {
>>>>>>>                        dev_err(cdev, "ti_sci_proc_request failed, ret = %d\n", ret);
>>>>>> s/ti_sci_proc_request/ti_sci_ctrl_proc_request
>>>>>>
>>>>>>>                        goto out;
>>>>>>>                }
>>>>>>>
>>>>>>> -             ret = devm_add_action_or_reset(cdev, k3_release_tsp, kproc->tsp);
>>>>>>> +             ret = devm_add_action_or_reset(cdev, k3_release_tsp, kproc->tsc);
>>>>>>>                if (ret)
>>>>>>>                        goto out;
>>>>>>>        }
>>>>>>> diff --git a/drivers/remoteproc/ti_sci_ctrl.h b/drivers/remoteproc/ti_sci_ctrl.h
>>>>>>> new file mode 100644
>>>>>>> index 000000000000..76aee8c5317a
>>>>>>> --- /dev/null
>>>>>>> +++ b/drivers/remoteproc/ti_sci_ctrl.h
>>>>>>> @@ -0,0 +1,177 @@
>>>>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>>>>> +/*
>>>>>>> + * Texas Instruments TI-SCI Processor Controller Helper Functions
>>>>>> Processor and Device
>>>>>>
>>>>>>> + *
>>>>>>> + * Copyright (C) 2018-2026 Texas Instruments Incorporated - https://www.ti.com/
>>>>>>> + *   Suman Anna <s-anna@ti.com>
>>>>>>> + */
>>>>>>> +
>>>>>>> +#ifndef REMOTEPROC_TI_SCI_CTRL_H
>>>>>>> +#define REMOTEPROC_TI_SCI_CTRL_H
>>>>>>> +
>>>>>>> +#include <linux/of.h>
>>>>>>> +#include <linux/soc/ti/ti_sci_protocol.h>
>>>>>>> +
>>>>>>> +/**
>>>>>>> + * struct ti_sci_ctrl - structure representing a remoteproc control client
>>>>>>> + * @sci: cached TI-SCI protocol handle
>>>>>>> + * @dev: cached client device pointer
>>>>>>> + * @dev_ops: cached TI-SCI device ops
>>>>>>> + * @proc_ops: cached TI-SCI proc ops
>>>>>>> + * @dev_id: TI-SCI device id for the consumer remoteproc device
>>>>>>> + * @proc_id: processor id for the consumer remoteproc device
>>>>>>> + * @host_id: host id to pass the control over for this consumer remoteproc
>>>>>>> + *        device
>>>>>>> + */
>>>>>>> +struct ti_sci_ctrl {
>>>>>>> +     const struct ti_sci_handle *sci;
>>>>>>> +     struct device *dev;
>>>>>>> +     const struct ti_sci_dev_ops *dev_ops;
>>>>>>> +     const struct ti_sci_proc_ops *proc_ops;
>>>>>>> +     u32 dev_id;
>>>>>>> +     u8 proc_id;
>>>>>>> +     u8 host_id;
>>>>>>> +};
>>>>>>> +
>>>>>>> +static inline
>>>>>>> +struct ti_sci_ctrl *ti_sci_ctrl_of_get(struct device *dev,
>>>>>>> +                                    const struct ti_sci_handle *sci)
>>>>>>> +{
>>>>>>> +     struct ti_sci_ctrl *tsc;
>>>>>>> +     u32 proc_ids[2];
>>>>>>> +     int ret;
>>>>>>> +
>>>>>>> +     tsc = devm_kzalloc(dev, sizeof(*tsc), GFP_KERNEL);
>>>>>>> +     if (!tsc)
>>>>>>> +             return ERR_PTR(-ENOMEM);
>>>>>>> +
>>>>>>> +     ret = of_property_read_u32(dev_of_node(dev), "ti,sci-dev-id",
>>>>>>> +                                &tsc->dev_id);
>>>>>>> +     if (ret < 0)
>>>>>>> +             return ERR_PTR(ret);
>>>>>>> +
>>>>>>> +     ret = of_property_read_u32_array(dev_of_node(dev), "ti,sci-proc-ids",
>>>>>>> +                                      proc_ids, 2);
>>>>>>> +     if (ret < 0)
>>>>>>> +             return ERR_PTR(ret);
>>>>>>> +
>>>>>>> +     tsc->dev = dev;
>>>>>>> +     tsc->sci = sci;
>>>>>>> +     tsc->dev_ops = &sci->ops.dev_ops;
>>>>>>> +     tsc->proc_ops = &sci->ops.proc_ops;
>>>>>>> +     tsc->proc_id = proc_ids[0];
>>>>>>> +     tsc->host_id = proc_ids[1];
>>>>>>> +
>>>>>>> +     return tsc;
>>>>>>> +}
>>>>>>> +
>>>>>>> +/* Power-management helper functions */
>>>>>>> +static inline int ti_sci_ctrl_dev_is_on(struct ti_sci_ctrl *tsc, bool *r_state,
>>>>>>> +                                 bool *c_state)
>>>>>>> +{
>>>>>>> +     int ret;
>>>>>>> +
>>>>>>> +     ret = tsc->dev_ops->is_on(tsc->sci, tsc->dev_id, r_state, c_state);
>>>>>>> +     if (ret)
>>>>>>> +             dev_err(tsc->dev, "ti-sci device is_on failed: %d\n", ret);
>>>>>>> +     return ret;
>>>>>>> +}
>>>>>>> +
>>>>>>> +/* Request power on to rproc */
>>>>>>> +static inline int ti_sci_ctrl_dev_get_device(struct ti_sci_ctrl *tsc)
>>>>>>> +{
>>>>>>> +     int ret = 0;
>>>>>> Initialization not needed.
>>>>>>
>>>>>>> +
>>>>>>> +     ret = tsc->dev_ops->get_device(tsc->sci, tsc->dev_id);
>>>>>>> +     if (ret)
>>>>>>> +             dev_err(tsc->dev, "ti-sci device get failed: %d\n", ret);
>>>>>>> +     return ret;
>>>>>>> +}
>>>>>>> +
>>>>>>> +/* Request power off to a rproc */
>>>>>>> +static inline int ti_sci_ctrl_dev_put_device(struct ti_sci_ctrl *tsc)
>>>>>>> +{
>>>>>>> +     int ret = 0;
>>>>>> Initialization not needed.
>>>>>>
>>>>>>> +
>>>>>>> +     ret = tsc->dev_ops->put_device(tsc->sci, tsc->dev_id);
>>>>>>> +     if (ret)
>>>>>>> +             dev_err(tsc->dev, "ti-sci device put failed: %d\n", ret);
>>>>>>> +     return ret;
>>>>>>> +}
>>>>>>> +
>>>>>>> +/* Processor control helper functions */
>>>>>>> +static inline int ti_sci_ctrl_proc_request(struct ti_sci_ctrl *tsc)
>>>>>>> +{
>>>>>>> +     int ret;
>>>>>>> +
>>>>>>> +     ret = tsc->proc_ops->request(tsc->sci, tsc->proc_id);
>>>>>>> +     if (ret)
>>>>>>> +             dev_err(tsc->dev, "ti-sci processor request failed: %d\n",
>>>>>>> +                     ret);
>>>>>> Here and everywhere else, can you add an empty line before return
>>>>>> statement? No hard and fast rule, but this has been followed
>>>>>> throughout the existing TI remoteproc drivers.
>>>>>>
>>>>>> Thanks,
>>>>>> Beleswar
>>>>>>
>>>>>>> +     return ret;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static inline int ti_sci_ctrl_proc_release(struct ti_sci_ctrl *tsc)
>>>>>>> +{
>>>>>>> +     int ret;
>>>>>>> +
>>>>>>> +     ret = tsc->proc_ops->release(tsc->sci, tsc->proc_id);
>>>>>>> +     if (ret)
>>>>>>> +             dev_err(tsc->dev, "ti-sci processor release failed: %d\n",
>>>>>>> +                     ret);
>>>>>>> +     return ret;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static inline int ti_sci_ctrl_proc_handover(struct ti_sci_ctrl *tsc)
>>>>>>> +{
>>>>>>> +     int ret;
>>>>>>> +
>>>>>>> +     ret = tsc->proc_ops->handover(tsc->sci, tsc->proc_id, tsc->host_id);
>>>>>>> +     if (ret)
>>>>>>> +             dev_err(tsc->dev, "ti-sci processor handover of %d to %d failed: %d\n",
>>>>>>> +                     tsc->proc_id, tsc->host_id, ret);
>>>>>>> +     return ret;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static inline int ti_sci_ctrl_proc_set_config(struct ti_sci_ctrl *tsc,
>>>>>>> +                                      u64 boot_vector,
>>>>>>> +                                      u32 cfg_set, u32 cfg_clr)
>>>>>>> +{
>>>>>>> +     int ret;
>>>>>>> +
>>>>>>> +     ret = tsc->proc_ops->set_config(tsc->sci, tsc->proc_id, boot_vector,
>>>>>>> +                                     cfg_set, cfg_clr);
>>>>>>> +     if (ret)
>>>>>>> +             dev_err(tsc->dev, "ti-sci processor set_config failed: %d\n",
>>>>>>> +                     ret);
>>>>>>> +     return ret;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static inline int ti_sci_ctrl_proc_set_control(struct ti_sci_ctrl *tsc,
>>>>>>> +                                       u32 ctrl_set, u32 ctrl_clr)
>>>>>>> +{
>>>>>>> +     int ret;
>>>>>>> +
>>>>>>> +     ret = tsc->proc_ops->set_control(tsc->sci, tsc->proc_id, ctrl_set,
>>>>>>> +                                      ctrl_clr);
>>>>>>> +     if (ret)
>>>>>>> +             dev_err(tsc->dev, "ti-sci processor set_control failed: %d\n",
>>>>>>> +                     ret);
>>>>>>> +     return ret;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static inline int ti_sci_ctrl_proc_get_status(struct ti_sci_ctrl *tsc,
>>>>>>> +                                      u64 *boot_vector, u32 *cfg_flags,
>>>>>>> +                                      u32 *ctrl_flags, u32 *status_flags)
>>>>>>> +{
>>>>>>> +     int ret;
>>>>>>> +
>>>>>>> +     ret = tsc->proc_ops->get_status(tsc->sci, tsc->proc_id, boot_vector,
>>>>>>> +                                     cfg_flags, ctrl_flags, status_flags);
>>>>>>> +     if (ret)
>>>>>>> +             dev_err(tsc->dev, "ti-sci processor get_status failed: %d\n",
>>>>>>> +                     ret);
>>>>>>> +     return ret;
>>>>>>> +}
>>>>>>> +
>>>>>>> +#endif /* REMOTEPROC_TI_SCI_CTRL_H */
>>>>>>> diff --git a/drivers/remoteproc/ti_sci_dev.h b/drivers/remoteproc/ti_sci_dev.h
>>>>>>> deleted file mode 100644
>>>>>>> index 897998a97d7f..000000000000
>>>>>>> --- a/drivers/remoteproc/ti_sci_dev.h
>>>>>>> +++ /dev/null
>>>>>>> @@ -1,82 +0,0 @@
>>>>>>> -/* SPDX-License-Identifier: GPL-2.0-only */
>>>>>>> -/*
>>>>>>> - * Texas Instruments TI-SCI Device Controller Helper Functions
>>>>>>> - *
>>>>>>> - * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
>>>>>>> - */
>>>>>>> -
>>>>>>> -#ifndef REMOTEPROC_TI_SCI_DEV_H
>>>>>>> -#define REMOTEPROC_TI_SCI_DEV_H
>>>>>>> -
>>>>>>> -#include <linux/soc/ti/ti_sci_protocol.h>
>>>>>>> -#include <linux/pm_runtime.h>
>>>>>>> -
>>>>>>> -/**
>>>>>>> - * struct ti_sci_dev - structure representing a device control client
>>>>>>> - * @sci: cached TI-SCI protocol handle
>>>>>>> - * @ops: cached TI-SCI device ops
>>>>>>> - * @dev: cached client device pointer
>>>>>>> - * @dev_id: TI-SCI device id for the consumer remoteproc device
>>>>>>> - */
>>>>>>> -struct ti_sci_dev {
>>>>>>> -     const struct ti_sci_handle *sci;
>>>>>>> -     const struct ti_sci_dev_ops *ops;
>>>>>>> -     struct device *dev;
>>>>>>> -     u32 dev_id;
>>>>>>> -};
>>>>>>> -
>>>>>>> -static inline
>>>>>>> -struct ti_sci_dev *ti_sci_dev_of_get_tsd(struct device *dev,
>>>>>>> -                                      const struct ti_sci_handle *sci)
>>>>>>> -{
>>>>>>> -     struct ti_sci_dev *tsd;
>>>>>>> -     int ret;
>>>>>>> -
>>>>>>> -     tsd = devm_kzalloc(dev, sizeof(*tsd), GFP_KERNEL);
>>>>>>> -     if (!tsd)
>>>>>>> -             return ERR_PTR(-ENOMEM);
>>>>>>> -
>>>>>>> -     ret = of_property_read_u32(dev_of_node(dev), "ti,sci-dev-id",
>>>>>>> -                                &tsd->dev_id);
>>>>>>> -     if (ret < 0)
>>>>>>> -             return ERR_PTR(ret);
>>>>>>> -
>>>>>>> -     tsd->dev = dev;
>>>>>>> -     tsd->sci = sci;
>>>>>>> -     tsd->ops = &sci->ops.dev_ops;
>>>>>>> -
>>>>>>> -     return tsd;
>>>>>>> -}
>>>>>>> -
>>>>>>> -static inline int ti_sci_dev_is_on(struct ti_sci_dev *tsd, bool *r_state,
>>>>>>> -                                bool *c_state)
>>>>>>> -{
>>>>>>> -     int ret;
>>>>>>> -
>>>>>>> -     ret = tsd->ops->is_on(tsd->sci, tsd->dev_id, r_state, c_state);
>>>>>>> -     if (ret)
>>>>>>> -             dev_err(tsd->dev, "ti-sci device is_on failed: %d\n", ret);
>>>>>>> -     return ret;
>>>>>>> -}
>>>>>>> -
>>>>>>> -static inline int ti_sci_dev_get_device(struct ti_sci_dev *tsd)
>>>>>>> -{
>>>>>>> -     int ret;
>>>>>>> -
>>>>>>> -     ret = tsd->ops->get_device(tsd->sci, tsd->dev_id);
>>>>>>> -     if (ret)
>>>>>>> -             dev_err(tsd->dev, "ti-sci device get failed: %d\n", ret);
>>>>>>> -     return ret;
>>>>>>> -}
>>>>>>> -
>>>>>>> -static inline int ti_sci_dev_put_device(struct ti_sci_dev *tsd)
>>>>>>> -{
>>>>>>> -     int ret;
>>>>>>> -
>>>>>>> -     ret = tsd->ops->put_device(tsd->sci, tsd->dev_id);
>>>>>>> -     if (ret)
>>>>>>> -             dev_err(tsd->dev, "ti-sci device put failed: %d\n", ret);
>>>>>>> -     return ret;
>>>>>>> -}
>>>>>>> -
>>>>>>> -#endif /* REMOTEPROC_TI_SCI_DEV_H */
>>>>>>> diff --git a/drivers/remoteproc/ti_sci_proc.h b/drivers/remoteproc/ti_sci_proc.h
>>>>>>> deleted file mode 100644
>>>>>>> index f3911ce75252..000000000000
>>>>>>> --- a/drivers/remoteproc/ti_sci_proc.h
>>>>>>> +++ /dev/null
>>>>>>> @@ -1,130 +0,0 @@
>>>>>>> -/* SPDX-License-Identifier: GPL-2.0-only */
>>>>>>> -/*
>>>>>>> - * Texas Instruments TI-SCI Processor Controller Helper Functions
>>>>>>> - *
>>>>>>> - * Copyright (C) 2018-2020 Texas Instruments Incorporated - https://www.ti.com/
>>>>>>> - *   Suman Anna <s-anna@ti.com>
>>>>>>> - */
>>>>>>> -
>>>>>>> -#ifndef REMOTEPROC_TI_SCI_PROC_H
>>>>>>> -#define REMOTEPROC_TI_SCI_PROC_H
>>>>>>> -
>>>>>>> -#include <linux/soc/ti/ti_sci_protocol.h>
>>>>>>> -
>>>>>>> -/**
>>>>>>> - * struct ti_sci_proc - structure representing a processor control client
>>>>>>> - * @sci: cached TI-SCI protocol handle
>>>>>>> - * @ops: cached TI-SCI proc ops
>>>>>>> - * @dev: cached client device pointer
>>>>>>> - * @proc_id: processor id for the consumer remoteproc device
>>>>>>> - * @host_id: host id to pass the control over for this consumer remoteproc
>>>>>>> - *        device
>>>>>>> - */
>>>>>>> -struct ti_sci_proc {
>>>>>>> -     const struct ti_sci_handle *sci;
>>>>>>> -     const struct ti_sci_proc_ops *ops;
>>>>>>> -     struct device *dev;
>>>>>>> -     u8 proc_id;
>>>>>>> -     u8 host_id;
>>>>>>> -};
>>>>>>> -
>>>>>>> -static inline
>>>>>>> -struct ti_sci_proc *ti_sci_proc_of_get_tsp(struct device *dev,
>>>>>>> -                                        const struct ti_sci_handle *sci)
>>>>>>> -{
>>>>>>> -     struct ti_sci_proc *tsp;
>>>>>>> -     u32 temp[2];
>>>>>>> -     int ret;
>>>>>>> -
>>>>>>> -     ret = of_property_read_u32_array(dev_of_node(dev), "ti,sci-proc-ids",
>>>>>>> -                                      temp, 2);
>>>>>>> -     if (ret < 0)
>>>>>>> -             return ERR_PTR(ret);
>>>>>>> -
>>>>>>> -     tsp = devm_kzalloc(dev, sizeof(*tsp), GFP_KERNEL);
>>>>>>> -     if (!tsp)
>>>>>>> -             return ERR_PTR(-ENOMEM);
>>>>>>> -
>>>>>>> -     tsp->dev = dev;
>>>>>>> -     tsp->sci = sci;
>>>>>>> -     tsp->ops = &sci->ops.proc_ops;
>>>>>>> -     tsp->proc_id = temp[0];
>>>>>>> -     tsp->host_id = temp[1];
>>>>>>> -
>>>>>>> -     return tsp;
>>>>>>> -}
>>>>>>> -
>>>>>>> -static inline int ti_sci_proc_request(struct ti_sci_proc *tsp)
>>>>>>> -{
>>>>>>> -     int ret;
>>>>>>> -
>>>>>>> -     ret = tsp->ops->request(tsp->sci, tsp->proc_id);
>>>>>>> -     if (ret)
>>>>>>> -             dev_err(tsp->dev, "ti-sci processor request failed: %d\n",
>>>>>>> -                     ret);
>>>>>>> -     return ret;
>>>>>>> -}
>>>>>>> -
>>>>>>> -static inline int ti_sci_proc_release(struct ti_sci_proc *tsp)
>>>>>>> -{
>>>>>>> -     int ret;
>>>>>>> -
>>>>>>> -     ret = tsp->ops->release(tsp->sci, tsp->proc_id);
>>>>>>> -     if (ret)
>>>>>>> -             dev_err(tsp->dev, "ti-sci processor release failed: %d\n",
>>>>>>> -                     ret);
>>>>>>> -     return ret;
>>>>>>> -}
>>>>>>> -
>>>>>>> -static inline int ti_sci_proc_handover(struct ti_sci_proc *tsp)
>>>>>>> -{
>>>>>>> -     int ret;
>>>>>>> -
>>>>>>> -     ret = tsp->ops->handover(tsp->sci, tsp->proc_id, tsp->host_id);
>>>>>>> -     if (ret)
>>>>>>> -             dev_err(tsp->dev, "ti-sci processor handover of %d to %d failed: %d\n",
>>>>>>> -                     tsp->proc_id, tsp->host_id, ret);
>>>>>>> -     return ret;
>>>>>>> -}
>>>>>>> -
>>>>>>> -static inline int ti_sci_proc_set_config(struct ti_sci_proc *tsp,
>>>>>>> -                                      u64 boot_vector,
>>>>>>> -                                      u32 cfg_set, u32 cfg_clr)
>>>>>>> -{
>>>>>>> -     int ret;
>>>>>>> -
>>>>>>> -     ret = tsp->ops->set_config(tsp->sci, tsp->proc_id, boot_vector,
>>>>>>> -                                cfg_set, cfg_clr);
>>>>>>> -     if (ret)
>>>>>>> -             dev_err(tsp->dev, "ti-sci processor set_config failed: %d\n",
>>>>>>> -                     ret);
>>>>>>> -     return ret;
>>>>>>> -}
>>>>>>> -
>>>>>>> -static inline int ti_sci_proc_set_control(struct ti_sci_proc *tsp,
>>>>>>> -                                       u32 ctrl_set, u32 ctrl_clr)
>>>>>>> -{
>>>>>>> -     int ret;
>>>>>>> -
>>>>>>> -     ret = tsp->ops->set_control(tsp->sci, tsp->proc_id, ctrl_set, ctrl_clr);
>>>>>>> -     if (ret)
>>>>>>> -             dev_err(tsp->dev, "ti-sci processor set_control failed: %d\n",
>>>>>>> -                     ret);
>>>>>>> -     return ret;
>>>>>>> -}
>>>>>>> -
>>>>>>> -static inline int ti_sci_proc_get_status(struct ti_sci_proc *tsp,
>>>>>>> -                                      u64 *boot_vector, u32 *cfg_flags,
>>>>>>> -                                      u32 *ctrl_flags, u32 *status_flags)
>>>>>>> -{
>>>>>>> -     int ret;
>>>>>>> -
>>>>>>> -     ret = tsp->ops->get_status(tsp->sci, tsp->proc_id, boot_vector,
>>>>>>> -                                cfg_flags, ctrl_flags, status_flags);
>>>>>>> -     if (ret)
>>>>>>> -             dev_err(tsp->dev, "ti-sci processor get_status failed: %d\n",
>>>>>>> -                     ret);
>>>>>>> -     return ret;
>>>>>>> -}
>>>>>>> -
>>>>>>> -#endif /* REMOTEPROC_TI_SCI_PROC_H */
