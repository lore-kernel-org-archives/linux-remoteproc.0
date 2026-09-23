Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219AF53163A;
	Wed, 23 Sep 2026 20:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790195187; cv=fail; b=N76i0zPmyqfQ8kfhXJbUqAHrjuYUz4BmYO8wDomyeQlhnf1UXRgK2UZOuaPt9+0FigLMa/WW82ytrCd6gfDsvi5cMJ1WQ70pfyf2jkyIrMX/aS30mlxoZcrPvSwAuQrzY6cCuNmCiNsnzaDKpy9zdqZhD0pJKktzfy+COgPUrIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790195187; c=relaxed/simple;
	bh=BFRtm0fvf1XOxvmoQsDOFZ1r982STTp04uaBNWZZMLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AFvymsF6bTlaLfjx7agS2VqpGO7Do9sVEj2/mvwYMwKzjTg72p6p9+v9Z3aBz18wRdJmGdQcbCDwsvw4cQygrffjFKADiJO/rzKz4K2+FyZf19mL5LF4GNw/cmhSHKVd+sa8SaO91r/vevp+W5Nt3vEFbtDkxzDtBLpO1fLjQg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=aRKNwS2V; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xcnK1Du7; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="aRKNwS2V";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xcnK1Du7"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NJkNVx2098294;
	Wed, 23 Sep 2026 15:25:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=iNKcWAgleXOT0MJck0Uh4H8FyF2DkfI9zd1ciO+0X
	QQ=; b=aRKNwS2VOvjj0TXYouqxZts69UNXrHUjgmA0T4bLSWxIzOTcYZgtLKPnW
	35BncSimhIvdUD056tmW17MFMpRZoXwVaLpPjISVJ9HsStwek8gZ1QONRct4K5rR
	579WC4nV6IMinQcFAJwCDBf5HQ/nyaDzAyH97o54Pn7fWRHuGug9Ah+QvdWX1rgx
	M2HpzbstB2NG9MXXNXgf/4i01RVLlp0CQAS6cRgwBliTkvSV9GIiJB2joLxu7XuB
	ue93avB6UH7cCtFiZq94umhpL1fvnEcBFJemGcONr58nTopx2GPGj0VD4PqeCCbE
	EqQz4yXoNJKKzEtyydkcSFt0TfRug==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010004.outbound.protection.outlook.com [52.101.201.4])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gv2ycydg1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 15:25:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HeNlfv9rWePaDPvhS+GdcUxFEywTxc9P0QZHFJ+NSC2D+1/Mgi0Rr7DZt4wbDibQwPTeYDvesRZaIVFsxn9fEHAJDPIuT88ZGSQSSCoLA46juQmQb6sRFLo+e9pUSSG+p12pRWg4cFx3/B9Hb8/ogrtB+A3Oqq9YXKAVrby4o3/ARuRmV1yCTpF4RaGAVJMaRMwGA4UfDkWWTcXmGJguCTzrWJt8PdVT5kJhPj2/YC/BMiPyCJgXrbuWiweHVMNgSMoQP90DvrivznX6J0UsUY3rJqOys8c0Tkj/SXByiIZ04RpIltGNdds05tsCFHvK7gXZVYEjSCgNph3JpwLWgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNKcWAgleXOT0MJck0Uh4H8FyF2DkfI9zd1ciO+0XQQ=;
 b=XhNzh/Pb2JYLd77ArsF+D+ChReGcdkwiUFHTtgqtOnXdBUdxG4q9sWOzLR7ZNM1FMvcXsGBvVpz8pXQgLI891bwu9V4tEll/HuUo1y2iqGgTNcqIh7DsKmbI69rpIdDpU8fZVvl0vyWm/8Y5/3bm3OW39IRCC7nXSuuwy7VViHwLbLBFrVTDUqARGlgSFZvf3Vw9iydf2O4n5o2PuvhjwhWhUPtLh8JhD5y5Yp5lTzvl0Z1btrDrj3Jx0ZD29vHvplQUR5TGqhdjNTmZHHQARq+IqU+dcyFl00zr39ZifMbkJmjUcSaSGJw7JAkpbR2aVZpyK9BmjFvi2aPZNs+gZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=bgdev.pl smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNKcWAgleXOT0MJck0Uh4H8FyF2DkfI9zd1ciO+0XQQ=;
 b=xcnK1Du7UiqNQubv/QsldSD33c6lH6BC5A1zrxnTZLHPilgfLv63SfWiIqXXNuzrwfMqIc6PY5QZMWrLL1SwCyoCZVTzt4FMPIbSvlCPWORKR/mx5EGo/ureyHF7MaYvu9YcFN6lMrev7L3LfUiKjhPjR4mMorqrvqiwF0hsvVU=
