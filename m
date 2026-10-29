Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793263119;
	b=d8tpDZVbS3NN7edak2IwoujlfefUskQ/p3Evvat5nwihORi5C+EpyZjqvgAUXnQXfxux
	 h7cO+OE3wxKj1MA23RHKP3Yu87KfF1UN31K77tcc8/e+RH4njZMGGFaJrzPRDcTLSDRA1
	 IyVhCXeuIrww0vuMz8uyDCy3HJm6Wse2HW4n8OdKuemY3+i173DYD4i4Z4FGrZRg1QEMv
	 UHE3t8KfsDLbX8TMbMhUC8hOAvhEYKu5CKd+5G6CN/7KlKIoR5Mag6rPWfqQYzFsw6Wrf
	 DUnZMNzF3cVOALlvAopPiSu3yGHdHsoCCUJ+hm7aWl1MWWonKDE4c6Xg2Q8Y8Ljpt1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263119;
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
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Vw2ckCt3GHwZny8GdU0sTEOpRaBt8I/4H7yJwCtGdS0=;
	b=y3hfAeYRjqD53jgmZWFqd9MLBl5znqPvkKUS/i4w1E8hZ4foyEKao6GpwcVpIvT+W4k6
	 llAZklYSBqEaMYGMp4uVu/I5alZBZ0hMTIrjGyviGAeBF7ri9iQFw5C89qMkFIkkwTf00
	 GEv6Vq76zY2sVf1y/ZHTwHniJ4SRymVCJHequX2fHueWPWacMZTYAwwAiY/wP5E07J0zM
	 T1qj5Ml07VUyl9pjupsYWV531C+Q7sEpEkE48BdjTIbhKtd1o5L6pP9UOhq/b8c3c0HEU
	 tS4gxTYZBkIaMtSe2eGPZNCmA1ZpLhW9cWCxRoHXzXDnvtZlYEmBOXtnclePydrKUlg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=pw3RvogP;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=sgwiefoM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94642606A31A;
	Thu, 29 Oct 2026 08:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94642606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=pw3RvogP;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=sgwiefoM
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5I5S91916817;
	Thu, 29 Oct 2026 03:38:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Vw2ckCt3GHwZny8GdU0sTEOpRaBt8I/4H7yJwCtGd
	S0=; b=pw3RvogPBv9RspPuLIeQNQe27epgIuN3uHwUPVfA8C7/m6q6TUT5Bl6Ne
	i11jg+GLTORVSTm2UymplvJvf8Nwpz/9xqZ1ihUEjy5qVjhwkv3ZnS4ZAsqKXyfE
	TCYojdrLWg1Q6RqNiLibEMJ2VjK5tJ9HroWIqb9Ptw43mp2/BO3Bvf0x9oxDeQep
	ABe0RsFo7cmFhnfJba7I2hAhLsRxb49SkA+skUguS9LvyT2NkgQoqIG2lW+mdHoU
	euGVfDFV5fqGS6egoezuvYhXZ4liFQm8yvOxqSaX75eiNiKMJAJws+1Q2iVE4FTG
	LYh9DMU16wPuOCirTbK+WjP8J59sg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011019.outbound.protection.outlook.com [40.93.194.19])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hkr263wpe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2026 03:38:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ItVis/b1KjY5xSB9yFQliDVKAvbIEYFsYmk8iWJhLZE7ajnyvaDOeo1YsYGdSoM2MZlzonk4SHfBb7r+Odrtq/qN/73zT+H74NuqsOVxlxbq4OBuatFCfpNCAfLl22guB78PwNu2weKcc6pEtdsUHDYW4NYamzWc8J3pswUGE2z9wm2cc8BhPA8ptjzUD+A/d2pSRmGQD57o0EtzpHGOlWZwaeRqA1ZzofnrHWVg0+OHvHPlP+WKHlXseufZLUmHmOhSnooxmo71VXSuLXGO1nZxb3IazRJKsJQYmUg7rZp780vbSITovX8rxY8+J7HOdGQ+fmo8yOJjYfJoru1jVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vw2ckCt3GHwZny8GdU0sTEOpRaBt8I/4H7yJwCtGdS0=;
 b=hKG5q1NdyYCiZBVdAyLJ5E2XJgUpBG8B5omNVxGsM5HLX6e3fPbHVT6DpKW0bI0j6Ks4j+V9dwZ6+YBZY8kdrBBj9KB3x56Pb4za5kbaGqq4A2HkAruVfKihB9nP1IyRwvafpdXpY2uy+oe7t2TTzrQUEPUohIZvbODi9/QIDGEB9aLfTn1CNmfGNZhNwcKsPDIvq2rSWz+yvivTW86cC43tHaIcqndKXgkaFySMlGs1dBHDwzLJNLHPQ8ygMoGENEaqiNb0rNlfGueqie9f8fY51e/l4FATDGUtr8aAJsKn3DXXPx3AlhE9/w5KqJoki5EeFDBf8kxuk3UOjcM3xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vw2ckCt3GHwZny8GdU0sTEOpRaBt8I/4H7yJwCtGdS0=;
 b=sgwiefoMYxishaqbDjhkXf6J6XBEghTnQ+d542YIwJu3A/V73qmmhFEIooU0R1suCa2tjh+36k9FqYfRKqUR6zPEH6I1rvjXzvhtex4DAhgkcWOSyaHE93Sg7HA7jKFxN2DXrqtYr8fUzwjDoqzieXVT4sUg3nKJG4XCC6cylT4=