Received: from SJ0PR03CA0118.namprd03.prod.outlook.com (2603:10b6:a03:333::33)
 by DS0PR10MB6919.namprd10.prod.outlook.com (2603:10b6:8:11c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 20:25:25 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:333:cafe::2d) by SJ0PR03CA0118.outlook.office365.com
 (2603:10b6:a03:333::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.13 via Frontend Transport; Wed,
 23 Sep 2026 20:25:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 20:25:23 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 15:25:03 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 15:25:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 15:25:03 -0500
Received: from [10.249.33.52] ([10.249.33.52])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68NKP2wi2720053;
	Wed, 23 Sep 2026 15:25:02 -0500
Message-ID: <bb1bd3cb-972e-44f2-b4eb-e983baf2fa91@ti.com>
Date: Wed, 23 Sep 2026 15:25:02 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 4/5] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@oss.nxp.com>,
        Linus Walleij
	<linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jonathan Corbet
	<corbet@lwn.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Frank
 Li" <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
CC: Shuah Khan <skhan@linuxfoundation.org>, <linux-gpio@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Pengutronix
 Kernel Team" <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <linux-imx@nxp.com>, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
        <b-padhi@ti.com>, Andrew Lunn <andrew@lunn.ch>,
        Bartosz Golaszewski
	<brgl@bgdev.pl>
References: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
 <20260923184255.299034-5-shenwei.wang@oss.nxp.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260923184255.299034-5-shenwei.wang@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|DS0PR10MB6919:EE_
X-MS-Office365-Filtering-Correlation-Id: 10e42fbc-2ab5-4038-c379-08df19b0cbad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|7416014|376014|10067099003|4143699003|5023799004|3023799007|6133799003|18002099003|22082099003|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	Kgl/41K77bJUzIpwBcKVXpFsRrurLPAnO1wQYtiu2qvz5Lv6NGbETLkjSzK3SQnvDRQBSPD2U36n7OWh9vnqqduWg0ByjnAl4ameYeK/tZa/iK6H4KLd32lJG5vuOHDpDX2Jb7a+5g7PWuAs5qFaK4d041QDbfEpU+jyXHHrB1/Hj8nm7POBtJrtOFky4wb1WJnMbPx9ZqvrTgBUA0Pi61K/cGzyYbrqD+2h3I5kWJQoYanT/43I2kmB3nXilKv1MAWiUjIdOcTe9EstBhhUiTQ6UVbjVaFQNDuTC5W3seSOuBVrekG55GHJoG6LPuKf5iOhH/e41udsBafEa8aUzLmPxGHY9i+nGs1r+U/UP2b3saZPVhhJndmm0zOdBTuBdZT/NrUQ4jFGuLWiZJJoXl09Odm6GBYdm2XJ3FR85mIqS6jyuOPNyCebADvB2f154ZavDOUCdB2Ei30d4gvdOZ3lh5WLoitALHWYI+upXDVelZ+uXQ+tybq8/iOnE8x1nW8Ujib4lWLCJEjP9WBgRi0ycQe4CGWmMqd+S9kiWzl2KcJtxsZs1wpZlGO726axagR5FQSl8AX7MrWaviy9eVZRCbAdqHmZWS58nKnZCcHRJ8kqsrAyaGgcpDJOGiExTJf6MPsAG/C0OrgTykBP0DSBF3Xh6Vbt3422uDu5xSZYHfjw5MEaMUe5/pqik/Luz0dnuCwD3pjTUdgMzDZUALSg9gFnseGXbD/QSRK9KXLu1T+kYb77gz9JPyNPrUit
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(7416014)(376014)(10067099003)(4143699003)(5023799004)(3023799007)(6133799003)(18002099003)(22082099003)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5mrGxr7sG3mC9vYdnzHjrC0Jk4Llxei3Y/PibYuLG7Viq2To4BkHsgF8/wUhuZNuD3rbZuj8TPL1IRRwb0V8ppWZbDkP9/KpDHzFc0ZQ42nt80jPlGrKkUs+F5ZIe5cBbQwIW77x2OgKAOhNedDGeag3QizwvuvvF0cKGs5ZOT1qohm0WMva1WLUmGK66b4FO3jKNyNXeoyAh5FSO+rYVWXtr13kdbOAIpc6uco107AWxjKsFdkXzqVh86+FzyXG3ehMVa1QVmOtFObULeNhHcOBQV5FRJnjPhp/7QCKgiYbdxXL7FlnLot0lJC4r3h9gdD/lN2R3fVB1WkXjoLPtmCywd126DIJo3ROUBibN2EvTygwlHcZ4Z32gJhqadSqS/pWeikK06CthaAGrU0M3UmqUBYADlfzrBRY5z7cigqx4/3R4t3d7BPZZ6pusMfr
X-Exchange-RoutingPolicyChecked:
	kxOO9AdyiL8ncQyfduDvVHKtto2Bv0nxF/n2z2Ws9q5gZunCtHMDMH9K8fN9WlLUfexh/J0yU6JFC1a5VeGR45mTY7+Zu000wLKJhw+bwtjazLenmJwcYRz4Tva9EoXy9PZ7zKFXB9sPkpWQdD9HRWQdFjAXLdexG+sdMVtfyqnPMGTRVym2g8IJF46EizTJfMA1STIzQvMTZLP5ZgiobsT1JEVNXkDMaIMxWYk5b2/42Z9PnuUdKM7w3r6pfaP3xDPMJhLoaGgO41lFFZ7F6OPEdFSmc4PrnN2NRmPDrjIPDBA07ECq1HWMnfAF0O9oTWSjIF+nRR+qNow/1C8g7A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 20:25:23.0746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e42fbc-2ab5-4038-c379-08df19b0cbad
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6919
X-Proofpoint-GUID: g1gQXKjRHkL_GLaJi4NYbEj1g8deBLk5
X-Authority-Analysis: v=2.4 cv=WZKZ+EhX c=1 sm=1 tr=0 ts=6ab435c9 cx=c_pps
 a=d9xwnOGIUB/89jyRF8/ldQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=8AirrxEcAAAA:8
 a=UqOxO6_1QkCsCsi5RYkA:9 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA4MSBTYWx0ZWRfXxOmapo7GHUZb
 ULdlAJ9+TufCyD8T/MdIFiQ3n2y17Idl2Z0OmUzR56YiD8oai4nIg5tfdwis1iGTx11HY7DiJp3
 U+IZdpgtiOH3UIbQPGHSbjF0o/TCk5KxesJMEGnBMKPRfC49hGIVDCgZFQ3Wj80nn1288/7jTG5
 hXoCh99b0ktTFrcT/AHMWqPDTHFoCXbjsy3w+iQsYIz4LYA/NMg363YPQ2bU/whIc1fFcUxlkSD
 F8wUatJvW5j281sykBsmvcCk1VWwF3Htoe0zvzc7k3wCjO2M0/87TQ/W7DF5DdDbITEIupmWcHX
 h/FqGBu1wjN67XdelBy1FKme6P7m41k5jvTLw+raTDh/cL8ZqIAH7mbusAOIiyOS8rVSc1eyU56
 LkkuT4Lf4svzWWxh4eIbyEKqWpHIhm7vZBPMNkBROWoyCT1KR9zavTMg6RsiMDDm/z0RY7ldLlH
 R0JJ4DLw1KZcMdlU3WA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA4MSBTYWx0ZWRfXyPkkWh4A1Xkw
 TX5Ta9Rh3RjtatBW85vAcD73b2eaEvzC48SeJcEBO4T+7hsMwniAKUD7scl/A3ujRnRc7JewWGD
 vZ6WN9gNWijqGlaMA+p6SgUhbOifjZY=
X-Proofpoint-ORIG-GUID: g1gQXKjRHkL_GLaJi4NYbEj1g8deBLk5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230081