Received: from CY5PR20CA0015.namprd20.prod.outlook.com (2603:10b6:930:3::18)
 by SJ0PR10MB5787.namprd10.prod.outlook.com (2603:10b6:a03:3dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 08:38:25 +0000
Received: from CO1PEPF00012E64.namprd05.prod.outlook.com
 (2603:10b6:930:3:cafe::30) by CY5PR20CA0015.outlook.office365.com
 (2603:10b6:930:3::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.7 via Frontend Transport; Thu, 29
 Oct 2026 08:38:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF00012E64.mail.protection.outlook.com (10.167.249.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 08:38:23 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 03:37:41 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 03:37:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 29 Oct 2026 03:37:41 -0500
Received: from [172.24.21.238] (ltpw09g66v.dhcp.ti.com [172.24.21.238])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69T8bcmA2551663;
	Thu, 29 Oct 2026 03:37:39 -0500
Message-ID: <da17b402-613c-44fe-8cef-314f350d474a@ti.com>
Date: Thu, 29 Oct 2026 14:07:38 +0530
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
Subject: Re: [PATCH v2 1/2] remoteproc: Add ti_sci_dev_ops abstraction
To: Siddharth Karanam <sid9.karanam@gmail.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
References: <20261014103241.3847-1-sid9.karanam@gmail.com>
 <20261014103241.3847-2-sid9.karanam@gmail.com>
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <20261014103241.3847-2-sid9.karanam@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E64:EE_|SJ0PR10MB5787:EE_
X-MS-Office365-Filtering-Correlation-Id: 9090eef9-2ce0-417b-90f1-08df3597fe98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|261028144727099003|4143699003|56012099006|261009223027099003|261022113327099003|261026121527099003|261021121427099003|261021123027099003|261026140227099003|261022105027099003|10067099003|261022075727099003|22082099003|18002099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	c5s2bkwD5JG9LrC+1JTaeKJJWQKL2dXtooYs6MPcxhi2rSxbqMBzYCruXphvAJn+tv/CxvS5IhURiN0hoq7MpsPxqnYOrh1Ai4+A8T3y4YHko3BybWpJ8YVd+xfGnN6BiC2hBs+CSySLA7+HRdLwBYep3q9tyMMAWi6YYUsLMpFBsGKoW3rUcr21rmIAR/8Y/vKUgc2HbSdzH5mRr4rMJpE+wlibQYNRMxzm2omhookarqbRxEhLpTwIZ7vbHiAmVwSvpUWFwXrDzovb1MfR8NPIdJnA3jg+hBd0RtufkFdHS12WuRXstQj0PukZsLBOyTosvVZ/Pr5+ZR4uAOeVE7g55M3FNrZjYd/pIP2flfAxca0hc4arjRQe0kul4aHWLFTygojGwW0giDvH6PD20G+WfolyMMQQdtAjS5sZU8H5aM2gPZ+MuESZ+yGCJPhXpn1rTTdSxSvin8GZPfXIrKTI3erExIsIqKeFANQF4k4mvAtjJQHNxkTLlDlEdvOUzfw9QJj4pHrvUU7OqorqXgrjQJRwXxJUNHrofS+3prtU/BA+0tc2H7pnDo+yJ/VKJowhCsMOmPaOpy+WYLK72UE+bk/L7LEEK9Fqk2Zd3LLkH4q9uMTtVuYdFZrHJ6jV3JFUQb0rXIZW+C6ZjpSPUg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(261028144727099003)(4143699003)(56012099006)(261009223027099003)(261022113327099003)(261026121527099003)(261021121427099003)(261021123027099003)(261026140227099003)(261022105027099003)(10067099003)(261022075727099003)(22082099003)(18002099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Oj0i8Ut1KySz+wECm59tV3yhEGfB4krEUEm7Gaogz+sYwFi3z5KIlGCAs82rJdxCYnaZ4hTo97HjPQ7QIL9YugiAXk04tOxgEpnbyZyJTTxr/sU82LY8ENEjrZdEhHGTPESTzF2Ip9huhFi01RkJ8hbM68PWy7/7n4oyvSa/JFEkGq5KzQXFD+Ok71vaKTHa8LeatFFoAE8dOH1oC8avenuamfwpoQpk1ppv/V0pqIiSQ0URaUqp5Dmr+3wyHvxTUBKGdQzL4qVXL14NaJEWMEsNP2bkrBKDzjwqb7Xue2U5kxS7mj5MMsVdGHhzEL1qSwtp5obP69Ml9QPKlw1Tp9sryy0b2P1pcPi9TC+hiJErXovdxbRYcYGcMrbiW8OLWQKttn3OdofWKD4UX0QnPaBm5+A7kTRiHt8dCp5+J1XqR+lFziFlASvoxxkxlEcn
X-Exchange-RoutingPolicyChecked:
	5L5uCUN4hX8gBXw26Wi7BETMUQo8o4iEj/gD5C7y7AIPpaXx1cNu25ejZGK9E7AEdI7swFHVQ2epSZOUuLkUcZ4fZfURufaIwsp04Rln6za8DPqxzkzF08j+0Zr+3wfKKMzB3feU82OAkVSzCWJtyUkzR7+dcJUziQFwysOpWN9Pyw5O6PFRA7uML+3hkSATvf+Wt7a+UrwIkeqy0uXjfA9Cdjat6GlVLzMzszeQC8CJFK9hSSNSNsD5Rs8MsbX2wepVcQ2zw6Ugt5Xl1tQ0yLoKeRArGkyr/4zjiubjCEsRNZvr81wjPVOeQrON670yHX9nT0eEFv/RvPNckYqMEw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 08:38:23.6305
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9090eef9-2ce0-417b-90f1-08df3597fe98
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E64.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5787
X-Authority-Analysis: v=2.4 cv=PImaavqC c=1 sm=1 tr=0 ts=6ae30609 cx=c_pps
 a=FOw1GTnNYXmOwZ/eduxC4w==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8
 a=9xkm5mRPVq_RN2qXlsEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: TO_DFOa2eT6tWmZR10fRGBUacGuUkYCX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfXxG1lKYwB8Yz9
 NDA6cU9yHFUKqEV1NWsjMH6d0x5UUh+QngrAet/6SVQ5x9zS/LB1FnZr6I1hvhky/n1vN6FiPuV
 45Q+FEjdJc8oQ4ZeTpxyo+lLe3QHIyg7AmDqAN7y73/u3h7x5UX1MmzhQUQ5ov5OZxHCHoI6AQm
 ms40ALJUpnFBC1tXUq1Hgr7da53ZTo5mXnikPOiN38HcFcVyOHb/tU1+Kho5tWiGfGtaV38WsFW
 gSJk3GJllk53wMyLt9tDrG2DLqkm8Ys8v8CwoSqRlHPLqsX8ulA2BqOyM1TFFK4UOXZ47982lFt
 Dmz00JnSaZVE0Ijf3Dwm8x64MN1EM82++a0i2RvpzExacMsJOLqNCTw0gt3w1zEosoI5f0TsmEx
 NM+h6IRKbaWEpt2MDnqc3h0oeLXO5wrNQnRn08qjHK2XAls8icQkw3IOA3h6o5eadct4flMIGm7
 RVdsSA2vrfre+V/ny7w==
X-Proofpoint-GUID: TO_DFOa2eT6tWmZR10fRGBUacGuUkYCX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfXyFwTCVd2Ke54
 9K9jJYx7YjN2fOqhcs3h8UYkNf2AtvPqOXWxVh8hETd6eIe2eLZTR80wZQ0JINvWs4kC2wflUdw
 OP/dW2bmEDuZoLZMksioN0Ii+36OpeM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290033


On 10/14/2026 4:02 PM, Siddharth Karanam wrote:
> Instead of invoking ti_sci_handle's ti_sci_dev_ops member directly
> in the driver code, this abstracts the property read of
> "ti,sci-dev-id" and the function pointers supported by
> ti_sci_dev_ops such as is_on, get_device and put_device.
>
> The goal of the patch is to maintain a single source
> of origin for all ti_sci_dev_ops call sites. Any stray calls
> to any dev_ops function pointer members in driver code should
> eventually be abstracted through this header.
>
> Signed-off-by: Siddharth Karanam <sid9.karanam@gmail.com>
> ---
>   drivers/remoteproc/ti_k3_common.c         | 16 ++---
>   drivers/remoteproc/ti_k3_common.h         |  4 +-
>   drivers/remoteproc/ti_k3_dsp_remoteproc.c | 14 ++--
>   drivers/remoteproc/ti_k3_m4_remoteproc.c  | 13 ++--
>   drivers/remoteproc/ti_k3_r5_remoteproc.c  | 40 +++++------
>   drivers/remoteproc/ti_sci_dev.h           | 82 +++++++++++++++++++++++
>   6 files changed, 120 insertions(+), 49 deletions(-)
>   create mode 100644 drivers/remoteproc/ti_sci_dev.h
>
> diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
> index 3cb8ae5d72f6..befa9a9bea3a 100644
> --- a/drivers/remoteproc/ti_k3_common.c
> +++ b/drivers/remoteproc/ti_k3_common.c
> @@ -32,6 +32,7 @@
>   
>   #include "omap_remoteproc.h"
>   #include "remoteproc_internal.h"
> +#include "ti_sci_dev.h"
>   #include "ti_sci_proc.h"
>   #include "ti_k3_common.h"
>   
> @@ -120,8 +121,7 @@ int k3_rproc_reset(struct k3_rproc *kproc)
>   		if (ret)
>   			dev_err(dev, "local-reset assert failed (%pe)\n", ERR_PTR(ret));
>   	} else {
> -		ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
> -							    kproc->ti_sci_id);
> +		ret = ti_sci_dev_put_device(kproc->tsd);
>   		if (ret)
>   			dev_err(dev, "module-reset assert failed (%pe)\n", ERR_PTR(ret));
>   	}
> @@ -140,13 +140,11 @@ int k3_rproc_release(struct k3_rproc *kproc)
>   		ret = reset_control_deassert(kproc->reset);
>   		if (ret) {
>   			dev_err(dev, "local-reset deassert failed, (%pe)\n", ERR_PTR(ret));
> -			if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
> -								  kproc->ti_sci_id))
> +			if (ti_sci_dev_put_device(kproc->tsd))
>   				dev_warn(dev, "module-reset assert back failed\n");
>   		}
>   	} else {
> -		ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
> -							    kproc->ti_sci_id);
> +		ret = ti_sci_dev_get_device(kproc->tsd);
>   		if (ret)
>   			dev_err(dev, "module-reset deassert failed (%pe)\n", ERR_PTR(ret));
>   	}
> @@ -223,8 +221,7 @@ int k3_rproc_prepare(struct rproc *rproc)
>   		}
>   	}
>   
> -	ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
> -						    kproc->ti_sci_id);
> +	ret = ti_sci_dev_get_device(kproc->tsd);
>   	if (ret) {
>   		dev_err(dev, "could not deassert module-reset for internal RAM loading\n");
>   		return ret;
> @@ -253,8 +250,7 @@ int k3_rproc_unprepare(struct rproc *rproc)
>   	if (rproc->state == RPROC_DETACHED)
>   		return 0;
>   
> -	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
> -						    kproc->ti_sci_id);
> +	ret = ti_sci_dev_put_device(kproc->tsd);
>   	if (ret) {
>   		dev_err(dev, "module-reset assert failed\n");
>   		return ret;
> diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
> index aee3c28dbe51..7ba0903ebe0a 100644
> --- a/drivers/remoteproc/ti_k3_common.h
> +++ b/drivers/remoteproc/ti_k3_common.h
> @@ -72,8 +72,8 @@ struct k3_rproc_dev_data {
>    * @reset: reset control handle
>    * @data: pointer to DSP-specific device data
>    * @tsp: TI-SCI processor control handle
> + * @tsd: TI-SCI device control handle
>    * @ti_sci: TI-SCI handle
> - * @ti_sci_id: TI-SCI device identifier
>    * @mbox: mailbox channel handle
>    * @client: mailbox client to request the mailbox channel
>    * @priv: void pointer to carry any private data
> @@ -88,8 +88,8 @@ struct k3_rproc {
>   	struct reset_control *reset;
>   	const struct k3_rproc_dev_data *data;
>   	struct ti_sci_proc *tsp;
> +	struct ti_sci_dev *tsd;
>   	const struct ti_sci_handle *ti_sci;
> -	u32 ti_sci_id;
>   	struct mbox_chan *mbox;
>   	struct mbox_client client;
>   	void *priv;
> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> index d6ceea6dc920..b6042fe7bae7 100644
> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> @@ -19,6 +19,7 @@
>   
>   #include "omap_remoteproc.h"
>   #include "remoteproc_internal.h"
> +#include "ti_sci_dev.h"
>   #include "ti_sci_proc.h"
>   #include "ti_k3_common.h"
>   
> @@ -69,7 +70,6 @@ static const struct rproc_ops k3_dsp_rproc_ops = {
>   static int k3_dsp_rproc_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> -	struct device_node *np = dev->of_node;
>   	const struct k3_rproc_dev_data *data;
>   	struct k3_rproc *kproc;
>   	struct rproc *rproc;
> @@ -110,10 +110,6 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
>   		return dev_err_probe(dev, PTR_ERR(kproc->ti_sci),
>   				     "failed to get ti-sci handle\n");
>   
> -	ret = of_property_read_u32(np, "ti,sci-dev-id", &kproc->ti_sci_id);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "missing 'ti,sci-dev-id' property\n");
> -
>   	kproc->reset = devm_reset_control_get_exclusive(dev, NULL);
>   	if (IS_ERR(kproc->reset))
>   		return dev_err_probe(dev, PTR_ERR(kproc->reset),
> @@ -124,6 +120,11 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
>   		return dev_err_probe(dev, PTR_ERR(kproc->tsp),
>   				     "failed to construct ti-sci proc control\n");
>   
> +	kproc->tsd = ti_sci_dev_of_get_tsd(dev, kproc->ti_sci);
> +	if (IS_ERR(kproc->tsd))
> +		return dev_err_probe(dev, PTR_ERR(kproc->tsd),
> +				     "failed to construct ti-sci dev control\n");
> +
>   	ret = ti_sci_proc_request(kproc->tsp);
>   	if (ret < 0) {
>   		dev_err_probe(dev, ret, "ti_sci_proc_request failed\n");
> @@ -141,8 +142,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
>   	if (ret)
>   		return dev_err_probe(dev, ret, "reserved memory init failed\n");
>   
> -	ret = kproc->ti_sci->ops.dev_ops.is_on(kproc->ti_sci, kproc->ti_sci_id,
> -					       NULL, &p_state);
> +	ret = ti_sci_dev_is_on(kproc->tsd, NULL, &p_state);
>   	if (ret)
>   		return dev_err_probe(dev, ret, "failed to get initial state, mode cannot be determined\n");
>   
> diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> index 3a11fd24eb52..ddf8cb9974ca 100644
> --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> @@ -18,6 +18,7 @@
>   
>   #include "omap_remoteproc.h"
>   #include "remoteproc_internal.h"
> +#include "ti_sci_dev.h"
>   #include "ti_sci_proc.h"
>   #include "ti_k3_common.h"
>   
> @@ -70,10 +71,6 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
>   		return dev_err_probe(dev, PTR_ERR(kproc->ti_sci),
>   				     "failed to get ti-sci handle\n");
>   
> -	ret = of_property_read_u32(dev->of_node, "ti,sci-dev-id", &kproc->ti_sci_id);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "missing 'ti,sci-dev-id' property\n");
> -
>   	kproc->reset = devm_reset_control_get_exclusive(dev, NULL);
>   	if (IS_ERR(kproc->reset))
>   		return dev_err_probe(dev, PTR_ERR(kproc->reset), "failed to get reset\n");
> @@ -83,6 +80,11 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
>   		return dev_err_probe(dev, PTR_ERR(kproc->tsp),
>   				     "failed to construct ti-sci proc control\n");
>   
> +	kproc->tsd = ti_sci_dev_of_get_tsd(dev, kproc->ti_sci);
> +	if (IS_ERR(kproc->tsd))
> +		return dev_err_probe(dev, PTR_ERR(kproc->tsd),
> +				     "failed to construct ti-sci dev control\n");
> +
>   	ret = ti_sci_proc_request(kproc->tsp);
>   	if (ret < 0)
>   		return dev_err_probe(dev, ret, "ti_sci_proc_request failed\n");
> @@ -98,8 +100,7 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
>   	if (ret)
>   		return dev_err_probe(dev, ret, "reserved memory init failed\n");
>   
> -	ret = kproc->ti_sci->ops.dev_ops.is_on(kproc->ti_sci, kproc->ti_sci_id,
> -					       &r_state, &p_state);
> +	ret = ti_sci_dev_is_on(kproc->tsd, &r_state, &p_state);
>   	if (ret)
>   		return dev_err_probe(dev, ret,
>   				     "failed to get initial state, mode cannot be determined\n");
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index b1d04d082e44..a387848ac400 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -25,6 +25,7 @@
>   
>   #include "omap_remoteproc.h"
>   #include "remoteproc_internal.h"
> +#include "ti_sci_dev.h"
>   #include "ti_sci_proc.h"
>   #include "ti_k3_common.h"
>   
> @@ -140,8 +141,7 @@ static int k3_r5_split_reset(struct k3_rproc *kproc)
>   		return ret;
>   	}
>   
> -	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
> -						    kproc->ti_sci_id);
> +	ret = ti_sci_dev_put_device(kproc->tsd);
>   	if (ret) {
>   		dev_err(kproc->dev, "module-reset assert failed, ret = %d\n",
>   			ret);
> @@ -156,8 +156,7 @@ static int k3_r5_split_release(struct k3_rproc *kproc)
>   {
>   	int ret;
>   
> -	ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
> -						    kproc->ti_sci_id);
> +	ret = ti_sci_dev_get_device(kproc->tsd);
>   	if (ret) {
>   		dev_err(kproc->dev, "module-reset deassert failed, ret = %d\n",
>   			ret);
> @@ -168,8 +167,7 @@ static int k3_r5_split_release(struct k3_rproc *kproc)
>   	if (ret) {
>   		dev_err(kproc->dev, "local-reset deassert failed, ret = %d\n",
>   			ret);
> -		if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
> -							  kproc->ti_sci_id))
> +		if (ti_sci_dev_put_device(kproc->tsd))
>   			dev_warn(kproc->dev, "module-reset assert back failed\n");
>   	}
>   
> @@ -196,8 +194,7 @@ static int k3_r5_lockstep_reset(struct k3_r5_cluster *cluster)
>   	/* disable PSC modules on all applicable cores */
>   	list_for_each_entry(core, &cluster->cores, elem) {
>   		kproc = core->kproc;
> -		ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
> -							    kproc->ti_sci_id);
> +		ret = ti_sci_dev_put_device(kproc->tsd);
>   		if (ret) {
>   			dev_err(core->dev, "module-reset assert failed, ret = %d\n",
>   				ret);
> @@ -210,8 +207,7 @@ static int k3_r5_lockstep_reset(struct k3_r5_cluster *cluster)
>   unroll_module_reset:
>   	list_for_each_entry_continue_reverse(core, &cluster->cores, elem) {
>   		kproc = core->kproc;
> -		if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
> -							  kproc->ti_sci_id))
> +		if (ti_sci_dev_put_device(kproc->tsd))
>   			dev_warn(core->dev, "module-reset assert back failed\n");
>   	}
>   	core = list_last_entry(&cluster->cores, struct k3_r5_core, elem);
> @@ -233,8 +229,7 @@ static int k3_r5_lockstep_release(struct k3_r5_cluster *cluster)
>   	/* enable PSC modules on all applicable cores */
>   	list_for_each_entry_reverse(core, &cluster->cores, elem) {
>   		kproc = core->kproc;
> -		ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
> -							    kproc->ti_sci_id);
> +		ret = ti_sci_dev_get_device(kproc->tsd);
>   		if (ret) {
>   			dev_err(core->dev, "module-reset deassert failed, ret = %d\n",
>   				ret);
> @@ -264,8 +259,7 @@ static int k3_r5_lockstep_release(struct k3_r5_cluster *cluster)
>   unroll_module_reset:
>   	list_for_each_entry_from(core, &cluster->cores, elem) {
>   		kproc = core->kproc;
> -		if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
> -							  kproc->ti_sci_id))
> +		if (ti_sci_dev_put_device(kproc->tsd))
>   			dev_warn(core->dev, "module-reset assert back failed\n");
>   	}
>   
> @@ -827,8 +821,7 @@ static int k3_r5_rproc_configure_mode(struct k3_rproc *kproc)
>   
>   	core0 = list_first_entry(&cluster->cores, struct k3_r5_core, elem);
>   
> -	ret = kproc->ti_sci->ops.dev_ops.is_on(kproc->ti_sci, kproc->ti_sci_id,
> -					       &r_state, &c_state);
> +	ret = ti_sci_dev_is_on(kproc->tsd, &r_state, &c_state);
>   	if (ret) {
>   		dev_err(cdev, "failed to get initial state, mode cannot be determined, ret = %d\n",
>   			ret);
> @@ -1023,7 +1016,6 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>   	struct device *dev = &pdev->dev;
>   	struct k3_rproc *kproc;
>   	struct k3_r5_core *core, *core1;
> -	struct device_node *np;
>   	struct device *cdev;
>   	const char *fw_name;
>   	struct rproc *rproc;
> @@ -1032,7 +1024,6 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>   	core1 = list_last_entry(&cluster->cores, struct k3_r5_core, elem);
>   	list_for_each_entry(core, &cluster->cores, elem) {
>   		cdev = core->dev;
> -		np = dev_of_node(cdev);
>   		ret = rproc_of_parse_firmware(cdev, 0, &fw_name);
>   		if (ret) {
>   			dev_err(dev, "failed to parse firmware-name property, ret = %d\n",
> @@ -1067,12 +1058,6 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>   			goto out;
>   		}
>   
> -		ret = of_property_read_u32(np, "ti,sci-dev-id", &kproc->ti_sci_id);
> -		if (ret) {
> -			dev_err(cdev, "missing 'ti,sci-dev-id' property\n");
> -			goto out;
> -		}
> -
>   		kproc->reset = devm_reset_control_get_exclusive(cdev, NULL);
>   		if (IS_ERR(kproc->reset)) {
>   			ret = dev_err_probe(cdev, PTR_ERR(kproc->reset),
> @@ -1087,6 +1072,13 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>   			goto out;
>   		}
>   
> +		kproc->tsd = ti_sci_dev_of_get_tsd(cdev, kproc->ti_sci);
> +		if (IS_ERR(kproc->tsd)) {
> +			ret = dev_err_probe(cdev, PTR_ERR(kproc->tsd),
> +					    "failed to construct ti-sci dev control\n");
> +			goto out;
> +		}
> +
>   		ret = k3_r5_core_of_get_internal_memories(to_platform_device(cdev), kproc);
>   		if (ret) {
>   			dev_err(cdev, "failed to get internal memories, ret = %d\n",
> diff --git a/drivers/remoteproc/ti_sci_dev.h b/drivers/remoteproc/ti_sci_dev.h
> new file mode 100644
> index 000000000000..897998a97d7f
> --- /dev/null
> +++ b/drivers/remoteproc/ti_sci_dev.h
> @@ -0,0 +1,82 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Texas Instruments TI-SCI Device Controller Helper Functions
> + *
> + * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
> + */
> +
> +#ifndef REMOTEPROC_TI_SCI_DEV_H
> +#define REMOTEPROC_TI_SCI_DEV_H
> +
> +#include <linux/soc/ti/ti_sci_protocol.h>
> +#include <linux/pm_runtime.h>


Unnecessary header.

> +
> +/**
> + * struct ti_sci_dev - structure representing a device control client
> + * @sci: cached TI-SCI protocol handle
> + * @ops: cached TI-SCI device ops
> + * @dev: cached client device pointer
> + * @dev_id: TI-SCI device id for the consumer remoteproc device
> + */
> +struct ti_sci_dev {
> +	const struct ti_sci_handle *sci;
> +	const struct ti_sci_dev_ops *ops;
> +	struct device *dev;
> +	u32 dev_id;
> +};
> +
> +static inline
> +struct ti_sci_dev *ti_sci_dev_of_get_tsd(struct device *dev,
> +					 const struct ti_sci_handle *sci)
> +{
> +	struct ti_sci_dev *tsd;
> +	int ret;
> +
> +	tsd = devm_kzalloc(dev, sizeof(*tsd), GFP_KERNEL);
> +	if (!tsd)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret = of_property_read_u32(dev_of_node(dev), "ti,sci-dev-id",
> +				   &tsd->dev_id);
> +	if (ret < 0)
> +		return ERR_PTR(ret);
> +
> +	tsd->dev = dev;
> +	tsd->sci = sci;
> +	tsd->ops = &sci->ops.dev_ops;
> +
> +	return tsd;
> +}
> +
> +static inline int ti_sci_dev_is_on(struct ti_sci_dev *tsd, bool *r_state,
> +				   bool *c_state)
> +{
> +	int ret;
> +
> +	ret = tsd->ops->is_on(tsd->sci, tsd->dev_id, r_state, c_state);
> +	if (ret)
> +		dev_err(tsd->dev, "ti-sci device is_on failed: %d\n", ret);


New line before return statement.

Thanks,
Beleswar

> +	return ret;
> +}
> +
> +static inline int ti_sci_dev_get_device(struct ti_sci_dev *tsd)
> +{
> +	int ret;
> +
> +	ret = tsd->ops->get_device(tsd->sci, tsd->dev_id);
> +	if (ret)
> +		dev_err(tsd->dev, "ti-sci device get failed: %d\n", ret);
> +	return ret;
> +}
> +
> +static inline int ti_sci_dev_put_device(struct ti_sci_dev *tsd)
> +{
> +	int ret;
> +
> +	ret = tsd->ops->put_device(tsd->sci, tsd->dev_id);
> +	if (ret)
> +		dev_err(tsd->dev, "ti-sci device put failed: %d\n", ret);
> +	return ret;
> +}
> +
> +#endif /* REMOTEPROC_TI_SCI_DEV_H */