On 9/23/26 1:42 PM, Shenwei Wang wrote:
> From: Shenwei Wang <shenwei.wang@nxp.com>
> 
> On an AMP platform, the system may include multiple processors:
> 	- MCUs running an RTOS
> 	- An MPU running Linux
> 
> These processors communicate via the RPMSG protocol.
> The driver implements the standard GPIO interface, allowing
> the Linux side to control GPIO controllers which reside in
> the remote processor via RPMSG protocol.
> 
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>   drivers/gpio/Kconfig      |  17 ++
>   drivers/gpio/Makefile     |   1 +
>   drivers/gpio/gpio-rpmsg.c | 580 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 598 insertions(+)
>   create mode 100644 drivers/gpio/gpio-rpmsg.c
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index f03c05288376..9fb8ab4d3616 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1954,6 +1954,23 @@ config GPIO_SODAVILLE
>   
>   endmenu
>   
> +menu "RPMSG GPIO drivers"
> +	depends on RPMSG
> +
> +config GPIO_RPMSG
> +	tristate "Generic RPMSG GPIO support"
> +	depends on OF && REMOTEPROC
> +	select GPIOLIB_IRQCHIP
> +	default REMOTEPROC
> +	help
> +	  Say Y here to enable GPIO controllers exposed over an RPMSG
> +	  communication channel to a remote processor. GPIO operations
> +	  and interrupt configuration requests are forwarded to the
> +	  remote side through RPMSG, allowing Linux to control GPIOs
> +	  implemented by a remote firmware.
> +
> +endmenu
> +
>   menu "SPI GPIO expanders"
>   	depends on SPI_MASTER
>   
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index fa14581e3995..89d26f1aaf1c 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -159,6 +159,7 @@ obj-$(CONFIG_GPIO_RDC321X)		+= gpio-rdc321x.o
>   obj-$(CONFIG_GPIO_REALTEK_OTTO)		+= gpio-realtek-otto.o
>   obj-$(CONFIG_GPIO_REG)			+= gpio-reg.o
>   obj-$(CONFIG_GPIO_ROCKCHIP)	+= gpio-rockchip.o
> +obj-$(CONFIG_GPIO_RPMSG)		+= gpio-rpmsg.o
>   obj-$(CONFIG_GPIO_RTD)			+= gpio-rtd.o
>   obj-$(CONFIG_GPIO_RTD1625)		+= gpio-rtd1625.o
>   obj-$(CONFIG_ARCH_SA1100)		+= gpio-sa1100.o
> diff --git a/drivers/gpio/gpio-rpmsg.c b/drivers/gpio/gpio-rpmsg.c
> new file mode 100644
> index 000000000000..076af781f3bf
> --- /dev/null
> +++ b/drivers/gpio/gpio-rpmsg.c
> @@ -0,0 +1,580 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright 2026 NXP
> + *
> + * The driver exports a standard gpiochip interface to control
> + * the GPIO controllers via RPMSG on a remote processor.
> + */
> +
> +#include <linux/completion.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/init.h>
> +#include <linux/irqdomain.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/remoteproc.h>
> +#include <linux/rpmsg.h>
> +#include <linux/virtio_gpio.h>
> +
> +#define GPIOS_PER_PORT_MAX		32
> +#define RPMSG_TIMEOUT			1000
> +
> +/* GPIO Receive MSG Type */
> +#define GPIO_RPMSG_REPLY	0
> +#define GPIO_RPMSG_NOTIFY	1
> +
> +#define CHAN_NAME_PREFIX	"rpmsg-io-"
> +#define GPIO_COMPAT_STR		"rpmsg-gpio"
> +
> +struct __packed rpmsg_gpio_response {
> +	__u8 type;
> +	union {
> +		/* command reply */
> +		struct {
> +			__u8 status;
> +			__u8 value;
> +		};
> +
> +		/* interrupt notification */
> +		__le16 line;
> +	};
> +};
> +
> +struct rpmsg_gpio_line {
> +	u8 irq_shutdown;
> +	u8 irq_unmask;
> +	u8 irq_mask;
> +	u32 irq_type;
> +};
> +
> +struct rpmsg_gpio_port {
> +	struct gpio_chip gc;
> +	struct rpmsg_device *rpdev;
> +	struct virtio_gpio_request *send_msg;
> +	struct rpmsg_gpio_response *recv_msg;
> +	struct completion cmd_complete;
> +	struct mutex lock;
> +	struct work_struct eoi_work;
> +	DECLARE_BITMAP(pending_eoi, GPIOS_PER_PORT_MAX);
> +	u32 ngpios;
> +	u32 idx;
> +	struct rpmsg_gpio_line lines[GPIOS_PER_PORT_MAX];
> +};
> +
> +static int rpmsg_gpio_send_message(struct rpmsg_gpio_port *port)
> +{
> +	int ret;
> +
> +	reinit_completion(&port->cmd_complete);
> +
> +	ret = rpmsg_send(port->rpdev->ept, port->send_msg, sizeof(*port->send_msg));
> +	if (ret) {
> +		dev_err(&port->rpdev->dev, "rpmsg_send failed: cmd=%d ret=%d\n",
> +			port->send_msg->type, ret);
> +		return ret;
> +	}
> +
> +	ret = wait_for_completion_timeout(&port->cmd_complete,
> +					  msecs_to_jiffies(RPMSG_TIMEOUT));
> +	if (ret == 0) {
> +		dev_err(&port->rpdev->dev, "rpmsg_send timeout! cmd=%d\n",
> +			port->send_msg->type);
> +		return -ETIMEDOUT;
> +	}
> +
> +	if (port->recv_msg->status != VIRTIO_GPIO_STATUS_OK) {
> +		dev_err(&port->rpdev->dev, "remote core replies an error: cmd=%d!\n",
> +			port->send_msg->type);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct virtio_gpio_request *
> +rpmsg_gpio_msg_prepare(struct rpmsg_gpio_port *port, u16 line, u16 cmd, u32 val)
> +{
> +	struct virtio_gpio_request *msg = port->send_msg;
> +
> +	msg->type = cpu_to_le16(cmd);
> +	msg->gpio = cpu_to_le16(line);
> +	msg->value = cpu_to_le32(val);
> +
> +	return msg;
> +}
> +
> +static int rpmsg_gpio_get(struct gpio_chip *gc, unsigned int line)
> +{
> +	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
> +	int ret;
> +
> +	guard(mutex)(&port->lock);
> +
> +	rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_GET_VALUE, 0);
> +
> +	ret = rpmsg_gpio_send_message(port);
> +	return ret ? ret : port->recv_msg->value;
> +}
> +
> +static int rpmsg_gpio_get_direction(struct gpio_chip *gc, unsigned int line)
> +{
> +	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
> +	int ret;
> +
> +	guard(mutex)(&port->lock);
> +
> +	rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_GET_DIRECTION, 0);
> +
> +	ret = rpmsg_gpio_send_message(port);
> +	if (ret)
> +		return ret;
> +
> +	switch (port->recv_msg->value) {
> +	case VIRTIO_GPIO_DIRECTION_IN:
> +		return GPIO_LINE_DIRECTION_IN;
> +	case VIRTIO_GPIO_DIRECTION_OUT:
> +		return GPIO_LINE_DIRECTION_OUT;
> +	default:
> +		break;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int rpmsg_gpio_direction_input(struct gpio_chip *gc, unsigned int line)
> +{
> +	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
> +
> +	guard(mutex)(&port->lock);
> +
> +	rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_SET_DIRECTION,
> +			       VIRTIO_GPIO_DIRECTION_IN);
> +
> +	return rpmsg_gpio_send_message(port);
> +}
> +
> +static int rpmsg_gpio_set(struct gpio_chip *gc, unsigned int line, int val)
> +{
> +	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
> +
> +	guard(mutex)(&port->lock);
> +
> +	rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_SET_VALUE, val);
> +
> +	return rpmsg_gpio_send_message(port);
> +}
> +
> +static int rpmsg_gpio_direction_output(struct gpio_chip *gc, unsigned int line, int val)
> +{
> +	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
> +	int ret;
> +
> +	guard(mutex)(&port->lock);
> +
> +	rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_SET_VALUE, val);
> +	ret = rpmsg_gpio_send_message(port);
> +	if (ret)
> +		return ret;
> +
> +	rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_SET_DIRECTION,
> +			       VIRTIO_GPIO_DIRECTION_OUT);
> +	return rpmsg_gpio_send_message(port);
> +}
> +
> +static int gpio_rpmsg_irq_set_type(struct irq_data *d, u32 type)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 line = d->hwirq;
> +
> +	switch (type) {
> +	case IRQ_TYPE_EDGE_RISING:
> +		type = VIRTIO_GPIO_IRQ_TYPE_EDGE_RISING;
> +		break;
> +	case IRQ_TYPE_EDGE_FALLING:
> +		type = VIRTIO_GPIO_IRQ_TYPE_EDGE_FALLING;
> +		break;
> +	case IRQ_TYPE_EDGE_BOTH:
> +		type = VIRTIO_GPIO_IRQ_TYPE_EDGE_BOTH;
> +		break;
> +	case IRQ_TYPE_LEVEL_LOW:
> +		type = VIRTIO_GPIO_IRQ_TYPE_LEVEL_LOW;
> +		break;
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		type = VIRTIO_GPIO_IRQ_TYPE_LEVEL_HIGH;
> +		break;
> +	default:
> +		dev_err(&port->rpdev->dev, "unsupported irq type: %u\n", type);
> +		return -EINVAL;
> +	}
> +
> +	port->lines[line].irq_type = type;
> +
> +	return 0;
> +}
> +
> +/*
> + * This unmask/mask function is invoked in two situations:
> + *   - when an interrupt is being set up, and
> + *   - after an interrupt has occurred.
> + *
> + * The GPIO driver does not access hardware registers directly.
> + * Instead, it caches all relevant information locally, and then sends
> + * the accumulated state to the remote system at this stage.
> + */
> +static void gpio_rpmsg_unmask_irq(struct irq_data *d)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 line = d->hwirq;
> +
> +	port->lines[line].irq_unmask = 1;
> +}
> +
> +static void gpio_rpmsg_mask_irq(struct irq_data *d)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 line = d->hwirq;
> +
> +	/*
> +	 * When an interrupt occurs, the remote system masks the interrupt
> +	 * and then sends a notification to Linux. After Linux processes
> +	 * that notification, it sends an RPMsg command back to the remote
> +	 * system to unmask the interrupt again.
> +	 */
> +	port->lines[line].irq_mask = 1;
> +}
> +
> +static void gpio_rpmsg_irq_shutdown(struct irq_data *d)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 line = d->hwirq;
> +
> +	port->lines[line].irq_shutdown = 1;
> +}
> +
> +static void gpio_rpmsg_eoi_irq(struct irq_data *d)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +
> +	set_bit(d->hwirq, port->pending_eoi);
> +	schedule_work(&port->eoi_work);
> +}
> +
> +static void gpio_rpmsg_irq_bus_lock(struct irq_data *d)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +
> +	mutex_lock(&port->lock);
> +}
> +
> +static void gpio_rpmsg_irq_bus_sync_unlock(struct irq_data *d)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 line = d->hwirq;
> +
> +	/*
> +	 * For mask irq, do nothing here.
> +	 * The remote system will mask interrupt after an interrupt occurs,
> +	 * and then send a notification to Linux system. After Linux system
> +	 * handles the notification, it sends an rpmsg back to the remote
> +	 * system to unmask this interrupt again.
> +	 */
> +	if (port->lines[line].irq_mask && !port->lines[line].irq_unmask) {
> +		port->lines[line].irq_mask = 0;
> +		mutex_unlock(&port->lock);
> +		return;
> +	}
> +
> +	if (port->lines[line].irq_shutdown) {
> +		rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_IRQ_TYPE,
> +				       VIRTIO_GPIO_IRQ_TYPE_NONE);
> +		port->lines[line].irq_shutdown = 0;
> +	} else {
> +		rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_IRQ_TYPE,
> +				       port->lines[line].irq_type);
> +
> +		if (port->lines[line].irq_unmask)
> +			port->lines[line].irq_unmask = 0;
> +	}
> +
> +	rpmsg_gpio_send_message(port);
> +	mutex_unlock(&port->lock);
> +}
> +
> +static const struct irq_chip gpio_rpmsg_irq_chip = {
> +	.name = "rpmsg-gpio",
> +	.irq_mask = gpio_rpmsg_mask_irq,
> +	.irq_unmask = gpio_rpmsg_unmask_irq,
> +	.irq_eoi = gpio_rpmsg_eoi_irq,
> +	.irq_set_type = gpio_rpmsg_irq_set_type,
> +	.irq_shutdown = gpio_rpmsg_irq_shutdown,
> +	.irq_bus_lock = gpio_rpmsg_irq_bus_lock,
> +	.irq_bus_sync_unlock = gpio_rpmsg_irq_bus_sync_unlock,
> +	.flags = IRQCHIP_IMMUTABLE,
> +};
> +
> +static void gpio_rpmsg_eoi_work(struct work_struct *work)
> +{
> +	struct rpmsg_gpio_port *port =
> +		container_of(work, struct rpmsg_gpio_port, eoi_work);
> +	unsigned long pending[BITS_TO_LONGS(GPIOS_PER_PORT_MAX)];
> +	unsigned int line;
> +
> +	guard(mutex)(&port->lock);
> +
> +	bitmap_copy(pending, port->pending_eoi, port->ngpios);
> +	bitmap_zero(port->pending_eoi, port->ngpios);
> +
> +	for_each_set_bit(line, pending, port->ngpios) {
> +		rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_IRQ_TYPE,
> +				       port->lines[line].irq_type);
> +
> +		if (rpmsg_gpio_send_message(port))
> +			dev_err(&port->rpdev->dev, "EOI error for line %u\n", line);
> +	}
> +}
> +
> +static int rpmsg_gpiochip_register(struct rpmsg_device *rpdev, u32 idx,
> +				   struct device_node *np, const char *name)
> +{
> +	struct rpmsg_gpio_port *port;
> +	struct gpio_irq_chip *girq;
> +	struct gpio_chip *gc;
> +	int ret;
> +
> +	port = devm_kzalloc(&rpdev->dev, sizeof(*port), GFP_KERNEL);
> +	if (!port)
> +		return -ENOMEM;
> +
> +	ret = devm_mutex_init(&rpdev->dev, &port->lock);
> +	if (ret)
> +		return ret;
> +
> +	ret = of_property_read_u32(np, "ngpios", &port->ngpios);
> +	if (ret || port->ngpios > GPIOS_PER_PORT_MAX)
> +		port->ngpios = GPIOS_PER_PORT_MAX;
> +
> +	port->send_msg = devm_kzalloc(&rpdev->dev,
> +				      sizeof(*port->send_msg),
> +				      GFP_KERNEL);
> +
> +	port->recv_msg = devm_kzalloc(&rpdev->dev,
> +				      sizeof(*port->recv_msg),
> +				      GFP_KERNEL);
> +	if (!port->send_msg || !port->recv_msg)
> +		return -ENOMEM;
> +
> +	INIT_WORK(&port->eoi_work, gpio_rpmsg_eoi_work);
> +	init_completion(&port->cmd_complete);
> +	port->rpdev = rpdev;
> +	port->idx = idx;
> +
> +	gc = &port->gc;
> +	gc->owner = THIS_MODULE;
> +	gc->parent = &rpdev->dev;
> +	gc->fwnode = of_fwnode_handle(np);
> +	gc->ngpio = port->ngpios;
> +	gc->can_sleep = true;
> +	gc->base = -1;
> +	gc->label = devm_kasprintf(&rpdev->dev, GFP_KERNEL, "%s-gpio%d",
> +				   name, port->idx);
> +
> +	gc->direction_input = rpmsg_gpio_direction_input;
> +	gc->direction_output = rpmsg_gpio_direction_output;
> +	gc->get_direction = rpmsg_gpio_get_direction;
> +	gc->get = rpmsg_gpio_get;
> +	gc->set = rpmsg_gpio_set;
> +
> +	girq = &gc->irq;
> +	gpio_irq_chip_set_chip(girq, &gpio_rpmsg_irq_chip);
> +	girq->parent_handler = NULL;
> +	girq->num_parents = 0;
> +	girq->parents = NULL;
> +	girq->default_type = IRQ_TYPE_NONE;
> +	girq->handler = handle_fasteoi_irq;
> +
> +	dev_set_drvdata(&rpdev->dev, port);
> +
> +	return devm_gpiochip_add_data(&rpdev->dev, gc, port);
> +}
> +
> +static const char *rpmsg_get_rproc_node_name(struct rpmsg_device *rpdev)
> +{
> +	const char *name = NULL;
> +	struct device_node *np;
> +	struct rproc *rproc;
> +
> +	rproc = rproc_get_by_child(&rpdev->dev);
> +	if (!rproc)
> +		return NULL;
> +
> +	np = of_node_get(rproc->dev.of_node);
> +	if (!np && rproc->dev.parent)
> +		np = of_node_get(rproc->dev.parent->of_node);
> +
> +	if (np) {
> +		name = devm_kstrdup(&rpdev->dev, np->name, GFP_KERNEL);
> +		of_node_put(np);
> +	}
> +
> +	return name;
> +}
> +
> +static struct device_node *
> +rpmsg_find_child_by_compat_reg(struct device_node *parent, const char *compat, u32 idx)
> +{
> +	struct device_node *child;
> +	u32 reg;
> +
> +	for_each_available_child_of_node(parent, child) {
> +		if (!of_device_is_compatible(child, compat))
> +			continue;
> +
> +		if (of_property_read_u32(child, "reg", &reg))
> +			continue;
> +
> +		if (reg == idx)
> +			return child;
> +	}
> +
> +	return NULL;
> +}
> +
> +static struct device_node *
> +rpmsg_get_gpio_ofnode(struct rpmsg_device *rpdev, const char *compat, u32 idx)
> +{
> +	struct device_node *np_chan, *np_rproc, *np_rpmsg;
> +	struct rproc *rproc;
> +
> +	rproc = rproc_get_by_child(&rpdev->dev);
> +	if (!rproc)
> +		return NULL;
> +
> +	np_rproc = of_node_get(rproc->dev.of_node);
> +	if (!np_rproc && rproc->dev.parent)
> +		np_rproc = of_node_get(rproc->dev.parent->of_node);
> +
> +	if (!np_rproc)
> +		return NULL;
> +
> +	np_rpmsg = of_get_child_by_name(np_rproc, "rpmsg");
> +	of_node_put(np_rproc);
> +	if (!np_rpmsg)
> +		return NULL;
> +
> +	np_chan = rpmsg_find_child_by_compat_reg(np_rpmsg, compat, idx);
> +	of_node_put(np_rpmsg);
> +
> +	return np_chan;
> +}
> +
> +static int rpmsg_get_gpio_index(const char *name, const char *prefix)
> +{
> +	const char *p;
> +	int base = 10;
> +	int val;
> +
> +	if (!name)
> +		return -EINVAL;
> +
> +	/* Ensure correct prefix */
> +	if (!str_has_prefix(name, prefix))
> +		return -EINVAL;
> +
> +	/* Find last '-' */
> +	p = strrchr(name, '-');
> +
> +	if (!p || *(p + 1) == '\0')
> +		return -EINVAL;
> +
> +	if (p[1] == '0' && (p[2] == 'x' || p[2] == 'X'))
> +		base = 16;
> +
> +	if (kstrtoint(p + 1, base, &val))
> +		return -EINVAL;
> +
> +	return val;
> +}
> +
> +static int rpmsg_gpio_channel_callback(struct rpmsg_device *rpdev, void *data,
> +				       int len, void *priv, u32 src)
> +{
> +	struct rpmsg_gpio_response *msg = data;
> +	struct rpmsg_gpio_port *port = NULL;
> +	u32 line;
> +
> +	port = dev_get_drvdata(&rpdev->dev);
> +
> +	if (!port) {
> +		dev_err(&rpdev->dev, "port is null\n");
> +		return -EINVAL;
> +	}
> +
> +	if (msg->type == GPIO_RPMSG_REPLY) {
> +		*port->recv_msg = *msg;
> +		complete(&port->cmd_complete);
> +	} else if (msg->type == GPIO_RPMSG_NOTIFY) {
> +		line = le16_to_cpu(msg->line);
> +		generic_handle_domain_irq_safe(port->gc.irq.domain, line);
> +	} else {
> +		dev_err(&rpdev->dev, "wrong message type (0x%x)\n", msg->type);
> +	}
> +
> +	return 0;
> +}
> +
> +static int rpmsg_gpio_channel_probe(struct rpmsg_device *rpdev)
> +{
> +	struct device *dev = &rpdev->dev;
> +	struct device_node *np;
> +	const char *rproc_name;
> +	int idx;
> +
> +	idx = rpmsg_get_gpio_index(rpdev->id.name, CHAN_NAME_PREFIX);
> +	if (idx < 0)
> +		return -EINVAL;
> +
> +	if (!dev->of_node) {
> +		np = rpmsg_get_gpio_ofnode(rpdev, GPIO_COMPAT_STR, idx);
> +		if (np) {
> +			dev->of_node = np;
> +			set_primary_fwnode(dev, of_fwnode_handle(np));
> +			return -EPROBE_DEFER;
> +		}
> +	}
> +
> +	rproc_name = rpmsg_get_rproc_node_name(rpdev);
> +
> +	return rpmsg_gpiochip_register(rpdev, idx, dev->of_node, rproc_name);

Why split your probe function in half like this? Where do you draw the
split line? Why not fetch rproc_name in the second half function, etc..

Should be one function.

> +}
> +
> +static void rpmsg_gpio_channel_remove(struct rpmsg_device *rpdev)
> +{
> +	struct rpmsg_gpio_port *port = dev_get_drvdata(&rpdev->dev);
> +
> +	cancel_work_sync(&port->eoi_work);

Init the work with devm_work_autocancel() and then you can drop the
remove function.

Andrew

> +}
> +
> +static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
> +	{ .name = CHAN_NAME_PREFIX },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(rpmsg, rpmsg_gpio_channel_id_table);
> +
> +static struct rpmsg_driver rpmsg_gpio_channel_client = {
> +	.callback	= rpmsg_gpio_channel_callback,
> +	.id_table	= rpmsg_gpio_channel_id_table,
> +	.probe		= rpmsg_gpio_channel_probe,
> +	.remove		= rpmsg_gpio_channel_remove,
> +	.drv.name	= KBUILD_MODNAME,
> +};
> +module_rpmsg_driver(rpmsg_gpio_channel_client);
> +
> +MODULE_AUTHOR("Shenwei Wang <shenwei.wang@nxp.com>");
> +MODULE_DESCRIPTION("generic rpmsg gpio driver");
> +MODULE_LICENSE("GPL");

